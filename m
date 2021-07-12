Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A248F3C631E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 21:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154707.285814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m31Db-0007j5-LC; Mon, 12 Jul 2021 19:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154707.285814; Mon, 12 Jul 2021 19:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m31Db-0007gr-Hd; Mon, 12 Jul 2021 19:03:51 +0000
Received: by outflank-mailman (input) for mailman id 154707;
 Mon, 12 Jul 2021 19:03:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m31DZ-0007gl-Kq
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 19:03:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m31DY-0004Bu-L2; Mon, 12 Jul 2021 19:03:48 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m31DY-0004Ou-Ex; Mon, 12 Jul 2021 19:03:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=j3gC4tzSDNVgvNvhWGQQUwuoFkRhQ4Gqkovqcg7R4yU=; b=c0wSllF0C4glpwOQxePHaEkiXW
	ITiL7Ph2Hy2aAKth0CxKFGHxUwJeBzgJ7iTPiPt5GxUIi8lok8+1VIH2Zn6wtpLsOj2M7C1GjjOX4
	jbOkEkb/kCpmqbTV6wAdG8NrJrByai90JFZJsy/3D9o7rgwE6YVVtfIaRaom2ep3aQu0=;
Subject: Re: [RFC PATCH 2/4] xen/arm: Import ID features sanitize from linux
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <da0e48cde6c26d19fde468ad2860b807459a1042.1624974370.git.bertrand.marquis@arm.com>
 <d312b6aa-7bdd-5ce1-f28b-3227a9331c62@xen.org>
 <C505E8BE-9B75-4C19-A822-C65B5807EFAA@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <00b09f8c-96f1-3c97-6a72-6a864b69e038@xen.org>
Date: Mon, 12 Jul 2021 20:03:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <C505E8BE-9B75-4C19-A822-C65B5807EFAA@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 12/07/2021 11:50, Bertrand Marquis wrote:
>>> +#define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>>> +	{						\
>>> +		.sign = SIGNED,				\
>>> +		.visible = VISIBLE,			\
>>> +		.strict = STRICT,			\
>>> +		.type = TYPE,				\
>>> +		.shift = SHIFT,				\
>>> +		.width = WIDTH,				\
>>> +		.safe_val = SAFE_VAL,			\
>>> +	}
>>> +
>>> +/* Define a feature with unsigned values */
>>> +#define ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>>> +	__ARM64_FTR_BITS(FTR_UNSIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
>>> +
>>> +/* Define a feature with a signed value */
>>> +#define S_ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>>> +	__ARM64_FTR_BITS(FTR_SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
>>> +
>>> +#define ARM64_FTR_END					\
>>> +	{						\
>>> +		.width = 0,				\
>>> +	}
>>> +
>>> +static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
>>
>> This function is not defined in the code you import.
> 
> I imported the block I am interested in from Linux and I am filtering it in the
> Next patch where I remove those function prototypes.
I find it a bit confusing because most of the code imported makes sense 
except the two prototypes. At the same time...

> 
> This was to allow easier update of the code.

... I agree with this because if we need a resync of this patch, we may 
inadvertently re-introduce the prototype. So...

> 
> Should I filter directly when importing linux code then ?

... I will leave that up to you.

Cheers,

-- 
Julien Grall

