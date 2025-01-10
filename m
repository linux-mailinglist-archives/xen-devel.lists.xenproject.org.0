Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7EAA091E7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869507.1280936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4T-0000yE-1t; Fri, 10 Jan 2025 13:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869507.1280936; Fri, 10 Jan 2025 13:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4S-0000vy-Sj; Fri, 10 Jan 2025 13:29:04 +0000
Received: by outflank-mailman (input) for mailman id 869507;
 Fri, 10 Jan 2025 13:29:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4Q-0000vX-Jk
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:02 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da23ab63-cf56-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:29:00 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so3281327a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:00 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:28:58 -0800 (PST)
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
X-Inumbo-ID: da23ab63-cf56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515740; x=1737120540; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=STJ6EDqaoVOMf2y2CPJp64NZSY2YgtDzimzb+ttUHDw=;
        b=fitzvgooHil/8fPTDgsMud1z+G5LvW9Tjw/GCZ9uEGKVGHIUnYxooFDtcYf6JT/LWv
         RW+isD7gdUjy2TFMISOAwq2ZASDGIK9LneCKSkM1fAA6TZiq2GDa/52QRqBS1f8vP1yG
         By/IXzxRUZK4iUQr+kAV6CMtRDspzF6Ap3Qxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515740; x=1737120540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STJ6EDqaoVOMf2y2CPJp64NZSY2YgtDzimzb+ttUHDw=;
        b=t3kTXopWNdkYLayVoMzJgbfPf0ERKepBx9gGS5MKdDtPPZq+5JwLnV8Hcad2tdkFig
         zaTWznikp7l+1xLp5/TxMVjRwxPTHZNmGVW3iIUepSl6Va8i2Fv34Qsaw5RKQMTWVJot
         kTW2rU/QtSi4Fj7k3VL6D+XAsHlJ0wxp7Use7TUG4GkHhsOujrzSzhLnUPJ0c/9+W1Ip
         kxzsFWSPC+Ki6pbCnVqKSUJ6mzOvdwekgWizuXokZovvujPDh218iCzC6l69VsIendA/
         tNv43B8zBOv9eNxc22Ur1P0EcR0REEk+9SL1fzxagZqMmX8wgPPGbMHWMqiOGOnDb0ln
         F+Yg==
X-Gm-Message-State: AOJu0YwuENHQ9U0DGp8ISBEpOjZ0clGaY3cX2wXQBkPkfKWyZphWdKWv
	t/3MLsHnaNaj2cO5QkFujh3kARvJWKhBWrUqJYQFrfd/zawRHw3f+vTqaegIv8bk72FQeC6CpqV
	Lcq3wG7b3
X-Gm-Gg: ASbGncuthA2u+Nf9FvvsWx0mjBxruO1asyG4EoPkeAjeLyaqzDNQZJkIEWINrl1KcJH
	8guT5ORaNfN7VrNZnws59yOip3h6wVM1NccU2DXj3m8VbwDdLN7/gLtifFoiZt4CL6MpIyQd2NW
	11Q6LTzUyTutsf18+1SqRCdwD/ZdCkRpp6OpEvYD2WUZl+y160zNMSMFfFM+GI96MScyaxyqAI5
	6oxlTlptdOBdyjVoPWgHN3IlD34/DN3O60HezsqY9pPS2d2zffYfjH03n/RRfkR34OKwkiAbejN
	W34=
X-Google-Smtp-Source: AGHT+IFh7Thg1UKXjZPRM5dqlSIZHRmH77Q8K0fYsEOJfpRPNyLE5ktp21z4O1Yq+UbhSwH4K1dWwA==
X-Received: by 2002:a05:6402:2813:b0:5d2:8f70:75f6 with SMTP id 4fb4d7f45d1cf-5d972e6f089mr10686180a12.30.1736515739899;
        Fri, 10 Jan 2025 05:28:59 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 00/12] x86: Address Space Isolation FPU preparations
Date: Fri, 10 Jan 2025 13:28:11 +0000
Message-ID: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See original cover letter in v1

v2: https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/
v2->v3:
  * Evaluated `v` argument in UNMAP operation (see patch 1)
  * Fixed bug on (de)compressing xstates by not unmapping them on early return.
  * Constified more when converting (f)xrstor and (f)xsave

v1: https://lore.kernel.org/xen-devel/20241028154932.6797-1-alejandro.vallejo@cloud.com/
v1->v2:
  * Turned v1/patch1 into an assert removal
  * Dropped v1/patch11: "x86/mpx: Adjust read_bndcfgu() to clean after itself"
  * Other minor changes out of feedback. Explained in each patch.

Alejandro Vallejo (12):
  x86/xstate: Create map/unmap primitives for xsave areas
  x86/hvm: Map/unmap xsave area in hvm_save_cpu_ctxt()
  x86/fpu: Map/umap xsave area in vcpu_{reset,setup}_fpu()
  x86/xstate: Map/unmap xsave area in xstate_set_init() and
    handle_setbv()
  x86/hvm: Map/unmap xsave area in hvmemul_{get,put}_fpu()
  x86/domctl: Map/unmap xsave area in arch_get_info_guest()
  x86/xstate: Map/unmap xsave area in {compress,expand}_xsave_states()
  x86/emulator: Refactor FXSAVE_AREA to use wrappers
  x86/mpx: Map/unmap xsave area in in read_bndcfgu()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
  x86/xstate: Make xstate_all() and vcpu_xsave_mask() take explicit
    xstate

 xen/arch/x86/domctl.c             |  9 ++--
 xen/arch/x86/hvm/emulate.c        | 12 +++++-
 xen/arch/x86/hvm/hvm.c            |  8 ++--
 xen/arch/x86/i387.c               | 69 ++++++++++++++++++++-----------
 xen/arch/x86/include/asm/xstate.h | 51 +++++++++++++++++++++--
 xen/arch/x86/x86_emulate/blk.c    | 11 ++++-
 xen/arch/x86/xstate.c             | 53 +++++++++++++++++-------
 7 files changed, 157 insertions(+), 56 deletions(-)

-- 
2.47.1


