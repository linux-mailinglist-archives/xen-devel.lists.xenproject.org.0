Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA0XL5Wb5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D05434208
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287763.1568171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEn-0008Tg-MO; Mon, 20 Apr 2026 21:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287763.1568171; Mon, 20 Apr 2026 21:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwEn-0008Qm-Gu; Mon, 20 Apr 2026 21:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1287763;
 Mon, 20 Apr 2026 21:32:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEwEl-0008Kp-FZ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:32:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwEk-00CD6F-Ss
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:32:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b6b-2eae-0a2a0a5409dd-0a2a450289b2-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:58 +0200
Received: from [40.107.200.102]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69b89-af86-0a2a45020019-286bc866b857-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:32:58 +0200
Received: from DM6PR08CA0055.namprd08.prod.outlook.com (2603:10b6:5:1e0::29)
 by CYXPR08MB9432.namprd08.prod.outlook.com (2603:10b6:930:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:53 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::92) by DM6PR08CA0055.outlook.office365.com
 (2603:10b6:5:1e0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:53 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:32:53 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzzH862xlz1wdP; 
 Mon, 20 Apr 2026 14:32:52 -0700 (PDT)
Received: from BN1PR07CU003.outbound.protection.outlook.com
 (mail-bn1pr07cu00301.outbound.protection.outlook.com [40.93.12.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:32:52 -0700 (PDT)
Received: from BY1P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::17)
 by CH3PR08MB10119.namprd08.prod.outlook.com (2603:10b6:610:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:32:45 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::73) by BY1P220CA0042.outlook.office365.com
 (2603:10b6:a03:59e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:32:45 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:32:44 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:32:41 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m9eGN9MfZY4jzJW/Q1ya/Nqo4V+fD3/3Psh6avzXkYjiduiAHjKwQpk0CDBDKvf41uGrHUPEdMe6Af7BRG5e+Z6m4xdmzIE7MaBq6gyjtjPQz0nzQi4XOX5HAPhlCQi8mx+AjVyU34iV05BbKQb5XiQE2afPjD2oRpeAz7fzhdOXhCpJZMTooWUJUvakMoYZff9Br8ZReZU2M3E9XI+Qgll6Faxut1as9FK/GN9xnCXfDTApxdtUbRRwiTVbwcgRgl388lNugsbeFeWzM7M4MVBrTjlFpoevaD6BTqUqJFbOkf7YR0S1+BUEQPci0Zr6APTfewW+jUD/+sH+ekW49w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=rDVlNmxozvjcFfzGiXWOEg03MQx+FxFYFO75js8+YfzYRkHBKr/BOva6mu1LoI34ELpP/xHpx0Ze/SOL9rVe8PqXw7W1gNsKlt9BlbfZ4+Kp+xmXZ2VMWX2iKV0/IW36HgrpMTSB1UV9clbzb7VdlUyBRWE3ucPnIpSQ9jcaXUhVZMeGfrN3ldsNDliXm2g/bCwsWrJBv7Hbc4S6CDfZQUXmC1jn6P8vdq0DVGTy8n+VgAzJZj0C7LTy9NahJLPopILv2+nwEu7eCe0DkN9EmTiszn0/eRVIPQqxAhfeaaRaFvduSOa+rYlIeDuJ/L269mFi/qM/FnsmWnLxgEF5og==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.12.1) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=MGbQ5OVBWcb5drSpAVR/SfX5Kj+JSilIpSA7to/A2YOyaT94+n/a2hUhqScStFQHgYH02bfSMidbdrPRH7mvGjYzLBAzUK34WsHQU0HHYC85CPDjR5GWkQKxEQa1pMWNVVg0pd6gVFrEbS1MDpqPpXhK+L1HxChYVj5kgRILKrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.12.1)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.12.1 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.12.1; helo=BN1PR07CU003.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFEGWW0wI9qQpB06cFpDqlShSGVnu2fRPELpc2L0ydiaTYkUHL2P5l9VY6xo37qlGMLIbPKyoNLpQw9R5j0U8Le/7EhTQRPlXtgsdldehssu7jBXm6z+DturYKUh0o4aA37DOke1nhoXMe6sCOtx6m5sAyofn9lL3Jiy/YK2zumoaeApdcJs4c9QzVdKOtf/8RgSRfmFvCMI6ADI/cm9627VBBcERFL4C1jzdd5WGOsyRXDi6X+AXAVWFYWX6zaULK2XBOJf3rmyAaLMjMugA1khvzIRY4zZh918GNaaMRYRQQlvh/Il7WoWgSCJTmDRNQ+9N6eAzPnnSq4L0Vylqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=I+6212nDc5/GMI4iMb3rV/S7kelOltMzLg578Z8GTp/zZdMmE7NikHzWJfeiY0zvW5pmQqZL6z5uoV7CMnYQ2JA8/H7cVMl6bTITTvjZMBWS7l/MpP5J9ZjuiR3/cDDlW+ztVujwoeSvijuOIQQ22uaO9l7IND3scNxWLddUTXcy/TeVUudNNDyBff8A4nzQAChPZiVi3P58w48S2/rZG2YEeAnyZJD1d1mRzVffvmOJy3GgQhjnEnbrXMpfRND6t5eaGgL1IfyBHrH4AWv4WQSqyLCjmL2O48kK+diX7ghufWFyy+iYPzLODiJOcU6OaviBsRtZfN5PfJ8Y5foAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=920CLmPnDOg9eeLN7pE/1x+mVKc67Ab1k7o15fr+MnY=;
 b=MGbQ5OVBWcb5drSpAVR/SfX5Kj+JSilIpSA7to/A2YOyaT94+n/a2hUhqScStFQHgYH02bfSMidbdrPRH7mvGjYzLBAzUK34WsHQU0HHYC85CPDjR5GWkQKxEQa1pMWNVVg0pd6gVFrEbS1MDpqPpXhK+L1HxChYVj5kgRILKrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 10/43] altp2m: Add ARM support to do_altp2m_op
Date: Mon, 20 Apr 2026 17:31:33 -0400
Message-ID: <20260420213206.208750-11-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es012.ebgroup.elektrobit.com (10.243.160.140) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	SJ1PEPF000026C8:EE_|CH3PR08MB10119:EE_|DS2PEPF00003446:EE_|CYXPR08MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: df206c15-39c7-4774-c108-08de9f246197
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704161411799003|82310400026|36860700016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?1NBB2UYWTz03qDBikJeCnBTcsbNFCQJny5w7frHSZz8svDc0uJlGXnYLGoTJ?=
 =?us-ascii?Q?+AA9pzme69Ig013a+I6+BqfeON5LY20LhyuDU0munH9K5ZDS7yWzx0n3VtMc?=
 =?us-ascii?Q?SRjKm6BnV40fXub0Hh0MZTtl8G8XKn63V+H/DFeZF/JaQA8zAMvseWC+cALX?=
 =?us-ascii?Q?HTeMC0Dc++8MGDN/r15q59Laj+y3vrPLopQcL9lCIfTk/iN1G0Gq69/yxD81?=
 =?us-ascii?Q?4FoOwNqNtuvXYHZaxgeoLBvK/I4hPUu2yHrhQw3zjseQcxkbvAEYLEec7Qy9?=
 =?us-ascii?Q?vClIcQOzMA8eiDMDU/2WnBnEhlh797CQm6JHhZ3WtZ5O6Yxk5bJwESy29J35?=
 =?us-ascii?Q?x1O8tb32dcxSICGvg5ghWJLz1tBflnQUYYveHtzCQNfI0SA69qpHgtJ5ue99?=
 =?us-ascii?Q?Sj2vsV4+9fZtWSy9TtcOUpEvIErCYtiyRKg9QgOJKPVNrYh1Y+/c42M2i25+?=
 =?us-ascii?Q?bSjhOGSNCeneR29WRmoBDzNwZITx93DEUgjhWgYTCp/X8yUycGta3sZfiqfr?=
 =?us-ascii?Q?ybkYfyKsGspRxn13E03z4NnLvMUFdU10xVRYTOSB/Ec/oAlS7wXNsIu2DOou?=
 =?us-ascii?Q?3C4nNgFY+qcXDG4DC4jzNDv6lUWWZ0kjYa8tsWWTExGyL7vhCy12zrb+O+4f?=
 =?us-ascii?Q?3+1FW6p0Un5rQ057yljU1CMNPrBnpvvDfsUQkitOREKicLJYoHkQqnhlOanO?=
 =?us-ascii?Q?HG/qe90dHj3PFr8GI9WrESLyNQQfkj+wezvZKJdFIWv1eBLj8NmPNv4bfynw?=
 =?us-ascii?Q?idkvN8P7ID5FOL4cXpNo4N+v5vbe82NixtTiI4xXIdfyeOt1M0xStZnqHiSc?=
 =?us-ascii?Q?mT5BTzysW+5y5E/d8p5wDIBrVrz6aLkL7tzq/kSHNQ78/wFNkXFaxhdZrfZ3?=
 =?us-ascii?Q?t6bUDvHdCxY+tOVFOkE8gPbCVW9c0KcTekES+jE6JGTNx+cihDL7bWuPj4YN?=
 =?us-ascii?Q?n3E1f06WYy8gvAcm5fb55432t1yII0TrjicGWJXcKAohF49UOyZp9meJWZ76?=
 =?us-ascii?Q?C6VIFTLJSSxcYSXnZOvnOru8DfyzUilEPt6fbmP3rz8IOckwhhi3lt9/vZyH?=
 =?us-ascii?Q?Wnkxq3JMEqhyJZM73TU7Gts6Zn3f1J1IKcIs9cbXosmOuJBTgeYmUN8gESmN?=
 =?us-ascii?Q?kQrBzTQ5tsvl/WR/MRdtIWBHR4JzFREvy2tNtphCQswu7X3R/HnlpEU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704161411799003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 LDeCQf4qTWOWoLaKwLLRVvmfGam7q2i/AYJEwOkF8dXoWbU5p3rol4/8RNlmlMfflvFYPwZD919HBifAzz6xIgv6wohoozYpy4qRX5EOObzGHOafNFKnMF5+7CvE13uwcy6sJYTo8L8PLiXx3DrRJV3F+oGalsNYm0nx41yddk0jvpzadD12R1dych+Fxd8FdIIPKnfThabyDF97xcA7IYN33mIt7IqSAk/UlPpX0VDohtBsre6ZSCDaAY1jJ8IV/I1VFXCvVy9rdDqtVVRXKjONoDC83mSISIKte5bcDc8ecZPCP+1Zs5e5l7zrfUdM8AQB/zmdZRhsRpjJxO+c6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB10119
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.12.1];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.12.1];domain=BN1PR07CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d28e0a32-d628-4f1b-e916-08de9f245c5a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|82310400026|14060799003|35042699022|156008|36860700016|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hW4Y/U/0ML1c5FgWw5wAZxjPl67OE4xjhcUpyv42HSDwZ9yHRsH1YN+Si/BR?=
 =?us-ascii?Q?S+y9J4P/skvWndMPtyCQng34IynII746wQ3GjfD12L1ggrRPapcO4gY0cO97?=
 =?us-ascii?Q?p0zD9USI+j3lG2vF1fGZMA20iCMfR5di+9NXidUeCiRKbpRP62mFCr+9n5Nk?=
 =?us-ascii?Q?K8nStKk3FVy1pSkcq2oCpz0nsgu0CXYN3/Uwt81WqsyagS7ScKoVrRAVkUPP?=
 =?us-ascii?Q?QUH0C3UcR6s3XKjmdPJCFhdNlf44n/rcBhwn54jnnsstRnB5HEaGdp+gSXQ3?=
 =?us-ascii?Q?hhcg2soxZHKM+1g3uZtZcSiiwcz1EAbFz9clYZYF6Mg0eUyBEIO0NxZtxXA6?=
 =?us-ascii?Q?KIxvO0TIOs7xNW3vcId2U5/H4Ez+k5UZWA2CeHTrkjiZByGm5mYyqerchmjo?=
 =?us-ascii?Q?NQJJSgPcFOkYGwUWOiEO+Cze/CapsWCZgyb12EJYm8lhtpuhguZ8aW2lxmmE?=
 =?us-ascii?Q?u/JBcgg6SBFazUC5qsGvaH5yXpDobMzrM7aVdZTPHti+h+V1BddWDifYLVHC?=
 =?us-ascii?Q?kn7KAOUUlKAEFLYGWEEDNVZ7IgGSJVUuzfI4OCSqL3+NgNxjjs4Vh6Rsbcrj?=
 =?us-ascii?Q?sNBCrq6Po0qGy5Gefq+NxwmomRx4l2+fyiin+NiFdMsl/TBv84KxPy7lglaY?=
 =?us-ascii?Q?LIq/FDnexBm19aSGi1zGQ35aGFcmTTonZh1KWj1bIKvESI6U49ciaqAY7Bqs?=
 =?us-ascii?Q?Mg/xTtGHiuog1CBhMnSZ3XHB9iHEdrvwPiywrz++qv0JCN6qXt4saJZP0ly4?=
 =?us-ascii?Q?bSiyG8uP/ueb4HpUn3s2hrzmyvfQq1rz7FwS+MGSeiCKhQxY9VIpvkfVexYS?=
 =?us-ascii?Q?mNiBeUTq3G+ufykqNtAlzJ1ZS/MGtUXOx+V5q6ecGP+VB76lgSCUdVaFY9sF?=
 =?us-ascii?Q?n7XaScljycaQHjn6sUUYb+dNiZLVfD+XxGjdxxt5TyK6Sy5XLq1eaKjc9mkV?=
 =?us-ascii?Q?lQ3SzBu9bIzP5l6wZlwgDVoDcqv9I2grN6Tt6sI0lUYo+I7xQWVCG8JJCSNf?=
 =?us-ascii?Q?EfS2XUz6userfYCtbJtuQfXiWYRR6LG+HwS3wfCOuOhWymQNJgef/ccRo4ip?=
 =?us-ascii?Q?9kMefjxrUY9q4V4uK/ehJtYItMlCbmQZz1e/wxihbZS5pRQyCeEpNQ7/Calb?=
 =?us-ascii?Q?ZH0tvmLsIwzdi/yIZpcgIiwBdJQW1GwV0u6FHu0gtA//qvUPjDQcq/A=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN1PR07CU003.outbound.protection.outlook.com;PTR:mail-bn1pr07cu00301.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Rx9VxvU+hxbFvdWGw0wXufeQuF9vAWlBbYjUHuaJfb3vfBHGONdSRyZsbvdako15TW10dw0iWM9iqb/cV2m80j803wB1xxKSfSvkUe4xMEeXUggeclkgTzN/mXi/C6GgEcn5YFOox9HFilv5thVAyzE6GcKWv5xylj5qop6BwRwWjtqQAvSlO041flG71YXTy+zJesrUoS+Sw3nnXPPhXHzwoUkHoLltA+A3a5ctYmGWJ/oGUuJrnJM87zU8OajRodCxhKXtlIRjeArC+eOzcK0I4zsSG7znjn2OTOJSrTjiv92LRZjAYaMYpaTVyxkydKSuD6x0ghV+cwYAgLTGsFU2cRVSK7f3F/OjEdLYRb/SVZtKIEYx4ByOxsFRcy9RtYiAU4N5ItPuSFPdTQOJ20B9UDJmNDFVoPMn9DM6gsTu0igaL/bot6oKoOTQlSm
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:32:53.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df206c15-39c7-4774-c108-08de9f246197
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9432
X-purgate-ID: tlsNG-720697/1776720778-B3961161-CEBE0834/0/0
X-purgate-type: clean
X-purgate-size: 4450
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:proskurin@sec.in.tum.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.246];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 58D05434208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit makes the minimum required changes necessary for do_altp2m_op
to compile on ARM. All altp2m commands in the switch statement are gated by
CONFIG_X86, with a default case of returning EOPNOTSUPP. This allows future
commits to move the #ifdef CONFIG_X86 down as support for ARM is added.

Additionally, a call to do_altp2m_op is added in the ARM HVMOP code.

This is commit 2/2 of the common do_altp2m_op phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: Replaced patches 2 and 3 from v4/v5 patch set with this patch.

    Made HVM_PARAM_ALTP2M read-only, following the change to the x86
    implementation in commit 0291089f6ea8. The DOMCTL to enable altp2m on
    ARM is implemented in a later commit in this patch series.
---
 xen/arch/arm/hvm.c  |  9 +++++++++
 xen/common/altp2m.c | 29 ++++++++++++++---------------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 86e49bf47403..7c778795a280 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -5,6 +5,7 @@
  * Arch-specific hardware virtual machine abstractions.
  */
 
+#include <xen/altp2m.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
@@ -23,6 +24,10 @@ static int hvm_allow_set_param(const struct domain *d, unsigned int param)
 {
     switch ( param )
     {
+        /* The following parameters are read-only. */
+    case HVM_PARAM_ALTP2M:
+        return -EEXIST;
+
         /*
          * The following parameters are intended for toolstack usage only.
          * They may not be set by the domain.
@@ -123,6 +128,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
             rc = -EINVAL;
         break;
 
+    case HVMOP_altp2m:
+        rc = do_altp2m_op(arg);
+        break;
+
     default:
     {
         gdprintk(XENLOG_DEBUG, "HVMOP op=%lu: not implemented\n", op);
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index a43b3a3e34b3..6481fae1ed12 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -9,8 +9,10 @@
 
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_X86
+#if defined(CONFIG_X86) && defined(CONFIG_HVM)
 #include <asm/hvm/nestedhvm.h>
+#endif
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
@@ -18,13 +20,13 @@
  * - external: All control and decisions are made by an external agent
  *   running domain 0.
  *
- * - internal: altp2m operations are used exclusively by an in-guest
- *   agent to protect itself from the guest kernel and in-guest
- *   attackers.
+ * - internal (x86 only): altp2m operations are used exclusively by an
+ *   in-guest agent to protect itself from the guest kernel and
+ *   in-guest attackers.
  *
- * - coordinated: An in-guest agent handles #VE and VMFUNCs locally,
- *   but makes requests of an agent running outside the domain for
- *   bigger changes (such as modifying altp2m entires).
+ * - coordinated (x86 only): An in-guest agent handles #VE and VMFUNCs
+ *   locally, but makes requests of an agent running outside the
+ *   domain for bigger changes (such as modifying altp2m entires).
  *
  * This corresponds to the three values for HVM_PARAM_ALTP2M
  * (external, mixed, limited). All three models have advantages and
@@ -97,7 +99,7 @@ int do_altp2m_op(
 
     if ( (a.cmd != HVMOP_altp2m_get_domain_state) &&
          (a.cmd != HVMOP_altp2m_set_domain_state) &&
-         !d->altp2m_active )
+         !altp2m_active(d) )
     {
         rc = -EOPNOTSUPP;
         goto out;
@@ -122,6 +124,7 @@ int do_altp2m_op(
 
     switch ( a.cmd )
     {
+#ifdef CONFIG_X86
     case HVMOP_altp2m_get_domain_state:
         a.u.domain_state.state = altp2m_active(d);
         rc = __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
@@ -394,9 +397,12 @@ int do_altp2m_op(
             rc = altp2m_set_view_visibility(d, idx, a.u.set_visibility.visible);
         break;
     }
+#endif /* CONFIG_X86 */
 
     default:
+#ifdef CONFIG_X86
         ASSERT_UNREACHABLE();
+#endif
         rc = -EOPNOTSUPP;
         break;
     }
@@ -406,13 +412,6 @@ int do_altp2m_op(
 
     return rc;
 }
-#else
-int do_altp2m_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg)
-{
-    return -EOPNOTSUPP;
-}
-#endif
 
 /*
  * Local variables:
-- 
2.34.1


