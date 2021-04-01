Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289023510CE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104145.198837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRscI-0003i0-PL; Thu, 01 Apr 2021 08:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104145.198837; Thu, 01 Apr 2021 08:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRscI-0003hb-MC; Thu, 01 Apr 2021 08:23:50 +0000
Received: by outflank-mailman (input) for mailman id 104145;
 Thu, 01 Apr 2021 08:23:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRscH-0003hU-Fq
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:23:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d2afe57-061e-45bc-99f1-8c13340dbd1d;
 Thu, 01 Apr 2021 08:23:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E4B3AE8D;
 Thu,  1 Apr 2021 08:23:47 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2d2afe57-061e-45bc-99f1-8c13340dbd1d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617265427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfHY6YVcp6pTaCljzpBFGILhRmitcEpxa1sbLFaLekA=;
	b=j5LO0Ho9gjBvocpKFIcMSyDpES8J39upuUXfH134CVFIV1ZCpD9KUmNtbmFRVelnUC+gjX
	LmcGSVx9Qo/9K8e1cL4KPXCv1Nqk1B7cv9jV7DrLuxNcTMWamrCO7UN5iKmg6060pI5q6o
	3TKzoI2myTrPXSlf7qQKV1dQYMnCjLQ=
Subject: Ping: [PATCH v2] x86: refine guest_mode()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <369ec8ad-7d07-9c50-7458-fd68a2d717fb@suse.com>
Message-ID: <9ea89aba-5c2c-0795-9704-0afd5b31349d@suse.com>
Date: Thu, 1 Apr 2021 10:23:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <369ec8ad-7d07-9c50-7458-fd68a2d717fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.05.2020 18:23, Jan Beulich wrote:
> The 2nd of the assertions as well as the macro's return value have been
> assuming we're on the primary stack. While for most IST exceptions we
> switch back to the main one when user mode was interrupted, for #DF we
> intentionally never do, and hence a #DF actually triggering on a user
> mode insn (which then is still a Xen bug) would in turn trigger this
> assertion, rather than cleanly logging state.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

In a prior discussion, as so often, my most recent reply remained
unanswered. Quoting it partially (fully reply at [1]):

"> I'd certainly prefer to go for something which is more robust, even if
 > it is a larger change.
 
 ... what's your suggestion? Basing on _just_ CS.RPL obviously won't
 work. Not even if we put in place the guest's CS (albeit that
 somewhat depends on the meaning we assign to the macro's returned
 value). Using current inside the macro to determine whether the
 guest is HVM would also seem fragile to me - there are quite a few
 uses of guest_mode(). Which would leave passing in a const struct
 vcpu * (or domain *), requiring to touch all call sites, including
 Arm's.

 Compared to this it would seem to me that the change as presented
 is a clear improvement without becoming overly large of a change."

Lacking a clear route to take to address your request for further
change, based on the last sentence I intend to finally commit this
one (in its re-based form) as well once the tree is fully open
again. Of course, as always, unless I hear otherwise by then
(including a clear path forward). I definitely don't want to
celebrate the 1st anniversary of this patch's submission without it
having got committed.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2020-04/msg01550.html

> ---
> v2: Correct description.
> ---
> While we could go further and also assert we're on the correct IST
> stack in an "else" ti the "if()" added, I'm not fully convinced this
> would be generally helpful. I'll be happy to adjust accordingly if
> others think differently; at such a point though I think this should
> then no longer be a macro.
> 
> --- unstable.orig/xen/include/asm-x86/regs.h	2020-01-22 20:03:18.000000000 +0100
> +++ unstable/xen/include/asm-x86/regs.h	2020-04-27 10:02:40.009916762 +0200
> @@ -10,9 +10,10 @@
>      /* Frame pointer must point into current CPU stack. */                    \
>      ASSERT(diff < STACK_SIZE);                                                \
>      /* If not a guest frame, it must be a hypervisor frame. */                \
> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
>      /* Return TRUE if it's a guest frame. */                                  \
> -    (diff == 0);                                                              \
> +    !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
>  })
>  
>  #endif /* __X86_REGS_H__ */
> 


