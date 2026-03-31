Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oByaIc3Uy2mILwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:06:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2136AA88
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268932.1558115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ZiU-0002As-H4; Tue, 31 Mar 2026 14:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268932.1558115; Tue, 31 Mar 2026 14:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ZiU-00028r-E1; Tue, 31 Mar 2026 14:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1268932;
 Tue, 31 Mar 2026 14:05:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1w7ZiS-00028l-LY
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:05:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ZiR-0022t4-R4
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:05:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69cbd493-e002-0a2a0a5209dd-0a2a4503ed6c-42
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:05:11 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69cbd496-1947-0a2a45030019-cddcb483c07c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:05:11 +0200
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62VBeiET2408305
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 14:05:09 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heugu0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 14:05:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2b242062308so98824475ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 07:05:09 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b24264292asm118311945ad.4.2026.03.31.07.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 07:05:06 -0700 (PDT)
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
	:mime-version:subject:to; s=qcppdkim1; bh=dF4Obv+MCSq8YX0P9fxlsK
	GDvf3O7jRLPn7ezaYrn94=; b=o+CZ3OYj5iT9TfiBJQQTNFVxOHbunQR1j75oeO
	V3YExJ9yt3v/berszKeoWhGOTfi7pdx2GszMQHo48JYAU4vMf8NDj8Qol95WDQtj
	kt2T2qTsSbyWa8Owfkr7utvtrdrH/tohASWBGdMgXOFCECs/gQ6G9iGT+CX3Q2Xc
	MrxqC4EpUdV34HwujWpWIX33DvqEuY1v2ktIbSrDFlRavZFTK/mi9G45ugA5VxS2
	4p7HP8tJJewyZqCsT3WLyCNuBgjgDqmXvj3RFLnzpkGM8rO0prd3v4Kyh2YFupV0
	cMO3ds65t2hoqTNMhqZklxT7/1qmTsjk7AFjVByktZZBITRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965908; x=1775570708; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=;
        b=cFhXckOHwwFY2VVGg8s97+uPAWr6PkGC27ClQ40F8dxO6FTlkH55oRpHUCMuU1FaxC
         lIFKnl7u7NyAvNUMdKRRBJ7jpGg47KZTtbZMNCzmp2oIzu5aAY95Kf1nkyb4i8Q/1mgQ
         Zb5FQ0iPlDnmQe2WGEgB0qov76P+yOy0lErGWERyPNN73zR1TVeSSAEc4uTQzUe9z6+U
         UlwKGVGGm/sP1s7MpIU9oi8zkeYsNqeqycm7RKovd1n8CamXE/X7XlawViBq0TNkr5Ft
         o7fZHyEto/HWZjaJ0mWPP/hkXXymuzHo8cZ9/CCv5fBzTQiZbZvDdkakvT8oThuTUie2
         cJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965908; x=1775570708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4Obv+MCSq8YX0P9fxlsKGDvf3O7jRLPn7ezaYrn94=;
        b=DpcUbqPrZZZ9tPjCKVw8X6fJE7yWoSqpXgElwPCxyOWuWrlnVcRjoAQYUX/QRaoYuk
         /kg1mOBw+4yFiV40EQZuEyn8YK8o7G67KeMj6vVVngB07uriw/NddbNw1b7Ib8JaLiXM
         IQ+Cr4soW7NgWHVScMrCKkY8PvRcWe+SO675wAVPl/HsTfvrKkOj2jd3O1ABp/jFdYme
         Z1Z2yqTmVbQwY/3ZwEM919IBuE3qV6iRI1FLQvHEvYfvX1GCnakDtj0zqhcFA0ATxyZS
         KmIs7jQjON9TwL2yoJr9A0LV4tN0STJUfU+M12PSRVjmPMw0nwGZi1YSSA0X0INbkgT7
         NBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZBWTJ2wugLfHP1RgC7zfR1W5eO18XY/Qm06SjzU25CYN8ATBUaeCRozw8oKHnSzAtnNJ/1v5lURc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX/EmN4GyEGUOGO5zcD+wSZFR+DH3dT1yZoEoZ1vuh0iCXsCqK
	CEDyoQj6u7p5IwmQTONlt3l8IHcjmcwgU41CDiE9gbDzFRIDjR+znp+mjlzCXSZHfSt7Ci79NaT
	45rGEamDvivTBhg/1lYOlEE050zCy0AgHA/Yi6o/0GtJfM0h+q15+qfh6iJmEesyXbeaJWQ==
X-Gm-Gg: ATEYQzzB3xk60gYhUwBRNUn8uT6Glbhy1jJuOa6j9yWlxuNFs5TLQf+YqzYIq+XKOwp
	2uxvVQSAUCpaz2Rqv/0nHllbInRUXln6GpGrSIdv1qtJajbv5iF0neeS6/eRm/Cf4wnTohhDA3s
	l1mx3EIMc+Pw6oWIKg2t6QunVy6KC23/n6/epq1e38mfPbfXOdxN3jUgANTzgCWDoHdvjVKCkW5
	7xQxg3Fh/Eyn0sSO+EBNNdjOsQeWSh0yapU9gE/ZruQ1XcwUr63CAc9gHqmhQmtGAaHAvdx/3FS
	pJXK3XMJk8993t9kjMMgQNj0NnZ6axmwecVco6ym9Izcv3O81OeWYjXZiJTyazrdjrJ9/oBddp6
	EuJm4qttgLz7nz54dp4qh/LSIlkDxsOfJfORW1bVCBshXrb4SJgqccIJ3
X-Received: by 2002:a17:902:ced0:b0:2b0:c2d9:270a with SMTP id d9443c01a7336-2b0cdcf0019mr180935935ad.42.1774965908091;
        Tue, 31 Mar 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a17:902:ced0:b0:2b0:c2d9:270a with SMTP id d9443c01a7336-2b0cdcf0019mr180935015ad.42.1774965907346;
        Tue, 31 Mar 2026 07:05:07 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v12 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Tue, 31 Mar 2026 19:34:45 +0530
Message-Id: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3Uy2kC/33NwQ6CMAwG4FchOzuyDkHw5HsYQ0opsgQBNyEaw
 rs7OHFAL03+P+3XSTi2hp04B5OwPBpnutYH0IdAUI3tnaUpfSG00omKFMgerePcdI/HkBM3jZN
 AUXRKUuSiQOHvesuVea/o9eZzbdyrs5/1x5gt7T9tzKSSxxIKYiaKGS6dc+FzwIb8VuiHWNAR1
 FbK9iRQnqJEV4QYI5TpLwo2lI53KfAUVFxhTIpTTTvUPM9fQ6NMd1ABAAA=
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965896; l=6029;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=P2NjOwOfDO9uAKBSdnt+bXSNB/+yNSJiXlluqOTEHNk=;
 b=66lmuzH48rtm0FKXbMJnsG4s1A7Kc60A/4pJcguDLuPcx0lroADqyzlA9wif2kvUXlYq0+jLu
 KAnx76iLFtQDeoanD5WsP5LMaqzqXOX3e6iR/p1Nc5+FJv7Y4Bg5pDi
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbd495 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=w9jVfKxUgDq0yQD5sDkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cUgrnFngmjuyN5iU0scUboIC4_awBQbH
X-Proofpoint-ORIG-GUID: cUgrnFngmjuyN5iU0scUboIC4_awBQbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfX82Ls5vjtlydB
 dqOFp6FlNjemlzUkn+C+BikOvsDWamHNpebCJIjMSHK1wpX0yN6A/6CKoXfhtH0WIXzs93NsR5A
 CXqYPPvD454BXFlasVsALIJHEM1tmRPEKaz0BC9kf8TRiBw7zBpSZkyud/vfecBIfjghHGKBhw3
 kjSCZoU/SI6QSa6Nm6gVoSfTZC/DvXnIJjSnECzhGNTjWK07rLBE5+1VyRwDGkiHh3SeG6NBtDY
 9rIEH2JK/g47HUPvDGNeGbJl6WP53OMIMsJILecgLd/nwBUGFdEkWiyTpA52UBMgk5MbBnWjqmo
 BKOJlDqsi9ZGWC5yyrCigedSOsXXuvXM5/UblvHpAtLcBOmZBtz0Hxk7eimRxcj+mXNA2AUadde
 Vy34X1DFVkI1SfSbNwhY8cUIQVwrJ9OjTclJ+cD8+G4dKX03NaB5k2CTcTc1Nycd7IutyTliKHc
 rbZ2xlmDDwik63Nq34A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310136
X-purgate-ID: tlsNG-33051d/1774965911-4985872C-8FC7F633/0/0
X-purgate-type: clean
X-purgate-size: 6031
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: C3E2136AA88
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

Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't make
it into the v7.1 merge window? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another
cycle.

Thanks,
Vijay

V12:
  - Call of_node_put() unconditionally in imx_pcie_add_lut_by_rid()
    thereby addressing comments from Bjorn Helgaas.

  Link to v11:
  https://lore.kernel.org/r/20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com

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
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 240 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


