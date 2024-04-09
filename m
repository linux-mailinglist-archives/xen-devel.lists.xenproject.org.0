Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B4989D6F7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 12:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702221.1097113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8j7-0006yh-N9; Tue, 09 Apr 2024 10:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702221.1097113; Tue, 09 Apr 2024 10:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8j7-0006wJ-KQ; Tue, 09 Apr 2024 10:29:17 +0000
Received: by outflank-mailman (input) for mailman id 702221;
 Tue, 09 Apr 2024 10:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkVj=LO=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ru8j5-0006wD-VQ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 10:29:15 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027a43fa-f65c-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 12:29:14 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3c4f23d23d9so3280726b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 03:29:14 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05620a056a00b0078d72553055sm286856qkp.11.2024.04.09.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:29:11 -0700 (PDT)
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
X-Inumbo-ID: 027a43fa-f65c-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712658552; x=1713263352; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6T7p+yBCbobXeswh/y6mad7boHlk/WeEpWE6wrxto4Q=;
        b=Aj80E1LkNUAqYbCAjcczXU2xnhdny/cGNjil1p/3zcnrcfy/rMjsqI5Sf1R9L6w3gW
         lQ5diX13ws3/jgj+oA+P+F58GsfA1W5ZRcfS4mxcgQu73F/X45lWQjNHE6f3dxIipUox
         YlkQSbjN1eEeb+1m/yfw6yYjFPXbKJ2/nRx/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658552; x=1713263352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6T7p+yBCbobXeswh/y6mad7boHlk/WeEpWE6wrxto4Q=;
        b=h7cHNZh/suSuwx0MTwbcldRVI0ogTIJgNwVI8hKmVskkodPqA9iRQ8KrEp4DcOTjTm
         7Kgw89OjGkbO5yhwNZW+iemnM/4XzUJlh/rfTkG/CGkGT60lZmpuwajxWtU/3Mn+uh8Q
         6XK8anh1/904NpgpmSB3TI97mbceDUo7G/D5AUgDNmca/ghCTidTBWNZIuYxB3+1JxyV
         nTgIRgRRCBXmRdVQLubauWJbljiD2q4SLBzjpvBazT2WXQZ3s54GJpw5VG24FO64j9cH
         MuM+nkeRPLGpphVZ3WChWWj+3JU3BgP2N4rjz829WMfY64Rwb9t2scGeVaLqDCQjdCRO
         +ZOA==
X-Gm-Message-State: AOJu0YxEH1U7R7dSHn+ehwdQOss8Ac8KNF3duSjIoqzs7LTivBb5zvAR
	xdzFuUzMBYnV7GjVEAB6ztwiPjq7yVRhfeI1zP+Sj8B1PXyw0m+pAXZDPHxe1+Bf1/CmMIVJBAQ
	9HA==
X-Google-Smtp-Source: AGHT+IFk9Bh2c3/vAYeK+lx4uAizYElxGTnahYoxJa3uhzPgJ60WMpSOQWNLNgFf1hhJrl+sWMDtQw==
X-Received: by 2002:a05:6808:1303:b0:3c5:ed2a:f06 with SMTP id y3-20020a056808130300b003c5ed2a0f06mr9437859oiv.33.1712658551928;
        Tue, 09 Apr 2024 03:29:11 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Konrad Rzeszutek Wilk <konrad@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: Update livepatch maintainers
Date: Tue,  9 Apr 2024 11:32:07 +0100
Message-ID: <20240409103208.1641887-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove Konrad from the livepatch maintainers list as he hasn't been
active for a few years.
At the same time, add Roger as a new maintainer since he has been
actively working on it for a while.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bd22fd75f0e..4bc45ded4130 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -395,7 +395,7 @@ F:	tools/include/xentoollog.h
 F:	tools/libs/
 
 LIVEPATCH
-M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
 M:	Ross Lagerwall <ross.lagerwall@citrix.com>
 S:	Supported
 F:	docs/misc/livepatch.pandoc
-- 
2.43.0


