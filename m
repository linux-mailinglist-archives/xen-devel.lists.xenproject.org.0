Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A69B51AD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827798.1242539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmC-0008Ma-8c; Tue, 29 Oct 2024 18:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827798.1242539; Tue, 29 Oct 2024 18:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmC-0008JZ-4z; Tue, 29 Oct 2024 18:17:08 +0000
Received: by outflank-mailman (input) for mailman id 827798;
 Tue, 29 Oct 2024 18:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qmA-0007bP-Ja
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff2a356-9621-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 19:17:04 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so8915022a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:17:04 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:17:02 -0700 (PDT)
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
X-Inumbo-ID: fff2a356-9621-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZmZjJhMzU2LTk2MjEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI1ODI0LjU0MDE3Miwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225824; x=1730830624; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHAv65UQuL06AhRkdwzzFlLaL52D2s2KboSCcDG7zeM=;
        b=TArfiwbS9nbsL7F+MRQ3vbeYPKAzRQotIeRXeO9srWia2lNA7Ej0rNKVtt6EmjtxiR
         ZsUua7gJvYV4a6ZFZy7KtuZmOBC4n2qUnTFwBJa6Pu+yy/ZJJ7kZF4CVmtOHvSFKs+sE
         seJqoB8a6gq0j76cVfOwlDxUvM5obcL2y6J0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225824; x=1730830624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHAv65UQuL06AhRkdwzzFlLaL52D2s2KboSCcDG7zeM=;
        b=To7tI4qx0tf3gHQns3JU/jheov2bHwPLrOpo1opHWuLrdR/3nIfJMilg9ISegTnHMF
         GvWceJ7R00S8OVjFKfJL0vxCsyII2vG14FnWxV2HgqCs94X8kwE5zq3vHoOnczhPh334
         IW7Pt1HS+7CdLa4Dgu3geayH91pccsv9ITkXudH5MOpNwcXiUfqh/qu8Lm8LVaLWh6s9
         +Jc/uPLviz8O1GgdS0gR0q1OT+5k40Cv1ifJZhxvgrOJrULmdPUSLb47GupEeu4/E0iN
         dXtgjsrXGLwRTiL+WjbekmNGzBrXEkwOJ4oDVvARDXBPAiyxk9cl3tbnISJMe7SSLwIk
         ODtA==
X-Gm-Message-State: AOJu0YwD1cdUi5W1RmqRQx8Vzww4YgugCZsWBweol6ejMkY6555wwmke
	trIh/5X4CskDUf3dXupJBTkBkGuhzdY6xUCWNfC0KWddlW8awEhvKp4bDlLzMHJe68BYcQLdRnI
	P
X-Google-Smtp-Source: AGHT+IErQd444FdPqZO2+7ts6pDj6/aAmff0PJVyNCwIPnwZmCmruAN8E3QKWv8wfFL/vcBlkv5XmQ==
X-Received: by 2002:a05:6402:3513:b0:5cb:6272:1585 with SMTP id 4fb4d7f45d1cf-5cbbfa786d2mr11002803a12.32.1730225823743;
        Tue, 29 Oct 2024 11:17:03 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH 3/6] tools/ocaml: Rename grant_opts to grant_version
Date: Tue, 29 Oct 2024 18:16:29 +0000
Message-ID: <20241029181632.69600-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and remove the macros that no longer exist.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c78191f95abc..c4d34ca48753 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -223,8 +223,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
-		.grant_opts =
-		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+		.grant_version = Int_val(VAL_MAX_GRANT_VERSION),
 		.altp2m_opts = Int32_val(VAL_ALTP2M_OPTS),
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
-- 
2.47.0


