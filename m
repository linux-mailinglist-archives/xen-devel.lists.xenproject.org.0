Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8639A4D8D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 13:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822470.1236441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t285B-0001Pl-P4; Sat, 19 Oct 2024 11:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822470.1236441; Sat, 19 Oct 2024 11:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t285B-0001Mw-Ln; Sat, 19 Oct 2024 11:57:21 +0000
Received: by outflank-mailman (input) for mailman id 822470;
 Sat, 19 Oct 2024 11:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t285A-0001HY-CK
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 11:57:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 468020a4-8e11-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 13:57:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729339026460533.0095954572497;
 Sat, 19 Oct 2024 04:57:06 -0700 (PDT)
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
X-Inumbo-ID: 468020a4-8e11-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729339028; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K/aw+B5lvkHPt3m3sSwCcQLXl+r0v4OtbIQxVIVzXr3RknWXLiAs5LeTsxOUlJJERtbosDhqvudY3cfvYViLJBPeuQoFRwKNWmvTvBIG4TQOYgMchkyGGKZAl8vBeWIWhdyNY5h3QNhdV9IqOxryLfV0EorMes7O85t07IrQKwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729339028; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IUDqa87blw5l4UUTH6147BSi9tzzegZKadzKH1zev3M=; 
	b=WA/v3UHzbB4NXdxWibj+bulMUPMQWWXs7kvvDoG52KVtx5i4uHAJsuNyVqtCIIWoLvFiLs0/rdSEQ/nAUpLZQBTkklkfvX2I/iP/ZNKXfMbMejP75XqzR4dawPpx12E3EsfqJ0Yrgozl4+p+s2H7D25S0E77FYYEAPA5I5Li/io=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729339028;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IUDqa87blw5l4UUTH6147BSi9tzzegZKadzKH1zev3M=;
	b=e24XT2lJ7wjZUsl0Zj0aK8Ie1BwDSNEBY1+6bTrMjjQMqklSubKem4XEkDKygWME
	QwnQRhj06MR3imzixPP1oSsfiaebJVZ/jGPW1ltMCwyCeyD1YFBOAxLjCz90L8TzL/n
	vtBhqInDlpb8t+9s1ueeKG7fYVGaHl3ETDTGWfT0=
Message-ID: <bc7b51f4-e45f-42a9-90a4-878ecc76baf8@apertussolutions.com>
Date: Sat, 19 Oct 2024 07:57:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/44] x86/boot: update struct boot_module on module
 relocation
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-13-dpsmith@apertussolutions.com>
 <2133207a-88a0-4b92-a389-39259e649269@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2133207a-88a0-4b92-a389-39259e649269@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 19:15, Jason Andryuk wrote:
> On 2024-10-17 13:02, Daniel P. Smith wrote:
>> When a boot module is relocated, ensure struct boot_module start and size
>> fields are updated along with early_mod.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - corrected conversion function for a missed switch from mfn to 
>> maddr/paddr
>> ---
>>   xen/arch/x86/setup.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6ee352fc0cde..d51b0b03bc97 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1380,8 +1380,11 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>            * respective reserve_e820_ram() invocation below. No need to
>>            * query efi_boot_mem_unused() here, though.
>>            */
>> -        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
>> -        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
>> +        bi->mods[xen].start = virt_to_maddr(_stext);
>> +        bi->mods[xen].size = __2M_rwdata_end - _stext;
>> +
>> +        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
> 
> But now this line needs to be converted to an mfn?

Correct.

v/r,
dps

