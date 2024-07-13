Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C049305AD
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 15:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758461.1167937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sScOb-0004dC-QF; Sat, 13 Jul 2024 13:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758461.1167937; Sat, 13 Jul 2024 13:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sScOb-0004bh-Mv; Sat, 13 Jul 2024 13:02:37 +0000
Received: by outflank-mailman (input) for mailman id 758461;
 Sat, 13 Jul 2024 13:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBzr=ON=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sScOa-0004bb-8m
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 13:02:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b84bd2b-4118-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 15:02:35 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42565670e20so22888685e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jul 2024 06:02:33 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e983e7sm19979685e9.23.2024.07.13.06.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 06:02:32 -0700 (PDT)
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
X-Inumbo-ID: 2b84bd2b-4118-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720875753; x=1721480553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jPwVs4DPDEDk6fdFWtbJkBLN7F3W8kPIM1vGExs4zpo=;
        b=WhQjcIMq739sepkyJhjCXjtipMIo/73I67bG8AbdCa0Vml9v3FBco6Hub/bg032TJn
         2+Y/SIYGeYA3G8J8/rqkLYrn/FP8dy3i3eG/JqmgBqjHAClrJZ1Kwg7bsBlQ85RqgZEh
         99f6/VAlpPLJkMIi0d4/zz+i/FrC3HuaB12qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720875753; x=1721480553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPwVs4DPDEDk6fdFWtbJkBLN7F3W8kPIM1vGExs4zpo=;
        b=h68YEBLuiAqLObPBgO6LBJbaio+Tqevo9ojre+KByamnL79yEKLcZRGdwD1+SUb8o+
         cfgTzVryi/Z4pRT1MD+Fpc+mOa9C90e+WMWgssg9xNizsl5s6XbrtJNJyhN7vrENEeFT
         Y/1+83ayCOl9p+ND/jbJ9VUtXqez30sF7NdjqukKHO4038BLswuDjfH7jalKI+upcuDp
         vyKkDUMgCL3+3uonhDiEEdAgoRTql5mjGZJlMvtC6bM3GcTWZZf4mjOAi3VqrJCeblgZ
         tyMRLc7vXVtBnoGk+4uz0r69RoaVmdHlfpHbb+SD4WJ8STf0hoOG4ivjdxrzYbS6MXYJ
         V8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVabLW/Cy1+aqL+aAuTonf85Ll3Lt/e4Gy7URyWlLRMeTrzcMPurf4yveMkqWRkLZi95rGc1LaV6PbpQt+nmunXAfq3FeVOTxpM2PR07xo=
X-Gm-Message-State: AOJu0YxHwGFbuGmsCcOXAc7VB7dMBqrtzjMnCzW5MW+prl2XPBICCCqr
	4LmJ/StbqFM4LJddDUQwzmbuoTMY8cDGIKty+VAF6VJ+FzWQRNHaqJWbwNHrIs8g8H8PLh/NQ61
	OK14=
X-Google-Smtp-Source: AGHT+IEoOMBp1fE4VqFRTh//QAyHzYcdbMAcLx8O/z5zp8EF7qg+1EiqirwHR3zoeYxrPeCntQ7rxA==
X-Received: by 2002:a05:600c:4f49:b0:424:aa83:ef27 with SMTP id 5b1f17b1804b1-4279d9f289emr52695265e9.1.1720875753180;
        Sat, 13 Jul 2024 06:02:33 -0700 (PDT)
Message-ID: <94d0ef92-9fb8-4097-a633-59f1190434c4@citrix.com>
Date: Sat, 13 Jul 2024 14:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: systemd units are not installed in 4.19.0-rc2 anymore
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ZpHqR4e3VaFAXC3m@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZpHqR4e3VaFAXC3m@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/07/2024 3:45 am, Marek Marczykowski-Górecki wrote:
> Hi,
>
> Something has changed between -rc1 and -rc2 that systemd units are not
> installed anymore by default.
>
> Reproducer: 
>
>     ./configure --prefix=/usr
>     make dist-tools
>     ls dist/install/usr/lib/systemd/system
>
> It does work, if I pass --enable-systemd to ./configure.
>
> My guess is the actual change is earlier, specifically 6ef4fa1e7fe7
> "tools: (Actually) drop libsystemd as a dependency", but configure was
> regenerated only later. But TBH, I don't fully understand interaction
> between those m4 macros...

Between -rc1 and -rc2 was 7cc95f41669d

That regenerated the existing configure scripts with Autoconf 2.71, vs
2.69 previously.

Glancing through again, I can't spot anything that looks relevant.


6ef4fa1e7fe7 for systemd itself was regenerated, and I had to go out of
my way to get autoconf 2.69 to do it.

~Andrew

