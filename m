Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9NmvLoaDIGo+4gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:41:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F078763AEF6
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=GQsd3Cm3;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="YS/S3zGF";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=YDr0CZGA;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=qstb1nEO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327101.1592308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTJ-0000Zc-Mk; Wed, 03 Jun 2026 19:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327101.1592308; Wed, 03 Jun 2026 19:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTJ-0000Wg-JD; Wed, 03 Jun 2026 19:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1327101;
 Wed, 03 Jun 2026 19:41:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTH-0000Vq-SQ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:41:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTH-008IPe-9C
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:41:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208353-bab6-0a2a0a5309dd-0a2a4506d40e-42
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:47 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208379-7371-0a2a45060019-94a38ff15e6c-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:47 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I5vtp3789886
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:45 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ejs88s9wb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:45 +0000 (GMT)
Received: from BN0PR04CA0198.namprd04.prod.outlook.com (2603:10b6:408:e9::23)
 by PH7PR16MB4852.namprd16.prod.outlook.com (2603:10b6:510:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 19:41:40 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::9f) by BN0PR04CA0198.outlook.office365.com
 (2603:10b6:408:e9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:41:40 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:39 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653J87im474902
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeb8yh77-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:38 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id UrT6wbYly5kHRUrT6w8BB6; Wed, 03 Jun 2026 19:41:37 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=B43
	lHuIo7p6VqcOj4/y3UZ98f8R+62xafP4mWlj8Tek=; b=GQsd3Cm3Al3V4Vifcqo
	zFyeTCcVfc7DOBha+CemNKP1Slxk8rCDHQdRfe+9WUdzv6HHLiDDTbyh6yukVWmS
	QO751bAwb2eqSuUTv1N2ruc3NzZp6lzaBmGRDdptVpWL+EEQoKg7nmaLZe302oSk
	ByRN8Bzn4G1QzH2BsiBeaT3RAeol/cd+VQJ+LT1NVHoDmUkp1FGeDAPuLHojKtU0
	8x37ji1hlZvi9Bwew7H6l+LmMrYEKg29GRqHzvBPHkVVdzOJnJIuWW9ibE6ZyvI2
	F4eejlhg+xpWi2sV8sDSoh6URWbds8qg4cIISKVg9s+rmy+1S7YI5Nh5Om1+eK48
	yjw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTMihRNmX3BbTngR3RdjOdE+W3FuosnP9vLdnHr8VHy1WUQaNvX4c8lCcWbfq4GIxx0YJLePUPu9tHsTuNEzCAHp4OllK3bZ0E6QvOmOHcNQSnbzGEcBUy2k+sQjhKYwKbXW/nJaOd/XIJH3f0J5PuER4MTo7a095lLWcTuXygH2PFK1HEPkIOYk3/CQETVvKnJKmvJe5LeA+MNEdHIEuKG4SBJUWyCDyFfRL/BX/yTSIrYSrPLz7SolQjWliVlym2adwNwZIJrTONLcVfG09iHog0/DZzzhOt3mx/a2m0MUsOibKp3+z1AkVcoDRKZekdMCSRAUwE0WPMa1ze7T6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B43lHuIo7p6VqcOj4/y3UZ98f8R+62xafP4mWlj8Tek=;
 b=WcWfjMtNQIUzu+k4D6YbZIX5R5g36xXSRMXuqRbfwex5ZivKB14cMkIgxn+sS1LjF+xymdKMMI/k/cPyvbmDLOqRy4DV81sW5nDkXtiPQC/Kg4no0SkRXxjbM4GH2nAl8YVS0AUcUnzukPSunZ6rsmrEJ4StrCBsMrxQHbvJpaCQrVXvZcZyVTi42wY73TXCfcOz8WmClxGw7mN2YP91z8P/ZxLcS8gY+CFEZ/ivaD5hxzmlnT8410+/E8KvzzxjT09hjQOoRMKBucuX2qBMdmnrm21bVoaofKyb+ActFujrtyuidYaiuyqe+9KRNsCsLQFOoxEYRXmy0UrPTepf9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B43lHuIo7p6VqcOj4/y3UZ98f8R+62xafP4mWlj8Tek=;
 b=YS/S3zGFa6WwcxYG2EL4jUk3Vefowqw85EVkjfFHmXuFb6HZF/feZBwUAUDkVxEFy2abkaBiShQcWxQjBYmg6v/MhRYRbIxpdv29xoRSLC7afqGM4Mr5Kcnt5z/6XyFArMgJaIMydH3TzG0gV2cYNoX2hFylHYY9h4aeAXludUg=
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
	ppserprodsaar; bh=B43lHuIo7p6VqcOj4/y3UZ98f8R+62xafP4mWlj8Tek=; b=
	YDr0CZGAyJbtrQXPZzD6FmdAmq1XR/JiMUuE46cEkERyPKxJ2tJ91TuMcbZrwyRM
	823Wm5lU66A8aF4iNkDmY4HHtOd+iWnOf4skEAA1r1noZ1C75utCcvxc8Ikj8y91
	YV6Omotrhi7PWIezWZPP4y6SWl42hclurtyUvex2WkvmE1v88x0q60qJFfY4KKpG
	0rpdveEG7Qa9ktEQDPWNhAvzQZL8PDmm5dCZ6jGkp8T4c2zFAuVD8e31/jarqYga
	WBWP2xzj1ErhA27oghwximP/0IsWAiKXeovoph1l2FhHg2OJJBX4RS7UO5+i9nOT
	rUx0MQ+AHszyBYnktE98zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=B43lHuI
	o7p6VqcOj4/y3UZ98f8R+62xafP4mWlj8Tek=; b=qstb1nEOXmBc3LZXodYk7fp
	+aUp5ev4citjuBsiZloN1olTi8PKVVpab748k5Po79cpUS6lYD1PhrrL4MpOTpW7
	O4Y5r9eu6KwuCSBHrM2xKWJ1EQRRj9LFY/yromvLUjP2AAY3SuFppFS4UhEQ1EHk
	d1yiWt0pS4PPo/wGkHoQU9JrpVxJab4u4Lp+Dv4NeeNLujxxQ2uEZuBY4Q0etZb5
	sn8EDDdYbc8Dn0WNBXYPi2zs1nNPn4r/RAgyVmUBQywEWcBkRbwkA1cOBzVONIBW
	YKiOBodq5lHBK6+5PsRVoo4zmUOGHrnopFBv02eG32aLENgKRxHzoEzcWj33n0w=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrT6wbYly5kHRUrT6w8BB6
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v5 1/6] argo: lower level of noisy connection-refused log
Date: Wed,  3 Jun 2026 12:41:26 -0700
Message-ID: <20260603194131.1468654-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603194131.1468654-1-dmukhin@ford.com>
References: <20260603194131.1468654-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030191
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|PH7PR16MB4852:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a6f70066-96c2-4d81-be66-08dec1a82204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	gJGpCG4fwf+eJ/kJbnGqPA2y5tIoaaa01rh7Jv4sVSCUwsSQXwFdpeKR7DJxyEHg3RXZoXvAu7TcMoObY6EIC4hIQbXcrXBIuItT/YMC+fdcmRAwlKMgHTl7opjubmLeuk7bTgjsD0wHN8K+XJKIZqHbFUsOZyyfJfXxgwbiGDySKERqZbwqKaFW2HiuG2wzFdoM2Jia4c+G4ALN4OOtA/o4eM8ajy/jPk3OGTQY5RxJI1rg4xl/mh5SP2C/f5wjzNpO5kSpluYInOyPYxEU1KeSCLaH1Fdu6nHrCbzsw8x5rtK5HwPIhUotCXXa/jlJvpJcZ4Z2VGB16Z08KfmhqS0aSSKj8leMTpA6anMl1wC438+B4m38+9lNJBSqua0PosdafxxFC+hAqhVNxS5ikGpPoPouqnz9ynIBbhQHHFioOCYrJ9wsUjDWpk5M7ymgmjmwOA90rnVd+4K+9rKh/ADn2sgGFp1v7LF4sq8QQCmPT9hqohT3Ym6XLEA2NgXLRKlD2XoaA2KkRxZm9ZUEqI9YpYAFozEoUw/uzyNCwdXtHq68tNS3/d0fnfgdOKBmdz4LZQqXkdJifis+pmFadWPrkQ92gpmYYEuBRRQfFBzqjDy7rbGWIza1HoZAkAuKwurs0dUhGFu91qojutVn0/Ws9179IqqlMWLvZTBn86O/Xdo2Oaa22cW1T2p82pcx3Gh9ak/6GlagNiK0hOUDpMEuFck7wB8cwPX0BB7qsms=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NgfzUWsKyGEHsefSmd7WsxWRq7UIQ3gfu1/4m5SZms3WfixDUAa679TSLIB5bqdu2ZS8OSQxUibugpBtZhIhcoP6zYGjvnY2ei87NeameDG23QQPjLRWzxok3T4rrJSTpdu7cFb2ewsGDOs7cpzseUNXKQSWj6nTb4P+FG4HbTQQr5zE2lzVDTOzttJg8WWbYlqCM+mCMWFPA84ZjJ1ZwBhhVqfOM4qufsAlkqgc+PhtKYzoa9Pl1+hC5U06fXUmiVFIp52ecrYoPLI5dc2ORHYDRXgGSdZolFa4YBm31rqYrRCw3NUqEvqc0dNSD2j2eDQ/prsoYjp2eL4t9uiyu5T1n+e95X3UbAj3DhazNUi3poaYew0UKwOlAokoqPv+dpAOk8tjU6hVbrlmilD59xuZmeS+/rLBxbRJd3UYSFE4Z6DlsQtCpPDJf2zsa3NF
X-Exchange-RoutingPolicyChecked:
	kZATyKkFnoA88EVIVfU61kg1Ya+m3Y/ccct/wrJb+QPUWmyU6AdEMMy0madipk1uZVk5liqlKxG9jQN2FOcVxzYR1u13h9ShOeSpubJYaS3hi2lsn70X+BIcY9Sn0se0DSJsi+OX7hBobbEt/gwe0J9HCqj6cbDNBKXHqrvIx76FNyYRbKAaFMFtjJ+6zvME+zOBBM/yCDuqa2RajBFKiSimuXZ7jpi3MbEz1isF+8JlvAh3hH/OS9t2U7zVe1lykc4uUKgTk5tipadYb32f5q+ckxTebo3Ze/LO047N0AeB/sq/PB7GKw9fuKtNBWJTGU94SI74iPZfVRIsrr67Jw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NJFQ51b07BXrhSAYhb5GEziCCwxybs7EIvB8IY4z0pwJKPOzrOlTZKw7PGl506yI+S+O2aMjrvjyx7EvIcVcCNXYonTHu8PfXfyr0QyvFircslnem3AZHtLcr/gnn+ita82y6J3dAYPNPCCbpTcomXawroszKU20Pg4QjGO96BKX58KCaE9UQiYBz7G1e/Wg5+G6e8vU4PJRoOeGpSgfSBFpFa0RzDASRuZ0Yu6VE3eUMWBr6RgndoeP17qG/QCRlcfLVZXCTI6aC4/t1MDjuhvk8gmjaJZCrR+OE6mO/2KKR/IfpGWJwEZRrTo+TjcTiK72MjgNENtoUH76Ua2ERCkQj0MGvZKyy9gMCVMPuVJwBSVTxGfWKVNL+bpOcD1kOAaegO96jJ+3OjreiesA30nSA1db5CdIo2QEfn+4N4yudt2ZdlPFHlaUrbrRfoMKdxWzWU+Y1Lhe1vSBAX6GEHTFS+C2142/233YzyLEoMwyNyh0ApYVwFBGswNWJpdAbczOnbro+ISZIC5D0w46POnDkT1sYFncJlfpcGv+QyDaae24hp5N3G5C3ccyJUQ8eSZcsLh7xWzdN/kz3HIxH8ug5DafShhHbfjhImgQDrkpxHDXhE535ZIESHDDzBA9
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:39.9206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f70066-96c2-4d81-be66-08dec1a82204
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB4852
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfX/9NVpARscK0G
 vCZYvURTDD/RJtLMRJ66Ijo8eiK6DV9d1ra5kH/iDHYxKudzvavG/ocAG73WqpVtcgA2020+wgO
 flcji25MDFRH/hEpGF0Vf7TlFVggqiiVLcA8Nf0SIrylrdURP+M834VmByw6n1sKQ0QJcg6pvf+
 iVNx5XbkQmmAoboN0tgqatD2RWaRH4HqYc32opJF4k4AL4nmj5E0oGMVQUj3Tn+AXh17bbYnHAK
 deiMQeE1EYR+w0pV9y2N9rJ0/gs4uZaAzX5QTDm27c+pad5Rql+5QrQBxzz11HKGTL/0jumfPyr
 hzRFzhBly2SPaz6guhOJIUs3mk1ArknTpGMguT0dMyEKYEg9vVLQwbkN5CBPYaw6Ah7DyU31y/C
 1mZkOt7gxAmLMw8zbJT7gmBaZ4fdpFZcvuIRQy/qNI6GYvtI81IuRJLQLh03WVuByEUNIXNarwa
 Ke6wRXn/JCh/sKx6fXg==
X-Proofpoint-ORIG-GUID: dFoyAUzRHAkAGXCIoNzmmp-QWeXP5-Zs
X-Authority-Analysis: v=2.4 cv=Iv4utr/g c=1 sm=1 tr=0 ts=6a208379 cx=c_pps
 a=G7eB82wliUXyOHlZhtkITg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=Pq0mfAL3NuNqQaD0pm4A:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: dFoyAUzRHAkAGXCIoNzmmp-QWeXP5-Zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-16d1c6/1780515707-84D62D75-C75678D4/0/0
X-purgate-type: clean
X-purgate-size: 1440
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:mykola_kvach@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,azureford.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F078763AEF6

Switch the log line to argo_dprintk() so it is enabled only in debug
environments, as it can spam the logs when a dom0 service using the Argo
hypercall tries to communicate with a domain that is still starting up.

Note that this also lowers the log level to debug when the argo_dprintk()
facility is enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v4:
- n/a
---
 xen/common/argo.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 28626e00a8cb..98a3db7fd070 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
                                         src_id.domain_id);
     if ( !ring_info )
     {
-        gprintk(XENLOG_ERR,
-                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
-                current->domain->domain_id, src_id.domain_id, src_id.aport,
-                dst_addr->domain_id, dst_addr->aport);
+        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
+                     current->domain->domain_id, src_id.domain_id, src_id.aport,
+                     dst_addr->domain_id, dst_addr->aport);
 
         ret = -ECONNREFUSED;
     }
-- 
2.54.0


