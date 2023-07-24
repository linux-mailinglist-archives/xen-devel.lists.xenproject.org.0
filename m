Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8875F7CB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568937.889153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHW-0002sx-LV; Mon, 24 Jul 2023 13:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568937.889153; Mon, 24 Jul 2023 13:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHW-0002mf-Ez; Mon, 24 Jul 2023 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 568937;
 Mon, 24 Jul 2023 13:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvAM-0005PS-1d
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:58 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd0dff1b-2a21-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 14:59:56 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-403c6a0f3aaso36357581cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:56 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:54 -0700 (PDT)
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
X-Inumbo-ID: fd0dff1b-2a21-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203595; x=1690808395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fKIbOA4RKJwyWZPk8ACAEU8hAgIi7aDz2OnDwWBK4c=;
        b=sJmOJLa6D8sdIdBTnex7aNKMckc6WIJrt9usf4u3RkUJVccqXlqyhw87KVlZScJNwM
         +51m4YeQitTJRMb7w1Q5jeJiOHRWfla5MyiamJhR9Gq+mxUy6jYBSclzG4rJZEXdNiSC
         WwYLFSwaAKlBzSs8mEtAEK9qQ6Se7lvGe6XqjupwVUlwDsWbPGya89hWpREkqNTyEeP1
         kkS+J7mk3Xt/EIILTVxNKSj3Nw+vLL4hUMErAk7Jd3uDYmLH2XQQ1AumXTXMYrffXflf
         W5kO2bEL569HFn/KkYjkVOeWDZwWMNkZ3w456Qk/nlSsC6hvC6NbUhRHwq+I7evy8CLh
         G0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203595; x=1690808395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fKIbOA4RKJwyWZPk8ACAEU8hAgIi7aDz2OnDwWBK4c=;
        b=lUPQAzhQRaMDwJQCV0pob6c0bBhHVliczXw3FEau799SAk/nQAGFBOFmpwRAvMAuYk
         dnLTPvJZI37sYIj5IV6RpE97Nu3/ndJikB+ArxMadhmOdQPkHwONeJDRB8pu70/4cjJ0
         fxW/PaOfIzN4cX7yG5HOCrxowlhrnAfoxX+BGC+4UeXCpFiSkWlwYXmIfIn6uDGdAcbR
         ZVb+WGH+FpGawvTHMX/T2GBxcoAgx4TMa0e5B6liL1RTplka+1PZgvFptbIdl1GGe5Iz
         LKBKA/qUVJYKhztsb6bpqKU4+l1DtXyNjmPndXXH0kb+qOwQgzHWob+iaY2IRZjL2KGz
         rPdg==
X-Gm-Message-State: ABy/qLa4Dip/ttpTsQ2BshdCVGd04YOr+UiX4jRM3jYwM5P6Y/gSGoz3
	GHyCyIR55Anl3dIii/GgNlDtKttOvOs=
X-Google-Smtp-Source: APBJJlEbLrveRL6h2ryVcasfzikm+AV07pIP3VCXOykFn11KDziFGr4vXORohvsOrSj19Cjav2oHFw==
X-Received: by 2002:a05:622a:1745:b0:406:a592:756c with SMTP id l5-20020a05622a174500b00406a592756cmr591717qtk.58.1690203595195;
        Mon, 24 Jul 2023 05:59:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v6 15/15] CHANGELOG: Add Intel HWP entry
Date: Mon, 24 Jul 2023 08:58:57 -0400
Message-ID: <20230724125857.11133-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
---
v3:
Position under existing Added section
Add Henry's Ack

v2:
Add blank line
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..8d6e6c3088 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - Add Intel Hardware P-States (HWP) cpufreq driver.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.41.0


