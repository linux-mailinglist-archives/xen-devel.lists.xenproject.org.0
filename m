Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189A330D12
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94834.178636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEde-0002Xd-9V; Mon, 08 Mar 2021 12:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94834.178636; Mon, 08 Mar 2021 12:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEde-0002XE-6I; Mon, 08 Mar 2021 12:05:30 +0000
Received: by outflank-mailman (input) for mailman id 94834;
 Mon, 08 Mar 2021 12:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJEdc-0002X7-EG
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:05:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5c93f49-c2ec-4ac6-8de6-dcf4a2b4991b;
 Mon, 08 Mar 2021 12:05:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8664AAC0C;
 Mon,  8 Mar 2021 12:05:26 +0000 (UTC)
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
X-Inumbo-ID: b5c93f49-c2ec-4ac6-8de6-dcf4a2b4991b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615205126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vRa9di/p1QmpzTcsrcH2OuL4P81hepuxWftRo4iB2kk=;
	b=BpJBQpr//bqYZVu+zqA3mbbsaz7QinqjpcKwszwuEzOg9cF4+0JHaA89IBzIVQYUUO/SIt
	tbWeYWRgvnOdHaTroFH5YkSPNWg6jZn/eDZ8iEv2eM4+e/OOpvNHU+HjOW6m5KbBl7Kn6b
	aDrW/J1yCwhW//BeSVyNtrVkJ2J97NE=
Subject: Re: [PATCH 2/2][4.15?] x86/shadow: encode full GFN in magic MMIO
 entries
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <ccf12da3-b3df-7be1-1898-992ec994b78f@suse.com>
 <YEXw7nM+glqc/Oz2@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a689279a-933a-ae0f-1182-5e322d02f2be@suse.com>
Date: Mon, 8 Mar 2021 13:05:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEXw7nM+glqc/Oz2@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 10:39, Tim Deegan wrote:
> At 16:37 +0100 on 05 Mar (1614962265), Jan Beulich wrote:
>> Since we don't need to encode all of the PTE flags, we have enough bits
>> in the shadow entry to store the full GFN. Don't use literal numbers -
>> instead derive the involved values. Or, where derivation would become
>> too ugly, sanity-check the result (invoking #error to identify failure).
>>
>> This then allows dropping from sh_l1e_mmio() again the guarding against
>> too large GFNs.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Tim Deegan <tim@xen.org>

Thanks.

>> I wonder if the respective check in sh_audit_l1_table() is actually
>> useful to retain with these changes.
> 
> Yes, I think so.  We care about these PTEs being bogus for any reason,
> not just the ones that this could address.
> 
>> -#define SH_L1E_MAGIC 0xffffffff00000001ULL
>> +#define SH_L1E_MAGIC_NR_META_BITS 4
>> +#define SH_L1E_MAGIC_MASK ((~0ULL << (PADDR_BITS - PAGE_SHIFT + \
>> +                                      SH_L1E_MAGIC_NR_META_BITS)) | \
>> +                           _PAGE_PRESENT)
> 
> I don't think this makes the code any more readable, TBH, but if you
> prefer it that's OK.  I'd be happier with it if you added a
> BUILD_BUG_ON that checks that 1ULL << (PADDR_BITS - 1) is set in the
> mask, since that's the main thing we care about.
> 
>> -#define SH_L1E_MMIO_MAGIC       0xffffffff00000001ULL
>> -#define SH_L1E_MMIO_MAGIC_MASK  0xffffffff00000009ULL
>> -#define SH_L1E_MMIO_GFN_MASK    0x00000000fffffff0ULL
>> +#define SH_L1E_MMIO_MAGIC       SH_L1E_MAGIC_MASK
>> +#define SH_L1E_MMIO_MAGIC_BIT   ((_PAGE_PRESENT | _PAGE_RW | _PAGE_USER) + 1)
> 
> IMO this would be more readable as a straight 0x8 (or even _PAGE_PWT).
> The ack stands either way.

For both of your remarks, I agree that readability suffers by doing
it this way, so I'll undo some of it since you'd prefer it to be
more readable. My goal wasn't so much readability though but ease
of changes down the road (no need to change multiple related
definitions) and documentation of why these values actually are the
way they are.

But let's first see anyway what further changes are needed in
response to Andrew's remarks.

Jan

