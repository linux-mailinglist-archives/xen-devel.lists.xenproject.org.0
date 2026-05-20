Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEUIElEpDWo8twUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:24:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67B587326
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 05:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313517.1583631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXXA-0006Kl-OZ; Wed, 20 May 2026 03:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313517.1583631; Wed, 20 May 2026 03:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPXXA-0006IM-L1; Wed, 20 May 2026 03:23:48 +0000
Received: by outflank-mailman (input) for mailman id 1313517;
 Wed, 20 May 2026 03:23:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wPXX9-0006IE-As
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 03:23:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPXX8-00EVvw-Mz
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 05:23:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d28f5-2eae-0a2a0a5409dd-0a2a4508d2b6-46
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:23:46 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0d2940-63b5-0a2a45080019-94a39217efd8-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:23:46 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K0J8YI3348981
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:23:44 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012027.outbound.protection.outlook.com
 [40.93.195.27])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4e92a8gvq2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 03:23:44 +0000 (GMT)
Received: from PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::12)
 by LV3PR16MB6191.namprd16.prod.outlook.com (2603:10b6:408:1dc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 03:23:40 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::4f) by PH8P221CA0057.outlook.office365.com
 (2603:10b6:510:349::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 03:23:40 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 03:23:39 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JN1gJw3135622
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:23:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e7714bjnw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:23:39 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id PXWywVYm29jbEPXWzwc8rD; Wed, 20 May 2026 03:23:37 +0000
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
	:references:subject:to; s=ppford; bh=Xq+M3ryk3wNsaVH96drKxv3favb
	RmynO6kFYdWd8z+0=; b=gbWm9juXLoTc6/GsAdiVmInQJjzmykLg+7vg20IkeGz
	VKzJbA9iZxfKfadvfAnELQvSpMYFsmx8XeoLCegAPU8wvREptQLe3OzeLooHM3S9
	ODWwmVa4QM65fDUQvE8f1qM73Rn3RrFm2j4m2/nCLj/F8yzKHpgHXMQ7mCtWasv1
	PYvbvS9T763XafDFm6tQAivagxgs/dWEnxpVNs6+N1BuTbKi3MX5X0klvS3dREiP
	nXSCcgWWQMQzg4ykS/1z2l5tsqOfewNpzDnZn2yRfS78ihKdlTupaskN9EsdRorF
	fGFVOMEK5tYfSon1vFPvff7R7VmruS9e1w/LQ2YaaAg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWMJVSkSbpZL5i7aRRae2Nk7i+uktZkoc2mwDTSbWDZJV67bte3x9lSfQw4UE3utr7YOnt9BDzPfnKUVPzlruwA5OaeI2JciOjsCfzxFHjG8oXHBB93adhoB6GMq5IxtH5WPdf+BhT631O05bnKtLJJIQzmV1tRyCs1QnrO37nYdUrTd8vqU6BA1zxKeEW/jrTFU0k06FPbHHJ6D1mKcGq2Lz64Gcwc3fkNbuepaSB27F3NGxl9OmwXJ16wMe3sp8Gp3fZnPP9zmPzYMkcr9dMQ+kC4TVB+VhDc8rdEJWi7JpqimP95UFkasmE2p4SIYQrbVSTo8LYbZk9c5eZe+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xq+M3ryk3wNsaVH96drKxv3favbRmynO6kFYdWd8z+0=;
 b=pYj8/u9js9btPWc2nBYOYMthpUMZmvffWPLi/ReP78oNlXR5sKKox7MR+HB73rsCzvYZjfq/a0ITBhaajBykZE8We2WfJOR+QpqEmY7XRHZUtlILOdKOjxED3yUbFuu97QnRtgHfOLF8GPRc2U/9yE+ApzaUcWpm14cfF+3a75oxLu2m7jyfTPo43h/X57cQOnGCw/ostTO8qb40dVo9hxKG1Kc5kVvyxPiQNc+oBhjG6arASKnjbiaCN6OcCB1+p86Lx6hNxXu+XM/jY7aZj2u21LPi9q6ImIQZq+SgYff8U10vLQ2MvfxMh3zArgEPKqL1c638m5ZutH2Q6hjOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq+M3ryk3wNsaVH96drKxv3favbRmynO6kFYdWd8z+0=;
 b=T2n2Wk/lhUhJXsHJ+C0wGWUiFb/Aj7lEuiAQX7Oh1X1Ef2FBYdxbtCEQCwwCsk3S8tIcIdop9E3QUGGGaNJKpjL0l1g713X3FdpEng3dHIlUoHiM3USxWz5/G5AFjGjvct4gCL+x5/C+/LXKNic92sPumsEbyVnvECITbcjeHrc=
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
	 bh=Xq+M3ryk3wNsaVH96drKxv3favbRmynO6kFYdWd8z+0=; b=HqgXVaq87iGh
	0wWYxKCVC59udWVzSUs3I8JJiDamuOi12CXiaeSlwnfCv5TwE4BpFcalE0yGgjV8
	Cz5JGmnNwvI0u0LkmXVoDijWqvBVRWRakr0Xpr58cJCGz8rf/Uw+xDx075Jq+s6u
	yo8gbW3p6il5F5KwezTN+rX8RNwjYar7RpRdyG7jMFxa0wBqCSGh34g7Fud/lePh
	joEdhpOSLQAYJ1NlPAqUaDkdyV7EYKhhwLjsL9iZmMJDojH4f+hQOULPy3+PyX6z
	XcCmM1TmiIMZVD7DoM/GoBMo43J12roBqk82Sq9KVJSrTCF/uvKKELN3AicKYUWf
	40ZTw7L71w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=Xq+M3ryk3wNsaVH96drK
	xv3favbRmynO6kFYdWd8z+0=; b=GscAwId+XDAgh2YfJJllLm0ISMmqNVX1DhVO
	5vVoU4WHO1ONd+lYAaq3LMCJ/HNPVPtxht+ZfTw1SX9D78+2v81K7uP/9RfxPvzq
	EGzbyntJdt8eO6tT6HtRwXLgWsMuRIdY0qszIwjb+YMntbagARPfN3fM6+zLoiWs
	Umn0WvsaJ8HqpE7WSENElm7lcyYS/k5Qy8SkgNUSlgbeUHT8cWJX8Pty8hsdvyKP
	Cp5fqxWD8homPKVjPkGIX/zOikib4s64w4F+r1O7g9NjDiTGgXSCaW22AwV2hw4X
	DxpDZpbg2450f397UvoLCaniPEwOsjwPobBJXqp2nmEEOrclrg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PXWywVYm29jbEPXWzwc8rD
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Tue, 19 May 2026 20:23:36 -0700
To: dmukhin@ford.com
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/5] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
Message-ID: <ag0pOByehq3/KGkd@kraken>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
 <ag0jtx6yNpPI3ZTD@kraken>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag0jtx6yNpPI3ZTD@kraken>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200030
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|LV3PR16MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d3feb6-f9b2-47a5-fe24-08deb61f301a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|11063799006|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	m0isuX26HYuv1NxqTtxPoV5pQnQdLwb05Y+hV3IaIkhT+CtCxBEzyizlz+x2Zcq6+I/7GMKuMASKTO4fFW5fSfC37K/hDJ71bRwQuAaF+JcKSCUgZXGR6Cmla8uO2CWA0tJwXgtv/VFyAYvguUIiG9qjqzSKdg+DNodrvbabSz48XVYhRbySq3g702852L3CQIASte2qENJspvE4c5VzZkjEPyLizjpX5WhKh9tTT3de/a1fFJhfKNBldrlbvUpMVLy4YIQSPERcvQGpo0d6Pf+FyaZwmLwZmqbBWZnXU1Gv9194Sj7/JxEMIh3BvaTCU9X8/O8H8mq9kX5t+/p70TAPXn8L4PyYSWTIWyAwYLKNIPNVpFKx9MQs+RION35MoBIWoqWFD7ylpiKTMuExj5lk/+UJT+bAOu6nhmdL7Pg3mcPUxEt8AEDXfFaDDim5DQW9/DM+ppzk6o3ATTm+NIBBkXdYcC2lBhnw8nhMyO6Fd4Ur7+0e6iJKe5UXhbX4DsprCDEIIL7gl1k1f/FnC16NzZZqQVptLwZA3DNB3xZcOGsjwRpKKJcjyLeeIirBPcM8tq+Q67sqS90efY8N3WNSkpME03yyRTJiPb7gx6WeDVF/+RgoD12PqbGH/5+Di1LJ4MYNXXtw3knIpnU1/HK5RxW3AVu/SgMPoakARiySkavFV9Slwei/Ib7QmltN
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(11063799006)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Y25z5SuL48mx00wWkGuPJI+HOvHPwngddxXo3fgLNntEeuVQrFtQJ9OybUgO0CvxHkVd8H2BN7Mp3JhgbqVM3jADL1cta1ixQASv+vCWqUXESJQXTUUs/IjvGLyEjxcANM3aevPXL1Tn2ZoXVnncyOiON3fiG/ca17mbsag0ItIsD/KdxvjG+ym40yhvUJa2bGCk8A8SceI3TnMmpX+SjLliRLqM+KVYJdfeMNkHrrhapqh0wWQhR3sQdz/cwMjfPMYgB68NWOFuFoUdicQ4q21kYz0N0+sgcFZcRD4DRIimzhh8Mj9FG/lxDmkCewmgD6GrcNOC6CX3JBc5bucsFG1LimBRFjv1YEPIwS5uT5HPzZlYS6h5P53QwlZSSuEuNpSjSw2etOLwX/e/UoSBQCu0J0LK+rhpj/+l/ppvPAkHG7Desz+8uK3QcmazKXk
X-Exchange-RoutingPolicyChecked:
	VtO0CqDX/Z3Zx5AOapEMgUufj61jNSp9WX3fdgS6MkYc232zVKxwxSzhLfZR1O35vJmm7cW7FBVVZCc1pxDGF0HnyMuGaFUbPIzjrtmuFYdJ5OKr9A9YBhRaguMF6kfSIzA/c104JSXNgzjgQMEtQrJ/pyf3WNd8x/XLOhZc0Nb5pP5WbGOZkPCB/v+EIHG0IDlVmsRIjFoah8XMDThnKXr1AqhuvlD+UC/aZjETCJhsDlZrdFyN0mTbGC51n+Rr+4YMCojNldvMR3gIJWrhDaredhPkEf1xtK6I6qvOrf2nhoyLPRgvPbs3LyTPO3uC38/A0D+tjo3DbfP2bUPqdA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	88e95GiEGlZ9S9u8ZNkhFjKECROPfK9c/BId2/Fz19wI+xcrjhSkHDg4eTccm3Ux7J/BBYS9T12pzO/tDG9CeWqPj9rlsNpy00NYU6TtdQZL9uBor34e8sZMc4EokBzYB7wAhQQbAKxQDIP1+g4EIcHIzd2fDQgJ8gwfj6OX6AfNWYkglz2ev3aKccTBxuG0L5xRgih4VyQz/FuXUvmybT8hhB3RJj2q8AGRjb5FC7hIdx5JmILXBMjqJcyJVlVC5eQPdlfQSA1mVUFGpVzbbFqQ5J1sYIPRfL+T6MNQknDmXJT6uVXj0ilVoWsRuCY9/bz70M4dC7yhFaBWL3X3B7/vh+Ssg+7fCdfb6mcvbJA42kvNViEUKaBE0+OLiD7KJmEeDKQp9k7n47JVPqL3tQXMq1jEyITL6uA7o/u1S6DQSgtach6cJo/RzCJ8qvYsMvcyubqQ4j7F4ZxltoOwi+qzSJtWcCm4k0vbBqnRV40hGljTOBMHtnJC0uK3epFYKkskaazaOXbJEeoTctHfvQIpeWA04WnnjF1YDzLb87QH7fngd1eIOE9hnkeuRv9Bls+/nEz6kNE7JldKn259+lR3NZ1IBorpL+Rfne8Rmlmr8JmSxBjkXjiMUvF7GbPEPRfXKt5+OPQjrpC1Uq7XGw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:23:39.8477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d3feb6-f9b2-47a5-fe24-08deb61f301a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6191
X-Proofpoint-GUID: yxWyLITB7-ChgOBqRKK4DgkPReGpVclh
X-Authority-Analysis: v=2.4 cv=QrxuG1yd c=1 sm=1 tr=0 ts=6a0d2940 cx=c_pps
 a=0pMqp0B7/3h4ah4p3fuJNw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=-RI0ju8yAAAA:8 a=cbNQJ9GKAAAA:8 a=hxWUZ_UOAAAA:8 a=3m2Hbao71CtIYFPn_vUA:9
 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22 a=UsJdYLK5l2RqpxBViBoK:22
 a=oJOWNcIRgaUypOnx_dbc:22
X-Proofpoint-ORIG-GUID: yxWyLITB7-ChgOBqRKK4DgkPReGpVclh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzMCBTYWx0ZWRfX22efDvNYjqFo
 2M1BJoAyEk3R0jIqlzqyZ1BFUHC8Fuz5t1bC6+62UiMY5ho4yfMfovq+OBt3E+iqRG2Ca0qWoi3
 HuVr65nJJNxXyhA5QFd5kURQkti2en1dLd3fiO/Uhk4kvDq+c3dChFtiSlbwgfqlykvgjUZ254W
 jblHnUz6DCoP2tym2mnV0iGGvAieCXMFnN9o+45akbtcHsIU6hyvMBMKFXgpA3PXrSPQyf8eSqp
 EOG7mYs3o9KF8hzaGSdjJmjgcCIoeBqQjKttrheuKOzh18koIxtd7ao9wDP8M4Yize9xyTmfKP+
 L+8UCPncWdUtS+bsdz/vuF3O42o/40gaO993uklK3ErD3u96iuHmJEMKcejEt74yJlT1RQqcym5
 lMFEwO7wYUcTZhjE26/oO3HgBX92o/vYuL3pspgqbV8DPXuzuSYWFS8w/WdC3COCZlG8OnjCYlA
 wnQvy9T5jacxt65J0kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200030
X-purgate-ID: tlsNG-c1860d/1779247426-BED73DB1-58E471ED/0/0
X-purgate-type: clean
X-purgate-size: 6789
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,azureford.onmicrosoft.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:url,vates.tech:email,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 8C67B587326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 08:00:07PM -0700, dmukhin@ford.com wrote:
> On Mon, May 18, 2026 at 05:21:26PM +0200, Teddy Astie wrote:
> > Use a dedicated pci_sbdf_t struct that we update instead of recreating
> > one each time we need it.
> > 
> > Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> > ---
> >  xen/drivers/passthrough/vtd/dmar.c | 42 ++++++++++++------------------
> >  1 file changed, 16 insertions(+), 26 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> > index 2a756831a6..c36f4bbd7b 100644
> > --- a/xen/drivers/passthrough/vtd/dmar.c
> > +++ b/xen/drivers/passthrough/vtd/dmar.c
> > @@ -310,7 +310,7 @@ static int __init acpi_parse_dev_scope(
> >  {
> >      struct acpi_ioapic_unit *acpi_ioapic_unit;
> >      const struct acpi_dmar_device_scope *acpi_scope;
> > -    u16 bus, sub_bus, sec_bus;
> > +    u16 sub_bus, sec_bus;
> >      const struct acpi_dmar_pci_path *path;
> >      struct acpi_drhd_unit *drhd = type == DMAR_TYPE ?
> >          container_of(scope, struct acpi_drhd_unit, scope) : NULL;
> > @@ -332,29 +332,26 @@ static int __init acpi_parse_dev_scope(
> >  
> >      while ( start < end )
> >      {
> > +        pci_sbdf_t dev_sbdf;
> >          acpi_scope = start;
> >          path = (const void *)(acpi_scope + 1);
> >          depth = (acpi_scope->length - sizeof(*acpi_scope)) / sizeof(*path);
> > -        bus = acpi_scope->bus;
> > +        dev_sbdf = PCI_SBDF(seg, acpi_scope->bus, path->dev, path->fn);
> 
> `dev_sbdf` calculation depends on `path` which is updated in `while()` loop
> below.
> 
> >  
> >          while ( --depth > 0 )
> >          {
> > -            bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> > -                                 PCI_SECONDARY_BUS);
> > +            dev_sbdf.bus = pci_conf_read8(dev_sbdf, PCI_SECONDARY_BUS);
> >              path++;
> >          }
> >  
> >          switch ( acpi_scope->entry_type )
> >          {
> >          case ACPI_DMAR_SCOPE_TYPE_BRIDGE:
> > -            sec_bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> > -                                     PCI_SECONDARY_BUS);
> > -            sub_bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> > -                                     PCI_SUBORDINATE_BUS);
> > +            sec_bus = pci_conf_read8(dev_sbdf, PCI_SECONDARY_BUS);
> > +            sub_bus = pci_conf_read8(dev_sbdf, PCI_SUBORDINATE_BUS);
> >              if ( iommu_verbose )
> >                  printk(VTDPREFIX " bridge: %pp start=%x sec=%x sub=%x\n",
> > -                       &PCI_SBDF(seg, bus, path->dev, path->fn),
> > -                       acpi_scope->bus, sec_bus, sub_bus);
> > +                       &dev_sbdf, acpi_scope->bus, sec_bus, sub_bus);
> >  
> >              dmar_scope_add_buses(scope, sec_bus, sub_bus);
> >              gfx_only = false;
> > @@ -362,8 +359,7 @@ static int __init acpi_parse_dev_scope(
> >  
> >          case ACPI_DMAR_SCOPE_TYPE_HPET:
> >              if ( iommu_verbose )
> > -                printk(VTDPREFIX " MSI HPET: %pp\n",
> > -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> > +                printk(VTDPREFIX " MSI HPET: %pp\n", &dev_sbdf);
> >  
> >              if ( drhd )
> >              {
> > @@ -374,9 +370,7 @@ static int __init acpi_parse_dev_scope(
> >                  if ( !acpi_hpet_unit )
> >                      goto out;
> >                  acpi_hpet_unit->id = acpi_scope->enumeration_id;
> > -                acpi_hpet_unit->bus = bus;
> > -                acpi_hpet_unit->dev = path->dev;
> > -                acpi_hpet_unit->func = path->fn;
> > +                acpi_hpet_unit->bdf = dev_sbdf.bdf;
> >                  list_add(&acpi_hpet_unit->list, &drhd->hpet_list);
> >  
> >                  gfx_only = false;
> > @@ -386,16 +380,15 @@ static int __init acpi_parse_dev_scope(
> >  
> >          case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
> >              if ( iommu_verbose )
> > -                printk(VTDPREFIX " endpoint: %pp\n",
> > -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> > +                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
> >  
> > -            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
> > +            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )
> 
> Looks like `pci_device_detect()` also needs some refactoring...
> (Probably out of scope for this series, though)

Oh, cool, that is exactly patch 3/5

> 
> >              {
> > -                if ( pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
> > +                if ( pci_conf_read8(dev_sbdf,
> >                                      PCI_CLASS_DEVICE + 1) != 0x03
> >                                      /* PCI_BASE_CLASS_DISPLAY */ )
> >                      gfx_only = false;
> > -                else if ( !seg && !bus && path->dev == 2 && !path->fn )
> > +                else if ( !seg && !dev_sbdf.bus && path->dev == 2 && !path->fn )
> >                      igd_drhd_address = drhd->address;
> >              }
> >  
> > @@ -403,8 +396,7 @@ static int __init acpi_parse_dev_scope(
> >  
> >          case ACPI_DMAR_SCOPE_TYPE_IOAPIC:
> >              if ( iommu_verbose )
> > -                printk(VTDPREFIX " IOAPIC: %pp\n",
> > -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
> > +                printk(VTDPREFIX " IOAPIC: %pp\n", &dev_sbdf);
> >  
> >              if ( drhd )
> >              {
> > @@ -413,9 +405,7 @@ static int __init acpi_parse_dev_scope(
> >                  if ( !acpi_ioapic_unit )
> >                      goto out;
> >                  acpi_ioapic_unit->apic_id = acpi_scope->enumeration_id;
> > -                acpi_ioapic_unit->ioapic.bdf.bus = bus;
> > -                acpi_ioapic_unit->ioapic.bdf.dev = path->dev;
> > -                acpi_ioapic_unit->ioapic.bdf.func = path->fn;
> > +                acpi_ioapic_unit->ioapic.info = dev_sbdf.bdf;
> >                  list_add(&acpi_ioapic_unit->list, &drhd->ioapic_list);
> >  
> >                  gfx_only = false;
> > @@ -431,7 +421,7 @@ static int __init acpi_parse_dev_scope(
> >              gfx_only = false;
> >              continue;
> >          }
> > -        scope->devices[didx++] = PCI_BDF(bus, path->dev, path->fn);
> > +        scope->devices[didx++] = dev_sbdf.bdf;
> >          start += acpi_scope->length;
> >      }
> >  
> > -- 
> > 2.52.0
> > 
> > 
> > 
> > --
> > Teddy Astie | Vates XCP-ng Developer
> > 
> > XCP-ng & Xen Orchestra - Vates solutions
> > 
> > web: https://vates.tech
> 

