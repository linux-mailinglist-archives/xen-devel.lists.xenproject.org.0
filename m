Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDAE68BA81
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490265.758912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOytU-0004ej-SX; Mon, 06 Feb 2023 10:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490265.758912; Mon, 06 Feb 2023 10:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOytU-0004cp-Px; Mon, 06 Feb 2023 10:38:40 +0000
Received: by outflank-mailman (input) for mailman id 490265;
 Mon, 06 Feb 2023 10:38:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOytU-0004cj-7n
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:38:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOytP-0004ZH-1b; Mon, 06 Feb 2023 10:38:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.13.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOytO-0003RC-Re; Mon, 06 Feb 2023 10:38:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=x56EfA9OWN1eC+U2EnXtfTTLCv7iltDe9D/V/Fvb+jk=; b=6Sxv18QYcl9/6on5qFbxrHn1KN
	d0Wss9kAkdCcKJDIfxayqiTFikOjRRFqlTyFNNeHUsW7pF5o8iUPr4tfCYQluHVVY0GoSfXGDpBxP
	XN3lIpm1utmBZJd+gsbVHKzJu58PLOnKEUPZL+G4p3SsdddnRGpAV3Z3GK6C/2kZrmIA=;
Message-ID: <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
Date: Mon, 6 Feb 2023 10:38:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/02/2023 07:29, Jan Beulich wrote:
> On 22.07.2020 19:43, Elliott Mitchell wrote:
>> Unlike other unsupportted options, ACPI support is required to *boot*
>> for a number of platforms.  Users on these platforms are unable to use
>> distribution builds and must rebuild from source to use Xen.
>>
>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> A general question first: How come this mail dates back to July 2020? I
> had almost missed it as "new".

I can't even find the Elliott's email in my inbox so reply here. But 
this sounds like a rehash of [1].

 >> Unlike other unsupportted options, ACPI support is required to *boot*
 >> for a number of platforms.  Users on these platforms are unable to use
 >> distribution builds and must rebuild from source to use Xen.

What platforms are you testing on? I know that this is working-ish on 
RPI4 and QEMU. But this will likely blow up on one of the server we 
support in OSSTest because we don't have proper support to hide SMMUs in 
dom0.

> 
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -29,13 +29,18 @@ menu "Architecture Features"
>>   source "arch/Kconfig"
>>   
>>   config ACPI
>> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"

The concerns I raised in [1] still stand. Most of the ACPI platform will 
also have support for IOMMUs. If we have support for IORT in Xen, then I 
would be a lot more amenable to remove the "UNSUPPORTED". And without 
that support we are going to do more harm and than good.

> 
> Personally I think the (UNSUPPORTED) in the prompt should then go away as
> well. Which in turn points out that we will want to reconsider whether we
> actually have UNSUPPORTED as a Kconfig control, as its purpose looks to
> be specifically cases like the one here. The question goes to Stefano in
> particular, who I think had introduced it back at the time.

Cheers,

[1] 20201022014310.GA70872@mattapan.m5p.com

-- 
Julien Grall

