Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1E70E69B
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 22:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538681.838838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1YlJ-0002TI-S2; Tue, 23 May 2023 20:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538681.838838; Tue, 23 May 2023 20:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1YlJ-0002Qh-Ox; Tue, 23 May 2023 20:37:41 +0000
Received: by outflank-mailman (input) for mailman id 538681;
 Tue, 23 May 2023 20:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HP3A=BM=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1q1YlI-0002Qb-0b
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 20:37:40 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5780338-f9a9-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 22:37:35 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 97711320039A;
 Tue, 23 May 2023 16:37:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 23 May 2023 16:37:32 -0400
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BE89CB60086; Tue, 23 May 2023 16:37:29 -0400 (EDT)
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
X-Inumbo-ID: a5780338-f9a9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684874251; x=1684960651; bh=k+
	bwdQP9AGCGHKD++qZv5KMOabdeJ0JpVksfMHT8xqQ=; b=g60/YYiE2JmkqOBOUa
	XY1qnShfctdB+wEArZbQpSLhHcZyqwcCUMjwHTqw05t3g63Ymx7kfjiWEWM4ryH/
	QX67pkxSCtd9+iz3hQiaK0cIZH7EgJrbYd7L76Bu1iFroFmygo0oEt8DgU4AuX+Q
	y0S9gr8VYvoB6OZsxufVjAACGbFGmjYbMPQiyoj+JPlNRtjZpgp6rzYQWEvUa6C/
	W0XhB4M8rRm70IfJaO1VtTNVT6kpM4800mHA5rfCrrbwPN8hGvRNdZvCVkV9ZwwA
	lq+Wuuqd0xmxskSyzlPCTuRhiK+pmfFMKhqQVMTQxOdxleMO0P18kkIY5rpD+g3D
	AFZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684874251; x=1684960651; bh=k+bwdQP9AGCGH
	KD++qZv5KMOabdeJ0JpVksfMHT8xqQ=; b=JDyznUMubiXFh8oJaXvwlfxCJWNSa
	PnVs/XoD3hYJrb3FGcvkxKqbR7sWjQHwDk0eKf4k+BT8Z7a6wlYllN8yA20PcF67
	tYTUDjSPg04DOX5pYPGpYmFCC9tlQ9J8wme85X/WqSRyjynju0aR/z0fZEKk1btg
	nVdrIBtwvzImpuiE5xcpIQu0Or6pOI+inTFy34eCXWbhehA5hUoLQEkgGWIvaCJj
	UKyEnH5zn8Nm8VZ/B8aj3rduZZ7VFhvvKIVGZ03ldiXT6k+ubie3SxCcXFWPCZNj
	av+T6vdP6Vfd+hhThCeuoW+iPXSE9TtB3eB4tE2OZsYkXvQG5tExZncXQ==
X-ME-Sender: <xms:CSRtZHI6Noe76T50p519ldksbvrDV-0PxOGO9iPOxffGnHtUXwp2AA>
    <xme:CSRtZLJqp0-0DeNVg_ynRRmoq6vcljIYSjcx7iyNxPAW1wy4JbOoCdP6LIglITnrk
    YDZebmspOrq_J7txdE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejfedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:CSRtZPuxnAORlY84xEv5PojDG5wD_B_JKTeTU1zRZcFO3ICboxVbbg>
    <xmx:CSRtZAa25lND9tAT-uTOiNxVL95gmUsJvEKE_RDFWXbHLC3mfcuAhQ>
    <xmx:CSRtZOaokD6a31vcwJoFWzp1glAFv-iuBDh1XnCHBadw_OMjQIGAVg>
    <xmx:CyRtZABNekMVVlF679HRCKNrTPSclHjooVT8oAogJ0hS-OVXfsHFaA>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <418f75d5-5acb-4eba-96a5-5f9ec7f963a6@app.fastmail.com>
In-Reply-To: <35c82bbd-4c33-05da-1252-6eeec946ea22@oracle.com>
References: <20230519092905.3828633-1-arnd@kernel.org>
 <35c82bbd-4c33-05da-1252-6eeec946ea22@oracle.com>
Date: Tue, 23 May 2023 22:37:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Juergen Gross" <jgross@suse.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Stefano Stabellini" <sstabellini@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Peter Zijlstra" <peterz@infradead.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] x86: xen: add missing prototypes
Content-Type: text/plain

On Sat, May 20, 2023, at 00:24, Boris Ostrovsky wrote:
> On 5/19/23 5:28 AM, Arnd Bergmann wrote:
>
>> diff --git a/arch/x86/xen/smp.h b/arch/x86/xen/smp.h
>> index 22fb982ff971..81a7821dd07f 100644
>> --- a/arch/x86/xen/smp.h
>> +++ b/arch/x86/xen/smp.h
>> @@ -1,7 +1,11 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   #ifndef _XEN_SMP_H
>>   
>> +void asm_cpu_bringup_and_idle(void);
>> +asmlinkage void cpu_bringup_and_idle(void);
>
> These can go under CONFIG_SMP

Not sure if there is much point for the second one, since
it's only called from assembler, so the #else path is
never seen, but I can do that for consistency if you
like.

I generally prefer to avoid the extra #if checks
when there is no strict need for an empty stub.

I guess you also want me to add the empty stubs for the
other functions that only have a bit in #ifdef but not
#else then?

>> +void xen_force_evtchn_callback(void);
>
> These ...
>
>> +pteval_t xen_pte_val(pte_t pte);
>> +pgdval_t xen_pgd_val(pgd_t pgd);
>> +pte_t xen_make_pte(pteval_t pte);
>> +pgd_t xen_make_pgd(pgdval_t pgd);
>> +pmdval_t xen_pmd_val(pmd_t pmd);
>> +pmd_t xen_make_pmd(pmdval_t pmd);
>> +pudval_t xen_pud_val(pud_t pud);
>> +pud_t xen_make_pud(pudval_t pud);
>> +p4dval_t xen_p4d_val(p4d_t p4d);
>> +p4d_t xen_make_p4d(p4dval_t p4d);
>> +pte_t xen_make_pte_init(pteval_t pte);
>> +void xen_start_kernel(struct start_info *si);
>
>
> ... should go under '#ifdef CONFIG_XEN_PV'

What should the stubs do here? I guess just return the
unmodified value?

    Arnd

