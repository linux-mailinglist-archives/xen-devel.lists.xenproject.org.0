Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xTjuFp8rVWpvkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:17:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D074E691
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:17:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=vFxpzXMl;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=F+FhhZA5;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=Dw1B5llz;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=UqZCDGj2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361824.1613937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLD6-00062M-4Y; Mon, 13 Jul 2026 18:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361824.1613937; Mon, 13 Jul 2026 18:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLD5-0005w6-Rd; Mon, 13 Jul 2026 18:16:55 +0000
Received: by outflank-mailman (input) for mailman id 1361824;
 Mon, 13 Jul 2026 18:16:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLD4-0005qJ-BT
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLD3-00G2qg-OD
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b6a-bab6-0a2a0a5309dd-0a2a4505a73e-36
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:53 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b93-4f1d-0a2a45050019-94a39217d4d4-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:53 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DI3L3J4006399
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:51 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fd38b1gf1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:51 +0000 (GMT)
Received: from CH5PR02CA0017.namprd02.prod.outlook.com (2603:10b6:610:1ed::19)
 by CH0PR16MB5254.namprd16.prod.outlook.com (2603:10b6:610:190::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 18:16:45 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::5) by CH5PR02CA0017.outlook.office365.com
 (2603:10b6:610:1ed::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend
 Transport; Mon, 13 Jul 2026 18:16:45 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:44 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DI3l3h2030717
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:43 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fc7qrspvw-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:43 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id jLCrwD4EZdXbVjLCsw959k; Mon, 13 Jul 2026 18:16:43 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=4kt
	jYVJyGdNOdJlnbJpt9EEJgp53hevXtpmLI4lNADE=; b=vFxpzXMlqw/39E6nipG
	iMoe5n73EpUJfYghLpe7o0KqKsr7DjJj3q4+kajONuY24cnceclir2ZE7sELx83u
	uYTY8JXfue97Mrb+6nQBoREoMO4ts8vyw1HMrxR6auuBP8k6li5/hG/Qs55EGHtr
	ilY9HiHmzt+8oQdAgkU92Hlf1wE4Z6SzYk5e4pZSGWxm5sYvfzKI/UTZl+M+lgM+
	rsvrbXZtzTReS7xHl569GKSZrBGhsiDSTo9ihDqjbLeHM5aDcyEB6h5cqgI0AQC0
	+NsUP2RLteuLxKJrvRU7Jp3Cbt9sHvS8vx9EUALn4UCbnvxpOeF62JObkapvheZe
	j/Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML+h+lm18NhNoWdOml8wSLacs8UVyNHb1lVH9eEJI/Ux2xGxRDAxw0By4v78ud+uIaYWh5c7rSghI064YdAQEB/P6jwxnn5ivBrzGKEa5DO+05hQuu0+2CvKGgf1iqTRtuU17N9KTK17+7im6IkIo7jjB1CWng/bv9nJn2qLoxX1DspvlmBd8Xah750AHbfdKyudGsHXqczXcM8d+isZFEamCxhZHknFSTxgs4ptikE1RWWrF4yMYJc6N/dZZ4DMX/sb3NLcCPCQNjMeGDTfBr0B8O21a0/OM6mUNXlEDBLN6FCj6lfzzkwcxFF+aHzP88IniYopiZDf4iFd8wMqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ktjYVJyGdNOdJlnbJpt9EEJgp53hevXtpmLI4lNADE=;
 b=YIDfVMNUzugTZf6z81KSXvUIFMPtFkGaj8k81xyAlWDlQBvkgQIdWCFWcxIyxN+SGQLR8L+QQcLspcGpCU6Jcmw+Iw3rsudho81f8PpNjIFvRV8NPKUZhw2mVI1c+x1E9rYZpxp/sj+OsGFtwOjhVismkyOvpIdPGbftUnekdhujkh3MYQHm7OjATI567KM9FTeC4TtMBK10awwUq+F5vGzPKGpGOP5YcAHb/aijSYOKfm3F4MHKdavEours8o2Rpcw+FIX+K22IskIFDOnaN308putjDo7c6QdTyfmf3gBZC0g6Aix4pVXjSFRWMXzodrP9MO+Kkk6ZKevRbHMpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ktjYVJyGdNOdJlnbJpt9EEJgp53hevXtpmLI4lNADE=;
 b=F+FhhZA5FWVDn4gNtffbDtcWopYU2khD4N3btcq9zIr6gmhnJmArUDt5iFK5GIGabAPK/AaQ112JHqux+/DBTy35HsSJQwhjb5JoCA4rQn0X0IM3VISbud9MdQpc2qidAU1buMhIfiUUu1a1UkquEvI9guIn/noz0lhd2a7VznY=
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
	ppserprodsaar; bh=4ktjYVJyGdNOdJlnbJpt9EEJgp53hevXtpmLI4lNADE=; b=
	Dw1B5llzdx93Up1XW2o/e4poEN/6jQwpIplWYuNLwmA19nlj1QZxZ6mY+Sx5MfcG
	nMcVujBkYQHJmrsekyJ9U+WTx629IX3/RbM+eJnfZyvkF+WjA4gFQxQHbuDO4wth
	7+Md597NCXY772PCtK33pLuGxjoT+hSFtxuaNmM6y+px5M7bnoJbeHdVPKpUeCcZ
	xufpA76DN4X0XdLnO5MzDwLmOiQjPRZJX7oOhrP8MAy8fT+WyJgktBG/o1KCnm+r
	ZnQ8h0s6jhQLcKG250cRI8lBfWs/hGmd6htn0fzipRZjvRzPSWDszXMJpNA1UhaV
	cDh8cLiblswGyioL+cP0Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=4ktjYVJ
	yGdNOdJlnbJpt9EEJgp53hevXtpmLI4lNADE=; b=UqZCDGj2+FL375+hNlCbXuz
	OxbBViDS/bsM5vkWJYEu8EOQT2by1wEGHupLYkIFEnCpr416lx1JyXs9bBjeyMsm
	q9UEAqMUcE4/mBMkYwUOVLHcvNS2GErEWWg9J84AAgfwRT5hgn6An727GZRAKkbO
	q2o52gvm4n2K8+5QJ5Mm7COdE1sOF72LH4W9HxtBLJPmvMT53OtEOSQYB+cnW2uI
	F80wrUJXfPU0YbJTevTcz+rEkfMBxoIMoI0Y60ISkyMsTeUInjfjOHlkNa+eSBjN
	C1A+0eUyfF75Uexaqcp4zKPv8SE68I9FawlPRNwmVrGGxJkZ8rY4MHJvtwHuExg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCrwD4EZdXbVjLCsw959k
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 7/7] xen/console: make console buffer size configurable
Date: Mon, 13 Jul 2026 11:16:19 -0700
Message-ID: <20260713181619.672176-8-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713181619.672176-1-dmukhin@ford.com>
References: <20260713181619.672176-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|CH0PR16MB5254:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1e0c5d2-51e6-4ea7-fb50-08dee10ae59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	KF3xq+WnEDxKlvOsn7m0thC39p08XhyXOk1yu8gOd/7hb8Ne/ZfnWhiqDOBRwEhQn+AUQWYqaOzzXNAa2NEHynwYKmioqLusgJ0LMZioboohWi42FWcvNULKHobEq48jFQ4kuygFgggWRwuO/Om7wLbkevIjBdX76ZoZdR3zoNAw+k34T33m2Dwc0MhbDvWP0j0A2SsB9hhn+SxmmfZeKRPBtWbqtJWgSi/Xh42s+REYBhXFONspKrvDDhxa+1N/2Tc6hQ0wyKVpfvP0cXz0JtLVfRgNdAlH/vgwVdWF4Pgcv8+Etkzn0ysgXu7Tznjw3g4ZbzmXONVbPSI3dJcDWHdeay0M2xHQNMF5m4gXrITevL9ZLYPNFUQWoM5xPlIXp61MgLn+6mfiEItvj4bIdUhHaIVp0T5h6qQhNyH/etlGBB8N4wFAtbcAiIGiS/KJXLrmQLM/fY/xO+eK7FV+/jb20B+4QgZvoV6mXo2d7334OATGEf+vAnmRLCn1DXsTEp8YV299K/ocbtZA1KS6b26IIsq19/PH33Hnh8ztNKQXUUXPnBRIRCoh45LPHzQXtu///KvDCvxhnpJrRxkf8cWgvB4N7KomgDnHza1RHaq5QRWzcbvabwQLnQZskbQd8s9BhEFzw+hYGiN0DJ3/7IhQuED/NvfhTD1k6LZZMD+x/LZFx8dJqL1IZZcJeHRZFrrhwp8mYI/uXyK7/rUlHg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yHTCSo78+GTmA61hQUGA0V8FvwK1WHCbGhiLss4c2jk08UsFBPDR1WgNrhbHairIRRe9wucLsCHpxNxvJjB5zizYllhH41pCtuKdUt0m5sFRbxhwfwgyvUdBHZl1Q6aRKYdsfagwFxsr9fkWCQvLCbRHM4A63RM9KhQbqOVLfWJ0STP8G5B4GCQx+Hxw3RyOTWNBX+QLVM3G6UxGwBjxgn374aPB2KrZ47wi8hFT7BtK3yxF+UOvEp1x0/2G8Kd+JREkViPxVmA44c6/8K745tYvzEgQdjyBgB8l8jHwFjmFYhQ438a14Fg7lBF8JYhyN4M7YOL4WrUNYHB6Qt8tSzDK3lXi9I6BxArS/OWrJ1R5tXJsiTikUUwoMFiSLzfNtu53IACTPHw8oOWvArDP/4Dr2aTH+r9oQAy/4gRmm3w/DXImG0zmP0T6UQxpSnB5
X-Exchange-RoutingPolicyChecked:
	RKvh9o6mUbQL20VsoybWxj+5kITWfaZNdOOA/xBIgY9lQmSZcVH4fk9mMhxFf64zUseQKkcSvdU/Tbrdxe44Y2b6Emof2Ruamu36xbqOacU5joeNQrRhn3NUiF+cFN3Q5x6rytq+mk7Tqe3vV/DAtW2G80evp6nc4G6tsfDOz/x2rPD8C8B23Dar6WFcW1/QRbZG1HWShVXW3gkRTgVMYwfQHTmYKH0aTpIfkE0DpePY7P5FHfurAJlsH2PQUC5hcqG03+wfO4N+zAQKY31+xn8ZtNxTYDaQ7Oi1JrSc96CmWQLlsK4pX202xWoUKUB4VMbwn0vSEtWjXYwKcu0w2g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vhQnmtKKbBFS4Y48KUk03vWheY95N6IkYFyVT0YGdxaA26QGaSpWdD1DCa+5mbCu5KqEVq90wCzTOb0MPo2qtA5F5ihbiR6tZkpkFYMvHy148ztKNkdvLsP0m//3y0gVAmMTZPxzMTz7I1IVb+LHo/HTwPS0UNT9PEBqrGF/EtFO3bA5Oy4IJhPzwsPIhGMAJlQhOdhe0YUOvu8slmVjr3LwMkUpzWNdtolbdEpHy4AhN+GUJlQCcEMvQxXjaOfzM+hsJBp/hiz0W/IyaryZ5FBWnvFrny24DcDtcW6Ywk/QWDZyyYxf3+tSEbvk30p6L4X3SNH0uIOxsnLzvL4jdRpRjW6mw/nyYNdjMiYj7rBEKlnRlg3RLwwbahr/Nj6/GzIEsn82NmM+2TCIYaqBAs7QgWxWYrLfdxEmm9tEr6+PgOXFumuyccNP1K6XJh/Vi38dGx4gFDcmdllRFDHExDQtIw+ycvgefHA8GVH2RJy526Fv5ix+SL2MK5RkZ0aESiVdDSxodtbcGyTuUOjgodC/XDLUG+h9PJy1LKMH3myXw3wXnA1V6Oc5507X+yW9Ub0uGf1/Crxg+BuCikBL8kNfMhTEHC6Nr7wBPRPhv/Nv6cNwi5ys0le1AjrDl8RUST8bXQhBL7MpkUUtT2B7Lg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:44.9878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e0c5d2-51e6-4ea7-fb50-08dee10ae59b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR16MB5254
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX6GSmaYjIHt0C
 4bvaubHKmkdfZScV2yqYj2o/aQKnk5lxXvkzRz5fXD/Mevg9frPZ5xPjbJehcQv0NX4XDima+nD
 3lj6fgCLwmpN2f3COkYOWtP/s8DFltKro5zN40gr6I45/lXBOzmOXCiUz0LpgJ/8/a1bfQG0nWA
 FwBoAsV6JH36u90eZPkG3z/SNzijRQaVOn9Zttw56KrRqQ8Gd89/toy7FYFhD/iKyeScZq66eFz
 0RKhJFEPHTwF7c+EsnC7vk4Pktm70TRbPR86ELV8BjECmOSden40vCJRBEFwLqpHym2cehrFqtO
 To3iVbPqdlZrLnuJNbUZF7X6wf1ol/JQCyfjPDbOhX4Yscih+khatHQ9TJMineHWQI+wOFtp9ii
 V12waESTHYB2lA+27Fcs7J9x9H1DVxeLKiL3yY8ugRxZ/wCKDhtgni3WzbATFDmZopNPqJVPRUH
 xvhrWpwy/6qaDWkXSzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfXxyP8FGo7PS0f
 c8t4X6YhMcmhJeIDnj1sY1nVefUOez+SeUXcTiJjSUGeehmHP0YABcrX2ZkDyIHelGsvYQwhniT
 qTkyJbLxyHrJpdxSbWLpKpmede24HUE6eDO40ao1UnJqOIXmczHf
X-Proofpoint-ORIG-GUID: b3dVGzvq7sojgUTX4cedI0yDejnLE2La
X-Proofpoint-GUID: b3dVGzvq7sojgUTX4cedI0yDejnLE2La
X-Authority-Analysis: v=2.4 cv=XszK/1F9 c=1 sm=1 tr=0 ts=6a552b93 cx=c_pps
 a=wX+iSCk909IGAd/hxyKeOw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=h10IGR_9uvuIgT1K_eoA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-c201ff/1783966613-6274512E-889C75FC/0/0
X-purgate-type: clean
X-purgate-size: 3378
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,saarlouis.ford.com:dkim,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C76D074E691

From: Denis Mukhin <dmukhin@ford.com> 

Add new CONRING_SHIFT Kconfig parameter to specify the boot console
buffer size as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Update the documentation for 'conring_size=' command line option.

Resolves: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- fixed Kconfig and documentation text
---
 docs/misc/xen-command-line.pandoc |  8 ++++++--
 xen/drivers/char/Kconfig          | 21 +++++++++++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 2be8772b329a..448c9bdb8254 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,14 @@ The following are examples of correct specifications:
 ### conring_size
 > `= <size>`
 
-> Default: `conring_size=16k`
-
 Specify the size of the console ring buffer.
 
+The default console ring buffer size is selected at build-time via
+`CONFIG_CONRING_SHIFT` setting.
+
+The run-time console ring buffer size is the maximum of the build-time value
+and the value specified by the `conring_size=` command-line option.
+
 ### console
 > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
 
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 8e49a52c735b..a40a9929132b 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -95,6 +95,27 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_SHIFT
+	int "Console ring buffer size (power of 2)"
+	range 14 27
+	default 15
+	help
+	  Select the boot console ring buffer size as a power of 2.
+
+	  The run-time console ring buffer is the maximum of the build-time
+	  value and the value specified by the `conring_size=` command-line
+	  option.
+
+	  If `conring_size=` is not specified on the command line, the run-time
+	  console ring buffer size is the maximum of this value and
+	  `num_present_cpus() << (9 + xenlog_lower_thresh)`.
+
+	    27 => 128 MiB
+	    26 =>  64 MiB
+	    ...
+	    15 =>  32 KiB (default)
+	    14 =>  16 KiB
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index dc779439cb69..a58531226091 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -340,12 +340,12 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  * ********************************************************
  */
 
-/* conring_size: allows a larger console ring than default (16kB). */
+/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
 static unsigned int __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__ro_after_init conring = _conring;
 static unsigned int __ro_after_init conring_size = _CONRING_SIZE;
-- 
2.54.0


