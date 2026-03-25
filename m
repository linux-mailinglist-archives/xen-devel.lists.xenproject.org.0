Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACZXKG7Cw2n6twQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:09:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51F323989
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262013.1554712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5M6u-0004J6-7q; Wed, 25 Mar 2026 11:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262013.1554712; Wed, 25 Mar 2026 11:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5M6u-0004GE-3v; Wed, 25 Mar 2026 11:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1262013;
 Wed, 25 Mar 2026 11:09:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1w5M6s-0004Fn-P7
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5M6r-00FnYU-Mj
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:09:13 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69c3c253-5cb7-0a2a0a5109dd-0a2a4505cc4e-12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:09:13 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69c3c258-5aeb-0a2a45050019-cddcb4831046-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:09:13 +0100
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62P7Zn6K2276792
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:09:11 GMT
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40ratu40-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:09:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-82a6906e35fso1088399b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 04:09:11 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b040da7besm14615911b3a.49.2026.03.25.04.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 04:09:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-Id:MIME-Version:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0xsjrEryjWzRb9dOuIF+d8
	yzYCspWSHX+0TlzKhGxRo=; b=TiMEGExkVM9gpL8cmTL1Y1MM+EHGdJ2UifJ7G9
	+3eMUGbdKh5bKay+aRyF7hZyOgk2/v+Ic8E2ObTbeV+5jRc5ljbjfAM366mDRq8Q
	p/c6wKlT8DwRmmdjtytX4aZYLV7FsCQbrWiFiGIpvpHTlh5XQb3KFsSTaCfYpqqM
	1rCSphJtlm6zmKIuCrM6PhQAdSYH04ZNY7qyz3M6fxBj7kufweRkpHTvNuLf3B1e
	yNKDTM6ys0BdHBaZOEU0o7H9qmFXjVMSR5+KcOCSliemYOsSFSJRINAtb+096EuP
	x2tFAR5Nr6nKw8fI7XAcvpCn1JBCNK7ldq+j0SS2gOpp6XTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436950; x=1775041750; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xsjrEryjWzRb9dOuIF+d8yzYCspWSHX+0TlzKhGxRo=;
        b=HoJCdYcUvnzlRDvE717v0TmuTGxFlknZpXvmu3voCEyyHO199XT980EulyAJBPd7Tq
         wCdA72Dmw9mW5gtCQC/ijub6PJQjNfM2birN0qmrRhs7ScuDihnavcueOoHzSFpnO6nY
         Im8eAdh33cbrGWye9dU5EqcJ0ucVOLeHDoroEnIjAujO35lQpMwKwxFAVOXB5FZjkMJW
         oZegTSisEdpd3BiD/R6hsw+2Rs1FpBN366FG6nZV2fyEXRht6mbVs+ih7dgAaUVbi0vQ
         RGWHwnHEWO70IxVrDaNGcYtnrVefdpIrSKM+f8QPuIhV4B5k3duXzIrwzVH6H+tG9OFI
         b6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436950; x=1775041750;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xsjrEryjWzRb9dOuIF+d8yzYCspWSHX+0TlzKhGxRo=;
        b=BAYtnBmcce3dSaxmh9VscOqH08hqsc97KZpYK7iRbpnNkIMCrlxuWfpLgHMjmKgiZA
         EfWzMfIWxq5ewW/a0xev0IOvycGwsGwD1W23T9RB4LDP8v5t8hfKmQKV17GjQS3HLz8F
         ssFLfcDO0s1ovQPLVisgWntZufDF1bJ8cwghdZtOqesqxCM6ukgcVeQwLc7Jqj5h3bMn
         DCQIpt6BWokLkkvEdbBAGFtmnsBpBUX3HMcLan58LhgLE9LU2Sw5xNCP6t+INe3HuTSA
         MC9sQS+LTykGNFX6wo0Ry29hIO2R25CZK+8zF+SBGAch2uGb3Rak0yV9sFmQppscZSzG
         RAhA==
X-Forwarded-Encrypted: i=1; AJvYcCUJxUhB3ic/fy7yFIOtSTkWp1E5S7326UuIFk/H/jzhZRIe2NTM/fyQQ8b5+apWVPyVn7w9VubTRIQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrAsIJIv52NNAGNfdo5mXv7xHt6JfJGaEpti5xUMOc67MYP81f
	CanmmS0uDJzPHE2uSfTce8i+3U66807I3tqRgG9R6RApIsgrMKTToANmE66cOkQsvqGeOsnJKpS
	mtXB/w+IidoBZbzBvlptz9GS3Qn+LDdrtRybil4KD/H9YIQ/hj2GBs4Ty9Dsv9sBK+p6gAA==
X-Gm-Gg: ATEYQzxgo1scw6BZtmCuzFuujl9ngm7XjgqDB6J3zEaFkwPQHrHVUW28bQba58Vtses
	KnfKM0pTOxdyWwB5yPRJLOFfT0qvPkFpugdCsnD+8SSxKJLY0d2yz/1qaUzhpikMvoHeXQarVv7
	xOqqP8ENUEFK5X0/T4VL8LsW9nVAPm4iKeiVmbB1CRa8rgpYY2nxc0cO0ij5GQmDeH42hO+g2rB
	kWlwp2OxR2vUpHUE/KG15cTwwPWF6eaWF0DYGqtPrJcd7iq2H2UG8eBPrX1ELf6DUsAw8GSJgoZ
	0YEfJN3C69ZgS7IIS4ksXXCKqsTocDq2Xdz8mTR3UUDdXipnAiQe/TcII7/HprNpt4vbcNP2naO
	Tes2k2GL1S6ySm6k2xN8OCNnMyOVY9lU/4EwqLuJrDNvZOd/pXDUFp2Hd
X-Received: by 2002:a05:6a00:1787:b0:827:2ee7:baaf with SMTP id d2e1a72fcca58-82c6d88a70emr3157403b3a.12.1774436950315;
        Wed, 25 Mar 2026 04:09:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1787:b0:827:2ee7:baaf with SMTP id d2e1a72fcca58-82c6d88a70emr3157358b3a.12.1774436949724;
        Wed, 25 Mar 2026 04:09:09 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v11 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 25 Mar 2026 16:38:21 +0530
Message-Id: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXCw2kC/33NwQ6CMAwG4FchOzuygiB48j2MIaUUWYIMN1k0h
 Hd3cPJAvDT5/7RfZ+HYanbiHM3CstdOmyEEgEMkqMPhzlI3oRCJSnKVKpAjWseVNo/HVBH3vZN
 AaXrKC+S6RhHuRsutfm/o9RZyp93L2M/2w5dr+0/zpVTy2EBNzEQZw8U4Fz8n7ClsxWGIFfWgf
 qVyTwIVKMqTlhAzhKbYoZZl+QLpzPWgBQEAAA==
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774436938; l=5530;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=b8dYo16XmJ2xon8GV97URYfm4xZzwK4rrsPqdHa33Kk=;
 b=J08zhEYoQn9e6bd4Kdzzm/0wjHfQUzVEJmTADcUj7e0wpazI3gC2Wl0RNNsNRBF8E/PVwFYJS
 bUPHaafLLEtCBMQtzU4gcpBawAiyPFytdIVdxsjxMVtFcpymsXi/9KL
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3c257 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=w9jVfKxUgDq0yQD5sDkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QXdCWYqXSgpXP_rHm77lHLvfyLlncNZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfXwpMT1H8AIaP8
 PD1lbsGlPhrBGruM5QnouzRnPD49O1yui0Vx0W14ZXETHm9eVA1DTO9jf68ZIwMeijR4gBipN1f
 b5I0YfNxNv5XdCWbNXt6q7OH6ipPETJUYD6LqFmYNzsDZkz7H3V9hbwtBHw9yKmayAvtfB2S5Yt
 HOOWtiwzvX5OJXjvxPnEQixyDSFTltd9nwRbIBnDBMw8TSBNh4I7xLvshNRtSOwuVQ6ZO9Uw+AR
 +7mGAJyWXiNyIDvIXUnzN50BEWlQ847EEtbxnUb7kAvZe1tr9fIvmcHJlqJ5cA/xsJBkoMDZ3xV
 25VVE5nUd9SitcbVRDRXq4sjbMPOEMs5vu5F3si6AftmYKn5u1y7q0krIvw+YFadJFgggApx/jO
 Z8/PDOOuMIZPZzTxXqQMTlDmpqysJuvfPCdeclMLBNbuDHw1KEnVICczfQqrTal4x6vOCF99Iz5
 Mz0IeGk8wUZEzYMgFOA==
X-Proofpoint-GUID: QXdCWYqXSgpXP_rHm77lHLvfyLlncNZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-purgate-ID: tlsNG-c201ff/1774436953-2169D488-29EACC37/0/0
X-purgate-type: clean
X-purgate-size: 5532
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:
 charan.kalla@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: EC51F323989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

V11:
  - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
    per Dmitry Baryshkov's review feedback, making the filter explicit
    instead of overloading arg->np as both input filter and output parameter.
  - Removed of_node_put() from inside of_map_id(), making the caller responsible
    for reference management. Updated of_msi_xlate() to properly handle reference counting.
  - Collected ACKed by tags, and fixed minor typos.
  Link to v10:
  https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---

---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 237 insertions(+), 71 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


