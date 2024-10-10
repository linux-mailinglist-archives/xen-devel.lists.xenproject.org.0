Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B6997A41
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815396.1229147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syiFC-0007kE-Nm; Thu, 10 Oct 2024 01:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815396.1229147; Thu, 10 Oct 2024 01:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syiFC-0007ij-L1; Thu, 10 Oct 2024 01:45:34 +0000
Received: by outflank-mailman (input) for mailman id 815396;
 Thu, 10 Oct 2024 01:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syiFB-0007id-5i
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:45:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 540998c3-86a9-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 03:45:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728524721560447.262372994103;
 Wed, 9 Oct 2024 18:45:21 -0700 (PDT)
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
X-Inumbo-ID: 540998c3-86a9-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728524723; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gO4//fjoGCFoNFCayZSF/Lv149ErSuHK9E/hrLzPSlSr0X6TOoXn1KfHyWdhainIVwDfdQxun0wQpptOLJOdyfSvHBBXTDlUtO2JAdFRtLhEnX7mczfhhJoGKc30JfCIae/BE+3zpvRa1J/7utiePTSF4bopjsoMKkHzJmqhELQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728524723; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kEY0/JxYBl9rMBwu2TjcMrKBBW8DfWr1jIIDxjRnGJM=; 
	b=HYC4zRMQsq1EdnnxzRgvROqx+P2MFIcnwENbeYdpVUakREilAavmT70dxkpZAIpWaXvW7+jKuN6B5MlS1Tdh2+K/FbCBm7yyTDackY+xHe2q55KQe1lPntaQMxj48gG0HeI1FeP1nMZyHD/l8Vs7s6S7nlE2/YVENy/7Pt7ramI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728524723;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kEY0/JxYBl9rMBwu2TjcMrKBBW8DfWr1jIIDxjRnGJM=;
	b=pPH+rQpmZrgpV7Jpt68l+qR38SLp4hcYni66mrrwR+hPVCTpsl+JZbJ8NX0OPCY+
	bp/SjZco5qVa8DvWQxIZNxWuPfZIOrofriy2IjDI1O3QFk7mPNi0HnaxfNHNa2726Cf
	4SH6iv1XMicHX9np2njKLkFB8bkkRAPKtBegUnfw=
Message-ID: <268606a9-4d78-4389-9f52-8aebc2f72573@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:45:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/44] x86/boot: introduce boot module interator
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-16-dpsmith@apertussolutions.com>
 <f4657c52-ac03-47cc-8182-91f210daad24@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f4657c52-ac03-47cc-8182-91f210daad24@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:53, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -54,8 +54,24 @@ struct boot_info {
>>       struct boot_module mods[MAX_NR_BOOTMODS + 1];
>>   };
>>   
>> -#endif /* __XEN_X86_BOOTINFO_H__ */
>> +static inline int __init next_boot_module_index(
>> +    const struct boot_info *bi, enum bootmod_type t, int offset)
> 
> Instead of "offset" maybe better "start" or "from"? Further, plain int
> (as also used ...

Will change to start.

>> +{
>> +    int i;
> 
> ... here) isn't really liked for ...
> 
>> +    for ( i = offset; i < bi->nr_modules; i++ )
>> +    {
>> +        if ( bi->mods[i].type == t )
> 
> ... array indexing. Perhaps the function itself would better have
> unsigned int return type as well, ...
> 
>> +            return i;
>> +    }
>> +
>> +    return -1;
> 
> ... using UINT_MAX or some other suitable constant here instead?

I was initially going to disagree as returning a value less than zero is 
much more natural/reasonable than UINIT_MAX. But then thinking about it,
another natural value to reflect an error/not found is a value larger 
than MAX_NR_BOOTMODS.

Will switch to unsigned and add code comment that larger than 
MAX_NR_BOOTMODS is error/not found condition.

v/r,
dps

