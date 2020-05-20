Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC451DB52D
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 15:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbOtj-0003fP-83; Wed, 20 May 2020 13:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbOth-0003fK-Rb
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 13:36:37 +0000
X-Inumbo-ID: ecf8baa8-9a9e-11ea-aa14-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecf8baa8-9a9e-11ea-aa14-12813bfff9fa;
 Wed, 20 May 2020 13:36:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 967E4B249;
 Wed, 20 May 2020 13:36:37 +0000 (UTC)
Subject: Re: [PATCH 1/3] xen/monitor: Control register values
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1589561218.git.tamas@tklengyel.com>
 <72d4d282dd20b79ebdbaf1f70865ea38b075c5c0.1589561218.git.tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec19beb2-6e69-4e62-b260-0d76b2a7f5a7@suse.com>
Date: Wed, 20 May 2020 15:36:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <72d4d282dd20b79ebdbaf1f70865ea38b075c5c0.1589561218.git.tamas@tklengyel.com>
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
> Extend the monitor_op domctl to include option that enables
> controlling what values certain registers are permitted to hold
> by a monitor subscriber.

This needs a bit more explanation, especially for those of us
who aren't that introspection savvy. For example, from the text
here I didn't expect a simple bool control, but something where
actual (register) values get passed back and forth.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2263,9 +2263,10 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>      {
>          ASSERT(v->arch.vm_event);
>  
> -        if ( hvm_monitor_crX(CR0, value, old_value) )
> +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> +             v->domain->arch.monitor.control_register_values )
>          {
> -            /* The actual write will occur in hvm_do_resume(), if permitted. */
> +            /* The actual write will occur in hvm_do_resume, if permitted. */

Please can you leave alone this and the similar comments below.
And for consistency _add_ parentheses to the one new instance
you add?

> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
>                                struct xen_domctl_monitor_op *mop)
>  {
>      struct arch_domain *ad = &d->arch;
> -    bool requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
> +    bool requested_status;
> +
> +    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS == mop->op )
> +    {
> +        ad->monitor.control_register_values = true;

And there's no way to clear this flag again?

Jan

