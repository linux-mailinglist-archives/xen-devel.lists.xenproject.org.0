Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE031DB570
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 15:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbP2V-0004eI-Eh; Wed, 20 May 2020 13:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbP2U-0004eD-Ab
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 13:45:42 +0000
X-Inumbo-ID: 3200f858-9aa0-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3200f858-9aa0-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 13:45:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F38ACAC46;
 Wed, 20 May 2020 13:45:42 +0000 (UTC)
Subject: Re: [PATCH 3/3] xen/vm_event: Add safe to disable vm_event
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1589561218.git.tamas@tklengyel.com>
 <1168bacc61f655f559c236cdf63a6b2beccd4d6b.1589561218.git.tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28e50e15-410e-096d-51f1-e304c9ef8cdb@suse.com>
Date: Wed, 20 May 2020 15:45:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1168bacc61f655f559c236cdf63a6b2beccd4d6b.1589561218.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.05.2020 18:53, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -563,15 +563,41 @@ void hvm_do_resume(struct vcpu *v)
>          v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
>      }
>  
> -    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
> +    if ( unlikely(v->arch.vm_event) )
>      {
> -        struct x86_event info;
> +        struct domain *d = v->domain;

const

> +        if ( v->arch.monitor.next_interrupt_enabled )
> +        {
> +            struct x86_event info;
> +
> +            if ( hvm_get_pending_event(v, &info) )
> +            {
> +                hvm_monitor_interrupt(info.vector, info.type, info.error_code,
> +                                      info.cr2);
> +                v->arch.monitor.next_interrupt_enabled = false;
> +            }
> +        }
>  
> -        if ( hvm_get_pending_event(v, &info) )
> +        if ( d->arch.monitor.safe_to_disable )
>          {
> -            hvm_monitor_interrupt(info.vector, info.type, info.error_code,
> -                                  info.cr2);
> -            v->arch.monitor.next_interrupt_enabled = false;
> +            struct vcpu *check_vcpu;

const again, requiring a respective adjustment to patch 2.

> +            bool pending_op = false;
> +
> +            for_each_vcpu ( d, check_vcpu )
> +            {
> +                if ( vm_event_check_pending_op(check_vcpu) )
> +                {
> +                    pending_op = true;
> +                    break;
> +                }
> +            }
> +
> +            if ( !pending_op )
> +            {
> +                hvm_monitor_safe_to_disable();

This new function returns bool without the caller caring about the
return value.

Jan

