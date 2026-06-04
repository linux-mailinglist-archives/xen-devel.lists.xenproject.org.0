Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zcekBA7zIWpZQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:50:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A62D643B1C
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:50:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="Y/ut44b/";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="ka/RPP4z";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=DZ2jEN+2;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=PQbrus6B;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328598.1593023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwp-0004I1-8K; Thu, 04 Jun 2026 21:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328598.1593023; Thu, 04 Jun 2026 21:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwp-0004GW-3F; Thu, 04 Jun 2026 21:49:55 +0000
Received: by outflank-mailman (input) for mailman id 1328598;
 Thu, 04 Jun 2026 21:49:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwn-0004Dc-CM
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwm-00BQcJ-P7
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2b7-5cb7-0a2a0a5109dd-0a2a450bd298-32
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:52 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2fe-212f-0a2a450b0019-94a39217a330-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:52 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654GtRW52198044
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 21:49:50 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ekdaearnm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:49:50 +0000 (GMT)
Received: from PH0PR07CA0058.namprd07.prod.outlook.com (2603:10b6:510:e::33)
 by CH4PR16MB6724.namprd16.prod.outlook.com (2603:10b6:610:234::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:49:45 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::a9) by PH0PR07CA0058.outlook.office365.com
 (2603:10b6:510:e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Thu,
 4 Jun 2026 21:49:43 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:43 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654K6YOR133194
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:42 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeyps430-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:42 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwZwocjeba3bVFwaw24cx; Thu, 04 Jun 2026 21:49:42 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Ss5
	se4g+2sQFyoqN3gl5a+WklaGLr7GwBQ/Lqw1hExc=; b=Y/ut44b/hhG7cGb7h4k
	MPM7TtVeOyDAiOHiI6dofwMUwakLy261LgMDafAFPyAbVXvhAd1E/iUb7prUoYEi
	3ZgaWjZQD7pGlrTp+NGsZrxdhJMhD+9VadUmf0kNC1U4RuL2inO/ADFL5obG/WT1
	rg7hsU0jIbdcBxkLCLSi2PFrFbqcQJ5U5hCfqGSoXMiqsZm9F8eeSxx0JeS45vPG
	bVmct6N5lrnpfCA8E6e1U7lcodnqsPpR3GiWfLTqjcu93WUeee6nnBvHCkx4siro
	moU+oY3jJMs7RtOYIHxt5Wd2n+lJovQL2AwKtYF25AG41SjHt56kW6ECBbgl6QFv
	QOw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtLKeYIiDZBwVzwn8EgZZdDITgWAB80teN1EP8SJJpJnaeFCSZ+0mC2t95LCGqSpqB7JZQx/dd/3MYrwm4kl7kAAnDKmmXR+vOLm7DM2bCK2P3fCN9WVNklZ0a0eNo58s5dDGn87Ed96yi/awR2oUgJtsDN6MKxqcQsmTtGmiNA4V+5nTt1PVvOFR3WFckj2vUc3ELE7TjYpIo2zpWBi+gyew1Qm9v5LtcmmO66Ri5du/lBjMC0UYhjvW0OM+ULnPS5z6fyEQZY1a1cH9QYdxFGPjJAK+QEMxJhxOmTes93x4rK5O3ZLJxy2NL0RosKdONCStJN5kK/f6rUwC5jhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss5se4g+2sQFyoqN3gl5a+WklaGLr7GwBQ/Lqw1hExc=;
 b=DHtnYSZNuE437NbYJnOHZJ+hVYHowCatUKFbS+/HK4LFZO/ttw5VGU01RkaZoCVOOjTDrwv+8hE4brRKq337oPMOzOFOrREpz6DcMxkMvwugBt25tzcz4+tCJtA89fySWKCh1H/Nw0+ldPEPwoNaC+TpExg3Ydhdz7rPUMx4+VaILOchuGAAdrDMSaBOplCnsYHFyU7EhHwIDoMl89QVxxCAEWJ4fLL7h4Wfqq+SyTPvJBIvzyvaleFOnDKwpaXjpltq6rckcP2UUXsW9+HhChwSQz/Z85miYLomTuRQt8Cg6yADurojYLPD8LEIXVxct+GRnele3bMVL/E1QLG6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ss5se4g+2sQFyoqN3gl5a+WklaGLr7GwBQ/Lqw1hExc=;
 b=ka/RPP4ztoDzqqZ9nRNhswuAfKJi368+AKygPUhcnRJT5i4CeXjuQyfZhjQgJACXZhaAYDzONb1S6feEj1ndKle7jQPv2Wh927PBuIBWhY4raOjUQORMntFz35lD9IXzOmJHynuIdcnPVLh30cvBL2TChCttVngMD98G99KobIs=
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
	ppserprodsaar; bh=Ss5se4g+2sQFyoqN3gl5a+WklaGLr7GwBQ/Lqw1hExc=; b=
	DZ2jEN+2hTMnDlxKjdWVu1s0WrqdhToKrTFX4ZlHVDYuWdG8psYlFYBlODPiC8zo
	ZK9FysrQFMmDKApPlmnHG/SSDBLtYsRmjSrmz3m7mzhdViEkufb5LMguTpzRBQAC
	vwn90bpuMAi+ugtY+vaSFPY0poMfmXQgVlJb9VYicjrGj+Nz+J9yiL0UBKeSfmcj
	AOL7D+3Kw/Gu8SUXeI4+BNKQkyeojIU3W9+NuU0ubSXLyjJDGM9g7UxOqiaZP9I1
	hjY8U2XJ0mZh7ZBENJdlLnQvLADsfRN2W38c0nMo+u93JEeXWBPMWR+CV1ukJ4DU
	/v9bWqLm8ohZmD8xvEwJVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Ss5se4g
	+2sQFyoqN3gl5a+WklaGLr7GwBQ/Lqw1hExc=; b=PQbrus6BSU9V5CHsSGUribQ
	omgXNnAWvsZZJP0mHHdFugzO4kxC2EE1BsjR5V+nttTlK4VABQMtyMYSp7LEfYvb
	JfO+zkDeXPGj6NREx2YO3bRbbsRvwixVVbQmU6qI7q4NZkEvQwvdWw6Wc55+ODAi
	lSK3dH/6iyvEwfpVJkLOv+TIoqHoOSaF8c7F26nxltTY+qh9avQBPmeHvuO6kePa
	7DpXk0uNFV5E6vpxXQKG8cLfPQ40Qv5tqdHhP8evS97KvoyLWHVJ+XEfzxcpMWb+
	2kw9wdvK2LolMP98VMpy7muFSG3i/RaFqi6ITfdFaWV/r1u58ym8sMUrRdBO+eA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwZwocjeba3bVFwaw24cx
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 4/6] argo: fixup argo_dprintk()
Date: Thu,  4 Jun 2026 14:49:24 -0700
Message-ID: <20260604214926.1735194-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040214
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CH4PR16MB6724:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56e709fb-278d-452d-41e4-08dec2832fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4Zvv5/SF/PyCnDH1XPSIJc8ju+xYcWYeF7iyOKfb0mi8bKIUW/TDhb/w2fPvgCR/j4sA/1yjcHxJR7J/ohHUVxK7bDsCEjoJpxreVGpuUUVl+Y+3wkDaLOSSCrLiS9yCutulMlztU0vCYdd6CBL4MT3+wTzuO4HgwjyruEQUqKswbp98B+JGbHZwJFUBMqwWeeiijMDv9UFquCCTG3hcw5HkvZGIOwfX3YKZH89zrZd4d0NbDZmacUJJiQrjYejkNXRsbEIDUK4+IoCQyexXQy7dT9yq/LoPU3GqqAdSoBZjzHedG1BKFDh0yeU79KENgnhenlZ6bq/m0YeFbT5c9r0O4XzmWdeNSumuVY7X5M7nDHQYSQimqGkynC6DQFAl/dciNjKVG4smmJrOiF0fy+wYvWMJxQcnfu/JTQwMjhVUBBf4Iee95/dxP6qUJMtAWAxo5VTmHHpcfwjxIYH/mc7RoTe/8ZnFjFbege9Arw6uYs0YMx5SN9S7JUDD9/LJn0WhTPlge8pRogSDKKk4ynq0nkEwOX7HiKp1PYkAoltvXhnYtAl9f387Di0Sw8OREENECOn+ZJXNT+x/KD/d3Dd/YpGy0Mp2C9ICfg6rOYOuQfkKFj8FBBRqWkT4k4hddD4HyCOzte8ApUku5KkpPrl57ERNsPktGWqcoh2mIGAHIA/75UHS7lQf7ClGotVzKvVXVTFSiQ9JHSufw5luE7Vp9Ts9Zbk2b40m4cyAMXU=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CHzB+498Vk2mtrOAPLn/oC5UwBosoHpVDmr1862jouDCP33xJ6hzMpXiIkH75tPiJ2koUtSJXLcnEzdyN9xB3sLEHYdI3j8YSb8p08ExclzEHb8Od9d3eO0bdeymgvDLvjnJh2yr1j/WW7NkV1zOjB7tTSdesTv5oNyz5OsttqwZVFug800VT51oaI2w0I7cx2pUobZGAwLPXxWAzgnnd6oR2Zn6VRLE7n12hlRK7vTBi5G3YEY7NGyNrcYxovTgi6eMaU0RFi6+F7qbMO20uIs9qmg/HK/BIqfbVMQuGrKJYoxqfzSb6ksq1UWQtnas5rLPtFefftKAjX9ThREWJSVPShrW64Zp0QEuNoHFlwY9T8SL6TihodXfiJlDMkMQJhJ8H51KEJds3bj/OSR5pSgzxnEKJTWf2Lz3VZHUkzR1qGuUKAuOkGtoVlYo8EmI
X-Exchange-RoutingPolicyChecked:
	mqT9OdrD7dAp0tyl7KJz8WpQPq9nOPJ7zx3SuKEWrMDlj9Y7XCwZUocyafP73kFWWLa/4rhRWQZac5Fj4LZkpIcaI1h5S9i92WBi/0au5jh5hylp9Hs0/o+m0oBe7WU7EkFmYSgn6bhTYNMxutQMwpEo+FotDEXGONfoZZpXBbd2IlpnqIqhMBEDbTqE7qy8khx658pVsbSLRRQ8wEAEweDCKtzif2m2kR7LYcIT4snbEmuqxIMg910ZLWmlB+bgDtI+buA0Mycc5lIqoIHTKOURVJh4YlOa4aSmCQLInkeVaXJX4q4QZDpZzHXmpGgtSO4aGiu/dhGf0tJlPcZnhw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q8Xub4WxDQSfKRJzKERuzzgfRrkbfxJQ+q1qbzzogpSJJwpvOhajdbmSteRpxy1TVjLtLaudtJ0Yt9/7ePOwXdXtCZtlD8CWe/aHjEF2PNIRz3FNQa+uJuFiJ5HE/M3Kv+LCKklZ9HVRjcRFd3BIbldfVn2HwGgkTJsWsIPvRMcVw3kPpqske+rrIK4P7eVNNMc6IoXetCknIqGPlHIlXY40n//umzAL7qTTr6/5khO1gkHznXmEEL+60sdsS/ncTIZo03KZ38bg9yxe5mIsSUTPdSMwfJ9esIp8/lQJPc8/Kirq2YDR/j4NuzpZyzISCo2p6DXvloPr2ZQ0Hm5WOkI7Ulx75zOM37iryB8ZbkfsEeLs2sNPE6ZinJ+a71ipETAdC6Le86TzEVCQniyR7w6Usx67LGD4K+S+6MvGgL7yb2kkiLJdQ+yCCrBWTKs9sJIWVK1ydtgWzMV1uNo6Hio6q0wf9gRFjBMc6GtsUMvKKDbeackYJ5NVAjz1LQ6TaigQ1hZ/PIouhR4tI6VUWu/lk9PxpGU5MB0is+0tK1hgQv8LnJRrc4kVmLccnjN1XSPib5l6Wp2Mo123spd7792t4y0MC+v9EaMvXghQ9cxsHChBg4/UUvYhnG49VM3W
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:43.2030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e709fb-278d-452d-41e4-08dec2832fe9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR16MB6724
X-Proofpoint-GUID: I_dOEbkONW_b6Ee59WlO1PN35DkUImuj
X-Authority-Analysis: v=2.4 cv=Fos1OWrq c=1 sm=1 tr=0 ts=6a21f2fe cx=c_pps
 a=H8Bh8Ha9hE1t7kEFpXBZew==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=BVF7ZLGepraehdP6dWoA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: I_dOEbkONW_b6Ee59WlO1PN35DkUImuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfX9Pn62QPfiUSJ
 wSB3ulA/QB90Z58lvcAz31PQ1Cmc5TaAiesBrDWrRQ+bH7BnZqHydT5HyAnTUksAKd+shD4ko1B
 2PIqZsT6Z+MK5z5e+uUiXPQAepwrF2M9M4rLy7tCh0VbdxtgaKWCZzRrBjBZUCsaQB9p0LSfQUh
 NK3pma/uRYGH9GI6mylIFbw0+xE+dIkzhy9xcK9GJz6y0O5eaY0S49XB0yvET9myGOV1nxOuKjq
 YlVKirl3uEQQV28Q6+hisrOW5Cl1wqz/kjIQ8YdrsgaC4PwlGvowqVEhDdM6mJNxyGYsz3U22vC
 paI+RDe9mNGzO5oU7QLtyX/nsDblQIjPynIxpLJ2PlKKYoFqGVoH3rLxodClsh1FtgZqaFyCeGq
 nQaxdh3q8IvGm6xE8gbKtK1788dCAlUZq6+39Xdvtv7Jq//jBEOIDweVuPgJ6JfrZTgk/GN77yn
 HDZMXKy7FJw5b6MMK1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040214
X-purgate-ID: tlsNG-42698a/1780609792-2238AF3B-004CCB88/0/0
X-purgate-type: clean
X-purgate-size: 1082
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A62D643B1C

From: Denis Mukhin <dmukhin@ford.com> 

Current argo_dprintk() implementation is a wrapper around raw printk().

Rewire it through gprintk() to allow for better debugging context
(such as domain ID).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- added Jason's R-b

Changes since v4:
- n/a
---
 xen/common/argo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index ffa1f43437ab..3c38a51d09a2 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -322,7 +322,7 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
 #define argo_dprintk(fmt, args...)                      \
     do {                                                \
         if ( ARGO_DEBUG )                               \
-            printk(XENLOG_DEBUG "argo: " fmt, ##args);  \
+            gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
     } while ( 0 )
 
 /*
-- 
2.54.0


