Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F179E7844F1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 17:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588570.920103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSwB-0002vV-55; Tue, 22 Aug 2023 15:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588570.920103; Tue, 22 Aug 2023 15:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSwB-0002sg-1b; Tue, 22 Aug 2023 15:04:55 +0000
Received: by outflank-mailman (input) for mailman id 588570;
 Tue, 22 Aug 2023 15:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ibS=EH=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qYSwA-0002sa-JD
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 15:04:54 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3bacf7-40fd-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 17:04:53 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so2675626a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 08:04:53 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 30-20020a17090a001e00b00263b9e75aecsm8657132pja.41.2023.08.22.08.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 08:04:51 -0700 (PDT)
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
X-Inumbo-ID: 3f3bacf7-40fd-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692716692; x=1693321492;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLf1q44Ic29eJmQo+SkjX1zncwxojzkc2RLslHAe60A=;
        b=Dj1bMKz+Vy2z1ZuNjXY1yxg41IVSJ71zmBj3xgFJcj3VHymnr6sdPW+puNGpPRwBC0
         cfIJQD1SHsZ7PMX8b6cPpWH9rLO98KMHn4vpzHEJgtlEB54Nte1jMbCX72exuOhgIE7l
         qYwWibnsqlwkbrpba89vL+qm2aJVshyPnk56EQ+0pJeDFFXqIwV3/JJkazArjtA/x9mJ
         bWWoqts37tvjyWX/9p0KSx2Luu9hdHJRhXaKOZz1EHYZR5xfOkqjyKPSESPHuDyYRoB4
         ExFXrThnX+2HmJWSt6IJm6VXztfjtWF8RbswsO0drOytUnSByrkiYEiI+IxvXyB+TkbH
         RGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692716692; x=1693321492;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLf1q44Ic29eJmQo+SkjX1zncwxojzkc2RLslHAe60A=;
        b=lM1czmxkrGd4B6AwE8IOIwbYX/J9O588U262K9WWXJE+jNBLXzwbyP/fLsc6SG0Q7E
         q+W2BZLHNeM21p/mOy52tBkOTdaxcqSLhNGBpglirRGLfwuGhY+iCiI/raHxA56BfHzn
         xtPNqKx3OaeIJYj998y/VESIALo71La1ChTzqsGiUeHul297xIEGmFiCXaZNbejgGCCV
         JqpU8nocHngWHjxuShHmk0G6/t//YOOb96QSymKS0DZx2jaNbzB5C8nHdmZ9Z6y/CiCe
         znxkXVugrTlgySShEz93f+OADfeTEz/hpV86izvcl8BPKEPa2uyxqDFA6DkREP4dP+yp
         TRuw==
X-Gm-Message-State: AOJu0YwSQHcGA04kPeQ/reCHfGReKjk00XoHCIzVNHUt838VUEUr5kPG
	h5Up/i7zOmUpgTmEOT87Seo=
X-Google-Smtp-Source: AGHT+IHX8FUHjE6kzS+Rd0SmughxecUjpvR1huNnRlKD7189MpT88uX7NWA1+DypSy4hBVBEGmffmw==
X-Received: by 2002:a17:90a:f496:b0:26b:1424:219e with SMTP id bx22-20020a17090af49600b0026b1424219emr6539990pjb.44.1692716691759;
        Tue, 22 Aug 2023 08:04:51 -0700 (PDT)
Message-ID: <2b0e95d4-386a-bbec-d49a-dd71e7c53688@gmail.com>
Date: Wed, 23 Aug 2023 00:04:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
 <eb2a3feb-b226-0d90-51e8-c541b5e2dfd8@gmail.com>
 <dcd6a5db-239a-9ade-0236-be91744e3b98@gmail.com>
 <a99eb8b6-2e3b-d216-f85b-272161e79185@suse.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 1/5] x86: Fix calculation of %dr6/7 reserved bits
In-Reply-To: <a99eb8b6-2e3b-d216-f85b-272161e79185@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/23 23:54, Jan Beulich wrote:
> On 21.08.2023 18:12, Jinoh Kang wrote:
>> On 8/22/23 00:56, Jinoh Kang wrote:
>>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> The reserved bit calculations for %dr6 and %dr7 depend on whether the VM has
>>> the Restricted Transnational Memory feature available.
>>
>> s/Transnational/Transactional/.
>>
>> It was in the original review, but I missed the change.  Apologies.
> 
> But that's not the only change that was requested back then. There was
> one aspect Andrew didn't like, so leaving that part as is would be
> fine. But for the items he didn't further respond to, I'd expect a
> re-submission to take care of them. Plus, if you didn't address
> anything, you would want to (a) mention that

Right.  I'll try to address the rest and provide rationale for those that
aren't feasible.

> and (b) take Roger's R-b
> that was provided at the time (unless of course re-basing was resulting
> in massive changes).

There were many changes, some arguably cosmetic and some not-so-syntactic
ones.  Quite a long time has been passed, so I was unsure if the R-b's
held up to the present moment.

> 
> As I expect the same to be the case for the other patches, I'm not sure
> it's worth looking at them (again).

ACK.  Please consider this patchset withdrawn.

> 
> Jan

-- 
Sincerely,
Jinoh Kang


