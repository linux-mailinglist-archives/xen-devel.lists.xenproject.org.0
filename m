Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296001D6E80
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNq-0000is-Cb; Mon, 18 May 2020 01:15:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNo-0000hV-Tm
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:56 +0000
X-Inumbo-ID: 07e1f24a-98a5-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07e1f24a-98a5-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:15:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t25so6880035qtc.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCwSVJujwRWOjutOj30xLbizDFYlX19nLFDyw22sUns=;
 b=clGXf81c93iFGqR1y/RtvvItvqvPOhbA+FmgiQxUhdZlhEkkYn2syrKv5ZPQJEk+IN
 O2gjhOznfXPsj+2wUWRXNwDt+JztGTH+eWiedGrSUN2FUhxn59JdGBWg/eX61cZZvC+r
 TYBH1Cc5EBZSmHEBXlbDY5nlWlqn/eidiqL9PCms2agWxRHjMwDRS3EzklTuFBxAlAxe
 CJxjbaKZy1+oM9ef4bG5u4V/tgeyhmsPb0NXElg3zqi8v/PyC7jipiF7IpKQ8rn2b4hh
 7k6L52TCzhwSoHHvE9s0C0bJdvnAZrWzAFs2LLylamZRc7v9ZdgilLSURtKsZh/kaXKr
 3yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCwSVJujwRWOjutOj30xLbizDFYlX19nLFDyw22sUns=;
 b=Di65ci2a00IsEo7PGG9lMjjrtw9iaaNHAWH+QnYAze2QZ+B8FjBabxQvedVubaUlkl
 7ucka6ddNoui699Y4/6B1dR/6U8nIas3UP7ezYyg8F31dJdrtQZQQi6Kpd7EtYSM5Ghw
 l4Y+S0BpRSRLUbIEQnekvzXHS0xV5eIu9c0xH2FIFpbvU1TrVz67bVAlSOBGUxE9EM+T
 qVfsS/txXcmgxbVTfrFR04BruCPIRdH76ysm03sFlPAR/G6BS04bfMClwmf0jh10WHro
 kiK9/LFrn8WqamMh83rdCvao8ToFITLK17Ga5z+kGKZwb9/+DKNFmrQZonTDgXOB0gvf
 2WVA==
X-Gm-Message-State: AOAM533aV4ElP+iGSVDlu47b9vMctjaR8puCR6xuRIqx1Wsz5YTPqk44
 No4C3pa/G8aLyZvjWUCnoYr+yxY9
X-Google-Smtp-Source: ABdhPJwRgYFeQW6kaOEMq6bJv7CT3RQV1W1zjZVD+QBsX7wPgZz8r/hS+DwbKYVpJD6MGi1xcACtXQ==
X-Received: by 2002:ac8:4e53:: with SMTP id e19mr13905188qtw.277.1589764514556; 
 Sun, 17 May 2020 18:15:14 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:13 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 15/18] libxl: ignore emulated IDE disks beyond the first 4
Date: Sun, 17 May 2020 21:13:50 -0400
Message-Id: <20200518011353.326287-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Qemu supports only 4 emulated IDE disks, when given more (or with higher
indexes), it will fail to start. Since the disks can still be accessible
using PV interface, just ignore emulated path and log a warning, instead
of rejecting the configuration altogether.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index fb87deae91..3356880346 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1894,6 +1894,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
 
             if (disks[i].is_cdrom) {
+                if (disk > 4) {
+                    LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 4 disks.\n"
+                         "Disk %s will be available via PV drivers but not as an "
+                         "emulated disk.",
+                         disks[i].vdev);
+                    continue;
+                }
                 drive = libxl__sprintf(gc,
                          "if=ide,index=%d,readonly=on,media=cdrom,id=ide-%i",
                          disk, dev_number);
@@ -1971,6 +1978,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                                                        &disks[i],
                                                        colo_mode);
                 } else {
+                    LOGD(WARN, guest_domid, "Only 4 emulated IDE disks are supported.\n"
+                         "Disk %s will be available via PV drivers but not as an "
+                         "emulated disk.",
+                         disks[i].vdev);
                     continue; /* Do not emulate this disk */
                 }
 
-- 
2.25.1


