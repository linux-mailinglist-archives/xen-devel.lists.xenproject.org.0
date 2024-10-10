Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C69979F3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815353.1229086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhZ2-00030l-Il; Thu, 10 Oct 2024 01:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815353.1229086; Thu, 10 Oct 2024 01:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhZ2-0002yG-Fp; Thu, 10 Oct 2024 01:02:00 +0000
Received: by outflank-mailman (input) for mailman id 815353;
 Thu, 10 Oct 2024 01:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhZ0-0002yA-RX
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:01:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3d0a29-86a3-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 03:01:56 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728522111520377.1807260724768;
 Wed, 9 Oct 2024 18:01:51 -0700 (PDT)
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
X-Inumbo-ID: 3e3d0a29-86a3-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728522112; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dv56mP/+DKLa8/YjDIWyWo1TleCfbT9P22sIsK7AIFWV76MlhbI2Qx95bhHUY15m99Fx16hoIKqRRFGNp7jaSkBs8uW6DCpm/6Ry3B9HPp7TQQAUnmmK7cYQ2xrSemMqXTCRbLwDNGVglHANJcbdZkNneqZ9oDhA761IADwr0K8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728522112; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8It+sKe1bOr1v4FAbbm/h6qlDH9jGu7Ukb0srMyWRhI=; 
	b=GiL5usWGHMR5hY4gQ6Bk3JzlUB41Wurw7vo3//IAbY7CJzIFTulJ/aa14Y0MehJv6UEf7OZ50v0JUn24VRd9sWIyVUyewoThqd/MYg33KV2LFFZGkVhezOnv+j+fZkTAEm8VaIrS6UYv2sWWyB3eZj3deZyF9VFGMxK1a63p6P8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728522112;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8It+sKe1bOr1v4FAbbm/h6qlDH9jGu7Ukb0srMyWRhI=;
	b=ehHUz+u4fx0rbN29basz25QUlURuaXxhpO786UAexA1czx5LmQ8gUTuCREhhQQHe
	CwVavshw4xKVMgovyppjZqwM81K8aCOsDU4jIIbol3U81UAFBN1ZjYX55+2nbWGw7tc
	vHqGOrM5o5P7fksBb5c4SNorKz5mUgxPvmlAnvw8=
Message-ID: <178dfeb1-0e44-4905-824d-3a1c56a2706d@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:01:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/44] x86/boot: introduce struct boot_module
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-6-dpsmith@apertussolutions.com>
 <76faeab0-3c8d-426d-8019-871ebfebbf78@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <76faeab0-3c8d-426d-8019-871ebfebbf78@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:17, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> @@ -302,6 +304,13 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>>           bi->memmap_length = mbi->mmap_length;
>>       }
>>   
>> +    /*
>> +     * This will iterate over all modules to include an extra mb module, which
>> +     * should have been reserved to hold an entry for Xen.
>> +     */
>> +    for ( i = 0; i <= bi->nr_modules; i++ )
>> +        bi->mods[i].mod = &mods[i];
> 
> I find the comment difficult to follow / match with code here and elsewhere.
> How about "Iterate over all modules, including the extra one which should
> have been reserved for Xen itself"?

Okay.

v/r,
dps

