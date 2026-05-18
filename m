Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DLkJH20Cmpx5wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:41:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FC566D41
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311491.1581607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOreU-0005Gz-Lq; Mon, 18 May 2026 06:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311491.1581607; Mon, 18 May 2026 06:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOreU-0005FV-Il; Mon, 18 May 2026 06:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1311491;
 Mon, 18 May 2026 06:40:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wOreR-0005FP-SC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:40:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOreQ-007OGt-Ov
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:40:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0ab459-bab6-0a2a0a5309dd-0a2a4502d724-14
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:40:30 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0ab45c-af86-0a2a45020019-94a39217faf0-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:40:30 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64I4cnGc3577629
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:40:28 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013066.outbound.protection.outlook.com
 [40.93.196.66])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e7ux40ktq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:40:28 +0000 (GMT)
Received: from MW3PR06CA0006.namprd06.prod.outlook.com (2603:10b6:303:2a::11)
 by DS1PR16MB6639.namprd16.prod.outlook.com (2603:10b6:8:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:40:25 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::25) by MW3PR06CA0006.outlook.office365.com
 (2603:10b6:303:2a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 06:40:25 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 06:40:24 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64I3cfAr2047041
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:40:23 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4e7afrs109-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:40:23 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OreGwohgKZ2SgOreHwmLnV; Mon, 18 May 2026 06:40:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=a0lLwRxvp+QKDqXzINjwoO63vCm
	IhXnCorPVb2fF58I=; b=jIeffbBQyLMrNBT7gJQWFfYVe3zHJZdpuXc/rweKhrN
	x7ld0IqZxUtoo6nZHAp29XR6vFeeGIhRpobxtp2XePSyXCUY9Vk6ykuITY2/9Gyi
	/SjerjldKCVmo/ZFSOkI8N9JZ5zniBnFcb4TtgmdyrUk/rlP06xwHKkFBvShBfah
	jqkAHc57a7TuEstSLxuK+ja/1utL+Sqfs6w8nwaSPSKfl1mqJGUHh+t99Bt2OidB
	h1ho5Pt+qHM4mj9In4tV6/Hkkij1ZtCiV+/W726ith1sB6HHaB+nXatAM2DBHdjt
	yWk1Ij/W6/FS3/sGlnf38zu3T2GbYgq+3ZAImW93+TA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khPXyXhOnn1z7AWGxNvxUtEaO9yP6en6iFbpOYrF78GKnoHgAOlh0SsQ+Lr1apODC1xnOyjHtcrrzki5XWSyjTZ/PyMceNzhT9/LOhCsKdEZZpoAo4uwmvmlPp3jtYR7HwFGDcri1u0mvn7Nqye4c7C/KeOm8V5IMZHShYV1dhl1vAlNNrIlvCQbfBAz3gDhwJgLWQJUt/DF2yT24/Mq7zI2EMsezbw/xtwBOukL6t+qF/TXC/3PE6zyG8Bsu3jgE5xBTcnreyjlFCYpvGLUiGQ5TjpNTTNm0OS4fem0vdv1DtF8YhSmZp8rEtkDA/k369vf4KvdZL8I/PsRi+KVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0lLwRxvp+QKDqXzINjwoO63vCmIhXnCorPVb2fF58I=;
 b=N+J8fhA1vDTkoeoCOpUNE5cnc2cdhQ4EvOG11u7qYP2txqHZPfLb+RKyMTmMCOpSZOYBLGEiQRFVrPF7zEEMfE4EtPHRRpjEvHTlRRovgjRxtWl60gL8I/RIzLkvkjVO9nZPXygQpulYxr3NGlCFLO+pNMVU7RysOsOqBYX4NYZUvq19K3nSisD4NgnZK7NDf6mPMfGfX3wptk836i6y7nBFmn8WH1Yz4xcdl9eME4wJR4quj+ZgYwFA059quVsbCBnQzU0Dfx2xbUocW0IevFQiib7YTbDx1Lh4A+F5P7EPYRZPm0R2L67scdSre1P/Jt95jXSNX0npxBYiBNIT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0lLwRxvp+QKDqXzINjwoO63vCmIhXnCorPVb2fF58I=;
 b=V2PfT2OWuWKUmQXJYmgXvGqd+7BtyRaKVIUXv1TUjaGRXggnFbT4glm8FHD4LggmBuFD/1Kw88nN2WCVrEIcvwC/TJ1IY1oGnXdjEOr2S4oUEXxHVbY/FhufP3Z+IZabA+0QejFDktwLNJu0ikGq0QfyPpYyn1FrtxLZtdDT2DY=
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
	 bh=a0lLwRxvp+QKDqXzINjwoO63vCmIhXnCorPVb2fF58I=; b=kljm7sCU1Bhz
	TX/p/U/yaC8RYgYr5gD8PNQ9iloCr06SFFG0WCL2urTtaiPP0/cUBtiC9edQn9aK
	Sb8Z1V7zyMp7MWQi5st4/VzT2VKdLcrJWULMzk0Vmcb0dJage8mwuGIK0SUvJihg
	Mpp+b8oOU1IuCxQYXKfULlwjpXIKdzZ3aL3yZqkLz/OijmGuaSsDEt2hO/U1/M4E
	pV/hPM4zATTYnq8UKb4clgCInC3sQvA2XI7ew4mnPLWE97hIfNfwriLxCZuZYkJo
	LEKLSkGfPKLpFK/Ra6t8fgtMyeVDSqDBbFqAZ4/jbq1UbIe749H+0kxYwueErVvI
	SwAVlmqLCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=a0lLwRxvp+QKDqXzINjw
	oO63vCmIhXnCorPVb2fF58I=; b=fM8d2cwMCohQiHpdtn4RgM9EAyZMgzOHRZhA
	853NMJVhNQb8bE9KFIrA8v5UYZbBhWtKE15F+n9qFtZa5djAHO0glMr1DjKwdKug
	J86V4/X5XGsc8U+W5jKZxjsErnsmtigPP5+Jvb1XxqBBa6cc8pNdukhedW0yu8LL
	Ph038jKoi36Tpt5uqItOKhQjpjgzN3AQw/gkh0/SrqYlKQgEJLV6dOEfjnxsylXN
	V5qO50mBu/PFLNJ8zGDaXtJeW3vnca08efesqiH4q/MYr0Ri9DnzDOcElisUc3v2
	A+biLqbsmMW2UjmnwtIe/oRoYCk8U28v4H/m8DJkP4ExpSOnZg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OreGwohgKZ2SgOreHwmLnV
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Sun, 17 May 2026 23:40:20 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] xen/common: llc-coloring: reject empty color tokens
Message-ID: <agq0VHVZDCKmMe0u@kraken>
References: <cover.1778925998.git.mykola_kvach@epam.com>
 <0820f91dd0499e5f66f8961b5e27fe0a0ff9be35.1778925998.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0820f91dd0499e5f66f8961b5e27fe0a0ff9be35.1778925998.git.mykola_kvach@epam.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180061
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|DS1PR16MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: d03b92d3-2251-4915-7ba7-08deb4a85748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2F19UQU4FfUgsBvyxlLm6nfmNHsUHVKdg9Q7WCpGDpQgtMswZlW2fLBBZq2fa54m0/a9ln3G4yftvWf5Yats3QCsKHqK4CqtHKt2rszmbYoVcKz0XYu9FyJgcES712XvcsYXClAZnrseY5aDnJa86KUQZuQnCbfaBkh4TyNKF8Pk30QMJTEHldxtQznfWB1vLn9S7QEnsIDqXIQuC+EQo0eftZKabHCYvoUwjYomDwmXkeR8JTjxPW8b38yIazaPgzTNko+j3/lGPOFXG6NTEqKLJI0e7abdagrN4bSPYbq7rPTAw7ergsWeCNLRjcKXozrpnw2iSBUkdGm1u818iaJiZV8R3lo0mSamZ9YE6VSTYgutRseRLvM4UVjp1GI8tcLtlcO6c9oTodD/j9EixJSBU378nSLIf2mkEjw0ax5pg6A14uU211VsydFDONlbgbVN+Ao6Y1zWDorcfb655ceNN+yqbVVWthixAqf8u6seuBfuBBT5UDnc5RPa7Xgq9T7pLIQHoovgkFFF0jQrdrnvusI+G82XyDghIcu7gDc2PE/IomyiVoiKmrTy7HFf5o97cbPeEHx5yXeMCUIH51VEoDO2X5vIvpvH1t0x0CBNQaCRTci1hPmnexVhSZEInNOumQ5qvyKppVTYPNVQk7SJVDKzpsC4+q/jf0R+x2evsz2qC2C5VbHH7XfvefvwJtTW7MaQ+KfgVxYXxJ2S/3ShzQybojTDqvNfkacEP9k=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BM3bBuxKOIz3f2MkcOgXImktPGkQO7XLNY3NB/10CJjX0svypj2E9EOVBa9rT2WDvJmqtf/fuWROZvZaeCpgP35/gn58k/srA7XMza48NBiyHZ2+2na8Uh7WoehFkfvDqkoYPBx3ceCwnSb+F0SVsK5prgLudUiDYxvPNE1zb1XmF/sqDZGLk2fT9gk3eNWpSbnb/Cpswwv9UcZykbuVn/5DsfxJG+ilmY4czgGH2rAyAT2JmF4GhuSuGjCxNcE38mnTSL2JePSCYQpd0W/X1+Rxvipyj0I9bXk8btgEoGvN3ErQIrMJMgcV3lVKBh3Iq364+WHUBimlz/394+cSGavAaNTUSFK2OiD6DiEZOh/RkNQ3Y+gPHHXjS/wBM6ZvFI8uP5q03dGvjr2kNh7zHQoumz3tHouuw8vtSwwXj8G5WTI1BHel3SOZMVnSEEIJ
X-Exchange-RoutingPolicyChecked:
	qjNsCS1twHn1BVoXngWNhjx24pAqZYvt3NWsrZHNLKWv6jXOefune/BJcFvI9D1ozwat5SridAb21jlHXgeTy09px4F4lAY/8NqlGGN8ewFENiX6d9Ego7vb75oo+GoUiDgqE/WDezqc3V0R0Ng6UPgHaaXf3UZ2TSpws01GPZ8DhXomwga+0kYx+H09MaBQ8KvZWfD3M/syA4Z0/AEWGXygPXzNpTWCJSar61NKOh9X6JiwxaMDTgR55zgVZE/GppEISEFSv+YMr4+tvWXQOMQwFZkA6WCCMBf9/YqkLvdnl7Ji4JipLdhfQ2W7Slaf5HCqfgHNHI0uOSxPPxpxbg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MFecnSWKNDJiWT+JXgtOxJ1qiODD5teoEgQMUnLorzHTGtXiUsQ8lMRgBZIFHbgJDIrJ1yGeGYkn04mMqhcR02/7t2pHkPdbF/hzhJ0C9qoQ7Zvnj4fi18s1O+ACcq0xcrKE47HxMf8hsMn2ofl0ss97RoI8D8+JhFCBNECLaXtrtPhbUwacL0PryigtouaGn2il25WKGgcOWRrQmqoK629wshc936vPBJd6aSuKYBrWImJ3bb/Ss59dAOQBoJsppv0b4suKK0cr2DkTnAv24SeiVdRN+zb7J4Of+T21iTiq8TvIR9cJkZv0+HSbLvkcQjdM/7I+LvgT5hkv5Wf1Z+LDMkici+PasofELv4N5xeN1pGuyvxboleEfAsHrYL5qyYSiKNjETNSZ4ha6nZzTS4Q0Q5x79urupiaF2h3unhKqgwV3XIYvFNwF8W5ZIi6DBT04xDOI6Cx+QtDBuOKIJcjOyJeZWcIsGvkTzf7ZN3A89LnbdElihubW3Voxa83K+4bAY3/+HRrGSplXGO+tRRBBuQ/JsezGnR/Nyn5myB0Hk4Lsqu3x1SE8B1CMjdAxctx1HskrVwBBe2bgFdYG3ekuZP8O/G2lg4yRVQzowsW6IfoiEDiHDHS5hqhoKF8l3UycbFJ4fxUsvtUnzx+Cw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:40:24.2053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03b92d3-2251-4915-7ba7-08deb4a85748
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR16MB6639
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2MiBTYWx0ZWRfX5Ipukol86c/Q
 GA1/uRWzdXSWInUcc8idM3UVYV01Slvcy88bj3Wo880Y6XOd4FYgl+7d9hzRxr6/OHmYUzinBBx
 uiNUnUKX9pf5w7PkvPXVIl1ZwpDfS4C70P8bjyZoSFrsV4g3IS8e8rJraTrxrVsgJL6hMlZKULN
 /8CdGVmpMnewUZEHinyI4t5DdYMhIYGuJmZM2TCbOjvzsVRsJe6WMuubSH4RP/cFhB+G3tcjHkB
 2DCvkUy28YrUwzXdBPEIpzP4ZtY2ghHeuUQxzvLrHPDOqXYkMyeiNRtlX5ifwZ19NWcBOqxAxIr
 +rMTFPL27Bp8Re66bjbCophM272nhWs8sYtVm/RqVux7O90LI7KKcE8heU08W9PVY3yIqj4QZ04
 nS2THoDGkGEpsZ1w72O2OXwd5hwB/a/eywHi7cnhAMNZBaEfT46T9kELFk5Ee5lB+DvDMkgG8Nq
 /NEZTl4Z93UjvEVAixA==
X-Authority-Analysis: v=2.4 cv=YZiNIQRf c=1 sm=1 tr=0 ts=6a0ab45c cx=c_pps
 a=yvofFnGdSAaTKL5iNkS0vw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22
 a=DBfv99YmAAAA:8 a=Vsz3hZKAmdhzJLVIzlgA:9 a=CjuIK1q_8ugA:10
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: CGVNL405WHE-4oO7xzcLaXSykVN3k-KK
X-Proofpoint-GUID: CGVNL405WHE-4oO7xzcLaXSykVN3k-KK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180062
X-purgate-ID: tlsNG-720697/1779086430-A917D161-988F2C17/0/0
X-purgate-type: clean
X-purgate-size: 2177
X-Rspamd-Queue-Id: A48FC566D41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,saarlouis.ford.com:dkim]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 06:03:12PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> parse_color_config() currently accepts delimiters where a color value
> is expected because simple_strtoul() returns zero without advancing the
> input pointer. This makes strings such as ",2-6", "-10,19-20" or
> "1,,2" look as if an empty value was color 0.
> 
> Also add the missing newline to the DT color parsing error message.
> 
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/common/llc-coloring.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index 2606cb0977..5d00d4b40e 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -64,14 +64,21 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
>  
>      while ( *s != '\0' )
>      {
> +        const char *endp;
>          unsigned int color, start, end;
>  
> -        start = simple_strtoul(s, &s, 0);
> +        start = simple_strtoul(s, &endp, 0);
> +        if ( endp == s )
> +            goto fail;
> +        s = endp;
>  
>          if ( *s == '-' )    /* Range */
>          {
>              s++;
> -            end = simple_strtoul(s, &s, 0);
> +            end = simple_strtoul(s, &endp, 0);
> +            if ( endp == s )
> +                goto fail;
> +            s = endp;
>          }
>          else                /* Single value */
>              end = start;
> @@ -334,7 +341,7 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
>      err = parse_color_config(str, colors, max_nr_colors, &num_colors);
>      if ( err )
>      {
> -        printk(XENLOG_ERR "Error parsing LLC color configuration");
> +        printk(XENLOG_ERR "Error parsing LLC color configuration\n");

While here, add domain ID to the printout similarly to
`if ( !check_colors(..) )` processing below?

>          xfree(colors);
>          return err;
>      }
> -- 
> 2.43.0
> 
> 

