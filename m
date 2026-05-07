Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJy2Hsz6/GmgWAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 22:49:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCB4EEEFD
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 22:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303068.1576627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL5eS-0004Pz-Mu; Thu, 07 May 2026 20:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303068.1576627; Thu, 07 May 2026 20:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL5eS-0004OI-Jm; Thu, 07 May 2026 20:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1303068;
 Thu, 07 May 2026 20:48:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wL5eQ-0004OC-MM
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 20:48:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL5eO-00EETb-Or
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:48:53 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fcfa47-5cb7-0a2a0a5109dd-0a2a4501d5fc-46
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:48:52 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fcfab3-c1f2-0a2a45010019-94a38ff12ec4-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:48:52 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 647HtXMs836122
 for <xen-devel@lists.xenproject.org>; Thu, 7 May 2026 13:48:51 -0700
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
 by m0482515.ppops.net (PPS) with ESMTPS id 4e0yjmhp0f-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:48:50 -0700 (PDT)
Received: from DM6PR01CA0001.prod.exchangelabs.com (2603:10b6:5:296::6) by
 LV8PR16MB5982.namprd16.prod.outlook.com (2603:10b6:408:1f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:48:45 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::f0) by DM6PR01CA0001.outlook.office365.com
 (2603:10b6:5:296::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 20:48:44 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 20:48:43 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 647IsKcF3447282
 for <xen-devel@lists.xenproject.org>; Thu, 7 May 2026 16:48:43 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dx24y6adb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 16:48:43 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id L5eCw9m1N2nrKL5eDwGc4p; Thu, 07 May 2026 20:48:42 +0000
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
	:references:subject:to; s=ppford; bh=yIaeevjQXMiiKHvF/coz9KCKM8p
	2ola7OvM3yo/BED0=; b=gnU8HHkgL4uKDwwXK/HqSua1k+k24RuQCjGbD97G0cF
	BXXLKa2emyvHkr8LR9Xgk02fRoHbD+6kyBRUG7h98xnE0kNxp4XnljE3HF9PThL9
	V1B2sw6aRYqgKbyE4jf9s8BzCAu85knQDN7jlW/jlQA15wAovHN+nVsH2D8iacdW
	6fcD01Pvc4KknWUA+tdkk+gmfiMQ6G8Cxsagysw9aLq08rU/auwQ1Kb8D1yiQDFq
	NbJtsVF5eE+WAw5VpeFyCHDTdibvrjX0VrD5zm5O5jDquIysGT2UOh6/v0aN/P7t
	nCDB7ELOYuQtKaT5F4LHAf32FIyawL+IwLqwLeXwPxQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQybK5bLWT3KgOL3J/QZwevk55XRiI1+PFJzdFL03Vb1mQGPDOxLyHFSyqRWZt+/vW0sTEnfmWzWw2jLWmVJcDSQ3cwe3drESRfilIYPfZlWp4ZvqcWHBcd3NJf3RXDUrQzbQ922V7aNmG4WwPinLHaMdh1NFCJfEjetvS+j7As87pQCE9bLVuomk8phkk+aNv4RUWqSzjMTOV9VenO9HtqD85TC7ELyaaMc5FiI8IFR7ObjWIxZEkZf+coFSEVtz0jiuI0xcZQYwi6diYU6hgSHaLpHqcPJEe57c8kBgN/5vmYCx1GoXmBTFoevve/WO+/6cSPBvNroKbYmibH3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIaeevjQXMiiKHvF/coz9KCKM8p2ola7OvM3yo/BED0=;
 b=k9kT6kCsTUmgLiTq6qPrivwfioJJdSek67WPHTuBSQ/MRWZYIP8UIGcwYWr4vLbhPoMHKrDiIAIEzHSW+bdsJfXSNPhFKiHcufyTzagwyoC4FTiregdgmKejsPWZCLJbElA15nK3Zx2BxXt+f61KSHy2TFAXHjlVGF8AT2Gyqk7YqHgZz62nGOcRkJ0wBio5WxZ94mW2RfSxnElpYY/UHxQfmK0U3Dw2apkFR8B3PJBwvjAUImN/fjysCZmS8/35e4iJ6lcWnGoqkh2Z7dxOyM7aT9d3WFouGy2EJA/g5kFMk39GWy2AqCm+QUF3XmxkfixgUFuwhlmSpBGcKqQSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIaeevjQXMiiKHvF/coz9KCKM8p2ola7OvM3yo/BED0=;
 b=ChT/5Qm13CO+oeW0qXP25NNfd1K6mzqusIpcc+6Gr8UraIYuHgY2++JxxRPleznxyqr/+y9GvtJMeHokzBrx4QCqbj75pMdYTjMHDh1JnQgKxKN972HE7FBrPj8ByM5xNJNQS52N+phG3llsXeSkqyvHyoQ1Hh4WYmHP6YfgTBI=
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
	 bh=yIaeevjQXMiiKHvF/coz9KCKM8p2ola7OvM3yo/BED0=; b=CqKbOwznjy7B
	YrP4aRlW52O7DtYbG1KdZzlgzKQw2slpSLQ+6eC/d7PhEzSxFaO8/EYJ92plT3v3
	wNqrhfiy64ep4jpAZD3+JfsSMdn6trkvRvBTmdCZpaHoVv5IBBMZ8TFuZVmEvzgx
	/yMioE0000GytwD3R/K+1PatKEZQpL9/dx4PAaX4pT9uIYk6d1WS6Va0JXY/wgFw
	37rOumyVU60vDRi+J6ODtAGns7klabzIECXA1jYkME8Wz60DAfa8uT8+JhNh0gTS
	8AMfR9oSYTIrmrgtegAUaw8DT/4xZNT4iRDw1QB4O4ZeTpyRk6nQ3ksq4iDBqhO4
	orTo07fSGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=yIaeevjQXMiiKHvF/coz
	9KCKM8p2ola7OvM3yo/BED0=; b=ugd54omSfUIGHHNgmQxvg+ezf9PxSnT0T4Ts
	QMfzmksn1mkubmimJfh55QICItK5uty3pXX1Re9pEaPMKBi0qAov64bIHTkJtTFo
	VApTvjydEue8vINz8rW8wMx1+P0Xz5Xaj5nxTYHEFKTtIPwohlPuk6Bc/5JqxiBa
	7e6z85XqVynAiqmDug3LpTs9GHbaW8O+jWktqN2C28yy574TgIFn5g8RlpDzCabR
	WqZwRAmxhmECux0lLlwGAyIZaknuzxCUQ3epN/Z9ZerDRdNd6lV0JTGJuon5Uvlr
	FFHEpHqmNSy2rfDIlxFgKAVio+XRj4pmA1K3xhVt/QPEway7aA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: L5eCw9m1N2nrKL5eDwGc4p
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 7 May 2026 13:48:40 -0700
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v7] xen/domain: introduce DOMID_ANY
Message-ID: <afz6qAiD7uyoXIfI@kraken>
References: <20260408234046.1314021-1-dmukhin@ford.com>
 <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070208
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|LV8PR16MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: a5244add-af2a-47af-0de3-08deac7a073d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	MIs7emsESZXy+IgSJJk7m0ELO1t4yfS5UMUOLxTiLzfvtNqiYQu46Oy4jLOvncsj9GrdrzGYYCrRdQ9kIap0XiE1827gW3e7XDO3kHx8h8M7k1uTHuynFspmnhwKi4PNb0/hpt2JW1LWPzkkn4awQzcMvEeiTfK5rICHDLKQT9mJkekq5jpRDOvRiiZnqza2rx5SQGslCbwITxuKjqJFoNI0dJSQUo/uTjQOBuEWejZtJD4UmWQtB5K1IFjv181FL2oSS1+r/PwGdHbDM6DD9r0WkUGGp3JfNh6eDvTn1TbwfmzlRre/IKLMziJn0J6G5++iLEnVPFoYtrv5vXd7khqQXQUFH/zbAIXjkFrFB5rKFPnAmBPPhqWWfcKa0zFDDdptDrfxrLjpO8WGvsL1OoEJ8ZUce51K0TFGoN+XE90GqeIl0RV4VwHBr/JkxFVcD7HrKuG05fDqtD4RwPY58k+mGoS+otYeRRCj99wcHActHXVMFAeTL7SuRLTR7eRuQK3wTLTMpblrJm0gHu9OY535rq7J8cd/MPjrOpBM985i2K39NFi1Wru64qRwyIMml4Zs8y2MPcJdvtINkzxxYCm25PkNViGox8tDEQ0hNx8mHf5Q5hLEOFZ9P6POc9yV0DyDPAilkJMRYLzaKyEqjbKfsOwrKW/tokYzPf53O2qVal/fgTgDsyaCf2sPcdbE
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SJHBHW/+Mqka+eimQa9mgKwKUqYqDjT2RXqFygVG/1WpX7lj8mq5VkiCR9OcEG8j5AMQfOjbEMEd6grIpYgtHYdCiV2uPYw8ErmMDyaR5xuOa5KJpKvlvqWiiO+r5jjnQIQ+y74QcCYe4GLlitoFdWuChxR0PPwnD5ta3lPni3iaaeS44diFEG4giDihy0Q9TjpUnurSFpV0cP3hGSk78Xyue0cGYSMSiSVER/ph3Fog8TY4k6BbRCMreUItbX9zf6BWGXJSZYyifsw9tJa18j6fTt3h1T60878u7gjPCIDt15jjHCOgj7APYDYgwQcsWPqCyWf6sW34XVYwOvytsbe75aVSp1F1AxVFBWtaI65nDs0ODW1CfQfbEK16RBX2ihRcr2M+ZZCev4un+AbL+r5snfREJYE9DtMPAeLquIU7xaIAefXRX9LNVfMafGgc
X-Exchange-RoutingPolicyChecked:
	q/WOP6jiAuGSpN31p42Eqe927oY9ZAlFzxoBD5/uAf0KrX5fPAhUwNaPrySPzLbYpx5JfSvCKk7/bv9JtuCJobv+g3eHvT/6pI+aFIK/KcrNi/qHV6uPgzAEf22dSZkCldW9m97Ux9SKAg4UqkICKVVr9FLtjqPOy8GdcYgGXXk64fpkDW3ZW7JkT+RvZlRkX8+qdAplLP2/aCI61iEFIo6VT+1eTyurRFJ5o4gtTZWDZRG8mEHNl4kWpZ2CbHGBRHwf0RQ8LWXKB6MPeSsSzJJk1UnvCVDjS5tumm0FQJNH3VhdK/Z67Voo4paD3trJ/ZJ/wDap+WhxomIZTM3eXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YLH75uicnOf+lplB3GB0PsDCFIJP6zy3CLiDUmhvpX+uO5by81u+Uw1+o9TK6LhqxQedSJhxBPGeERcRyo+KNmrSqx2voVCVYT3rsurD40bT560hkh8HMaaUW2zYLhj1ScljqKcDNBLFco8DwOsmbebjsrYTR4dCwToN298h/vukrTfkNHu6zSH2AluWW+0Wv9qmZtJThVHJeUpWfxtKPwKaU2zeo9SoBUNCMITK0FJxnn0iZ771w9bBxzEgx2FyytGcFqDGYoPHNJEVRycrduP28PUuWgNOhYAx4B0Fm+n3rk1giEehBfU9RGS+N/0vRrGnIm5fl66wsb8Tqaz8YytDzSM86lnN/LmcXYJd5nUS3u8DhZw2JF2vv++x7FkRiQbqjJmvVCoOVB1BO6lm4tmcPYVt7aZy5gJIO8gCTnkK2ubqAHuhf60IAmR6bZiqrBRKWTFd5GAg0jL8pVi+k8CiSLTjZlyGWTauRkpcOIOXdC6gankBzsr+nFEVQ6aFrOqHdQa3AA8CAEr9Bz2BeG3g/wt5Bgi0n4Fg4PJo8bpZEoQ6h+7lreDEESVx1R+HrV+XrFxjg0iWkHGur1IDZ0yYQy9pOsEsc58uUuFCZ8lzKmPVWbhp6dJul73NuE/C
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:48:43.8509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5244add-af2a-47af-0de3-08deac7a073d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB5982
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIwOSBTYWx0ZWRfX89Jqt6O+pnic
 cfYf2EOKDke4lAvhN9waRjgtIm+hcEvHtJm2wlyetmno02iSw7hy6eTAcNeagAqFWUzaICrt7pe
 u2V1VsRuEndO711FsXWiWGcAYAMCGzUgxI3aJM/UFEO/NbHHVqRmv55ZgmCW1+MR6pwqaKYpILq
 mC3CE58AyQm/9eKcx85Wj5B4h/3WB26Uhxi1hRH+9TIpe6DvoEMD+TVSk9bkwoiOZz5xdOCfYW5
 WmcudPlzqBrgEycCaLtIVE77tSDldJ+/h5UwxoAyTSOh0kmfp3ePypzvGKZwI0Utbdet5PMJ02O
 FIHFKoFrQ3LjNGq42UV0eMXjmjFZQR4CMJepXU/yb+AuQhIVFH1O/lL+Hh2eBa5yyBZIjizzeje
 EwnEbTtbju2yP4JUZ6TM21jcDiStxPuovrfmHeGFh1ikE/XpI35A+5ei8YHtRXcG6MlS0L+fiQh
 NIuTNxxG6XEXrZOZTxw==
X-Authority-Analysis: v=2.4 cv=UM7t2ify c=1 sm=1 tr=0 ts=69fcfab2 cx=c_pps
 a=Pnh5LeqhM4XIZ/aCP1A8uQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=-RI0ju8yAAAA:8
 a=J0Q-xWDkcNhgyuBBokcA:9 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22
 a=UsJdYLK5l2RqpxBViBoK:22
X-Proofpoint-ORIG-GUID: c-pWQBHyHQEV7oY36qSPldj9NfsKBxpq
X-Proofpoint-GUID: c-pWQBHyHQEV7oY36qSPldj9NfsKBxpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070209
X-purgate-ID: tlsNG-d62444/1778186932-AE342FF4-6844BB99/0/0
X-purgate-type: clean
X-purgate-size: 3408
X-Rspamd-Queue-Id: 6AFCB4EEEFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, Apr 22, 2026 at 04:07:55PM +0200, Anthony PERARD wrote:
> On Wed, Apr 08, 2026 at 04:40:46PM -0700, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Add a new symbol DOMID_ANY to improve the readability of the code.
> > 
> > Update all relevant domid_alloc() call sites and harden the domid_alloc()
> > input value check.
> > 
> > Also, fix problem with passing invalid domain IDs in
> > XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
> > uses 0xffff as domain ID.
> > 
> > Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v6:
> > - fixed libxl_domid_valid_guest() check in libxl_create.c
> > - Link to v6: https://lore.kernel.org/xen-devel/20260307025451.3148078-2-dmukhin@ford.com/
> > - CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2438790748
> 
> Unfortunattly, this patch breaks tests in tools/tests, see
>     https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2471684142
> 
> The tests produces this:
> 
>     Running /usr/lib/xen/tests/test-mem-claim
>     Memory claims tests
>     Free pages: 3059012, Oustanding claims: 0
>       Domain create failure: 17 - File exists
>     FAILED: /usr/lib/xen/tests/test-mem-claim
> 
>     Running /usr/lib/xen/tests/test-paging-mempool
>     Paging mempool tests
>       Domain create failure: 17 - File exists
>     FAILED: /usr/lib/xen/tests/test-paging-mempool
> 
>     Running /usr/lib/xen/tests/test-resource
>     XENMEM_acquire_resource tests
>     Test x86 PV
>       Domain create failure: 17 - File exists
>     Test x86 PVH
>       Domain create failure: 17 - File exists
>     FAILED: /usr/lib/xen/tests/test-resource
> 
>     Running /usr/lib/xen/tests/test-tsx
>     TSX tests
>       Host: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Got 16 CPUs
>     Testing MSR_TSX_FORCE_ABORT consistency
>     Testing MSR_TSX_CTRL consistency
>     Testing MSR_MCU_OPT_CTRL consistency
>     Testing RTM behaviour
>       Got #UD
>     Testing PV default/max policies
>       Max: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>     Testing HVM default/max policies
>       Max: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>     Testing PV guest
>       Domain create failure: 17 - File exists
>     Testing HVM guest
>       Domain create failure: 17 - File exists
>     FAILED: /usr/lib/xen/tests/test-tsx

Yeah, I did not run those tests locally and the failing tests are not part
of "basic" CI, certain gitlab privileges are required to execute the full
CI test suite (as it turns out).

Perhaps tools tests should be part of a CI runs available to all users,
at least on demand?

Sent v8 with a fixups for the tests:
  https://lore.kernel.org/xen-devel/20260507202840.293269-1-dmukhin@ford.com/

(Thanks to Stefano with help on running a full CI cycle).

> 
> At least, the domid test passes :-)
>     Running /usr/lib/xen/tests/test-domid
>     PASSED

:-)

> 
> 
> --
>  | Vates
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech

