Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E1B05568
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043850.1413892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbO1-0006CK-7I; Tue, 15 Jul 2025 08:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043850.1413892; Tue, 15 Jul 2025 08:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbO1-00069g-44; Tue, 15 Jul 2025 08:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1043850;
 Tue, 15 Jul 2025 08:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1ubbNz-000685-DS
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:51:39 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac7e086-6158-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:51:37 +0200 (CEST)
Received: from AM6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::17)
 by DB9PR08MB9467.eurprd08.prod.outlook.com (2603:10a6:10:45b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 08:51:33 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:209:83:cafe::30) by AM6P192CA0004.outlook.office365.com
 (2603:10a6:209:83::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 08:51:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 08:51:33 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by GV2PR08MB9157.eurprd08.prod.outlook.com (2603:10a6:150:db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 08:51:00 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:51:00 +0000
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
X-Inumbo-ID: eac7e086-6158-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WXiRNQAxU2e5Guq6JBouLUhmp+xMvDM7RSyB19YkexIX0aHUj9pe9AfrRJAAOHokYVxB0t/eZ5Ve4beU3ppzFKKnPSGzajO052niulf/EeerVhQvOo3TGagx3H/hbHAcEPeeqRhQdC+ObiO+8h/TW/agLnv5+qd64Qi4oKQYkQVf39CEtbiOdQRwzOD6ivvdqV0j1shLZYRr03il58+tURi/VgR7BP2SntZDzqNHAD6tUA6LvaW6mA5oeZsL/jTa7Uq4fJjVKCmsCKvZWkiyytjZPWjcvM4NPN/RYrXfW99hdcuPSAPeHCDbtok0vRc6STop6QpqsE96W6pdVdfubA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU4XT7P5XCMUEYLxr8L9fW9zcVCpf+SOroB2IRxP/O0=;
 b=LAPESMofY6tohjvI0xAX09c1MzJXprttNthRl71MlsqHtDStWYLJ7WmxBPp/t+qf/wvOXXCgVau47bmQzmuN6YcYEskBnjNAEiP56HEtNmCpLXbKq6eGaapxqSp0czTFxP/Rwre/+vcF/+y2ti8q3WJoA7oiTeQ2UK0UoQaGSCH9uRYrB5iKPGqjzLgh0QL88XySF4BKVZk3fhxHHJWgJkX7KIqKQbjF5PYV2/6QWESg2CGL6FfZya3Wl1lMU/4UZhA2AaG6PhUYOuq0bSLWm+OxXa+TPxNVn1JpOk/9o3t/A5QQRTts2dmu/tAggG6q7g1IkD6KqOjBDsn8rtzZKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU4XT7P5XCMUEYLxr8L9fW9zcVCpf+SOroB2IRxP/O0=;
 b=Kpqc1l3ILra1sQhg6i3tE387KWhyppcvpgpOoylSyckvzIx30JEQ1oZlvmzdsvp0/3Qhar/ZCXcvRwg4FS3+3JzH9p5xB82LZ53DCFrSViLs3iT6KmJBzPQ5Hm+vEmN6Cf5lDdWwOslAGCtEUiH46FcWMR6tfm0VKLmPRwJHe7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/eDzPT7sUM14tb75qL09pQvNNNcfc0SVwt6PLWaQ3wwVyMNR7J89gqSPc5kVyB0q/4v+ZAoEQ9adIMxbYpD/0lFULjNVBrDJby6rfwMy6oJnyU8XeM9JDxaupFW5IsQuN9yoe/wkkjmrkr5633xesCugfYBloaAeRYh8wdXu2Omou/SkrNCIhcj/Oa3rfHBFWE9DeyDCoq2jfUEmFYrYMQKP6tR1HEWHYKzyTKR8RUyNxG2+dOOMTn1OXzt5KEPW7c/FFpux1SHJFCMQoDjz4uOt9DYncVSTpH2jBd5TxVRzOmtRyeZwI24zxqdKOvKPsTLebx083bqmF7X6rNEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU4XT7P5XCMUEYLxr8L9fW9zcVCpf+SOroB2IRxP/O0=;
 b=veYQTDrST7Dd6n1KJtGq/1/hwYHhkP3lF5OXvg46eO0g+f4/qGxL9U0hpLJgxkWcaWqNmyCqisk7gWceFP7G7Ljei4/znk+tBCNa/cZI7mV95TLwAoh+SzjPPWU5dOoWP33KG4u30JhUIZWrdB3m6tCKc32msDMVqhOH57Q2RK8gAenlwin9OZnXCVfhK9YBOQbQqZyA3B09X4zaO5QWyuIZuiElqUKy51h2ky4TMq4Fgf2DXaLsk5SwzZrroiUas60MgfTbI7ZvJYkUoLHqm22LbkF6CdAJOuRxIU/4Q7b9ps7MyH450GojW0Q8zrWvV2/qRH01ehVsxZrbLIWUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU4XT7P5XCMUEYLxr8L9fW9zcVCpf+SOroB2IRxP/O0=;
 b=Kpqc1l3ILra1sQhg6i3tE387KWhyppcvpgpOoylSyckvzIx30JEQ1oZlvmzdsvp0/3Qhar/ZCXcvRwg4FS3+3JzH9p5xB82LZ53DCFrSViLs3iT6KmJBzPQ5Hm+vEmN6Cf5lDdWwOslAGCtEUiH46FcWMR6tfm0VKLmPRwJHe7Y=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v3 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
Thread-Topic: [PATCH v3 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
Thread-Index: AQHb9WFmk+pEurGWy0mD0bzjRIyBMbQy4FyA
Date: Tue, 15 Jul 2025 08:51:00 +0000
Message-ID: <AEF47928-6662-4507-882E-C4000F62463B@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <fad3dbb1cfcb33b5b1fecae92f57a5883ad1c19f.1752565274.git.hari.limaye@arm.com>
 <3986f8e9-224f-42d1-84c3-8c171501dd62@amd.com>
In-Reply-To: <3986f8e9-224f-42d1-84c3-8c171501dd62@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|GV2PR08MB9157:EE_|AM4PEPF00027A69:EE_|DB9PR08MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 696c611c-21ef-4f7e-e059-08ddc37ccc91
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?kQVQAraWPp02uR+areGuyZm4SCLlvcgVX4RpUQKNgE3AM9XKR9wWSJzhqqwc?=
 =?us-ascii?Q?wl+qs+w3h0SqV29fdFUiuEKHrFJHWKK8vDb8HRGyZdmI6zcPaIiQEedPNtfo?=
 =?us-ascii?Q?UX/IXxMzxgnxAPh//imjLbjqNMoMQS5jxL80gzSEcUoSXoBuYMESxtMYz/kn?=
 =?us-ascii?Q?ehmGMRPWmkneCDtJ2cBnR5xFKH9O/s7sXxC8EFtTEAZmjEafkq21LsazBpSr?=
 =?us-ascii?Q?d78xp+lhcxao3d2esO7qlqa4SouWM+8K/P+mjQ/suV7S5Ew7icmZWVitP/nS?=
 =?us-ascii?Q?uW+kIDajfbKRceBVltftV+yIQ4pkqSXqpNiF7f9dl0/BtmAcyPecEPJKIaCW?=
 =?us-ascii?Q?ZvA3Inyu8XdHRaUgA/++M0OK3uP4VL70+q3rX0ls4JCgrXC3vD8SikG2kJ1w?=
 =?us-ascii?Q?1PYpQmVuGCg+J41i38Nsi0rv8vCg9h0IaDXkDOZyOqU1WQsao+/PBxIgP3VP?=
 =?us-ascii?Q?t/1aAL/ucWItq2oe16MsRC56lTKfmYfBZKgm3WPzYg8Dix/4gGqjPrP8kUgO?=
 =?us-ascii?Q?ScPiAnZ/CDbBjVbnH5sEc8CT2zm/Pbpa7+EIiW543EupgumRsay9Wju1X3TQ?=
 =?us-ascii?Q?QGSENw+lW6KE81UfO56tyA2PgklWKbIiOwzmbdrwvPXz1C2zUQIKgfvUT6Zk?=
 =?us-ascii?Q?8Z/W+zQXft7PlGt96Q8jIqFWW1x4PKImX+v3ZUjv/cNl/UxJrOPtg8ojRqVC?=
 =?us-ascii?Q?Puw5N45nHnHfLvGRFIp4cTfjjF/cjm05BH1sZtPxLSdD6DBnAsMRKswAZvOv?=
 =?us-ascii?Q?6o/uHPP6hNu8wDogEvJ2hnWE5ScnV7PP+igKRXC4RdYBdX423t+R0pew/6mU?=
 =?us-ascii?Q?6qQ87b8Jo9Fms6FuVFMsobNk/xjU0D2jMMhKgh4bHizZOvEvHdRGFiZ7fLSc?=
 =?us-ascii?Q?RIAfu0CuDR4s4VzZ/5c1d9ZaNczNxZJhrcIEX4NMXskBpC7sYAtxiG1vsQcf?=
 =?us-ascii?Q?fsRBWG1Yx3DWVgskZCGqycxrK9Mj1v057ZUngWUXAAKN+ZigCc9jljG6YmTZ?=
 =?us-ascii?Q?VGhbufYSgCclQYjr/0u0E5MoFlsKXMj4RvDClFM6BipZaLRpEb146BRd2v3B?=
 =?us-ascii?Q?FuFXcDJVK3YDe5PfryVjrwYrON1jR2h54HYzAwtwNCxy+1tCuH3b3ke7skGz?=
 =?us-ascii?Q?WV8UhpV3OdRuQEmaM2/hFVC0TIyZbt/nv1FJNkf68LYhRNLF5Ny/aJ6NeAd5?=
 =?us-ascii?Q?y0i1XLQxkV5Sw9+pRcmKccQUAcHwfdlur5LuUeeWB9fdibOoZlI9FCYKPzru?=
 =?us-ascii?Q?vCZDIsxGcpep5F2/tTDpX/0w1i5o4MYleJ4aTkSoiR607eqKtU5hwffT+pGI?=
 =?us-ascii?Q?aT2GhVAcFjZ3Z/4Z4diYl1pXtQIdbVmN+YTCSf8RZAMn0ZC9eWPZUhiX1ng9?=
 =?us-ascii?Q?7KbQRtY8E+BhOLW6Nrt4yejT3V81I6l4DXnoFaNOk/7+v4EDmx+r+h4aLf2f?=
 =?us-ascii?Q?eLYFBw1guD4BllAMt8OGyo5oby2kAVLNcDwDPjHjlZkJRJ5pfsTaxA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38214EF2E5497D48AC24ABA327639DE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9157
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f69d3b6-05c5-4834-4076-08ddc37cb8d6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|14060799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tg62fxAcNApOK+m4rzbqNrupuhaDIjRpfDyWJyhnwMHYkfGRmOBG1aAyQ+wU?=
 =?us-ascii?Q?GvwjpyQERdLt4cQQ+ChrKG/FtjSO93ThmneE37F0U1HT0mta8qQ4vXQGnS11?=
 =?us-ascii?Q?0u9L11rAx58+PuOIWqt//ujSzQrMZqlwi0rjzhQXJTU3entPGCBOodwJBvgK?=
 =?us-ascii?Q?94LXGfHi7zB0f4vhI+GbzV13S2gDi4jC9wZR31Djorf72mX32o8DhdZVC2sK?=
 =?us-ascii?Q?sEAYTTNDu69SYiC9Dlhb3LgMtypYM3Pf9/0PyM3yfW5SS3MDDXOEpsWy3Vx7?=
 =?us-ascii?Q?+6o+4eBn4kVZT50K7uvqaliLZoyJSVhdTdbqpA4PPoYP3fYmLMLbMymJcBKw?=
 =?us-ascii?Q?EoL5ta9KN1Yhn4Zg3GFsePbZGOG+HNbdladXqtW5lfDpJcvlYbprti/e1AMk?=
 =?us-ascii?Q?nWR7H3H6e9M1z7btUo/BTouaxTiEQobX8XRIRRRY5jq7GKG6pLOJUAOx2sga?=
 =?us-ascii?Q?tBD0QyGEOPu8yWQv90tHMKpBmgwckY9P4Ji4KlIgcdOjYbYtbqL8tEeA9D4Y?=
 =?us-ascii?Q?nFNO+2ENs6Ng26KY/ZB2wbml7lqHwaavrFa2fYWQZ8hEyZw16ruIn6IUgsd/?=
 =?us-ascii?Q?+/oY+gEV75Cnq2uKstPQ9WAJQqTq+al4wwWunMMQNBshrgMZ91jlb/N6yMPR?=
 =?us-ascii?Q?OnK+a56qrAR+0Ff7JnvnwbMmo0DOjPzRzoiuQyYnFKko8/mwX51bD+IGqO4t?=
 =?us-ascii?Q?xFHzRSPhJfVzg7EiLSR1EhiusNRu73G2sdD0H0+DgFlyF50IumpKULRC9cWu?=
 =?us-ascii?Q?5np1Xqmd0G9nP5C/kz1K+PIDaMFryFjAwg8oyxOSZ4Sb3ypOJby4GOJ6hNQk?=
 =?us-ascii?Q?zLhOeYmvuAQ1e9SpoQq6piu9A2vq5C8bTkoUaNJwwJY3nphBgq8irMfL0nRv?=
 =?us-ascii?Q?FdlXr0qH+W/ibcHXbgtDYJIELHNzGw7vKuaGCkKQyFWKOb1c7XyhkQLlU2jB?=
 =?us-ascii?Q?pvXlR0J8VkxnCVv5LjLShPpG5j0pOf91Br0VX1TTLRBgrr+uV/VuZOJZTzGu?=
 =?us-ascii?Q?KYZs79VObcK9g3GTV0N3sc5DykuEdPcUkv9jTMEbHkDrtXSY5W07xd1IdEKw?=
 =?us-ascii?Q?4+EHcBQtsDYtWVaIGKDyCU27qF6bBmmLtG1LkJk6xN0NAgS4gudoyPtXk4eF?=
 =?us-ascii?Q?h/dxs2UMmXhPpYGKW4QxozpBbANG+3UPuG/yskimDAkhL4lNE7QluJ7XCtos?=
 =?us-ascii?Q?EWZyri5Y6lB/JASq4dr1XcIC/zCLNJQC/zVp5547dqCSMTN0AF//V18YfnQq?=
 =?us-ascii?Q?m/BPOLdaabrZQBXHbrILRSRkJ49Tg5G+vnL7cb3P9SmOUx3euRhx2peUOO4q?=
 =?us-ascii?Q?7GAs9KE1ltidcyz2QSMo94p9doH7RgLR7Px3fuEJJRFv72v9+UAsYW8TaN55?=
 =?us-ascii?Q?Z25Ov7WKtj5DBxRequw8adpYjViiBOR7oT2WgsqJyJIwgZ4c7KVfWQ16lwT5?=
 =?us-ascii?Q?F3Dt731cc1JExg6LG/ay0Lx4eSKMKpYYwWGgB+bK6OWN0/bzx5MeROx41mD9?=
 =?us-ascii?Q?sNWmnTvV/OaLX6+JE5WmOlOLJY3QwVJylgij?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(14060799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:51:33.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696c611c-21ef-4f7e-e059-08ddc37ccc91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9467

Hi Michal.

>> +    if ( base >=3D limit )
> Given that limit is exclusive, to prevent empty regions, you would need t=
o check
> for base >=3D (limit - 1), even though it's not really possible because t=
oday we
> require page aligned addresses (limit must be at least bigger or equal th=
an base
> + PAGE_SIZE). That said, it can change one day, so I would suggest to mod=
ify the
> check. With that:
>=20
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> ~Michal
>=20

I think that this one is maybe also fine as-is?

Cheers,
Hari=

