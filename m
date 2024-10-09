Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC7996DAB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814614.1228214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXdf-0005WI-88; Wed, 09 Oct 2024 14:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814614.1228214; Wed, 09 Oct 2024 14:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXdf-0005U1-4c; Wed, 09 Oct 2024 14:26:07 +0000
Received: by outflank-mailman (input) for mailman id 814614;
 Wed, 09 Oct 2024 14:26:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXdd-0005Tn-9i
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:26:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696d1252-864a-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:26:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728483956995801.6726115135878;
 Wed, 9 Oct 2024 07:25:56 -0700 (PDT)
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
X-Inumbo-ID: 696d1252-864a-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728483958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X8+Nfrh3EM7pm9fDrijmD824QcRzXL0Xl564qPODYM/AmQ2Z+NrVM5rw1KoFJrsxUo0Blp/FcSa9DgaqSQ+ggHGftH8YiQ4QCd38S2IlBaG3sUapywwYyD5+Ar97Gh1bI8LgeD3q7RzJTF6lkBpYmijLS+9xXHCgvaDY3iHIWzw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728483958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7FC7TXmamB84eXzG7JNc/+2zDsbCnDg/Whb+n+mdk7U=; 
	b=XyrgHVtWGX5nuX8xoIo+n84Gk34az12u4HpvXtchMDJrs1YadPRhBENCiQOHWE34JobhX3A29ZPNJnLEfPPgKjplXDAUUvwlh9Z1CEFQvRH4hqLmdC6HQm6resgMHBw7gpYeRAk+aacapIJiApY/P+fCYwRqI2yj1ZSYvrHkWR8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728483958;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7FC7TXmamB84eXzG7JNc/+2zDsbCnDg/Whb+n+mdk7U=;
	b=DrQVVK6MG6Z6NcTf8l2Q9+GKXAuviiR4JLgwxXrYaC4Wl9IhF2oJjlO6HdvFRXif
	CSJinB8EwnZqyThGUVHNBZggyHoM6UjOfYV4g/STIeycfMa/saMGXfDUVIk+GVbYnKW
	y8WBRR/ih3k8HwwDDwg6SLYB9UP7BXD6344/v1Yk=
Message-ID: <2ac01c09-4a30-4544-a2b8-39c3378f557e@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:25:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/44] x86/boot: introduce boot module types
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-10-dpsmith@apertussolutions.com>
 <e45d1cb7-333e-47a3-8834-5cb927e42e3b@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e45d1cb7-333e-47a3-8834-5cb927e42e3b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 15:50, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> This commit introduces module types of xen, kernel, and ramdisk to 
>> allow boot
>> module detect code to tag the purpose of a boot module. This reduces 
>> the need
>> for hard coded order assumptions and global variables to be used by 
>> consumers
>> of boot modules, such as domain construction.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
> 
>> @@ -2058,6 +2063,7 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>              cpu_has_nx ? "" : "not ");
>>       initrdidx = find_first_bit(module_map, bi->nr_modules);
>> +    bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> 
> This is incorrect if an initrd isn't present.

Correct, will put behind guard.

v/r,
dps

