Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8F88C88C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 17:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698141.1089545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9Jj-0007Ox-0b; Tue, 26 Mar 2024 16:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698141.1089545; Tue, 26 Mar 2024 16:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9Ji-0007MZ-Tn; Tue, 26 Mar 2024 16:06:26 +0000
Received: by outflank-mailman (input) for mailman id 698141;
 Tue, 26 Mar 2024 16:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PUu=LA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rp9Jh-0007MT-53
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 16:06:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb153ec7-eb8a-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 17:06:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B8EAA4EE0739;
 Tue, 26 Mar 2024 17:06:23 +0100 (CET)
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
X-Inumbo-ID: cb153ec7-eb8a-11ee-afe3-a90da7624cb6
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 17:06:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 09/11] x86/msi: address violation of MISRA C Rule 20.7
 and coding style
In-Reply-To: <dc1e49a5e5528cb4d2cc4718dc0807bb@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <c924aa0d5b3b6adbb24cc638f739173cbc41862c.1711118582.git.nicola.vetrini@bugseng.com>
 <f2d393e9-6b70-4998-9d85-e070d6bba556@suse.com>
 <e323ec0362a6b4b1811f2119a33b08f4@bugseng.com>
 <465034fd-d2bc-4fe1-8c04-bdb1d60bfafc@suse.com>
 <dc1e49a5e5528cb4d2cc4718dc0807bb@bugseng.com>
Message-ID: <70cc48ca512aec508c87eebe2bea2ebb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>>>> +#define msi_disable(control) (control) &= ~PCI_MSI_FLAGS_ENABLE
>>>> 
>>>> Doesn't this need an outer pair of parentheses, too?
>>>> 
>>> 
>>> Not necessarily.
>> 
>> And use of msi_disable() in another expression would then likely not 
>> do
>> what's expected?
>> 
> 
> Actually I just noticed that some of these macros are never used 
> (msi_disable being one of them), as far as I can tell.
> 

I see why. The bodies of the macros are open-coded in multiple places in 
msi.c. I can't really tell whether that's intentional or not, but this 
is an opportunity to do a more general cleanup I guess, beyond the scope 
of this patch.

>>> I'm in favour of a consistent style to be converted in.
>>> This also applies below.
>> 
>> I'm all for consistency; I just don't know what you want to be 
>> consistent
>> with, here.
>> 
> 
> I would propose adding parentheses around assignments to control, so 
> that all macros are consistently parenthesized.
> 
>>>>>  #define multi_msi_capable(control) \
>>>>> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
>>>>> +    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
>>>>>  #define multi_msi_enable(control, num) \
>>>>> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>>>>> -#define is_64bit_address(control)	(!!(control & 
>>>>> PCI_MSI_FLAGS_64BIT))
>>>>> -#define is_mask_bit_support(control)	(!!(control &
>>>>> PCI_MSI_FLAGS_MASKBIT))
>>>>> +    (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>>>> 
>>>> And this, together with dropping the bogus semicolon?
>>>> 
>>> 
>>> I'll drop the semicolon.
>>> 
>>>> There also look to be cases where MASK_EXTR() / MASK_INSR() would 
>>>> want
>>>> using,
>>>> in favor of using open-coded numbers.
>>> 
>>> Yes, perhaps. However, the risk that I make some mistakes in doing so
>>> are quite high, though.
>> 
>> Right, hence how I started my earlier reply. Question is - do we want 
>> to
>> go just half the way here, or would we better tidy things all in one 
>> go?
>> In the latter case I could see about getting to that (whether to take
>> your patch as basis or instead do it from scratch isn't quite clear to
>> me at this point).
>> 
>> Jan
> 
> How about I revise this patch with parentheses added where needed, as 
> suggested earlier, and then you can submit a further cleanup patch to 
> remove e.g. the open coding?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

