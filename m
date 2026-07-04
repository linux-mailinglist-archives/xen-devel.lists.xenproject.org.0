Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m75QAbXvSWoP8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 07:46:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A777091A8
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 07:46:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="HigA/Yvo";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HPvn1EDX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1354495.1609786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgFfm-00036X-92; Sun, 05 Jul 2026 05:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1354495.1609786; Sun, 05 Jul 2026 05:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgFfm-00032F-5K; Sun, 05 Jul 2026 05:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1354495;
 Sat, 04 Jul 2026 18:32:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wg5AV-0000QD-I8
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 18:32:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wg5AT-00FFmi-QD
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 20:32:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a495181-2eae-0a2a0a5409dd-0a2a4507dce0-24
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 20:32:45 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4951cc-9c8e-0a2a45070019-cddcb483d396-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 20:32:45 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 664G9NZh3274532
 for <xen-devel@lists.xenproject.org>; Sat, 4 Jul 2026 18:32:43 GMT
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8hawc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 18:32:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8478423e020so2624916b3a.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 11:32:43 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 11:32:40 -0700 (PDT)
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
	hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=; b=HigA/YvowAIAk3nt
	u90/giw64WMUkmqqUONEvT6QA+HElUmhEe9nMBPgMGXIiCsru/1th/i+26Ti+VPU
	VqC6CR+1O9aO7xlv3V2IfALvNs/JXPFhhXYQAmu8RnGmT3VXS/g/KZNAnMfyf63V
	Kxhyq+2qPDB+3/CZZhBC+/vDo6fJXQUA6q2doODDUnsQQbXtgKhPlWs1zZiIS+dp
	88CkD6YJ8VmeESdB3zsViZszqFk4ECq1XxJqVbJ3sQ/6CblyG65fIcGJ57s8eKMO
	zG7GjLSO340QWRV/QKuGOEVfrnh3WJSLZuI1zRXFhRyJJOBAPwB1Ox1/tpWOJhNK
	P4/oWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189962; x=1783794762; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=;
        b=HPvn1EDXam69XHyuF2qeyXcGZ2Jjxrqx22wBOoWk4k5nNwsALG9FBZ7fqQK13hWnfP
         xiEd1uK/zkBsmOnVvsO6AvhqDhFfPsXUug5IBcROghCzc8W1xmjkhOFDKLB9JKOV41oG
         coQTBzgN9rXBMIHr1SUox7uxy2q+MOFhXYadMyKCM6m0Y70ro7/jpshYx3G77YETVaVN
         jkWEyNRPZFiz25rAgs895usAHtd89LNYr2W4AVQCp2qiaRm3DoU+Cl+Bzprne+8R67ZZ
         zA6TxN2ocZV2ircaU5+P2Nit/BhqbHqe1frp0zTSDMKbs0O9waQfcpnhl778QV44ccT1
         fS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189962; x=1783794762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhnZnblLCIszQtw+LJyheg1p5e5bbTPNhk3k4G3KLZE=;
        b=i8jCWh63mhu3Mh8RYzSv6LSVe4lF7jW/EO4y5jCq9WSNpZDGgOLP78vkAnfLpgTMRZ
         G245oDcANhU1bz6REZfn+vWpbYuXXEYsaJ5Sd373rVBkI2F5n1TruMbospgkZb4l7A/v
         W5YpfFqPrWKIWK0wQ/2Zzc0WBS5QSvlgiTHH+F+uh/RZCIZ7Izm+nL2SOIFst1Q63MgT
         YbON1JCebz/Q9NDUxy3JxonItp8IoyK8iPv5P+a504BBbBBjQNGZs4JBBF9luKDCI5nZ
         UqOZc6DwaP6glWdhrE9u5USym1aJmb6hQNTzLaavrxxM8TU94o3S1LkxIPa6FT13ym3+
         qcRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZXqUveDOnJiQ+9FSb2uVvdL6BkUY56ysl6PouWpSoWrejnTDnQBFKg2Pa9jkaqBdA50Sjj3NrJ5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC4DwdQ9gYMj9Cbd1wcaxSWZFM3m2MC0f1J6am4mqfh5qnUjud
	ZRBQqMik0Q856hKnFY9szp+h64lfoGkzGTd1MeTrGI048Bi8gfWWOz/Y8gbGHcrbTrs1osx9bgf
	USBhp6jctkneEIznQO9aImSpg5wlJT/l4BAgMiXp7OzS2di8bL9kLE0+JxHF9mlmxAEdYPw==
X-Gm-Gg: AfdE7clHfodBKK5OKO0oOSpNmOwX/xf9Cb0sK4phkEbQsCwl95ic1CJbuABeldEwlw0
	ReJrsD0jBJsUIaB0dZruxjbnW9Hmosat0gPiSK2KXdqqZ4httqxtJyEmDnJp1QJ/sbq6Ib7K7Gy
	/xVnjxHbh6oulj95ujXbu2qmQnJYhMeZt0iMreImhKdZlXhb2c/9WU02+g+b3WoF2xq9XRBCA+A
	+2DOB9AGcJhWB77CYefms5H62pk2zUrxUV5S/+3eztnz/XfeRjYFvHobcLa9p5S2AIF8rEO/9V1
	5Ro0JVM3mpCXZzmVTn98mZClwYaISBuaKthUysR5orLL9WXYlX0LjYdgVfLxzkeqAtEw9uu+eUg
	fDLlH4MEiIH+BAQVc1Oqkc0I=
X-Received: by 2002:a05:6a00:3409:b0:847:82db:9046 with SMTP id d2e1a72fcca58-847f6e23426mr3892395b3a.26.1783189962385;
        Sat, 04 Jul 2026 11:32:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3409:b0:847:82db:9046 with SMTP id d2e1a72fcca58-847f6e23426mr3892367b3a.26.1783189961907;
        Sat, 04 Jul 2026 11:32:41 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:10 +0800
Subject: [PATCH 1/9] drm/arcpgu: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-1-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=10574;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=8mMAnYSE2j9kvPoy0U0PiscxYaNacGiFej3sM2jbRJE=;
 b=txK25+zxNcWE7LzIDK50/Vc0ek9cJ1ZHZwndvZY/Gaj4xa5vBqoV/ECCeA+Q5X53hzG7BWkCk
 vsnaMg/njluBVTDN1MNDL31skfyvaUfXMg+jVWOC+g+y4xzRJwbd4JO
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX4RhY685ksWQ0
 edD/AlOoft8hwmX4ZBZ25+PktvhSdUuyylwxS0bNOWJ1RLsfksNSxDy53lmaBf5O6hr5FxDwBRQ
 syRuvZasqQMFDKJ9TdM3yBHvDtsBRd5Inhr4gi73q7955EcZ/WVcxEa3T0Su8xEKOSJIne1OeN2
 MQyEpCeyLF4Wg3FWDBOQQOy2/yPApfFXFIRFoeyNGcc9itY+ApnobVoaGDEXEUrKqzCXqCr9Qsx
 0ypTGDtBUTk96THWu16d/raUHSITSATcT1aSQfgg44/hi0siGNruA/MYDw+Sc5Qbwbf8xZjHaMF
 Z5kS9oIq5mN6CHexkOk47YY3+PU7wOVmRi3ej4/cdLHVC+mQBjd3r22HW5jics2YjP4ez9LQgTj
 97L1icioQRz8vmpo+RK/3PSSarkXVwT0KwzEoXx4AGltPXi1PxD0C3dni6bbjBRGxWaeyMX6QB6
 F/y023gT2wUTThzSejg==
X-Proofpoint-ORIG-GUID: TU62iL5uxfdGhgyxaGIDJ8j8XoM_k6JA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX+iPqTID68B4f
 pQA99GYIPhrTJlTS/DNGumBa0zeU6Gnuh7ALBtau9oTfYy05+BaIPeBdXcOEyfS7y9g8h58nvx3
 rSmlO4sZfbb/+bsnOM9GjckzaDxGh78=
X-Proofpoint-GUID: TU62iL5uxfdGhgyxaGIDJ8j8XoM_k6JA
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4951cb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GdXnK45ANdTc1KOwPkkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040192
X-purgate-ID: tlsNG-ef75cf/1783189965-7E32725E-D3EBDBBA/0/0
X-purgate-type: clean
X-purgate-size: 10576
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86A777091A8

Instantiate plane, CRTC and encoder directly and wire them up with
standard atomic helpers.

This removes arcpgu's dependency on deprecated simple-KMS display pipe
interface.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 165 +++++++++++++++++++++++++++++++++---------
 1 file changed, 131 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..375cdb79e4e8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -17,12 +17,12 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,14 +52,14 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane	plane;
+	struct drm_crtc		crtc;
+	struct drm_encoder	encoder;
 	struct drm_connector	sim_conn;
 };
 
 #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
 
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
-
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
 {
@@ -117,7 +117,7 @@ static const u32 arc_pgu_supported_formats[] = {
 
 static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
+	const struct drm_framebuffer *fb = arcpgu->plane.state->fb;
 	uint32_t pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
@@ -139,10 +139,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
 }
 
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
+static enum drm_mode_status arcpgu_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							  const struct drm_display_mode *mode)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
@@ -155,7 +155,7 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 
 static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &arcpgu->crtc.state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -194,11 +194,10 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void arcpgu_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	arc_pgu_mode_set(arcpgu);
 
@@ -208,9 +207,10 @@ static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
 		      ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+static void arcpgu_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *state)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -218,35 +218,106 @@ static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
+static void arcpgu_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *state)
 {
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_dma_object *gem;
 
-	if (!pipe->plane.state->fb)
+	if (!plane->state->fb)
 		return;
 
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
+	arcpgu = dev_to_arcpgu(plane->dev);
+	gem = drm_fb_dma_get_gem_obj(plane->state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
-};
-
 static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
-	.fb_create  = drm_gem_fb_create,
+	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
 
+static int arcpgu_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *state)
+{
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
+	return ret;
+}
+
+static const struct drm_plane_helper_funcs arcpgu_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= arcpgu_plane_helper_atomic_check,
+	.atomic_update	= arcpgu_plane_helper_atomic_update,
+};
+
+static bool arcpgu_plane_format_mod_supported(struct drm_plane *plane,
+					      u32 format,
+					      u64 modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
+static const struct drm_plane_funcs arcpgu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported	= arcpgu_plane_format_mod_supported,
+};
+
+static int arcpgu_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *state)
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
+static const struct drm_crtc_helper_funcs arcpgu_crtc_helper_funcs = {
+	.mode_valid	= arcpgu_crtc_helper_mode_valid,
+	.atomic_check	= arcpgu_crtc_helper_atomic_check,
+	.atomic_enable	= arcpgu_crtc_helper_atomic_enable,
+	.atomic_disable	= arcpgu_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs arcpgu_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs arcpgu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
@@ -254,6 +325,9 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct device_node *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
+	struct drm_plane *plane;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
 	int ret;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -301,12 +375,35 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 			return ret;
 	}
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, connector);
+	plane = &arcpgu->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &arcpgu_plane_funcs,
+				       arc_pgu_supported_formats,
+				       ARRAY_SIZE(arc_pgu_supported_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
 		return ret;
+	drm_plane_helper_add(plane, &arcpgu_plane_helper_funcs);
+
+	crtc = &arcpgu->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&arcpgu_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &arcpgu_crtc_helper_funcs);
+
+	encoder = &arcpgu->encoder;
+	ret = drm_encoder_init(drm, encoder, &arcpgu_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	if (connector) {
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret)
+			return ret;
+	}
 
 	if (encoder_node) {
 		/* Locate drm bridge from the hdmi encoder DT node */
@@ -315,7 +412,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +439,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);

-- 
2.55.0


