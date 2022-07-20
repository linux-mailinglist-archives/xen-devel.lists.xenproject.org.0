Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDCE57BDA6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372118.603924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEIm-00061X-IA; Wed, 20 Jul 2022 18:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372118.603924; Wed, 20 Jul 2022 18:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEIm-0005wg-E8; Wed, 20 Jul 2022 18:20:04 +0000
Received: by outflank-mailman (input) for mailman id 372118;
 Wed, 20 Jul 2022 18:20:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEIk-0005iQ-NB
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:20:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEIk-0006eP-A2; Wed, 20 Jul 2022 18:20:02 +0000
Received: from [54.239.6.185] (helo=[192.168.0.130])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEIk-0001aj-3m; Wed, 20 Jul 2022 18:20:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wX6Nsyee0y16F8ALHiab3Hdw62yglC7YJ6wiz8g1Us4=; b=38PucLFDTi+dt9BByNb3btzJlF
	CPzmPz7SICTWbbOkg0HuCY1hz99R16wxJOvZh2Mf5uGkHtB6X2YirUmJ1t96Kx2iIYQ2a7DBtR3b8
	2rR9RqSBVq3Dcyd/8D7SzvxwUVh1xjEIVVB3CYhN2wxUR8z66BnbXzQUlfJO56ybQkXg=;
Message-ID: <43793378-6539-1795-8262-189f7ff61d66@xen.org>
Date: Wed, 20 Jul 2022 19:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH V7 1/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <fea296b1-76e4-f8f1-77fc-274309b54a38@xen.org>
 <7960855a-5135-00d9-fff8-b571d7be03d1@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7960855a-5135-00d9-fff8-b571d7be03d1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 16/07/2022 16:29, Oleksandr Tyshchenko wrote:
>> On 16/07/2022 15:56, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Borrow the x86's check from p2m_remove_page() which was added
>>> by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
>>> "x86/p2m: don't assert that the passed in MFN matches for a remove"
>>> and adjust it to the Arm code base.
>>>
>>> Basically, this check will be strictly needed for the xenheap pages
>>> after applying a subsequent commit which will introduce xenheap based
>>> M2P approach on Arm. But, it will be a good opportunity to harden
>>> the P2M code for *every* RAM pages since it is possible to remove
>>> any GFN - MFN mapping currently on Arm (even with the wrong helpers).
>>>
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> You can find the corresponding discussion at:
>>> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/__;!!GF_29dbcQIUBPA!3a2u-XL4NvAzSMfz72LARrdWVFvq2In5ZpUdxP2cSt7bM8PgV7P_ZclZG2R-rE9PcosUHyqsKRNfVG2TiM9Tlg$
>>> [lore[.]kernel[.]org]
>>> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/1652294845-13980-2-git-send-email-olekstysh@gmail.com/__;!!GF_29dbcQIUBPA!3a2u-XL4NvAzSMfz72LARrdWVFvq2In5ZpUdxP2cSt7bM8PgV7P_ZclZG2R-rE9PcosUHyqsKRNfVG0kg7IZSA$
>>> [lore[.]kernel[.]org]
>>>
>>> Changes V6 -> V7:
>>>      - make this commit to be the first
>>>      - update commit description and add a comment in code
>>> ---
>>>    xen/arch/arm/p2m.c | 28 ++++++++++++++++++++++++++++
>>>    1 file changed, 28 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index d00c2e462a..2a0d383df4 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -1308,11 +1308,39 @@ static inline int p2m_remove_mapping(struct
>>> domain *d,
>>>                                         mfn_t mfn)
>>>    {
>>>        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    unsigned long i;
>>>        int rc;
>>>          p2m_write_lock(p2m);
>>> +    /*
>>> +     * Before removing the GFN - MFN mapping for any RAM pages make
>>> sure
>>> +     * that there is no difference between what is already mapped
>>> and what
>>> +     * is requested to be unmapped.
>>> +     * If they don't match bail out early. For instance, this could
>>> happen
>>> +     * if two CPUs are requesting to unmap the same P2M concurrently.
>>
>> Missing word: P2M *entry*
> 
> Yes. May I please ask, could this be done on the commit if this appears
> to be the last version?

I have committed the series with the same typo.

Cheers,

-- 
Julien Grall

