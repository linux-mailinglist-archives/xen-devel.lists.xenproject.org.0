Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7EC11A76
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151820.1482360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWZ-0000zF-In; Mon, 27 Oct 2025 22:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151820.1482360; Mon, 27 Oct 2025 22:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWZ-0000tY-FS; Mon, 27 Oct 2025 22:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1151820;
 Mon, 27 Oct 2025 22:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDVWY-0000qq-KB
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:17:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae31aa1a-b382-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 23:17:09 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47109187c32so28219825e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 15:17:10 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475de57b156sm148785595e9.13.2025.10.27.15.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 15:17:08 -0700 (PDT)
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
X-Inumbo-ID: ae31aa1a-b382-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761603429; x=1762208229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE3mMInBfN23ll5cf6fJavclqS1vi+3CRHMmk9cq9v0=;
        b=XaMrKvBS4jAeD6AjzW8KlDjDOH0PwMRuxPVpLDzGvtLN2Lmj/IlZ7OwNyYHbeEixMr
         YwOUVhL43EvUbFDd1nsnYvMLgOq/GwGGP469Hk3ThJi014Euayct+mn5YX+x+RB5ISLC
         LjfGYnVZ7aCAOe+HNC6LgLgOP1i/IYfzrVVy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603429; x=1762208229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE3mMInBfN23ll5cf6fJavclqS1vi+3CRHMmk9cq9v0=;
        b=c+v3Ho6Th5f+WtpLhEdQBCdRrngsvlbX7izPhRwhLbi6I2EsnuspNE4OVUWQqSeWqa
         28Ulz2e9V22SqiJFC85WQ39LUjBxfsBxhG86dfl4U9aGBp+RS9z3Rn1oGlUiurOR06UF
         Ri4EqsNSnrbOPOicp2I7GjXESk55iIb/fyjSryEtK0kzBjN1OHUhrBRW1M4fxnFRlkJg
         mO2Ky3vDvvq8/fc5X/2+HRyRhd561ODV79eBCLGQnZcbzGWI/h35k26GRcIm9kq02mrr
         eNZ0Jne7WtR/6b+PI6Bepy9vse0C+IiTLScZVZt9QHPrQecaYFZ9pr4KDVX7s1p5wrlD
         GZVA==
X-Gm-Message-State: AOJu0Yw+eJi3CErNyABWyFxsKcDPi0zuiie5oGLFvOispiC2WtnFEjiP
	0Ns03Ewjaz96+JB6xdVetEHqGqiJWX+1noDRDfSEGrdCcBsP/0e3Ul5Kb+dTnwMvfXg0ngYxZjq
	U7jynKYWzHA==
X-Gm-Gg: ASbGncuQTsEeiCGWKFDB27CDzgewzjxY+fMticT/7T3Md9XQZO5Jg/1DLeKN7Lm53HU
	n1vl/fsB9/njqIFFSnJULUUO5OhoadSVwk3AlXbvdoUg4LNJG2fPiv57qeFSQrFnlbBr4N8gazS
	sJHYm2h6DcYlkmxI/PPLPZitkUK3wDgmHbvmu3Cxhxh4k3YY6C1R57NMNhC5vLgvEtg5ZmRF8Vx
	G8MHcJbCmkLD6/lU69lY7oNMdPgWdDX47RpnXItUQpep7J4RpEKkDNIl25imoZo0dABcu4fzJ/U
	+YYBRJSj/OTKzpQe2yTN08jDc/shxbXxgjkQw/HCXAzaDBlPHqqCUhRUBWR3jXccuLLvYdTfwa1
	8VSw3hnsUtxP1Lzamo+5VeCn7tiA3H2H9pOUYwOR/DzqZKGPMoJUgl726hwUiXQ4cvnRSgjFP0E
	h8PppnpA1rGM0sac2gCgl42EEYB4c41D6Mhp4YXZfa5fXaiz/RsFE9DjDDDZeZiw==
X-Google-Smtp-Source: AGHT+IFco5yk1ZVisa4K7g88Lu+yzwh414XnzznpRCiRX4bvn+BssdTH6CW19Dw8EGBtpbi72Gqpdg==
X-Received: by 2002:a05:600c:46ca:b0:471:3b6:f2d with SMTP id 5b1f17b1804b1-47717e7a668mr8381645e9.38.1761603429129;
        Mon, 27 Oct 2025 15:17:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/5] x86/ucode: Abort parallel load early on any control thread error
Date: Mon, 27 Oct 2025 22:16:58 +0000
Message-Id: <20251027221702.3362552-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

EIO is not the only error that ucode_ops.apply_microcode() can produce.
EINVAL, EEXISTS and ENXIO can be generated too, each of which mean that Xen is
unhappy in some way with the proposed blob.

Some of these can be bypassed with --force, which will cause the parallel load
to be attempted.

Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1b093bc98a58..2705bb43c97f 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -392,10 +392,10 @@ static int control_thread_fn(const struct microcode_patch *patch,
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
 
-    if ( ret == -EIO )
+    if ( ret )
     {
         printk(XENLOG_ERR
-               "Late loading aborted: CPU%u failed to update ucode\n", cpu);
+               "Late loading aborted: CPU%u failed to update ucode: %d\n", cpu, ret);
         goto out;
     }
 
-- 
2.39.5


