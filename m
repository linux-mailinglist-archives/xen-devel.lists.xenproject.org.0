Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C31C03DC2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 01:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149768.1481269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC4ow-0006aD-Ll; Thu, 23 Oct 2025 23:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149768.1481269; Thu, 23 Oct 2025 23:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC4ow-0006YP-Ir; Thu, 23 Oct 2025 23:34:14 +0000
Received: by outflank-mailman (input) for mailman id 1149768;
 Thu, 23 Oct 2025 23:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lpkf=5A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vC4ov-0006YI-1X
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 23:34:13 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6d1fcfd-b068-11f0-9d15-b5c5bf9af7f9;
 Fri, 24 Oct 2025 01:34:11 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-88fca7a60cfso176008585a.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 16:34:11 -0700 (PDT)
Received: from localhost.localdomain
 (host-154-4.mdu.ilcmifre.champaign.il.us.clients.pavlovmedia.net.
 [66.253.154.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c0e97efa6sm257816385a.24.2025.10.23.16.34.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 16:34:09 -0700 (PDT)
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
X-Inumbo-ID: c6d1fcfd-b068-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761262450; x=1761867250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHehQy1e5k8hHipmye8nXvoklSTRtT6iQd6sw0dqxjo=;
        b=bnyW8PysPCQFc9w0gkYD9YkRXHuMH0fVTzbARDrxO/P4AhtG33XxXzVqsdspBgFwID
         /nPj3g/fQ1/q/MgolybbcoofpaN6ny1B1pnzwab8+Lammwu3JoKgvjV59j5VEOT15Qjj
         CYYM6CEVoJ2174uQ88fh69Tix0ky5lOCYcFUtXujrGLXPY3cD7Ra/tyYRnjBzESYDdmH
         Bk8VXQSklAVUC+9ft87R6LMRc8RNXnQyQI163KPGs1whykUvb7CI97whkOS3rz+d6ehC
         HergKoBqbgs/N5ZcrC0YgiYJ/cGcNGRGxCKPqImqQlaNBBFJ8Dlik+9dPDuKvxaoociC
         bDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761262450; x=1761867250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHehQy1e5k8hHipmye8nXvoklSTRtT6iQd6sw0dqxjo=;
        b=QtohaLp187w8rNQZZs3Woq1FP4maeunw/Rt5DmnrSVR+O5KbmTZjql7+wAtDaWHi+s
         on87cPfNqWxOP8PKKJ3R5VWPWlaabB+mw6vib02ZHqxBpmNgWWjB78RwtsdS4WQgnWJO
         a0G0wGjmL60phz7bwDP9ny8mVOK9t5bAWarnYKRjLnujbKPXJq9lsxc7wjNqfiq4iit9
         9yffaLWGQS5uTR1x7cj6TtnOBq8USQ5W3uB7YOGgEoHpX4zH9mroGZs9/mVkrFnoSLpl
         PfwOcdOj3BYIXw9Y0IvrtrqyxWhS3OG2O+QNKCHXngocmcqTdDTWd2tyX5AHhPhA9fZi
         sBiw==
X-Gm-Message-State: AOJu0YzjOnHAGMEIAduU9pZ9cIQrIOWh+ISCcwDUu5YVwE3f+at6ybQY
	PHuVD3EuDVU6dqZ3hMrko6rQ28to3OujLQipzIt3l/lHDk0Tl/nF/a6QjZdo
X-Gm-Gg: ASbGncuHvq4eJDSzPyUqkuPtt3xR+Nc1dOqEWrHI3RZTAhqHzC0G3Kal/THvwfIoyje
	8a/gkK77U38wRl2fGuaSKZIlC48KnYtZf5oXaFmppbKUqi5Lpuz6L/ZaZx+A2MzAT1JCF5qHBO4
	4KuN4G+tI3y/BJGIMcu639ejI11HCIcIHUndft9FTDLWDSCXbs+eDfCCXGQnTna7lNtM997z7IM
	M9uFqzHEEmMpvZYfr3lxvwoYdtk28oV+RpOr/k0lBdHZEZILGzzzwPWpXumcT1kVq1hmHYkAGvM
	lvnRVo129XI38RLoE6/kUfQ9h+jxy2pj/jI7ncW2ONVJDFJOBwDCby3r5yYo3ey7uEipwHxe9ew
	VoMvRgXKGK879Z4OaOHS1LC26BMnJeHfbt9zOUv45SYCYY+uteo6m+b963VX8J8+bv5/2c1d2gi
	gqpG0Pt4Xtuo33wL+8lhYZOWooAPb8ulCTjSsjzGShmvOG8ZvbQb1hhxBIHPKHS8aAWmsZ9jv/V
	/XepjAhgECZZFKkNWNxME4UIqmP5+gRs6MY2CydJll8gpU=
X-Google-Smtp-Source: AGHT+IGOpi6Tx172PyZLM83NDw1fTwRVUL2Q0werWHUcU2dbn5QyXLN0Rc01f/g+bTaWrpQIo34C9Q==
X-Received: by 2002:a05:620a:404a:b0:88f:4d97:152d with SMTP id af79cd13be357-8906e0dbd77mr3171207385a.15.1761262449849;
        Thu, 23 Oct 2025 16:34:09 -0700 (PDT)
From: Saman Dehghan <samaan.dehghan@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Wentao Zhang <wentaoz5@illinois.edu>
Subject: Support of building Xen with Clang/LLVM on Arm?
Date: Thu, 23 Oct 2025 18:34:06 -0500
Message-ID: <20251023233408.16245-1-samaan.dehghan@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi xen-devel,

When preparing and testing another of my patch for LLVM coverage [1], I
encountered a few problems with Clang/LLVM build on ARM 64 platforms.

The first two are clang errors.

I observe the following errors when building the Xen master branch
for ARM 64 with Clang 19 and 20. If I comment out 
"CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only" in "xen/arch/arm/arch.mk"
the error is gone but the build fails during linking (see the third). 

Error message:

arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8  
    9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"          
      |                  ^                                        
<inline asm>:1:2: note: instantiated into assembly here           
    1 |         stp q0, q1, [x8, #16 * 0]                        
      |         ^                                                 
arch/arm/arm64/vfp.c:9:46: error: instruction requires: fp-armv8                                                                    
    9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"          
      |                                              ^            
<inline asm>:2:2: note: instantiated into assembly here           
    2 |         stp q2, q3, [x8, #16 * 2]                         
      |         ^                                                 
arch/arm/arm64/vfp.c:10:46: error: instruction requires: fp-armv8
   10 |                  "stp q2, q3, [%1, #16 * 2]\n\t"          
      |                                              ^           
<inline asm>:3:2: note: instantiated into assembly here
    3 |         stp q4, q5, [x8, #16 * 4]
      |         ^
arch/arm/arm64/vfp.c:11:46: error: instruction requires: fp-armv8
   11 |                  "stp q4, q5, [%1, #16 * 4]\n\t"
      |                                              ^
<inline asm>:4:2: note: instantiated into assembly here
    4 |         stp q6, q7, [x8, #16 * 6]
      |         ^
arch/arm/arm64/vfp.c:12:46: error: instruction requires: fp-armv8
   12 |                  "stp q6, q7, [%1, #16 * 6]\n\t"
      |                                              ^
<inline asm>:5:2: note: instantiated into assembly here
    5 |         stp q8, q9, [x8, #16 * 8]
      |         ^
arch/arm/arm64/vfp.c:13:46: error: instruction requires: fp-armv8
   13 |                  "stp q8, q9, [%1, #16 * 8]\n\t"
      |                                              ^
<inline asm>:6:2: note: instantiated into assembly here
    6 |         stp q10, q11, [x8, #16 * 10]
      |         ^

Reprroduction steps:

$ git clone https://xenbits.xen.org/git-http/xen
$ cd xen
$ git checkout eff32008be0d2718d32d60245650ff6f88fb3d13
$ make -C xen menuconfig clang=y
$ make xen clang=y

Tested with the following setup:

- Clang version: Ubuntu clang version 19.1.1 (1ubuntu1~24.04.2)
- Host: Ubuntu 24.04.3 LTS /  aarch64

Second, for Clang 18 or below there are another set of errors despite
commenting out the "-mgeneral-regs-only" flag:

arch/arm/arm64/mmu/head.S:288:13: error: expected writable system register or pstate
        msr TTBR0_EL2, x4
            ^
arch/arm/arm64/mmu/head.S:509:13: error: expected writable system register or pstate
        msr TTBR0_EL2, x0
            ^

Tested with:

- Clang version: Ubuntu clang version 18.1.3 (1ubuntu1)
- Host: Ubuntu 24.04.3 LTS /  aarch64

This works with GCC. It also works with Clang on x86 builds.

Third, if I specify "LD=ld.lld" with Clang 19 and 20 after commenting out
the "-mgeneral-regs-only" flag. I got this linking error:

ld.lld: error: common/device-tree/static-evtchn.init.o:(.rodata.str): offset is outside the section

As I read from the project README, under "C compiler and linker - For ARM",
only GCC is listed. So my general question is whether Xen supports building
with Clang/LLVM on ARM platforms.

Let me know if you need more details or a patch attempt.

[1] https://lists.xenproject.org/archives/html/xen-devel/2025-10/msg00010.html

Thanks,
Saman

