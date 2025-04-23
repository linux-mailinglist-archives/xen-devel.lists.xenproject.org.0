Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2BA98B6B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964740.1355457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7aJK-0008Cn-R4; Wed, 23 Apr 2025 13:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964740.1355457; Wed, 23 Apr 2025 13:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7aJK-0008BF-OA; Wed, 23 Apr 2025 13:38:46 +0000
Received: by outflank-mailman (input) for mailman id 964740;
 Wed, 23 Apr 2025 13:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7aJI-0008B7-Vy
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:38:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f6f516-2048-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 15:38:40 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4761272f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 06:38:40 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408c80174dsm36128805e9.0.2025.04.23.06.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:38:38 -0700 (PDT)
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
X-Inumbo-ID: 43f6f516-2048-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745415519; x=1746020319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=26S9pkHjc9pAx2Z1uNmxj7HY4aImHSHbYRYQNY29Apk=;
        b=icjQutdRZM/SRZk3EKI8lfIAP7YljLvQO1mX0b0ygFxifhH8dpn2mCr88EhB2WMm4I
         aZXZ5b4Bv53zZTTZ1RZYmHvDGbVl2bnl2ul+p9Nkae75NRrA+IgtqEabaiGbiS0T+w9K
         XYlHkzaFK6BAYM591LHs3es5X8Z6noKiBPhsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415519; x=1746020319;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26S9pkHjc9pAx2Z1uNmxj7HY4aImHSHbYRYQNY29Apk=;
        b=B+bYH5JnEsXirp0sD0C2DYjBr+WPRY7T4S75/33jqsUG2WBwRNUXdDcazofQ/RbVlr
         Kck1f8meZ/GUfYfQP7ciLhqNwetyWPtTJKTzgFQJ6X49v/L+tUMwBHI2C1lLNCmNEzLW
         Bf7gpqK8FaU1ZgrD1OuJHS1/p/+IyedBa8eJh0REM/iombetGXYgz0qu1+ht6RUi/EvA
         W+86LEOEHFpsJ7yNrG2dv3ZSr9TfbQIcCgL9Vqbcd1nN/dv6unh9fOYN4XN4WRv3GIRL
         L9qVedRwKURp2NA7ej2rVt2oTCml1V7MbRo2Ef0xaqZ+//mB84ccS3Movuxf6f2GnfRv
         xpjw==
X-Forwarded-Encrypted: i=1; AJvYcCVZVsznOgPfR+11eLq5j7xbSdwdb/vCpgq4ftKrM9doZbRtaG3LFVWaN8UnzBdll/4O2j7lVcTQmbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxwqCja8BeOva1+NcE8Ouvm/yjU11tY01I9Tf87Z2+fcp5uwy4
	PzpLnFaa8dhyM7stYAZ1/UpKgfvVM5cclENBYpwn/aoVrivyV2usVxiDzPnR4dY=
X-Gm-Gg: ASbGncuOgxbrkPxjefAGiwG3t1aXp3kDNeWC0fHl+2F9ZfYBP4gL1C3JiZECpL8OD6h
	VddvZ30iJSp/ZhkH1lR4de9TjU/Z6HkOGf6UAQDJhg8k4DyfnCBauAU6+0UIhmqj7/f5/mxRwY5
	pjJRykgUxFuThTYSm+f8Mm13TXhMS0Krne+8bS9FeZt8G7RsdqgbbN7WfBM5Ur0T7k9MDcL3CXN
	YBhTeUHa0fLxsXnevHj516GSDyIOo2tDEaWeVvvmZrWBhGzNnpZjWG7bVB1jMsn9d+WKIGACLZP
	BLCpvlGbp9yjJwSVGvGC4Srq8P/zvv1tclcjvzCQTLl8E2c2rBxbWQ==
X-Google-Smtp-Source: AGHT+IHiv23jDjX6SGY8J/wOZK+zrAmCYrKtUxPpgcLBNyxyiDm0yVZTN1MI2MUoCWyzjgq8YWgmJA==
X-Received: by 2002:a05:6000:2405:b0:39c:266c:136d with SMTP id ffacd0b85a97d-39efba2aa92mr14996993f8f.12.1745415519374;
        Wed, 23 Apr 2025 06:38:39 -0700 (PDT)
Message-ID: <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
Date: Wed, 23 Apr 2025 14:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 6:14 pm, Andrew Cooper wrote:
> I've stripped out the sha2 patch and fixed up to use the existing sha2,
> then kicked off some CI testing:
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
> https://cirrus-ci.com/build/5452335868018688
>
> When the dust has settled, I'll talk you through the failures.

And here we go.  Interestingly, the FreeBSD testing was entirely happy,
and that is the rare way around.

For Gitlab, there are several areas.

First, for MISRA.  In the job logs, you want the "Browse current
reports:" link which will give you full details, but it's all pretty
simple stuff.

kbl-suspend-x86-64-gcc-debug is a real S3 test on KabyLake hardware,
which appears to have gone to sleep and never woken up.  (More likely,
crashed on wakeup before we got the console up).  The AlderLake
equivalent test seems to be happy, as well as the AMD ones.

For the build issues, there are quite a few.

debian-12-x86_64-gcc-ibt is special, using an out-of-tree patch for
CET-IBT safety.  tl;dr function pointer callees need a cf_check
annotation.  But, all the failures here are from sha1, and from bits
which I don't think want to survive into the final form.

Other common failures seem to be:

    # take image offset into account
    arch/x86/efi/fixmlehdr xen.efi 0x200000
    Failed to find MLE header in xen.efi
    arch/x86/Makefile:220: recipe for target 'xen.efi' failed
    make[3]: *** [xen.efi] Error 1

~Andrew

