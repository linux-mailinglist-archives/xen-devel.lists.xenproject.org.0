Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F523BA9DA
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149581.276676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjVY-00068V-Cj; Sat, 03 Jul 2021 17:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149581.276676; Sat, 03 Jul 2021 17:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjVY-00066g-8l; Sat, 03 Jul 2021 17:32:48 +0000
Received: by outflank-mailman (input) for mailman id 149581;
 Sat, 03 Jul 2021 17:32:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjVX-00066a-CU
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:32:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjVV-00084K-K9; Sat, 03 Jul 2021 17:32:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjVV-0007Gb-Dx; Sat, 03 Jul 2021 17:32:45 +0000
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
	bh=3Tza1UvXeufzHbNeU33KlJq7y0V7wQ/yltCLXkHqNMw=; b=zjHKeanavASjFJ6MALVKr2cEwn
	rXrcD9cn6UiDzTNkCQgBksG8jpDVAtcUV62yxOCOz3HjreoFf80Yo58Tx+9s5Bk9zmLlp65gZULuh
	hjbgHLcv0h4ZzW2GdFV07KjqtlpE7Bd9fk6anKajX/WYSc+9ECx2DC/1QdBLQmE/GzBE=;
Subject: Re: [PATCH RFCv2 02/15] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-3-julien@xen.org>
 <alpine.DEB.2.21.2105111515470.5018@sstabellini-ThinkPad-T480s>
 <94e364a7-de40-93ab-6cde-a2f493540439@xen.org>
 <alpine.DEB.2.21.2105121425500.5018@sstabellini-ThinkPad-T480s>
 <e834b447-46c2-14fe-a39c-209d4d6ca5fe@xen.org>
 <alpine.DEB.2.21.2105131533070.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9397d94d-5a22-c026-7c66-400b7397c2fa@xen.org>
Date: Sat, 3 Jul 2021 18:32:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105131533070.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

Sorry for the late answer.

On 13/05/2021 23:44, Stefano Stabellini wrote:
> On Wed, 12 May 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 12/05/2021 22:30, Stefano Stabellini wrote:
>>> On Wed, 12 May 2021, Julien Grall wrote:
>>>>>> +#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
>>>>>> +#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
>>>>>> +#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
>>>>>>
>>>>>> +#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
>>>>>> +#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
>>>>>> +#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
>>>>>> +#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
>>>>>
>>>>> I would avoid adding these 4 macros. It would be OK if they were just
>>>>> used within this file but lpae.h is a header: they could end up be used
>>>>> anywhere in the xen/ code and they have a very generic name. My
>>>>> suggestion would be to skip them and just do:
>>>>
>>>> Those macros will be used in follow-up patches. They are pretty useful to
>>>> avoid introduce static array with the different information for each
>>>> level.
>>>>
>>>> Would prefix them with XEN_ be better?
>>>
>>> Maybe. The concern I have is that there are multiple page granularities
>>> (4kb, 16kb, etc) and multiple page sizes (4kb, 2mb, etc). If I just see
>>> LEVEL_ORDER it is not immediately obvious what granularity and what size
>>> we are talking about.
>>
>> I am a bit puzzled with your answer. AFAIU, you are happy with the existing
>> macros (THIRD_*, SECOND_*) but not with the new macros.
>>
>> In reality, there is no difference because THIRD_* doesn't tell you the exact
>> size but only "this is a level 3 mapping".
>>
>> So can you clarify what you are after? IOW is it reworking the current naming
>> scheme?
> 
> You are right -- there is no real difference between THIRD_*, SECOND_*
> and LEVEL_*.
> 
> The original reason for my comments is that I hadn't read the following
> patches, and the definition of LEVEL_* macros is simple, they could be
> open coded. It looked like they were only going to be used to make the
> definition of THIRD_*, SECOND_* a bit easier. So, at first, I was
> wondering if they were needed at all.
> 
> Secondly, I realized that they were going to be used in *.c files by
> other patches. That's why they are there. But I started thinking whether
> we should find a way to make it a bit clearer that they are for Xen
> pages, currently at 4KB granularity. THIRD_*, SECOND_*, etc. are already
> generic names which don't convey the granularity or whether they are Xen
> pages at all. But LEVEL_* seem even more generic.
> 
> As I mentioned, I don't have any good suggestions for changes to make
> here, so unless you can come up with a good idea let's keep it as is.

I am thinking to use the following naming (diff on top of this patch):

-#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
-#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
-#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
+#define XEN_PT_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
+#define XEN_PT_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
+#define XEN_PT_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)

-#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
-#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
-#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
-#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
+#define XEN_PT_LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
+#define XEN_PT_LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
+#define XEN_PT_LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
+#define XEN_PT_LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))

  /* Convenience aliases */
-#define THIRD_SHIFT         LEVEL_SHIFT(3)
-#define THIRD_ORDER         LEVEL_ORDER(3)
-#define THIRD_SIZE          LEVEL_SIZE(3)
-#define THIRD_MASK          LEVEL_MASK(3)
-
-#define SECOND_SHIFT        LEVEL_SHIFT(2)
-#define SECOND_ORDER        LEVEL_ORDER(2)
-#define SECOND_SIZE         LEVEL_SIZE(2)
-#define SECOND_MASK         LEVEL_MASK(2)
-
-#define FIRST_SHIFT         LEVEL_SHIFT(1)
-#define FIRST_ORDER         LEVEL_ORDER(1)
-#define FIRST_SIZE          LEVEL_SIZE(1)
-#define FIRST_MASK          LEVEL_MASK(1)
-
-#define ZEROETH_SHIFT       LEVEL_SHIFT(0)
-#define ZEROETH_ORDER       LEVEL_ORDER(0)
-#define ZEROETH_SIZE        LEVEL_SIZE(0)
-#define ZEROETH_MASK        LEVEL_MASK(0)
+#define THIRD_SHIFT         XEN_PT_LEVEL_SHIFT(3)
+#define THIRD_ORDER         XEN_PT_LEVEL_ORDER(3)
+#define THIRD_SIZE          XEN_PT_LEVEL_SIZE(3)
+#define THIRD_MASK          XEN_PT_LEVEL_MASK(3)
+
+#define SECOND_SHIFT        XEN_PT_LEVEL_SHIFT(2)
+#define SECOND_ORDER        XEN_PT_LEVEL_ORDER(2)
+#define SECOND_SIZE         XEN_PT_LEVEL_SIZE(2)
+#define SECOND_MASK         XEN_PT_LEVEL_MASK(2)
+
+#define FIRST_SHIFT         XEN_PT_LEVEL_SHIFT(1)
+#define FIRST_ORDER         XEN_PT_LEVEL_ORDER(1)
+#define FIRST_SIZE          XEN_PT_LEVEL_SIZE(1)
+#define FIRST_MASK          XEN_PT_LEVEL_MASK(1)
+
+#define ZEROETH_SHIFT       XEN_PT_LEVEL_SHIFT(0)
+#define ZEROETH_ORDER       XEN_PT_LEVEL_ORDER(0)
+#define ZEROETH_SIZE        XEN_PT_LEVEL_SIZE(0)
+#define ZEROETH_MASK        XEN_PT_LEVEL_MASK(0)

I don't plan to modify the nameing for ZEROETH*, FIRST*, SECOND*, THIRD*.

Let me know if you prefer it over the currrent naming.

Cheers,

-- 
Julien Grall

