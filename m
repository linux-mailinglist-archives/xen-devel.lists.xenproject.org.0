Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CB23468E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:06:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UjU-0003Zg-EB; Fri, 31 Jul 2020 13:05:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1UjT-0003Za-Id
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:05:55 +0000
X-Inumbo-ID: 90e929c8-d32e-11ea-abaf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90e929c8-d32e-11ea-abaf-12813bfff9fa;
 Fri, 31 Jul 2020 13:05:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCC97B582;
 Fri, 31 Jul 2020 13:06:06 +0000 (UTC)
Subject: Re: [PATCH] x86/vmx: reorder code in vmx_deliver_posted_intr
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200730140309.59916-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <505b30dc-e504-918e-e676-70d856b76899@suse.com>
Date: Fri, 31 Jul 2020 15:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730140309.59916-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 16:03, Roger Pau Monne wrote:
> Remove the unneeded else branch, which allows to reduce the
> indentation of a larger block of code, while making the flow of the
> function more obvious.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One minor request (could likely be taken care of while
committing):

> @@ -2014,41 +2016,36 @@ static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
>           * VMEntry as it used to be.
>           */
>          pi_set_on(&v->arch.hvm.vmx.pi_desc);
> +        vcpu_kick(v);
> +        return;
>      }
> -    else
> -    {
> -        struct pi_desc old, new, prev;
>  
> -        prev.control = v->arch.hvm.vmx.pi_desc.control;
> +    prev.control = v->arch.hvm.vmx.pi_desc.control;
>  
> -        do {
> -            /*
> -             * Currently, we don't support urgent interrupt, all
> -             * interrupts are recognized as non-urgent interrupt,
> -             * Besides that, if 'ON' is already set, no need to
> -             * sent posted-interrupts notification event as well,
> -             * according to hardware behavior.
> -             */
> -            if ( pi_test_sn(&prev) || pi_test_on(&prev) )
> -            {
> -                vcpu_kick(v);
> -                return;
> -            }
> -
> -            old.control = v->arch.hvm.vmx.pi_desc.control &
> -                          ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
> -            new.control = v->arch.hvm.vmx.pi_desc.control |
> -                          (1 << POSTED_INTR_ON);
> +    do {
> +        /*
> +         * Currently, we don't support urgent interrupt, all
> +         * interrupts are recognized as non-urgent interrupt,
> +         * Besides that, if 'ON' is already set, no need to
> +         * sent posted-interrupts notification event as well,
> +         * according to hardware behavior.
> +         */

Would be nice to s/sent/send/ here as you move it (maybe also
remove the plural from "posted-interrupts") and - if possible -
re-flow for the now increased space on the right side.

Jan

