Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sz5bKLkXFmr3hQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A45DD070
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 23:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320178.1587542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznN-0004Ha-QY; Tue, 26 May 2026 21:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320178.1587542; Tue, 26 May 2026 21:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRznN-0004Es-NL; Tue, 26 May 2026 21:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1320178;
 Tue, 26 May 2026 21:58:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wRznM-0004Em-6E
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 21:58:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRznK-00CFSu-W5
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 23:58:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a161783-bab6-0a2a0a5309dd-0a2a450bc60c-6
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:38 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a16178b-212f-0a2a450b0019-94a392175ca4-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 23:58:36 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QKrWFM986654
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:34 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4edehkb5jn-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 21:58:34 +0000 (GMT)
Received: from PH1PEPF000132EE.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::36)
 by SA1PR16MB5121.namprd16.prod.outlook.com (2603:10b6:806:326::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 21:58:30 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH1PEPF000132EE.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 21:58:30 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 21:58:30 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QJWqRe2291769
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:29 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4ebu9cu9g4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:58:29 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id Rzn8wf12Ol9zvRzn8wKqWY; Tue, 26 May 2026 21:58:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=Lu/bScFOTZ2NM1x5hnwYfy/6h
	1orYjRxEVbML1jLjls=; b=YvwPboMMCo9jW7IJ7ADaYNZQQmxnYb8jPx5FGKQ9o
	1s94v4BTuxogzaqCdGxgfZ0PFYImbxl5kSldU7vTLvq5IQ+CXEM6XGU8KFQuOs23
	KfR7dck/eq/+ooH7UD07Yf6TQVhriCKJVrfvM3yc/nwMaHC3JRZUmAyfuqBs8VSo
	+0QXXXnRXhPxNiusEvr+csebVIPy8kVzo/tY6cS8b72EaQH9BitY8zR+wqGaqUgo
	BTAx4RRjN/CM+OAUMK69iJSee2bEkZbsJPhdaXgtglH9EjW0uPdbm9UF+c7nlp9s
	V9u33lMLqPmxGOvQ+3cispfIPlRcCwO4PimavxuIQYzWg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjW2cTjaCsEU7Ol41oOpyCCY8ev4DA//jbbinHrrhDEUtOela60G3ycDvfLBMtWqnZum8KyGuSXEMxkfNJHemmvLCFCoZiF15/XuuF2JVraBDO1q79x3e9+PuHbTSxa/oD39VIcI5511ykdXpCpFpW7ciTM1SNc7IzV8zkiR56KKPgAYPI08A1M140gOrRLSqITIi177Dd+PGSGkF/txPQRbZZuYy64dabdy9o5tsvoS5GIZnjh1DnwBt7GujeVxPXBtxN0hF996hKqGy3E4VWQPz3HKKQVwpHPNPwq6lj37QV7fir3dd/aJm3vc4Cfl8qtPRGLja22Wa00hOxErcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu/bScFOTZ2NM1x5hnwYfy/6h1orYjRxEVbML1jLjls=;
 b=l6NK05Xw524gM1y77n7CvJcRVmb2ZsoIRukTve9AKmqUXTuK+1YELCyA+HkSGmdKz59xN5b8vHKWuaWdyrzD85YbFdJWMUBXKwN8hAmyrRwx9h/kVrTUiS8WBw/ffq4FLfPQxB0h0178R1ggwgTLtv0OmGd9dKIRaJmAM2oFTm6jw1HCNEvx/bM30jnb7NE2exE3KEj8GHYCy5+PUDD9etg4DvRf/n2cRc/0aCPnzwzC9wpvdH3EXhwFlkZx0yNAxRtj5hx+iRgLmbKUgAhPJWt+wCfUoboKJ1YhZ3BmGvj6boUSzYiiCcNawMgZKSk9v24xBty9OX0Wgi8QNghAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu/bScFOTZ2NM1x5hnwYfy/6h1orYjRxEVbML1jLjls=;
 b=aBvqnqGicr/ju1MygrBokvjnE71EejxuTwPFlnj031JeJnX8qzYtNwbX4r0vyOwFy0zSvfKRNXRhgtVH0U8/fzlSsncG8CcG2nMXEY5hsbFMiGBbbSvIz4L30YggBQK2OmAWrLR85396LRUmXWEPldfW+wI/BQJ0bbRigJWfWOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=Lu/bScF
	OTZ2NM1x5hnwYfy/6h1orYjRxEVbML1jLjls=; b=Ip60TYncVcxkBRvwwthgSY4
	pVc/u3b9WCmttLSWccQlLWLKJuEBF8WjR0RTV1SW8rgJSDOQj3Crvx2uOmbedpxh
	dl5P3759SBGKybZyJx/oI2QpSi6ABa5uGKvHjKhz032ILrUA9QzkP6XGZHh+SH4g
	TkXKU+K0Em3DQptGCiNmRBdhoV6sLv0y7OlaF3OZ5yFx8dllTzhD3m/edp/pDpax
	q6yvXNPwDw6tC2M6YrMWWBSDSETAftewxsuZZMc3TJRCOKt2Ratnhpb+76AeONfV
	3dix26YvV6PMU0khjVDBKNQDixNTXfYC+PNFzZi99SyEkt+Vv2uOBWf/tJsrMnw=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=Lu/bScFOTZ2NM1x5hnwYfy/6h1orYjR
	xEVbML1jLjls=; b=dTuTOKnI7OaCJP8htaYKJLYyOZ5hiU+KkU8g84pVjwAPDqY
	fHS1XUr0EXpomGfXBadkMgFHJK2WXGZuCHLjJtu3PtOyawuyWV2YZLgblOVYvu7P
	7XrXf6KPUglyXtrDSAr4DUSeXsMGMrau69jSXw5pEXdZ+MsJCAUbzeaVviB+zqXd
	JxsmPEI3DV3VfDA2J9eRfkLnhT7/8GDRHwBX2u6DX3GBCllGpBJIKz9LkAaYdJco
	AK8RDNeli20HBepDbe1TxzlFfGDTyPwIkvFvdNzsjS3n/xEGMXuLqh9jex+PCBVH
	EItiK1I25rgRzLBTnUvSV7Ffjy7uBeKH/ueK+dg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: Rzn8wf12Ol9zvRzn8wKqWY
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH v3 0/6] argo: few log fixes
Date: Tue, 26 May 2026 14:58:17 -0700
Message-ID: <20260526215823.1452619-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260194
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SA1PR16MB5121:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5978ab74-e958-4920-a9a7-08debb71ec4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Qfm53cF+IAIhc4s74HGnm2Aev6rPI1yT31cn7x7yCiWl6Cj0wgyiL1VyvFLfaP/JrSfFsujl0B7B0tKmE6NnIb0Gw5uGgK/DNVjLkr54E0//w+rdXhtzVQpv87DFxSYEigcD5WFm0YppUbQ52JKLGun76usO7yJfdlc/94QQjHiyg14ettBHMH060M4Ir+czQND+YUVUdqilwFXeP2OjkKS+8BcRaQofbbdctly7ai4T1sSi1uBmhbhVK5mbiDGuSubYpD1YfjM0RO35hbiQxxTrzxtdR8LiVohtbPPPyfL/1qRdyjbjvXatsTM+UVHvpPAbNiF6jlJqp8LG5GSedNJ9m+zUKmeC4jgrNikvQ03yD5xsLmUwuXUnTyw4e+k6nREwP/Y4dK3MNnn2hUusERx7lhK4YrFgqILNXSgyxFznRINW8j2VbdvjKBNPPEGMoa5kO1EDHfpssshzYwk1lXl1CMREur3PK9b0pmmWBw8A42/Zy+2KPL75fz0gq5zkP7VTkgs1z1pVRyXXg6wbWx9xMSWyL2aPsGE415vNitI14AfyA5UJATxZ5/jTHZlNtztjvvAIZJ2SG287OB5RNOu4JMGl5byDAYJKxjKi3zpeddOQZvVlVmDm+bRilh6Xu7TeadiEd/ge9zep7PG/pVi6zH7DmhpmAB6MsQhgLXv/EUwdGr4uVwCCp6d35ekPd4k/bzeAOKwhb/0K1xR4ab/J97Ks4hh5ZEadBoFf2MpBH0jya1uo0sf5hpNSmRMJ
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zjE/EbCNIbpqVTLgBtF0ZNhfeExqqqUyreidSEX7gfwZQaKJvGM69Mtu/XU2sYYm3LmtP4TzWMsGBzJOTF4ZpZdOWKWz7ClS1xgeidWLMm1ySkKR4nXY2HeaYC7RVaM38m/qiKC+07viqThmOIpQVAUK3XualhUq5JraQZHZ1Q65qmfLDBtLKSzmnZQUTI04mzW5YGhbUBi74Ws1Lt8Rd5Ix7ItU4o9SVhE+teXX44SIKcb6pEEhL2jfconom1Mk36njGqpxYJd9SI9XUSHkLIYV+3TeadqhYs/gUJzsZZ1POKWxOK4P8A61cNXACVK9FlqXcnXA0hyaSpnBwdU0+2WBLC1h2/oZz78hUjlYXnSw5lRu2K4hWdNx0DS5cUbFPsRQK9V4KIeDlutwPkGwlu5CW7AWtFol3SbrlvLbSZZzFyY7EjyznjlX//hPLphv
X-Exchange-RoutingPolicyChecked:
	Sxv9dedDcqNsQIhsoBy2sa/V21jjJGfQSnaXISsDh9M3Bee5LXQa1B2gQNvGMZA24HrHzu7Wd5YKj1XljS+77EVFT7qojDx7IugYbzMR1QAEoPnhp4uJIq3sMGo1Fc/RYeQJvEWhSyP7TI+YwF/5o4XPpMrrLyFrr34kGwv3D5txemouTkCPGzoe4pJrinGieh0aF4fYjIoEAzWVZMJWCY3zIkak2NXnPLLdbvO9uW8o5n6+Eo6PsCOeYHi6hbccRFPObR1THdUISiB29KBcjNewDmamkW9kjRg9G2fBr2NKdf4AdItO563UlJ+Q0Ww3oF/n0l9tbMmQBzdo5NuN+A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JD3ih0jPfKfAON/h/9kypt+KqrG1YzGGtuRRZA83PlA1sGj5u/+umD7igL6rf/uMWmZfP6rwiJsqC4TzzGs1Xyey5yy5xgOol0SZvkzJYIscgJi+ZVKTYe0U3D//XNrMKzY1Vr0WE8k1ov2sN3+mXty0xCVqRbVQN8kjlhV1hmPFL+R7BwRb17OFCDo1sXvHC+GpW1UWILzLEKPue26sYgKFe+05xsRmp1xe5uJ9mDh2r4fftLf2n9ZPomCFoYzKGzkFvkAn0kZpZwl4h273sQ0lWP944f1cHPZ4msH9E3Hhn6fEv7TL2QgpcN6s1+bSqAvuavO6bXSykdX3f1O6X+S53L+oCmEYZL6sPRBn7nyj5s+LNzTT3oFUCuJDkPpx1U3ipKri9FLvDqx9Dmv/iOZSqfEo0eJudchl6EFjJhJLtMshyvUPgxyEYmC9/o1LU9XTuoSAu884OlFqZuiE6pMicNku0u6wyS4eTCS97oJk2SrVyMsgzO3IokPBoO9/lk3alJHyAoxUa2LORbKF9AuOmAAgL+v78V8Qo+REkMNmF8R5N+JiCyuTL04X1006WSh5rqRWV2pJFnobNZpGpU/nVIEwg7U0nCvbF3Cl8UA9FxBqTFlXRGOLMN/DDqWOCUD6kTCRVqwmpCQEGSH0Sw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:58:30.1462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5978ab74-e958-4920-a9a7-08debb71ec4a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE5NSBTYWx0ZWRfXx56hDb49A7j4
 6iVOD5USS1rCexYQQWixIaqlRQeNKXrHX3jEkuF6p2dkx1B7UqHgteBXneVJDl2BgWbOAvpZw26
 IpC973EfB/xS1biXnzj6L62XGJn221NYmD7qWeXNb/0ANEzq5zYZhu8t8iIoBlW+NN+LQWU2VVN
 aU9IG8CG/2CxyU4e6F0ST0DF+qrmz8xD4pwBKvE6EC5nd1gecJ9gBxcE2gFcuHx2GMQpxMyiXeS
 +I8WqSaGCg+hbxf8Q7ROdD6YKfzrLRgQf+NEKslG20GCEJ64BaulGJ6gCltCkDalSQ7ocTtwV8M
 BJ2hU//yxO74pX+4S6rCj+BNqKXLSI6IIEc3XvtJmX3U7JuGy3DqS41fFJzOrojsr2Vs4i66X68
 A4zWd70HU84592FSB+N1OE0N1qDeoWdwUhiLDRMgAFL9BLsjiX9b9DML+Vzx8qSFTREMYgEI7Hd
 tMc6uPcHNNtC/NSjnGw==
X-Proofpoint-ORIG-GUID: PwBevMsNRd6_4BDrrBC9yT0MDLqVWTZ9
X-Proofpoint-GUID: PwBevMsNRd6_4BDrrBC9yT0MDLqVWTZ9
X-Authority-Analysis: v=2.4 cv=U4uiy+ru c=1 sm=1 tr=0 ts=6a16178a cx=c_pps
 a=JgOmb2+ItGzuqF5frRSN9Q==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=XgQ2emwpFZqBfdcwoioA:9
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260195
X-purgate-ID: tlsNG-42698a/1779832718-12573F3B-A895588F/0/0
X-purgate-type: clean
X-purgate-size: 1140
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim,ford.com:mid,ford.com:dkim,gitlab.com:url]
X-Rspamd-Queue-Id: 287A45DD070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series corrects Argo module tracing.

Patch 1 lowers the verbosity of a spammy log message.
Patch 2 corrects the debug logline.
Patch 3 cleans up existing loglines by dropping duplicate prefixes.
Patch 4 rewires argo_dprintk() to gprintk() to include more debugging
        context.
Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
Patch 6 enables extra verbose Argo traces in CI to make it easier to
        catch potential issues.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2554382112
Link to v2: https://lore.kernel.org/xen-devel/20260522165238.844649-1-dmukhin@ford.com/

Denis Mukhin (6):
  argo: lower level of noisy connection-refused log
  argo: correct logline in ring_unmap()
  argo: drop argo prefix from argo_dprintk() calls
  argo: fixup argo_dprintk()
  argo: introduce CONFIG_ARGO_DEBUG
  automation: enable Argo debugging in CI

 automation/gitlab-ci/build.yaml |  1 +
 xen/common/Kconfig              |  7 +++++++
 xen/common/argo.c               | 22 ++++++++++------------
 3 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.54.0


