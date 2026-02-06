Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zxCjGzJOhmkzLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E5B103162
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223853.1531253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNn-0000Se-CL; Fri, 06 Feb 2026 20:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223853.1531253; Fri, 06 Feb 2026 20:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNn-0000Mr-6r; Fri, 06 Feb 2026 20:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1223853;
 Fri, 06 Feb 2026 20:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNk-0007sX-Fa
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:48 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0382352-0399-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 21:24:46 +0100 (CET)
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 616IONkg008154
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 12:24:44 -0800
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012024.outbound.protection.outlook.com
 [40.93.195.24])
 by m0482516.ppops.net (PPS) with ESMTPS id 4c4v83dr0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 12:24:44 -0800 (PST)
Received: from CH0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:610:75::28)
 by SA1PR16MB7004.namprd16.prod.outlook.com (2603:10b6:806:4b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 20:24:40 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::19) by CH0PR04CA0113.outlook.office365.com
 (2603:10b6:610:75::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 20:24:36 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 20:24:39 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616HcMQ53490164
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:38 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c21pupgxw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:38 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id oSNYvS87kFVH0oSNYvli5r; Fri, 06 Feb 2026 20:24:38 +0000
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
X-Inumbo-ID: e0382352-0399-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=iG5
	bdruXvwjOkGeq9u+92H+E2bXW726qNCD/5wDXq9c=; b=WXB38UuqsV6dh4sruYz
	LqzBDLspW+0WZhSABHEOywPNC/AVVwP8QuLKxGYvKezYLbMbZVPwCh43rhNgkeUM
	AQpcKKLUiuQ9WKFWl3w3rKbjwKPUQUMvJ1JU20LtG3+H3ZzhoqlrSGegrrd+VVoN
	MicrPZwYetBtn/vRZSnded+B36Wv5AFMOQFaImx3AuAATt2E00lFJ6vSs4kRL8GL
	Gk7ShWfDWUnxagJpBjix+/Uxj7jIVUSxoV0NntTu0zFnYWzr70He3vERpUJuxgJZ
	uVX+D82ZowTmVGZ/D+k1H0riOLhBZiHnmCx5bzE+Hsu8wNzuRuZn/yGPBffBibqS
	ogA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elbmEeoOEO7Tn+r7I2VAPJx/h4Qx9oANUnyNbVYq131zY/RFOCwMxFYNlaeNCXS7kptxb2LJWfmlCCqfndWso9s8kZIzD924vG3wOz1M7DwY9iNzS/a/IHeZSBdNgRvQETtnoAFNwroA5iAFD9bc+LWmPOzyCDPDs8BOavwo7CNqqR3umo4xyQYHZiQ8RBkeSs3pJmcjcJwISNiixCEqgHrRqIEC0L4uEjG//WAE+Y5r11FprCIdGb4T6NxEarMJQh/J+5Klz16SMNVmQQoaSMd3SBmue6TDihtgswvz2rIYCTxpXlknmFUByGL++SYN45D6HiwNo2cvwAtGqGkIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG5bdruXvwjOkGeq9u+92H+E2bXW726qNCD/5wDXq9c=;
 b=HMODNjtLbZ2AUyWb91UJLBz/bxKxgwscLQnvR06G7dkI5u7ULQ7/GRAxyyXaIxtgfj2x198Bxa8D2m0OgD3RBUV5y3gwpk90aYwGhYTIs7MzsxK2EG+fN9G4oUVms43jKZyxEAXmI4hB8Cc3JMmGEI4fomTiCeYrEJrEcYAHTNurMNhDj1VWWK8tzOxsYyjI/E2M3T+4Em71MLZb+YEyMhKL0p9/Q6DDAJ55YY4LRBowFh/pLuwiLZ16kluSuGJlW2pNxE8+7Nthvk4svTZecFizn9LUFMGDVgFS4isE+XFzoehES7xMYn4kVn4R1XlY2VEhGVOUP5HYPvdO8zPjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG5bdruXvwjOkGeq9u+92H+E2bXW726qNCD/5wDXq9c=;
 b=GdvxsNCrKQcNqh13MuLB1hmHUYYODtpmVHMHuhumvK4oR0sVFpHIHfESfIf0TWxBcbQN8KKBCikZ+Wxqu2xEhI6oyxQ7RxvEtWE1CuznoXWtqNEp9C3kCMdBAQlCiqYN0TGHY3ZwZUZFwwf6g5ILvp0LTWeCQFV8jw86ZH94BmI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=iG5bdruXvwjOkGeq9u+92H+E2bXW726qNCD/5wDXq9c=; b=
	oxHt6FogF7g2sC7QjSDnyinOERA3m4iub1UKsOpNaRUrKQl9qwW4vbohj6GJZ7WI
	i3n3PXPeZB5blvUgDkkkzO/UaolRD3Azlxzh2C7hwl2PdvVFUXLhpPu1PpO0JwJA
	QlEf3cl3vpCdQ+dT5njcisqNtR6qqG+Xd6J67I0rRYId7JG9pILrWTC6hFySApKy
	EGdcIOc1Oiqb+aT8JGlAd6HHNd3sL4MXkrkHaMnx4IL2Za198sn6M85GfjrhJfXb
	dzsSAA7ku9pR6OgxAQAkmpu6cooHF8r1H5Y1bZHTFmwnujMwQ3ksibS9FD+JtZqz
	txg3IQvEqu3JMNTMwLha3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=iG5bdru
	XvwjOkGeq9u+92H+E2bXW726qNCD/5wDXq9c=; b=TSi5W+jEESQF/Kk9YhMwNoe
	ENzCGqIiYX32gI04tqyQyYtVkkggnWCOI18dhuZdm7pJj4jauJuegeIP9fqGYbkr
	jkWhyQz/t8NygDPFO1qTDy0iWKKY2q/gaoOGxpAzbMtDbxhAjSyR0jB1fpkp4O8m
	e8InB6Mo9w6iaxnkbQdYd0lrUeVJJ02/TmC3RpEfSWDbFqV4edHy6AboR8DoXBKO
	MY7cAm0CgT6vy9r8TH2B7Os5t3EMojRlGcrmD79OZj7CJI+WuvkvP+3eXcaMrG2I
	vAG+YDjLnucL89YLiMLvWJgZi9NWga5ML9Uz5JCJhS20Ry1ZRkHVAdmOx2tjJjQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNYvS87kFVH0oSNYvli5r
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 4/7] xen/console: add run-time rate-limiting controls
Date: Fri,  6 Feb 2026 12:24:21 -0800
Message-ID: <20260206202424.2054758-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206202424.2054758-1-dmukhin@ford.com>
References: <20260206202424.2054758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA1PR16MB7004:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e0a38e86-d5e5-4257-c1d5-08de65bdc11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dOnV3vQS8yXHP7nbUF//OJXzKcHDDDA38rCbML5OC0RL1YuDFGv7DhlYaUjJ?=
 =?us-ascii?Q?XNCQcUdBQGCEsBtcXsDgBKycB6T6Ik+cb5Mdg5FCbVCXsuSiB3pZ5IsgAKeV?=
 =?us-ascii?Q?4+hMcydm1DksFgA9XxLMqN46RJV5k233V4LAc6X8bNqcaLjCB9pEsYoJETT2?=
 =?us-ascii?Q?kPc3O3yJ83ByIi2k4heyARFCMNWzhBBRP/HpCajbTkX52dcvSF/9ZzvbQSvr?=
 =?us-ascii?Q?qH0pgGy0J4Z3i5EGF8JT0Qps51sLbZhh4Sh5+f/YH4dz4ZOIHCpb3UwoKVHG?=
 =?us-ascii?Q?scXXbK2qkurMqBIpameVCFV3r6MIhK5IUnZyQyV+VA93UgHx1pnpSfWpFYf4?=
 =?us-ascii?Q?CXnuWeVRgHe1Lz5q87BSGP7JPmmnd9KxFWz+uS/BcQUe2L8+klPcuO5VyuP5?=
 =?us-ascii?Q?g3iPqHusSkDD2A5JKymfP/YCWdxHGtCmNMZfio+vdkgFyrMKtGFopvBU1UAz?=
 =?us-ascii?Q?ISMzDJU3EvlDZNLPUwts09BjyrWEcT/2MsYZctjzBwUj6wqoBQVTUQUdfrUl?=
 =?us-ascii?Q?QhP+QjQL5zyEf43LNh/19RvbYCUnWDZERUEOtVFzQC5CfX4+V4qlwzVxlLfu?=
 =?us-ascii?Q?iTYwRGq753Y6ED6cr/r0oMd1WdTpMV0xMHa8NkHQPDRoXvr2ocpfqJ45Zvw9?=
 =?us-ascii?Q?dhIZdpez1hciTQ/v13ef38Jm6By/Ul6l8V/J7X0qLpE7bAz1upJJIMxal+/P?=
 =?us-ascii?Q?wjJObI2HK+V9cwuURpu3zVJWr56XuiLMyutTn3Q6h3OsXN67sFJiR55p6M6i?=
 =?us-ascii?Q?rQlrc+I9+HmsyYBw/scDVaELwaIjb8MJ3mkZcZlmLcjeo3r5W7TzJ8E6Hxky?=
 =?us-ascii?Q?3scTg9GLaBQ8B6TLMQcFtM8XTm4lLrJD5mGbNV83LAtEWdDcFnBQE5Qwt9g4?=
 =?us-ascii?Q?LVYCyz+LdIQcG1lQYHyJJemI2zyhevcx9hPxW+Q9gSLZ96aFJpnCyH6MAPVS?=
 =?us-ascii?Q?acZgF+H7LHM/anEuSTvUU44u//vVgYHkJ7C5JvWbkY7RDe0IwYjTv36D3DU3?=
 =?us-ascii?Q?KNvUO/4OEadXlCfxs99LT5h7T1o57If991eUERQXigtHrR4pApxFbI+a6ZLQ?=
 =?us-ascii?Q?LnOY5EhmMjGoAwIRowITExKpGuyaaSK7kDwq0bqhvnwKfDl546WrTdx5D8Nk?=
 =?us-ascii?Q?UUNElBX14FHiVsVGczfxmjojS/bhB6RcuCNY68jLiX5Kb+BxqjgoysPckXoo?=
 =?us-ascii?Q?UlNPfkgysli3hJk0xUmO1JQTv6TBkWEhUilbmMhhKdeiorE/sp7hqfSXZaDK?=
 =?us-ascii?Q?z+trJIM61/cJ0cOhAe38gMEgckGbiflrr1ze0NGyOeElYOGtvs5qszxV2r/G?=
 =?us-ascii?Q?H6rEvYrT2bhuIF4hFOLBNYC0uYx9eEw3BMMfpo75vS+2GgISGCDPAHNXbItw?=
 =?us-ascii?Q?BWDAMDTyPHVoXWvqVa7ThHypLa8AQPjcrzjZ2Xwir/guCsEMoIUUN5ZT0/Ds?=
 =?us-ascii?Q?xnsKz8M11Is9eGtZstDZVKsKgHerfTuLuusMwCo1XHCELsI1lOX0kng5BjHE?=
 =?us-ascii?Q?/n2eGKvsGtckhTRAdznsGT7ThsOSED762s5ZjCpB35xb4z/GENqLMkOXS61a?=
 =?us-ascii?Q?lAfcjFbyFUJkaGVwJdVTvqed2JjHEjonrkttwFqiM0U3Jirmf4DQ4GmweIhc?=
 =?us-ascii?Q?AK1HQGF/fEvyhD1QIPiWnlzhAXigFFzY0hKYM9EYGxz898xWBKv1p+BIMCkb?=
 =?us-ascii?Q?bFwffA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lx4rEcX+KnEvOnRmLK1+jEy3PVqzvL1Zfnhr2EOxNEObftZTAFKxBkriIFZQkeNKFHQP6RUuvDxo9qCQWEGuIthDNKYHgzaBme/F98/RaFBsxD1N75mD2SZUsdQl0lJ+r7vfqPey5kEtPUTIIttbmd3xXcxPzK92pHcyC1ayjcESqQfPBdFXQDaLRuK5K+Gb3TGKwAwS7fs7NUqLBRefSpfktacfvIAvv5a1bjSHt4Cx9ECpGNnpNO9V+muYqPGBVX/ofa7Q1bdSHQalco11mwYySjKpOY4wxFU3wOjS4yvLVtmeKWlVR8UfiEKC17RPX1+8GCBRDFz2k8jDSPlURrbacnyIdEb1vUBcQHYB1lqsgU2GFKAnOUoNS9N6COanbThWqMlFjw/xZXymlrDx3U0DKCSAp7Xsw2LDN3NRgp29U9slwk+AzyYIpQXsbd12
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dydQMUVoRL0+R3PaFTo92m8hrV/xAwaGlv2brqmcwjaU2E90/th1wsuOZYgdl+1p6fQiouBpiT33XeyRwPM0XIpC+d3ZIkmSdmIP59HNgoo3/1E5PcDqHnV8M01EZV2Tj/LiBfIE2Q4yaZZxbaCXgzZViwnyUOtPExSW+CUAaGYDtY362Y9Mxeowaa25TuzasTdbV+zNFs6TUCd+EwIFCXw2MNPw54AZLh4blyCSQXyeXJif17HCBuhckiN49ekzPTsf4NHhK+AfpTAOOsVKWrCFF6KbP6mhoN15yaoASYhHWtajPuZ/SCJb5A1ovtkNZzyI9WspDZ1V0EcdahWexcWslSUHz0/rLl/lUTDpo4vmnwQjnG/8RXoiMJXKPe6ooAGOxuq59IiwCa+OSSOaeFkjk/pXl+rjjgfEh1yo815xGM1TUX/FzRQWrwwJLBc0ADHI/Et0yQ6F6g0TYhTK0bKdA7khIgvMrcrV8WLZ9Lw634HDr0Zu01us5huvwyowcYNPhutwdv6/wGu/iCxawkkUGlLETYl1qYer05Zid9UHrnopeAn/Ya2s68+uWxyC89BqNxNPnlko9HJkm5x3ffov84R3fIjt4mM7RF1cEzvZVHrtSso/XQljfjiZIHIk
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:39.3855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a38e86-d5e5-4257-c1d5-08de65bdc11a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB7004
X-Proofpoint-ORIG-GUID: SgaySis_AniU5FKlz2K0c3uzrqCe1G7o
X-Proofpoint-GUID: SgaySis_AniU5FKlz2K0c3uzrqCe1G7o
X-Authority-Analysis: v=2.4 cv=IqwTsb/g c=1 sm=1 tr=0 ts=69864e0c cx=c_pps a=j0vpRZT92jK8pnwqK8unXQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=-8YlOinzr_Rz_bKtHYAA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX6WjdqgUyTRNV xKYqNUtI28ZausfeqZkCBGdtKAqaVLZKjjol3fhJxAMRnu8xEkCqw9Ghd8g0NWzmSpyBRE8xH26 1D+86CUffm1X+pIWagIVsI8Te5sYvgO3vsZy0t6q5Apm2kl1OFwTlZsGkjOEHTt03YmNV16Gzt9
 UMQyUYzTn1fl12GKiXbt+uhIrfxr2Yny2GdvoXa3fwNXpRR5bSXfLvMqza3MwdLlTVEov2vya8i 3f6WXSE/vPqXI5N7QusG3k3u+MdPFQd2h+L3DkPKffIV+4tIb2d8ATFvvkvJDpzVA23HJM6d3Aa 0ieJg92qr8GZWYMah8C15M10gTJX7cZXXVgBv0lueMitGYd2OoAVdfJMpF0rbe9uh276Q2dH+Nk
 qrMtiZ30BQpJFpqjMTVrer8ff07zdcpLNq4OAnBIIkVcsS20hMs9dHPWi4GXUMLQ+xoGhi+dlpo TT1RfKS6MYIJxLLvKGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060151
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
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,ford.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 08E5B103162
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Add new "printk_ratelimit_ms" and "printk_ratelimit_burst" command line
parameters for global rate-limiting controls.

Drop `const` and add `__read_mostly` for both global parameters
printk_ratelimit_{ms,burst}.

Update command line documentation.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 docs/misc/xen-command-line.pandoc | 27 +++++++++++++++++++++++++++
 xen/drivers/char/console.c        | 22 ++++++++++++++--------
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index c1f2def9f99c..5505644d1c0f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2077,6 +2077,33 @@ compression is selected at build time from Kconfig.
 This is a mask of C-states which are to be used preferably.  This option is
 applicable only on hardware were certain C-states are exclusive of one another.
 
+### printk_ratelimit_ms
+> `= <integer>`
+
+> Default: `CONFIG_PRINTK_RATELIMIT_MS`
+
+Specifies the time window, in milliseconds, for rate-limited printk messages.
+No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be printed within
+this window.
+
+Setting this value to 0 disables rate-limiting entirely.
+
+Rate-limited messages are those controlled by the `loglvl` and `guest_loglvl`
+command-line parameters.
+
+### printk_ratelimit_burst
+> `= <integer>`
+
+> Default: `CONFIG_PRINTK_RATELIMIT_BURST`
+
+Defines the maximum number of rate-limited printk messages that may be printed
+within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
+
+Setting this value to 0 disables rate-limiting entirely.
+
+Rate-limited messages are those controlled by the `loglvl` and `guest_loglvl`
+command-line parameters.
+
 ### probe-port-aliases (x86)
 > `= <boolean>`
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ec87ecb3e5a0..f607e8f84d7a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -344,6 +344,20 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
     do_adj_thresh(key);
 }
 
+/*
+ * Global rate-limiting controls for printk().
+ */
+
+/* Minimum time in ms between messages */
+static unsigned int __read_mostly printk_ratelimit_ms =
+    CONFIG_PRINTK_RATELIMIT_MS;
+integer_param("printk_ratelimit_ms", printk_ratelimit_ms);
+
+/* Number of messages we send before ratelimiting */
+static unsigned int __read_mostly printk_ratelimit_burst =
+    CONFIG_PRINTK_RATELIMIT_BURST;
+integer_param("printk_ratelimit_burst", printk_ratelimit_burst);
+
 /*
  * ********************************************************
  * *************** ACCESS TO CONSOLE RING *****************
@@ -1320,14 +1334,6 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
     return false;
 }
 
-/* Minimum time in ms between messages */
-static const unsigned int printk_ratelimit_ms =
-    CONFIG_PRINTK_RATELIMIT_MS;
-
-/* Number of messages we send before ratelimiting */
-static const unsigned int printk_ratelimit_burst =
-    CONFIG_PRINTK_RATELIMIT_BURST;
-
 bool printk_ratelimit(void)
 {
     return do_printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst);
-- 
2.52.0


