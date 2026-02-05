Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOeEKu5YhGl92gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:46:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09AF001C
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221628.1529808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnv0L-00054g-19; Thu, 05 Feb 2026 08:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221628.1529808; Thu, 05 Feb 2026 08:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnv0K-00052u-Uc; Thu, 05 Feb 2026 08:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1221628;
 Thu, 05 Feb 2026 08:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnv0J-00052o-0H
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:46:23 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8fb636-026f-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 09:46:08 +0100 (CET)
Received: from AS8P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::34)
 by DU0PR08MB7638.eurprd08.prod.outlook.com (2603:10a6:10:31f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 08:46:01 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:31f:cafe::e2) by AS8P189CA0014.outlook.office365.com
 (2603:10a6:20b:31f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 08:45:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 08:46:00 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB9886.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.18; Thu, 5 Feb
 2026 08:44:57 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 08:44:56 +0000
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
X-Inumbo-ID: 1d8fb636-026f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x940C17GmYQo/P3WskN15o1FJ7Fs7iCCupcfOdkPcvsQreKOPVzSIVH2k5a+lNYT3cN9aceUQU6rP0I3/EoHs1rbsh2PEBRJSpa7zI5pTGrYwqq0z9RnllcBKONkybz1gyQC/HJTAI06HPwfcSEV4l7fAQrJfX60Ml/SFBEbzi/S0lfmXzARamdV9SvY7PjB1ozsIQwXCcI3DHuJ9r/boSQWpShh1IeMQcB3uRViRK78gtAdurtzPxTH2i59t/iRonxjUqCwJHOw1NDvKFSxAbwGcnlwzzMsVrNw7ZSvt7AN2YuUYM8PTFWE5rGgPCkScMcgUs1lxYPngnRYQfoqiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g41nVjpXKxv1UvoojrffIh2ghtB254Nz95KkWX2A3cA=;
 b=kB28ma2DjVlxRx8IKusB4bEBC17VbvRB7FCoCH2OdueN1rdNN5v/+VHUvr6E/4k1d0iSINUooHQC0mjepoeLthS/jq4g9tzMGg6HVgUta4/zs0c8lnp16C3xZ+FVF5beS0xgMse+7N7p0h2VJH0zyQQ2RCLJ6ADhuIb9DYnZoqPJ0Ra+yVJl2udPYyr318WOVxA+x9XDR5cPzdkyYTW1eqkaGYosId0hvsbdrT8KY0zN0Bq/qBzvkDsLerqWrMEcT1+99H9hYmTR6AKhdKHGQUPZwfnE1RSN6l2UToIT6v6ximGDLE0XH/Pu//+MfdH4wlIvVa6cOd+aRk2VcjFuQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g41nVjpXKxv1UvoojrffIh2ghtB254Nz95KkWX2A3cA=;
 b=SlnCft6lei768ga9KgZ/w23kQeax+aPZcoR374TiSz8N9JtMj7Cb3Wb+qnSnd9cuekPoiRizapA6H7m6QSQeDCuLDBPfs9nqpwz+jTtlG8KHRTrd15MlGkGDsen/9H2qsFfLjFkqaBWKG5iFcWx2uY007lU+ghKhB/zKgnqcVD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0j7YwUAgVebaYjpM0NnVWEXpqo6v6WE4SlI/5WDWeZ11SSv8V4BPUmuuTCRWaXjRbn8VaYAylxuDgYqJyh3kDePRelT/Z8JhnfwiHKBTNWpAm9LZp3FrC5SRta5Kq7TFz5pluYrTTlnwokgyIauP7bMveq674RF6KBcU0DtSaYhgYxjOtZcMDXJFIm0MKhjJFBJFECBBloVlgZdO99wg07MnfbK6oAfVucJtEnLurglfT6gDwAi2eviuWz2AcPYEeLgfDy90qky6kfbrVebGOZZysykw+krUYbjXQvtNq1dHAeOdTvGJM6keFJ/o47lpoEPnFCqq3NYPO/kEpGt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g41nVjpXKxv1UvoojrffIh2ghtB254Nz95KkWX2A3cA=;
 b=j+O5RulMAo6J993clwIS/4aG0nBfB09RORZAVw9/WvgN5h97oINVOfBby5FnvXcCkLAfSnt+EurIvKGDZdGaX/1WDv16vMVC1BODxfoTz4XJ6kLdNzvtvebBtwsQ4hPTn2wKZVLQhIBz3PBprrzjfeF1FXw7NIzMpTMR9VnuXMHJIttE+RPR1fQbYG/H781e+Og1OORJbgCyb5ZAnkHj0sJ/kWOTXribudRTYedg6YL2H9TkDL9atI+z/a/bnKTxv8vI5lanOqSULy1xU3YaotwnwZVGLZWwdGw1njPZsPWRaiZnnP62DvfjVi9fVG+mJdMejIPjD+B19oQEGwtOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g41nVjpXKxv1UvoojrffIh2ghtB254Nz95KkWX2A3cA=;
 b=SlnCft6lei768ga9KgZ/w23kQeax+aPZcoR374TiSz8N9JtMj7Cb3Wb+qnSnd9cuekPoiRizapA6H7m6QSQeDCuLDBPfs9nqpwz+jTtlG8KHRTrd15MlGkGDsen/9H2qsFfLjFkqaBWKG5iFcWx2uY007lU+ghKhB/zKgnqcVD8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Topic: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Index:
 AQHcldiTYCc32vRyb0mp6O53Aox8PLVyquQAgAAD9QCAAAhKAIABA5IAgAALHACAAAXaAA==
Date: Thu, 5 Feb 2026 08:44:56 +0000
Message-ID: <C8CFD80F-057C-40D5-93B4-176F3D785C44@arm.com>
References:
 <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
 <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
 <65D4FEA7-DECD-4DDD-B119-4625F72ED585@arm.com>
 <eed4bb7b-5836-4345-984d-c542b9f1da34@suse.com>
In-Reply-To: <eed4bb7b-5836-4345-984d-c542b9f1da34@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB9886:EE_|AM1PEPF000252DD:EE_|DU0PR08MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ad0e5f-2571-4b28-49f6-08de6492fd31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?tG6rhKPcPICruIyJH/geAeQMnoiTT5jREjrDLjUw6tDnjJ61G6dTR0Kh0s?=
 =?iso-8859-1?Q?leeO72F+C2bmfseIsfYh/2qxD8dIf8aV0Gj6jr6XuNnZvAXw1xScpPhTjo?=
 =?iso-8859-1?Q?Doch9BihfArgatz5g3NVMFfYo4XrDwiU/1Nffbk6B6+AKy3M6DAXvdhDlt?=
 =?iso-8859-1?Q?WDclpXauFhfHGE6t9S4HHbbtSUYWMo73QFyXvHOJRq0c4MLYk5AdwqvzMr?=
 =?iso-8859-1?Q?Fi9Bd4Vf3kiaOaDC8Xsktgw3aUtLVyGCBnKkmP+NOdZK7/fYAIVE2+7bkz?=
 =?iso-8859-1?Q?mEu6u8g5yJ6WQ4JxwcABK4AQSZdsJpMNwwOYSFZJKFlQoNC8faJcRigvFH?=
 =?iso-8859-1?Q?LYHS31RzRLG9jgS3/d7nPi1hRMaXwTWK6JOoDR0QxSyoFHGItZ0wbyJdpJ?=
 =?iso-8859-1?Q?ELbh3DWLMBpD9R12Z/haXPd31OVlrtbRdXx7Ecpccg1WrkwDgc5wI3st+0?=
 =?iso-8859-1?Q?Mj6PdX86AdZ3EzzlJnome/DhPmo5Kay3p1qNxnkxv5sx8k9jVCJHLaqNP4?=
 =?iso-8859-1?Q?LyQBai8ZLA0ntoZIsfJ3BstgEE4j1AKPVn+EV5u2QOltQ8gce5/DaGtOeD?=
 =?iso-8859-1?Q?1Cvk3RUClcWF5Cpo7kxqUCHU4p9QQqdjNolV+2EpBH0NsjQq7Bwd3szp7A?=
 =?iso-8859-1?Q?z5V7f6nujKO9Yx2TUstWIZxqwknnJUaD7MIKq/kZGUe3jBCZTsLe5n1kqS?=
 =?iso-8859-1?Q?0f1ibIddRWPi3a5SvtK1BUVTges38+eZSq8JAtyc3WMaaM6QXEF/aXe3Ly?=
 =?iso-8859-1?Q?jTDJIhDBGghSRniIftekb/65DKccmsliIeDNEJeEP/EE7yX/qVRinKLb/g?=
 =?iso-8859-1?Q?7PcCKaBAn3FeU9vZPClN3z58ukajtITmBPnRi7zEwNnlslHrMjFwFXTBMN?=
 =?iso-8859-1?Q?0FoLPiODbxpO9q4XvfjOcGzK0VeiNQzz+YMj2jOJ1GN4hwMgp1HPNzr3vY?=
 =?iso-8859-1?Q?8oNKqnRh5dTJCHuPEjVlwNusMNiugHZjOXWUiSZGzE0XAcddttC5mXqDzt?=
 =?iso-8859-1?Q?FGWqvPKcl21CM2RP75i+auhOdE5XfqGnqk4pUN/8ic2+I2O41WH5xtBsOF?=
 =?iso-8859-1?Q?vmFOKGNx+YsBN75mXtG4Z/Hbj6XzP2L1ijg6HFLK2WmAqQfI0//y5MNFeb?=
 =?iso-8859-1?Q?MaW9vSwkyXZ2YPZhNyE7mBLKG4DEOWJ3ed4Jo7VJ3+pVoJFNb0JP01MRj6?=
 =?iso-8859-1?Q?7xKX1+WAafZtguwA3u7UUVd4MslA5USgc+36yJAu2XxHmEYgGUZA92T1RA?=
 =?iso-8859-1?Q?oSuPJKoaV6GEnQ+7+L/ZILSWZ084/oO6RlDhD+d2rLa7Y1QegDlu+ivvX8?=
 =?iso-8859-1?Q?PGnyrDHjsWUg1mmMn7uxY+H383vLDqchAHVzgGQe6AZ9cEy3jHSREpxk/P?=
 =?iso-8859-1?Q?HWul6BnpU6QD7PvY7PczTh5ezuqzUNWu7BGvfaHvNFT4DJ6kevjrDUdE1e?=
 =?iso-8859-1?Q?jHjG7vzeRiu5SpaYPmtfbMei+zh+G0sY7pBnLpD++PEDP70q5iBYxrtA3d?=
 =?iso-8859-1?Q?0DWh+hGCEdkz/Sm0ilZPiCrOzj3PXvopGQXRW/RI6vJd+YNocJXqy6f6av?=
 =?iso-8859-1?Q?de5oFJAhiFp4GicQg+BhLLnYTDwWLgs7E6jBzW8RrLvRQHMVzgFe64oxQP?=
 =?iso-8859-1?Q?qm7Vw0JKcI0aDgvNKdiWmPOv9Zt93TDg61uI5OMgjg0bl37z8jhEmNt9w+?=
 =?iso-8859-1?Q?OO8Ja9pUWnBwvGm9Dqs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <39EF104522013C4BACF84389E1D11743@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9886
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c4a06a1-527c-4a9f-2fdf-08de6492d6be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jHo5/7EJlGLqpLMWkWLOOgPRqNX+ZgonbEZ43fERLfuMIslsIqHL7ibbuX?=
 =?iso-8859-1?Q?JFCqDgxKrQsQHcgBVAflSs9Mmw5iI5WCoXvatDSF4O+GUWJeOtJoRlisg2?=
 =?iso-8859-1?Q?/0zcS3eAMcO5bGgf+8W8lpfWZxZo95izTlq18+yaNttJqHYBpCDxUTXN+Q?=
 =?iso-8859-1?Q?7Wdy4l/HhDRUi52TAkVOtlsrUa3KP4oNQQNIwHuvpYpN3D/uYQ++VCcF3F?=
 =?iso-8859-1?Q?5P0ll/tDeFB6D6VFm2thzXjfw60YXuVapHB/0r2avGi7zi24Kx2oryEmO4?=
 =?iso-8859-1?Q?UEAdcOuZlNN9nWawLZosUriMPhcxAJyop7UuabfMAyoHTcL2on7glR11qD?=
 =?iso-8859-1?Q?CMtnaxSBWWGaP0+MaGsTbSM8L+GDYG1zOxbU+KdpD21DeWE/oVlgCFv39y?=
 =?iso-8859-1?Q?LZuYvZcYPmSp5jABYQd2zdS/4hH2KT0rxq/KOby6QeqN2Vme9pLSvSRlAE?=
 =?iso-8859-1?Q?wAUy/yoVTtd17YqQ0Q6uZGNZFTZDMUp8LKKjFTpTsXwc1u6H9Pa8jvErX3?=
 =?iso-8859-1?Q?GFJEmxnpLOYdYnvWcK5h359VUQ8j+YOgRjJ8oiS4IwInx0oe6m5ZXx4TXC?=
 =?iso-8859-1?Q?zT3XML3UR02Z8QNkkTzb8DyFT7Wq/HwbDnUD+ImAV8yP1GOi2zEF/O8Dvy?=
 =?iso-8859-1?Q?Qls+z0XEZCkXTsoSVQTkB2gzXyi6y4PPjSF3lKZbfnPedHMpbaaydX6Y85?=
 =?iso-8859-1?Q?AnAZgoJYRkZU4EPBbV/67Fn51pfchK2RY33hLxybZtWEGdUw/Y44saaN+E?=
 =?iso-8859-1?Q?/98EqCW+MHg825nRrppIamdBgo2/0rEU2ucZLI9Fz+t/CDhN2XgujnCR7W?=
 =?iso-8859-1?Q?tejPU5CA9cp2IiMgvKh3K/6SWY9q6Rh2HAVy8g8VgXZSxF2kPWUn05dfEI?=
 =?iso-8859-1?Q?TTJ5PGY/YAndqEnMbcV3g5Him94btKu5nusKfWiwfJpHHBorrsde4Pj6Wf?=
 =?iso-8859-1?Q?iIyYyTU3m3xMvuu5eiRHW5Ad/2ANvuP3nIYjYoMuU2BFe5oxHn62ymMpP7?=
 =?iso-8859-1?Q?jgA5OArQl0WpYJySVfwjrukbL6laKG1IekedcxQL+WXtt8sRL0EizNql0Q?=
 =?iso-8859-1?Q?MW4PdOYsBLbRNawkL4xVcmwNpFct8YpjsuELie2NknUdITyZ7qsy3Hjamu?=
 =?iso-8859-1?Q?a+zAEfWxNZ42I7HVPxmg2NWxIxBWlWcwh2bPNfWPehQdC60UecpMa7e7UD?=
 =?iso-8859-1?Q?oBJhrL1VePuWBU3l0iiCebtIsUtMhTvrJyUDRskVLRlnmIyqEFdDkrZdyK?=
 =?iso-8859-1?Q?GAw3FXrnmNqWUhsw4v79/riwt2oVXkO2WQENa/82BmFf5b1K3KdPhOK1BE?=
 =?iso-8859-1?Q?kndaPA/4AytvGNLsJl2oa+P29Z2ny7wEUmQIvaKOJRuEQrvnZx5mbSsOxx?=
 =?iso-8859-1?Q?FJYU21/uoOdqMvaecUC1/3sa5Mm1P3HKdSxCFjtB07EIdu1G4A1JnGoJ91?=
 =?iso-8859-1?Q?rjAznV/2/RI41tGTlrSjHTuzrG82nGmERP3vLZg8GV0zv60FjQwUq8c2uT?=
 =?iso-8859-1?Q?glQz1YDwuryYQt0usve64L83tAg5DmgR6EzMWbsQbNlRSi3gOxm1AHhkeH?=
 =?iso-8859-1?Q?jEhAXx4m1QsdNn6FcmtbRYHx88C9xsCskezXstSbvhe89ucuCkqtAMmh0y?=
 =?iso-8859-1?Q?WdUomKG0Boh/WXmuMx0USn75i/L7rEy3NImsTkDaP5GJ+LIOBZrRLiG66w?=
 =?iso-8859-1?Q?l236Py3ay5BGkC1lzSkJq+AxvEh1dmYuPvWVRF/GofM/uP6d6VR471sVaJ?=
 =?iso-8859-1?Q?+mpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(35042699022)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DQFPsxReXZsHk5ncn+StTmAg9zSRvexcbBVeksIqiRNDL1DvzeXlX0ekbLyiV36glkqWvdky43FkxwiY7t/BWwYoMxo3aheT9snJ4Yaf1qbCftL57X7EA2rT0ANQTxmXJcbZewJoBI/NmQsVEVeJA7PpKob3ujAMvX6J0G9YLvZ1jvbiSEF+P4gxip+IHQHiGsWPlA3eTHe0qbYnd7VNIjUP4qZzzPs8orONaskoDW/NH8VRRhT3W2Orh918HW89oSS/eSUtOKaESFvsNQdrmAy3KbnnnXDNvV7sZsmTECQfAcLSy25E93307koD5biBfVl6fJTWUE3Sb1gYvpamcE2dHp39RzWeqclxrSZmcqSBoEap+cGwCttN4Vyve+VvqV6THx3VJEux3flTfclLiFEhV4KDUyhAmAqjKrkk2qTISqaFr8PuaysfRHkrAHpw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:46:00.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ad0e5f-2571-4b28-49f6-08de6492fd31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7638
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: EF09AF001C
X-Rspamd-Action: no action

Hi Jan,

> On 5 Feb 2026, at 09:23, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.02.2026 08:44, Bertrand Marquis wrote:
>>> On 4 Feb 2026, at 17:15, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 04.02.2026 16:45, Bertrand Marquis wrote:
>>>>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>>>>> Xen does not currently document how to build the hypervisor on macOS=
, and
>>>>>> there is no Darwin configuration for a Homebrew-based toolchain. In
>>>>>> addition, the Makefile silent-mode detection can be tripped by -I pa=
ths
>>>>>> that contain an "s", which hides build commands unexpectedly.
>>>>>=20
>>>>> This wants submitting as a standalone fix, so it can be backported. B=
ut see
>>>>> also below. I don't, however, understand how -I could be useful here =
- our
>>>>> build system is self-contained, so any include directives used should=
 be
>>>>> satisfiable without any -I.
>>>>=20
>>>> This is added automatically inside our Makefile if you build out of tr=
ee:
>>>>=20
>>>> MAKEFLAGS +=3D --include-dir=3D$(abs_srctree)
>>>>=20
>>>> which ends up being -Ixxx when tested.
>>>=20
>>> Hmm, but I do have an 's' in my source path, yet I need to explicitly p=
ass
>>> -s for the build to be silent.
>>=20
>> I did further investigations and my previous assumptions where actually
>> wrong because i looked tat MAKEFLAGS value once the whole Makefile
>> was parsed and the include-dir flag is added after so it was not the rea=
son
>> of the issue.
>>=20
>> In fact the issue is coming from variables set on the command line (and
>> in my case O=3D with a path containing a s).
>> So you can easily reproduce the issue by just passing XX=3Ds to the make
>> command line to do a test.
>>=20
>> As a consequence, your proposed solution filtering -% is not working and
>> the only reliable solution is to actually use firstword to actually get =
the
>> short options list. This is making an assumption on MAKEFLAGS having
>> them first but my tests are showing that it is always the case.
>> I would propose to put a comment to explain the assumptions on which
>> the filtering is based on top:
>>=20
>> Something like this:
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 13e336ba5484..a7924fcb7af5 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -113,10 +113,10 @@ else
>>     Q :=3D @
>> endif
>>=20
>> -# If the user is running make -s (silent mode), suppress echoing of
>> -# commands
>> -
>> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>> +# If the user is running make -s (silent mode), suppress echoing of com=
mands.
>> +# This relies on GNU make encoding short options in the first MAKEFLAGS=
 word;
>> +# if this changes in the future, this check may need revisiting.
>> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
>>     quiet :=3D silent_
>> endif
>>=20
>> Also i can put a fixes tag if you think that is useful:
>> Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rul=
e")
>>=20
>> Please tell me if that sounds ok for you and I will resubmit this as 2 d=
ifferent patches
>> instead of a single one.
>=20
> Sadly no, see my other reply sent earlier today. Furthermore, as said the=
re, even

Sorry missed you reply when i wrote mine.

> with O=3D I can't repro what you say. In fact with a Makefile containing =
just

interesting

>=20
> $(warning MAKEFLAGS=3D"$(MAKEFLAGS)" ABC=3D"$(ABC)" XYZ=3D"$(XYZ)")
>=20
> all:
> @echo 'MFLAGS=3D$(MFLAGS)'
> @echo 'MAKEFLAGS=3D$(MAKEFLAGS)'
>=20
> I can observe (with both make 4.0 and make 4.2.1) $(MAKEFLAGS) expanding
> differently depending on where it's used (I'm passing ABC=3D and/or XYZ=
=3D to
> experiment): Only the use in the rule has the variables. What version of =
make are
> you using?

I am using make 4.4.1 on both my Linux and brew based builds which might ex=
plain
why i always see the same.

I have an other linux system where i have make 4.3 and in this one, MAKEFLA=
GS does
not contain O=3D options when the test is done so the issue is not appearin=
g there:

adding:
@@ -116,6 +116,7 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands

+$(info MAKEFLAGS=3D$(MAKEFLAGS))
+$(info MFLAGS=3D$(MFLAGS))
 ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
     quiet :=3D silent_
 endif

## On linux with make 4.3 i see:
MAKEFLAGS=3D-rR
MFLAGS=3D
and the build is not silent

with -s:
MAKEFLAGS=3Ds -rR
MFLAGS=3D-s

with --warn-undefined-variables
MAKEFLAGS=3D --warn-undefined-variables -rR
MFLAGS=3D--warn-undefined-variables

## but on linux with 4.4.1 i see (same with brew make 4.4.4:
MAKEFLAGS=3DrR -- XEN_TARGET_ARCH=3Darm64 O=3Dbuilddir-s-test
MFLAGS=3D-rR
and the build is silent

with -s:
MAKEFLAGS=3DrRs -- XEN_TARGET_ARCH=3Darm64 O=3D/home/bermar01/Work/xen/xen/=
builddir
MFLAGS=3D-rRs

with --warn-undefined-variables
MAKEFLAGS=3DrR --warn-undefined-variables -- XEN_TARGET_ARCH=3Darm64 O=3D/h=
ome/bermar01/Work/xen/xen/builddir
MFLAGS=3D-rR --warn-undefined-variables

Giving --silent is giving the same MAKEFLAGS and MFLAGS on both versions.

So i think the working solution would be to keep the current test but do it=
 on MFLAGS instead of MAKEFLAGS:

 ifneq ($(findstring s,$(filter-out --%,$(MFLAGS))),)
     quiet :=3D silent_
 endif

Could you quickly do the same test than me on make 4.0 and 4.2.1 to confirm=
 ?

Cheers
Bertrand


