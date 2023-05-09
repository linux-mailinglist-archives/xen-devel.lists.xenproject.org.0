Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86266FCAE1
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532325.828484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPxl-00044R-OQ; Tue, 09 May 2023 16:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532325.828484; Tue, 09 May 2023 16:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPxl-000421-Ld; Tue, 09 May 2023 16:13:17 +0000
Received: by outflank-mailman (input) for mailman id 532325;
 Tue, 09 May 2023 16:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DnBy=A6=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1pwPxj-00041v-Fk
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:13:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6595d632-ee84-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 18:13:12 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so40383015e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:13:13 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003f4289b18a7sm4568730wma.5.2023.05.09.09.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 09:13:12 -0700 (PDT)
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
X-Inumbo-ID: 6595d632-ee84-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1683648792; x=1686240792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZL5/yJ0py80FB7KCRxPZ4CEHo/l8qnSLGQegUdOStw=;
        b=E0Do2rJAH8C9Bb1YZ8sKe9/hCwpL0bItmV+hDtIzjnsyYgbNx9idKtIks76Gpn9Scf
         Ktbmy6E8utPfROM+S5jHLcLlLUcF5+421uJ/x0EkZoZq79MdCe99icuU/AFPWrOv7zDM
         fhH84n58hZ44w4qNc144fQAccjG3UAxog7q3KrESczB/WrPUjJ2BpBYhTsjQpdLuE7HY
         dQzA/V4yMNNIwv/a3KqSGcrnSgeCmD2tYBrPZXl7LU2jb5OKIKEYKybbrqY2UhAOOOux
         kYA4jkFo4u36TSqkTpXfFQUO2iTfRN0R4zTXaWJ4FUSX2H6jw5AFd0jl/2hs5RI1axRU
         Pppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648792; x=1686240792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZL5/yJ0py80FB7KCRxPZ4CEHo/l8qnSLGQegUdOStw=;
        b=B9ywZD15g0vR/SpYpKOGJ4DOXtppLn6QWI55Jl9C+4g2JcalyP0LJIEWAyJJZpnbks
         Fz7VMqZzX3ptZc9sqZgTPWuzINuw+HmYB/GfqHWp1PqhnuqjedXTPDeOq1431zQkvdyn
         poS8Spnn6T1t4IwTKQaRHQmwgQTWS0ZS4PxjGQz9L7k7p3H7u9PqVv35qh4IP9br0JRn
         t6Yxr4Wq+59a0P4HRv2bHGGJDo8zejFPUYeHJ4z4P+Uf9lR8aBnHLOcyoxv+M7whLzvP
         KsJ44mZaL6B/5nD+u/ijfRDI1ckmtjZUCvEhe/1OzNYY6UwDSze2gB7U17z5r8N6J59f
         7zdw==
X-Gm-Message-State: AC+VfDwCWDXZEgNjEDsX1gyaBRR3cK1vYm98J67D+5LjneQlBVv1gtFU
	R2+6WGniLDfnW6l8IJpNKwjZvcsVgrvS+4wfcjaAXg==
X-Google-Smtp-Source: ACHHUZ4xJF31OFqZKnjqn2rIjsFe4D2XckHUK2oZpnmMXoAutKwB45h7WrFwn0TK1gkLOLUosD5gLw==
X-Received: by 2002:a7b:cd94:0:b0:3f4:266d:5901 with SMTP id y20-20020a7bcd94000000b003f4266d5901mr4918059wmj.35.1683648792474;
        Tue, 09 May 2023 09:13:12 -0700 (PDT)
Message-ID: <bea250ed-a24f-8983-42fd-d11c6072bc1e@rabbit.lu>
Date: Tue, 9 May 2023 18:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
 <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com>
 <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr>
 <50bf6b82-965b-d17c-7c5a-49c703991504@rabbit.lu>
 <f44261a2-df39-f69a-9798-dc1d656e6dac@vates.fr>
 <a51e0f7e-aed0-2ec9-f451-2e750636fb78@rabbit.lu>
 <9a5045b8-43f3-d418-9e77-418b6db91f71@vates.fr>
From: zithro <slack@rabbit.lu>
In-Reply-To: <9a5045b8-43f3-d418-9e77-418b6db91f71@vates.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09 May 2023 10:50, Yann Dirson wrote:
> On 5/4/23 20:04, zithro wrote:
>> On 04 May 2023 17:59, Yann Dirson wrote:
>>>
>>> On 5/4/23 15:58, zithro wrote:
>>>> Hi,
>>>>
>>>> [ snipped for brevity, report summary:
>>>> XAPI daemon in domU tries to write to a non-existent xenstore node in
>>>> a non-XAPI dom0 ]
>>>>
>>>> On 12 Apr 2023 18:41, Yann Dirson wrote:
>>>>> Is there anything besides XAPI using this node, or the other data
>>>>> published by xe-daemon?
>>>>
>>>> On my vanilla Xen (ie. non-XAPI), I have no node about "balloon"-ing
>>>> in xenstore (either dom0 or domU nodes, but I'm not using ballooning
>>>> in both).
>>>>
>>>>> Maybe the original issue is just that there is no reason to have
>>>>> xe-guest-utilities installed in this setup?
>>>>
>>>> That's what I thought as I'm not using XAPI, so maybe the problem
>>>> should only be addressed to the truenas team ? I posted on their forum
>>>> but got no answer.
>>>> I killed the 'xe-daemon' in both setups without loss of functionality.
>>>>
>>>> My wild guess is that 'xe-daemon', 'xe-update-guest-attrs' and all
>>>> 'xenstore* commands' are leftovers from when Xen was working as a dom0
>>>> under FreeBSD (why would a *domU* have them ?).
>>>
>>> That would not be correct: xenstore* are useful in guests, should you
>>> want to read/write to the XenStore manually or from scripts;
>>
>> Didn't know that, can you give some use cases (or URLs) for which it
>> is useful, with or without XAPI ?
> 
> You can get other examples in
> https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html#domain-controlled-paths

Thanks, I should pay more attention to headings ;)
 From the comparison between the docs and the xe-daemon, I saw some 
inconsistencies.
I decided to post a bug report in TrueNAS bug tracker :
https://ixsystems.atlassian.net/browse/NAS-121872
(It's a bit messy though, /me not proud).
I didn't check if FreeBSD and TrueNAS do some changes from upstream, but 
it may be of interest for Citrix devs too ?
Apologizes in advance for mistakes due to misunderstanding/noobiness.

>> PS: small mistake in "man/xenstore-write.1.html" (from at least 4.14,
>> and onward), the synopsis reads "xenstore-read" ieof "xenstore-read".
> Patch sent, thanks.

No prob and happy to help back !
(@Yann: please tell that to your colleague C. Schultz, so he's more 
inclined to lemme write articles for the Xen docs ^_^).

>> Also, the -s option disappeared from unstable, although it may be
>> expected. I don't know it's purpose either.
> 
> See
> https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036ec2862a4b4bd34ea4f

Ah yes, understood.
To complete the commit, I found a few other places where "-s" has not 
been removed from "xenstore_client.c", in func "usage()" :

Example for line 97, diff style:
- errx(1, "Usage: %s %s[-h] [-p] [-s] [-R] key [...]", progname, mstr);
+ errx(1, "Usage: %s %s[-h] [-p] [-R] key [...]", progname, mstr);

Same deletions needed for lines: 100, 103, 109, 112, 115.


KR,
zithro/Cyril

