Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MGBJvVqDWq+xAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 10:04:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCE58959A
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 10:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313680.1583802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbuG-000344-Hu; Wed, 20 May 2026 08:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313680.1583802; Wed, 20 May 2026 08:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbuG-000314-EZ; Wed, 20 May 2026 08:03:56 +0000
Received: by outflank-mailman (input) for mailman id 1313680;
 Wed, 20 May 2026 08:03:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wPbuF-00030L-6a
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:03:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPbuE-00G7uL-Ia
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:03:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a0d6ae6-bab6-0a2a0a5309dd-0a2a450bcc6c-26
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:03:54 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a0d6ae8-212f-0a2a450b0019-cddcb4832eac-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:03:54 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K7SP9m1739704
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:03:52 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qbmvm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:03:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-365ff2ab7beso4683234a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:03:52 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369517aa6f8sm20889290a91.11.2026.05.20.01.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 01:03:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=; b=luM+++5cgw90nkNo
	5Zd0jhfTVMw5CDRRadpgCFomLuNTbxIHLp3U6lTjTQCcWznOS5C4xB0FQmcY1ljZ
	OgL3dXMNPmNOcMbfrRnPZQwnHm3KbTosZ6tHrH0IQT6poxwkexxlBTId/cDR/cem
	GEE6UBFCLGcQ5j7zMioKhjmkXcTp0g5D4wwrp9NEsW0wCJKxy5x1584PDOmMjFu9
	johrHH0PgwKI6aix2qxpesOck+IjR/gDowjJUKKXsdtxR/QfKcrc2Pdp8UsfBg8/
	6ZPI0f/UGDNUP2WXxfwRCQMxP4m7AvLTxSblN9cQABYRxslL4HvBKx0xad/ZihTf
	S2ed7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264231; x=1779869031; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=;
        b=MBqw0V4jy4gzfp+UGlyZptNaedtz0vcQmhsC6BPKmw1N/Fi065j+z80/5Cgk69xizA
         JSGV85mWqwgr+NUSXxlnsJakkC8g/GO48jUfVt4nWHzbFUnkC8pKT6loxAPWaLqBTPVy
         E7JZf243fE3MiASjsI5M9qlQvoD+qiij5d6sJ7lV7BVOb4ZG07LDNKhZKA6qta0wjwy8
         byr91ab+pagCAcVQjzngOMW1nyeOi1oEnEJ64cyzEYczarJYs6B+P5qWRLBF74fgrSLs
         3uvkNt1fOQRytvO+VpSk9cCMuQup16oNTYiJSOX/Yk/MgYdQ7yA8TlnuluRfMzHJuOgT
         2p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264231; x=1779869031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=;
        b=hU0qz/UduWI68MKvxly9/86Q115Y8h+V0kRGLprGbLKT3bwgJpaPdjJ9wRyx/neCjq
         g5pndEvsgrH3GzUnEw405gh6L2XyNTrUs/c/qmM6ehdfWFX6PeHjW3hCM+MWLiobQ/xJ
         MdAZ/VHS64y3gkLmMGmqG6DI/dc4ZeQgBTyuZLBcHqroXuDZiD16EVw5ka39ANJjzug4
         Xs7c+tWWZXJoqFyqK5k6Fs8wqT0+Mbs+dnJySNbzO82yZT2z9EfPTjnniGKXGTG447KV
         MvtkHUFi9YXHskwM0FJOe+qozjtox84b3OCOyGMJ6Y5vk7NH3H6AY3HugK+ACoWCFsB6
         xdqA==
X-Forwarded-Encrypted: i=1; AFNElJ/iQJJ1QIWwSxACZEcgSWY2efPRg0ukFGsLwm/IRaGgq8+/KwhhuqxomQOywfmM2IBeaUU+gO5xoV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDRdgP04uojewKH09eUHQ2Dme/zmgomloIbLGaUqPAJEN6QUfN
	Ge4qQxLITNMhKNsS+xpY+pgRBS2XVMAlw9VhyzupI9Aq+tl0VUHTgAepDzl3UoGVk8WCBa/ilbW
	W36rZzAFdL7Ny3ltXRCSL+L1MN9ivvBMEfAM43BgD/H/4rAHGaNDsJHIidEheMnW4GSK5eQ==
X-Gm-Gg: Acq92OF/I9ncjTxt+qko0BQJGl9Qrdnri+KyTkmSxzyahpN+SgaObyneGGGkhqgFcCa
	UXn+Sa7TBfl5gtDN0des03hPySF44igwUFjBDSr6NRV2hrFNhGKWS44d7ziSFeE+yia2jEST/Ot
	/W/YyxE0pgDAqxjlBHem6wVvjwjffHvQqHhq9AmD2DNiPiRofLfE0Rx4KRnT0gdenihhvqWTmsw
	FJ4KgyW01a8t5EDfzjYiik4qj1yueGayNcaRe166HCoDOGh72zI4hCPE/MwmE8LvJs9fzcl0lv5
	F7wPd+M4dFpkxlzUbhQw95oJfPmhRA4s8PFWTNgToCLE+icC4WrgNaTew3ELAzT4ZtReIaHrhF/
	v2xZelmeDBYAurvE1ifqU4ssubLUy3f8nTQvknVxJmyWC0KIyx5NgrdBl
X-Received: by 2002:a17:90b:38c9:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-3699469b41cmr11587701a91.1.1779264231298;
        Wed, 20 May 2026 01:03:51 -0700 (PDT)
X-Received: by 2002:a17:90b:38c9:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-3699469b41cmr11587664a91.1.1779264230586;
        Wed, 20 May 2026 01:03:50 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:32:42 +0530
Subject: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
In-Reply-To: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779264185; l=12523;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=xwYkAEs+q6jRw+I3dHPltl1MmPPWsBwiOXNPNgKt/0c=;
 b=wcATq9lX5Bq1e8erTyBpni5Dih/s1c6wO9/NnG4qxR1ffvxl+OPEk6rtMC5rr4W4VoKcAWrsQ
 FdmlXhXN/pYDkytoi0wtNZgLMf9D1M6bGdq1x4YOiNvy+TxTUK7PV8y
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: 29FMm-Cl_aVgQUlfrOW5VikvhV-mWiL9
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d6ae8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=9707C7GnR82a18xSEiYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 29FMm-Cl_aVgQUlfrOW5VikvhV-mWiL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX3bwDKyymN2ei
 okqtmslm7SxvtwsxMosUHT9hQ5f2jFy70LzavHneOTkz5jctFC1XWpNK3w+eo9u0X3wZgVTxiU3
 VWfKQ9snZUr4L/FcfMwWAXpFPmOnjhmlpcGgvgEFXpap3KXwiEHfr84VpmnHdwQAJzN1/Evqvks
 Kip1jwxlkX5Ucxh9X6M8WKhrcRZ6pBN1+YXSCMJj1hCJEsEr4g+5Kqe2IzGJfJxs34jrwgyRspE
 yOQYc4Vvm7d4u8TakyKUi52Cn5sZoE/HSUiYhQAp2WGxqkvDBWO9ZLA92ZqJNXLAEmxnz/AMIbQ
 npeZ2wSVvFmGgROyNSjoTn5/I9x3LPsTDaXwsPBz52TtNsrnKCcrYcFycnAe0pvKmxJ2GBU5ixN
 0H+RwbdB9aKVZC+d3y/mUele9EGqvV/Nhtvezyfy9t6BaxoYTrJ/303i6ee0IfJRv3lDxGo8lC/
 KM44pEWg1KvgHERbMzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076
X-purgate-ID: tlsNG-42698a/1779264234-21F84F3B-2466D821/0/0
X-purgate-type: clean
X-purgate-size: 12570
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:
 charan.kalla@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: 09CCE58959A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Robin Murphy <robin.murphy@arm.com>

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use in being able to map at least single
input IDs to multi-cell output specifiers (and properly support 0-cell
outputs as well), add support for properly parsing and using the target
nodes' #cells values, albeit with the unfortunate complication of still
having to work around expectations of the old behaviour too.

Since there are multi-cell output specifiers, the callers of of_map_id()
may need to get the exact cell output value for further processing.
Update of_map_id() to set args_count in the output to reflect the actual
number of output specifier cells.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c  | 166 +++++++++++++++++++++++++++++++++++++++++------------
 include/linux/of.h |   6 +-
 2 files changed, 134 insertions(+), 38 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d658c2620135..f436e2676381 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
 	return cache_level;
 }
 
+/*
+ * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
+ * specifying only 1 cell. Fortunately they all consist of value '1'
+ * as the 2nd cell entry with the same target, so check for that pattern.
+ *
+ * Example:
+ *	IOMMU node:
+ *		#iommu-cells = <2>;
+ *
+ *	Device node:
+ *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
+ *			    <0x0100 &smmu 0x0100 0x1>;
+ */
+static bool of_check_bad_map(const __be32 *map, int len)
+{
+	__be32 phandle = map[1];
+
+	if (len % 4)
+		return false;
+	for (int i = 0; i < len; i += 4) {
+		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
+			return false;
+	}
+	return true;
+}
+
 /**
  * of_map_id - Translate an ID through a downstream mapping.
  * @np: root complex device node.
  * @id: device ID to map.
  * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
  *	*filter_np is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] will contain the translated ID. If a map entry was
- *	matched, @arg->np will be set to the target node with a reference
- *	held that the caller must release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	as defined by @cells_name in the target node, and
+ *	@arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np will be set
+ *	to the target node with a reference held that the caller must release
+ *	with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
@@ -2137,11 +2167,13 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || !arg)
@@ -2149,7 +2181,7 @@ int of_map_id(const struct device_node *np, u32 id,
 	/* Ensure bypass/no-match success never returns a stale target node. */
 	arg->np = NULL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (filter_np)
 			return -ENODEV;
@@ -2159,11 +2191,9 @@ int of_map_id(const struct device_node *np, u32 id,
 		return 0;
 	}
 
-	if (!map_len || map_len % (4 * sizeof(*map))) {
-		pr_err("%pOF: Error: Bad %s length: %d\n", np,
-			map_name, map_len);
-		return -EINVAL;
-	}
+	if (map_bytes % sizeof(*map))
+		goto err_map_len;
+	map_len = map_bytes / sizeof(*map);
 
 	/* The default is to select all bits. */
 	map_mask = 0xffffffff;
@@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
 		of_property_read_u32(np, map_mask_name, &map_mask);
 
 	masked_id = map_mask & id;
-	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
+
+	while (offset < map_len) {
 		struct device_node *phandle_node;
-		u32 id_base = be32_to_cpup(map + 0);
-		u32 phandle = be32_to_cpup(map + 1);
-		u32 out_base = be32_to_cpup(map + 2);
-		u32 id_len = be32_to_cpup(map + 3);
+		u32 id_base, phandle, id_len, id_off, cells = 0;
+		const __be32 *out_base;
+
+		if (map_len - offset < 2)
+			goto err_map_len;
+
+		id_base = be32_to_cpup(map + offset);
 
 		if (id_base & ~map_mask) {
-			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
-				np, map_name, map_name,
-				map_mask, id_base);
+			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
+			       np, map_name, map_mask_name, map_mask, id_base);
 			return -EFAULT;
 		}
 
-		if (masked_id < id_base || masked_id >= id_base + id_len)
-			continue;
-
+		phandle = be32_to_cpup(map + offset + 1);
 		phandle_node = of_find_node_by_phandle(phandle);
 		if (!phandle_node)
 			return -ENODEV;
 
+		if (bad_map) {
+			cells = 1;
+		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (cells > MAX_PHANDLE_ARGS) {
+			pr_err("%pOF: %s cell count %d exceeds maximum\n",
+			       phandle_node, cells_name, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s has 1-cell entries targeting 2-cell %s, treating as 1-cell output\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
+		if (id_len > 1 && cells > 1) {
+			/*
+			 * With 1 output cell we reasonably assume its value
+			 * has a linear relationship to the input; with more,
+			 * we'd need help from the provider to know what to do.
+			 */
+			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
+			       np, map_name, id_len, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
 		if (filter_np && *filter_np && *filter_np != phandle_node) {
 			of_node_put(phandle_node);
 			continue;
 		}
 
 		arg->np = phandle_node;
-		arg->args[0] = masked_id - id_base + out_base;
-		arg->args_count = 1;
+		for (int i = 0; i < cells; i++)
+			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
+		arg->args_count = cells;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
-			np, map_name, map_mask, id_base, out_base,
-			id_len, id, masked_id - id_base + out_base);
+			np, map_name, map_mask, id_base,
+			cells ? be32_to_cpup(out_base) : 0,
+			id_len, id,
+			cells ? id_off + be32_to_cpup(out_base) : id_off);
 		return 0;
 	}
 
@@ -2219,6 +2303,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	arg->args[0] = id;
 	arg->args_count = 1;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2228,18 +2316,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
+ * and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
 		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
+	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2252,17 +2343,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
  *	*filter_np is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
+ * and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index ea50b45d9ff7..374b249766a2 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -465,7 +465,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct device_node * const *filter_np,
 	       struct of_phandle_args *arg);
 
@@ -950,7 +951,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     struct device_node * const *filter_np,
 			     struct of_phandle_args *arg)
 {

-- 
2.34.1


