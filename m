Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E929979AC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815295.1229007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syh8h-000670-0y; Thu, 10 Oct 2024 00:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815295.1229007; Thu, 10 Oct 2024 00:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syh8g-00064X-T6; Thu, 10 Oct 2024 00:34:46 +0000
Received: by outflank-mailman (input) for mailman id 815295;
 Thu, 10 Oct 2024 00:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syh8f-00064R-J6
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:34:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 704bf700-869f-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 02:34:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172852047687529.167888911115483;
 Wed, 9 Oct 2024 17:34:36 -0700 (PDT)
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
X-Inumbo-ID: 704bf700-869f-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728520478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LW9PE7SW2HpylCqSfGAH6M2kAAfXSU1pHkXgx08Qk8v17Ie8DzZHkUoS4GwqRTdX3hG5LP/uhjDYUUxIO/O95Knx+FpRNsKwV8vRbm56VePcij5N5oIuaXVPcOC85vy8w4YLvKATcMHaEWyuCONNGMtbMT1Q9qaPd4/HoVNrAFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728520478; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3hotaApiG9nEtD5X/rHFSRzsivuL7l4e6M0/lJhnYqc=; 
	b=LOHmYf0lr1Xlp4APK5VZXMQiwH+KBXUlcX7TtP5ArsPJkmeSeRDLZybT+dm3GK5OSyvZ9Wp6ENfR3rAa8BrEJkojxxRN08BQWFUCsshM/vyFZcbyGfRDyrRKMJCey2cePBoha+2RuotNKh3G0f0xdkush+eF4NsFT/k6FHrAk6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728520478;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3hotaApiG9nEtD5X/rHFSRzsivuL7l4e6M0/lJhnYqc=;
	b=Ju0vntgg3U6oE0HhyzcUsC3/LxwQ33KNQRPBvrcjbk7hxg4yADZQGQvhKRUofdBS
	YKDDkvPK6a3celSB2V1PjbDMrOb/frjluS2diTfjPeT+YymLft50wsP/RrBIb+I7sZt
	x9x4lg1RAqO2BCVB3b3HCdHHUy+XOlkvGhZ7SezU=
Message-ID: <781d6ee5-9fa2-4794-ad75-5e7927eb4649@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:34:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 39/44] x86/boot: introduce domid field to struct
 boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-40-dpsmith@apertussolutions.com>
 <a51d0a6e-7050-44af-9a66-edbfba67bab1@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a51d0a6e-7050-44af-9a66-edbfba67bab1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:36, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Add a domid field to struct boot_domain to hold the assigned domain id 
>> for the
>> domain. During initialization, ensure all instances of struct 
>> boot_domain have
>> the invalid domid to ensure that the domid must be set either by 
>> convention or
>> configuration.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootdomain.h |  2 ++
>>   xen/arch/x86/setup.c                  | 12 +++++++-----
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootdomain.h 
>> b/xen/arch/x86/include/asm/bootdomain.h
>> index 4285223ac5ab..d6264d554dba 100644
>> --- a/xen/arch/x86/include/asm/bootdomain.h
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -11,6 +11,8 @@
>>   struct boot_module;
>>   struct boot_domain {
>> +    domid_t domid;
>> +
>>       struct boot_module *kernel;
>>       struct boot_module *ramdisk;
>>   };
> 
> Oh, you should probably move domid after the pointers to avoid a hole.

It's not a packed structure and at this point, we are not looking to 
make it an ABI. If the maintainers think there is a real concern here, 
then I can add a reserved field to fill the hole.

v/r,
dps

