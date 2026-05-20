Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFlNN+ArDWo2uAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:34:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CC5874C4
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313533.1583648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXhg-0000Eh-0t; Wed, 20 May 2026 03:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313533.1583648; Wed, 20 May 2026 03:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXhf-0000Ch-UN; Wed, 20 May 2026 03:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1313533;
 Wed, 20 May 2026 03:34:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPXhe-0000Cb-8W
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 03:34:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPXhd-008cMQ-Kq
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 05:34:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d2b99-e002-0a2a0a5209dd-0a2a4502c77c-36
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:34:37 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d2bcb-af86-0a2a45020019-94a39217fa32-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:34:37 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K0m9rb020720
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:34:35 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e92r00t00-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:34:35 +0000 (GMT)
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by BLAPR16MB3844.namprd16.prod.outlook.com (2603:10b6:208:277::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Wed, 20 May
 2026 03:34:30 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::c4) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Wed, 20
 May 2026 03:34:29 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 03:34:29 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JNpw3p2213437
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:34:28 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e77nrbhmr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:34:28 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id PXhSwD0B8FYU6PXhSwWtAh; Wed, 20 May 2026 03:34:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=VB2
	EIfuwZN5NpX6Y0ClbK4BwP9/lnQurk/c6iY7FpyA=; b=DPf1H3qbi4r7BuNYFa+
	Z+nylRP7FuQJSLC3SxCW8MYwLIGtanfm0faallV3aAsqejv+Sy7ChsKy45AmOzJB
	F22/AZSVJIULQ6ragOVdQsWdBrUSetjtnsRhXJ+rezDHTcoTiPCRhQjjIO4XBz2y
	YZbVE6K9zGn71JhViF9qA/HHxM7Fnlnq67QCoC/+bbEKosxZ09BJ7G3TK8emlmvU
	BuNlhsBDEZhDY0LpoLWTT9A9blSFnXXSEnENe4tWdErX6E218Il+JMn4iGOZLezn
	tWrtXg+iXOQ/FA9Ldk6g530IfXFEJDcjwKfFkpXF68QhKNZQtCu6dNs9ShXxSlL2
	NKQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiLfogI/i26HuvXq93jngElb7GjVbF72Rp7bwKD47b76rb1qVp+EKqPA92cSRkjbm4/8AGXBE21NgUpXTo00s7hWvEFgZar3lqchIuhaqrjiroaWVhduHdsl0TZvGpRedcOdc+T8Zl8n4cbI+sSH6oSZd8pd0EzzDu00MVKQ3t+9fuRbscSUf3hsF/LnrguM9jAgAjrz/1d5+vKt+vZB3DKxstv6smp52MzMVpDP8xLUxLc9OAsrPHoMhgvhxRwRQ3JF4onuIQaMx/zbyJ10QSQZ4oKD1RiPykEcXPHwMoSp39iz1mbkxx68Firm3k6yGBGq7GMv3ecFN4RHZiDjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+z3JbfLUtKKu8H0tn306Fwsm106GqK2cyILhROeg5I=;
 b=cnACWeiG9sA0rMzWGu2n6xIe0XbITwefj9j0ur7ze1iTG2YixLIsjaH1GwVPpSsofavuIO1wgD+DwvBGWRhIxWGi4h5dzfGFRDNV57u6uwD+KFaxHgyp8+Yby2Pw0gOlmjFlg1k57WTV7khwQWEyC0bKG+nFYccNYktaiDpPhuApdJPti1B5A43jST3QqFgFEhyPan8dAP0l5gXncN0MU4Nn+hKSwD9jXlmoWrLnIb6WJnXzATO8+6ib7hhTAH8udbynMdEdEHPnO51dwvrbbAlOFEJ6OLsc4rdC+HkqVu1g+9G0oHDGFy1LKdSPDxmwiGlq9rVwi+PpEQnDlsUpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+z3JbfLUtKKu8H0tn306Fwsm106GqK2cyILhROeg5I=;
 b=iQD0+nGS7Jl0+ufzasX+P0bXZlQ/5DeNhfaULxAj4/dhAZ/JJ+fyM5vDOC2+e82NszeNA9SSfYKevgHSEuPUao2pu2bWEdV9t4EHxjQzpZxIj1DCT5jVc8NjJt/18iCeV4b8byTNEc5PcIeyLT7H8omjRZ5Ttn8i0YdpdWh6rT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=VB2EIfuwZN5NpX6Y0ClbK4BwP9/lnQu
	rk/c6iY7FpyA=; b=RTCmpDAMntO8YbyCu8zEz5OqF+/2IQ2rHHjDJL1gjq/09Yr
	U8Yz/AcRU9p6TcUlSMRzaQ6DfQVNQNMEo/15nymUP8XoLT6hijEj1z9KS/gDLDw7
	S4WclvfNFW3CnKd8KLPOtRnIkMmL8HUEm6HBMo6ORXwIrnTKc9q77j1TakEg5mZT
	LU3GlkwVWM09uFurQ/a3FRgtgzsFbpgTsKypZ2diESCnxxCiStkrl/BB5XAWx4DO
	eVB/NBWWLHeENTtOUrVPL+tAtmxTLdz60WAhcsgKzr3xvy5cvJZV1cPx5u/SnCrH
	8jb1xwUacs1cKQWQ/CM+n9i2ZKYWR3fNfUbILYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=VB2EIfuwZN5NpX6Y0ClbK4BwP9/lnQurk/c6iY7FpyA=; b=tX3iXyfl9LZN
	Rqf8fluylYoDa86n3W38FfMmCq1m5rfunUfd077qfYy+ZbtOyZJdISxRNiwJVk+S
	+g/8ZOHQ/eXCgm8guCHt38YIaT0FxmiTL9y8yzZsZmaN2QhDPn0si97lQyhDPPSu
	UqTd7moh9jtPjs7aVs1W49+WseeMiA4wPNdhkU3gL++v2jQ5DlDRncA27m6yzmUz
	6o3pZomQ6wHmbrEW42iyPM7hniJuLDIJdYXWr3LB6uqOBFlidbu7DNCnJ2tHuWMH
	3W4Vk5T7aZlMoT2mAiXFK445voPal/9yFssRkXYnyEJnwYpWDm1zrsa2zjCx0R/l
	m+0w6l5z4A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PXhSwD0B8FYU6PXhSwWtAh
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 20:34:25 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 0/5] Small PCI refactoring
Message-ID: <ag0rwTIP1Dlo530x@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779124816.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1779124816.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200030
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|BLAPR16MB3844:EE_
X-MS-Office365-Filtering-Correlation-Id: a01fccad-cc99-4cf2-863e-08deb620b306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|3023799007|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ACnjyr73HIHdTFvgvZ1zvSXfhmahGhwGauGKgX7zayCVRPYILO4I+Q6aSzRBsarR69IRYtLsH7uRo8PnGDWPQcHHvkTocz2ymaQHFFERqm8ZCrB/qDYB00kPDj9i0J/LxynNStNJw1bLM/GR7AhOhrl0GU0Y+1/fxViu0UrzW7bpAH/V7YzB22ECjLFvuYrVcfePIyTpXrYAao3NzlUXEzz5IjpWVesMhfNHzWag6qccoe5x62URfcI8UQ+IrM0wigL0atmBWOIXFh+kyo+XqAD4JNsFcHBqyB2Hv7PgGVYj6/NZEeobDIBM1KZU3VZXUdIf2B/xlzqoSh4qVzWHqPsvCrzoeqkRLtoJYU5BytWFC+u+p0YqrvStPe4sRmW8XmO2T8DcVnzpKYDt0zXJAK/Nryr+4kKrWKW5TSaws8zPCXKkYHKmAunWPHor7ZLhGJ2pQOD19e5sja3QuKy+pXEIbYPBLRUrUufxuWs1I/vkGpWOd3po0vIimFOppogLm4NrKtaBf6FJGlHRLzrr/FFF8WzGuFXV8F3E6R5+Y7YXsACHjjwg1zyyyuma4UN1rrJy5O+JmwNzxgGjbVoP/dyLfB9aSs8wC5x+JoH7WLz3Ok2/jkkBLeQY8TlGH+xLUhPBsX1AvvU6DpHQVXbDGDcf2EMgw+XFdmLaCSy1j+H2XXGPUrMczljzvlvjaHdMj6m2TiVZH3rH8AIobtnIvfP5BkR/k/V5h0vnez0y6lc=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(3023799007)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hvFj6XNTisx77GBbvoLlR5LDG5LD9m84oi/WwwFjJb2tjGYpB487ord4NTZlfrBIqNTWHuFMrx+/2Qxt2c92Fiibs4NrQu8ps4aF96ZESf7e52IAr16oV4BEoOYS9LEGeekLCvi4gfScZNBEnHQfqta8PLiz3lEbmGnVOfyUVDtSYC/LzXsSMujHVa3MYAtqgcnzoa/LPB4IDjECmwsuX1QasCxCB7vnmhkf5R2dQ2d2drwLYtEEQMXrcGZGYJepepnUUwN/2+dVUczLfNxurJT+UmliO5IkB0LjS3JYhGzFJ4PinQqFD0zTb4rnoIVxTPCVUfvQQRu9/6tspUraUqRyxHGtEo982tVPjXWkdxwA8xU1s1WAyh7aPVapsXf09jj+839zFGAXB0VdcsGYJ4UwpR5qytHeYNmk0lUlHgNlAKmpSSUZdzHkh+YwGo91
X-Exchange-RoutingPolicyChecked:
	Gt2XHsI2Vv8Rf7v/Efcek4Y8rK2ht7Hk6VarPQruNClRrrxjYouMuhZ9P3nyhYxdAVqG7W0kqqHX9tmWp1v58VRObD7TcmKcZdyMow6a591rueDpQRHlPiaksqo31PW30sHcXTRiUc7PVDgm/J225FLPDM9stYwMawusyWKordKA91kpc0VQrsjqc/AC5YfQY9fYJcNeNtWIcGbNSlJmNOrS9oE8qAWPjAGedyYex/P7JGBOCRHLB3vFeyZsPGaJr/Q/wk27upTt+B1mjATBzBx4ZWiYrlQS3EVdSdRQQYRPYMgMzoG3RfPY//htL2eyPlTeJ25rXj8IHNl2/9zpbQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vKY62CCHEUk02CFcQXH1ptL/jL9U5QJRKJMChAFT9oEx9dbIulmTqNEOSOmJFzdE/31C4q2O09UHjEoDlHe1jvkM2AmmAt8msxaIe/+VY+gTNdT9S04flGfBDmrZqttiaO89xHRCgcVET3UKpj03mPN9ndclUOEnbz8CfKwK1LlKieyuAhKW/zCd4uP+QRvt5Bhgd1CEPPeZ2daz1gRSYHpLvfXFqykhita+HTjHHoRZac2PEfFRMgbp86WsciM4SiL7JBGe8lvgokapblR5P96cIyI1NLIQ5XU+oISjmRHVC741KDcsX7bifXNUxCvj3JgzrUjkkZjxNt7Ja6DZnmh0KuzWm8WZ51PWlpRj4YX17ZlElcLYM0QrozrVdjzUBYeQiyQxxjBAKIBNQZSUZvDYRRLD+IpoX/QPMv68o3EOCrELQernh7W01+jwftJCzRyXo7hBFG/uEgXbqa9GDYj7KpblgxLxRfY+XEuTVuiZKPk50y9xWvj2wWdC7fbrWLv/wlTBO8BTXooM4AFf1xCJLaJTpfiRWJSUPbycNAg8Wg4OJ7/IWp2MPUl8Azgu+TLTUXh+1YOqJM3Xcg4bmrB7g2HOTu1NYNc9SwpgRHcWS+MdCfq3ZhofCVIWCAQAKwpkl6mhGq4e/oxeD3FYPw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:34:29.1440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a01fccad-cc99-4cf2-863e-08deb620b306
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3844
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzMSBTYWx0ZWRfX6KOlcjd5avMN
 sWx54FMDG4MD34gmUfeVnBRmqwvnlQkIoKTE7L9+3SqqP2QMZz1gYXh+X4sJnMw6Ra3j8UF2fyK
 sbQgQja1qtCwwa2iycJx/ige6DsjSwJkNNNjq37JVKXZ3dTSOpjYhqyZ4x8joxxd07OskzMpt6X
 ddATPbvHREzvamKSO2NdS2uA1eaivnoBoNKO3Ebld4N4V/AYDvo2rf2Z5/hORcDFccOPJ5vlXPA
 q70tYLX9QO5Rq7uYPHEnou88/3OLQ/nP1IW6m7ZNf9ON202rcKbewB2LFcUai7v2pek023Pr10x
 kydWsF0uNgiF7fsiHQ8HtU+MFJ13EQCyZFjVLjejikCJ9l6T51a5J8sbpjve2t5RYVuMgUhXruU
 tWHU//Q/Wjek+3jEviyaZzA+P2nE87+wFFRDnofBEo2rkX6suB2TWHZ1ZZmzxMEvc4oFCkLdfNN
 A8l+igDMym50QzKQkgQ==
X-Proofpoint-ORIG-GUID: ihfgUInsz3aNXo16sGv-0DeKyAXjuIKl
X-Proofpoint-GUID: ihfgUInsz3aNXo16sGv-0DeKyAXjuIKl
X-Authority-Analysis: v=2.4 cv=TeOmcxQh c=1 sm=1 tr=0 ts=6a0d2bcb cx=c_pps
 a=Eo0YKKWWvGv/UpXdOuOi/w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22
 a=cMLCuIsWzknWaDy3D-kA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200031
X-purgate-ID: tlsNG-720697/1779248077-AA76A161-246C08FD/0/0
X-purgate-type: clean
X-purgate-size: 1177
X-Spamd-Result: default: False [0.32 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ford.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:-,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 371CC5874C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:20:15PM +0200, Teddy Astie wrote:
> Le 18/05/2026 à 17:22, Teddy Astie a écrit :
> > The goal of this series is to make some refactoring of some
> > pci primitives to improve codegen and make code less verbose.
> > 
> > A big chunk of it is converting many places where (seg, bus, dev, fn)
> > is split into multiples variables and convert it into being just
> > pci_sbdf_t, in particular in some PCI function parameters to reduce
> > parameter count which usually translate into less registers to pass
> > to the function. Moreover, we also avoid translating back and forth
> > between pci_sbdf_t and individual (seg, bus, dev, fn).
> > 
> > Latest patch attempts to improve codegen of pci_conf_{read,write}N()
> > by making them inline specialized variants of pci_mmcfg_{read,write}()
> > in order to eliminate a particular `switch (len)` at compile time.
> > 
> > No intended functional change, aside some parts of the codebase that will
> > now correctly handle PCI segment when parsed while it was previously
> > ignored (e.g dbgp).
> > 

I would schedule a full CI cycle against the series for smoke testing.

--
Denis

