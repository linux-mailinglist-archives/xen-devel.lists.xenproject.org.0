Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E064B4B3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 13:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460620.718557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p540d-0002F9-CN; Tue, 13 Dec 2022 12:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460620.718557; Tue, 13 Dec 2022 12:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p540d-0002CW-96; Tue, 13 Dec 2022 12:03:43 +0000
Received: by outflank-mailman (input) for mailman id 460620;
 Tue, 13 Dec 2022 12:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLc3=4L=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1p540b-0002CQ-ND
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 12:03:41 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ebd50c5-7ade-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 13:03:40 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1p540X-0005XT-4Q; Tue, 13 Dec 2022 12:03:37 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1p540V-004mHf-9r; Tue, 13 Dec 2022 12:03:36 +0000
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
X-Inumbo-ID: 2ebd50c5-7ade-11ed-91b6-6bf2151ebd3b
Message-ID: <99a807bf-57c6-aeb6-9b95-efb7e4ee7e9e@cantab.net>
Date: Tue, 13 Dec 2022 12:03:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-4-dvrabel@amazon.co.uk>
 <641a5905-3a1a-e128-788d-e907297aa213@suse.com>
 <e0c05cb6-32be-bfea-9a4f-4567272042b4@cantab.net>
 <87eb39b5-ee6f-7324-0add-bd4755719a08@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <87eb39b5-ee6f-7324-0add-bd4755719a08@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: [PATCH 3/3] x86/pci: Fix racy accesses to MSI-X Control register
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 13/12/2022 11:50, Jan Beulich wrote:
> On 13.12.2022 12:34, David Vrabel wrote:
>> On 12/12/2022 17:04, Jan Beulich wrote:
>>> On 10.11.2022 17:59, David Vrabel wrote:
>>>>
>>>> --- a/xen/arch/x86/include/asm/msi.h
>>>> +++ b/xen/arch/x86/include/asm/msi.h
>>>> @@ -237,7 +237,10 @@ struct arch_msix {
>>>>        int table_refcnt[MAX_MSIX_TABLE_PAGES];
>>>>        int table_idx[MAX_MSIX_TABLE_PAGES];
>>>>        spinlock_t table_lock;
>>>> +    spinlock_t control_lock;
>>>>        bool host_maskall, guest_maskall;
>>>> +    uint16_t host_enable;
>>>
>>> If you want to keep this more narrow than "unsigned int", then please
>>> add a BUILD_BUG_ON() against NR_CPUS, so the need to update the field
>>> can be easily noticed (in some perhaps distant future).
>>
>> This is only incremented:
>>
>> - while holding the pci_devs lock, or
>> - while holding a lock for one of the associated IRQs.
> 
> How do the locks held matter here, especially given that - as iirc you say
> in the description - neither lock is held uniformly?

Because the usage here is:

    lock()
    host_enable++
    ...
    host_enable--
    unlock()

>> Since there are at most 4096 MSI-X vectors (and thus at most 4096 IRQs),
>> the highest value this can be (even with >> 4096 PCPUs) is 4097, thus a
>> uint16_t is fine.
> 
> Where's the 4096 coming from as a limit for MSI-X vectors? DYM 2048, which
> is the per-device limit (because the qsize field is 11 bits wide)? If so,
> yes, I think that's indeed restricting how large the number can get.

Yes, I did mean 2048 here.

> I could only think of less neat ones like host_enable_override or
> forced_enable or some such. If I had any good name in mind, I would > certainly have said so.

host_enable_override works for me.

David

