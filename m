Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMMbLJgrVWpnkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD3474E677
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:16:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=p36KhUdG;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=YP4OqWE7;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=RWiy1yGb;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b="GSjVCz/m";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361813.1613878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCl-0004Fd-M5; Mon, 13 Jul 2026 18:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361813.1613878; Mon, 13 Jul 2026 18:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLCl-0004EB-In; Mon, 13 Jul 2026 18:16:35 +0000
Received: by outflank-mailman (input) for mailman id 1361813;
 Mon, 13 Jul 2026 18:16:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLCi-0004Dx-Il
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLCg-00EXP1-Sk
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b7c-5cb7-0a2a0a5109dd-0a2a45079ba2-2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:30 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b7c-ac46-0a2a45070019-94a39217c77c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:29 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DI3JrX4000179
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:16:27 -0700
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012007.outbound.protection.outlook.com
 [40.107.200.7])
 by m0482516.ppops.net (PPS) with ESMTPS id 4fd4wfr65a-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:16:27 -0700 (PDT)
Received: from DM6PR01CA0021.prod.exchangelabs.com (2603:10b6:5:296::26) by
 IA2PR16MB6493.namprd16.prod.outlook.com (2603:10b6:208:4ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 18:16:25 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::e) by DM6PR01CA0021.outlook.office365.com
 (2603:10b6:5:296::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 18:16:24 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:24 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHn3X12019616
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:23 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc493hy04-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:23 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id jLCXwow4HazYFjLCXwHFuA; Mon, 13 Jul 2026 18:16:22 +0000
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
	:mime-version:subject:to; s=ppford; bh=48tokVTb31SyNDg5RcENiJ2AL
	BNpyk+hlwfTtzg83s4=; b=p36KhUdGIYE70NuDVkHiIGwKOUOt/JJ2mhV2q1FE/
	tVzCcfB1YAw4zwTMVihjrqei7kI5RPySRJYwhu8reQzWpSnsho/HueaK6wVTnPxR
	6DPshTNSA/IbfPnYjhUjI7xiI92YqWyqbGPYbAFgUsHj/cIE1q0bzvi08DcU/z97
	bjoySQruXC3rr+YhidDYs5zlI2R58e5svbnbcTs4mEMVmHqp1u9fgPF1ALGmJayI
	01FTKpkaoap2QUEvm1bSkpw0CZvHnAXLtkg5C+3Vb5VVQ00xaYGknXm/o+bw7M4K
	g1fdegZf/F/NOhEaC+SIJKCOiqImmoPW9sYzByl36cgTA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9UxMtdMIXwJ7OsSiQj9MaEeZ+XglvvfHYD61s2YHdvD+h/plsRFQojb93LbkXXowM+hCormoWXgobn+ZAdjj1UIGOe8HAefeEHnA3YKJ6xSy1BThXXvKpUP2l/mBmkngjGg/2uNLafJaFhdPunp/WB35DlVM+w3YEr37RprwtWwTz/QW4d0isFrpzF2WJJKFTWBFqil0mn4znMAIwxyN6SZgsZaHp3y+7I5wE3d5wDAQinognYurYcH12dhbkvsVJeptC0MQNeNulSnA0+gOhdrED2Id/muhhee2EnjOH3utugpVlioygLiigxa4ilv60TE0odTHj+BmYr88bVyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48tokVTb31SyNDg5RcENiJ2ALBNpyk+hlwfTtzg83s4=;
 b=hTAaZweRq9LYIYoPJNjb5Uf/D13M/UblTepHhafvnzpC2I53Qp1H2Fkl+Jx9p4YO7iK9GNjGfMoSfMMtQEx6YUGhUE7qR1Cga53lWyNaM1CzAdP8QDf5uOvaOVksoHGKnR1XyqqhV5euOkS8vw+ei9KJj+lcdVW/hy+Tf3wsjRm525B+wTnnQQc23REuHcWORO7CfIQxMIJ04Dfdy3m1qEiyseCSFahCmZNQ39EbApKpLveUhlRNkKMEJT0U8yF4QawPu4Kow6G0gqKL1HfGg0uf9oe2noLRiT3OE/0dXnThUnrMU1BKuPUfGxNW6i8pSpCITmXOcnnnOf1IyJvcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48tokVTb31SyNDg5RcENiJ2ALBNpyk+hlwfTtzg83s4=;
 b=YP4OqWE7iA1GWIbRxCBFbm+j/Q2IcQLAZ3SlCAMr0dwYj7/dqXj9pve20l6mj1EtJA3+NmaAfYFS+22kHLHDdOGK0BmVeSk0mkhhu1MLXi7OP53RZtRrsNHGu6M+fosvbdq2dhL80Z2cWezUd8Vfyt+FosWpWP3Fu2K2VaTiYnY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=48tokVT
	b31SyNDg5RcENiJ2ALBNpyk+hlwfTtzg83s4=; b=RWiy1yGbXI8TqSsQfN0Sbvs
	ugjo3ibCx/6p8zf2e1qriK1kp9dw1RVnhPmJI9nLrxWuAo0jZ3cUuSBrLITdat/7
	lfeJ6JRa2koNfbtG+cQ9hNAnYpXVN9LF9GGyt4sqAtF8BK/J02eTvlU3KVjPmLrP
	N40SF0032nf/DpAd3yJ2js4qbFx9niLBMeufhZhbuolRLaTDTeuIR12LYXJl12M1
	5hnRAImQF6XoVmk1tig1W7kz3seqed6t4GrC/KGB+gcw34rPD9p8tSoOjCDw9KJo
	sT3CAZ0lxeqYN6u+Sv3Oz/l1NAaxQfRg1NS+krqUAmRGQF0gArKKJFN0f9ly0sA=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=48tokVTb31SyNDg5RcENiJ2ALBNpyk+
	hlwfTtzg83s4=; b=GSjVCz/mBGPVljrnYUiUDyxBI/8aN0aU02g9IZdtnLiXkLP
	aZPQDhJh1DCPOSmH9xCTqTgfmKPbaJ5ChbxT/khV41+NiFq98KTId0jmPLHl925S
	OJGGc7g75trO1GnUCMoMPcmctrTABf2hTJ87mvlXS+44C0CGg/YrnYc8NoobpnWb
	KUjZKiSUv5NRBOKE0XSB4YARVAiBrL7ysSTaFh4kb75IvbY0XkIrH7aFnm5NO5Zx
	9NyHuv0PTd3Kv7hwN3FwLkFTfxrleEGxO+I0iU+F686sq68sBLZi+0h6D21hl6Db
	iZPn45DNuj7J0I3ShFpKxBO29cr8heWaTu9DjAQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCXwow4HazYFjLCXwHFuA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 0/7] xen/console: configurable conring size
Date: Mon, 13 Jul 2026 11:16:12 -0700
Message-ID: <20260713181619.672176-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|IA2PR16MB6493:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca91b0ba-7c12-41d3-5247-08dee10ad96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|11063799006|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	7UCO/pLXeZWZQumghZndghKbuWQ2zp/Z/07nwTSd4AEQOcPYQ+CzC8Dp/MXepnMlLIkMhWDplnxcSBbgmGkiQ+Xm8gq/dbdWxBbCeq3gN0PBJFaERaDvYozn6I4/lYQX1YZH8t0FjpuC9K2EEJkGgBcIcc+djs0MYeeR96XbKcqTj13eJb7VRwwZLLjuka47trYEmidF6FSzZsYuDu+Eu0mjNQ/Qzz51RVyBqim7yCzMHjiSxktVH+P4yPabKeMybN2byC2SR560L7asJkZeAfbWPwKb4x8Rthn3NqaAUYAUdHQiVXFMA2vrHmt4Bo/NDpgAox0aPVZcuf8y7rwIUm4JJ5PUhXwKdEhvmrJjcl1z4RMkiYqTqt9cKbpwkOqgqutuOKNzvZYBgoEugw8XUeXtdbW7l0kJuZjYR0KgF1TBV9+cpK0hjkkHa8ZsZeGWdCH1vsYBLprRopzTz66SWL+lalssIycg+dTPX3cql+vkpuRpr5IUhXNDEbdkzfdbsd4s83tu8J4d/0U80ikG9eygRTp25KN8IeHrCOHqC4xQNbdUnYqf+V/FH2GvtxF9ifq2E+UtONZr/tcXetgziFvy38+qhCrhHFs04vjAySjqNRFU5pduIUXnaAb0GEksz2TxU3YGPzuNrn8jXuhmaNPY8+pT98NGFG1FIUniwwF8R+j3xItAPZ8NM7MJTxbkuwGawrsMF8dC8VoiJ5o0uw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(11063799006)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aqHUw9hz40Hn3fVIF3KSTmjSMs+IvIognAa4cPVOuw6QnxzZj5ePZAC6609zDRc+dQmCRjL7zqxyVDm6rr6ojzgWz0rvK90z52YUn/I8DknQFKD6p+AIqvzQkNEITDXYII3Y6pnFG/H2jBNF1X6PzNVHz+LbMqAOZ0JVbAaCZUGnW/DTPBV7M1ZRP2NfRmpgAQ0yB+rn6vZJzlWzPaMdQbO+Jh5svSz6TOPY1LB2o/tF5cZikr0712LIqZRd3hxYoLs8Nj70SNoyWYzXiOd+1NWHdepqJMXTXlpRsKyXVqaoiFWVybJockO2rzsUmGS8/Jy89qq7k9CanlnW9h08BXNedkBsusIzr+5HcR27FQMgJVwPM6f8ba7oLx0pbWAjP7fdWKFCoah3yxho2WBbGZA5VStYgR7C5BZKtDcoJVPFKGD+d98/8V7E+Dq7zHAa
X-Exchange-RoutingPolicyChecked:
	NpzfhCKRKyRstMExTH53EwXadt0fWh7duqUZjNjKXHTWEjXFA3f1q/zQzFl5prULeRR+EQuuml/VvhLXFr4F5K6S3gdW0IRqEazxAEaUUdGrgSs17S4Nbp3XNJ0DQ5kI935Q9StZ7A/0XBlqPxM4hH31kXSVtsQBTh/LWg3dCjQhaxoY62FNwvZ8X7YdYguGpQ7NTcnh6GQGpPvKH4IEH2ncUSXIShM1HVNeupGiOE4YpQJT7Lkeu5JqBjwXQiP5gEd1UmjFz8LRl0psbh/JQEtKJjJwyefcR4qNobtIekI01AhJvu2bmHwt+b5x+0wZqQYSFMAQU/nWyLrBtk8nwA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TgPsHGMBWqchRCQKMvQ49UL8BV/so5B65Zd0TQ8hYdXOT7e3VESk0SdR6C6X7br2KX2izg9nkJPy3Oad55ZPSdXlSc8OtgYXV1FqQurMT7ufymDw84P254sTa3yZI4rK183Dl0d7QctbjvuxomH1wz4RKxsX+gJZ7M1Y1jFD28SScyw6g5BXmXhh7CAW8mSqgbZe9CC56UbUnyqVaTrRHHhPzOlFeo29/FYMHanhQlH3aeODrHt6mUBwxbWiDRhAEWFgbNEbMSxfwQbaOTA1dCJeQ0zrXTxyNnVwQ7V+oUh32smyPIgyPkF5WSqLGKgwBDM4vUUr9/kW2YH2T1DqLGevWAlhGBSUKqR/wdPm0gBpetsY0gGVBEzmgVk0YPWGDSkBOeYzf+5e2z68+vT/GJn/ri/aZt71qQcAv8J9a7y5Dzxa4e3skMLFdlTgcOh7q1ip3Vp/NvFlvIYltcYjTkK0fzGUsUlc9fh4yCR1dWHqUSSoh156Kf4iK7cCUMkFhiGAlWv0F1mEmh+W9UmU6sYJ1sAueWxlImlza8dpQlgzb6LcKM461WwJRycpFbIMF3TXBKbughujeiCC/buLdu3A7s98rTJlKFpji8GtvIARb3TTWfQ8GWg1q3gRFqYPqNjnxTDts2udO1GzZTo16g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:24.4655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca91b0ba-7c12-41d3-5247-08dee10ad96b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR16MB6493
X-Authority-Analysis: v=2.4 cv=ddKwG3Xe c=1 sm=1 tr=0 ts=6a552b7b cx=c_pps
 a=xQfGHK7Kh/zEjKjNz0BexA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=VwQbUJbxAAAA:8
 a=tHz9FfFoAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=Z4jt0JtKACifwIlhuEgA:9
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: oD8rG5IsKQjrgqnyRiqoTgijXH2O3xQJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX5kostFB3a6nx
 hJhjjmz4ho3X8HiAqMg4OMsCxKwOSm52KPxMdcCL/l55yMurBvYemWpEhVBWeDdL/rsTxbi6k9u
 BnCtSUtDANtW4hb5+uoFA3jrBHwNsMTm4oz9s7VvFs8w826i2gJQ
X-Proofpoint-ORIG-GUID: oD8rG5IsKQjrgqnyRiqoTgijXH2O3xQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX1LviQY1w7Scr
 K16xpvJfZ4pOSex3kqmnh/NyXN0+eUwavvAgrhNCx0vRVzHFOdtO0PO9e0D3ZeYJQCgD+6Zm2X1
 uZi6rMfHt6WkU4XZtHcZeH9TbowpYSdLFwCQxiT/cwl+oZeIVGEgqZseFNgDGUtg7rvOlX1YbSo
 Gw9/qlsOfp+cektQRy+7lIvPns50LeMFgtV4rs/d/2QyAfOtLAolzi1eRbGW/ewTExjWYPHpwpm
 GWTUmUei14XFjflqPSir9yKOgJReJt4q176mTNDKhb+gYKGwAK7+6KKKMjSLvvq22wdHjQVkldn
 Tbv3YRY1llIImhB+aepjNzi8llXgKizJx1p1QUqT3Ve2lQ9MyzPzrfXbRV67L56bZkxcc/CANug
 vCU1N2wdOMd1uITCzJC0MssC2VMhVAtSXNgz2VT1Hd6ZCx+gP/9LAbHINFUDmaGbzGuzXyW8iNc
 zEveVEEDdpSSPWeX2Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-ef75cf/1783966590-D057A201-0FE724D4/0/0
X-purgate-type: clean
X-purgate-size: 1475
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:from_mime,ford.com:dkim,ford.com:mid,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DD3474E677

Series introduces compile-time configurable conring size along
with few cleanups in conring management.

Patch 1 updates conring{,_size} annotations to __ro_after_init as per [1].

Patch 2 optimizes switch from early conring to permanent conring.

Patch 3 optimizes code in conring_puts().

Patch 4 updates the conring buffer allocation code.

Patch 5,6 updates for the command line options for the serial driver.

Patch 7 introduces CONRING_CONRING_SHIFT to select compile-time
conring buffer size.

[1] https://lore.kernel.org/xen-devel/1a5ed8ad-0cc7-4e05-9b9c-cd6930d9b9ea@citrix.com
[2] Link to v6: https://lore.kernel.org/xen-devel/20260509005714.892018-1-dmukhin@ford.com/
[3] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2673235063 

Denis Mukhin (7):
  xen/console: promote conring{,_size} to __ro_after_init
  xen/console: use memcpy() in console_init_ring()
  xen/console: use memcpy() in conring_puts()
  xen/console: switch conring runtime allocation to xvmalloc
  xen/serial: drop stale SERIAL_NEVER_DROP_CHARS
  xen/serial: harden serial_tx_buffer checks
  xen/console: make console buffer size configurable

 docs/misc/xen-command-line.pandoc | 10 ++++-
 xen/drivers/char/Kconfig          | 21 +++++++++
 xen/drivers/char/console.c        | 71 ++++++++++++++++++++++---------
 xen/drivers/char/serial.c         | 24 +++++++++--
 4 files changed, 99 insertions(+), 27 deletions(-)

-- 
2.54.0


