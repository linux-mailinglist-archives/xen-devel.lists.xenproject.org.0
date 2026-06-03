Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uD/2IVzEH2qvpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6263484B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=FDyut0BM;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=OVektaMK;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=N40Nwvq8;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=sIHofCnw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325661.1591007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejw-0006sZ-89; Wed, 03 Jun 2026 06:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325661.1591007; Wed, 03 Jun 2026 06:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejw-0006ov-4P; Wed, 03 Jun 2026 06:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1325661;
 Wed, 03 Jun 2026 06:06:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejt-0006it-RD
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:06:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejt-00Gy3F-7p
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:06:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc446-bab6-0a2a0a5309dd-0a2a450b973e-20
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:06:05 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc44b-212f-0a2a450b0019-94a39217a664-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:06:04 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6533UJLe2832024
 for <xen-devel@lists.xenproject.org>; Tue, 2 Jun 2026 23:06:03 -0700
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010028.outbound.protection.outlook.com
 [40.93.198.28])
 by m0482517.ppops.net (PPS) with ESMTPS id 4ejce20nbp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:06:02 -0700 (PDT)
Received: from SJ0PR05CA0100.namprd05.prod.outlook.com (2603:10b6:a03:334::15)
 by PH0PR16MB4183.namprd16.prod.outlook.com (2603:10b6:510:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:05:59 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::3b) by SJ0PR05CA0100.outlook.office365.com
 (2603:10b6:a03:334::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:05:58 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 06:05:58 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653224ZG1072773
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:05:57 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egexd4hr4-5
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:05:57 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id UejiwDtg6ba3bUejjwCCeW; Wed, 03 Jun 2026 06:05:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=QVh
	RRlXhqga0d0SY3/s1wrhoZ/QaLSRtH7SAQWsQUj4=; b=FDyut0BMnc10NK/0yaY
	5RmY3ICFpyxpdw58uHqtCGtVvlLok4EA63ZneLEhQb/GvHjcqAIkofuCJivBDlTY
	es7z9f4TLsfi2pyNz4Mc69215nwMsxnuVAxvz7EJXICvIK1AIbRZtydVgvUVyLv3
	LFBfEKzKDJoOghVHi35/ogEA7m9zQwlGzsEIgdtXPRAu6eoOZbS+YqCDRRimYDOG
	mqKcFXMGlQWKs9qyrnhITbamOElVkKcTUIN705Bv32wh8tAamXiNjCl0h9vgYp1N
	1JH8vrSYts8v41YCgGKFwSrNhII3pIN2pkY18ucKAoEzvCNvJoUlDLXMjpRnx/57
	SUg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEDOF8Atbpekazp13VYPad7sKbYDVvx7cAnIvVcBFvL/NVhGs2eIvXOSs+zInQosWsGWBNEbSofXblRSG6WXIEJRa1eACbPghMQyjJ+1P4mvU8hrwzRe4Ks+hRp+vw6gSVLrVe5rnWwnCgMIlAAOApktKM2PpetRCX9MpuZy4esxeWwj0T6AaxLjzUV8HYBogjLFzy1BA+hfzyTRcEkHt6I/ChS843laQaOxTW8dB8PYlG6HpUkR9rd6PieTfu+K+KnRCF3gjXtQZ15Q8zjvEl0cz/qs/ZDK1vNIriL45x/n21+XaLjmK3WbtBolN8s86JTC+Z16S29yr8C8QBO6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVhRRlXhqga0d0SY3/s1wrhoZ/QaLSRtH7SAQWsQUj4=;
 b=A8PBmpC7svIuUhghiXcu7VhTlxjUA/XBZxdOZdPjhb4AoAkl3ttZ3p6MYQU5IR+rHHpOHTmSFXNeV8FvyOGvSR6E5JDu/RbAZ8rGjtyinvOZUiJ07dfJZTNW86TUe/wrnuXQ/kS0B8scknFsb9uYAIaMGzNP0BROGo6bm+IwX0k+BSyxwF1JlijzN4NGRxxxkOwSrs6n0KNYV67xRFz2jHEyIUryylW2u3mDpCEfaYJ1lnpgTNgf05q+sNKsPY7BqtU1PSWKq4K6JKr8b5oM/L1OIjZmeduBGtg8gid9xr6AKMdD8akzzJEpLB9pQ7Xza0n7IqRqvnXCmAl6mTelYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVhRRlXhqga0d0SY3/s1wrhoZ/QaLSRtH7SAQWsQUj4=;
 b=OVektaMKoSV4xyLIDXoY1NaC6A0bQbexa8S1WAiogTY5mLuWbTryZY0Nuf0/DN1yr0j1MWKujxB+S3YCBAhKpNQyHHNJNnOk+A44wq1vD1Ww+MnKEuRKxzDet9So5Sg3Em5HK1iHj55ckJ828u3R1yrgSnszq2HBDg9Y1adsVnY=
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
	ppserprodsaar; bh=QVhRRlXhqga0d0SY3/s1wrhoZ/QaLSRtH7SAQWsQUj4=; b=
	N40Nwvq8dr3n3ozXyVL8FuD0fLSBbT4b3ndbpfPBHZVFYV6oRlLA/aAOnTwxz1cU
	p6DsqWGHn7rKFT/H+fzbQmFAVIl+WAvXzLZGERYZvjKpmkJOKPmf+akRyoFIszAU
	XODqBx0Nl4uRbiUpP3ydgdfq+mj6fRdaNBaeu1eycceB9yW1NqimAwyDE7SFm/LA
	+2nzLtVXpkyq37Rq5a1O4IewyKaxPh+TuKZmuN4kOSwhK2fGX7Xn2RvaxFkD7HdR
	AbsQBs7L06iC0mb8jarzpqMwNXmD9PnjEHhkChSzVMR0gOh9kJPVgLUx7kwaGyuc
	NQQUxRJkagZEdQNSYSN79A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=QVhRRlX
	hqga0d0SY3/s1wrhoZ/QaLSRtH7SAQWsQUj4=; b=sIHofCnwLoDnlmt+CdnDgi9
	fHrQFfLhjzhtsuEfcqXSeC+Lq7nzVgmHehg6pG1tIr3WCJyAa1drHbq2PjTUti0E
	QPorJ0LPFm8mAGWB1tE3K3fdWmybEvlKeHvp8UhUhNrdEifWa6OGPS7LnE7wGXIh
	skgbSgLLge0g7e+7PAi/8tH83vi/wUE4DnQUTb8dNduMcBnFeDgSOLcnaoBraxUn
	7saOJA52Wtjo7HKcCzBMGVn0agduY5RowBaJm/5KIeAs/cET86JDmcWLBqi8b0fS
	5By1j81OnMDuZh+ioeIcgar06PZgY0V9J7LjX61pyhTKc1v1ArBEakeTFQZjihA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UejiwDtg6ba3bUejjwCCeW
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 5/6] argo: introduce CONFIG_ARGO_DEBUG
Date: Tue,  2 Jun 2026 23:05:38 -0700
Message-ID: <20260603060539.1181809-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603060539.1181809-1-dmukhin@ford.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030056
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|PH0PR16MB4183:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6489ca1-abe5-4a51-cd58-08dec1362e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	t9MwpWE+J2zwxOL8RDPlD5dcWeAMXLjnkeVPT7eSQqhNscgc+FBvV46V4OkiMRuOXl5BJ8xNTyHXLyzwKaThELa1zqgv62mbyiMmpzAUs3j8Y4xQQzDaOwxHLTcfP/sK531LEVZjKPx2kcWFqnM8ENXm/NKelMKYGtex9EPM2ixjegFG+3Q7p54tDtRnZI+mO+xebB6I/UUTzyTpanfIpLMYBt960u1rvr/bKAr2bj78xRrLqYOSeNSNBfFJ7X5MQVEsyl+xSKgS8ZMnSHwjFT5PVaEZFlX4JQw52RPQSO2rwEVDSp3o83wLLD3IrAFhY/E8+dAT2Pq2NaaKLqQvdx46/pOOlO9thCcvkbTXf4LZEnJsSaukxfveQV4KAjjOWPilYVzAsImCyj9QDMbmVjLN1gAoPkHQPlPkNb4I68Cc5X8oRnEEdBrkiF5+7WcyyTu0KYjHIZeP636aGaXGWc0u0KESqexkIqHTMiJDth//j4bfVXa3zRpssh2Ai+mbZ9Yt1ZSMaJQF+9cGzD1HwHHCvz7GvZxfAsXEpXmA+3MsBE/s+Y8mHHZuE+3RYLC1KczzmZuVOxD2zj/VX6E0cdJZxH9GbNerF8vn02owSnI5vkumZA56jgrVm8WPnMQww8MR0iYtzCsf6KJ1qCIa+r0tZdR7GXi2h9AxcLbc6bfiJkKVDgg5Q1J8iDKoK6fs2stlp3pgRQy9XsP0p5v5kYKDy1NY9TxQAvUAeluxA3M=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yz4zS14Vuaxj6b1MKHrIjNs4ZcIS9w2itL8wYpFPUqf/5AUoZOGrBhwH8lKvB930lbBZ8rWzwrPZE6BivUhYugWyuiP+gxx2sWX9esCT2W/qlPQPQxuSJlR+lP85tW0ErQbXXWMFcY0KZhHDiU5/DmLQEduWyga4rvyk6k2a6Rkx+8Dlrhlu2CVgP7hfucS5FPzETZEwJj7a/F3KqI6Hapx7b+s3vXI/Ft91/IerNo9o43pxCyAKSJc40lbDiznLmSkot/PVu4lhp9JZYtA9v4z59HqoJsflfznQ2KC7GlJ3VK0V5Z+z5A1PETLvkCZKro/u9SmJPAGGbSdiRnVus4ubejVsFX+vCK1yUVVepzV/r0S0rH3XERguK25Ec38F6WZZrpLWOQZcVAs3oE9/+G8hTz3eIq1n/wdbxiLyU0qK65IQs0NHgTL/LTmjBySb
X-Exchange-RoutingPolicyChecked:
	MaAtOYXbQpCkVfYJvLphHxXesVpp0NktodPlzGI3Lf70ytIK+iB8W99/vRbKwitu3pTWRE+FJVKfDrP5n8G3yZMyZ/iOi6g9DI0BKBuga2kqvdCGmWcg1SuZ2pohhdAyRiYJ52zp/7NhuMvoOvX9CUY/b/xKA93RVMku7pRmj1yeNqORnsk1o8qsnnlwNjUm9OmTlfxFtZ9IhufVq2Sr9OeZm9f1D65T8cYisnwF8aNCp953QdU1hzj2OVHrzBsq0sxP+EmbFD/ZPJZOvvaFftqMmhWBxhg18W3zq7uezF7lSMOMDsr1jsZoWp2y+oaJzqM9fi14CBV0j+V50iE8dQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vvd3t7SJQo00I26xrz4aC39PG9OnYVOa7IT+mnvetMWrvjfkfNenn8YyD09absoVxBz62SqYN0WO4OfWc/Z37cR/68AkPpW6pzZj1FmkH6ay6EudyrezOGwniFCKSaRMSUzDfV1jgtxbmgCsRVi4UeWq/nNnyRX6ulehASoZkrbcbYyqOu+eXM2L18pcyhg8b2lJ0V/0dJn45ysBb+NNeADyCoRV19H2MtEGhj7mUh3KrluKbcUYbPwCRMoL8vpbUohdZAZyealc60KdBe579gfMqlWna7nMIIsierjgRfR8co7uN2FoFDzuXspG8Gbvpb66EAUP0yePi5NqPx9BhIQ+jGZZSdRTdPO/bzbxm7FoR6d3dRO20+pQGZ5YHV+shy+PMw7Mgq2OjRBhJqKbxDWzeFyPIsnp/9RI7mU5tNzwcEb4fANRbDuD+l99GQdqUv6kNwGAhLiBwINhbd4Pfag26iJ3bWvMP2Yvb7WHkxH66f0SuAmgfjMpj9opaMsb7LaXMQtwPUeTPI6pJ+3cVKPEvEWslRxoH1BXvgJlLE4/nfNKFkfINnculvVsY7EbkeOdv5mr+rrvxO64KTTSS2EYjiPJXMTPEbqny5hAtqu4LUQL14qJn9H5EzQc0Jne
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:05:58.4330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6489ca1-abe5-4a51-cd58-08dec1362e8a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4183
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX4eGCGWKulWli
 yvcsh+5MwDicFHxlWKV0KRcWj7cmRs9JkyoTrYNXpSWD99T0RITp2HCm+2gc/yTmrBy6NkVO47N
 CaqLWH6UfVSkThxVW1kb7jgZdex0/8KSZ6Rs8CND41HFR5rkjVY7qreFIppyHbUbJ5UYe2qG1Wk
 rhj7YdEuHifBpVm8PNRr7+tpe8Eqs3R6AprzHCoQ7Ev4B99XsKXZsli6GF6MUdYknhGqMVYWc41
 ubyFiSQmzDqBta6j9ywGjZCUknwda/vNiVQgNjnm1fLPydGoIl7yU/tLSqX3adWiK/yFMMHgjwA
 qR+YkJpAOrnKrwnsA33+Jz7LH8HEL6Wsh3ifOV5YVEuNnn0gwTZUhhHyzLyqwpNxZQnO6nZYW98
 XoSkMQGrJfaKV0bDWapXDKyMR7B2eNsL/S3nqHdn3SE3ZM/kYzDgH5/612t7MlkprsfrScfJNtH
 5pdkxJ7kk1XChU3faUQ==
X-Authority-Analysis: v=2.4 cv=E8z9Y6dl c=1 sm=1 tr=0 ts=6a1fc44a cx=c_pps
 a=W+OgQPQm/Pc/5TU0+uq6wA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=dZaor0y3u6X5yiUebT4A:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: WzA1-MJ7g6sy8VIbg4l_n4oOI-oLKR2R
X-Proofpoint-GUID: WzA1-MJ7g6sy8VIbg4l_n4oOI-oLKR2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-42698a/1780466765-18B60F3B-53063ACF/0/0
X-purgate-type: clean
X-purgate-size: 1399
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1E6263484B

Add Kconfig knob to enable traces for Argo debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- dropped uneeded "If unsure, say N." from new Kconfig description
---
 xen/common/Kconfig | 5 +++++
 xen/common/argo.c  | 3 +--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5ff71480eebe..17ae01265ced 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -491,6 +491,11 @@ config ARGO
 
 	  If unsure, say N.
 
+config ARGO_DEBUG
+	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
+	help
+	  Enables extra debug traces for Argo debugging.
+
 source "common/sched/Kconfig"
 
 config CRYPTO
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 3c38a51d09a2..b9b362064e7e 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -318,10 +318,9 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
     ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \
      LOCKING_Write_L1)
 
-#define ARGO_DEBUG 0
 #define argo_dprintk(fmt, args...)                      \
     do {                                                \
-        if ( ARGO_DEBUG )                               \
+        if ( IS_ENABLED(CONFIG_ARGO_DEBUG) )            \
             gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
     } while ( 0 )
 
-- 
2.54.0


