Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 40oUJH4uImpDTgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 04:03:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B9644945
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 04:03:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=NSW4LMhN;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=g67DRy58;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=IRbl3IvT;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=l6HouTsW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328857.1593131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVJtN-0003jo-6e; Fri, 05 Jun 2026 02:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328857.1593131; Fri, 05 Jun 2026 02:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVJtN-0003h0-27; Fri, 05 Jun 2026 02:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1328857;
 Fri, 05 Jun 2026 02:02:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVJtL-0003go-Cf
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 02:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVJtK-00GwAg-9B
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 04:02:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a222e1b-5cb7-0a2a0a5109dd-0a2a4506b55a-16
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 04:02:30 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a222e33-7371-0a2a45060019-94a392179b9a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 04:02:28 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 654L3ECi1364243
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 19:02:27 -0700
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
 by m0482517.ppops.net (PPS) with ESMTPS id 4ekgxg9dsv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 19:02:26 -0700 (PDT)
Received: from SN7PR04CA0053.namprd04.prod.outlook.com (2603:10b6:806:120::28)
 by LV3PR16MB6234.namprd16.prod.outlook.com (2603:10b6:408:1d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 02:02:23 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::a1) by SN7PR04CA0053.outlook.office365.com
 (2603:10b6:806:120::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 02:02:23 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 02:02:23 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6551BucS1074460
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 22:02:22 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egexd8ycw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:02:22 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id VJt5wBZaVKoqdVJt6wLwzq; Fri, 05 Jun 2026 02:02:21 +0000
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
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=DHW93lWYDfAHc/I0EskrkTFx0mB
	ulBjH5qZoxJvkX7I=; b=NSW4LMhNwPOPm9F90Rng2Vc9sXJMCvJF+8r7jkk1hXq
	gH9Xs+ncugb6FK0TeHdj+LW4UMW1VFzaDhUV0Ul7wDSEHq9qkwzIu4pFDKppWyL2
	yzjJl5v+gi5z9sSc59s67ln4soGVLMdEHNfZ/QbnHW/bwmC3/PY4LKt0kDkQ5eCo
	kw+wyTv0945U4I/8Il6+hXcB5wmFo/rUPbTx46jw+YN+E9g1Az9XzkjCOKhkRvq9
	xaOF2ZGI8AXjyVAen/WaM+u1HQGvilz0fdKx+rYrD3hg982MwHZ7hZE6jDU1tJ8M
	EWCG/CCHSEYvR7lGLfplrmQB6nHsoaJBriB7jwnKyCw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A85IWlQs1VG7i230NYEPrc99k5uG5cKEiHDMN0hb12G/ST8ax/l194YqjNWbgdbO7VV7H3Z03ygfnD9fPPQoZD1p1m+GX4CbOmor5Q0yudC5V+WIFU7O0WQJB258hBNMS6L50CM1uHjRDvh7KhKpTLx6xd8qr2FDaSnpTGIlPkmfSlZOfLRRsGwNtC59GIiw3hbEHLG34AUfsAR/TeJCK7xnjhTvHlflyyAlucMEV0wGXzEd7B6F7MZzFZpdoF27K9q7gS43l+l0AdraR/bSAwkkFg7nHnCPSSp+TnafEyi3Hgp+9XOVxZtS+UI/FSYq6YeqyFoMm+v4v6IjqozUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHW93lWYDfAHc/I0EskrkTFx0mBulBjH5qZoxJvkX7I=;
 b=FfSsoEd1+lMAnXjFbJYoRs9F9yHavWq/E4TwWAtMnk1enWEKc8woUCnWdtMcygLT+XC8arMubYK4ceoaNSGRotTIbUlsAinasNY9EUw1jyMuza8QrF6/ndVg6iRvAdS+nwOqSJEqiJ2CrkBOKKm68AfXoR12ozrAaX34ZHOIlIwevf6zRwZI2UANWGs4YXOvxpGB7aESAvSdWcAm7x5uNIDo7ePUErPRgfYuTguoVRmbWCJVQnc/RrvJ58Ar/uuhQEjUZptUPISGc+72KnfbFDLrp/fp2iPnTEXiHeWOLzvaBvuXdpvBoGHwD4vaFiP7nfDyBtHvRsDBatea3WHGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHW93lWYDfAHc/I0EskrkTFx0mBulBjH5qZoxJvkX7I=;
 b=g67DRy58Gud9ltZ1kasEWjNuw55vnRZA3ovyFzMcv6WuF0K5NmDg9gz/t8zVShe5Uj9atxJVuinLUf4EGah76j4YpsCX9FBBgX6qBAaOy96okeQMqNMP84NfDwGyFJJx7l2AVuFRF/s+fvVb8+sJAECLLnyYTcGf5PgMAMScSdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=DHW93lWYDfAHc/I0EskrkTFx0mBulBjH5qZoxJvkX7I=; b=IRbl3IvT9x2l
	13BeZfRMRWruPfqxRcYnVfcw/XT4njZOHYFbAoJKarlMNYky1MLd8/bCtDcXfXjj
	yU7++b8Sp+lovm7WsIXa5YNSuOdu33o2i5hEDNLMUZyTsdM5Z8NNk4kMQABQ4/kZ
	wJuXRt2l+GLBjPY+UJOeYSITBqSrSGg9g4uFyZNhNXq+Ewh6xrTLpl1EOnIpdBlh
	2u3BKnfzxLXBa9g+CIuPpfW3D0eJ8rRJD1u9vidHezYRvApsZPHlK53k1U09ZNry
	idP5MlACGKvsdHpnScXvSn5SjjKA86lgZOVJr62KxCTdBiHlrmDW2WT9B5yOOp50
	ngw6xZe5ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=DHW93lWYDfAHc/I0Eskr
	kTFx0mBulBjH5qZoxJvkX7I=; b=l6HouTsWLnI1M+R8Inqiq3chaowpciMF7wsj
	ISB/IC2jPCnbB4kwRmJVLwnJ243bhRQ5yDFOiBYyKUeLq1qsuuuED98KBzuNv9CM
	y4/FvDtj7Yf80gvGgd15HTe94xMyNL8jTHNuUG9TgklGQDoYTeHiQPhBSnQ4VcFh
	fzijNxMMF1B3UZIbTvn+LUszg50vC3yz+K+NTY+mW90zOkcmgFACXFHdnDd1MtHH
	fPPF14XjmBZWyu06P9aBw+kBJ+uUHfcBkcgDxvdsSXFR6zWxmnYru1AVplm9NFQU
	hjMFis+4mtBsySluUv+sPdeOkLrJOfQ4Jb6bnywyD/OL4kzhkw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VJt5wBZaVKoqdVJt6wLwzq
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 4 Jun 2026 19:02:19 -0700
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: Add C xenstored and stubdom tests
Message-ID: <aiIuKwFcv2y5KtKd@kraken>
References: <20260604233328.805829-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604233328.805829-1-jason.andryuk@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050017
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|LV3PR16MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c6af16-9e84-4372-1eed-08dec2a67be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dez4SxrSesgSPZyKy+ceEzWUmVnKpYxNw6ez/WYhr88E99RXtcjBSpCxq4Xsi6wmxF0cm1BseMea6oJ7zaqy1YXoHow4vaeazQAoo2tNTHMhxrgFQ7iBly/5VzEiiHy73A1Egty6osFSOle9q0BRc3nSnjb9/n9SrZxPw0+9eTHsczvrnCCzb7LW3EEIYYUDPv+Qtd3IuQWlnXrNtVM/mQKzn+w/uzU7F50ZSwKmDe1Gh+o7RCkEv6NQPG9zhoc3VB2ChR+6ti3jOnWPI2Xd6g4SvRt4mxKc7LGhYJGrhA726VWLB5kTErYmbRJ62d/6cc/O+Se8sjN5YvwI/KieoHnS52G/C6KInbnaKZ373uHS47mHVHKREd603QJdoVBLzdEOd4o++DfA/H3FBhXIf5HCOALDSGENRW/shSG+2DKej5weKzuSnv3owakr/yA5xVT8EoK1Xe/nWRznIbUde1mga4PR/81I9EiyRIgbU8LYXyD2Q+KC6ahlzcVOt7vaDHmSMGIRHi9BseOEjbjNMuh9jhKtd9195xlvSc5c+VssSFacFd5SuRufKBMsfe4qvdGXD6tLDKHJpW6ei7RCYZ4hR2dBVMrXW3cW+ogfwCaGi6NwdAU8FAPn7C9gtkw3LQHfK5lobHmJqMQoJUsd3dxZtnSv+A4ku01D0dZGqYtKRxRSKJ8rnTEPgtpdjxiX7Ez7Ztl7DYcQo9LhSHgDxoMrL673ai43UX2jwHqj2q0=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bNW5fLLsFAmFczUUrZWOJBkRXLxCSBk0u0ChyIihwB57O8677R6gbyHqgYiaI/95tQAWvCyCkLl3WZ0HalFF9kaCiUC10Gk2Ja8PS5zWDid/FNsmBof7fZc+CxML7HvROT9uQ7Kd0dhYqUcmfm/xqC1plp4blek67Gax4c7JAPkeM44yyALeI+tiwKyd0q7ipH6Srqia16g9zWl1FWlO8INPyCFrW7cDtniQ9LeZvzNArZG1i7xrihgYsVy0VKiQERtuEHsQX3i3RQuzVHrdWTl5jUcb8IG+jMLCudg1zc/jCeJXdN7Z0zYRT7KR7T+nX5enOCwkibnhZh4rHR2fCQAcWEz63dI9ViK4fnLKlHsjGFdZKOvmYcmQU19FQxSyzLm/jOxDtHBIQg3Oycenk3s+b+VTMtiArguY4d8tBLoHy2keLVc3NUhIr+ZS/kG+
X-Exchange-RoutingPolicyChecked:
	PtPBVBrxrFtZM8xW0PQzsJuVTq3gwXxFvdrBQ0Jb+13GT019LW+sAMnpBCUX1Kjk/bVx/4ECJCi9OybhaxxTtrf3N0KwuyK+W1Lo/R9owyEJi9PcmROfG98yWV3eklgyqYTRFQnRmviD1g5gpfTSIdJCJ15c8/VgPHfM6F4gTlDK/wB3bfjlmJXrQA5nU9Kt9AGxlnrf403/8sK1KRbuIw/TUUVnZ5/P56UQLqWJDuGF1mqX6aj0IW+bdcKfGXO7HPgWAhRYgA2JIIy4bYpXwc0isT+IwZyBQvAR+a73OK9rImDlG8E9EmEU+pvAzdO2/XWBOSLshbRvCMABE2OrUw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I25eVOHw/1bYe5WHGLIciohlQTWgFICrxq+MVg2QZMW92xZqEN0+5Lk6MC6dgE7zfty3Y9h/LOkXfiEsio/JBDLS980GrekQr44vHfIOTVg5dSyjwUV7tGLs49uZXX8ILQBoiqhmHxOGzu7kUk826Cnect1fORVOzo1K/H7rKskmPrdQUk0Z/EG6cRe2O9NSb0Lfdw006MBWBNuPE/5/Gk/lb1aO/PfcOZWeSiNvBIq0b8aYJLatLflhY7HK6Q7rMTJKO99BM+K0eyjodtOtjlja6C1qKks/xWHbYgruq2q0S9tHSuMCPaON9ekACR7XUBHS89A1/0ckh+7g+8JgXGo6Tew5Cawbc+zOslIzeRAbu61Jfwc572uFZnR4IsBPn6HaNXnyWtNRXu9WD3sI1JWwaJPs9brjbuk+b3gjKeusEUfkQIXkbz0pcc6imq0tJKXjCHSBrPGNSnWR4h8z4CvLKZs+mNd2Yge1SNaPfDFYxxHC723o/7yJ/VSqFDZDd0+v0wF5pcN/NwFPUKhOZe7LyTW/lXsoD2wGjmRdJE4zbbOArNqeNe/1uJTsgxJxlazP+/gdqNGxc0WGIybd5Q3SN02AxXJk/+e/1zrHjfJ/RWiinWhgJ73wh6Gj9NfG
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 02:02:23.0730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c6af16-9e84-4372-1eed-08dec2a67be1
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6234
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAxNiBTYWx0ZWRfX8A9e33F0q+/9
 SAQrS3Ska638hZLI5ypv7/EC/4CbfhIGZXP9UrWzVtra0H9yySSI06Iyx/Lf6jhSqitJG8wUFPN
 c3vcl0pCotOqjfTh1EHHXbedxypiVga1lA9B18Ox2RQMnV9OVpq7gbB3YsAFLTwSddOa2o8krGO
 JkmUMcdr59FRC519JCDdvq5ygWeR2qJfxHKcmq2Jrnju1hycqqxucfVPWXGo/5kTqf1Zx5CjrOZ
 eMGetjo/ErCWR8dd3iiwinbLbnPQo7kfQdxRpREI5Uq2Z1b6oXF1c5O30qreKkwbVE5ZHnHvQsJ
 BmrFDEZho8OFt+UXTJj80g4N7Jherg895yiCkyL/nI1rWQPy3w3QOVkjqAGO2iI2djKKk1GQ3+V
 7NkMx4UhxWFDrPX9+ta6X+cLP3DdCXIJW0DT0dePB8Dbmhmg3gsehukZD4ga2SfYFTQFvYE6vaR
 UgKSSdGBwYKKTesyzqw==
X-Authority-Analysis: v=2.4 cv=XIUAjwhE c=1 sm=1 tr=0 ts=6a222e32 cx=c_pps
 a=beY4+7vfl+OHeoikwBMclQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22
 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=lcodDjlxucsrHAyZpscA:9 a=CjuIK1q_8ugA:10
 a=tHM1YVGr_7IA:10 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: 1A0zDa4W1lxnMrIGWPlHuUamFFevnP-A
X-Proofpoint-GUID: 1A0zDa4W1lxnMrIGWPlHuUamFFevnP-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050016
X-purgate-ID: tlsNG-16d1c6/1780624950-8556ED75-4A89F2BF/0/0
X-purgate-type: clean
X-purgate-size: 282
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kraken:mid,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 627B9644945

On Thu, Jun 04, 2026 at 07:33:28PM -0400, Jason Andryuk wrote:
> Expand testing to include C xenstored and xenstore stubdom tests.  OCaml
> oxenstored is run by default.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

