Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 66i/J1LUH2pHqgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:14:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E846350D5
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:14:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H3scntiX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OFYk8ZXh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1325771.1591115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfnu-0007JO-Sm; Wed, 03 Jun 2026 07:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325771.1591115; Wed, 03 Jun 2026 07:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfnu-0007HI-OK; Wed, 03 Jun 2026 07:14:18 +0000
Received: by outflank-mailman (input) for mailman id 1325771;
 Wed, 03 Jun 2026 07:14:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wUfns-0007Et-Qx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:14:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUfns-00HEOs-7V
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:14:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a1fd43c-2eae-0a2a0a5409dd-0a2a4506b960-26
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:14:16 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a1fd446-7371-0a2a45060019-cddcb48399c8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:14:15 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6536RSbK1200262
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 07:14:14 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw0q89-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:14:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2bf32259e0eso52709055ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 00:14:13 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f8429fsm17249725ad.18.2026.06.03.00.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 00:14:11 -0700 (PDT)
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
	vWOTiDUibzqekz7rYfayQWy2AJ39XhDr3pyUdTs3ags=; b=H3scntiXFhn/Zwn2
	M1oV3kxilwZLn1ptkcUSNog2VlGcoJEF0lf48yNjW1KxHv+j0UwGh3o7o1zEkvsw
	AO5vvXKimDfEItdcSzVru5lvEnquQtfF+FLnc8sL03m1BaF3NTtLWwdAsFVkEf8y
	9OZMYWwIxnR9Nh2Nx3N2nVhWqCdqNZMH3J9t7tOm8aAixuqqfiGKKzRfndj1QnlR
	O9yxcIqAug7d+5itW+u2BDAx30yvjD3J6C1ZccdECOhc54g4OrpcxC8wXdejZOV2
	FpmryMevMaOxNN/i0LdldRZ2eAPG4QPKOpvkT52jwFLfvAAl3zB9qAHyFLc0xbwV
	YRLUrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780470853; x=1781075653; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWOTiDUibzqekz7rYfayQWy2AJ39XhDr3pyUdTs3ags=;
        b=OFYk8ZXhTNe6yg2UUlNLcBh/D5OdJR7FsBYRVFCCPJA26ICEj0JRYoF2uz6tSe2iGo
         Gm8hTAN1R9IdUoRDpXf7vwej4I8RzILZxHmkM3Z9zFhYnxUGkFvjS8kmRwoh17MPhfK4
         Z3pAjh4uparOMshWvypi0ZYeOzlLOUtqwaFTgxn5nY/6JModO/xyTwDVIH4WFYFz4B/j
         vRmhmmNRVdoAiSUoOU+y8oERNM78ofxteLOMniOExzgkBPd3T5Iuj6XmVCXaF80DvIev
         I3+cUJ0aqKyhcEZNYUiQX1Lqao7NnG65YtPL5XbVtCeHlZ7Coqp+iTWizSyEAOCAaD9S
         idRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470853; x=1781075653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vWOTiDUibzqekz7rYfayQWy2AJ39XhDr3pyUdTs3ags=;
        b=MhuFatI4i0zlDDKSZj3MLI25Osng+2+xJLTw/TJjlTwnC5tT0ggXOVF41QRU3w3+71
         SchX5ERpV5hEwL8k+zz82p95dlh26fjkQ5ReL6Wjbzhu5yovGXqF/pYnXdslwhOq57mn
         dL2cmgf4M/O/k7cqUeCc+28KrOJXhLIym9KJEXUAXyp/UzZ4izOtUnU9mDoGUTwbZ0yq
         Gd606DXRaEMA6jEldD0LJpUHPQm5YQ28WUR5ueUqQ97Xrk9lHezK5q9JmYiVmLNaRHG7
         DPjCURLvGoLGDfOBDGuhDnuLS0wW6ZsMNM1PCB3GqaNYFwy3JHNNuR7EbmGNfZ5LRKGp
         Srqg==
X-Forwarded-Encrypted: i=1; AFNElJ8wgQOxFOA3KUP163YGc2ywHVOsUczaYIRg5MJa20zScK+uFBjXq0u5Szj3vP0oM4S176fVPE9KNT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiRUA0nZzIOdqZ03+r1es20Zlm9+YApK1L4DQlYT3/4II+UVmA
	1lo/AoO4tRfRqYUkLquh2cv6jqcAR5MqW/iU/yr08RilYOhLVFcDYY4AI2Lwzq4ySlrZFQIX8Hw
	ICLwmp/bAs4ljKlC5Y6AwmSWnHCVImn+tWQxLPbkFBUkAZALNUlMxBX8I9GnyNHh/F3/VbA==
X-Gm-Gg: Acq92OFbHgNGNaRj3PtrRlkfQ7SSvhGTMNH+nvRIuMgQsrleSPOj5S6VobHdF39WlOy
	BkkMaOD7DbTLBNRHKbb6IV4dc16MQRQLhDCrbhZrdDD11GX47gPggtoy+Zv34rNPHE44DWoRWDp
	5rH0SjCKKFG2KO2cS9xpuwRDZaCQXlpaB/AeR2evLuBnE3vnWwml45LYlR8/x3kbt4/XslH8Fcc
	8OyVrOsNX2PLy2w++wraLiDX42dQIzieDG+pVxbVupDfLb/wuZLwaLnbPbIjPxxnAsq+Qu5gwWO
	I6z1QpxA4CChx/jp9OVYBP6H2oqN3uPw5jOBCrRb7Vi30+3oJ9pBXqmAC758dfSc97AvosB8zBY
	PY361sauPiGnsITO9b3l99uI1IXlEvy5RG1+XnkEPqWpZWxsl3ipHDEtox9bJNgbRDzc=
X-Received: by 2002:a17:902:d48d:b0:2c0:e158:1dfa with SMTP id d9443c01a7336-2c163fa480cmr21450345ad.21.1780470852435;
        Wed, 03 Jun 2026 00:14:12 -0700 (PDT)
X-Received: by 2002:a17:902:d48d:b0:2c0:e158:1dfa with SMTP id d9443c01a7336-2c163fa480cmr21449815ad.21.1780470851846;
        Wed, 03 Jun 2026 00:14:11 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 12:43:13 +0530
Subject: [PATCH v16 2/3] of: Factor arguments passed to of_map_id() into a
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-parse_iommu_cells-v16-2-dc509dacb19a@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
In-Reply-To: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780470825; l=19290;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=YiZjwxHFmgOTQ3MYzgU/NvAq2Xi8EN05+apizd5wwmk=;
 b=I3GdCPp+x6ge6k1jyOA5PCHKcLLXuNe+TCFT5XeIaSElRQZx+dEblDkXZ+AiE972ZbgFT31Pd
 /TY2LTvxlPWDZpJrrcL6Hq2haJC+KYF4OjW8pbfMvTHH73CalUCTfUi
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: lRwhpxQhddzh4_-flI06DrOUZ9M997re
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1fd446 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=YNKo5iN9BcXwmsqDYIQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA2NyBTYWx0ZWRfXygFHT+VQjNqs
 N+3EhOC0IR94Gg7eEl05TJKnp/lSdvaLajBXbUIP23fvIs51Sp9fvci0fgYN02dIE/4t3ey8RyQ
 DW6BJZzmebnTggflTg/Vhf8vGuQklpRYOiscHCuVE9M5t+5jSIytRR7oN8DnpY2nAA/yq2WS/3D
 EE44jr6Tcc7iRCKgkcTJZ9upejWLtezQUpqwqWa+Kw8daWL8JfsaHjzfzsJIJKOBhA4Yo95zPo1
 g6JhgUQExumJoU9VzoUW2D5XhNCyN/EO5Ec06gRrss1PLV1JkPePHIKVvTKbV8kOSikceT0U4ou
 JktT05Vv8glGv7rHMws4irHqxaacLUUR9ezmXSmgeHVpGZjwcbupdU1NhMnZC6oa90rRqjl9xj6
 3pWFKVF/3z48ftFkY0l9QjqUI/O3X5Eq0vAegOY03DZY4Qp0k5B/O7njClOygijwLbuEjEFesq9
 89GtIqQ7aQrR3heQa3A==
X-Proofpoint-GUID: lRwhpxQhddzh4_-flI06DrOUZ9M997re
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030067
X-purgate-ID: tlsNG-16d1c6/1780470856-87B7DD75-B5542F56/0/0
X-purgate-type: clean
X-purgate-size: 19351
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:maz@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:vijayanand.jitta@oss.qualcomm.com,m:charan.kalla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E846350D5

From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Change of_map_id() to take a pointer to struct of_phandle_args
instead of passing target device node and translated IDs separately.
Update all callers accordingly.

Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
to separate the filter input from the output. Previously, the target
parameter served dual purpose: as an input filter (if non-NULL, only
match entries targeting that node) and as an output (receiving the
matched node with a reference held). Now filter_np is the explicit
input filter and arg->np is the pure output.

Previously, of_map_id() would call of_node_put() on the matched node
when a filter was provided, making reference ownership inconsistent.
Remove this internal of_node_put() call so that of_map_id() now always
transfers ownership of the matched node reference to the caller via
arg->np. Callers are now consistently responsible for releasing this
reference with of_node_put(arg->np) when done.

Acked-by: Frank Li <Frank.Li@nxp.com>
Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/cdx/cdx_msi.c                    |  7 ++--
 drivers/iommu/of_iommu.c                 |  4 +-
 drivers/irqchip/irq-gic-its-msi-parent.c | 10 +++--
 drivers/of/base.c                        | 71 ++++++++++++++++++--------------
 drivers/of/irq.c                         | 31 ++++++++++----
 drivers/pci/controller/dwc/pci-imx6.c    | 53 ++++++++++++------------
 drivers/pci/controller/pcie-apple.c      |  5 ++-
 drivers/xen/grant-dma-ops.c              |  4 +-
 include/linux/of.h                       | 16 ++++---
 9 files changed, 119 insertions(+), 82 deletions(-)

diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index 78edb7308856..c8d832b0b1f5 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -121,22 +121,23 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
 			   struct device *dev,
 			   int nvec, msi_alloc_info_t *info)
 {
+	struct of_phandle_args msi_spec = {};
 	struct cdx_device *cdx_dev = to_cdx_device(dev);
 	struct device *parent = cdx_dev->cdx->dev;
 	struct msi_domain_info *msi_info;
-	u32 dev_id;
 	int ret;
 
 	/* Retrieve device ID from requestor ID using parent device */
-	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
+	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &msi_spec);
 	if (ret) {
 		dev_err(dev, "of_map_msi_id failed for MSI: %d\n", ret);
 		return ret;
 	}
+	of_node_put(msi_spec.np);
 
 #ifdef GENERIC_MSI_DOMAIN_OPS
 	/* Set the device Id to be passed to the GIC-ITS */
-	info->scratchpad[0].ul = dev_id;
+	info->scratchpad[0].ul = msi_spec.args[0];
 #endif
 
 	msi_info = msi_get_domain_info(msi_domain->parent);
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a511ecf21fcd..a18bb60f6f3d 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -45,10 +45,10 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 				     struct device *dev,
 				     const u32 *id)
 {
-	struct of_phandle_args iommu_spec = { .args_count = 1 };
+	struct of_phandle_args iommu_spec = {};
 	int err;
 
-	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
+	err = of_map_iommu_id(master_np, *id, &iommu_spec);
 	if (err)
 		return err;
 
diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
index b63343a227a9..b9257103a999 100644
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -152,6 +152,8 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
 static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u32 *dev_id,
 				phys_addr_t *pa)
 {
+	struct device_node *msi_ctrl = NULL;
+	struct of_phandle_args msi_spec = {};
 	struct of_phandle_iterator it;
 	int ret;
 
@@ -178,9 +180,11 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
 		}
 	}
 
-	struct device_node *msi_ctrl __free(device_node) = NULL;
-
-	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
+	ret = of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, &msi_spec);
+	if (!ret)
+		*dev_id = msi_spec.args[0];
+	of_node_put(msi_spec.np);
+	return ret;
 }
 
 static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 1e9b9692c0d9..d658c2620135 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2122,36 +2122,40 @@ int of_find_last_cache_level(unsigned int cpu)
  * @id: device ID to map.
  * @map_name: property name of the map to use.
  * @map_mask_name: optional property name of the mask to use.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
+ *	If non-NULL, the map property must exist (-ENODEV if absent). If
+ *	*filter_np is also non-NULL, only entries targeting that node match.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->args[0] will contain the translated ID. If a map entry was
+ *	matched, @arg->np will be set to the target node with a reference
+ *	held that the caller must release with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
- * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
- * @id_out may be NULL if only the other is required. If @target points to
- * a non-NULL device node pointer, only entries targeting that node will be
- * matched; if it points to a NULL value, it will receive the device node of
- * the first matching target phandle, with a reference held.
+ * ID, as per the "iommu-map" and "msi-map" bindings.
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out)
+	       struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
 	int map_len;
 	const __be32 *map = NULL;
 
-	if (!np || !map_name || (!target && !id_out))
+	if (!np || !map_name || !arg)
 		return -EINVAL;
+	/* Ensure bypass/no-match success never returns a stale target node. */
+	arg->np = NULL;
 
 	map = of_get_property(np, map_name, &map_len);
 	if (!map) {
-		if (target)
+		if (filter_np)
 			return -ENODEV;
 		/* Otherwise, no map implies no translation */
-		*id_out = id;
+		arg->args[0] = id;
+		arg->args_count = 1;
 		return 0;
 	}
 
@@ -2193,18 +2197,14 @@ int of_map_id(const struct device_node *np, u32 id,
 		if (!phandle_node)
 			return -ENODEV;
 
-		if (target) {
-			if (*target)
-				of_node_put(phandle_node);
-			else
-				*target = phandle_node;
-
-			if (*target != phandle_node)
-				continue;
+		if (filter_np && *filter_np && *filter_np != phandle_node) {
+			of_node_put(phandle_node);
+			continue;
 		}
 
-		if (id_out)
-			*id_out = masked_id - id_base + out_base;
+		arg->np = phandle_node;
+		arg->args[0] = masked_id - id_base + out_base;
+		arg->args_count = 1;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
 			np, map_name, map_mask, id_base, out_base,
@@ -2213,11 +2213,11 @@ int of_map_id(const struct device_node *np, u32 id,
 	}
 
 	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
-		id, target && *target ? *target : NULL);
+		id, filter_np && *filter_np ? *filter_np : NULL);
 
 	/* Bypasses translation */
-	if (id_out)
-		*id_out = id;
+	arg->args[0] = id;
+	arg->args_count = 1;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
@@ -2227,17 +2227,19 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @np: root complex device node.
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->args[0] contains the translated ID. If a map entry was matched,
+ *	@arg->np holds a reference to the target node that the caller must
+ *	release with of_node_put().
  *
  * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct device_node **target, u32 *id_out)
+		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", target, id_out);
+	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2246,16 +2248,21 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  * @np: root complex device node.
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the msi-map table.
- * @target: optional pointer to a target device node.
- * @id_out: optional pointer to receive the translated ID.
+ * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
+ *	If non-NULL, the map property must exist (-ENODEV if absent). If
+ *	*filter_np is also non-NULL, only entries targeting that node match.
+ * @arg: pointer to a &struct of_phandle_args for the result. On success,
+ *	@arg->args[0] contains the translated ID. If a map entry was matched,
+ *	@arg->np holds a reference to the target node that the caller must
+ *	release with of_node_put().
  *
  * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
-		  struct device_node **target, u32 *id_out)
+		  struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
+	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e37c1b3f8736..967c19100879 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -796,14 +796,15 @@ static int of_check_msi_parent(struct device_node *dev_node, struct device_node
 /**
  * of_msi_xlate - map a MSI ID and find relevant MSI controller node
  * @dev: device for which the mapping is to be done.
- * @msi_np: Pointer to target MSI controller node
+ * @msi_np: Pointer to target MSI controller node, or NULL if the caller
+ *           only needs the translated ID without receiving the controller node.
+ *           If non-NULL and pointing to a non-NULL node, only entries targeting
+ *           that node will be matched. If non-NULL and pointing to NULL, it will
+ *           receive the first matching target node with a reference held.
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
  * or "msi-parent" property. If found, apply the mapping to @id_in.
- * If @msi_np points to a non-NULL device node pointer, only entries targeting
- * that node will be matched; if it points to a NULL value, it will receive the
- * device node of the first matching target phandle, with a reference held.
  *
  * Returns: The mapped MSI id.
  */
@@ -817,9 +818,22 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	 * "msi-map" or an "msi-parent" property.
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
-		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
+		struct of_phandle_args msi_spec = {};
+
+		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
+			if (msi_spec.np) {
+				/* msi-map matched: use the translated ID and target node */
+				if (msi_spec.args_count > 0)
+					id_out = msi_spec.args[0];
+				if (msi_np && !*msi_np)
+					*msi_np = of_node_get(msi_spec.np);
+				of_node_put(msi_spec.np);
+			}
+			/* msi-map present but no match → stop walking */
 			break;
-		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
+		}
+		/* -ENODEV: msi-map absent → check for msi-parent */
+		if (msi_np && !of_check_msi_parent(parent_dev->of_node, msi_np))
 			break;
 	}
 	return id_out;
@@ -841,9 +855,12 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
 						u32 bus_token)
 {
 	struct device_node *np = NULL;
+	struct irq_domain *d;
 
 	of_msi_xlate(dev, &np, id);
-	return irq_find_matching_host(np, bus_token);
+	d = irq_find_matching_host(np, bus_token);
+	of_node_put(np);
+	return d;
 }
 
 /**
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index c863c7b02289..105038c15aa8 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1121,41 +1121,42 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
 
 static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 {
+	struct of_phandle_args iommu_spec = {};
+	struct of_phandle_args msi_spec = {};
 	struct device *dev = imx_pcie->pci->dev;
-	struct device_node *target;
+	struct device_node *msi_filter = NULL;
 	u32 sid_i, sid_m;
 	int err_i, err_m;
 	u32 sid = 0;
 
-	target = NULL;
-	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
-	if (target) {
-		of_node_put(target);
-	} else {
-		/*
-		 * "target == NULL && err_i == 0" means RID out of map range.
-		 * Use 1:1 map RID to streamID. Hardware can't support this
-		 * because the streamID is only 6 bits
-		 */
-		err_i = -EINVAL;
+	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
+	if (!err_i) {
+		if (!iommu_spec.np)
+			/*
+			 * "iommu_spec.np == NULL && err_i == 0" means RID out of map
+			 * range. Use 1:1 map RID to streamID. Hardware can't support
+			 * this because the streamID is only 6 bits.
+			 */
+			err_i = -EINVAL;
+		else
+			sid_i = iommu_spec.args[0];
 	}
+	of_node_put(iommu_spec.np);
 
-	target = NULL;
-	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
-
+	err_m = of_map_msi_id(dev->of_node, rid, &msi_filter, &msi_spec);
 	/*
-	 *   err_m      target
-	 *	0	NULL		RID out of range. Use 1:1 map RID to
-	 *				streamID, Current hardware can't
-	 *				support it, so return -EINVAL.
-	 *      != 0    NULL		msi-map does not exist, use built-in MSI
-	 *	0	!= NULL		Get correct streamID from RID
-	 *	!= 0	!= NULL		Invalid combination
+	 *   err_m      msi_spec.np
+	 *	0	!= NULL		Got correct streamID from RID via msi-map
+	 *	0	NULL		msi-map present but RID out of range
+	 *	-ENODEV	NULL		msi-map absent, use built-in MSI controller
 	 */
-	if (!err_m && !target)
-		return -EINVAL;
-	else if (target)
-		of_node_put(target); /* Find streamID map entry for RID in msi-map */
+	if (!err_m) {
+		if (!msi_spec.np)
+			/* msi-map present but RID out of range */
+			return -EINVAL;
+		sid_m = msi_spec.args[0];
+	}
+	of_node_put(msi_spec.np);
 
 	/*
 	 * msi-map        iommu-map
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a0937b7b3c4d..c2cffc0659f4 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 {
 	u32 sid, rid = pci_dev_id(pdev);
 	struct apple_pcie_port *port;
+	struct of_phandle_args iommu_spec = {};
 	int idx, err;
 
 	port = apple_pcie_get_port(pdev);
@@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
 		pci_name(pdev->bus->self), port->idx);
 
-	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
+	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
 	if (err)
 		return err;
 
+	of_node_put(iommu_spec.np);
+	sid = iommu_spec.args[0];
 	mutex_lock(&port->pcie->lock);
 
 	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 1b7696b2d762..2aa1a772a0ff 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -319,13 +319,13 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 					   struct device_node *np,
 					   domid_t *backend_domid)
 {
-	struct of_phandle_args iommu_spec = { .args_count = 1 };
+	struct of_phandle_args iommu_spec = {};
 
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
 
-		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
+		if (of_map_iommu_id(np, rid, &iommu_spec)) {
 			dev_dbg(dev, "Cannot translate ID\n");
 			return -ESRCH;
 		}
diff --git a/include/linux/of.h b/include/linux/of.h
index 721525334b4b..ea50b45d9ff7 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -466,13 +466,15 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out);
+	       struct device_node * const *filter_np,
+	       struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct device_node **target, u32 *id_out);
+		    struct of_phandle_args *arg);
 
 int of_map_msi_id(const struct device_node *np, u32 id,
-		  struct device_node **target, u32 *id_out);
+		  struct device_node * const *filter_np,
+		  struct of_phandle_args *arg);
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
@@ -949,19 +951,21 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 
 static inline int of_map_id(const struct device_node *np, u32 id,
 			     const char *map_name, const char *map_mask_name,
-			     struct device_node **target, u32 *id_out)
+			     struct device_node * const *filter_np,
+			     struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }
 
 static inline int of_map_iommu_id(const struct device_node *np, u32 id,
-				  struct device_node **target, u32 *id_out)
+				  struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }
 
 static inline int of_map_msi_id(const struct device_node *np, u32 id,
-				struct device_node **target, u32 *id_out)
+				struct device_node * const *filter_np,
+				struct of_phandle_args *arg)
 {
 	return -EINVAL;
 }

-- 
2.34.1


