Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHJWA7eG/mnTsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967F4FD281
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 02:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304388.1577434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0m-0005Zs-7z; Sat, 09 May 2026 00:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304388.1577434; Sat, 09 May 2026 00:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLW0m-0005U9-3T; Sat, 09 May 2026 00:57:44 +0000
Received: by outflank-mailman (input) for mailman id 1304388;
 Sat, 09 May 2026 00:57:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wLW0k-0005Sh-S2
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:57:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLW0k-000YE8-8p
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 02:57:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8610-e002-0a2a0a5209dd-0a2a4505ec34-36
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:42 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fe8684-aaa8-0a2a45050019-94a38ff111ce-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 02:57:42 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648JTfpd2122805
 for <xen-devel@lists.xenproject.org>; Sat, 9 May 2026 00:57:40 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4e1nc0j8e9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:57:40 +0000 (GMT)
Received: from MN0PR03CA0030.namprd03.prod.outlook.com (2603:10b6:208:52f::19)
 by SA2PR16MB4139.namprd16.prod.outlook.com (2603:10b6:806:14f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 00:57:37 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::16) by MN0PR03CA0030.outlook.office365.com
 (2603:10b6:208:52f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Sat,
 9 May 2026 00:57:37 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Sat, 9 May 2026 00:57:37 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 648LDDXV4098353
 for <xen-devel@lists.xenproject.org>; Fri, 8 May 2026 20:57:36 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dyxwd48n3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 20:57:36 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id LW0bwfoEdwlY7LW0cwA7Bt; Sat, 09 May 2026 00:57:35 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=9Cu
	hYlSXaFfyQQaLy3X2h44EEpfOSp6LjenvqrTCogI=; b=Qrfc/8XfnnWA+WTLT4x
	xisEDeMjXZwk96P12H9AlBLjKoWjMH3B2dIkamaD67z+53z+N7XoZTscmB/nxywM
	HR6iFb0mPP5O96Dg+OFGL465Veceu3myKWYG8ACEoji3RntWlWHz9vJHiGP4HSm8
	C/hiSYUHg09TqnzQMWkumKQcVX7f9x0O+VawxsML+mYM6Ma29kSIVeDaI5NZlhta
	0PI3R5c1dWT4/aQsLVdLR5FCVYHRlIt3hj8dl2DzQ0zkFbDu2LqUNL24H9ohoR3L
	aMSZR3DRtRHJCvBHpnrmz0RGSnzaJu5v/zoH2HO5FqY+RFwKcxQidXqu6iBzFA96
	JKg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTvCNv6ruVTyRk5xdaGXigKUlBR43GaqpMxhguNMNB5L4/F7EvsmNMkzc1pOSnxuZNAloD2Q0+cUr967IUnnPeNh9nC7eTE15OLY0DZ5kZRfheuEWghkzUtxEaGzjnEOv7oHWVD0ciKKVWJhdyCJc2WU5dufXMgDaEpk2hOYWZJQdSR5ugMbArXvw4Jw/6ORSc3bNnsq2Toqq4oEyIyAh6LYNEU2zP6ulvH6vyj7DNHfd58paadqkLLvXj0ckwDMaT2XMoFKhPSid6cZUwDwxDRxP1hgMqb9R6foqx54SkWbjvZos6jwLDvLTf6Y+XfZzRzjxZSNuxzey5WRX2X3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CuhYlSXaFfyQQaLy3X2h44EEpfOSp6LjenvqrTCogI=;
 b=n1qSkcv5aCA2Fhe0ciHBbdE2J7qHRITwbalNFcw1AKZf1X1f5wKumD2S4OfqU2AnNyuDO1DuSKZngTiMSJqG/Ttn264ojt7hCvbj6gHRYn5JuF0V2PtUvBXR4yslHv8No+TqvzgNzP7dn1VvMtVh+ObdfMBt/KcMwP9TOpwDhKFVRD6v9mKmTeTKdetFEbdwaOeW1Xnd6u/rxahwmPvj2QJFe9lJDpaKWR/qdhC/EM3mGqodIX/FJxTbZ/ETqTDRbeHGUhUGEddb9HvpeWNgnBhvlbY8Y0jsM3sHofvuPL2JKmmkUeJVDIUzd/mdqZWJk0n/IqCz111wh840BKzcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CuhYlSXaFfyQQaLy3X2h44EEpfOSp6LjenvqrTCogI=;
 b=R3GmgWkTT8alrytYXgmm7WLByiRu7TDgQYYnty+sd4iyYlaJTuOSu5OARNJ0t6HPhJAt6hU1V1FCCcnBZo7LduCkLLGdG9Wk5ZLjxYDkHbQVI8lFcQ1iyuIBlKvk4V0RbYSPw1jotGJ2Hi6jqK5oOvU+nTbCIOAG2G1viPybaTE=
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
	ppserprodsaar; bh=9CuhYlSXaFfyQQaLy3X2h44EEpfOSp6LjenvqrTCogI=; b=
	Qf+kL+u2XtSQlElEohz9UXLyYKnumoG9ZMDXec4ztqjLWmaWGJpOGONf99iiTOY/
	PGt/I+wphBi0KLKoSHbw7ULY2ahZTPC7uDKEG1T0aVnRBhTw0fBqGl2iuFx6GFjA
	4Ab/lNH5Jx+MMxCggyIPhUy2ghr4guzY/+rmR49UmDX+XqvOrwedyJVpeb+lZJES
	X9iwmtcku0SF/fALqM+INyxRV45CE9h6D6rXXu/3+RS18JgNyN1tsjKJCLRblXcp
	5bMfPBHjvIiKFoKCIASJ1/l+Aaj8ESVSqg1ykA3GDL12lz6lXI1V2sNKc5tE3bgj
	9Zeh3+7lFuP0DPlLsrJegA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=9CuhYlS
	XaFfyQQaLy3X2h44EEpfOSp6LjenvqrTCogI=; b=Yvn6SrYGLccxO2ZwHNTSnG7
	7YoAWlUqpm9SPNdAj1+z2MWMQ1PZs9XYrDYtV9dh6IggBAfpNbX0zPgOrOkQTIOk
	iVk5SK7kyrmRdakU5xDxRJr8BUedvYXDd7+4uOdjBePaLbtJsnSi8eEVYpyBiGf/
	L/NhtPQHpxC0oDenptc+1SlpQjkwcwZfpy4DM/rhJdXJZbkMBCLQsrOGslGBn8BW
	Zn+bR4kEF7pVmivA8W2TaxzQSHW5BXTdoRDIDiEFqG15kbXJ2FXhsu+RkJ1fLC1s
	z99I3Lkft9AqO65xbwcJ5f8qa2RwS4HEPa0ef1srQYTvBomJ0uSRh1MMIrKsxOw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: LW0bwfoEdwlY7LW0cwA7Bt
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 2/4] xen/console: promote conring{,_size} to __ro_after_init
Date: Fri,  8 May 2026 17:57:12 -0700
Message-ID: <20260509005714.892018-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509005714.892018-1-dmukhin@ford.com>
References: <20260509005714.892018-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090007
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SA2PR16MB4139:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86e856ae-4084-48c6-de25-08dead65f6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	6kVdFbQK8NKHAuRxjxZYZ408yD2AZ4B9xAIwdNTBqlpb03eGivYpeS9L2EnCuO2Uf0DzOiybLSVAeDfiKcxzl8N4CHjblcjk2XVxjxf/R7s7pOWAbntmgxO1h1mckS3dIQcKNtorcY7aLjVxO9YjXyxUpbeowNMIjMI1Lx4h27INlsd64V9+FXJiqTF2o7xggvibwWbeIIBf7OPl5VwS26OYbkgz4Yb8WxS/1x+GIEOgJWj//0xaVf1GATpVa1W/qmQ7pSsMVUYlvWhzVU+Tbrt0iYhEKwZh+gpKURtv6HuTWebX673zT41BB6n6AUcDDoaAUhNk5VcoGItF6uEWwoi9kHqLGAuCbLHUKZXM1cFQN3XLF7GMTWyPofH6jdE1mt/VvuttYU0BhzQ94YwkKFzltPfBXkmc9aXQ6Bqj7BzCcyxA20Wcwx+VwPiso+RQOtfk03ArjbACfpoSKVgbSvWsTrv+PLOCBL8DKsFoMZMebHYajoy5/CIv/aaQ5iRZNsCum0Kb/Tevt8bEhXBjab+XcNk+UUvzYtpNZtj4n/gdw0vv4eXbjwYplJMYB6KblBsy9GsbDXOTLb4XV/8rSzAaY+OcS+GkluqohVleSViMFwc0z3lei7llwVm1O9DZc+jorWGPj0VH0ap0cnwvZPvrlkMcCbxixw5RGxIenFb03kJVMJhBhKdMZseKLCmKLoGTWjqja2p+2rt6l89g9QyCYM7ItOCtqnZKEkUdh+0=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kea7IFUmGeI+SFL6ABAU20Esa8a7ciBNXLBeGHqsEfSEbIQmmXOCDhoirR/r95cr4E3B6wQeg8x473hFIOskKGGHBkfyrKPUNcEcrBZPV/De3TCSGwspfZQviDYdv0UqMOCoQ0V9os/fnLyVxJslDYhkLgAeMl4ZANVlWEVR7uH4VY97V37/5Y8ab05xb3heJ5/luwZZFfOLD4bboUMoa5PqpnuMupqi+UyF0Eou18MZzFe6uZApLiMCBfl9jwTVB8EbkyhxWE1S1nzlfZu7fCyONBXtPT8F8CwMoscZJ3WodbzvR8vDhJWxCOb31i02VunL+OCMFLOwyKkY0tQ/o1Yv+y8Pg08z9p1bOHCq4CVH4BVxRUHkuEbIQXB4589RfQg8UtgiZkGp+0qnKQl73l0QmpI4Jjg7pbmVd+2Wd4cFuIQuigKGiG+4Efd3U0Gl
X-Exchange-RoutingPolicyChecked:
	Ov/NieE0G+c7IwG1k/6Ht26QFKN7AjmkCJaubjXBAw26cDUokT1S0Xdyaj+cV/zLME/bBoXs4N9ogn/fSyOgdKMD25BPkTNjjU8AGuCEJ+KnZLp0+f9P3WtHzt09zNpTEaRjHaX9be+lyEcY/Znu5mo5MGbTllZuM2rSz2eBhaTKuIbfMu8ibBpDR1kWFADxzqTf4arkiCYE79cw+uxoUjA1EDBCMsslbIV65zKr+5k+J5ffgUfGD/diqR/2NmNNFqTee8e+fWeV8e8JbeperU+46XHWoX17NX0Moo+MnwJZgNcfm0wB5n2ctvnbi5s42RDw9Ip8hGTsD+NUCeTxRg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GtRDRMqJK/IfSWdzInTvcxW2dEq/J0ojsQY9Hf4s7QrnetTXOcr571gcavr6zhkIE7pOPjRT9PEPhoc6LJlurjmJ/gh0fgFAU+V/GSu7YXwXznEARkBnDon+4whGm3+StQTao56bkpFHWzZ28ri7GiUVZB5BTyMV50voy0gTwnb3xVM62VGbt57NwIjfV5+ftzfNTuRy5nQxU0dweyPGWlCBXi51WemE9aZXSsSv0FuTHFNylCOXpcOh81s25ctzVgUCH7vZL6vCad7r60S/8aD7+TFeqCxxTV/Nzj39SU2SfWrmHoV9WlXiEas30JS/bj6Z8B+3j6m+9fxeblLtuG+nWQP8xTeAC6Ezei0MGt1Sk+cueta+z2LZx3hL8DJwGew25eSgYBOePtd1HtXEw8TgbwOgYdpO6a4nogjoLAuw8gQ5u1smxQv/rF4k8dIO/oNh0VP0JjQrWv5w7TBoPOt83u2EURCr41yIqQbfT1oaWTVemrzyDreZaxxDibzFTcmd3wfCj7lmQzPu2eeaBwLXybgpNqoZL6D1HmggJctXy93Lp3Al+wlHiZXSWg4cBetmaab2WwlikR2BT1niZhcRz+vB8YSgdC2OvQHnEc2GoYH9DxjCgctQLRH+vcysDeKmvGwfKSvPZ/isFFExjw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 00:57:37.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e856ae-4084-48c6-de25-08dead65f6aa
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAwNyBTYWx0ZWRfXyrsNRoSobnc+
 rnWZDGqGA20S0vdYysmI74JDo5rtp5YlI2UCHYx2WyERSgNlUT/NDYTyi8cNA63v0+LUyINKLXV
 hOPO7jBvQxAoA+PlARhE3hDpyFJQXF7M+FzB1SSKo1/oTPsSWHaMciGioDS7TBTaCF20HdghyuA
 8mdLWGrNsW/rbMWCOGmRESuJIsNP9U8KQ+dd748qmAeNURy50frGG9bOCS/Z4+NP2vmGs7aBmeT
 vaFpQIz7kZF+VZGDjkfMGNk8Xi5vgVqRwiSb09PU4Oluy9O1s0V5ViY3xcwVO9CKOc+En2kioAh
 0Jng6TOx8PCY04WOVBfQQSfKdYpRQo7ftvHMcMicRcIUnex1tzeZnK/TGcud8ha5Y1VjBRccHfI
 nVtHo9s08XwD/73aSPQ7JLm1a6Ve+M8iK+D3ZLBOkU1ki1OUdwsHpgryNVCEo1YteTUnDftGEuN
 ENe6CnxkfwZB3dBB3zA==
X-Authority-Analysis: v=2.4 cv=YuQ/gYYX c=1 sm=1 tr=0 ts=69fe8684 cx=c_pps
 a=mt+QW+PagoHSMqpqf5GGBw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=iox4zFpeAAAA:8 a=KJnTikxRzMM2nk4UrzYA:9
 a=G69WFyCBNqGPyalROSdv:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: Y_sY-X0Qah1Koq8UkQZr9CA_NywAZoX1
X-Proofpoint-ORIG-GUID: Y_sY-X0Qah1Koq8UkQZr9CA_NywAZoX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090007
X-purgate-ID: tlsNG-c201ff/1778288262-D3563443-789F7921/0/0
X-purgate-type: clean
X-purgate-size: 1570
X-Rspamd-Queue-Id: 7967F4FD281
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,ford.com:email,ford.com:mid,ford.com:dkim]
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Both conring{,_size} should be RO after initialization is completed.

Change the conring integer parameters type to `unsigned int` as required
by CODING_STYLE.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v5:
- used `unsigned int`
- added Jan's A-b
---
 xen/drivers/char/console.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 522b2f489a53..5ab3b0de12d8 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -340,15 +340,15 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  */
 
 /* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
-static uint32_t __initdata opt_conring_size;
+static unsigned int __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
 #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
 #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
-static char *__read_mostly conring = _conring;
-static uint32_t __read_mostly conring_size = _CONRING_SIZE;
-static uint32_t conringc, conringp;
+static char *__ro_after_init conring = _conring;
+static unsigned int __ro_after_init conring_size = _CONRING_SIZE;
+static unsigned int conringc, conringp;
 
 static void cf_check conring_notify(void *unused)
 {
-- 
2.54.0


