Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB8345F043
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:02:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233164.404434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqcio-0004Tl-VH; Fri, 26 Nov 2021 15:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233164.404434; Fri, 26 Nov 2021 15:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqcio-0004RA-S7; Fri, 26 Nov 2021 15:01:06 +0000
Received: by outflank-mailman (input) for mailman id 233164;
 Fri, 26 Nov 2021 15:01:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skxS=QN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqcio-0004R4-1O
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:01:06 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad29a98a-4ec9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 16:01:04 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id k2so19331034lji.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 07:01:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g10sm525847lfv.113.2021.11.26.07.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 07:01:03 -0800 (PST)
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
X-Inumbo-ID: ad29a98a-4ec9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XYsv7m4z2BAbmpLOqiC9Zw9vuLWj4QpNLQpxzqC2tZ0=;
        b=kMh9axDkcxiovBOfojtLlG+umvR7zzxnSdV8CUEAvrYH+caKvQcJgr3eacpL2eJW+P
         thdJlVlCqE+C99Pbyn5H1M7WL5IMSqNrob5LcocVORMIrdtB/LRIVD50qu7r9+ktmWWb
         PpzRMGcNaNAtWN7jZ5ADA5V6QNfjBvClTGaaGqjhIyAepJX7le3ViDURSr8bsMmXQIj5
         2+i8iOUWQ8RFa4ukJclPGDvUXsCSKW6Ipg3//4CuWVQsac3LSh52HrAfhFbQ8rKGttWh
         YRlWY6bzM7SWImnL9Mgsw9zupx1QUmvAq9q1nXfshWW+h3zA2cL6FfUcRVH795AvsvlK
         8mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XYsv7m4z2BAbmpLOqiC9Zw9vuLWj4QpNLQpxzqC2tZ0=;
        b=iSnjaqk6LIoLjRR561KA6tNVRtkuV/tL3EzTYY1riXUIqwZiYZY1eH0fWeJ+4+EFEw
         v8/Pm30QYH8Z6rDVOJt3u70jXdMUam/x8ANvtAoP9662pM1Ojj5syNWCLKvOZQgeUQII
         0y/1SuTSOjmGugqLxwmCWSw0NTqBQ/JUKLIqu2tXY/Pqfp9Xj1nhMAVeySShePp9QMCh
         uyBjFkXaIVQqcknW+A6EVTWluzbv4v9mbVa+QqscIB5oCB7hnNRt4cNicykf3dsTmawH
         3b/A105De1wrGZHZjOR4zymMG7QotXz1Vo+Nwv5SBzFoSlTAnzt/f9T94Wg0EZByNL1B
         6N8Q==
X-Gm-Message-State: AOAM531Kmf2ax1vthqJFCr/DeLqQ6JjvqKNwT81pY+hdi0khaV/MLqrd
	SZTP70f7vcLH3zt7F7xVxIe4nFPQb5Q=
X-Google-Smtp-Source: ABdhPJyP4ZfKUgeeb1RNt2MrBARhenKcuWrh93XrOtT+yLy+1YPeWiEbUuZsXbgxQEOChb//YTMANg==
X-Received: by 2002:a05:651c:550:: with SMTP id q16mr31726646ljp.371.1637938863757;
        Fri, 26 Nov 2021 07:01:03 -0800 (PST)
Subject: Re: [RFC?] xen/arm: memaccess: Pass struct npfec by reference in
 p2m_mem_access_check
To: Andrew Cooper <amc96@srcf.net>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
 <b51fd518-6c32-c945-d220-f2092ff2666a@suse.com>
 <5665bac6-4315-dccc-3a36-5910f5624146@srcf.net>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9a2347b7-f973-bee3-7a95-6d376e3f981c@gmail.com>
Date: Fri, 26 Nov 2021 17:01:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5665bac6-4315-dccc-3a36-5910f5624146@srcf.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 26.11.21 13:39, Andrew Cooper wrote:


Hi Andrew

> On 26/11/2021 07:46, Jan Beulich wrote:
>> On 25.11.2021 23:49, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Today I noticed a "note" when building Xen on Arm64 with
>>> aarch64-poky-linux-gcc (GCC) 9.3.0. It turned out that Andrew Cooper
>>> had alredy reported it before [1]:
>>>
>>> mem_access.c: In function 'p2m_mem_access_check':
>>> mem_access.c:227:6: note: parameter passing for argument of type
>>> 'const struct npfec' changed in GCC 9.1
>>>    227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla,
>>>                                    const struct npfec npfec)
>>>
>>>  From the explanation I understand that nothing bad actually is going
>>> to happen in our case, it is harmless and shown to only draw our
>>> attention that the ABI changed due to bug (with passing bit-fields
>>> by value) fixed in GCC 9.1. This information doesn't mean much for us
>>> as Xen is an embedded project with no external linkage. But, of course,
>>> it would be better to eliminate the note. You can also find related
>>> information about the bug at [2].
>>>
>>> So make the note go away by passing bit-fields by reference.
>>>
>>> [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87439.html
>>> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Compile-tested only.
>>> ---
>>>   xen/arch/arm/mem_access.c        | 28 ++++++++++++++--------------
>>>   xen/arch/arm/traps.c             |  2 +-
>>>   xen/include/asm-arm/mem_access.h |  2 +-
>>>   3 files changed, 16 insertions(+), 16 deletions(-)
>> It's all Arm code, so I'm not the one to judge, but I'd like to recommend
>> to live with the note or convince distros to backport the gcc side fix.
>> This definitely was a compiler flaw; see
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91710.
> I too would recommend just living with the note.  The code change
> proposed is a backwards step in terms of runtime complexity - you're now
> passing around a pointer to 7 bits of information, which the compiler
> cannot pull into a local because of C's aliasing rules.  At a guess, the
> very best an optimising compiler could do is turn it into only two
> dereferences of the pointer.

Thank you for the analysis. I don't think, we want to make things worse 
(less optimal) than they are currently.


>
> ~Andrew

-- 
Regards,

Oleksandr Tyshchenko


