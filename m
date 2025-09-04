Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFEB432C7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109637.1459160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3ls-0001Er-Fi; Thu, 04 Sep 2025 06:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109637.1459160; Thu, 04 Sep 2025 06:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3ls-0001D6-CY; Thu, 04 Sep 2025 06:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1109637;
 Thu, 04 Sep 2025 06:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v00W=3P=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uu3lq-0001Cu-JU
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:48:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b6d3993-895b-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 08:48:31 +0200 (CEST)
Received: from AM0PR02CA0181.eurprd02.prod.outlook.com (2603:10a6:20b:28e::18)
 by AS2PR08MB9595.eurprd08.prod.outlook.com (2603:10a6:20b:609::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 06:48:28 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ce) by AM0PR02CA0181.outlook.office365.com
 (2603:10a6:20b:28e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Thu,
 4 Sep 2025 06:48:28 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Thu, 4 Sep 2025 06:48:26 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9703.eurprd08.prod.outlook.com (2603:10a6:10:445::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 06:47:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%2]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 06:47:52 +0000
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
X-Inumbo-ID: 2b6d3993-895b-11f0-9809-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FDWs1mmGYOVJph7JVuuHIl9VdsEUKHM15lC/1LsYwFjjadmHqCmlaAcXlS6+hnvJPxzeIa+UGDLdE4qb3kZK+BI4JWgN6wXkBt7jUYa0EbSBif1APxwJNeZjov/s3/dalfcfGlR+964njjhQPjkP+qUdfD5RgynJRbazZlNaJ09ppiFXwbVLD6txvfLiwINhg649Zh1m+tU189JJILSjutj3ki697Vv7HzBcF5Cn78QSgEEqOdtuBFzn5Z51gQXDzD/pgTxx1dF/Zfy+k6X4HBfh6x28kbIbrCDz2Eqil/qaRTKfrBXpoSAxS/Db19qDQo+JmJgRChzlTPfCFOwRXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ttvx8c6sf0c2nXvr9jShfNp5pS2b5B7KdBzqk3E+vYI=;
 b=euOwY3ZtQ0jH+rKVDMKeRZ8SQApN4iP9KhB6yfPxhIRb/ugmX+dilzBR6UM8Z6uWeM92byiZx5MmgCIlzYBkNkeYIs7beeGhs5WAOlYPsPhbmJldyD1zBOwxRrZ0SRwyDSUob4DGQ7jqnrEzGp4/UdgnklD2Ek88rbaPL4MjG80HKRU3NKQANVmN4YNqqsXZnrLEehc+E1RwG6v/qzdDRyHeOb/sIxYtT/mpZxCo5eEiGAM9FTJgqe0LMQ6Z4C+4UIn4aiiCo+kUUR7u97DiKJl5XptG2goOH0rlvDBGCHXlfVWVrwAxPh7LVqNpUHQIPpOk08EUtc39Wra82iOCqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttvx8c6sf0c2nXvr9jShfNp5pS2b5B7KdBzqk3E+vYI=;
 b=VOx158/SVYC6FaREhVaWFskV+38uBbbgClFEVGuasI4YDmQQha3ZJgNXUJzTOtxLnpDq+b9Ahs7Vlcg07AodYXIFXdDwj8JkLfdaLa53FCfdS+DmQlmAYsvwGZsJPkyoA3c2ArlS1aNXsyrzGR7CKGmwa80K6kuSpTrIra7YNbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOV3S6xhry2GBTe/abxxYaDhA1CoM2uAYSi7q1ctWKFZnKQOVC0yc+sBductdEsgDpfCqCCy7D/mWO+GwOq/rvSyUAToBc+O1uFoJV1eKBnzOy4b7rHsyxE7nMwF5J0dMY4n/8g0nd7LTmZ+icAyielSu16vsBALX3MkrydB9xA9iBhb4Qc/TH3uu3P4zcmE+cPbm9lKArrHYg0Pj9APRNyW5pO/flcPzWgxCfvo1sladZeIQtlEDxBOVjDtaLYuFqLYU6xMV2sY1e2TfcKpJC0GyDddbPhWClCV37W5fKFVVDGWvd6TTZbTC/pRARQk6Q1o4nRV18sJb7Dto35Sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ttvx8c6sf0c2nXvr9jShfNp5pS2b5B7KdBzqk3E+vYI=;
 b=CKshwpaMCwAZYovvvTTuOKowGzRuB3JeRCGGLayiNgj67X8vZ5sQ7o0UyvRw1Oq4CeibyUdpWlpVXl96DvHHWgcMA43rF/Dv9xKceYQV2yxenqlbXExB7hysPAUf9K1Z8NvLcsiH/hWJr8gVBY2w49/+kGaC5ek1F7oE0vvV21UjSbLCc+JmyniZlJtcf/VHDbIO7bRxW91DWQ+G3DvUVrtpayuymm32583w1nkICirrCpU/spFAGKpOVbkYA6RFqFsihEeWQ6Mv1llK6FGI7fpIBEnYcTzi/kI78yIJB7VF2jjulnpqafG6JMHI0UuwQwEnB0UI9dU65+DoafcFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttvx8c6sf0c2nXvr9jShfNp5pS2b5B7KdBzqk3E+vYI=;
 b=VOx158/SVYC6FaREhVaWFskV+38uBbbgClFEVGuasI4YDmQQha3ZJgNXUJzTOtxLnpDq+b9Ahs7Vlcg07AodYXIFXdDwj8JkLfdaLa53FCfdS+DmQlmAYsvwGZsJPkyoA3c2ArlS1aNXsyrzGR7CKGmwa80K6kuSpTrIra7YNbw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dmytro Firsov <dmytro_firsov@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>,
	Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v2] xen/arm: smmuv3: Add cache maintenance for
 non-coherent SMMU queues
Thread-Topic: [PATCH v2] xen/arm: smmuv3: Add cache maintenance for
 non-coherent SMMU queues
Thread-Index: AQHcHQIn+C0aN53q3kCiWfPloZq/2LSClZqA
Date: Thu, 4 Sep 2025 06:47:52 +0000
Message-ID: <C59760D3-3460-4E21-843F-65077D1441D7@arm.com>
References:
 <6f4552aab3748ea3ad96d45affb8ce9146b557a4.1756922110.git.dmytro_firsov@epam.com>
In-Reply-To:
 <6f4552aab3748ea3ad96d45affb8ce9146b557a4.1756922110.git.dmytro_firsov@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9703:EE_|AM3PEPF0000A78F:EE_|AS2PR08MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 3604161b-6adf-4739-480f-08ddeb7f0cc0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?vsBOQ9r5O0cCPSpnKQ4sIbZDvWSCP9YfPe6IdUYuPGmvonGYepE/FnQKJOrp?=
 =?us-ascii?Q?ROyTs0s7+T0QFOofkuudHcTz9SXxT/Mwgg1Ajy/IyoeM69qcUBW0Mi/9ffLS?=
 =?us-ascii?Q?cY3aJwR3m8Qy9QkENp53TGqtq7Og4w39vPyU1kTrJgeBZa9W8nt9OcdnuzxY?=
 =?us-ascii?Q?Gv6Z+fAk57FNWY4h6OXj6x/Lbuk2GWIHR0dtufi3LuIJNAyDMMHD4gBwD899?=
 =?us-ascii?Q?FcCM8CndNW3YZyFtfX4pT3WmPapf0PkcrJpKCWtcZfl90Slz0QJBm90qXzrV?=
 =?us-ascii?Q?LEOn2z+LN6D2LWPtEKral+HupHDPHPVq85xYf7o+yvaMyxEA7/zTck/Kp7dr?=
 =?us-ascii?Q?uBkEIpaz6GCjvSatTkON7g/XwK1/tkYiaSvNq1Gnszg1+karhN6y+L+ZzydD?=
 =?us-ascii?Q?zGb2rI0AoR/+v8p7SzJIwX5zOM0k3HQ3QAtVbnxLNlbKi2yzqUTOQzUues0P?=
 =?us-ascii?Q?W/nme1IeKi4ZPltxZ0/vLHHT8AB+HEe2/FYfkha9+5LJo9qoOR4USntWHu+w?=
 =?us-ascii?Q?Y/C5PbnqBk5hvvLyqTnyX4D0WcY+gqhUDod6IX1sbOvXNflPFQtxw7DQykYq?=
 =?us-ascii?Q?0NxIaVf4HNZDmFvrrpeNlq1LRwXF2snzFUWDVfxMwpAEBKrfG6KFlsIUGlTS?=
 =?us-ascii?Q?0RUVoNHVJZ+hP3nR3l7ZfnrVXrb6XtktunRuF/pLlRf9Z45vAmCnMQlTyqV/?=
 =?us-ascii?Q?/Qb3nHX3uinBNfcXLC7o29Amil21V2rt2Az1YxmOAj25I6rrzcw2iFo7MnDr?=
 =?us-ascii?Q?GG6YUIxA39YGIioXQpG2H9fqX2Rvv9VmoaO4IcjchVU6KYROsl9WxDOhiOvt?=
 =?us-ascii?Q?VNZmiz/D25+F8/DjBbl46jjYSPclohkGixeebWob8rHiDk5HNVXYo4uKj4Tr?=
 =?us-ascii?Q?DlDzvr4h0nITd4Ybg+fPRVPfvbzS+OH3wYW3oslDH05sOGqcOgLFAvb9UVDk?=
 =?us-ascii?Q?K1YfFf1amZD6SMj2plj6LoLXAEIErzEeW/19/N90PLvJjl3bMo8CXML9vniG?=
 =?us-ascii?Q?HdpXTa2ov4SQbhA2MI34l0IMo36/nvSGVYmYamaCQaX5GGoJPYULLEOTFWcI?=
 =?us-ascii?Q?HcRHdNgnIzzB+hOo76jkQtjMIOZ9wBIRAeZ58TbtOZxmCBKP5V7FyCWjnwic?=
 =?us-ascii?Q?ddaLkgqDLUZawynBuFqEMN2AOeaqnL6vVKdT++MY3HmbZ6Gu6J48SuN4rZLq?=
 =?us-ascii?Q?Llyf5fXjHWDuwBNzZio3F3+DEr3ObfL/Y1YMh+XNn/ClZWK6Mk6CG70c/QJ5?=
 =?us-ascii?Q?nhl24zExSOcEfAB10v2oe4yCSI5BTn0rXRSqdITe9QpHQuLDYcjqMy9IbMTv?=
 =?us-ascii?Q?slOcFRViT5mMOPK52ifnlHecyEbQVo5fLjHn1xmtG3u49htMV9EArsSeAtsU?=
 =?us-ascii?Q?IbbUMQHCiQQlklamf/vLu+s2TFUyYf8ImUqwDsOdjmXm1zsru/QBDDFvCH/F?=
 =?us-ascii?Q?2pghbccKpEe5XUVZb/yXay8m0hrjIzw6TWEeEvzj81Qdfq36CMf6BQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <05F2E9B23BB8CF499FFFB74EB3862309@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9703
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7c47a0c-af09-4cf0-2f40-08ddeb7ef851
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|82310400026|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hiwy9rIUSvKT9xoWGiLq86xmXXtfDfT+Cu3Q8N5HPRm2EJHQy7R8hgPwgfqX?=
 =?us-ascii?Q?GbKuLcV7UmfLyOCetuVcNCMlSfL86Zx8Z7WHKEw+r34e85iw7zHaWOJ0NyB2?=
 =?us-ascii?Q?pTd6DtpsvTz6w/zGGN3dcrpu22aBk4SHwGBvjGhM11FOtuI9ROe4iQ2vqule?=
 =?us-ascii?Q?YLi5YkPpyk5ooRYGTwFGe9JlvOkzZY7e+ddiOX0EQfGvEod0xYeOEGBhP2Xt?=
 =?us-ascii?Q?AaNE0A3f+FvUN3md11M4WMOFzRux+L5eLkHzKZ6OzSI+iqOnXXt3uOWQiu6b?=
 =?us-ascii?Q?jiySU5bYG6MJhnZlQZXOkY3FsV5T4PhTo7kqy+VUFUzg/dje7AtDx4IM0Y6n?=
 =?us-ascii?Q?5Qfk/t/zKpVw0O5SkiAJ1JlhiZYLx99IT4FLR1nX3sjzKLLRne+z1l0sLCR3?=
 =?us-ascii?Q?57xMX88Z4ADmZE+VpXGJCXlfqPDDeReNJeo05VvYq6hdS3OCjDA8UW9rPWp/?=
 =?us-ascii?Q?MxYcLdiCJ+SIu4KO0gu7lrXHpkaU41VXDvbdoW+J17yCPcGVRizNcZGIRhQ3?=
 =?us-ascii?Q?bQKF1AHxNaiRSz0BGKSRzwY13qytDKiQKVjCu8nx3/paWBaJGZ6/7JlwhwKv?=
 =?us-ascii?Q?98HRDvMZkoWXBD8j8k8dcV6TEcfMLLY38udBVQ9yVblBtfC3MU78ioZ4mBKs?=
 =?us-ascii?Q?Kd6t/L0sCm8tA8nqOZg+cy332u12d6Wrqy6NOcvWitZD6QVPnVeP/J5FChqC?=
 =?us-ascii?Q?Au0HBqjaqg6yXxjSbb4wkzIdRqiCfrrml3NoVhTnoAxHyEDBy+4ECglyNzan?=
 =?us-ascii?Q?Q4NDYPdOfIOIabNPNIf62P6DdtKv4qxiWp3Y7JvSYSxa3OwEH/dud9sWhIsW?=
 =?us-ascii?Q?Ya3w1YjnKRo9nT12PMh7zEJ4nEo4PWdtlu4EuIESq10DvfSVj64UQuAkBwro?=
 =?us-ascii?Q?fkHptreVKujGQYFDg5MegMEO3awPArhP70g4etZGVWuPCvtr53OHWXEQZMDd?=
 =?us-ascii?Q?6etlvpCToBu9Hkq0Uy8mZqhxZOCQQDJ3/UzGrr5hdq99K60wwRo91I3Ehh+p?=
 =?us-ascii?Q?stSQl2dnBJtbm/vHzNoNrWga9Z8Fedyh/yDtGj9zt0lZGuzZRT3FoKj2RqF8?=
 =?us-ascii?Q?8EuYg6bVhPjoHF2q161D1GDsxGCk/xNQwzh2jJSt/aeNXiBsnLwtzwHjM15U?=
 =?us-ascii?Q?MhWJH9btiQKn2G3h5zeS9XllxP/BoCOfZE/qqcLbks7yyJVjvzuztq+dtT4G?=
 =?us-ascii?Q?EtvG34AAACGWMaUUI7Q/Kr0cxvaM/7KCvNtroalfiw8lWRk9sFaYpd5hfs5F?=
 =?us-ascii?Q?YLeHTzUDFhxzpkB7K+4MkaSlDsjaS9qO7/4trLDzfiqgMPDGunK+swZjd1dH?=
 =?us-ascii?Q?z0IvjoNrCyDxdyS8TpYgVdA5NBYJcFQST62ttyf03l0tcSaCJ5Vehha6en4G?=
 =?us-ascii?Q?rgrsGp4sLRisc3YtyEdxiOD4V7KJ61oadTaxsJLuf8UqaRq07Ecy0NZhys/p?=
 =?us-ascii?Q?hXBoHSpr1+GqiNfTgKMr72Dk9mSTFW2iMPfvVe06PRsVYuJBwKhNb82tjYAg?=
 =?us-ascii?Q?5P5DJ2cMyxJ7kxlbDEzf6Thyv30vPtzr+sPi?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:48:26.2799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3604161b-6adf-4739-480f-08ddeb7f0cc0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9595

Hi Dmytro,

> On 3 Sep 2025, at 20:40, Dmytro Firsov <dmytro_firsov@epam.com> wrote:
>=20
> According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
> SMMU(s) that is/are non-coherent to the PE (processing element). In such
> cases, memory accesses from the PE should be either non-cached or be
> augmented with manual cache maintenance. SMMU cache coherency is reported
> by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
> Xen driver. However, the current implementation is not aware of cache
> maintenance for memory that is shared between the PE and non-coherent
> SMMUs. It contains dmam_alloc_coherent() function, that is added during
> Linux driver porting. But it is actually a wrapper for _xzalloc(), that
> returns normal writeback memory (which is OK for coherent SMMUs).
>=20
> During Xen bring-up on a system with non-coherent SMMUs, the driver did
> not work properly - the SMMU was not functional and halted initialization
> at the very beginning due to a timeout while waiting for CMD_SYNC
> completion:
>=20
>  (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>  (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>=20
> To properly handle such scenarios, add the non_coherent flag to the
> arm_smmu_queue struct. It is initialized using features reported by the
> SMMU HW and will be used for triggering cache clean/invalidate operations=
.
> This flag is not queue-specific (it is applicable to the whole SMMU), but
> adding it to arm_smmu_queue allows us to not change function signatures
> and simplify the patch (smmu->features, which contains the required flag,
> are not available in code parts that require cache maintenance).
>=20
> Signed-off-by: Dmytro Firsov <dmytro_firsov@epam.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> Tested-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v2:
> - changed comment for non_coherent struct member
> - added Julien's RB
> - added Mykola's TB
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
> xen/drivers/passthrough/arm/smmu-v3.h |  3 +++
> 2 files changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bca5866b35..c65c47c038 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -341,10 +341,14 @@ static void queue_write(__le64 *dst, u64 *src, size=
_t n_dwords)
>=20
> static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
> {
> + __le64 *q_addr =3D Q_ENT(q, q->llq.prod);
> +
> if (queue_full(&q->llq))
> return -ENOSPC;
>=20
> - queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
> + queue_write(q_addr, ent, q->ent_dwords);
> + if (q->non_coherent)
> + clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
> queue_inc_prod(&q->llq);
> queue_sync_prod_out(q);
> return 0;
> @@ -360,10 +364,15 @@ static void queue_read(u64 *dst, __le64 *src, size_=
t n_dwords)
>=20
> static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
> {
> + __le64 *q_addr =3D Q_ENT(q, q->llq.cons);
> +
> if (queue_empty(&q->llq))
> return -EAGAIN;
>=20
> - queue_read(ent, Q_ENT(q, q->llq.cons), q->ent_dwords);
> + if (q->non_coherent)
> + invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
> +
> + queue_read(ent, q_addr, q->ent_dwords);
> queue_inc_cons(&q->llq);
> queue_sync_cons_out(q);
> return 0;
> @@ -458,6 +467,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_de=
vice *smmu)
> struct arm_smmu_queue *q =3D &smmu->cmdq.q;
> u32 cons =3D readl_relaxed(q->cons_reg);
> u32 idx =3D FIELD_GET(CMDQ_CONS_ERR, cons);
> + __le64 *q_addr =3D Q_ENT(q, cons);
> struct arm_smmu_cmdq_ent cmd_sync =3D {
> .opcode =3D CMDQ_OP_CMD_SYNC,
> };
> @@ -484,11 +494,14 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_=
device *smmu)
> break;
> }
>=20
> + if (q->non_coherent)
> + invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
> +
> /*
> * We may have concurrent producers, so we need to be careful
> * not to touch any of the shadow cmdq state.
> */
> - queue_read(cmd, Q_ENT(q, cons), q->ent_dwords);
> + queue_read(cmd, q_addr, q->ent_dwords);
> dev_err(smmu->dev, "skipping command in error state:\n");
> for (i =3D 0; i < ARRAY_SIZE(cmd); ++i)
> dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd[i]);
> @@ -499,7 +512,10 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_d=
evice *smmu)
> return;
> }
>=20
> - queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
> + queue_write(q_addr, cmd, q->ent_dwords);
> +
> + if (q->non_coherent)
> + clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
> }
>=20
> static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, u64 *c=
md)
> @@ -1587,6 +1603,9 @@ static int arm_smmu_init_one_queue(struct arm_smmu_=
device *smmu,
> q->q_base |=3D FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
>=20
> q->llq.prod =3D q->llq.cons =3D 0;
> +
> + q->non_coherent =3D !(smmu->features & ARM_SMMU_FEAT_COHERENCY);
> +
> return 0;
> }
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthro=
ugh/arm/smmu-v3.h
> index f09048812c..ab07366294 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -522,6 +522,9 @@ struct arm_smmu_queue {
>=20
> u32 __iomem *prod_reg;
> u32 __iomem *cons_reg;
> +
> + /* Is the memory access coherent? */
> + bool non_coherent;
> };
>=20
> struct arm_smmu_cmdq {
> --=20
> 2.50.1


