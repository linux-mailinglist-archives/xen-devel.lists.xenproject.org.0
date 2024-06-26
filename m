Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED791837C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749014.1157038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA4-0002TB-2D; Wed, 26 Jun 2024 13:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749014.1157038; Wed, 26 Jun 2024 13:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA3-0002Q9-Tx; Wed, 26 Jun 2024 13:58:11 +0000
Received: by outflank-mailman (input) for mailman id 749014;
 Wed, 26 Jun 2024 13:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA2-0000af-CT
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:10 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df9d88d-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:08 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3d55c0fadd2so971982b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:08 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:07 -0700 (PDT)
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
X-Inumbo-ID: 1df9d88d-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410287; x=1720015087; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihcaurA1Zhe1+CN+gql25MhLcUH6MWHK0QwFWHqTTAY=;
        b=UPJzTzWFFtuIwxx5EBW9eSvJoy925ThjJod6rGpTPlQNIObyaiUgPZcuD27wTKg9NO
         nAjAhb4iDYkH55A1Ki6NI0CfWeVLV71nv4MgaYQ8RZkqCMibxtXrGcXhibDBCUGR+Dyv
         /SMJ5m8XQASaNjtbH2AkNooUAyAVgUjTZ72B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410287; x=1720015087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihcaurA1Zhe1+CN+gql25MhLcUH6MWHK0QwFWHqTTAY=;
        b=ZF7Ep4hVEglaiSGnujBXWhrYDxEkXd97cC28dBMhpk767OCErYN7QcR+eJL+VT1n7s
         IrnGkQh9Mk4qpd7oc6DYLg0sfcYXPnhHaPmwTNjP5bsS4mEa1K0jL0/P6+Fp/yunp9ql
         fWJfcqkgVCsSuwYIFOigfUAXX6Ck57MDB9DNT+yJdLyOdhdvWJ5yoRG3WijThkLMguva
         Y5RjBehbdP2tp3sBbdIcKxCtPwD8uQVc2AMBZNj52uDgYIHyHwA6AOgDsVhLGM25jG0U
         4nHMOOLAyFA5qzxhdCROgnpPU+5TlCGVa29H3ooH+7VQrw6VdJ5MK9thtjV2cay+qJh/
         Q7UQ==
X-Gm-Message-State: AOJu0Yzn8CLWhWKi7NSYN4fkGDp4xT1VsvKofE2D8zx9/U9ZbZWlERJN
	HexhZwMULwsKzGdGUW0nxnvW3nD0VCKiBi89KxIhDyHKs60tDZ5kzP1Tg8t0glqNR3L3QgcBWRk
	du8I=
X-Google-Smtp-Source: AGHT+IEFfaOnT5G7EPh+PZ1hPt4pC+pnq82ztk88/9m2zZJbgavZuE6gOnjPyhkdmYShkwmjac3cmQ==
X-Received: by 2002:a05:6808:30a9:b0:3d2:1d51:e505 with SMTP id 5614622812f47-3d543aa87admr12513465b6e.17.1719410287385;
        Wed, 26 Jun 2024 06:58:07 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 07/14] xen/hvm: Don't skip MSR_READ trace record
Date: Wed, 26 Jun 2024 14:38:46 +0100
Message-Id: <20240626133853.4150731-8-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 37f074a3383 ("x86/msr: introduce guest_rdmsr()") introduced a
function to combine the MSR_READ handling between PV and HVM.
Unfortunately, by returning directly, it skipped the trace generation,
leading to gaps in the trace record, as well as xenalyze errors like
this:

hvm_generic_postprocess: d2v0 Strange, exit 7c(VMEXIT_MSR) missing a handler

Replace the `return` with `goto out`.

Fixes: 37f074a3383 ("x86/msr: introduce guest_rdmsr()")
Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/arch/x86/hvm/hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f..0fe2b85b16 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3557,7 +3557,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     fixed_range_base = (uint64_t *)v->arch.hvm.mtrr.fixed_ranges;
 
     if ( (ret = guest_rdmsr(v, msr, msr_content)) != X86EMUL_UNHANDLEABLE )
-        return ret;
+        goto out;
 
     ret = X86EMUL_OKAY;
 
-- 
2.25.1


