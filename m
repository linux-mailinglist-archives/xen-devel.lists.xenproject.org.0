Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B52511D0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 07:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kARwj-00039d-BZ; Tue, 25 Aug 2020 05:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kARwh-00039Y-RM
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 05:56:35 +0000
X-Inumbo-ID: 235ca632-ffa0-4bcf-b27a-cbdd2f95734d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 235ca632-ffa0-4bcf-b27a-cbdd2f95734d;
 Tue, 25 Aug 2020 05:56:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA5A6B17A;
 Tue, 25 Aug 2020 05:57:04 +0000 (UTC)
Subject: Re: [PATCH 2/5] x86/vlapic: introduce an EOI callback mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fde5b2ce-3191-65f2-89fa-df9dcf856820@suse.com>
Date: Tue, 25 Aug 2020 07:56:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812124709.4165-3-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.08.2020 14:47, Roger Pau Monne wrote:
> Add a new vlapic_set_irq_callback helper in order to inject a vector
> and set a callback to be executed when the guest performs the end of
> interrupt acknowledgment.

One thing I don't understand at all for now is how these
callbacks are going to be re-instated after migration for
not-yet-EOIed interrupts.

> @@ -1636,9 +1671,23 @@ int vlapic_init(struct vcpu *v)
>      }
>      clear_page(vlapic->regs);
>  
> +    if ( !vlapic->callbacks )
> +    {
> +        vlapic->callbacks = xmalloc_array(typeof(*(vlapic->callbacks)),

There's a pair of not really needed parentheses here (also
again a little further down).

> +                                          X86_NR_VECTORS);
> +        if ( !vlapic->callbacks )
> +        {
> +            dprintk(XENLOG_ERR, "alloc vlapic callbacks error: %d/%d\n",
> +                    v->domain->domain_id, v->vcpu_id);

Please use %pd.

Jan

