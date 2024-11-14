Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0BA9C85A2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836109.1251981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpu-0003ve-3c; Thu, 14 Nov 2024 09:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836109.1251981; Thu, 14 Nov 2024 09:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpu-0003tz-0B; Thu, 14 Nov 2024 09:08:22 +0000
Received: by outflank-mailman (input) for mailman id 836109;
 Thu, 14 Nov 2024 09:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBVps-0003tk-3C
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:08:20 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fadcbc01-a267-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 10:08:14 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso5098251fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:08:14 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046ea8sm38491166b.169.2024.11.14.01.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:08:12 -0800 (PST)
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
X-Inumbo-ID: fadcbc01-a267-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMjkiLCJoZWxvIjoibWFpbC1sajEteDIyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZhZGNiYzAxLWEyNjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc1Mjk0LjcwNjc1OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731575293; x=1732180093; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xg3eV6uJILkADE5DXTSpz+DPEuz4PXNYB35N4fo4Fi0=;
        b=aAyx5GpbYUWWKjJiSfh7vuKJoAz+lOcmKhMMGWQp7Jur8o38CEBK3cC5tkpgTHyTqP
         Rd1dm4czB2UGLxSEhOTanFdZThUKADDM+h0m7E4QOX+CiCVTLUXTnWz9c8boSjrl0lEA
         dyC0gMZeFHMFOdEqe0QMbwohcOLd16ngcz8kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575293; x=1732180093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg3eV6uJILkADE5DXTSpz+DPEuz4PXNYB35N4fo4Fi0=;
        b=NF1jKPEpWe0vbp22BjiffVzlMe+oMFaia0HB51yyD53qW5KyzQL7oZbb4tFgqt3vyj
         sRdCdRkOXHh9Es3rw9ncJ7x/tBGdmcCOgHNN+a0qKxE7t+Nu5oBiqPsQsS8QK856MLgF
         e9eOU7c44d3d0dKwmCoASFTu0mWDBaXRaqNP4KYgGEEuSgi7OZ4b1/CTeL3wvnEwZj/R
         T5Me6oXHE8D1ihOC/xlYZZjWj0m9hJcgdrslfWlM8Qz31l7DrXea9sxKLvJLfpAO/swi
         21ofDRQ5JugEYmb2LeSI1SlLhcvhC3K6e3UsEhoRBj9i5dKLDZ51uMLxEfg3U+w5OHBV
         gEsg==
X-Gm-Message-State: AOJu0YwlwJOpPuXkPIw2sOmzsvOPwxe0l8OexUuaaT4VCAIFN5S4ZI7y
	omz8Ibu56CoLsc5OAS/xXY07feLZKuiuAMHFUMbO7Ge7+a1txULY0KzWdq/2mYmUZ7peG2Njjd/
	u
X-Google-Smtp-Source: AGHT+IFLQdFCkbuz45UNPeZ1l1awh3bt0/W/mWZ/Wq3QA9BWaewXHsF1JqHAfC+gCPpvygFlKrkpUw==
X-Received: by 2002:a05:6512:ea4:b0:539:8f68:e036 with SMTP id 2adb3069b0e04-53da5c4d19fmr1204067e87.34.1731575293362;
        Thu, 14 Nov 2024 01:08:13 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2 0/4] x86/trampoline: Layout description improvements.
Date: Thu, 14 Nov 2024 09:08:06 +0000
Message-Id: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0Cc: Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extended somewhat from v1.  See patches for differences.

Andrew Cooper (4):
  x86/trampoline: Check the size permanent trampoline at link time
  x86/trampoline: Simplify the wakeup_stack checks
  x86/trampoline: Document how the trampoline is laid out
  x86/trampoline: Rationalise the constants to describe the size

 xen/arch/x86/boot/head.S              | 23 ++--------
 xen/arch/x86/boot/reloc.c             |  5 +--
 xen/arch/x86/boot/trampoline.S        |  5 +--
 xen/arch/x86/boot/wakeup.S            |  8 ++--
 xen/arch/x86/efi/efi-boot.h           |  2 +-
 xen/arch/x86/include/asm/config.h     |  6 ---
 xen/arch/x86/include/asm/trampoline.h | 65 ++++++++++++++++++++++++++-
 xen/arch/x86/xen.lds.S                | 15 +++++--
 8 files changed, 88 insertions(+), 41 deletions(-)


base-commit: 380b32a476e714275c53e51f6482b3b650aff6f8
-- 
2.39.5


