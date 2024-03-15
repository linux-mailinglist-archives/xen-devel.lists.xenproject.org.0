Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2087D09D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 16:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693917.1082613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nn-0007ML-Of; Fri, 15 Mar 2024 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693917.1082613; Fri, 15 Mar 2024 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl9nn-0007IH-KS; Fri, 15 Mar 2024 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 693917;
 Fri, 15 Mar 2024 15:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ka1=KV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rl9nm-0006uT-J0
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 15:48:58 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 889fef52-e2e3-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 16:48:57 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33ed4d8e9edso418018f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 08:48:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 bw29-20020a0560001f9d00b0033ecaf7a2adsm3394689wrb.23.2024.03.15.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 08:48:55 -0700 (PDT)
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
X-Inumbo-ID: 889fef52-e2e3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710517737; x=1711122537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSG7P4fI+ffI86jlOgtGbDAtFP5aasyP8dl1KHYjsJ4=;
        b=S6BeMBhXrqyNVsIsjw1vyLs3HKmbiN2YzcI+Mjx/5Xm3xaWvUxmvhNVmp651x8SpdH
         NPthCu92ndkyGFMXGIi1jsLsUnG34OnjVf25q2owB7KAX8XL2wC2G4Xpa3cHjt0nqEKw
         29+ud0wa3mNA3GFfkFcLNdOgjfxMSyeZGcank=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710517737; x=1711122537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSG7P4fI+ffI86jlOgtGbDAtFP5aasyP8dl1KHYjsJ4=;
        b=nqpHdfwpPv9CNsN0VgQZBxM7pGlg/oSXxKzKAUbsZGGcbLyPpcP0RZ862G9wtx5NA8
         bZufOVjEbXOiNFdqKz1O2g2S6qQjQ+MYCLkYLXIIi+g3Uyd85OgjtbaD+WSgPoVyqEKp
         7zgJ4QGVexMCIqaTyLhN4n2QZPQWm/Betdj+pzCdSGA045ZVFj9GYZxIBiF+Jxg13GT/
         M1QFfg2CNOKERcR70jbPzO3wT2ij2w8Y/VPI+mpgPV8Zd4H/+PpIRrUVe1k2EMZJNU47
         +TZS0R71QyUwNRxdWyl8/nYfNMmYtK6Hit/TqmpSAy72pBmr2Pdb7ADPxScAfMKzJWF6
         a3OQ==
X-Gm-Message-State: AOJu0YzqOjKcMt7/i378Jm5/YVSWy3uF41DOSH7u8XlsIaSxkPQPBCq+
	tG/HSFqxpIbWZBSImHfqsaE6//agBiMLlqvNdwKW/JpaNyrUy5W9Vcz1gz0k5/0QGCU6xU8Z3gF
	C
X-Google-Smtp-Source: AGHT+IFQzLoBakuE4e4ZmqxbkuXP4H1B4R13QRj/UFxClVBf7R4LSuwX6fNc/0nYNv6w86hkU9C9BQ==
X-Received: by 2002:adf:ee0f:0:b0:33e:7946:4cc8 with SMTP id y15-20020adfee0f000000b0033e79464cc8mr3851476wrn.19.1710517736806;
        Fri, 15 Mar 2024 08:48:56 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [OSSTEST PATCH v2 3/3] ap-common: Switch to Linux 6.1 by default on x86 + drop dom0 i386
Date: Fri, 15 Mar 2024 15:48:49 +0000
Message-Id: <20240315154849.28819-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315154849.28819-1-anthony.perard@citrix.com>
References: <20240315154849.28819-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux-4.19 branch in xenbits is outdated, it haven't been updated and
tested since 2020 as it has been disabled in osstest. Also, this 4.19
branch doesn't build on Bookworm.

So we will start to use a newer version of Linux. We switch to 6.1 for
the Arm* tests recently, so will use that same version for x86.

Also, following commit 3a3089c94913 ("mfi-common: Drop Linux dom0 i386
tests for newer Linux branches"), 32bit dom0 isn't tested on newer
Linux, so we need to drop all dom0 i386 tests wherever the default
linux branch is used. That is, this changes in jobs will apply to
"xen-unstable" branch but also all xen stable branches, seabios, qemu,
osstest, libvirt, so every branch that aren't "linux-*".

Here is the list jobs that changes, and whether they are replace, or
have existing equivalents, on the "xen-unstable" branch. Changes
compared with:
    OSSTEST_CONFIG=standalone-config-example nice eatmydata ./standalone-generate-dump-flight-runvars

Gone, without exiting or new test-amd64-amd64-*:
- test-amd64-i386-freebsd10-amd64
- test-amd64-i386-freebsd10-i386
- test-amd64-i386-qemut-rhel6hvm-amd
- test-amd64-i386-qemut-rhel6hvm-intel
- test-amd64-i386-qemuu-rhel6hvm-amd
- test-amd64-i386-qemuu-rhel6hvm-intel

Gone, but with exiting test-amd64-amd64-* equivalent:
- test-amd64-coresched-i386-xl
- test-amd64-i386-examine
- test-amd64-i386-examine-bios
- test-amd64-i386-examine-uefi
- test-amd64-i386-libvirt
- test-amd64-i386-libvirt-pair
- test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
- test-amd64-i386-libvirt-xsm
- test-amd64-i386-livepatch
- test-amd64-i386-migrupgrade
- test-amd64-i386-pair
- test-amd64-i386-xl
- test-amd64-i386-xl-pvshim
- test-amd64-i386-xl-qemut-debianhvm-amd64
- test-amd64-i386-xl-qemut-debianhvm-i386-xsm
- test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
- test-amd64-i386-xl-qemut-win7-amd64
- test-amd64-i386-xl-qemut-ws16-amd64
- test-amd64-i386-xl-qemuu-debianhvm-amd64
- test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow
- test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
- test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict
- test-amd64-i386-xl-qemuu-ovmf-amd64
- test-amd64-i386-xl-qemuu-win7-amd64
- test-amd64-i386-xl-qemuu-ws16-amd64
- test-amd64-i386-xl-shadow
- test-amd64-i386-xl-simplat-amd64-buster
- test-amd64-i386-xl-xsm

Gone, but replaced by a new test-amd64-amd64-*:
- test-amd64-i386-libvirt-qcow2
- test-amd64-i386-libvirt-raw
- test-amd64-i386-xl-vhd
+ test-amd64-amd64-libvirt-qcow2
+ test-amd64-amd64-libvirt-raw
+ test-amd64-amd64-xl-vhd

In any case, the list of test would be the same as for the existing
branch "linux-linus" or "linux-6.1" branches.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    CC: Jan Beulich <jbeulich@suse.com>
    CC: Andrew Cooper <andrew.cooper3@citrix.com>
    CC: Juergen Gross <jgross@suse.com>

 ap-common  | 2 +-
 mfi-common | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ap-common b/ap-common
index 48a95a22..5384891b 100644
--- a/ap-common
+++ b/ap-common
@@ -59,7 +59,7 @@
 
 : ${PUSH_TREE_LINUX:=$XENBITS:/home/xen/git/linux-pvops.git}
 : ${BASE_TREE_LINUX:=git://xenbits.xen.org/linux-pvops.git}
-: ${BASE_TAG_LINUX:=tested/linux-4.19}
+: ${BASE_TAG_LINUX:=tested/linux-6.1}
 : ${BASE_TAG_LINUX_ARM:=tested/linux-6.1}
 
 if [ "x${TREE_LINUX}" = x ]; then
diff --git a/mfi-common b/mfi-common
index 00669677..6dc39422 100644
--- a/mfi-common
+++ b/mfi-common
@@ -662,7 +662,7 @@ test_matrix_iterate () {
 
         case "${branch}_${dom0arch}" in
           linux-5.4_i386 | linux-[2-4].*_i386) ;; # keep 32-bit for old linux
-          linux-*_i386) continue;;
+          *_i386) continue;;
         esac
 
         dom0arches+=" $dom0arch"
-- 
Anthony PERARD


