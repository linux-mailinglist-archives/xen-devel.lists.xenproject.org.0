Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tk2bNUNsJ2rdwQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:28:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531665B9C9
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:28:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=hPofnyr6;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=S2uVhYl+;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b="Rv/YGgPt";
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=iyJ2nqoX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332195.1594854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWlGQ-0001mU-CH; Tue, 09 Jun 2026 01:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332195.1594854; Tue, 09 Jun 2026 01:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWlGQ-0001k7-9G; Tue, 09 Jun 2026 01:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1332195;
 Tue, 09 Jun 2026 01:28:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wWlGP-0001k1-2J
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 01:28:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWlGO-00EQLM-Bc
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 03:28:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a276c02-2eae-0a2a0a5409dd-0a2a4502b292-30
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:28:20 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a276c32-af86-0a2a45020019-94a392177e1a-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:28:19 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6590xFwA2569901
 for <xen-devel@lists.xenproject.org>; Tue, 9 Jun 2026 01:28:18 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ep8s884tj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:28:18 +0000 (GMT)
Received: from DM6PR02CA0137.namprd02.prod.outlook.com (2603:10b6:5:1b4::39)
 by PH7PR16MB4695.namprd16.prod.outlook.com (2603:10b6:510:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 01:28:12 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::a7) by DM6PR02CA0137.outlook.office365.com
 (2603:10b6:5:1b4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 01:28:11 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 01:28:11 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6590tK4t235663
 for <xen-devel@lists.xenproject.org>; Mon, 8 Jun 2026 21:28:10 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4en267t8hp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:28:10 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id WlGAw7KK6ba3bWlGBwoAat; Tue, 09 Jun 2026 01:28:09 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=vlg
	nUr4IEwMtxfKUlhg4YMH6JrcWHAbsa9prF06Ag9k=; b=hPofnyr6IINqRQsPIW2
	+KqTVvbB58bUJ+EdltXQHhV3y0MOW58fkpLLK2gXkuM7Wd+3+xZpUrg4LjCutGNt
	wT7WO2zycUv/QZKa9EWMObFqkW3f4TFqE8+GDeBJ2eP1xnNv/SlGNbSduICUUNy6
	vUed5LsJXcFJQQqN6Irm7o5xYzPLlw2wh0bdgZJm64n/zAT5TpnfX1ZudHVBBcH0
	Ybvb7opd0kWsZTNPN/KNUSisALIAQQgRny2ZTP2qgFkvUih28LZd5yVe/aXylZbn
	rA6UEaEI8hKeBgpk9MQljy9EOgAfhhGSjTvjqAp7KIrTdVy97tavj6RMKBhGu55+
	R3g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbrMp/n71aW6oEGWDiKMfvXZLZVenaIYCMY8w+PMgVmtDaIvT+4ar7/4WFMj5z/pF7FMZTOIiABXQR/pVjQ49elsS+G7Vm9bJjwGs+rBsNJKm+E+TS2KkzCy1jltcP/PslB3hFTEsaCXh6Q7DLLcTsdyCmhR51tXySmEUo8hRO3JY/VNLZoLOHWlS4+5L1yYwIv39IbP9CIRiyYje+Lad0iZfTBo0NuHSomXUFMVe6q9u0l0hJHwcARas9k/OWSVPY1Mz0NBJXVDijte0C9Dd9Da6psr+ejCBYQOdqR0CxfMzXSKI80IRveo97be4kXqo+OJ3c+ucX3AXGwfIH0ARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlgnUr4IEwMtxfKUlhg4YMH6JrcWHAbsa9prF06Ag9k=;
 b=UtYY+M5NWgDHQKy20OfwYH7JPYO8VwvBe97sOwRr2js5UCX4LUvKR+VC8VBI+5XCvri1WlPNXrwxULNFW8zCHsUO18x0kuQv+VhMT0uXGinw3tu8XRqaKeS7TVhWUgmevbIO04hPrRf0V4VHt7XDB7TO+9iXLMBOZ46QV95uosABlqKzO38eVZHmo7guc355PZOjGT+i4R2J2pu/Qxjq1arcuJGPk0FYUr6PIRdQ/wfOs+PCQK8/F+TDK8gjsLhWtgtT4wAYzCn1h2ZOdrgMnnOrNB+WOsIbL1DTd4PpYalgdlg/Z8xNZb3uPGAFx5Zj5VGW72L77SbgW5ngIzEVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlgnUr4IEwMtxfKUlhg4YMH6JrcWHAbsa9prF06Ag9k=;
 b=S2uVhYl+/uvckPZl670nZ1t0GTt8kiZRo5zxT/zg67znpxmkKLMGQAs+3Uvft2e+hEfbXvePQ7Ty8OB5+zsmvWgdZhU4XZMZYh/Xm5Hd3+hOl7phnQemH3VU4HX1I6/yuBO1koiV8YPNx++wYNUfv2vDL/rp0L0qVAKqth2jG1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=vlgnUr4IEwMtxfKUlhg4YMH6JrcWHAb
	sa9prF06Ag9k=; b=Rv/YGgPtwltzLkGrQ/5UAIsCs2bzr14rOPZJZCnAXjFnNOZ
	IsV7JK2RX1/VW3mjo8u0j1aMD+KXC5xH+n6DoR1yq18ali7cC0ww/p3zLjIkpUo8
	YFL+fChPK1YCN0S40rqY5YVlieJBpK6MjDZrm45AClV6bHFFV+ovNwUDQ3b8yxQi
	/W26cjfvdy3bAZ3qIX880pmlMu07CgIIP9TfCjOVu7MDVCkyeX0RTb3HGzVZnFqH
	EgzXTYz1DvFbD/+gaOR1PomCWMYRrcQNXxJFmA+Xnvh0xzX7Peg6nJnIzPmPAxAR
	+Wx0hUaH0oo+y62zquWmiwpsZpOadJkbM8KNubw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=vlgnUr4IEwMtxfKUlhg4YMH6JrcWHAbsa9prF06Ag9k=; b=iyJ2nqoXbz9t
	AifPhwWFOeT3TJ9RnFYIN1YxceTKBe0fvVcnelUiT857GVxkfUSRL26YNp8aktox
	ntoXadtVg25Qt1TrjHEe3TvMBU+SmNaT2JuoNJVMV7XjlsyctRwvXEV3sbpxrS2U
	3PL4UatIBTYhqklJnzez0sELs1FBFiMIcIgbdf2fyQlmy8oIbAI0pwqsIwB90axO
	CQheX2/pBdD9IsAZ5nb1JTtbVjAyOE1X4XyAsUynxkfmaKspp7lVxP5SMwz8OiDB
	bxzK/a8GJWuA03BSCBnkx/qqnXWSHWDyhDSLzG86EMHTaZnFLK3cwU5XNl+tlxnh
	3wW3hj5dbw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: WlGAw7KK6ba3bWlGBwoAat
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Mon, 8 Jun 2026 18:28:06 -0700
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org,
        Daniel Smith <dpsmith@apertussolutions.com>,
        "Andryuk, Jason" <Jason.Andryuk@amd.com>
Subject: Re: [PATCH v6 0/6] argo: few log fixes
Message-ID: <aidsJvlM/OtymlJJ@kraken>
References: <20260604214926.1735194-1-dmukhin@ford.com>
 <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090011
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|PH7PR16MB4695:EE_
X-MS-Office365-Filtering-Correlation-Id: 907d19f8-80bc-47fc-32fe-08dec5c65ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NISOUEzQRle+qnPsZeBB9p8nc6qO+ESTXcT2sKWfEsVta4WkF3IaSmx5/bs9b7oBIBey2bR8t5SeH+xeIS7D6sqOPbTCLoGbUBKyao7wm1EIXdMdZHtI05MM5NqdDWTwJe+pRxpiLQqCOzsYlSnBwTWvipqTly300fGFGSYlyWMNUpWvz7lKy/jhURgUkr2Tu5to04xbOAW4TZzbQe5JB/hC85qgr85aQvWQZW0IhP+SNcKMnjDQFWvcNrKe1+bLWZzujvJWNrzZWJg6KNcYNkzg6sDhbaXTb3GAb5CMepGkN95GqBGVQ/jDK9gjJUlQOyTQOqXzciNgNvx3ceKGxHYyxvQSLdPRnxfM3HmX7xlAWG4P4Su+aYQOXzyto7fsfIhx5zylxxY2qN0sUmjoWC5AtCPyXR9MaxSVFzv7aIM4102QyS555Zm8ToeveXby+iaQYVs4CKfBVTV69N6OVroxPzWD2/Kos6VIC1h6EoDhpKjMW8kWbP4rXGS/aQpGlu75ALoDxv7V4twQm5zXTnfsVl771co+yKqfHzCjdm1Jju7p6zFQJVMGMfLJHBHHHKMa4xwnWQI5PgD6cNYpqTVyQnjeogvmQvGrns+z6lXkwvZai2tq1nJT7VP3Oed3Nz6P8ljqjG/ugY6fv1/lBBeYXvbrRMNQlNtDa5uHDrLU6sqdxoiYIaC34+s63wSzfspuYya6+2sW3mQPcfZUmXxnQUUDs6CZ7n2jGWbAkCw=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S4e7VZJj5IjOBcLcO7l9HJphu6kvZxPMz3tYakysIG4pdYf7haII3cOjzxmV8IdJ8kvaHMxYyE4Mq129yGxd3DyT4ykS7M7jwj2E55iFDokqvIhI0P9I1dAE29HV+4Uvt1+E9Y+V6QqpCcSf5oGsQBAU+k95KghUHHHUsWssjgeRzG+LiooBoyf0Louci6zkVSid5ttUy+mk5mrBxBSQPKnMENHofSVGlbC/ULPTsIFr4fznNVo5gevClQtRaRmqnAeqz9r2lXn/ducyOO0L2nhIgP0RLjpoi7dd3SWWgXyBImAY/cmVKEsWKqu66grENtaqXVwZtVSjsl/w+pf2kkIPdZVJKI2hMgpLR94ClEOeAoM2cSur3Tjb1SyYVlnPjWgFffXZ12e24SkU3IIsTZQmaM84S3M1aAavZF0BYtU+dBX9Qm+7TjH5VPkL86rj
X-Exchange-RoutingPolicyChecked:
	h9iQra8U4aGcdvY1UTYLIMsgr6YGp6GRcZdsBxCeZAbcvW49wYroVUO7YyafzzNjZ5yLfbNjppvx29IgbOE1UqLagEmKp11VZYILHgZcVnMdyI87B2uOZ7N1KsKkJgcG3jNYUY1HpG/bYUhmMQPnLr7XDNyfKqHezYmyAlPNV65cUy0xNcI9rezRQ1SFMAgM6QtvrPEeCJf7ihcix0ersgthaiJrKbjG0sA4HO8/jf4x/Av7i3dBTXr5mfx8la8kGwBX/4cFl6/dR9XYR0ZtxdxUlCDDp/MsPV/nSpNFzzwullgPf3CF6Q1nY1B1wvZQIKfb6t/+2BxsUvvpM9Vz8Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	48LToikCpt+j8ovdehx4ahJF4iEJbXeUHZHRcSCKchaBHF5d4SclUo60TQ30yQsV3OQrfa7pIUz95v8Xxm9m05JHhMj+TCnG7Cb9iGWGfYJLGkHLE24U56J3LKvm9uW4dJ88gRG1uEes1UbweHqQ4alH3Ma3bcHwKT0faCOo9BpmE5KOMUEis8mLLcqVdYdUeFNBhV6sKAz1uAFcnvsCDJT4TQRksi96uEy3Yv7vlXemLCul229gdWz/dQBPFEalaJKTBbrcVo+sXy2Pw1Uo8O/Qwr0imaKfMGUSael9PrCzcA0GxN9JhbqJE214N5y4HPKHX5rwg86ofoMOmXWGHKTxhjA/t53ch4LeQZJ2YL+lW5/NtxI2Vw7H0l7A7TwV/IVloRp8n/yLpa/tsnwNateDU0ulIikzmiyDOjSQvbRwxpXvYAzBjF/FFkzNjbbI888SvK2of/0qqv3VfSQ5sVTXY2mByPxhack3y0ATosKNrpXZILRV8qhUDmXhk3xmUr5R8v+kyby2BS9yUQJAyazWgAttP42yorB233G4/px8vTSvA4+wCA2I3Nw9/1DUT/xgEpgwqif5jMkrs5cXjrfmMwc0doOHfYhNAprY1EmxnZKLVRVdCk2K5sHQjYmA
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 01:28:11.3584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 907d19f8-80bc-47fc-32fe-08dec5c65ea9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB4695
X-Proofpoint-GUID: 4OmKxEcjI4cUWG1XhzBZmCeoqBWOxZZa
X-Authority-Analysis: v=2.4 cv=aqyCzyZV c=1 sm=1 tr=0 ts=6a276c32 cx=c_pps
 a=mniIB+Hk/8HPdz+5sH7poA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=cbNQJ9GKAAAA:8 a=DmLxPvNSLnFg9s9KLroA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAxMCBTYWx0ZWRfX4q6mwNwiUV8a
 TA6ohfjaToP2Gwdlq4ejHMStCMO3xLOxlyw0nOKl/Qu+B5R8wLWR8wwDen+zC8dYxdQlwZ3brZp
 G23NPobnAI5Xmv0xqdKTcVwFHSqP18EzD6fwHOvKZeYvzWaY4xtX9dpSYT5vFqgtHTHs0eHqLCT
 G8xEOpwkhYG/c6VluegAqDcR1StX8UUqDgn9UiLLUgrLX4vi67vumHww850DaMieowNVqNDgall
 8dYq/5VDw06StY72/JZG3AGemhjZan79wFZ1fcA7+9ip9MJ+ATBPnC+bseEh+tQIc2eqYLdwmgu
 6VmCu7WsgPKycQKmCaQbhcokXBAylnEO2ubn5ICXB78hfoX8w+qRDSPc8/OBnUf281aXweAzPzK
 KFm2l9sRDHPqRAU5+dUgdi9vKsIsvlZJHGUT4IPgE4ENGd8lbNWK9fVU7028t0qA+nN3veFo1wK
 Su1Po7qqjfqWsCYEGjg==
X-Proofpoint-ORIG-GUID: 4OmKxEcjI4cUWG1XhzBZmCeoqBWOxZZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090010
X-purgate-ID: tlsNG-720697/1780968500-A9B70161-658D7176/0/0
X-purgate-type: clean
X-purgate-size: 879
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christopher.w.clark@gmail.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:Jason.Andryuk@amd.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,ford.com:email,ford.com:from_mime,saarlouis.ford.com:dkim,kraken:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,azureford.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2531665B9C9

Hi all,

On Mon, Jun 08, 2026 at 10:49:55PM +0100, Christopher Clark wrote:
> On Thu, Jun 4, 2026 at 10:49 PM <dmukhin@ford.com> wrote:
> >
> > This series corrects Argo module tracing.
> 
> This series has been committed to staging.
> 
> The maintainers were not CC'd on the series, and did not provide an ack.

Sorry, I did not mean to overrule anything or violate the existing process.

I posted the series as an attempt to resolve the log spam reported internally.

I also appreciate the time everyone involved spent reviewing and providing
feedback on this small series.

> 
> Patch 1 is rejected as an inappropriate change.
> 
> Therefore it needs reverting.
> 
> > Patch 1 lowers the verbosity of a spammy log message.
> 
> Please see the review comment provided by Daniel on the v3 version.
> 
> thanks
> 
> Christopher
> 


--
Denis

