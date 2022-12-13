Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7AD64B444
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460540.718469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53YB-0002EB-R4; Tue, 13 Dec 2022 11:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460540.718469; Tue, 13 Dec 2022 11:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53YB-0002CN-Nk; Tue, 13 Dec 2022 11:34:19 +0000
Received: by outflank-mailman (input) for mailman id 460540;
 Tue, 13 Dec 2022 11:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLc3=4L=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1p53Y9-0002CH-Dw
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:34:17 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 130c5e53-7ada-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:34:16 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1p53Y1-0005Vx-VX; Tue, 13 Dec 2022 11:34:10 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1p53Xs-004m5V-Fb; Tue, 13 Dec 2022 11:34:09 +0000
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
X-Inumbo-ID: 130c5e53-7ada-11ed-91b6-6bf2151ebd3b
Message-ID: <e0c05cb6-32be-bfea-9a4f-4567272042b4@cantab.net>
Date: Tue, 13 Dec 2022 11:34:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-4-dvrabel@amazon.co.uk>
 <641a5905-3a1a-e128-788d-e907297aa213@suse.com>
Content-Language: en-GB
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <641a5905-3a1a-e128-788d-e907297aa213@suse.com>
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
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 12/12/2022 17:04, Jan Beulich wrote:
> On 10.11.2022 17:59, David Vrabel wrote:
>> 
>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -237,7 +237,10 @@ struct arch_msix {
>>       int table_refcnt[MAX_MSIX_TABLE_PAGES];
>>       int table_idx[MAX_MSIX_TABLE_PAGES];
>>       spinlock_t table_lock;
>> +    spinlock_t control_lock;
>>       bool host_maskall, guest_maskall;
>> +    uint16_t host_enable;
> 
> If you want to keep this more narrow than "unsigned int", then please
> add a BUILD_BUG_ON() against NR_CPUS, so the need to update the field
> can be easily noticed (in some perhaps distant future).

This is only incremented:

- while holding the pci_devs lock, or
- while holding a lock for one of the associated IRQs.

Since there are at most 4096 MSI-X vectors (and thus at most 4096 IRQs), 
the highest value this can be (even with >> 4096 PCPUs) is 4097, thus a 
uint16_t is fine.

>> +static void msix_update_unlock(struct pci_dev *dev, unsigned int pos, uint16_t control)
>> +{
>> +    uint16_t new_control;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&dev->msix->control_lock, flags);
>> +
>> +    dev->msix->host_enable--;
>> +
>> +    new_control = control & ~(PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
>> +
>> +    if ( dev->msix->host_enable || dev->msix->guest_enable )
>> +        new_control |= PCI_MSIX_FLAGS_ENABLE;
>> +    if ( dev->msix->host_maskall || dev->msix->guest_maskall || dev->msix->host_enable )
>> +        new_control |= PCI_MSIX_FLAGS_MASKALL;
> 
> In particular this use of "host_enable" suggests the field wants to be
> named differently: It makes no sense to derive MASKALL from ENABLE
> without it being clear (from the name) that the field is an init-time
> override only.

I think the name as-is makes sense. It is analogous to the host_maskall 
and complements guest_enable. I can't think of a better name, so what 
name do you suggest.

David

