Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C9BF1834
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146289.1478743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnw-0008F3-SD; Mon, 20 Oct 2025 13:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146289.1478743; Mon, 20 Oct 2025 13:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnw-0008BB-NG; Mon, 20 Oct 2025 13:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1146289;
 Mon, 20 Oct 2025 13:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vApnv-0007gg-Jy
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:20:03 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c3c3917-adb7-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:20:02 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so3997894f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:20:02 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm15267835f8f.15.2025.10.20.06.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 06:20:01 -0700 (PDT)
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
X-Inumbo-ID: 7c3c3917-adb7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760966402; x=1761571202; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sCYEgDbMO50bkVM5mQCUFddDlyiUtxNrLBekHY3/xE=;
        b=qLwUIkMdbI1GiFV84GnRnx0Oj0AE8i4TA3eHS6h/skKz80vQfmi445T/EtwHEzUTas
         cOQFRSMiquLClsT6SXt/ossKHFfURdvMvDppWRk7FKgAzSPX8JK5aSvWzNtqj3sPrzCJ
         Yq0KFRhy+TZaDvpgMY6Eq9zeZn4v7zgoIKCcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966402; x=1761571202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sCYEgDbMO50bkVM5mQCUFddDlyiUtxNrLBekHY3/xE=;
        b=UGqwkpJvylVFHhrEg9b3J7dfv8veM2wsm5420GBHrSf9Ugj08aAhl2qDkOazM8jRgd
         uQZ9BWLYDSFmktC0qJ0E5/Zga6jy4qIkHJuxm/1V5bd92uBzLrOee0I5Di4xpcd6yRkS
         HtUEaqh5/iK/5O4fJEsLqRreMYeNUPiv9O/n03681gckl41OpIZEItOHpeTojctiHbWS
         czpPUfKyaTnhYNbUb3Jz2PFbRsusCwJo03ROpB/ZdBER/33QL4RmJTMxdTIDcgJ9/j7r
         nKFQtX09MSKrFd+9uyO0xErug8M7c0vosB1tmMC4wbXE74g6NrXtZu0gw8AZ+jiThheo
         oAyQ==
X-Gm-Message-State: AOJu0YxruX9IDQPnwYhROPK4hT03uHs1wcSvk0RxvLQWrydcGNuRaZvy
	3ug3i6hiV54Y/dy2Fta7POYXJywhVZoMQzJBj+kSVQungOZUG8CtIFw933P++cN5UjuJWPWtdBy
	tE7hE7L0CSw==
X-Gm-Gg: ASbGncuvwDQ1OOD3CW62Y1FnkAc++lKtQdQUIQktNJXICKePnmLqBrtKYnEXuPHMe/r
	t4tguMfWR0h13aPstxpbyjvaJz89ppth/WstiEYjVaRP6PY5No0D+v05rZ9AzLZH3u5I5R+8Ttr
	iDXhi/ZyvjnKAvjMUTI4TjcEhQ6J1iFkar5BN6zoDI9dsrT3GEmsgwFB/CUzxHI21AHxIgEvx0K
	KV83tNFiL/HwcJmm44WCBrG8bDTkrsGTNgbElJCgDPjWqSEXuCr4WhpERiM+1E4CJJiXN3CmvVu
	wPM2DGZMkJFGcVfG9wOarVTnmeMG6Ufd8gEqMi4afo4oaBABOOAtdqWxn3At+dJDa8bUZUYOzvj
	IL8P/toRxWq1tZTUJoXflWyuTjVB+FbL0TiNNOz9rxxGBFvMHT+VS+CnlbY1AbGUGL07+2PrVTd
	QJxHw+fC6cIT2bDOXGojRpSGo2GBtkdtFimlkeDgrD0z6Uqwj3UWc=
X-Google-Smtp-Source: AGHT+IGYT/rN2F18vBoC+pW1f/wS2gn1Q94YP1lnTzaJMcaQQIQM6eR0kcojLttKL9T2tL8wVI3onw==
X-Received: by 2002:a5d:5d05:0:b0:427:809:eff5 with SMTP id ffacd0b85a97d-4270809f252mr8584466f8f.53.1760966401644;
        Mon, 20 Oct 2025 06:20:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/5] x86/ucode: Abort parallel load early on any control thread error
Date: Mon, 20 Oct 2025 14:19:52 +0100
Message-Id: <20251020131955.2928261-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
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


