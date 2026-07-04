Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K20mNbLvSWoF8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 07:46:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B0709196
	for <lists+xen-devel@lfdr.de>; Sun, 05 Jul 2026 07:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CSEUNTWN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZniHy6es;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1354493.1609784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgFfm-00034d-4K; Sun, 05 Jul 2026 05:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1354493.1609784; Sun, 05 Jul 2026 05:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgFfl-00031l-Sy; Sun, 05 Jul 2026 05:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1354493;
 Sat, 04 Jul 2026 18:32:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wg5AL-0000Ou-Ub
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 18:32:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wg5AL-00CL1O-8B
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2026 20:32:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a49517c-e002-0a2a0a5209dd-0a2a4509e4e0-22
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 20:32:36 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4951c3-97e6-0a2a45090019-cddcb483a6bc-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 20:32:36 +0200
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 664G8nkG3443179
 for <xen-devel@lists.xenproject.org>; Sat, 4 Jul 2026 18:32:35 GMT
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64hgst-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 18:32:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-847a5f03ff9so2433597b3a.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2026 11:32:34 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 11:32:31 -0700 (PDT)
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
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MltfzpfpaLuZDnkNZx+Lb6
	VWJ4GPL8eKrD3GSx0ATGM=; b=CSEUNTWN1DlO1mccs9tBOSMPvsm87QKPUuehKQ
	4K6kTjt1FKnv2ec0M8Ysv/X+5cdqXiRHqij/ORCYEDmUr+Lvfqi2Bb10tvUqlWYK
	6bUxEtHDeSVXR1YlKacaMujOYA044wSdNr9b9B9nlb84ycDuDYWoCL+A2qahMRDh
	QaXY3ntdMFBxDIr+RrCRCbj6/BLG0BZQLRU8QJzw6wEZsRPcqLF+9/q4Kr6AjCvh
	6HdIKJwHHUAO8X324yL3sIeCAbzFf/FbdmaEFj/XSnPAux4wnR7Iw7HkLjguUK31
	c2tOSjRDtb3pqINNlxcgrFkpU1+GI/Hxp75MpAT7pOVePlMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189954; x=1783794754; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=;
        b=ZniHy6esaljV/yShb5FRMs68hXpsiXjuyfKXBlCpprVv94KA2sEWrt94NwqVK5ySoH
         HDwE6EeUUn3uRteSh5lcfqkBntoaYO4RkIv3N/0bAjQ5/iC9xz14C3epcW74DQO+oGhs
         9rSJpwWh2lMuZ+V0W7gmLSnQWYyJnRwE/9cYOgg+XWVIVja6X2bYhXJ9N012SRQkWycD
         Z61FPCqOLf2QnEbWRmXgQ67Hp6/ktxX3TrkS3Mjb5zZHyd/TL3NsrtMiofQdDKvN6+n5
         hNDMgBMpi8EUDYxMsQKPTc6iCStk96Sg+G0usFvC4N0Z/0VGxzdJQ0scQXG9TdLKBVpS
         33cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189954; x=1783794754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=;
        b=Ixh/Sj3aAAmKl3Ht+L5QtSyZOtzfFaLQp97DD7Hx7kgeEM22nsn84btNnVYwNtk1YT
         b/uAbFcVtPefUDBJOqncgC/q3q7tM+TL9QXFVJvsU5N5IiDfXGHcgZL9YO2dT/ETfQM7
         FOfu//ulrj11lV2aUW3zjqDZA8/cOizU8PnP678Yq3QPgjWhfaxUzKvhogpkmMKeFZw/
         pUstn0+oZ4VqQEGqTvHdPUJuI3lBuR9VAljoYwpxJcd4u9r3Kj3QjpMCnLSqA1BpP47r
         0QRLozwsC/2LtE4GRjBVohV91jskeH/4TT00ulSNsf2Y/Yd/DZeHzGlYZrk6KogXjFBs
         OFKA==
X-Forwarded-Encrypted: i=1; AFNElJ/fZr295u5LEeTV0GyH0wGwf2Y3oATG/NXLI8mSG2jVtk0XQAE3OM2V+f+GHJjt3n+2Ew6j1roVKZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5rCTYFwbJ4e5OPKeoTZ5vOyGlDPTiC+8nAVJYObkch2xhMMgW
	+4vOOd7Rc0tZe3HuC0EOSJGxBsdzqdpeGCtMt3Q/6KcvntxbPLXPf7qMsPxulGWBuBcVM1Yu4rc
	L8qwarez/pdAAP9BdlPH6nCuTuL4gqksRBxlLgG0RDbYPG4opBsapVynnFElK1fpCoO2hSg==
X-Gm-Gg: AfdE7cmyH9q23j74jlrZgQzC1bSw373JQ0WSA5RS9iAc4mUY1oy67QCTja9Pq6sEzH6
	5fxHzCzEhPy5LY7CXyaKJR2rLXzbff/IZ2wLOrJRPLiOp4y1/dFQlwz16V0c/XvlKzdFx9PYDXo
	ntFvHHTzYdTxP0i2hvgo06hQhklhi78uyzS5Tndt9uKvJaiwuKZ/aU7FFbI4g9hfWaZtzTBcfkz
	bBKh+6m7QsBG5kCbJtTt23HFEhWbXtA2q3whkGmQEb+cCEvmrhVd8ZKYKy2C7MAlFzfL+sgsBCZ
	zqSJdeueznO3xFB9wPyc+f2oB5iHz+rXmuwlVHPFLxp7tx2NDKGusW9XYWdjRPbUGzd82cSHWd2
	du5K/RZncxcNRP6L6ZaBkGDY=
X-Received: by 2002:a05:6a00:1881:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847f6dd3dd7mr3575642b3a.23.1783189953620;
        Sat, 04 Jul 2026 11:32:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:1881:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847f6dd3dd7mr3575622b3a.23.1783189953074;
        Sat, 04 Jul 2026 11:32:33 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
Date: Sun, 05 Jul 2026 02:31:09 +0800
Message-Id: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SRtNRC5imFRyqijFLBTCAnh7
 rbi8iX/v7eBUGASqIsNAi0sPA4J9KkA97TDg5C7xGCUKVWlLtgFj8J+6gnfXjCQHxfbo9JWnbU
 rrTZXSOcp0J3Xn/jWHCxz+yIXs+2/CPSZUzEeM2itELrRe451kTsDrRFzGVWJpoJm37+GdJ5Cs
 QAAAA==
X-Change-ID: 20260704-drm-simple-kms-removal-01a031c6a129
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=3497;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=a3oJlDmIy4JLxHP8+Zy827sxSxkG1qtSrEiIUv8u7fM=;
 b=oTFO2p3qM2CB2fGh5FbCqHWfsLjAUpA01rJUrP5DdH2raMv7Em7rY0rPoVQz7ExoGxuGHOYTD
 NpzXPoGsHqtBE5XHc7JyEmeSHN8I2421kM7XwjgHHvZaekp39t8rsAh
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXzTq4yP5oAQuM
 Yv1EchNIimilWVTX03AiQ0Xzf4zdmg9jNbc6qcUuzM04nszphwbZM4UtVYLc7ITadbUpg9BQ+FQ
 W1i0/xdc0+CITg9nccWVAK8YqfPa9xeo2e/q4BaCsaNdDRAQh2QKlqE9M4PxWiC3uqGnmIOp5Pv
 vXiyLqQb4Gh2LU1iAxP8aMTjDZkCQPQjLIgbwUAnFNp+xI1f4idHfEzhKtbJNJAIgd0E0zitcEb
 7/fe4xvkMe3vSE2KJX5OT7suQpNLmJh8pzlYoG3rlwAo2gm1+Q6NTX+WlM5mMgQF9fnXHtgEP8h
 qQzGnGbM1RuKtRq8X04XzE12m0F1GQjzdlA0GZHF6/qRCHYcLutzDn+1xlcgw5Np2dOxHv8CzSk
 QKJOnA2daWhUk5pzH2WLVSg9WbedJrR5pBjAaWhw9tzeI30fphyga626OFPLR49b9Rvzwgwl1ty
 opFrFoe3dggIRbJJWSQ==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4951c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mcgfQexBA9BlAWrkqKUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: tKVbD9uQAQUtYXwL2LMITimeJzy4d4BJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX73vPOeY3qeRH
 aRLFkcNPrIJJHvWNeXzOZJUpdmndvox2daKMkc28I2pJ5qjSIp2Gg/6upQ2QnOmIDdzsphakB10
 7NgD/I/lyKK634Kf0PqNArrgODiIik8=
X-Proofpoint-GUID: tKVbD9uQAQUtYXwL2LMITimeJzy4d4BJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040192
X-purgate-ID: tlsNG-bad1c0/1783189956-577AD986-1C371A6A/0/0
X-purgate-type: clean
X-purgate-size: 3499
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F9B0709196

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

This series converts the following drivers:

  - arcpgu
  - aspeed
  - imx lcdc
  - mcde
  - pl111
  - gm12u320
  - repaper
  - tve200
  - xen frontend

Each patch replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversions preserve helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in these drivers.

These changes are build-tested only. No hardware testing has been
performed on the affected devices.

This series is based on drm-next-2026-06-27.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Ze Huang (9):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 ++++++++++++++++------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c      | 178 ++++++++++++++++++-------
 drivers/gpu/drm/mcde/mcde_display.c      | 162 ++++++++++++++++------
 drivers/gpu/drm/mcde/mcde_drm.h          |   6 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 174 ++++++++++++++++++------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 165 ++++++++++++++++++-----
 drivers/gpu/drm/tiny/gm12u320.c          | 128 ++++++++++++++----
 drivers/gpu/drm/tiny/repaper.c           | 130 ++++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 221 +++++++++++++++++++++----------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  17 ++-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 177 +++++++++++++++++++------
 18 files changed, 1164 insertions(+), 381 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
--  
Ze Huang <ze.huang@oss.qualcomm.com>


