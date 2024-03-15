Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A587D09E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 16:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693915.1082591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nm-0006tK-9Z; Fri, 15 Mar 2024 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693915.1082591; Fri, 15 Mar 2024 15:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nm-0006pn-6W; Fri, 15 Mar 2024 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 693915;
 Fri, 15 Mar 2024 15:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ka1=KV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rl9nl-0006nS-7r
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 15:48:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86abc7b0-e2e3-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 16:48:54 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33e8b957a89so1454670f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 08:48:54 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 bw29-20020a0560001f9d00b0033ecaf7a2adsm3394689wrb.23.2024.03.15.08.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 08:48:52 -0700 (PDT)
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
X-Inumbo-ID: 86abc7b0-e2e3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710517733; x=1711122533; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6yTHZbvAYgPYQxhgozyTT9aLniHTdMU1NEg2rJApoQ=;
        b=mMTQU2bDAIFzLXorilqonjlKpzUlRTEYg9Sxh5K5puRFN8UhDRjl+1MUaOFZgIIXkn
         fk+6dpbSiHfrzkOvpeQQoUVpTLxQ0PKD4WDIcIIVl/YfQn2oVfZjBccUcgMUJlNXiw/v
         IvkcXetx+g5a1glzdXnJOm9H1KAxKZN+apHrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710517733; x=1711122533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6yTHZbvAYgPYQxhgozyTT9aLniHTdMU1NEg2rJApoQ=;
        b=G4YoGdfqgCuv8bOZkh6pPwEeCUs+lxUiaibJdExvmsT6bSb8ciDVNNXrITjFkqbfJh
         vhUGcOVqm2uMfxDYruMJIxwvpVOHRUlSQR85a6InfZcEq8o+hpuj/F0M5i4poqvdQuUy
         oZdpM7CR2WjTFf0kg++NFc5qOIn7B80EHmMdjQ7YVsbzh15GLrGvbViAqRfTkD96qFIn
         FNuc0g4dsQsPfszysMJBG3RUBGpJTEiPixxMxy8cAUepMnMJy8fn7vK5acOJNfkGBrfa
         fiVi/PsnwLxbDuHuhaeb9WuD7ReGw5gECFSTPXxCtXqJbbWfHrbPkahLItJl/bhsp4oT
         kkMQ==
X-Gm-Message-State: AOJu0YzL3F1vXkkGVxSx49S4v1vZz2h0kothoPXvxujiEhO1j0iDbTSW
	H76A1L0qUtpAkJ4Zqn8G/UCGRca3OpGr77bqGHnsgZW1ycR7eF6yx/QMTizRq5VsbVgI3Kw34EG
	p
X-Google-Smtp-Source: AGHT+IFTqUWpcn+teuUysKa+tyI2jjGO+7Xocq8aLMXMlR/EmcMAAgN2Cx1B/ge2Su8QE0+I3CG4nA==
X-Received: by 2002:a5d:64a6:0:b0:33e:c601:fcfd with SMTP id m6-20020a5d64a6000000b0033ec601fcfdmr3615824wrp.43.1710517733466;
        Fri, 15 Mar 2024 08:48:53 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH v2 1/3] make-fligh: Fix freebsd guest test test-id
Date: Fri, 15 Mar 2024 15:48:47 +0000
Message-Id: <20240315154849.28819-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315154849.28819-1-anthony.perard@citrix.com>
References: <20240315154849.28819-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current freebsd as guest tests rely on the variable $qemuu_suffix, but
that one may or may not be set yet, and can't be rely upon. It isn't
set on the first iteration which call test_matrix_do_one(), with
xenarch=amd64 dom0arch=i386, but it is on the second call with
xenarch=amd64 dom0arch=amd64.

Only flights on branch linux-linus and linux-6.1 are changes (and the
disabled linux-next branch). This is because the first call of
test_matrix_do_one() is with dom0arch=amd64 as we skip "i386". On
those branches, we have this changes in jobs names:

-test-amd64-amd64-freebsd11-amd64
-test-amd64-amd64-freebsd12-amd64
+test-amd64-amd64-qemuu-freebsd11-amd64
+test-amd64-amd64-qemuu-freebsd12-amd64

This patch will have the benefit to avoid the opposite changes in all the other
branches as we are going to make some changes to job generation.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 make-flight | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/make-flight b/make-flight
index d7eeb4eb..155a0c1f 100755
--- a/make-flight
+++ b/make-flight
@@ -248,11 +248,11 @@ do_freebsd_tests () {
 
   # NB: limit to amd64 ATM due to bugs with the i386 versions (11.3 and 12.1).
   for freebsdarch in amd64; do
-    job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd11-$freebsdarch \
+    job_create_test test-$xenarch$kern-$dom0arch-qemuu-freebsd11-$freebsdarch \
                     test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-11.3-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
                     all_hostflags=$most_hostflags,hvm
-    job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd12-$freebsdarch \
+    job_create_test test-$xenarch$kern-$dom0arch-qemuu-freebsd12-$freebsdarch \
                     test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-12.1-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
                     all_hostflags=$most_hostflags,hvm
-- 
Anthony PERARD


