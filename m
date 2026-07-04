Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6tJ+O7LvSWoK8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 07:46:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7970F709198
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 07:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ECvd+FOX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F9Sa7nuu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1354505.1609823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgFfo-0003lh-32; Sun, 05 Jul 2026 05:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1354505.1609823; Sun, 05 Jul 2026 05:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgFfn-0003c6-QD; Sun, 05 Jul 2026 05:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1354505;
 Sat, 04 Jul 2026 18:33:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wg5BL-0000TD-AU
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 18:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wg5BK-00FG0u-NW
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 20:33:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a495175-2eae-0a2a0a5409dd-0a2a450bc548-44
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 20:33:38 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a495200-ac48-0a2a450b0019-cddca8839570-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 20:33:38 +0200
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 664G9WPj3297017
 for <xen-devel@lists.xenproject.org>; Sat, 4 Jul 2026 18:33:36 GMT
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txeh9af-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 18:33:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-847a5f03ff9so2434578b3a.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 11:33:35 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 11:33:34 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=; b=ECvd+FOX6m7m+uK6
	znPdHfToJCGz5vNdP6tV4GzW8+gWG/emNUZmGO/Rxywzfrha5unEY40pl2LXO59h
	7JXv5BMnvdyYquNsxkHqexO5Aqt/ozoQqMvQZkR6SmIcjSk/KX09cknpXg/SmD4y
	hP6befM9yAWltSsaHmCWvED4/fNXwWB77sN5NX05AUqZLG70NP16/tIDoYPnLcE2
	EH04DJfiCX6/0wgXIsEVPx0mePP3/mRq6UkdeWFfub4bU+t6MlFqgUKWB0nt0To0
	f3F3hcil7VXRNQY8Rzd+7aj/3W2ujxhjIQiNl0U335fTz9dmXSjkNMM560EDCcCr
	drpp9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783190015; x=1783794815; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=;
        b=F9Sa7nuuQnAYqH7xFofM6yESxTHbbVY9eCwc92We3Fzrkv421cKAgXOCZF5tOB/XSI
         W9CZE3SustKvWizkxiuoej9xh31H1cDqdfj6/V3lEfizzgANAGpCHOhcn0WyGNLwGdWo
         OMZCoRyaBcHsdYY3XKxvU5JxMjFaVlb4SHzBI00NOUyGfqGgV5T6gIvDGiyiI8rI7CNq
         mARyTpwJ5iBBVpqWuS8/thEPg+0Fa09jP9VmGV8whNOrkuwcmBBxZO27QQ5E8VIwk8kd
         60mBnsJANPoPzchq+rRqlj72e934Dwjqq+5sZoVMjYCvRdtQaFJI9wzNoCvxSXhnWY2B
         Lp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783190015; x=1783794815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=;
        b=jnSiBCvuQlYH/I+7f70LZPV/iH8gFGMezKSnOwxcAO+CMbi86jluRZfEDulyTCeWzy
         EkKBF5XbnHt7Qp/kUsqv7eAE55H3wfkHbGpefkZkj4dDasvFIdQNNWFEBMv4ydR8lWLG
         VEYsMnSyelfN8O4pMNW9I1pIoP+NHKZfCDowowfNry4ma/AxIbLHRflPYoM3CjJg3JEa
         5KdKaqV3opB17FUVrwv/X9K4koK14udp9bTzuzAxdqSOrO6rfbxZVrsDI7X+oM1X04xm
         EPbrkWit0i89ou5cw4FseyGKEjo3FlthbkaXPF2kAzMuhuApEj4brXd0RxsRRJClfV+m
         ilCg==
X-Forwarded-Encrypted: i=1; AHgh+RpDQblaKatYQsrNYLO3gl6wCuAmoQCxtI8d77Yrwltp6lBIVdBa3zOkuIuGP0LhS3/GAa0isyUjp1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFh0avF5e0uagowXOyiHrldYea7z8OoOFwZKf2ozzEfEPgVxh1
	8ONGJb6Z/ys3LA5hQ/xDdgVLEHgn/nZv5iF51CSbaEKh9xHIKrUL2jPdjLowq6ZbSEMXzHs5x57
	C/mk6Zfxt1M48mgv4LCN8Z9yPaUTzLyig/cdIHs3tdaN+/C+FEOtxksfgSkDMemwfKFUiVA==
X-Gm-Gg: AfdE7cnUm2caicAX1i0koy0q/YeOcPAzX1dLcwzlf47JY6wbZ59Ddglov8cELUSMFT8
	ruyaga+qLS8SHwARd0ufcXJ8Hf2pJyWWntoN3g/MWR6FHipBV5ZnQJERHhrdldPjeKFA9xRaME+
	r1pZNsTmxfsjPeVFIC68Hs1OgBWFP4yn3cm/AcwbfmPpawUuAiyk4VSaid9VPzOu8siTCMB7xzG
	H/muyAhIeaDwG6lhJQLXz8V9Uh1vbYlcLuQMhylZf+LzJsGz1PC/S0Dq2KA/5aXA/jiISV0WSzV
	tIu9k/kxSb996vqr1QlbRUlQo1pKj3eUvCAUAdY99vG16tKhZ83QzgiNhh6nv/aEptdqCbPFO3p
	ZZDErrh5sncDDv2x6PZyP8+A=
X-Received: by 2002:a05:6a00:a16:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-847f6da5228mr4452846b3a.16.1783190015056;
        Sat, 04 Jul 2026 11:33:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a16:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-847f6da5228mr4452818b3a.16.1783190014533;
        Sat, 04 Jul 2026 11:33:34 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:18 +0800
Subject: [PATCH 9/9] drm/xen: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-9-b4e1ca053623@oss.qualcomm.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
In-Reply-To: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=11508;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=jES7nUSVZBQKhOgvari+mSaMEA9hK9OzE4xbZwzc1Wc=;
 b=naeMyylZbpop3bZogsF4t3ncusoDzSV5MAr4bFahQ9OZoV1nX45pewAGKcoP51qwspHbJK4qL
 CrLEMD+vWkoAPiK+s51b/vLkl6FeLtlnVwJdSWw0mdLqi6JOcjJSi+K
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX0Xj/jnUUp/62
 Bafa9fYODJGol11FijNUHbFoWbOcvPMwI8GWcZZrkJLS9JwnI41MzEnT6HOthzgSP39mZ9somDD
 w9iXC8YOIF3vbgcMmUhh5Q2loxarCKc=
X-Proofpoint-GUID: Pky9oHoAmLYta_G7XAI62vJEzaumE8jT
X-Proofpoint-ORIG-GUID: Pky9oHoAmLYta_G7XAI62vJEzaumE8jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX14NgNhSZkI5n
 sg7y2E/2YiO87MMcedZhn74/K73zKpGzKgY62K4OmhCpfvvn9tSWCDbZFhujwS/NzjnYDpdP1tB
 xDpJvgChRU1lL1b4th0MTZewz65ceQbR1KiKR3gq7NYfIgRlesYuvc5lsAAK1rbn8poz2NIq/cM
 WAfyk5EEb+F83nn2w5xpG/ze95ovPCFBL7uS6IOyvKrz/mA7ZlRJkrXPkFPxTuI2txWwluDyELv
 wq78uVKDLn4SwuFwBuhUMWcZSuyOMbLIoC0paUEChCJSPrAeJu78ZXuq4HqUOrf8xt3AsZ4GIQ0
 Q3G4PHx/7GZaBVYuCHB95B1d2KwESke2EnQ+bPOLbwRv3lA6tME0l3D14+YwJ+i67IbzU6JWWFq
 hvJeTJmMPWlYmObuXFnkFYWWJe+QUSvKuuHTuDdntW3MiYV8JUEgPno/ER2p746vLwCDaBxPbQe
 lQfPZPXtMNkqBdiu1uQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4951ff cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yt2wVW2Sl_HzNKkdQ3QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192
X-purgate-ID: tlsNG-42698a/1783190018-A653B220-E7A2FDE8/0/0
X-purgate-type: clean
X-purgate-size: 11510
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:ze.huang@oss.qualcomm.com,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[synopsys.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7970F709198

Replace Xen frontend simple display pipe with explicit plane, CRTC and
encoder objects for each pipeline.

Keep generic plane-state validation before Xen-specific checks, and
install GEM framebuffer prepare helper explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/xen/xen_drm_front.h     |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 177 ++++++++++++++++++++++++--------
 2 files changed, 138 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index a987c78abe41..02138b5abef5 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -14,7 +14,7 @@
 #include <linux/scatterlist.h>
 
 #include <drm/drm_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "xen_drm_front_cfg.h"
 
@@ -100,7 +100,9 @@ struct xen_drm_front_drm_pipeline {
 
 	int index;
 
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	struct drm_connector conn;
 	/* These are only for connector mode checking */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 48772b5fe71c..57e1bef452f8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -31,9 +31,9 @@
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
 static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+to_xen_drm_pipeline(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
 }
 
 static void fb_destroy(struct drm_framebuffer *fb)
@@ -94,7 +94,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
-	struct drm_crtc *crtc = &pipeline->pipe.crtc;
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -105,17 +105,15 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-static void display_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline = to_xen_drm_pipeline(crtc);
+	struct drm_plane_state *plane_state = pipeline->plane.state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
@@ -131,13 +129,13 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void display_disable(struct drm_simple_display_pipe *pipe)
+static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = to_xen_drm_pipeline(crtc);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(crtc->dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -177,12 +175,13 @@ static void pflip_to_worker(struct work_struct *work)
 	send_pending_event(pipeline);
 }
 
-static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
+static bool display_send_page_flip(struct xen_drm_front_drm_pipeline *pipeline,
+				   struct drm_atomic_commit *state,
 				   struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *plane_state =
-			drm_atomic_get_new_plane_state(old_plane_state->state,
-						       &pipe->plane);
+			drm_atomic_get_new_plane_state(state,
+						       &pipeline->plane);
 
 	/*
 	 * If old_plane_state->fb is NULL and plane_state->fb is not,
@@ -193,8 +192,6 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	 * sent to the backend as a part of display_set_config call.
 	 */
 	if (old_plane_state->fb && plane_state->fb) {
-		struct xen_drm_front_drm_pipeline *pipeline =
-				to_xen_drm_pipeline(pipe);
 		struct xen_drm_front_drm_info *drm_info = pipeline->drm_info;
 		int ret;
 
@@ -224,10 +221,30 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible)
+		return 0;
+
+	if (!crtc_state)
+		return 0;
+
 	/*
 	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
 	 * DRM helpers assume that it doesn't handle vblanking and start
@@ -242,15 +259,19 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void display_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *old_plane_state)
+static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc *crtc = plane->state->crtc ?: old_plane_state->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline;
 	struct drm_pending_vblank_event *event;
 	int idx;
 
+	if (!crtc)
+		return;
+
+	pipeline = to_xen_drm_pipeline(crtc);
 	event = crtc->state->event;
 	if (event) {
 		struct drm_device *dev = crtc->dev;
@@ -265,7 +286,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +299,19 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	 * If this is not a page flip, e.g. no flip done event from the backend
 	 * is expected, then send now.
 	 */
-	if (!display_send_page_flip(pipe, old_plane_state))
+	if (!display_send_page_flip(pipeline, state, old_plane_state))
 		send_pending_event(pipeline);
 
 	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status
-display_mode_valid(struct drm_simple_display_pipe *pipe,
-		   const struct drm_display_mode *mode)
+xen_drm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode)
 {
 	struct xen_drm_front_drm_pipeline *pipeline =
-			container_of(pipe, struct xen_drm_front_drm_pipeline,
-				     pipe);
+			container_of(crtc, struct xen_drm_front_drm_pipeline,
+				     crtc);
 
 	if (mode->hdisplay != pipeline->width)
 		return MODE_ERROR;
@@ -301,12 +322,55 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static const struct drm_simple_display_pipe_funcs display_funcs = {
-	.mode_valid = display_mode_valid,
-	.enable = display_enable,
-	.disable = display_disable,
-	.check = display_check,
-	.update = display_update,
+static int xen_drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static const struct drm_plane_helper_funcs display_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= xen_drm_plane_helper_atomic_check,
+	.atomic_update	= xen_drm_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs display_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs display_crtc_helper_funcs = {
+	.mode_valid	= xen_drm_crtc_helper_mode_valid,
+	.atomic_check	= xen_drm_crtc_helper_atomic_check,
+	.atomic_enable	= xen_drm_crtc_helper_atomic_enable,
+	.atomic_disable	= xen_drm_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs display_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs display_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
@@ -331,10 +395,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
 	formats = xen_drm_front_conn_get_formats(&format_count);
 
-	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
-					    &display_funcs, formats,
-					    format_count, NULL,
-					    &pipeline->conn);
+	ret = drm_universal_plane_init(dev, &pipeline->plane, 1,
+				       &display_plane_funcs,
+				       formats, format_count,
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&pipeline->plane, &display_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &pipeline->crtc,
+					&pipeline->plane, NULL,
+					&display_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&pipeline->crtc, &display_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &pipeline->encoder,
+			       &display_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	pipeline->encoder.possible_crtcs = drm_crtc_mask(&pipeline->crtc);
+
+	ret = drm_connector_attach_encoder(&pipeline->conn, &pipeline->encoder);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 int xen_drm_front_kms_init(struct xen_drm_front_drm_info *drm_info)

-- 
2.55.0


