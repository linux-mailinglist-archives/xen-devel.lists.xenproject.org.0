Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRYXB4eDIGo/4gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:41:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D363AEF7
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:41:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=QylM0xdq;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=d18BcK45;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=ULB3yy3H;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=OzdT5XEJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327100.1592299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTF-0000LB-F2; Wed, 03 Jun 2026 19:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327100.1592299; Wed, 03 Jun 2026 19:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUrTF-0000IY-CH; Wed, 03 Jun 2026 19:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1327100;
 Wed, 03 Jun 2026 19:41:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUrTD-0000IK-QP
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUrTC-0050SH-OF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:41:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a20834b-2eae-0a2a0a5409dd-0a2a45078a60-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:42 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a208374-229c-0a2a45070019-94a3921779da-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:41:42 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653I6AaP780209
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 19:41:40 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ejs621bgr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 19:41:40 +0000 (GMT)
Received: from BN9PR03CA0980.namprd03.prod.outlook.com (2603:10b6:408:109::25)
 by LV8PR16MB6008.namprd16.prod.outlook.com (2603:10b6:408:1f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:41:36 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::35) by BN9PR03CA0980.outlook.office365.com
 (2603:10b6:408:109::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.18 via Frontend Transport; Wed, 3
 Jun 2026 19:41:36 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 19:41:36 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 653HT3Io035301
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 15:41:36 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eghss7bg0-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:41:35 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id UrT3wpEOnYPuRUrT4w1GhJ; Wed, 03 Jun 2026 19:41:35 +0000
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
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=oXK4YLeYPlx8RqSQHW/nFu+SC
	L/43fQ4XpPfyii78Bw=; b=QylM0xdqnRo1wTna5oaE9AE6zx+5a6QQDqjQJVlpK
	v6AkkctBDgGrdJs/FzKEl230a91cMN7KffzD2GrCuamFr7EfpZDLLSFmjdrFLphl
	BlN5YUt+W+UKhrBWIYYjw4xL4WyCvVXrDIkohYtsPn3V2r/xE1wjvKk1LfunZk0O
	afC+BOeeglYKAfUv3LrpybzaqhjEwucM2XXG9Axyg3h2r1qzlUTQqYSK59T+X3Eu
	zFJWNvPtb1F3gu19jToSACqktls3XKfwCzGnNvFkRYmj3FMyaZfr5VBDcAuOy+kG
	Oy0YxwtwlB0rgjOyIcVXzyUJEvnxRyq8b+3bCwF4AzhVQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxY+4R7SNFmzzzoFvcLZ16fSrjw3Q94CxV3XWcEXt/3NwIB3/66IEmHhhCsiCdMgLD6gUx9/YGAjYjPPy9shzTdKBJNsPWKYRaMO+K1eGA5Oug0wbyt5UQ00nMqTFciIt6efmRpe9Hof0yWQTHOng74ZN3dJ3zCtpY4dZtmcVhqnIgV6kSxoKM6FKn36lhY87Bc2RtKYgBmsERduC5mn4LD1TsOSVquWSL3vv/5MrIv6+Op7ZOGe19HnK3bjpQATZbWl64oAgTq7lcGQcG//jEGe2jpTt75XsVcWEzxyGdYvlKyXcTW9/j8Dcsy3oYKSAACnUuQi40So9tAEXGsvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXK4YLeYPlx8RqSQHW/nFu+SCL/43fQ4XpPfyii78Bw=;
 b=mhmo6OJ26CrMpOyJ4Xafnx2d9SfzxFwPt+RWMmyt/Nta2IMqAQ347gHNagxxAGoGuzGUM1QlocwQQVkvQ3DrRT8em4nsJi51TI4axXmwT9xuaXmtIhy3Wz+NCr7aTw7vJw2/jxfKP+ntT9TBmHTZdypz0ImMbd40u8ekmzSRVI4EANFAccMhD3nk1lW7pHA8amsoplKpDC568ZJDMzoTbFhK/QdKUL/dJKNP5naLG2iyO5+e3jrrQ7xRnz6yBpsp27xN0Ve+glISk+Nesm1OnSMFJc4l6BDwzv+Xe81KdP8aS4Qnjxl9810QOvOtQrr88xvqbZaixYUnY0oywcUS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXK4YLeYPlx8RqSQHW/nFu+SCL/43fQ4XpPfyii78Bw=;
 b=d18BcK45T8OKk7PztdwvMCG2YvpWG8JSVV1VxAl6V3zbWG79y0dPsK5d+KgCn9NcRF7rg3zOsFoJKzTnKEbTWBo+NwnJ36W31AdJ1qLLX8yMXQIMwFEukL2d3ruDDsbkdaZt8FtIntl5Y7gtDTxinNRJrofL673NEtscsBbA8X8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=oXK4YLe
	YPlx8RqSQHW/nFu+SCL/43fQ4XpPfyii78Bw=; b=ULB3yy3HeaRTkd8lb/tZTqt
	gVgS45Qy7/ptPAyDS2n1I3IJCSOxFAtYT4pk567YtnYLAeGdvBdKf2x4lUbGyYvq
	KL+sdDIJ03iqQkwGTgYo+7V1PUpPMkoWA7lCZJzLisJ+AI5v6jKZyRNwsW+dN8rq
	AS8UTr7NvyZR4SlgXa7bug4Z7RKjey4n0qHdGzlUIew5SGLAlE7nVu+jkFCelm+S
	iY4aim3kWIbJYb5m8737wsXkYkwWKGEA+/JCy7qE5IHfNURyezhCjNm8rA5Vcq2F
	0tMENCyZ+X361A6OAPviLpmLhBh6LVWXR1TJxRK8EH8PcEE2xHKD6HPmxepbCag=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=oXK4YLeYPlx8RqSQHW/nFu+SCL/43fQ
	4XpPfyii78Bw=; b=OzdT5XEJ888vyowAtIoxX0cy5edUhtmRxxg0YomPN74+ysj
	XpRDyCdi9nfipGijnzHOx6tCj6JYXwownxrKBensQhUvD97Ya9SUInYPl6hHUKYe
	cA3FNV+44S1hzh97jvEgCVL9mC1Ul8BzmqSVvTIy1BZqRAfktgAwFNbzXVO+SiBL
	CsYHJ1w1+WswdgRvZt5FyMpfhpfb9IYFFnpQMpWGhe2ySOHq3J8/UPRrVjrXEvWy
	ddYJzzdi4NidYAJF61fJgWJyFbn3aIZw95rRStGKcJVrhSFE94xVymjYscvELTQx
	j9Ocirzx+lPO/72GnSJVyyE9JpxaHDiIBx2Keug==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UrT3wpEOnYPuRUrT4w1GhJ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 0/6] argo: few log fixes
Date: Wed,  3 Jun 2026 12:41:25 -0700
Message-ID: <20260603194131.1468654-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030191
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|LV8PR16MB6008:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c23e752b-8148-488a-a692-08dec1a81fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TuvfqH/yiMWKSvRcAJkhlQXYm5CToXRAvkJc/TgMxUMCRI8gqRwFKqSfBjRE9P38/XwkugElYbxBr/huStbtjC1klmqfEbLNxgI7guNlrzisl5BSJtCeOEq5vXV1w4N59q3ZprfyODV1RfEA4eGWlIXQRNabd7Ua/iZKFrTcuLa/3a0kF+ZfsZ6P1TvkhZaex1oR9ZXuBJfdgcOOvMxiRwfO9vzmbOR7JPMHeWGxotfifvf5jn7OU6apPZLMaN3FHndqWjxMDuC6YBDWPbmEb4zdyjEH6bO7hOmzAPMMbPJ6VaR8nyuJMtrO974g24TEXdIF1pkyyDdf77Gk9LV7ghRTM2PrPdSRpG+xXGweRq/6A5fAcMLMmjLk/r02/wKbJ3Wdn2S0ITaQ1IQf5z30f4dofakHnpc1pMaFeeA/DpL2s6loZDzWsv6gk+2u+Ee7lhY4WOezkMz2THjBtpNaOeuD64LiMfVtLSmLCcqq4XyQpAz7zKGO06ptifKAZ+D62j5d3xn6lqdolE5cuRDUwe5YKEHHOwyBV88aAZv7CEcpdd8VYWSAelacUHUPXLJ6aMkzY99n80zvtR5m6OLpvx/cbc2xNTAJrv/BQ8lViihW5+kp8NQefttrUkzssgF5CisrScOef3Wl3z1ajCZUtKrqFHL1CTN9h9znv54PG+szYBtNE6VdhYRphnVEXDWOBI47URg7sZ8MJ8ZwdKC7fhamm2j5pegsWlpmLArSB4o=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bmiwbGZqCX5YRdcf42NkMi0YAhCWr0Qa2Ww8HMbH/2+Dkk4YhkNj5+fbDByhNLgr/bdPIUDyhUhTcW7lka6MThoPMmITefI3WXeeg0Zz1iuFxZzwzNzkQy/X5seDnppDiEsqK0mAcL6ZiQFKW1wMfXIV+l3JJulxfqAGeyQaixMIN4T1vJ876jcu6ANuSIPj4xKuZcK1Enkuw5J/7lZgYHuBVknVOl+YWSJu2QbCj8XGTr2Ql8uIdRa9OXCdktYuneHbXuJ9rfaRMsnX4rbKitUpbybnf0wOca1DZ2IFpqc466y6GySeGqj2h4evEa11ZW2nbvPodJLqHAeVEDXyM1WnLyF3LuYX7PwtRAf5pSXs/exXJI3tJxCqESBo8yj/aa+l/bjT841n/E2mZ2Ppy3xn6KsQT08HhLvRBq+BBXYWYdJORUhXTpXVBg3qjjvv
X-Exchange-RoutingPolicyChecked:
	dOB8wjuRlS3pXHDGThik13oPT8KuIrfQwEqk5zzrqs2sSvYnSQEWoP+1z9ldKXL2/Us65Zv+7JYcNPrVkaWetZAF5eYQPBKGrlPA0yvBEEXwq/o/ncQnXW1TWXIOSEMsJN6N7D+r1mU36ELO0AHBIZar8VVEcA2F5oGxpWyDrG0hwxu6lgnVinO94+lHVu4bFIf0Y7O7TWeKrr8+u41TEoq2MJ+jwj0oj1SkJNs73JxvKv2NidhF7eebJeKXAPdgfdE2dkRx1HD//2Lj98erFJvh4ump7a20OOWQ1uzxUltl2sSXa9pXB6kcAEn9AMauLEHnnMUXlTzEpliajhmMQA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mYa/mSHI/jtoSavqUMIa9e9uKJBBx8acfCn9VSYMqVggwbayTMiWZ7OG6rMSFR/ID1yi2Z+tLiBgVWg0dKl1Cn1eczoIu0f5kVyc/bUAzRExTSjoRSPjXG3hQ2SFdsDKS7IWlcFNRQuRLb2Ooc3BSizlwc6ddWfZOe5J2W9grSVTOPAjK2mvuLN6E6bca45LTZWEtwmOGoDYTBvJJTJqXGeMtbnykusxPMVvY658R+AJp/4HlgahWb88MkGpkOO5uOVsXj5hBeAQRJ8fKE8hX5EbKRnWkB9gQp0z5t0NoZzRAcb9038Q4MB6e7eLb1E48h0M2qAd7gI7RECpfmASY7K+GRIqJMpiSHvEdfoUxrwUtR3jT3yets5z9Qcvzg+8t2yPT5hsl40REO1fKKHHX13OKzERAdutSxL/LbBY0H0Vwknqtt/RS6a6xbY8BOU7ReZDd+el6Zr4FiUi9VR/we0vEs4/3O/UZ9Le2mM3hLn/7bweaL28CBYzgWQboe01PhpQqNzK5c4buh7ooisUmVMcoWpVLrnXKq/GY5jSYBhSoITvUxjy3A5BC5nlLJhTfC294lQMh49OcYB9nnwTdCg8VuJmIaysCK2DoFaQnhkOQOxedQdWZog11CjDmfHC
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:41:36.6453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23e752b-8148-488a-a692-08dec1a81fea
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6008
X-Proofpoint-ORIG-GUID: HQwF9KMOKF8kkeXEX89VWQwWcxRujgnO
X-Authority-Analysis: v=2.4 cv=bJIm5v+Z c=1 sm=1 tr=0 ts=6a208374 cx=c_pps
 a=FTqHLmxhk7TnHmysD/QBZQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=9Rjklcs_zL7GqLz8L0MA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5MSBTYWx0ZWRfX5v9VyRT51b67
 UEcAif0oAd8RBCzxQcWJnY+7MU/y6WTdWrFz9eJCj4PVuKSrBX78g+SlDY+cGhwPlggFLIvAnSd
 54R3FxT5U6S/g4h7Ubexa6+1PGsdTXLSW/BsjeTPc9VL3rc9TZ/bDMHZ37Uvr8xN7rbiJPdfAWk
 7VCzOsspi7I9pVcCym2neZrC0MQFbLCjBXmUr9CGQ9iCLj2I0b97oDKneMw9Z6LOLg5PQB4MJMW
 TQrOe44DiA2288KD6sC93aDjRGyx4V33+ePxFK/MAGM5W6IG9rcepx4KYFhnPh8Wa9dTu47eYOP
 UoP39ojr18/DZ+lXz6b3W252N/f3s2q+HJZuXtqtSXQuA4t0gxhYIY5kmWCZATFkKtxSSMG4WwQ
 wm5A1xPD/Fie+ph0eIq1uzzo8U2RGr0yug5A1xt2mXMFimRM3Adbi36bu0fKrI+Sg/Ph8kgGzD1
 kQ7I0BC1P0BNY+NmZxw==
X-Proofpoint-GUID: HQwF9KMOKF8kkeXEX89VWQwWcxRujgnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030191
X-purgate-ID: tlsNG-ef75cf/1780515702-0A573C48-FA8AA4FC/0/0
X-purgate-type: clean
X-purgate-size: 1185
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,ford.com:mid,ford.com:from_mime,ford.com:dkim,azureford.onmicrosoft.com:dkim,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 891D363AEF7

This series corrects Argo module tracing.

Patch 1 lowers the verbosity of a spammy log message.
Patch 2 corrects the debug logline.
Patch 3 cleans up existing loglines by dropping duplicate prefixes.
Patch 4 re-wires argo_dprintk() to gprintk() to include mode debugging
        context.
Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
Patch 6 enables extra verbose Argo traces in CI for ease of catching
        potential issues.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2574255630
Link to v4: https://lore.kernel.org/xen-devel/20260603060539.1181809-1-dmukhin@ford.com/

Denis Mukhin (6):
  argo: lower level of noisy connection-refused log
  argo: correct logline in ring_unmap()
  argo: drop argo prefix from argo_dprintk() calls
  argo: fixup argo_dprintk()
  argo: introduce CONFIG_ARGO_DEBUG
  automation: enable Argo debugging in CI

 automation/gitlab-ci/analyze.yaml |  2 ++
 automation/gitlab-ci/build.yaml   |  1 +
 xen/common/Kconfig                |  6 ++++++
 xen/common/argo.c                 | 22 ++++++++++------------
 4 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.54.0


