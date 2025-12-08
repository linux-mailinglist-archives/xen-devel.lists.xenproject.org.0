Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8455CAD7E9
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180781.1503906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScc3-0003W3-Cl; Mon, 08 Dec 2025 14:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180781.1503906; Mon, 08 Dec 2025 14:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScc3-0003Sw-98; Mon, 08 Dec 2025 14:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1180781;
 Mon, 08 Dec 2025 14:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZPsC=6O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vScc1-0003SV-2H
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:53:17 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fba4fb4-d445-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 15:53:14 +0100 (CET)
Received: from AS4P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::28)
 by VI1PR08MB5485.eurprd08.prod.outlook.com (2603:10a6:803:138::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 14:53:04 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::a6) by AS4P191CA0045.outlook.office365.com
 (2603:10a6:20b:657::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 14:52:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 8 Dec 2025 14:53:03 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB8496.eurprd08.prod.outlook.com (2603:10a6:10:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 14:51:58 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 14:51:58 +0000
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
X-Inumbo-ID: 9fba4fb4-d445-11f0-9cce-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AdBi7To3PBWzx5LraHpM887QoFM47+RnjUQmxMqjQybObkB33YfScIaKGJW/xLKNaj/I59BlQ6BcWzDINawQolzF3j0b3t9aizI01FJznkKs1ppPwVRi3QA2jVRJGeLsHEAIpDCTxHU6Gvzq5WBxRXQzM0fdtyuoPsHkgYPnGyYiq9JajS2mlo6qbMPmkJzCR7ThPnNjdO4GK7Z7KJR9liQwKB2zY/yeAJ9iH0jNq7KHzwvHFRrW61fx8nxjyUDPL1h1awviUWV0hR5kKdFo/46vl8Ukso0OGSJYemYwfvJfL3wT9Yx3y6NzMb50w69NLaOSWixBTWeeemAICI50jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3BSPOOP7AZnjusguqzx0kCWp/NJwjqsq682neBhWls=;
 b=PvtUUK+mCKgeRTLUvt63DWl6dxMvE/fJ3PMbX8lwm4m4eMFUO9FVhHz1tPnPn0OCfXpeHf2p/wEWKAkL0KDo31CGkKFSE8k8XS5skfG/t3IOGwuEGoq4rmwlUum9k2A3G7wOdMgQYFc/lVBU3paP7AhknbE1VVp5f9FN9OJLa8lRvpye8lwpZZ58D8DLz8Z6nRolQq90QtxdG7upX6FPbJi5q7YVbiWEyyukioOnAqKuYuKFIETgOKBzqJ8LfmWerSrNCjuzsyIV9Xxm7pdRsfTE2et4c7XX6OGExnRaBR4u1YMXIzfapDnpP3LNC8JGMK5sQF1CUE9VvBFgqjvv5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3BSPOOP7AZnjusguqzx0kCWp/NJwjqsq682neBhWls=;
 b=ajhGyHMGK/WHYRUnvcMuMQtCS4BysnY5T4Pm4d2Y3tK4KJLR9FVKuFHe3hZilSisv7KzGE5ac7fJSFAuEoW63NCDD4QIF9noqDrRA7eNuh9+tgzeKjWPJuMiPEKsErhFWyk8scG+VlU+vC8DfrVBNE6a05EJfwcTFOxHJn0S9aU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGbvWCgcSqYw5EYOxqSdGAzyQAYcVYOGMituV9AvJ979yRKd8UQKx3qcwC9qLj3dxIXnE9HanJNj8/umXohvIAWXC1lHoz6EhAnktqOf3k5BNMkcI18NVWCuP3J4LjfDXDAtjdrAVpBBGCdsLRSZcHc4nPHeWduYxKI4FBgvArWVjOjyH/j/uBvuMFpm4jaulQC9Xr9Ezj+V39gwQOeacMIeW5Lw1QUCh28SlDBjdqlC0lo54G5izoRzvyyEL63ZTjJWfYzRZTEZs2FV1Zchx775DNxEaMS5nTODN7eaSIe9xg+nUJ+yK43FvtdqkG4c1D3unJKxAPgf90WGs1azrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3BSPOOP7AZnjusguqzx0kCWp/NJwjqsq682neBhWls=;
 b=vzwbglC3fTxQ1Pi1ONMqD2KmmOuvP7pwkPt7tCCMzE6cZQieDyoVx3fAKyGMfALMMvM4yPcIV86p1yBgG28tsikHzUHz1u/l7225AqpRllSmt+ugo9OFnrkLzfm8MWAKydzzN/fn+cshQA6UtRDSMV8k84oWzlvl3UCxe8s1J4CoBGHnGp3HPDb3h85f406wfMQgJUEtYXCqVIoYtX6AWVweRnZqx6hdW8G/oZ3OOv7FK2UWWz6tMNRGHK3A93U54MYt3NyGxeS3uON/Qs8aTkZPDMxGeN7NLOT8cco/3xtatm3VvfBMURmrNQezeD2GLfCbRCV9NuMGgsXDqTQPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3BSPOOP7AZnjusguqzx0kCWp/NJwjqsq682neBhWls=;
 b=ajhGyHMGK/WHYRUnvcMuMQtCS4BysnY5T4Pm4d2Y3tK4KJLR9FVKuFHe3hZilSisv7KzGE5ac7fJSFAuEoW63NCDD4QIF9noqDrRA7eNuh9+tgzeKjWPJuMiPEKsErhFWyk8scG+VlU+vC8DfrVBNE6a05EJfwcTFOxHJn0S9aU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 7/8] symbols: drop symbols-dummy.c
Thread-Topic: [PATCH 7/8] symbols: drop symbols-dummy.c
Thread-Index: AQHcaFHEZgCWYRtzmkm7gvYg23aA3rUX05+A
Date: Mon, 8 Dec 2025 14:51:58 +0000
Message-ID: <47070C53-9EAE-48F8-BACE-B554BAF2DFA2@arm.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
 <ae96860a-02b2-4ae1-ae98-eba0b749ff90@suse.com>
In-Reply-To: <ae96860a-02b2-4ae1-ae98-eba0b749ff90@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB8496:EE_|AMS0EPF000001AD:EE_|VI1PR08MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: dd398730-b985-461f-d365-08de36697d7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?a5TXirfLhliCK+eaSZVDA57ECnBFfvciCIam7a/mBm5PCNvXi+FKbUrIxo?=
 =?iso-8859-1?Q?YMEmDbNSS3xGYUJkYMnFs3TxNsUO+MEUuPybGAd3Erb1fW5cjeNyFKJ1ai?=
 =?iso-8859-1?Q?RE1cC2Gn8fWFbrDLnr6c9XXIqWKvLLnu2obIdo9b8yueoBHOHZ99FBYUth?=
 =?iso-8859-1?Q?IOVmvr8smaeAbpgCvEEXeHnwxTt1GGbphCx7Y/8yI48qO/GGJgK4sPuK7L?=
 =?iso-8859-1?Q?135fNR0fY+Kx/k7vsXZZxtaG9jl4awlE7xbCKMggyLBLL4HrX6S5kdWSGd?=
 =?iso-8859-1?Q?XTfZREcACvaVjq3UbqALvH+B/WNkJM4ZizQ7+L2obnmfKTpK/fffBYNaBF?=
 =?iso-8859-1?Q?eDuMVnn3k/rDJ1/PP3h3pVEjgsrjPhyFhaYeOSPcvMHKnA8ECgMOoWnZ3N?=
 =?iso-8859-1?Q?LhCWj+nZZ0e+W+JTnhVI2sTbjRUljbYSBuzG/t+sZh16uqrl+FMnMnFApf?=
 =?iso-8859-1?Q?fgPxbwcJlFehSD8NMEZYliYtQzEcYOXE8eyRL27+j7mAp/fYvlIxcppZ+W?=
 =?iso-8859-1?Q?H/2vQ0Cvez1BzDy+zAenW7anukyNeIdfCFyqCeJRkqKwwy0TKkQf1I5YEI?=
 =?iso-8859-1?Q?1fSYBvT8I6nxrYG7n07IOKVLcOybHlQTVmW6Uw2HhQd8dYYnc+Wf7kHwqn?=
 =?iso-8859-1?Q?eqFmfJe6wES8Y3UZAgbGmkznKIM7jRUzGFGrpWZTXMFD7ezcEt5S4Xe68z?=
 =?iso-8859-1?Q?P5QhcJRbUorE6Oz52uaqrX+wfAmjf2lLOiB3fvE8hvQgOyicW40Ek9RI7j?=
 =?iso-8859-1?Q?4GcjqCUKzTTfqFcDmfqElJTvJ0rULZNAioDyhQeGwMBn9RZUcBDUilwtpd?=
 =?iso-8859-1?Q?jREA+/fW7SlNC883Yo2EUtg6jIyre0hpy8XvM3SAECEYBFqw9zqzKml88w?=
 =?iso-8859-1?Q?7n+uLGffRbTdrJMVGx00YWKBD1D5l9E/GwtzNx/u7ApGmIynRauvSyO1Jg?=
 =?iso-8859-1?Q?QPCq4nnuaZASK0kom/MhXbmWu/Wk9791ki6Z6Qv+9ghuApUNXNeWiB8Z8/?=
 =?iso-8859-1?Q?82H/QpNkmyn5vee2BhELtplL759SG5sOHL6xemUKMfqLxF6tBOL5PYzjqF?=
 =?iso-8859-1?Q?c9PyegVuCvUwyeanHcX5Bw0DgIlb52CysyE2w1zyxltQfpF12tPfFunAsK?=
 =?iso-8859-1?Q?Xdoeu9eZoKK3VAFg1KqX1MeVf+unb27q62hF1GzIZ7f1WMMKUPmy6MwHy1?=
 =?iso-8859-1?Q?15GdY8h7G2Q47aszk9TuuMtIGekeaWFbqKVxho5GRroUkj0GWFNhy/ELbx?=
 =?iso-8859-1?Q?S9O3DNZBNuGk85tf0N/dnTweTZa9mL/QKHkwAhSPjbNMm7IbrCuAfkEZoV?=
 =?iso-8859-1?Q?aL76Y2FEsCFy/fkafo65oIG53tTL+9MeMPuti9wKQMro7R2/dk4lEhGHWY?=
 =?iso-8859-1?Q?qCVKsrGGZ1BknlZiMRKszDvCgps7ve19WcQu4KiRq8lnS3+srS/jAwv7pn?=
 =?iso-8859-1?Q?FXTERp8fOB77/WPcof3b1tOu+lXwv4O1VGrAbqffqlXsJ99jI/f6AcNQJj?=
 =?iso-8859-1?Q?ojF/wd6SOgZzYp8dXCU6AL2Dyj9ZTc85NCfv//1gWTaS+rx+a/d7igjia9?=
 =?iso-8859-1?Q?hJhO+arYfxA75iXBoFTY2pctNmGQ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F4EF2C883D4C1E43AA2140D77D7D1410@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f42fc58f-6fe1-4936-f6ce-08de36695661
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?3eUOqHS6u3zXvMMrSpL83owummlt8eJIc4PHSxE/slsHlgnDTSdmhUQ7wa?=
 =?iso-8859-1?Q?quo6bwYK/KObhC8g3du8djll0AcQ3GhFuiTg5Lhv++QOvNmgcBJOruIKaS?=
 =?iso-8859-1?Q?EQupajmqNCXG9BjyAVOuMUX4T6I+DuZIH/Zs1SZ5twMuKKW1FzaAisJnl+?=
 =?iso-8859-1?Q?6EMs+jfBh+1f799AUPdkSbbb+JKg1UiwyVMDjwO260rPaePlLG/DRVksNE?=
 =?iso-8859-1?Q?yKiVfjsIQKylQ1oPYni4Wm4S0mEXHgl3DN2lCozqW+8gPqJdP6wYbtOn79?=
 =?iso-8859-1?Q?CmGHXMBqoJEf97s7dJgHIrLMBUF/YQEiUn2ECfiHm8/kD1Va2vH0IQ4sRD?=
 =?iso-8859-1?Q?azfMqy0Ig5teY30wiQ+wMIZPzAQwB9/u5fb/lmYm16z67kNS5fIqLaqmEf?=
 =?iso-8859-1?Q?QMabvz7XiEPamyPlh6UNkc1NfBfFbTWlMg9nyMr596CpQTQ6/n9xhD+p14?=
 =?iso-8859-1?Q?KqZUqYqTGiNgpT/gKUDK1GcjWUIQLlvJIGUZFgLrIY6R5ULJRS59h9KPjy?=
 =?iso-8859-1?Q?MzrsA1j58UydHw5gqKcB44afjb4uCkBIgDLNy3n9yGFmNobJkix2620r3E?=
 =?iso-8859-1?Q?l3JHL5Bxr8U9ybrtaKKpVsoirE0uKXX+g7m7qFNuPCxr4k2R5PtJgKCgFN?=
 =?iso-8859-1?Q?Mx6zzBFubwXkA+UCgZK/CEJv6cE54PXO6Fr1cGIPorYLUKDVPggoWKXhtB?=
 =?iso-8859-1?Q?5QaZP3atJO0lTxRl58sKaNCKbcJjO9Ks89ag7nwM4Mp0F2WIshdBRYa44M?=
 =?iso-8859-1?Q?ZkeilVazUZZsvcm6Bo7d88E0zhPccxfijbNGSJZz0rY8sYRcRgCrNyjtOB?=
 =?iso-8859-1?Q?dm9YU6ozR0t0//Lt5ecIj8sKdhoMeU+rOeJFh/dC21qPBtZxowkWxezdBX?=
 =?iso-8859-1?Q?8o0ljSi3WuBE+0Cf6M65Cz1XYIpHdeZd4QCZ/5kkuMH6SsZiKZbOECEW8E?=
 =?iso-8859-1?Q?XKoH89rluXKjSO6ToteQnLneiVkbTvPXMjVxLApar2yJO5rBr40dzw5uaI?=
 =?iso-8859-1?Q?g5UO+5f7OsoNfARCmX2PbRm2PxtoJItca88a+zCNpF+DuYl0alKIDZu9N4?=
 =?iso-8859-1?Q?JxZjP+FKntPT1z4/Ow9reD6Nme+bGRzq//8FzC6Y5hyK2NtxZiKrpIUWI8?=
 =?iso-8859-1?Q?4h/9URIrpMfX4stzE+WbSfomZQhZI7auBT/Bfn1rx4Q8oO4PB+yFkjwS3D?=
 =?iso-8859-1?Q?0aUwEywbKZkvHF0P0CeCqYHCr7w5nnOGJOtMDzIGVnKJV1WD6RkdaVwen8?=
 =?iso-8859-1?Q?DEGzLJzXvDS3OqPJdwfh7XWhPCxySFWYD3MvjtahHWG3yEJyEnTzIv0nEb?=
 =?iso-8859-1?Q?L6G5H7m0BPkSfn5jrG5RwwmUFihaiCL5PLDkc3QEW1KQP2Y0FjgZWrW05f?=
 =?iso-8859-1?Q?oxaK8J4zvsoUyCRRq+WqJIs3K7ELi3qQtitmEyx4DjamT5Pk/j8pJxbLIw?=
 =?iso-8859-1?Q?jsDyTRC9fxeK72rYNMOqpVAJoTEklxbvaXjFPucjUsAevBUjJ1UUE5f3wX?=
 =?iso-8859-1?Q?yVqmOHPJ17rqDhqBwzp+N3G5OgOM9sPg9+qHiPE/RZe2rgPgx14wYpAwd0?=
 =?iso-8859-1?Q?o2wIXIHlOxM6Bsby7TspdB/O8mn8ZwujD0CMyta/j2aAU0IC6r2B8/dFgv?=
 =?iso-8859-1?Q?9hCjz7YAj9rfw=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 14:53:03.6998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd398730-b985-461f-d365-08de36697d7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5485

Hi Jan,

> On 8 Dec 2025, at 14:48, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.11.2025 14:47, Jan Beulich wrote:
>> No architecture using it anymore, we can as well get rid of it.
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Should we also drop common/symbols.h again then, by moving its contents
>> back into common/symbols.c?
>>=20
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -74,8 +74,6 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>> obj-y +=3D domctl.o
>> endif
>>=20
>> -extra-y :=3D symbols-dummy.o
>> -
>> obj-$(CONFIG_COVERAGE) +=3D coverage/
>> obj-y +=3D sched/
>> obj-$(CONFIG_UBSAN) +=3D ubsan/
>> --- a/xen/common/symbols-dummy.c
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -/*
>> - * symbols-dummy.c: dummy symbol-table definitions for the inital parti=
al
>> - *                  link of the hypervisor image.
>> - */
>> -
>> -#include "symbols.h"
>> -
>> -#ifdef SYMBOLS_ORIGIN
>> -const unsigned int symbols_offsets[1];
>> -#else
>> -const unsigned long symbols_addresses[1];
>> -#endif
>> -const unsigned int symbols_num_addrs;
>> -const unsigned char symbols_names[1];
>> -
>> -#ifdef CONFIG_FAST_SYMBOL_LOOKUP
>> -const unsigned int symbols_num_names;
>> -const struct symbol_offset symbols_sorted_offsets[1];
>> -#endif
>> -
>> -const uint8_t symbols_token_table[1];
>> -const uint16_t symbols_token_index[1];
>> -
>> -const unsigned int symbols_markers[1];
>>=20
>=20
> Now this is (to me at least) absurd: I'm removing a file, just to find th=
e pipeline
> fails because cppcheck doesn't like docs/misra/exclude-list.json containi=
ng a
> reference to a non-existing file.
>=20
> I'll amend the commit with
>=20
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -170,10 +170,6 @@
>             "comment": "Imported from Linux, ignore for now"
>         },
>         {
> -            "rel_path": "common/symbols-dummy.c",
> -            "comment": "The resulting code is not included in the final =
Xen binary, ignore for now"
> -        },
> -        {
>             "rel_path": "crypto/*",
>             "comment": "Origin is external and documented in crypto/READM=
E.source"
>         },
>=20
> but I think such tidying should be optional.
>=20
> Jan

Can you share the error?=20

Cheers,
Luca=

