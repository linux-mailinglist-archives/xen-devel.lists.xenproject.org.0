Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228CCCB5847
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183823.1506411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdvf-0000uZ-Be; Thu, 11 Dec 2025 10:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183823.1506411; Thu, 11 Dec 2025 10:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdvf-0000sP-7G; Thu, 11 Dec 2025 10:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1183823;
 Thu, 11 Dec 2025 10:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTdve-0000sE-0Y
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:29:46 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fc1296e-d67c-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 11:29:45 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5943b62c47dso776337e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 02:29:45 -0800 (PST)
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
X-Inumbo-ID: 4fc1296e-d67c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765448984; x=1766053784; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D8H17ulhkEgslJAdnXMogvfprVdOXngzyHF6etvOG2k=;
        b=Rjl1p0SpdosA6OjP3TQ33/kwWS9kfdScx3aOEXICdIOkYuPur1kQkjGhBrKt8O6ASe
         vXT+KnmyVgQtfj6QZQa5UsF9TVuIccfMxeOQqFxsMLe8Tv1QU21/xoq+hmZz9uPObt06
         niyWBRif99DRiGnoQFMIv2kFyvjz/Ocqh79UMbBEHvyas1Khc1v3mhCedPuz9ZtvJJHY
         6I+ZJVrLN/9puWxmY8fhx+6b0kOxhIph4NmYWLKAsCKSMBV+ixuC+0YNygtMYI9874qq
         qb6+0VOxVJol+qUy67AsHHg7JaBI/BDSGGlCsA9MYEB7l6B5oT/ImXw3ovUvYr8RsLxT
         Mjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448984; x=1766053784;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8H17ulhkEgslJAdnXMogvfprVdOXngzyHF6etvOG2k=;
        b=Wbo2rGgBlw6i3BNMYPWDtRoJm6xxPqOy8xJx2iYJuiXe8cQDFCm6pN35rihNiodJvR
         ztbWnVz/jUj1DrP/weOU82MXvY4x5JYJolaiwB20fmgR8WlYtBVu4mHnPOwfkOxMqJ7W
         nkvNgIEc/5a0mR05Yk8rhgUZM2cijBWMeDjaIznEw5A1MKWx5vJ6I8tyt65fsGiML1lb
         Sg/n2h9TJT2BzZlwQS2qoQ9fTlMslJDE/k/wt47z6SdMu85lF61pOHzww7GrDBil8ROW
         1o9sIl+R6dfUxmV9DQKPiF+5srUsa2GuIRmFEjX4hd95T8BxgDAmzIRdQ7gjmgY511R0
         /4zw==
X-Gm-Message-State: AOJu0Yz4lb57P/1ceSIizjPBcys0Id3dDAYymL5MS1yuCnr2tqyNQ5fQ
	nhSSZG4Ddggat6xyRqOeOnNC35qPm161HlO17OtOAQXppjbfzORQp1M0OXqf7QRe7EDGsUj2Pos
	9Iqu5ygiRoEab0yeHY8Bf4jqNyyINKIKBmpQxXVg=
X-Gm-Gg: AY/fxX5ZY5oEqtPlZH85A0dhkYRD6Fk7GDGk9dATgVL8KFdLs6B3lN1Jerj4jek+R3o
	8bJ0pUMHC4+pCTg4SShpXUxCAgscHPOsWEYtumyy4wtPilIhxjIxRp/gKo+3fFNWdClp8dpHGSP
	tH7/EuiHusWEyvg2H0xIeFnTqviJRvfS4KYTeC3ZZK+RcFB7B+BrU0dF0A1ZVngufNPaU/+u6rw
	2O60J13JoPHg4Sd9w9OFQo52aeB3Uua6f815nLrX9+wsxNU4P8b0eG3K1h+bedih8bK4JcmQNyW
	cpFakA==
X-Google-Smtp-Source: AGHT+IGZ+FjRzDf5bSv56dVqOshHOfALqgZ6MvexoSnKuv6KWdisPUBH0kkC7/Yht27JCm5linNCS3ILJnDhdBVbn9Y=
X-Received: by 2002:a05:6512:b20:b0:598:8f91:6d12 with SMTP id
 2adb3069b0e04-598ee4cb5aemr1998664e87.53.1765448983853; Thu, 11 Dec 2025
 02:29:43 -0800 (PST)
MIME-Version: 1.0
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 11 Dec 2025 12:29:32 +0200
X-Gm-Features: AQt7F2qErL4ON8m6tEuUXjZBl5Q0l7hmpTGVGsY-eC3CFABY5vP2IioCC2yEZ3g
Message-ID: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
Subject: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

While working on an arm64 s2ram series for Xen I have hit what looks
like very strange behaviour in symbols_lookup() as exercised by test-symbols.

The series is in the branch referenced at [1]. All patches there except
the last one build and pass CI; adding only the last patch makes the CI
job referenced at [2] start failing.

Note that the tests in that job are built without CONFIG_SYSTEM_SUSPEND
enabled, so most of the code introduced by the s2ram branch is not
compiled at all for that configuration. That is why I initially did not
expect my series to affect this job.

To investigate, I tried to reproduce the issue locally. I downloaded the
xen-config artifact from the failing job [3] and used it to build Xen
with my local aarch64 cross compiler. With this local toolchain
I could not reproduce the failure, and the resulting .config changed slightly
compared to the job's config. The relevant part of the diff looks like this:

    diff --git a/xen/.config b/xen-config
    index 057553f510..44dcf6bacc 100644
    --- a/xen/.config
    +++ b/xen-config
    @@ -3,11 +3,11 @@
     # Xen/arm 4.22-unstable Configuration
     #
     CONFIG_CC_IS_GCC=y
    -CONFIG_GCC_VERSION=130300
    +CONFIG_GCC_VERSION=120201
     CONFIG_CLANG_VERSION=0
     CONFIG_LD_IS_GNU=y
     CONFIG_CC_HAS_ASM_INLINE=y
    -CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
    +CONFIG_GCC_ASM_GOTO_OUTPUT_BROKEN=y
     CONFIG_FUNCTION_ALIGNMENT_4B=y
     CONFIG_FUNCTION_ALIGNMENT=4
     CONFIG_ARM_64=y

So there is at least a difference in GCC version and asm-goto related
Kconfig options between the CI environment and my local one.

After that I tried rebuilding inside the same Docker image that GitLab
CI uses:

    registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8

When I build Xen in that container, using the same branch, the problem
reproduces in the same way as in the CI job.

Even more confusingly, adding extra prints in test_symbols just before
the calls to test_lookup() makes the problem disappear. This made me
suspect some undefined behaviour or logic issue that is very sensitive
to optimisation or layout changes.

At this point, to me it looks like something might be wrong in the
logic inside symbols_lookup() (or in how the test drives it), but I may
well be missing an important detail about the expected behaviour here or
about the toolchain assumptions.

Could someone familiar with symbols_lookup() and the test-symbols code
please take a look or suggest what else I should check? If there is a
maintainer who would be willing to own this issue, I would be happy to
provide more data or try additional experiments as needed.

Thanks in advance for any hints or guidance.

Best regards,
Mykola

[1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/commits/reg
[2] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12394355047
[3] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12394354611/artifacts/file/xen-config

