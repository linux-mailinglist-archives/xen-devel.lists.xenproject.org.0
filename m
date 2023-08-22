Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1227844CD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588551.920084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSnT-0000TZ-30; Tue, 22 Aug 2023 14:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588551.920084; Tue, 22 Aug 2023 14:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSnS-0000R4-W6; Tue, 22 Aug 2023 14:55:54 +0000
Received: by outflank-mailman (input) for mailman id 588551;
 Tue, 22 Aug 2023 14:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ibS=EH=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qYSnR-0008QI-OD
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:55:53 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd1e651d-40fb-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 16:55:53 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5694a117254so3147863a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 07:55:53 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 e15-20020a62ee0f000000b00679a4b56e41sm7896974pfi.43.2023.08.22.07.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 07:55:50 -0700 (PDT)
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
X-Inumbo-ID: fd1e651d-40fb-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692716151; x=1693320951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ago3tcm0WwYbC/EMB9P0vXWxqznWK7OB+FtzI3fi/Q=;
        b=BmlHlO10xUZ9m1Q7ZsfYGEte5ZhMjNH8lGgQXwsc63cKIjh0MGMZzbxiHI87lrZvEf
         22GaxkGOfNTM+T9fNYi1Yipp1VQEZg09591fP68GTG+rE9+CmZLHI/yOu8bc+3d4k0Le
         nSIztfdhTYA0xU1H+mp3x9IqzSA8oToBJKX8ACzSLtHQQ6xzAqFKs3f8BjzL8+JAjjXR
         aH1V/v+bcCGC7SRWYRMlK836ro/wALO6/tiuwj5Hy8d/bhoBNjq30PxmRmlAGix0yGx/
         SJf21abFPD5WOBZNoUDPSUD8wCTuitCaYZmjS8ea0BQhPvXDuSzQ5fkO5ke9KY3IwWRc
         dO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692716151; x=1693320951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ago3tcm0WwYbC/EMB9P0vXWxqznWK7OB+FtzI3fi/Q=;
        b=gNI77yB7frhUu50hjXqxX+p8dIR+FOr61HHGZ4m1FVcjXeZNXF3+wMLGQYKG/tTKaZ
         yqPPSq9Z3klG9p6scZpqiyRDtnSIrlXZdxE1KwdHfxDS3sB0LA5l3I0RXM4UsTYeW8+y
         HABUK+W0K4OS7nI1s74o/+9jHQN4z9T1QtUF40YuZRAvXaOCbmtIKO6jhOHOXPt9C+HR
         eVJaEdpTUcQiGIe9kIvqJQpxnKdlLeKUbzz29maPvZ+4Iser1sea1DxVIk4hbn150nyB
         v4dbYKYSpj/LlFU6orlsW+wlSlDaViZIIfmQRSBllFPS4Lnwaqz3XpB+ih75q1hAdNHF
         Wb6w==
X-Gm-Message-State: AOJu0YyeM4lkS82R0R8qpwIajx+ihzHVbXF/bB3JMn2n/dHQXmCOvdjO
	JRYMo/oj6o4ePoJE+bBtwVM=
X-Google-Smtp-Source: AGHT+IGvCdTJ0p+uNtc1oqBjYPm9lgmpd7JtVrrL/sM8BrHpP/LThf4cp8RuhMX5xYb9ZVFjdjDSLA==
X-Received: by 2002:a05:6a21:47c7:b0:13b:a261:5cfe with SMTP id as7-20020a056a2147c700b0013ba2615cfemr10831174pzc.32.1692716151523;
        Tue, 22 Aug 2023 07:55:51 -0700 (PDT)
Message-ID: <af5508bd-d96e-3248-2fc3-f8a2c10f0aee@gmail.com>
Date: Tue, 22 Aug 2023 23:55:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/5] Fixes to debugging facilities
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
 <cf1b1eed-1029-df44-b5c5-9935433640fc@suse.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
In-Reply-To: <cf1b1eed-1029-df44-b5c5-9935433640fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/23 15:16, Jan Beulich wrote:
> One important formal question: Where did Andrew's S-o-b go on all of the
> patches?

Thanks for catching it.  Looks like I confused the submission process with that
of another (non-LF) project.  I'll re-read the docs to see if I missed something
else w.r.t. tagging rules.

> 
> Jan

-- 
Sincerely,
Jinoh Kang


