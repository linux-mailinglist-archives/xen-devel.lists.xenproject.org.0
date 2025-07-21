Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F422FB0C05B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051272.1419584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmsz-0004oi-35; Mon, 21 Jul 2025 09:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051272.1419584; Mon, 21 Jul 2025 09:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmsy-0004lr-VO; Mon, 21 Jul 2025 09:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1051272;
 Mon, 21 Jul 2025 09:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1oiY=2C=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1udmsx-0004ll-0p
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:32:39 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2eb6bbf-6615-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:32:36 +0200 (CEST)
Received: from DUZPR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::7) by PAVPR08MB8800.eurprd08.prod.outlook.com
 (2603:10a6:102:2fc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 09:32:32 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::b3) by DUZPR01CA0076.outlook.office365.com
 (2603:10a6:10:46a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 09:32:56 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 09:32:30 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by AS4PR08MB7807.eurprd08.prod.outlook.com (2603:10a6:20b:51a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 09:31:58 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 09:31:58 +0000
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
X-Inumbo-ID: a2eb6bbf-6615-11f0-a31d-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qPG0MFmfvkvKEKmzQ82zluDgwVYM41jUZb3rRVds0lqbzWI55Ve6BbtRtqxzP+n9L1/U03/DbSy5rgg831PLq4iDJwucxgeLLyRtkl1Ax08NlPWLwSOpqXv+6jMC7XRn55OyjsL5VYIGgRhlDdKLDVvYNwdADWALfXFQ3zzuemge0kQIsWuYpgrSVMuHqrKchp2jBW4+AucHz44vga2QIJwYbRGxeEPxkU6pirbp9zfbuZj3D2rL9OjtnxF4qdY916OinGlwKFyxQboN0ik4tZqFN3q4WXp7t6zTJeCZicQXMoGCcMdVS7Uw6+sZyIk7oEFn7ucqs8qIFH2IVOQo0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UL0Jb77ZPGzNRrqpQPKxJZ1Pyd4ouzCCCKUOc9/BCQ=;
 b=vdPIono9+R9l6tkRoyndAfb94yu+9YrtN9p+xtqOWaYsjh/c7GFRNQh5038kNPPYCTVK1uvc0A0D98pMk5s6t8ZCyjW5Iov/ykXQWBFZ+mR1Ylcdy0KiuJaxfaEHGsCWGeeXZmrmn5Vjb8FVEuG/j0yjiEGxI9CgFr3r7feFyXY4woHvn/z6gDE+ciedOwBwIV4OdCq0MEkWpsQqdAiLKszsV/0DyKvuG1eBumocJUNKJyBQZNU06fzfWgNFbmur0eiqZbyx4S1ch6auLKakHTBnddHHptYq91KV7yTZjfSxr+RnYBO68hmVP6J+Q6vk1ANHn67EdbQ1gvXA0rcBng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UL0Jb77ZPGzNRrqpQPKxJZ1Pyd4ouzCCCKUOc9/BCQ=;
 b=l/DI3pEPNSLCBl6i16xnrrtG2TBMTlsxWI7lvKdT5iqJVu/NuUF7ND4rfqBQkMGlXq89H8lmBmSmecX5stuySGBRkH8nz2e4Vanr4B1wilEh30F4LsKzrDrmJ5VAKfqPPifX3xoVdRpnTJIYhFD3rnEZY023KiO0iKdQDiNykkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8HQ98VuDRiCWJDbUE6HqR3nkayNEcGiuwv8xTPjHl6525cWpJkaLgRnWB8VOJtcet+YbHbGtRwDNgQkoRhhZxcQ/68OqzlcNnHnH/0Vs4S7lvqdgz0sUE1awwshFCxruVJYB1VWAkmyIs6fppXTUg2LYxgsKqRijE9DeQfjfYL3SygeQ2q2V47BsISYz65rvx2Vsbdo7eFGgYNCcVvCIsojzdWwE013UUou7rPd623dSojZnVI1dOxGQgYPbl6dozYHmEJtjiZBsaZaVCFUPq/2VORruzwZZwAnIvkwnzhqGNqlFUm5botdZmcLGnmnSJej4ewxJbzN0wf0RvKMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UL0Jb77ZPGzNRrqpQPKxJZ1Pyd4ouzCCCKUOc9/BCQ=;
 b=ErooQHtpYAcmnI6FjpSCv9WWaSMGdV1a0o9d4vY0LMXLX5RtNFNqIzrhiZl6/V77gyELzgooV91IwavpL3I7x36mXoFGG/UaCa/Do+l0+RffoTpDWw1MEdB1XqBf7dzb4xH2dLZJl5XHmymxegFSjfzZz7re0LuTC6ga2/V/i2/NXqSYTmwdpPyMTcldaeZM+nJjY74aHZUnpcs9f+xl5+MdZHs32Nl1PPxzQhqw5bVYbelvh+4j+FQbYOe+HSkW7a2vr2UlzDtSHBgHbv/De9k1HQlJpkq2Ri+x4PXZPrEOrtKeAt7i/ORpEqyfsHM2J8A6ri2/KWQ5xijYOXpO0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UL0Jb77ZPGzNRrqpQPKxJZ1Pyd4ouzCCCKUOc9/BCQ=;
 b=l/DI3pEPNSLCBl6i16xnrrtG2TBMTlsxWI7lvKdT5iqJVu/NuUF7ND4rfqBQkMGlXq89H8lmBmSmecX5stuySGBRkH8nz2e4Vanr4B1wilEh30F4LsKzrDrmJ5VAKfqPPifX3xoVdRpnTJIYhFD3rnEZY023KiO0iKdQDiNykkk=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v4 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
Thread-Topic: [PATCH v4 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
Thread-Index: AQHb+h9JbL1v5dYnY0i99PssJN5fm7Q8TuqA
Date: Mon, 21 Jul 2025 09:31:58 +0000
Message-ID: <D73A9539-145A-45DE-8316-40B950144DDB@arm.com>
References: <cover.1753084737.git.hari.limaye@arm.com>
 <7050dc0abf9efb69958a8b4fcc1c325d2e937fea.1753084737.git.hari.limaye@arm.com>
 <704db270-650a-497c-b536-2951b35a8102@amd.com>
In-Reply-To: <704db270-650a-497c-b536-2951b35a8102@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|AS4PR08MB7807:EE_|DU2PEPF00028D0D:EE_|PAVPR08MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f264af-6084-405b-93df-08ddc83983d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ucZED5MzBWQRQtuo6aoD0xMP+gexTBIWelO30Frj9nyiBQ4knNalHQ+aD+bJ?=
 =?us-ascii?Q?2Zw141bM4DJBxdEH6vrOmYXC2CYhinT5ViuVV0P0gTu0oAMviEd7KWheqFC/?=
 =?us-ascii?Q?6hswzt7nmTz28QwN1agb83KjGUwB4Td6tY6HC+sUYASk5HHKx2Hr+TlOUkKU?=
 =?us-ascii?Q?vMMYlrtasex+0dNVKJeHcw98jKpZLlBep+iA89C33bK6EJeRtMToFh/UJkuw?=
 =?us-ascii?Q?2si2SvGZWWgv8sAuLoAw0HsUuUrcWdNrdfZgYDLzkCMkQNzOXK9/RGIbaZw8?=
 =?us-ascii?Q?VYalBFMLAy41MeAWQyoa7tOYA4ziPe/mX7aAlLHLvpGSBo47b/TfMO7xswdQ?=
 =?us-ascii?Q?W9tc3HXV6XmgO1QuZNLk/OrGhRB+W3ucSC+dFkHsRXiSH5H8hqlqpBOGhZlI?=
 =?us-ascii?Q?JF0IzKLaeYWINK14orlonN5ZWRiWgVZlNtX9iR43sQ3tCb0DUflKmpBd0OTY?=
 =?us-ascii?Q?iFnKhRzetw7rY2dWcikcZJg70vK8MrrX8Oo7CkjRxG5pNdzeY/lDjM5pwstp?=
 =?us-ascii?Q?lwaqixMDHF10A01Mxfkci4o8awfc/aCirw0hUyqb5jVOZqVAEBw4lD5aPCY+?=
 =?us-ascii?Q?kjPaAju+EsuN9Fp2Y5BMdAlbUyFm2Igv1giKjJVHMrW0mg7wrOPdo+jAElU/?=
 =?us-ascii?Q?gMSYRx3dd4pmo84sE9v4v1fJIYWe7hMH7eNOUvy5Y2XheQOICgrdB54J1qgU?=
 =?us-ascii?Q?vserOLODV9DToTUUlxreTvhJIe3fFUBunvuEt5TfOCKkZn8CfJIzQPLln+Fi?=
 =?us-ascii?Q?33xKt87/Nbq+fvKjmg9sKtbW1nnXeLri730Ox2CMc/O0na3KUaglszYruVh7?=
 =?us-ascii?Q?SL8NTyNAOdvxGSTulyy3tda3uZwHAPDZ15BzjdQjr5DQxagXBgJZfCooI8dw?=
 =?us-ascii?Q?2h2tZEFbqjlgH99xvkWzyjKLwZCeXMXf++UJinHZYX6FWYIZVZK+FGP2jKgR?=
 =?us-ascii?Q?a4l4XXuGg5mB335twlCju1HlJeSy0K362RnvnGq88GsfJ7OE5iThi4jXed2k?=
 =?us-ascii?Q?HUcHAU3Mz24jJODn7JD/N8RVDQRd27A3C9SWm+diuTxJs3k9hxJ6m79SZfyk?=
 =?us-ascii?Q?RSZhuxyyaZtrWbj3gU7qhgN1r9CA5l2uhzOqV7OAIOIT5urOfPw1EIuprymz?=
 =?us-ascii?Q?k+CAgJRP7kz3YcyEjDlyE/0wG2iYN65ClX0NgR3Uez12Flb+GbTcyVg5Qsmf?=
 =?us-ascii?Q?4un+Vk714SRytRLlNmdTFZEhaIRrD8AXGudQ+rgiDwRFpZ23lByQ57XMIag3?=
 =?us-ascii?Q?tKL3cibuDlTLbdugRPMd7X06fy7XaeVobPtEWd/PjC0dU+x+s1W0ZrRa0hoa?=
 =?us-ascii?Q?VNzLseleJLr0E8fvtHIvUfm8XUhVeFVKEBJ0JliE+IkkbRwSz2IptUoWKOyW?=
 =?us-ascii?Q?TB3PaQqaejPzNBSZJCJ7qKc/pL67BjFkAbfir6t+CItOizLwxMy1j8rru9pD?=
 =?us-ascii?Q?9rNo4m32Hdeye01MxlsBDjJcELfQDgZY9c/vm/QUaI0GV/wSfa4vhA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FC92FFF86C63442AAC375D3F93B77CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7807
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1a25fd9-37c3-4d57-747e-08ddc839709a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700013|1800799024|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZybmkePau6GVPKPvWyVPyc8/8LeRKep5nI9syntctMhafyf+yjrPZDrUVstY?=
 =?us-ascii?Q?TtdUAW9IX68P4ZRpjrOr0UemIYrlDwKOSSTMNMOsaVg1CqtFHGcpGkB4mn8W?=
 =?us-ascii?Q?gcCMXischq62zLDU+33DD15CJpUDOsnN8kjqK1LFsQhCFHToJUYkIN+mnpM/?=
 =?us-ascii?Q?Os4HzDAIA5CZKGKUPIZmIqHQYHkfh/d4oMghmD7jUkDk40b8yqDUFhwzgokg?=
 =?us-ascii?Q?NZhOEIMXh/5tVRnmHTaP8xkbSpcg5UyFdzNNCDtRw/WSvsx8FZxXzO+qWoPb?=
 =?us-ascii?Q?ZFAP9iQ1JFlCA3Z+YLC7TiUlcNNiJXjsuZqtNSf6RwhwueoplTTQU1mBj75g?=
 =?us-ascii?Q?Zg62UPXGbuPrbpbzit42D0DPjXsIK4ws83Hhzgqi5YDAc74oJucUrQ15hhZe?=
 =?us-ascii?Q?hMxe2iRXnhZzy9NKo5zXrtlvf3aqNLaCoyIWcYeekTmXpYy3K8gHZPHeisB/?=
 =?us-ascii?Q?QHXrCfsyagUVyQzlwaXTrL2iM8HC8tqHNWluloXw4yo1t9cs14hjvq7QDOx9?=
 =?us-ascii?Q?onw/++Iz2dPVQ7zqr0pA9m4D09PaKnT8FXqU4RC8vtp4xlSO9yU7XOOayRn1?=
 =?us-ascii?Q?+FtcACc/Hwl8a4llLq7gBvrzWDW7hD3ppSihKhFfqV033WEtiq8/AAePZi5h?=
 =?us-ascii?Q?ht6ZaNDXXEYrB6fx2Gj5eOLDc6ivTMzOhpsJMFf75zcZJKCOSD9FeI7Kgm0j?=
 =?us-ascii?Q?rtMb/MwxMVtB2KNbRqq6Zryff3rt3drpyXXZhTLHoKTb/6zHHsZCgZ7DTGmf?=
 =?us-ascii?Q?EG3uYTZfhXbQQlP/cf2yopC/JIEYpcd/VCwEkPJYrmKQL8VW5wFh6JGpJAKN?=
 =?us-ascii?Q?e/P99UwL0hEaL7y2DoxTEqAynkFg8dyMHlY+xKEMAMezwoHcd1ytPtz7uvSo?=
 =?us-ascii?Q?LKXng2jJlzoIJa0QuezpQsk1yoX4mS725C+M3qPvGZ+KYzP5NAXymzoNn7jr?=
 =?us-ascii?Q?IOpnB1Mg9agizBe+rssBtXu2trf6RxqD9rBzia0do0CUr1Fc5W3XY1N+dXM0?=
 =?us-ascii?Q?jtkR4yL+JXxdFHaU0ROOyh1yvMly9xgNb1oWdnpzqUdjFR3n4HDCeKSxIJCb?=
 =?us-ascii?Q?wTcPoEuCYs5GrVSSot6oY/kGuq+MhftaoRpnPwUyQ+N+Sc8ERu6B3YXts1C5?=
 =?us-ascii?Q?FQEyRtgcGL7lSxUQqQMUilzjxQoZ57423jtqvPuahhNr8M8IV7e6P7fnWlLa?=
 =?us-ascii?Q?SmktbtNit9eUAq04TaP548Yho8PyBGl1LZG5ZA0Jj6sTWPthHhQKnolDJQ+d?=
 =?us-ascii?Q?+GTLy4EbHlIVLmAJdLReMeimJvvuhoN5vTnGkDeLaoKLuYw82lmA2c5SKtXp?=
 =?us-ascii?Q?+TA2hlmvdkoiWUDvzrq07wS79Tdr0dAKzCGjzKXlSPtzqgkzM8F6heJsT6nj?=
 =?us-ascii?Q?SS5Ak2197PILfSlSYWnAXpHX4hNeftI0XMC7CyB++yIWBWmzWi3IiHXSeJrU?=
 =?us-ascii?Q?Rh5mMNV0cIylugmiVmnQCoojO0npeDQQLcKIge5Kqg8B7JkF5NBOnHbF0wM6?=
 =?us-ascii?Q?JL/C7xS05AAjIPybYuOgVNKi6fTGeaQycylu?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(1800799024)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:32:30.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f264af-6084-405b-93df-08ddc83983d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8800

Hi Michal,

> NIT: In this patch you start adding mpu: prefix, even though other messag=
es do
> not have it. I don't think it's needed.
>=20
> Otherwise:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> ~Michal
>=20

Would you like me to respin for this change, or can it be addressed on comm=
it?

Many thanks,
Hari=

