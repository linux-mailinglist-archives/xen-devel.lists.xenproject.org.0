Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LP9TJAJpJ2piwQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:14:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C165B91B
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 03:14:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=h92jbGwW;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=fVUoOQ5z;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=Q10RcdCe;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=ouGZCVpc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332182.1594836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWl2X-000743-Sf; Tue, 09 Jun 2026 01:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332182.1594836; Tue, 09 Jun 2026 01:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWl2X-00072P-Pe; Tue, 09 Jun 2026 01:14:01 +0000
Received: by outflank-mailman (input) for mailman id 1332182;
 Tue, 09 Jun 2026 01:13:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wWl2V-00072G-DU
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 01:13:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWl2Q-00Fb5Z-Qq
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 03:13:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2768ba-5cb7-0a2a0a5109dd-0a2a4506e6ce-16
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:13:54 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a2768d1-7371-0a2a45060019-94a38ff1aa3c-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 03:13:54 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65911G1b935464
 for <xen-devel@lists.xenproject.org>; Tue, 9 Jun 2026 01:13:53 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ep8t3g25a-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:13:52 +0000 (GMT)
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by LV3PR16MB6286.namprd16.prod.outlook.com (2603:10b6:408:1e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 01:13:49 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::a0) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.11 via Frontend Transport; Tue, 9
 Jun 2026 01:13:49 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 01:13:48 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6590uct63787294
 for <xen-devel@lists.xenproject.org>; Mon, 8 Jun 2026 21:13:48 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4en2mqa8k3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:13:47 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id Wl2HwMJGc5kHRWl2HwdOza; Tue, 09 Jun 2026 01:13:46 +0000
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
	:references:subject:to; s=ppford; bh=MRrojxxGYYEa+N5sbJ4O9mWQE+i
	4Rk/E94bUMf2ErLQ=; b=h92jbGwWo8QZNNn89Kds9Po8kxwkEfUi+byPRUEP883
	nsx1x1j9X3Z5pBo8iaeAryHA/x+RrNyyDPmSOQJgssbQ2UiN9aXcfmM+s0LgGnEb
	JI6Ob+EF5W/b7n8qxHT0775pWSTRvZlmiK4G6CzjGY0RvTIT8omDYlBAFIUCtDEH
	rU4ZoWAAcuui2gxHCO2D23MwAYQqSnRlSTDM+tSHVZw8T4TkFWQ48Lr/wXfqRz9c
	yeoaYsBnLPWQyU3ygDWKr/HuYj4sNsxRIzXu8r7Vc2rLF4mReQ4NHUf4rV9Pto67
	BobGfUEAcw/7wBOQpsmU6Jq5BmJjEYKI+OcXMBG0WIg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqNiOUu1ChWjm+kzn5laY7Ehe0Jelgp7mo/t7GwsMT5Xlx8IyUShiNZcKdBfZGoV9E3Oa/KrhInI6tTYjr2NsVq8u8InhPpRn7Shb6sqvEfyLVUvRYzNniHuLPRW70MCBCZV7T0Y7FTeH0Ih3Z5KDrbBIx1U/PTdearR5FEw6NvExTSJatgen5lvcW4+yEuiF8g7epA1rokXn7XrChhGrvvauY+1xWH9vfUvs/RzBhTNpMe6rA0+aYLmSqVmH59cr9VMawTbLWcifPIUkH6cnmT2K1elgDaHM4SgHqNIXNfz/O3QDJifGvG5mqcHwigtRUg0NSVxMVkWyNclwE/9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRrojxxGYYEa+N5sbJ4O9mWQE+i4Rk/E94bUMf2ErLQ=;
 b=RvyLYbvvyMsH/UOHmy5Ucd1gUL808Ilh7S5yYacnWu7E5GXigAdKdrVRVoqZqaVvnyTIH3pAxQdEjIGAX8vu8owAiGqoSVy0wQ2lArfqL/SigNziJqfHJZAWa/jJ9vEnmNJONI9UN58iAWGhzMfPUdNlj+oHoEYi7kVshzGwXT6fC9gWBkWKHh45HFhiZqrk+uG9gqM/Iv0WaR+fD03z68k/Tv+FPJoUKT9eBmKHv4zbKDGehh4hAdafaNs/QhNEeBuCGsEAF4uTSyRjoV9GYBwqriWnKxdPo9Cdz8TyTy91QHEGsswPXDDlA45PB0fFDdOYR48k9wlrIqW+8RtFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRrojxxGYYEa+N5sbJ4O9mWQE+i4Rk/E94bUMf2ErLQ=;
 b=fVUoOQ5zmoi1WKlyzkiXdjsU4lxpu46c77jXUxvnDhsVjYdbp2bio6xyB2tg6fqqAK5/TwRZVV3Dg+IZdpM6+NNQlUmB6uIVtBC+vhl0Dg0WzD6/DX5fplduqhdb4UVZPst1/4+3ivO8XjmkTFnuya9m1dRigORwk/gImgl0SAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=MRrojxxGYYEa+N5sbJ4O9mWQE+i4Rk/E94bUMf2ErLQ=; b=Q10RcdCeOOFK
	0h0P/hM1/RCXfDrfrEjCZCttjbQy5lR+hJ6SLFK9UgcdEinuSk9mk3HhirgxsVv0
	OmXRa9oOgcSSCue8jl/ushAl8TsSTHpJBwg3JQOthBJ8isI6+wW5+DNBR+0hEm67
	CTl0zT8kPsWcF+LuuCqGbMLTRHreXNNw9HN1jf28KSOlH0zxfGhP8DhY+utdmbVF
	eIHQovlWnEyJN+otydeV6UzVCyxiAwzWTY37COcpp7ODBgwHHBEJz/a0Vs+wuc2y
	gL0Lltz7cwZIqk9f6O3Jp3SvYCpmedTZ96E/fZ2JqjFv0YI0LOyaU5PKs01G1EQ6
	o52uHBtgfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=MRrojxxGYYEa+N5sbJ4O
	9mWQE+i4Rk/E94bUMf2ErLQ=; b=ouGZCVpcmyyzt3HtaGZ8DOZgHz5sj2IPZnn8
	MuXbbUtYiYtYZkhFAXpa1+/BgxAEvWb/abv4H8BLAAXvqrhYwHy0NVVbwKrSrKUL
	4isKMJa7TflrzI2WCdDbmbd6Y6VkF7h4aTgA0s78nhMX5MgV3Cs/k+V3kxR2H1ZN
	uYxE/hszrSnUqT/W0ynwgqhs5G4XRfcycHgO3f0o6EdlzLg+s9ZQ21tf7bCAJzbO
	DKSf5rmMV9qsfqaS/eFQU6IhsxHpx1SN7VTpJ2TnkNuN1yvnxf4eaR4/i2381jmm
	sShrnoY3pepR7Joeceb/2eOFTMgChg7ODZEoI9+4PnYEgXKzwg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: Wl2HwMJGc5kHRWl2HwdOza
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Mon, 8 Jun 2026 18:13:45 -0700
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org,
        christopher.w.clark@gmail.com
Subject: Re: [PATCH v3 5/6] argo: introduce CONFIG_ARGO_DEBUG
Message-ID: <aidoyc/nME1n7ARa@kraken>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-6-dmukhin@ford.com>
 <c067e641-ab05-4dd9-b7e1-b7ea952de809@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c067e641-ab05-4dd9-b7e1-b7ea952de809@apertussolutions.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090008
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|LV3PR16MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 029ff409-6ef6-4ae4-85bf-08dec5c45c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	F0vlA5D7O/f2Yfhyoy+fiEkCifu59rc99x2lqgAfrengv7GhsFkxANlhRQWMxnonRmXEsGH1+PnFGGx3zGXht/sFQpcTVPD0oMETEcdRe10uTiuz5lMAO7nKUJN3UM97LsV4aq9N1/SpZrhepNgzdLmRZER4zi2J7Pl/YECW7a4zjttT31RMCZJ1klf6YbzGR9UAZ/VAZPGboPU9PJ+aa13QYzeKISkyMZqW+GY5rmSPKviMhabK+BNeYcrwAZPbZhEYFNCa99opWpUuM4Ji6xZaW7M5iUNw2wcU4Gv5AJ/1WkffxCszMm3gI1VH6FjEBm8mXQeoEUxUG1Kuh1zKlBBumsWSo0iyIzS5pI8Ty5Bhc1cGgyMSBCBo5npdtlSUJ22z/hJTXfyPy76EDxOGJjd6vfqbW3kpEqoozzFSfuS62ekndb8AsZtvktcVHCBhVp3dqY0EosHQTUCoqLmMG1ZGnTWm17+52cnT74xpsX+QYXkUXmv/ikq3UzyjKxljB2yjl+U2KnmVv/IEIU4iy3LeLbnthyWSDg4ey+XA5fsn0/vkIXxu1vOR65frJsNnucTrV3GdqnJ5Tn3JoYww9sKBqCbsB/nsph26IaNdOFC6YaQCnDXtHU7TzBzu/dlrHBwUKW5ZtX5N5R4vFIphN3pctoLUdawNhCfqqEBMs5qytLOv0WD6yCm3vQEMYyIY99F8bdy9JKc6QTNrSHBGhvtfLx15YwMCQsZcS4SzrzU=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E8rIda08HyejwwX70C2UNk+l+K60dDUCrNCgud9JNpoSdobaaoZtTG7OsfnSlZpZ0drrREcOtmTr5WYB8uaoMpmkzZaL0lyqU1COgTxUt5VN6p5jky/6TpKYaIcOiG8zyMmLyLs9pQ4Kb4O08e6gMTMeTA13K2/Os3lLFxWB4lGiiKFzs50xZJiBcr+Zc1nE6vumhe10rzPmsTWpx5QsLHtP0SKqSKQgyQ+ULbJD4Xm5fInKHf3FJCxWwR1GHJNxW050evdNtJmYT9LmiCcvrmqyfHe+ATmlHrhZBGzGxi/V01uN2upq04YmJMvCcVqafm8RtKES9uIs9Ly9eEcQO5c1uCgQWCS52U+OCjN2kc5/ET87KGz/2ZCdrOF0aAWJpJPZkRV0NHPb+1DHcoBjCLCfv1y9bu7pOVJ46GHd1tvkPFanEheSnmsuJ1iMIp4i
X-Exchange-RoutingPolicyChecked:
	AiGPmGqqDVPee/KBOkTt5SVSFU54yIapWfvGOzsNdgjgUuvhaxrmOcXTYChyRUt9+qGVlg8b8sUeXxvG7kyA0nSWyr1riN5v0qgYSl2jW0Fc/PHJYVPLULBbjWmcUXXc7NLkCe27ZayA/kti2Jfwc6q9rweX5T3WykzPb46133Vn05B6A0EYQ03lDviNz1nJoXfwnumAXAzoyi2SX93vK3bO2xTwVtLcs0iK/nstB5cjqyJAK4SeFt1UisZXp/roBP29Sm7uaZ/ZqizI+90WLV5+wDTqH6RNvB5MNP5cELcESNRLIbp4kJy7bjw36GH/kkVp7hUyE/n8iUt7UNxKCw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gM8sCADYt3J+9Z+bNSPBFV07H2hsy2aB/xcAq9rpARpjbqyAmg8e4YYnImqSH9vEp+jApd4Ogmm6nXglcJVKx1kkWKkihDWuUEo+UtZzJCFj2XHapPSMEoC4zqsFHTxesQ4ht3I2iwJijv+3F4QkCsYJs+Mo2Ao7AaBdyuYUv7PgN+HOnit967MesbgNF0W1jtl2fiUD9VGoFVM7mEsLh1q9ucl8xjsPiwivm0N5Oz00e22XHMeu3MPkT+fzmG0Mh1PMsXclQV3idSJLdWRZVkvQAorEb2u2zNEoGvE1Hfk17gor6ukip5lSZxJGO1pfB4hVBzHGSHCbFayUHxVRVvZDMf/0/+L49BiG8saBy6xJfeEFSUMq/7XPPz889hujw2eJiPnyj/aRV+ERx+i+6dtpaE3vulxR8tklhSplDRR1Ro9aFJyXdbBly5H7pFI6loZChaJOpqckmXXRq3fZdI+/LH90UKWE9GAdPO10Ob6qGDX+fuvCo/uRCzPRqbPzo4Iyu+PQ08DijLdXG7ZFZvqSsuJqxU5gAGCRFiA2UkGItTZ6YsXrKNH0mebpjT1yfY+yMBySNHXbATEvK434AK8MHP7v4BTx89YPgyECgaYfQedkoJ22cmHM0NfknX09
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 01:13:48.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 029ff409-6ef6-4ae4-85bf-08dec5c45c65
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6286
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a2768d0 cx=c_pps
 a=MMVmnpyRbxvAcRc6a9dgEg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22
 a=cbNQJ9GKAAAA:8 a=6U8o1_yNbxzEspG5Fc8A:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: gdNZvlgZTda9OdYbrFXm7kFNO21_HVjD
X-Proofpoint-ORIG-GUID: gdNZvlgZTda9OdYbrFXm7kFNO21_HVjD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAwOSBTYWx0ZWRfX/pGKkgxoBaFS
 PBVnMojxKUeJp5zF+kI/eg0fTwiEgRI/gYtU5IcklSbEwOhze5eKhhjyiiYsoDahkB/TSJd/gRn
 NfK1NGIiFiQLbL0bBwN85bhnaYBNdmEpined3+ga6yirzDnOif8ZxljWvCJ5H83owzCCnFhRep1
 iv2/UlT4Ld4p/W1pcPagr3fhTx1szMqeGwimKlCo8jkgj+S9tmSz4dcQK1fVeMk2P1lSJCdvDTS
 pzdzAcumG6nAtUWJYxTkfsjJFh87RsaSb75E1sTm9lfqtuDkZ4iIg1P0YVrRBtFWvG9stJTIQA0
 Qcw4w6dQiBEYt3KN5cVeSB5Yotr/A5hV6Rmi4LtTMKYQEwth5bCb7XCF3OKkiDoJWAgx5lxlNqP
 L//VAUDEPlN1deOirOtmWQ/K4/qcorZ6Hbqa0iPkOVJSQ+k1ve+A21sA9MOblP22agOPdD1QDWZ
 bk95zmvXWkmNoU+uKlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090009
X-purgate-ID: tlsNG-16d1c6/1780967634-86D72D75-3DC2CFA7/0/0
X-purgate-type: clean
X-purgate-size: 2137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,ford.com:email,ford.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,saarlouis.ford.com:dkim,kraken:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC3C165B91B

On Mon, Jun 08, 2026 at 04:10:15PM -0400, Daniel P. Smith wrote:
> 
> 
> On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Add Kconfig knob to enable traces for Argo debugging.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - new patch
> > ---
> >   xen/common/Kconfig | 7 +++++++
> >   xen/common/argo.c  | 3 +--
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 5ff71480eebe..adcdc51dd21b 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -491,6 +491,13 @@ config ARGO
> >   	  If unsure, say N.
> > +config ARGO_DEBUG
> > +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> > +	help
> > +	  Enables extra debug traces for Argo debugging.
> > +
> > +	  If unsure, say N.
> > +
> >   source "common/sched/Kconfig"
> >   config CRYPTO
> > diff --git a/xen/common/argo.c b/xen/common/argo.c
> > index 3c38a51d09a2..b9b362064e7e 100644
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -318,10 +318,9 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
> >       ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \
> >        LOCKING_Write_L1)
> > -#define ARGO_DEBUG 0
> >   #define argo_dprintk(fmt, args...)                      \
> >       do {                                                \
> > -        if ( ARGO_DEBUG )                               \
> > +        if ( IS_ENABLED(CONFIG_ARGO_DEBUG) )            \
> >               gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
> >       } while ( 0 )
> 
> Is a Kconfig really desired here? This such a trivial knob and one that is
> really only intended for tuning by the developers. Exposing it as a Kconfig
> option means you intend for this to be tuned by distro builders and wanting
> to see it exercised by the CI RandConfig.

Yes, something like this: parameterized CI (local) build variants.

With Kconfig facility present it is simple to enable extra verbose debug
builds.

--
Denis

