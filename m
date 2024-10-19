Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5A9A4DA0
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 14:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822497.1236471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t28CR-0004ui-7j; Sat, 19 Oct 2024 12:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822497.1236471; Sat, 19 Oct 2024 12:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t28CR-0004s0-5C; Sat, 19 Oct 2024 12:04:51 +0000
Received: by outflank-mailman (input) for mailman id 822497;
 Sat, 19 Oct 2024 12:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t28CQ-0004rq-A3
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 12:04:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55be0697-8e12-11ef-a0be-8be0dac302b0;
 Sat, 19 Oct 2024 14:04:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729339482088428.4743933200755;
 Sat, 19 Oct 2024 05:04:42 -0700 (PDT)
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
X-Inumbo-ID: 55be0697-8e12-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729339483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X62RzoancnBFF5utUmqIp2FG4K1vzb9kAgJMnIRbPR+P7BQvktlc0qJ9my5YLE5hzzG3XelQkvnJv/9U6nq2UmYJefbzSo2WE0uv4Jihea69dR8ev3DhWinpHG7DUN3L5uGTF7riCKjjfV0pS4Oq5LhjZMbgffQpoDCztlgIT7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729339483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MOwM/LbPXEACamzONVfkb7fee3UcYZJYnIGCl3yxkkY=; 
	b=JFm1s9KxmwwFIhT4xt/lgkcGmOoILFVX//KJePtPdj1EX2+cIOB943C1Q8lyXckUp7lc+S1Zy6KqreitxsZ/sQ2ftIkRbOZpioksrLvSbKtaofl4HMdPr3qSKXkcYcf0vOIiqSeRqJDIjcyozlVUAWzwoudbqlybDLU0bP2SGWg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729339483;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MOwM/LbPXEACamzONVfkb7fee3UcYZJYnIGCl3yxkkY=;
	b=gG1lPGY8eQwGOe+HBMMUF+u6q3v1Av+VqErue9X95XhfWKTaxwjacvwqgRhIJ91v
	hOweyBeHRQ9DghZIf80japF0sgZA8SE6E+hmV0NwE4oAv+mRQNN/x6uF/PUTjfz196j
	MEaiWvqENG10fkgtNbki/Keu2AMTy2x0R12c+q/Y=
Message-ID: <f81ac002-b857-4e1c-9f57-809b0c3250ef@apertussolutions.com>
Date: Sat, 19 Oct 2024 08:04:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/44] x86/boot: introduce boot module interator
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-15-dpsmith@apertussolutions.com>
 <acbb1045-237e-4570-b7a1-ea3283d344ef@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <acbb1045-237e-4570-b7a1-ea3283d344ef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/18/24 10:09, Jason Andryuk wrote:
> On 2024-10-17 13:02, Daniel P. Smith wrote:
>> Provide an iterator to go through boot module array searching based on 
>> type.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - documented help next_boot_module_index
>> - switch to unsigned int for next_boot_module_index
>> - changes identified that BOOTMOD_XEN was not supported, so added support
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
>> b/xen/arch/x86/include/asm/bootinfo.h
>> index 5862054b8cef..3010e6f4af9c 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -62,8 +62,35 @@ struct boot_info {
>>       struct boot_module mods[MAX_NR_BOOTMODS + 1];
>>   };
>> -#endif /* __XEN_X86_BOOTINFO_H__ */
>> +/*
>> + * next_boot_module_index:
>> + *     Finds the next boot module of type t, starting at array index 
>> start.
>> + *
>> + * Returns:
>> + *      Success - index in boot_module array
>> + *      Failure - a value greater than MAX_NR_BOOTMODS
>> + */
>> +static inline unsigned int __init next_boot_module_index(
>> +    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
>> +{
>> +    unsigned int i;
>> +
>> +    if ( t == BOOTMOD_XEN )
>> +        return MAX_NR_BOOTMODS;
> 
> Your earlier patch "x86/boot: convert mod refs to boot_module mod" put 
> xen at bi->nr_modules.  You'll want these to match.

Yep.

v/r,
dps

