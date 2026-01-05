Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A429CF2AD9
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 10:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195138.1513115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcghX-00072r-13; Mon, 05 Jan 2026 09:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195138.1513115; Mon, 05 Jan 2026 09:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcghW-000712-UC; Mon, 05 Jan 2026 09:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1195138;
 Mon, 05 Jan 2026 09:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdeF=7K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vcghU-00070w-Ls
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 09:16:32 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384709cf-ea17-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 10:16:30 +0100 (CET)
Received: from DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) by PAVPR08MB9185.eurprd08.prod.outlook.com
 (2603:10a6:102:30d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:16:23 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::2b) by DUZPR01CA0040.outlook.office365.com
 (2603:10a6:10:468::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 09:16:39 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Mon, 5 Jan 2026 09:16:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by MRWPR08MB11828.eurprd08.prod.outlook.com (2603:10a6:501:9a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:15:17 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:15:17 +0000
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
X-Inumbo-ID: 384709cf-ea17-11f0-b15e-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HFHtk6Xfwx7tFlVt2IdlxMlTLAmnSjq9bsoFg3FVcURS+lDjbRK4XWQryRgdCspiOe1B8puRtMAHIJ8SzQOqfdxVEDctnp4NiRbDKrPowBaPeNjvMD++ES9fVXuWBIsE4va4/+nUiAjhQTuc3OmoAE9sVyu0kpIGV/CboU29gFNHdHyiJz1qMyr7i+lqLI5sh79P1VAcT+lQDjad3IaPoiQ+47gf6ljPNtXzJJeDCMAeAYBh7iMoUpHuSW/OdNULkQiXU24lQeoaHa6iR7u1tlgPKUBqU8iT1iFwKHAZ5lSkaa16O+nZRIQHBJfGjieYtEFVaCxgLBzD6ouCb3XPKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOJU0ZwIPPkllI4+3caktRw115EKGzLiBmLFkOAAD00=;
 b=Oc72TmBe0qX52I9yMggK52yh2E0LZ3oMmAIHlQcc0PNIk52F7vWTa/Z2fpNOchp0LrO8ISm4yWR9evH2uQP6jxQPxQlr2OvloTYOSkqDh34BRBDXHhLi4kziosyl9KV3GbdgGTXksGvSGHBbPW3w+8jhDpUa0IwZ0X/YYASNm+esL44ZVW9tVIj1F5R1/I/k+wxrsNNeqdNKfB+tdeLRMCTGYp3cO9DNqZdkfeOcNuLZvDKyzkSYuEMFCll10EMIn3Nv1j3Vmr4W49nBuz06jlZ/WVckvRXxijQUOLgi7Buhlq6IJO5X0Yz7+v51rCeAMutGVHcQrsjfSqEVuBbF5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOJU0ZwIPPkllI4+3caktRw115EKGzLiBmLFkOAAD00=;
 b=EtzLvFHIm3PeF13yqg1mKVkKlbCTTU5L6JiILq4f4QbLOs0kKeFDVTQW3xWtR/prMgTxCuxFMsvfqBaebVERK6nwjjb6pu6yjszUlXp7sSma5jhSdIh5LLCo004d9TEbrvgsRfuh14lW1EAls8VyLPyOzEiUTGKVC7h/MQc8TKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5KsgNWCF6IKl3zEy/I6XS2EM1/x6vUGFWvx/USQzSVXZ01F0Z01yptYSdWNFhq9qKexbiijViKr1RY0qQjzBaM6Hq3lSFbr3VJsKYvY3VIJF/KGEFRf9OAWXHsky7Lm+irkxxokVls161sdZwd7MPtPrvW4HT/mHW2ynWq5FhjvA2JaCeAR3m9kd+VYmF7QePRoH7fyqnZ+gw1VT7fafOK3S1jbD4zRy+uns3ycZ+JXXr27EFgWxd9kkfXwXXYct0Ll6GnXzXoJQ93znzPguWmq2SklgtObsCHxUQAYky0si30ys754yO4evfu9amAA17LfdIQ0HyhLaRE48IkTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOJU0ZwIPPkllI4+3caktRw115EKGzLiBmLFkOAAD00=;
 b=jWFaH2b3WKFgaaA80TdIPH1w6OrLFvYORHdHge61Xs06RZ3a5of57w/wWe2CXLDkGtL6yhJaXmRbpeLvg1aJm3Ppy5/5cDIS+qQVGR25xt+wrlQJ4q6ozIwZUi1ZLobti/nML+sMFzr/cCbqtLA/APP7Cf8QDPiZQ5biYqLDHuWT/UewVAzbQzNHhEyjkFRje5pbHdY+VPAXUwDpdxQjxgGqvmJJOBAJDOgmFSjCYRR87DHEGqBzURBOD1BkMGVU2J5HAfPzDtEwCRGVUmuMyeKUtiX7tlBYM6E5h/pMwZEkweKmK2so+hF/66e0HBUiNXzSr4djCpdmPeURpnrjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOJU0ZwIPPkllI4+3caktRw115EKGzLiBmLFkOAAD00=;
 b=EtzLvFHIm3PeF13yqg1mKVkKlbCTTU5L6JiILq4f4QbLOs0kKeFDVTQW3xWtR/prMgTxCuxFMsvfqBaebVERK6nwjjb6pu6yjszUlXp7sSma5jhSdIh5LLCo004d9TEbrvgsRfuh14lW1EAls8VyLPyOzEiUTGKVC7h/MQc8TKw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Thread-Topic: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Thread-Index: AQHcfiO80ZeGSKmclk2/0HK7x9tq5A==
Date: Mon, 5 Jan 2026 09:15:17 +0000
Message-ID: <A6F1798A-BDAD-4FCF-A473-EE9B8DBACF9A@arm.com>
References:
 <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
In-Reply-To:
 <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|MRWPR08MB11828:EE_|DB5PEPF00014B98:EE_|PAVPR08MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: e2372975-7704-4028-610f-08de4c3b180d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?JOalNdXt64IkkmEgKThr0UbuXJ4b1ZY9E6r3iPR+gAmMveXxtNt2wbYm/AGT?=
 =?us-ascii?Q?+1Jc2ILBvoQdyOKOsjGv83Ty9zq5R42QHnrVmvoevTcD0AIL5hlqGv680MhR?=
 =?us-ascii?Q?LFihNcsWxv6tv4uKhGJ9HJVTZgzOgf9DhcvXyTYej4NHkOKHr/UeliHhPmYA?=
 =?us-ascii?Q?4a+pD4hVIpwyoS3drIJraxFIEOARFMJqs/jHwR8szdhTJafriJNFcG2GxBxr?=
 =?us-ascii?Q?82NnFAzHyi9v75k0S8tK0SsvC6itDbflF9hI8IKg/2AHkWhsobAcOt8ws2YS?=
 =?us-ascii?Q?qjuTCUKjhQQM/YLFAJzk9DDwVs8vhJnq+jAGH83CrFW8PwuQxZSf0ryz1P3o?=
 =?us-ascii?Q?W1659SdKBCt0fodvlLd1HOWv/eFJBeLWoIOjNcJtWU9DRPCVJIgwKJ4Vt4oc?=
 =?us-ascii?Q?LxeAEx3X7aeshZASJyFvrJfXkxUPPQ7/D8epBQUZ45IgwkHq2rE7TpmnlUFA?=
 =?us-ascii?Q?SqcvFlUhkJKiHA/lZmaLSwouNW0KMXf+foi56dc9GWmffN7beSPquworSNoj?=
 =?us-ascii?Q?Y3IemTXYg6SvJ0Dyk6UIAcUDXJUCX70XRWqW3IZxzQ3k7Mi/8khOGS3Crr1R?=
 =?us-ascii?Q?X2Bvhhp3jjK8T30UYvJDqI+9B4EPp9U6y2j5OaZ0uywK7hLMm9SfWtSuJQUM?=
 =?us-ascii?Q?PbAudeUwLp8eWg1lxB8Qt1aoOhe+jJRxh/h7f0w9ctjciE1vjdkDT69TX3gD?=
 =?us-ascii?Q?ArOWwy9Qnle4blX5fNLNt/nvg0+RST6Fg5tL4KQRr+8FSAABbFTjEzsJbGW3?=
 =?us-ascii?Q?H1PyyLPBbY6tjB8wqsxVlelexL4l+SdSxjp3qTf4+48sACDzunBlbad3CQJ+?=
 =?us-ascii?Q?wBV8CSG3Wv+/69W7GyIaQv0SC2XwZhzkZLHOIM+059425IyTp/gpcYfL3J+O?=
 =?us-ascii?Q?0CHXlCiulZuL7WoNygWIg+6JxOylQz4h+ltN2CvaRVuYHEhw9oWclv19CMkt?=
 =?us-ascii?Q?j2KiB//zB9D/njamC82/u1C4oMHbfvFBbenb69RRb30h01LvHRXRzFdFi4HM?=
 =?us-ascii?Q?SYaQfSXUcvzWAlisLZllIOzmKfD1ccOE4GMG9gkVZnFiKcC7rz/HQ9/mewTX?=
 =?us-ascii?Q?rfUTNKvvMUERtH8WwwSaX5VgBtzfgIQji0ZGReQ5bd8yNoZOvnkdo0ATn8aT?=
 =?us-ascii?Q?Xia1dJIhzuc969Nk4sDA5v2B6e0vVqg2xk4VS5EN2pEg1b6DHQeidL4jk3kC?=
 =?us-ascii?Q?GIMJTPdUJAGJSToq3ZoqLl0tzZHsCRSGeAp4DUGocU+9xs+YRpnkqsP17g4n?=
 =?us-ascii?Q?9TVjNZsTjQ7ZEglgZHR+IM7YAsh4ATI1ybm5MxgTsXhabAxZWRH+JIEpTPs6?=
 =?us-ascii?Q?sFskRMcB2ftNDtC/DvLsinHsKFZzQCLjbzSlryenBuXvtJrNXj6dw8PFns1F?=
 =?us-ascii?Q?4xBVRDINKXycbsbitvv/6haC8BM1+9sTS17WFW4hhEsOpCZfa0+Fj9kGF81J?=
 =?us-ascii?Q?w2JgAGzuh/amtmZc2cXzwtj37ACJ5AMN6PuSgtraN+NUKZN4EAvqgFf4Foxa?=
 =?us-ascii?Q?2qJVSy3Vrxk0TwiiaH364l2VPf9WzaQudV6D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F9D7965CA59A448B72CD21A356F8FC5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6709afd2-bce3-47e1-a6b1-08de4c3af15a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|14060799003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YvXBA0PPcxjRBJr98zUI9Hox55AyjKW0wG0w4YMRMyp+4GoV+FCVbbhxEhOK?=
 =?us-ascii?Q?Yy4RRciykuXc6UA0wAGJ5CqOdQDnkcVHXFwvjLZtGCyZUuIJ7kiCKsFHSuEp?=
 =?us-ascii?Q?BF+eNJwQuGUZa8JEWL16R2hYdYUG9qCYBzqFCbXMfIp32OrOpDHFTsMv429l?=
 =?us-ascii?Q?yPLcEznDRGJMjYBGbv/bz02O9K3fSM9KKXxHVtFpu4naTTzhI6DQJ/AHOm7J?=
 =?us-ascii?Q?86pHl/cfVzluJlaP6seozwnMJm5v9wqwJts4Ww4lWjvQrUlFH8BBlpTtbxvo?=
 =?us-ascii?Q?cTORvaCsZzgUaBo+xoz451YzYzDlGaQOEUwqiyBd1Ie5puSyzTfnjwFfbJTb?=
 =?us-ascii?Q?G4P5gjaryxVdwNFWB3X0OIKu8JR0x2cUUWE/xwzs5Wlm0d/5x+re7w4YIrsp?=
 =?us-ascii?Q?njiGTqBrmKdIjPnpcVaRgrjaf8nJ6fFWgYuDxfkaLcUuchln2DqbL1wTitJn?=
 =?us-ascii?Q?zIhvA7G79JStkUDjy4q3TaRR2j6E7adtP0nNBbmITpk7d2DgM0tk0uRwd53n?=
 =?us-ascii?Q?Yd478eddpwgEQFIpYS6zLHPBgHMBUzHCrpYGmc+fyryVbmo11YUlJl0MgJHx?=
 =?us-ascii?Q?Gb1679YlHUZvIt2233UTw7vhsMiv/dxlLkeSc1KnGSrUg4qGzt5qQeT17Gym?=
 =?us-ascii?Q?UtqjbttMN0j53bE83dmpMEFHEfHC2B7ZnJ7jbHuvxqa6QlD3ao92/Kwlimyp?=
 =?us-ascii?Q?J7eVS3SHYf9cnDggSbQhA/VSPvn/I6orHN1SxAJzP1X42TeRFA6+tJ73TpUh?=
 =?us-ascii?Q?W4veEU1g/+ALi1YOMLiHavEPCuTQ6M5cV/RHS4wQpJZXmOXcA6BqGq9E5LTN?=
 =?us-ascii?Q?I/rDBZIIevnZBFP3R97J8YwNsAt+ysuuTHNjq6d96FwVjyhU3Sfjan98FKtf?=
 =?us-ascii?Q?rKBNrel87qlKyFIKy/pDA/3eQgQNVX+9Bo3noVkiV8GZq+/yQJkAMT7cbYdE?=
 =?us-ascii?Q?k8fbcgIIRp5YOrLIsjqq52IA2909Tp8ugmovy2Kw8aHrzHGoSZstLXcvru0l?=
 =?us-ascii?Q?aJvPe3i+3w2YUHQ8E2zqU8Rm5UJdYsU6692apHjWAlg0/MaZqWgD73EfbRVr?=
 =?us-ascii?Q?KLAleBFm+60ImcCq3ld+o7GynZmZWQ1Ooi8NnBh2OmjoCOTJblvgW0xSLjQQ?=
 =?us-ascii?Q?j6OedjVP1YD3JfiJsTXtvcRkyWD5jEl95UxPvV4vTzKaPi8Te3ZU42qhUiMp?=
 =?us-ascii?Q?ZXXtKdHGlcyAxmATBKhdEwmXFwx62aIW6uHM1WfHzHCkqi4q5lBMwINOwYA8?=
 =?us-ascii?Q?dvPDkEIX/De1LBD5xOvcy0BDLS71wVMmtgYS7+if4yvhIxDepZw8pXPozj5+?=
 =?us-ascii?Q?i5GccCI8CIBN4f6Ceekt1PPcbj9Gdq1ZGIkBp0jxYZJH+CxRAtLdBZ90BJx5?=
 =?us-ascii?Q?VAE3HxWlvDhDFuDi9OrzJvwCAkIr96355BfSvutJfAPCdA2Xpd4uXW06nFCi?=
 =?us-ascii?Q?Mccm/eAjSVRXefSKzAw3anY9/LXQ3IxeQydMv91MlLHPxkjL8tuar0e4LjVA?=
 =?us-ascii?Q?zBmh9JDmfFnL4GCz+WukB7kgcTIo4TNr+h1TaJxSROnb4p+D/7W/E5k6woX0?=
 =?us-ascii?Q?7UTbSKyo8A0ZzoVqhsA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:16:22.2445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2372975-7704-4028-610f-08de4c3b180d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9185

Hi all,

> On 9 Dec 2025, at 10:37, Bertrand Marquis <bertrand.marquis@arm.com> wrot=
e:
>=20
> Force ThumbEE support to not available in the version of the PFR0
> register value we present to guest.
> Xen does not support ThumbEE and will trap all access to ThumbEE
> registers so do not report it being supported if the hardware supports
> it.
>=20
> Fixes: 5bbe1fe413f9 ("ARM: Drop ThumbEE support")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> ---

just a follow up on this one, the QEMU bug preventing PFR0 to be trapped at=
 EL2 on
Arm v7a will be fixed when these pathes will be merged:

https://patchew.org/QEMU/20251231170858.254594-1-peter.maydell@linaro.org/

Cheers,
Luca



