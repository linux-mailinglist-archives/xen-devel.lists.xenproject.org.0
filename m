Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0819968D9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814383.1227937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUrc-0006T8-39; Wed, 09 Oct 2024 11:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814383.1227937; Wed, 09 Oct 2024 11:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUrb-0006Qv-Vr; Wed, 09 Oct 2024 11:28:19 +0000
Received: by outflank-mailman (input) for mailman id 814383;
 Wed, 09 Oct 2024 11:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syUrb-0006Qp-0Y
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:28:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 933f5e22-8631-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 13:28:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728473290266242.10071680718363;
 Wed, 9 Oct 2024 04:28:10 -0700 (PDT)
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
X-Inumbo-ID: 933f5e22-8631-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728473291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b9rbYzIWB0FK/3ke1XqQ7G4XyNSCtOf8DuyRx2xaSZSBht42ueEmi3Wx5JJhWnuiNgr9cpmRjcLiazVU3G6C+Oum7BSZDTlUXW22KmYCyurMLwk7eq9uNO1VLXFr/E3ojrGVjt2yByuzkZ0pHm+jcKptMmPpBFz4UQcCDKWamBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728473291; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cQnkfH27S40SgWUUv2Zh0VqoE9tFT41RK/y4GBXUTiU=; 
	b=Kq9zuz8jIC/qOmAkE87/3JCREn9e7LbnWGC5VrkX4tEafafSzKOUH1J8cfUHwXa9fY2kXbmIw6SNs8ipbN4sRnC3BzAY58FtGjlmGz6KY4Lpl6Lbv59aArGBzxTCZUArpeaplAQL7m68H2Vcp26wPkm+jvf+K3guWCjigPwZZfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728473291;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cQnkfH27S40SgWUUv2Zh0VqoE9tFT41RK/y4GBXUTiU=;
	b=BGTvirDveS6YUoUFrUjksuheJGV8GM76d9DpM/pLjK7J4H8mtYpe6Hun21bRF+0R
	0Le9gHNr11EHR0nP+xhKCrGCuYmMYs5ByXLIcesQdr/k869shXl6l/CNkE21W5Pqwx+
	1jNAKnrvSrZvqm1OZu1qBDkrdWIxGFPquYk1R9Qo=
Message-ID: <b73bde1c-80a0-4d06-9c17-bbc408e368f1@apertussolutions.com>
Date: Wed, 9 Oct 2024 07:28:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/44] x86/boot: move cmdline to boot info
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-4-dpsmith@apertussolutions.com>
 <304c8c42-cfb7-4b0b-aaa7-8c673f9f2fa6@amd.com>
 <543a0931-e0a8-40be-98f9-fcb4e228a80b@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <543a0931-e0a8-40be-98f9-fcb4e228a80b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/8/24 02:42, Jan Beulich wrote:
> On 07.10.2024 20:09, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> Transition Xen's command line to being held in struct boot_info.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>
>>>    #endif /* __XEN_X86_BOOTINFO_H__ */
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index aafc098ca268..0921f296075f 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -274,6 +274,8 @@ static int __init cf_check parse_acpi_param(const char *s)
>>>    }
>>>    custom_param("acpi", parse_acpi_param);
>>>    
>>> +static const char *cmdline_cook(const char *p, const char *loader_name);
>>
>> Is there a reason not to move cmdline_cook() (and loader_is_grub2())
>> earlier to avoid this forward declaration?
> 
> At a guess: To limit churn?

Correct.

v/r,
dps

