Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1345EFB7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 15:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233130.404366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqc02-0006cH-DD; Fri, 26 Nov 2021 14:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233130.404366; Fri, 26 Nov 2021 14:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqc02-0006ZQ-A8; Fri, 26 Nov 2021 14:14:50 +0000
Received: by outflank-mailman (input) for mailman id 233130;
 Fri, 26 Nov 2021 14:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skxS=QN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqc00-0006ZJ-QN
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 14:14:48 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3643c892-4ec3-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 15:14:47 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id v15so19145067ljc.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 06:14:47 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r10sm504722ljg.116.2021.11.26.06.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 06:14:47 -0800 (PST)
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
X-Inumbo-ID: 3643c892-4ec3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DEycIOH8xZy5jEK36I0SPjIJMYH+1ejJeC+2cNzwCLo=;
        b=R73GxDIZnsHX+30Gu7DCbM8DWx2Amlr/Q3NCjZS8ZSB4BIaMV8DkwI9GNrQGrTXbrX
         iWmyx6zlRpDLVXCXgwU2bB/eJgLgwE11Iti9vFSKarc/2jfpSUzh2mq7Eth+7O+0P/hK
         bSdQzvjir9XPo6XH+LjBnuqvY0RFbD2YWgvWKQgS9SzatAqcGN4H1ry8MCsZYMH0qtCe
         vukd2v5WbiBi+7cjDd5aCFpdDmYFy7RXln4zzDRACqBEq4BXel2Afrra1ID2VlgzF3vU
         A8kMnsXNm5izsJjspodsEc1YtpyQsL3Y+VcJwXsP9ZaWs6oILoOrsSp2xfK+wkLmI/oA
         zmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DEycIOH8xZy5jEK36I0SPjIJMYH+1ejJeC+2cNzwCLo=;
        b=x56Acp6JfV5L014dFenkzUcmW+SRJxl7Nktll3EyZNS/KLcSCXuCG7NyYhIzgJg3hy
         30u7GMwftoDbeRZYnm+LzeyetBxTkzPeQPPI14i4XBJ884oDAiG+L/pIfCya3kVhprfF
         WKcR+g9uZr+oA7nQ1mE7z+UMLYGtacil+zQQmst09IpiZ83WMKTrbzjDSu+C1FXm10BF
         eNY13OGCdvtHxgbvMXFmexuXqt/SaNsb/fZx+Tjd4jph2WXagFIxGVf8ueJ9gc2BaFFg
         k7amtVURXMoYXUzVFISVzNQ5PNt6uHbqEmP0q7XWadOZUfrJBlfCVq8w/sCdpeazxe9G
         VK6w==
X-Gm-Message-State: AOAM531w5OJwAumwhi60cjXQDzjD+M4I9oSg0M5IQl9WpmvSXYWF/tjW
	Rc0HReYks2DPEwe9I+pOJWh1llWkJIA=
X-Google-Smtp-Source: ABdhPJz5NQ8/i8EckoNxXdRsZq4BmpPy9gMnZhMpSyCy4+ofS1d0VjievOotSkHUHhnVvRtrsl+Q9A==
X-Received: by 2002:a05:651c:112c:: with SMTP id e12mr6157837ljo.457.1637936087307;
        Fri, 26 Nov 2021 06:14:47 -0800 (PST)
Subject: Re: [RFC?] xen/arm: memaccess: Pass struct npfec by reference in
 p2m_mem_access_check
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
 <b51fd518-6c32-c945-d220-f2092ff2666a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9ae92dcd-0f72-0c61-62e0-bf49ba09c5b5@gmail.com>
Date: Fri, 26 Nov 2021 16:14:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b51fd518-6c32-c945-d220-f2092ff2666a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 26.11.21 09:46, Jan Beulich wrote:

Hi Jan

> On 25.11.2021 23:49, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Today I noticed a "note" when building Xen on Arm64 with
>> aarch64-poky-linux-gcc (GCC) 9.3.0. It turned out that Andrew Cooper
>> had alredy reported it before [1]:
>>
>> mem_access.c: In function 'p2m_mem_access_check':
>> mem_access.c:227:6: note: parameter passing for argument of type
>> 'const struct npfec' changed in GCC 9.1
>>    227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla,
>>                                    const struct npfec npfec)
>>
>>  From the explanation I understand that nothing bad actually is going
>> to happen in our case, it is harmless and shown to only draw our
>> attention that the ABI changed due to bug (with passing bit-fields
>> by value) fixed in GCC 9.1. This information doesn't mean much for us
>> as Xen is an embedded project with no external linkage. But, of course,
>> it would be better to eliminate the note. You can also find related
>> information about the bug at [2].
>>
>> So make the note go away by passing bit-fields by reference.
>>
>> [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87439.html
>> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Compile-tested only.
>> ---
>>   xen/arch/arm/mem_access.c        | 28 ++++++++++++++--------------
>>   xen/arch/arm/traps.c             |  2 +-
>>   xen/include/asm-arm/mem_access.h |  2 +-
>>   3 files changed, 16 insertions(+), 16 deletions(-)
> It's all Arm code, so I'm not the one to judge, but I'd like to recommend
> to live with the note or convince distros to backport the gcc side fix.
> This definitely was a compiler flaw; see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91710.

Thank you for the pointer and suggestion. Actually, after the 
realization that note is harmless and doesn't matter in our case, we 
could indeed tolerate it.

It is up to the maintainers to decide. I will be ok either way.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


