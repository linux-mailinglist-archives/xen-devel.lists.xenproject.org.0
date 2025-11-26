Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12DC8B29F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173272.1498335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7J-0003xl-OP; Wed, 26 Nov 2025 17:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173272.1498335; Wed, 26 Nov 2025 17:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7J-0003vw-Kw; Wed, 26 Nov 2025 17:15:45 +0000
Received: by outflank-mailman (input) for mailman id 1173272;
 Wed, 26 Nov 2025 17:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOJ7I-0003vq-Au
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:15:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a2e41f5-caeb-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 18:15:43 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso39975f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 09:15:43 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm40370605f8f.21.2025.11.26.09.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:15:41 -0800 (PST)
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
X-Inumbo-ID: 8a2e41f5-caeb-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764177342; x=1764782142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TN411ehaGiCJ946gDbcyauDPO/gV4MrQ/y3F4+B48Hc=;
        b=fGqsMoYb89HHe9cjvmtk/BTPjrDmR8+APzjwuTkVt0dlRF6KnrU+aFafouofbEiAU3
         gNjKzoykLQ/Qr5bCaZdTWZsN4O3EmR1z0u7VXJQS4RNumm3M09w7aYkQmyqO98dg38sb
         3fPJ1+6TKzA3934ZMDl842YoxmVOOE78tKtGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177342; x=1764782142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN411ehaGiCJ946gDbcyauDPO/gV4MrQ/y3F4+B48Hc=;
        b=r30TiToFTwR6+TBeWWoOgolRSWwCWexLQM8we9SXFqhENeNuly/eq2jZOI5Y+hAInx
         Mbi5LLcFqKWElava1s8X63oyPIaHko6lPoff8lmSvllgwA3vThzz6Z8M4Gyp1Tz02W2G
         EDzkDUHTk3EUA5tCypLzdn3U/dbrK4xhnDVp57WfIKG/wXxNV7HNKAn00wDmDYCYyfzg
         qoQyOFfKzRU5bqPiTrbWnHZWSRO5c8vYh9Ijh8HZqvGnXY8J4OWijzJNm8qhb+o1e9wf
         tkUyzzzBVnFbruGKJ+QSYtmUhY0vmrGgMieaXLdoR0mGw9hj57d8xnXUPzvccxtfn9AE
         hFCQ==
X-Gm-Message-State: AOJu0YwELJpbSfyBVOulZgErK5fH6/5W5zbg3j1eKrB5B4kv7InU9231
	Nxg1R2Oc4S+lv5MbKe5sR6RngzKbjgH9MKR7wX5wwa/iM2lqhrTm/bH/xmiq3XEyhdcPVQ2EWLC
	uxKVS
X-Gm-Gg: ASbGncv/queRc4oCdBIW7leNN761KNa8f2qPQn97eHgzQNBSQI7Q1o2gQkTMa9VSlpi
	aPEAA+EH8410TN8I5OkztINar69QoEPfgoPbZHCxiXibhACEK/eZ07z+IJoraBncbZzk8S1rplY
	7L1+RjPMHde7P+TbsBHY//Q2T9yxcWXv8V8LVmkAhPFfTDSn8owMobBpWEqi7DQMhfwKiR1X4Fh
	X3p2WJ9kK79rvB+RiW3RDqJ0gyUVTWRgy0Q/Pt2kOppe698Nq38AHjngqnSNzZIr1cpS6Tf+GWv
	NmMjdadhY2gTzn5p3ZBRZYweCmWX3TS8L/a5Gtokujy+ixx5lshfaIo8BhHjbYdLFA/QUsgk4kn
	Sir0IFOxPc4S/9VxRAofgu04MmshgPF/hi4jllMRDEK+O2F9jMjZ9Ao01r1ijpYU8P13oNOtfga
	9RBnzHrBcsTdaP2fQHJeIE+wllpWJeAsSmfE7/OgVuZ1CF9qK1DW+c+NSCKMzQFw==
X-Google-Smtp-Source: AGHT+IFoDJQBemm3FSSjyoUg2LQeMmJ0mSDDWYU5X6PA8YoH9Z8BvUIb556TNUJKXgrAgS30ZhMNrA==
X-Received: by 2002:a05:6000:2411:b0:42b:3131:542f with SMTP id ffacd0b85a97d-42cc1cbcfd6mr22954837f8f.24.1764177342494;
        Wed, 26 Nov 2025 09:15:42 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/3] x86/amd: Drop legacy logic
Date: Wed, 26 Nov 2025 17:15:36 +0000
Message-Id: <20251126171539.890253-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of this has been unused for more than a decade.  Some for a quarter of a
centry.

Andrew Cooper (3):
  x86/cpu: Sort headers
  x86/amd: Drop vestigial PBE logic in init_amd()
  x86/amd: Drop the cpuid_mask_* command line options

 CHANGELOG.md                      |   4 +
 docs/misc/xen-command-line.pandoc |  40 ----------
 xen/arch/x86/cpu/amd.c            | 126 ++----------------------------
 xen/arch/x86/cpu/centaur.c        |  10 ++-
 xen/arch/x86/cpu/hygon.c          |   1 +
 xen/arch/x86/include/asm/amd.h    |  90 ---------------------
 6 files changed, 19 insertions(+), 252 deletions(-)


base-commit: 08c787f66cced18f0d0afafd86a040341adbd031
-- 
2.39.5


