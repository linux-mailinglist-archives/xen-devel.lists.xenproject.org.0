Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EDJA5WRjmlADAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C21327A6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230087.1535680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGA-0007Wl-KY; Fri, 13 Feb 2026 02:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230087.1535680; Fri, 13 Feb 2026 02:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGA-0007RT-Fn; Fri, 13 Feb 2026 02:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1230087;
 Fri, 13 Feb 2026 02:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gzd=AR=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqjG9-0006yU-Ge
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 02:50:21 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9360b3f-0886-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 03:50:16 +0100 (CET)
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 61D26ClX3521405
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 18:50:14 -0800
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010013.outbound.protection.outlook.com
 [52.101.193.13])
 by m0482515.ppops.net (PPS) with ESMTPS id 4c9tvm855f-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 18:50:14 -0800 (PST)
Received: from BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14)
 by IA2PR16MB6348.namprd16.prod.outlook.com (2603:10b6:208:4ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 02:50:08 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::3) by BL1PR13CA0159.outlook.office365.com
 (2603:10b6:208:2bd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 02:49:41 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 02:50:07 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61D01AZg008731
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:05 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c6mw9we1h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:05 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id qjFrvl2LU4XAgqjFsvcASk; Fri, 13 Feb 2026 02:50:04 +0000
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
X-Inumbo-ID: b9360b3f-0886-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=gwK
	KWwFQSxOL2nXP9KGBiAgclLhKYOLn3uWhkxYkz78=; b=SuT6al1mxsfiBroU6jV
	sX5o1ikNLrDMvRjZ0R0YAOrFuPclDR2a3ncNBNxrYawxRRZI925HwsvGehSan+Yn
	pqR2cXVn2jnLguplEm9K0Us34JOjBgn+QbcAn8MNt3KnxY0qqzlikyfgg49TqHkI
	Jxq7sraB/buEEXw24fqhHprd3JZxkg5zc+bITgl/Vp+mE+ITbTTTIJGsfMMzq8L5
	2MrzrGKqaZrTsOLYg73EXgTBWXDsc22SjzCb1TJnLhrkXURh5LPhL+RxbMNhVi+O
	ZgPWz0v7ZV25A2iyzvF1S+xgrkKLOSd9Py4/sVkpAW1fI9YSTZeg+Im4H4heHByb
	Z3A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjdIFgOky16Ql43XpphN5yJNrmjOlzpexS0wJw4oZEdnRkIJ7b3F5FrgiGa9Bq8av8bs/4gLQkjOjQ8cgkmWvE0wr+4tcSd8xyTrKG9utqKT3+Yx/8bZ/aFlDNJqgyRtQouOdFHtJi9QseCaAXHcHzIWYMp4qx7ZYs5+wT4pe+JFMtjW3FFui2P+I3hVVyZov3PDoo8YqyCYSKxpez9UWS46dKuCQ/qDUdqOY2WuXvvZOTxyxndgRV/1Ldh5ZfcD3FEpT5CJV8NAV3RJMDMipmRuE1uaPtwdvw/iBI9YPXd2reN79XCd0QE9y9UOjCBv5qgC8mM+H84dqOBkwIw+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwKKWwFQSxOL2nXP9KGBiAgclLhKYOLn3uWhkxYkz78=;
 b=Y900s3dqp3kMxUWmTDmyblFPaS0rZsXrBLd+jaRGvfM0M2OLivrQo9xOC4x/0AePNPMPsenqaNspdtgywDPLTiKcy6ggM131OMHch0ggPmTy4Tb8AA1wKNLOP663PF9qTCUjBmiYWRLMtozqDtzmsBCI07V57TC8epf0lv4ocRsmKrkrTLTHhxhRSbI3MTb3Z3+pQ0AdytPs77IzBZOm1mofsvvECvfP5ns4B23ZDPg1w7ISGRLc/qQvGDHtidse7EiMJZqryl0ed2/VN4YdC1Oh9kDre/aMJRkBeEs9ht9zTn7xfUxd+w+uaK9QLtI4KJe2/hBedMnRC02YESTD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwKKWwFQSxOL2nXP9KGBiAgclLhKYOLn3uWhkxYkz78=;
 b=ITONXQGTF6+ZAvC7icSft2BT0sToLCwGbE8iTDD1FSyoiLSaPVOeZgDcnMrekf0qNU4fhwO8m5ERK4RR72DxxNM4rRsELszsS0Lbe0gfdVoEKJiEak6gI8FGsSVIQpcPGO8M5ETbI3j6T18jBmanm9QE5+zplBF4hpNQVlTT4ik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=gwKKWwFQSxOL2nXP9KGBiAgclLhKYOLn3uWhkxYkz78=; b=
	ZTkbwIdcSIC4oZcm0Q0L3LGkuk7Z/JyyOjaQ7CtaZi/ex4/CjR94ObRoRHGCLNen
	6+yIcxp3nDBaSKjmHHCrr6pz2e8VzV/0K4Uc0Fi9u9kgnASwDGXAWIZGRUvRkZAi
	tqwBMrK6osXXQ+EDR0ZGFm2GX7FKkS7SDjg4xDs/YBKSLMFRJlcdBpbnXBZmMUEb
	NbU5wdbEb7z/ojY2JX+9qdLgRgng8SfldfhOKtQZXc8z8suL2MKCHYmNQn0YxLPC
	Y1TSSrVJXT9yvugfeyCLCtvf03xma976YbmJ41U277/s2Pw0htAbB1aZqOnDEJ0M
	kyRkk8eGDNOrGovUdA0buw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=gwKKWwF
	QSxOL2nXP9KGBiAgclLhKYOLn3uWhkxYkz78=; b=U4FVsTcORNQJHtfoZnkuYlo
	uILFRH982igFElsR7jGL12l1WY2vNq3ZwSySIrzlTzbL6b5uzrfmtEo9xiWlULMG
	6oSO67cDl0fjfle0tAuv1AqE/RcFzp5lexPLEoPMc7ty37tLxuN31own6LDqVida
	imn4WVHccW6yiR2uHTCIURswUC/VYpF9U87haQFzz13RyljEGCTvbW+fD+FIOjHv
	cUJ9EUD2f4QziWRN9KPVm2POFzgKcm4/GC1KXyX7b09KLzwFUxTQeYhQoZmYz5rb
	dMb+nIj1jvGWZ2qj3JW86ksgLytkG4FbT/r976W0azaDQfEoSpWCQnMMdo56xDg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qjFrvl2LU4XAgqjFsvcASk
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 1/5] tests: fixup domid make fragment
Date: Thu, 12 Feb 2026 18:49:48 -0800
Message-ID: <20260213024952.3270112-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213024952.3270112-1-dmukhin@ford.com>
References: <20260213024952.3270112-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130019
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|IA2PR16MB6348:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e576522f-e5dd-4ed7-678a-08de6aaa9902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FsilxcRhPqT6CPS/M6U0mf+MNC1JeQKi78+mMdl4tCZxm+zRCG9tlLzuI/KN?=
 =?us-ascii?Q?n4A8RGm4A9/mQlg5y6nkvxKiKZVhaka13RfjIMRhsKKU1hsogj9hIvRVE4NF?=
 =?us-ascii?Q?rG79dZ/KlpyVy8q+ft5anY1yEiF1OTwDGryT4+TSFxOQ5g7hp3r78iQzTm1q?=
 =?us-ascii?Q?uc4Pu/1kij2J7icZuGJWvk6EWMDWLWBpAI+mLaxagVDuowfSn5pZVT4LFJ8Y?=
 =?us-ascii?Q?U2UZ9mcj+rDvqDIg1/dQ+wt/oWevd/kvmIIydRnK2dDx//o7cp6Xv6VtiJmq?=
 =?us-ascii?Q?LXHtzNEpUfdgS4glRVXeY5QVXcEg1HD+QrmGRxemmjNgmZQEvlV5hOH7GN7q?=
 =?us-ascii?Q?gG1EFgRXii6V2zj5ty/2ghH9jQnduiTI5gSV0ren3pH08CT3hJDP9f1sUK4u?=
 =?us-ascii?Q?gwhxIdFTFrGHQFXiJe0P1O53lVFdN92rdFysGd8fx9n18/poiY0xEoGp8wji?=
 =?us-ascii?Q?qD2KdBKC5Xc1n10RYGpEKYn0tJtDHMVxSgIZXGxYXuGnu3AUnK26QYzsJKhs?=
 =?us-ascii?Q?4ggG+9GHFXW1AvbDUE0gFEig+KOTHIAAP/czmdcOMPZUGglSvEGi8m8qXus2?=
 =?us-ascii?Q?Fus7McmrLlecI1gvtwh6fFqn6Yq8fS5tj0sMGbyr9Rol4yFyXxZPfCxWOr+O?=
 =?us-ascii?Q?yNPu4QNIqnltuPtKwQ1Un1SYd7f7Gj0O12GofWK0xC2ARKdLdZ9HNemb0Cyx?=
 =?us-ascii?Q?tejn2z1jpEPZ1xjpWPjUsErjuwO99PnRhGBMxjBGU4sLz6RYlayn8rjykfip?=
 =?us-ascii?Q?ph+DXGRfd1AbRUdIOrOCdozJP4aZSn+am8UHgK6aEfySCUUVHV3zwQlUUz1j?=
 =?us-ascii?Q?aS12anb7Qcph0xzQO4rICct7rV9u9aaWmpBUKJyDQBpV+2qegMUkEea5KFOS?=
 =?us-ascii?Q?WpEuUAmOwk5ul1MFBXu8lAlqSyMecMJiWDvYSL3czJfiPejrxB9sekgRF2Yp?=
 =?us-ascii?Q?Rhcctq2Gm3AerWUgo3NiMnnHiUqJsJN8YVhDjgaS9o9iAaq2qCyDDwd1ibUV?=
 =?us-ascii?Q?hFHLajyUmIxmfEIbwY3mSCfEyfi2g03zvSw5BBAmJ3J1lgZZw+lNcnVn4v72?=
 =?us-ascii?Q?UnE0Vm8PoUkwEH7sNMOePKFOozF4ptVYAF3r/KWFRcClfGoeBUrcMHTZp75Y?=
 =?us-ascii?Q?JswSPqj8zuI0IH65smiL+7ksiU4/I7/vxPxeOwQNCoo4+ikQ6l9AVi3qEvgt?=
 =?us-ascii?Q?1CT5n/qtBRIzrcJrz6b5ADkSZDSudfQ5aUXOisXMf/bb7RBS3Xmkn6EDBRW4?=
 =?us-ascii?Q?1DPwYjwjUGTHRwpHweVX1KqCHyoNfWa4hriSgDY5veBOTEcEwF2iHYwZv817?=
 =?us-ascii?Q?77Bc7NLUl92Zv9g8Cgg1uHu7JVygSmiBwOElA6NLx2HDwHS3rYzFzLB2i2gl?=
 =?us-ascii?Q?ps2AszxjDdLN+x3A3XThgOjpq3rjfR+04gst5zF7DVoQoP1xDSkufxgBJOD6?=
 =?us-ascii?Q?y1cOBYTdzOJ5wX0k97MNY32b35oyJnMfjU/tbTsjlnh4rauFs+b6iuMo6WvL?=
 =?us-ascii?Q?T/L8gLgQQKV7oQfiGJ17z6/L9+69QKBCpzAu+YTBNGo02AWUWNddf5axYwBE?=
 =?us-ascii?Q?aBlhKJTSU0M6sTjL/eAOICRA40u16ome/CG99N6RGF0sA4Sl2iZxMVPWRnYE?=
 =?us-ascii?Q?jDhDCg60+DLv4azV2msEwXDTISqrsQlFlbjMIEbTRb1Mzy4nKRMrCjehU2z6?=
 =?us-ascii?Q?uqDRbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u5Zije45qs3w56HAHjnqOoJaKnk14NMc9WZX1s0nqNC+8cC1XI0658Doxq8Y/E5U3oAwGPMlBqW69LsjszbKjZvGRhhVbA7sb0yuUkuSkKaY6JhDBDhEDBV2xMOFCUUEvuClV/o/EuNBSPvAMpdBojsdJ7mqIL4fR64AzP5GzaOiagaD5LwqTfmVjFOz9weM/4O9A5h8t1txVw9wziRh1lEC0zfoAqMfOj7NFMiXc32FUGqMbLI/CJXH2e8ELDPhrPclRCrT1AkcA8PiiVc87vAKo3Wt27qMIyn2+SRgLKIy+Q9xKhrAoMNY1Tt1L68aFRm3suZwiGSzpiI3SP356XFNLYPd+t6IRorTr8UONTuIXCFxejKRoe59DXLQUmGJVahQ3W7ZISgcnuv1CQkkRhjC+lxu0SwP+YLWvUPnliSesxLvO4BJdbUMdmTcdN06
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7NPI0d7wMjsnHS+h1rQPjEIaSkH5sRPvotmonX2UIR4d8DQuRkx14WMoUFnBf2oOP65TCE6iUfk2MEln8kSoEfPHyyawqJRzNy9r6gHzDEzkqX3TfAarUE1w+RPchT6aiQNWPAWzZiQRON6bGrX/Qtcu30sQZNb0Q2DASWbFhd65ALJhO6KX2hpWf5PA9xjpUh1KZQzjKoQsqGeoyZc0V4dF9O6joTeUzQ2J/l4AAMff5ZA8OhJ0xxX56nrrUJGkqY5BfAaLHrKo+zS7j2T3DW5gqnKGHWTYAjJBiPFbnB9vpdjkreUXq3iUKk4OSg8MLSMyHrK1tKCvYQfYKGzmCghuFOrKNJeVLs2oM+57dKtBbbkABH6tKx2u0V2d7W1dg6hn3NsGGrndAln3ds2MlxOgX1H5vbGMnaPKK1Gm+i9NiAhySW+a88kuZkMUU28eTd+T73BKsQ4Z4hz5Kwco9WJGKpXHoJ0RhZR0AoR+FDCfqqVbxjsms+o3a4Z12xXPLYRqusRl6vCjkyKKxLaO8B6U/LrdYCCmEwOHQLYL45ncCcZ2Y9dyKREjV/IzOh2ZYWyfSby7wKEktPbSESTlInfDZsUVVJHXNbQBg82WSJEAXUMEaYdqWf231pR3kwKeQVwqZiz5HqS6YAC+fQoziw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:50:07.6214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e576522f-e5dd-4ed7-678a-08de6aaa9902
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR16MB6348
X-Authority-Analysis: v=2.4 cv=Kv5AGGWN c=1 sm=1 tr=0 ts=698e9166 cx=c_pps
 a=N2Bp1sGBA0q5hqNMPvyVyQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8
 a=WxjMYAsaG4aR2vMT2MYA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAxOSBTYWx0ZWRfXwp0c0qPCOata
 USc/zSSp84fwzlN7bghMfOwun3rmebmlqG2x5Ui6kyw6fyfzvXRusKuMIGIk5c0ss1Mgai4Ar/o
 Kc+5TWi2GIde7XBGv/5R+U36K8J+xBlgrwgV74K1lY9RdQvxaOeNIVeI+mOR0VDqAfRoKCPM274
 Ns7wUU/P+HKwft9ep+OW+6yFS0Ag94LcLWGgoM1q0OhA9rz3OWAdJ/0YBrekX0flDB04i0+FULt
 mSVOStINciPgBEYs3daQlaDuilTyR0Pbc4pvFrXJg/H6Re2eSCVrd9lJDl8XaLKu+ggsRXfFZHn
 ZMRuKqXV+Fxb8SYIQ90/3Sn0vX4EwmQSDjpfkI8DG05Ct+ew9Po4iuiqgAsnCriKkk5zqXDl+ty
 yns+Ev6Gd6Ieqn4Ha9KkcI3dssfSq+85GF0SIIP2tEJhOqLlRQ4Mjcf5aTcNg3shM8LcU6dHbDk
 2HVEitAu1/UtxCWifQg==
X-Proofpoint-GUID: ocnhx_Sb35YkR_6ikN0VmZcc2n6lKbqn
X-Proofpoint-ORIG-GUID: ocnhx_Sb35YkR_6ikN0VmZcc2n6lKbqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 6B7C21327A6
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Add guard against HOSTCC != CC (similarly to how its done in PDX unit test).

Account for multiple test targets in install and uninstall make targets.

Honor mocked hypervisor header over tools/include/xen symlinks.

Finally, add some clarifications for the functions and do some cleanup.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- fixed emit-harness-nested-rule
- honor LDFLAGS_APPEND
---
 tools/tests/domid/Makefile | 59 +++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 753129029ed9..74cadab25b2e 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -14,26 +14,44 @@ $(shell sed -n \
     's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
 endef
 
-# NB: $1 cannot be a list
+# Generate mock environment by replicating header file hierarchy;
+# each mock header file will point to a harness header.
+#
+# $1 Hypervisor header.
+# $2 Test harness header.
 define emit-harness-nested-rule
-$(1): $(CURDIR)/harness.h
-	mkdir -p $$(@D);
-	ln -sf $$< $$@;
+$(1): $(2)
+	set -e; \
+	mkdir -p $$(@D); \
+	[ -e $$@ ] || ln -s $(2) $$@
 
 endef
 
-define emit-harness-rules
-$(foreach x,$(2),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(x)))
-$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
-endef
-
+# Helper function to emit mock hypervisor code dependencies.
+#
+# $1 Hypervisor filename.
+# $2 Harness filename.
 define emit-harness-deps
-$(if $(strip $(2)),$(call emit-harness-rules,$1,$2),)
+$(eval c-file := $(abspath $(1)))
+$(eval c-name := $(notdir $(c-file)))
+$(eval c-headers := $(call list-c-headers,$(c-file)))
+$(eval c-deps := $(addprefix $(CURDIR)/generated/,$(c-headers)))
+$(foreach x,$(c-headers),$(call emit-harness-nested-rule,\
+                         $(addprefix $(CURDIR)/generated/,$(x)),\
+                         $(2)))
+$(c-name:%.c=%.o): $(c-file) $(c-deps)
+	$(CC) $(CFLAGS) -o $$@ -c $$(firstword $$^)
+
 endef
 
+# Emit dependencies for mock hypervisor code.
+#
+# $1 Hypervisor filename.
+# $2 Hypervisor source path.
 define vpath-with-harness-deps
 vpath $(1) $(2)
-$(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
+$(call emit-harness-deps,$(addprefix $(2),$(1)),\
+                         $(CURDIR)/harness.h)
 endef
 
 .PHONY: all
@@ -41,7 +59,11 @@ all: $(TESTS)
 
 .PHONY: run
 run: $(TESTS)
+ifeq ($(CC),$(HOSTCC))
 	set -e; $(foreach t,$(TESTS),./$(t);)
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
 
 .PHONY: clean
 clean:
@@ -55,13 +77,12 @@ distclean: clean
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
+	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
+	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
 
-CFLAGS += -D__XEN_TOOLS__
 # find-next-bit.c
 CFLAGS += '-DEXPORT_SYMBOL(x)=' \
           -Dfind_first_bit \
@@ -69,9 +90,13 @@ CFLAGS += '-DEXPORT_SYMBOL(x)=' \
           -Dfind_next_bit \
           -Dfind_next_bit_le \
           -Dfind_next_zero_bit_le
-CFLAGS += $(APPEND_CFLAGS)
+
+CFLAGS += -D__XEN_TOOLS__
+
+# Honor mock hypervisor headers over tools/include/xen
+CFLAGS += -I$(CURDIR)/generated/
 CFLAGS += $(CFLAGS_xeninclude)
-CFLAGS += -I./generated/
+CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(APPEND_LDFLAGS)
 
@@ -85,4 +110,6 @@ $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
 test-domid: domid.o find-next-bit.o test-domid.o
 	$(CC) $^ -o $@ $(LDFLAGS)
 
+ifeq ($(filter clean distclean,$(MAKECMDGOALS)),)
 -include $(DEPS_INCLUDE)
+endif
-- 
2.52.0


