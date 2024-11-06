Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033A9BF098
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831149.1246318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hI4-0006x9-HP; Wed, 06 Nov 2024 14:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831149.1246318; Wed, 06 Nov 2024 14:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hI4-0006um-EH; Wed, 06 Nov 2024 14:45:48 +0000
Received: by outflank-mailman (input) for mailman id 831149;
 Wed, 06 Nov 2024 14:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8hI2-0006ug-Sb
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:45:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb673515-9c4d-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 15:45:42 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730904334665738.1396343508083;
 Wed, 6 Nov 2024 06:45:34 -0800 (PST)
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
X-Inumbo-ID: cb673515-9c4d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNiNjczNTE1LTljNGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA0MzQzLjAyMjUyNSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730904337; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jjAryP8RCLD75W8XZuG/nsK58jWXFd5YVYoqRFBsegDl7xn7f08B/7IqWkdnuU9OCPyR2s1lNE2e/FSCyslmHpQlIQzX3q1k5KjP8VjC+fzRvtr2k+UEhXeSULaX1NWnBAQn4bRgSKW/FHv+zlFZJR+RWNU7aJR8ezmJ3sLKK0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730904337; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/YLcxsoOOu39VuRd5DmMwgFPCASmAmv3+ERaiS3X7MQ=; 
	b=TyrgM4tfmFrTNMZPvB+U+n3B6Y8i/CqPw93kAwB8JZhKuWO7xcgag1685p06hQ3sdQ+TYAN0LQnTkG/+YA3jRl3EUtn1foCrmou/5pfHWj22FhQ5h0AxZGdGOqICIxEc03NPACIHCLBwdIOwgqGdGNGhylOdNNKzo7oqbk/8Hus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730904337;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/YLcxsoOOu39VuRd5DmMwgFPCASmAmv3+ERaiS3X7MQ=;
	b=WAY6dJ5t2CYQKilAY6gBNM1NBY/4sWQGjV0eynL7yfNo20cjeKtlOwxc4gp+iCHj
	+S/PL4Z+mnDK7nk6emBKiEb7JfhJVILLxG+J6rMkiJi8Pq+NWZHrRnBIWUbtjrjhutQ
	QTP3qToSqL1cG9eqhHu0NmsJMimx/dIr5HuBXDtI=
Message-ID: <3102f7a9-de50-4b09-b4ea-48f0887f3a31@apertussolutions.com>
Date: Wed, 6 Nov 2024 09:45:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] x86/boot: introduce boot module types
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-2-dpsmith@apertussolutions.com>
 <9dcc4580-bb3e-4722-a623-0776a91c1764@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9dcc4580-bb3e-4722-a623-0776a91c1764@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 09:05, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> This commit introduces module types for the types of boot modules that may be
>> passed to Xen. These include xen, kernel, ramdisk, microcode, and xsm policy.
>> This reduces the need for hard coded order assumptions and global variables to
>> be used by consumers of boot modules, such as domain construction.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, albeit it with
> one extra suggestion.

Sure.

>> ---
>> Changes since v7:
>> - merged the addition of microcode and xsm boot mod types
>>
>> Changes since v5:
>> - added guard around initrd type assignment
>> - removed a missed rebase artifact
>> ---
>>   xen/arch/x86/cpu/microcode/core.c   |  1 +
>>   xen/arch/x86/include/asm/bootinfo.h | 12 ++++++++++++
>>   xen/arch/x86/setup.c                |  4 ++++
>>   xen/xsm/xsm_policy.c                |  1 +
>>   4 files changed, 18 insertions(+)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index 1fa6cbf3d364..f46464241557 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
> 
> @@ -831,6 +831,10 @@ static int __init early_microcode_load(struct
> boot_info *bi)
>                   continue;
>               }
>   
> +            /*
> +             * Do not alter this boot module's type.  We're most likely
> +             * peeking at dom0's initrd.
> +             */
>               data = cd.data;
>               size = cd.size;
>               goto found;
> 
> 
> To make it absolutely crystal clear that ...
> 

Absolutely, as it might not be clear to a future editor of the code.

>> @@ -845,6 +845,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>>               printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
>>               return -ENODEV;
>>           }
>> +        bi->mods[idx].type = BOOTMOD_MICROCODE;
> 
> ... this is deliberately not done on the scan path.

v/r,
dps


