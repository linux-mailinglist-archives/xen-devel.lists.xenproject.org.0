Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F0B10ACD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 15:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055954.1424201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uevYG-0000ot-HN; Thu, 24 Jul 2025 13:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055954.1424201; Thu, 24 Jul 2025 13:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uevYG-0000nE-E7; Thu, 24 Jul 2025 13:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1055954;
 Thu, 24 Jul 2025 12:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vfsy=2F=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uevYE-0000n8-Jp
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 12:59:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19bcb9e6-688e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 14:59:57 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45611a6a706so4550275e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 05:59:57 -0700 (PDT)
Received: from localhost.localdomain (206.158.115.87.dyn.plus.net.
 [87.115.158.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870532b43sm19744915e9.2.2025.07.24.05.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 05:59:56 -0700 (PDT)
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
X-Inumbo-ID: 19bcb9e6-688e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753361997; x=1753966797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki0VSOY3hDWJetKULUGjRRw/xBb1b1hhABQXxGIZ4NA=;
        b=Al7cxhMm6vi4RjbgBsD8/0kRp0ggUw8I8au6WAjI8eSH1hn8jT5mf0ZhBGRcXxxXrI
         WbLgp630jy0jorxWRSZlGugJ6Llnk2UvA1rOPQ3jmvWo1+nTkzc2P/iLNJV43Sahoe1n
         qdzb18GNK1DcCYBejW9n8tcgbrpo7HCtboyoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753361997; x=1753966797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki0VSOY3hDWJetKULUGjRRw/xBb1b1hhABQXxGIZ4NA=;
        b=dMLQAevEptryYAbWhFCWgxBFs63CRu1qSDMaaxEMahywzFto8DzMzbTLAZCH8OZRrt
         w1BNp+Q8JzXVUVIbHRSxVsD8RRv/hGyTFHkVllr/BONV7T5rJsuSvMUTfVmqJx+TKSLO
         6p8JmlXrnpiGr51hh26rceYpiRYFPksg5CpkY+m53PPgIEqi3+DVHS2WxSyprPHOlX/I
         SWK0fF1GKOzh0q1Cc+bozgXIWzW5Uf4Ot0gdYCkv2qf65SHaqdr1FTYTfWl6sezP/L8h
         d7k15V6CvMer0EGM8c5qdYvmE2fd9KnUFJMa8X9MLjGWHsU/UrAYldMEzB17x8onRbGK
         lkRQ==
X-Gm-Message-State: AOJu0YxbS8OUxm8ka2sXr4/ZRVI4ouLhDbbgj/SqLTWHcxNdddH1rTVs
	rL/M6T0q7Z2KOTfFZqRUmROXuMy5CpoRKHVhc0MaomThCl7rQdpvIkkkjCPa/yStgnoNqcfkL9j
	dzL9K8pc=
X-Gm-Gg: ASbGncv9wlzuzEg2/bf4syEYfPShgz9dQQyDe2z6f6h/Qe/7u7pm2WIdX8bS/dC4IdU
	iJqmeBD8xd6nhF4eqiG+1bEP/2Wh7gTyFaNJ8RgZBTgIUPWIfk/xHSwKeJTLhObJ9FwORVm3DBB
	YCaSgjr87e96NM0idpKEpzKzBKn9o9IVoWqBCPWqBR8UU+NyeYfgkowztLedjY5kZH1fR/cOz+4
	cJNcNLpleY4rvArRf/woGeDIczoILI3+7T+h3KjoNQEWoXfVXxd/Inda1/ZT7/nNfIUQdV2y2S/
	MZe0WPTknG2aweLJ2s/UAnWMg5FGgyk4O3IEK6Ws1s1/CNsrZqYXxf/NuQq98DrqswE0tkqPkYL
	oHvfM8BpUQrZ4ACZ3gt53UQenbMRrciBJgX/zzDZD3QW4SM0rULAFNbS5L3Fx7PCbX5+oOVB2FN
	OlbITP/w==
X-Google-Smtp-Source: AGHT+IFO5O3ZhXoDy7KF4wyQBMnpL9nEREcGGCsKrnjmyWvKyZABuaU9VI92XbjopOGv7hiwJ5nd4w==
X-Received: by 2002:a05:600c:3ba0:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4586f93391cmr19089785e9.7.1753361996849;
        Thu, 24 Jul 2025 05:59:56 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH livepatch-build-tools] livepatch-build: allow different build ID length
Date: Thu, 24 Jul 2025 13:59:48 +0100
Message-ID: <20250724125950.31849-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of the build ID for a PE file can be different from
ELF one, specifically 16 bytes instead of 20.
Allows to embed arbitrary build ID lengths.
The Xen ABI for retrieving the build ID allows arbitrary
lengths too (for instance see "xl info").

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 livepatch-build | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/livepatch-build b/livepatch-build
index f3ca939..11cbeec 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -192,6 +192,11 @@ strip_metadata_symbols ()
     strip "${STRIP_CMD_OPTS[@]}" "$FILE"
 }
 
+function gnu_section()
+{
+    perl -e '$d = pack("H*", $ARGV[0]); print pack("VVVZ*", 4, length($d), 3, "GNU").$d' "$1"
+}
+
 function create_patch()
 {
     echo "Extracting new and modified ELF sections..."
@@ -245,10 +250,10 @@ function create_patch()
     fi
 
     # Create a dependency section
-    perl -e "print pack 'VVVZ*H*', 4, 20, 3, 'GNU', '${DEPENDS}'" > depends.bin
+    gnu_section "$DEPENDS" > depends.bin
 
     # Create a Xen dependency section
-    perl -e "print pack 'VVVZ*H*', 4, 20, 3, 'GNU', '${XEN_DEPENDS}'" > xen_depends.bin
+    gnu_section "$XEN_DEPENDS" > xen_depends.bin
 
     echo "Creating patch module..."
     if [ -z "$PRELINK" ]; then
-- 
2.50.1


