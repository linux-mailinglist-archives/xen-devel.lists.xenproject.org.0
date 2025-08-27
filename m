Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE9B38831
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 19:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096600.1451250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJZt-00027L-It; Wed, 27 Aug 2025 17:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096600.1451250; Wed, 27 Aug 2025 17:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJZt-00024H-FC; Wed, 27 Aug 2025 17:04:53 +0000
Received: by outflank-mailman (input) for mailman id 1096600;
 Wed, 27 Aug 2025 17:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrvt=3H=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1urJZr-00022Z-QJ
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 17:04:52 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0dc7a76-8367-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 19:04:49 +0200 (CEST)
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by GV1PR08MB8330.eurprd08.prod.outlook.com (2603:10a6:150:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 17:04:38 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::4f) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Wed,
 27 Aug 2025 17:04:37 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Wed, 27 Aug 2025 17:04:37 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DU0PR08MB8812.eurprd08.prod.outlook.com (2603:10a6:10:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Wed, 27 Aug
 2025 17:04:01 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.9031.019; Wed, 27 Aug 2025
 17:04:01 +0000
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
X-Inumbo-ID: f0dc7a76-8367-11f0-aeb2-fb57b961d000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S22iGeVwC469otB4Nesv5Vbx/TDJUY4P7zM0UE/COgpxC1VyHzmAZ4wwCI/vYao34Y0GySKlvSWTgbezrp3+hvGAquX+JqFY0l73K+22g9HhbJg7N6VcqfzPNtGxBsIqQQ6oRdfO71ROMiSwXqoOuPkIPHDsQjN319yotlMCPlkA27LkrzhzPwQrtY2559ljJiEOR8YqSS45aQiVOIYvePWXFh8ofA7w54xv8v8fyqy6NmDj2Eo5j8IgkGMnkPNDuL31eXs4wm+rILZMQ4Hsl86VKSwbCRYIP+DVWheQkmt2JUoCZNeGwpLzEwCcSxCNNKbmNoVgEfZeV/mTmqZsZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9sHEG7gC2Akdv5ctBDAO5rlWenbvjbn48R3yIB4cWQ=;
 b=mgyiYDPBeZdRyV2QzAFfJUygBBEJYqcjkkgR+2w/+P5T773kly4Y90y6ULTj7j804AC2m5S7E6IccCKWDBjXt0Ip3llPjWTOjtKnmaH0RxPM9OxSbAnMIXfcn7PvnySn2oPEHEKA10USBg9cNHvkB4o+J/OtMsF55q9hsrzdEQp1BOinUNfGxwXhXNPtFrUeOZvOuSx8JC5+a5XAv0ietnCFx9tLaLQ4avUziG2tpNCTpfgF09L4WQMW5O+wolRoPbtYKt6d6mJKYrMTU4tOIgrqH/J+ekZKenxG+mXNTbUmoCQ5/sdSjIUWvO9Ls3aAhwAibc0X3ATLfJClWi7SHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9sHEG7gC2Akdv5ctBDAO5rlWenbvjbn48R3yIB4cWQ=;
 b=okj1kOE7vWhSqJt5Vx37rgw6Dt92nLDox4r8hqiN4HHbNZogBBMLirjhNrygCIVcAsZTS9axIMSPUNLpOFzLHJV5xtUvBNCcHje6fu05FCmomjGnl4tunPExL2jmhp3TJ5kY9jApSWGV2GGIZ+eAY3deoznmzkRU0jr69o7ISi0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPxL290rB2SPH1g5/a+7sSERRAU1fY6EpHQePVVjkbqLAhUWbP8LOyYIeP/CItjgW80wO9qCaWgMzPDnWSiDhyMGvHXu8HWipsqF2UW5Z0z+Ls2+6o/bUVYA9VSUyxXlSsarlaOwmydgmk+B+NRqaeDW+2cAELlV8CYhUU2lw9G1RCMCilc+UL1XlO7uvCXY0+TyMm+Kn/CcqSn0Z1vB9NPqe8Azv97jpZV1HkbeqXfXAME7Z3S5ePSsuYYaM4/gEgooe6OdPLbpPEh/KQQ9UNPzhzY2jVqngIfUhEbOfQ9SefYV1r4r0Esl7MOev9Y53140Ag9LtEzfuNZDQtNEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9sHEG7gC2Akdv5ctBDAO5rlWenbvjbn48R3yIB4cWQ=;
 b=XaXewxUgUpqoKGuIIIyEtJREZRhTUYj0CL29KpyM3uvkqhzxjZr01AzmH0Bfe6yzj4SkjL5SKAkPWcjY0nybBo0nRE1/ZnpyQdB/5PXJ2ziF70lXYoFhlYjPJz/YD+/9bFqV2V+muWUDloZBu3D0UTf5Weu8v0N4yuT1/DAMau4z/fjzhlvNZIiAn4zOfkB8S/lZdMLyz+46XxvBjpn1+EIPDN4DjFzXANFCyxuuoazNWqzZOkdbyx37Ah4vaNVmreaIFach2ZxvCUZNqmahp/T1+canE9os0B5x67VC5N3k6aX4Si59yvWHNxistyVeJZsN7VRoSgJRfIIaLQw6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9sHEG7gC2Akdv5ctBDAO5rlWenbvjbn48R3yIB4cWQ=;
 b=okj1kOE7vWhSqJt5Vx37rgw6Dt92nLDox4r8hqiN4HHbNZogBBMLirjhNrygCIVcAsZTS9axIMSPUNLpOFzLHJV5xtUvBNCcHje6fu05FCmomjGnl4tunPExL2jmhp3TJ5kY9jApSWGV2GGIZ+eAY3deoznmzkRU0jr69o7ISi0=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/5] arm/mpu: Implement setup_mm for MPU systems
Thread-Topic: [PATCH 2/5] arm/mpu: Implement setup_mm for MPU systems
Thread-Index: AQHcEooIjidLhuh6q0+7EX7Ktw8WQ7R2xAoA
Date: Wed, 27 Aug 2025 17:04:01 +0000
Message-ID: <3D9F906F-83FE-47A8-A1FC-A871C1DE069F@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <d4dc1be6f581c0c090c0cecb6fd49049a46fefee.1753864612.git.hari.limaye@arm.com>
 <68a74142-667b-4b8e-8340-fd41ec15046c@amd.com>
In-Reply-To: <68a74142-667b-4b8e-8340-fd41ec15046c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DU0PR08MB8812:EE_|DB3PEPF0000885A:EE_|GV1PR08MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5bcd8d-4b02-4b8e-5ba7-08dde58bce0e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?vzgXaEuse/gUWgj/aTJ1MUxkQPviQEZj1A4Bp7tHJUX4iDOiAeuUi6+xQn35?=
 =?us-ascii?Q?TS+B1yofQrwkNvbiBrBngZaasG3fjTQc7w1BFkVgWKiOyJWKODPZvIVT6qKo?=
 =?us-ascii?Q?+q+8JqR8vkJ7gJlmIcn1I2ij4W6UxMX/PvqlSGg2opREnWK5mZDxFl4RNhAU?=
 =?us-ascii?Q?R25HLMPRjU+Kav/B4Jjt1g+TgvBbSs7eDrQQ57PKeZT1Y4l7DiQWNBuY7noV?=
 =?us-ascii?Q?74R2jHyYeHDfv5s1FMVOvx1I3q7ebmGh4SEM+xyIC/yPvNHhiIeJr2INiKpO?=
 =?us-ascii?Q?TFH44enUwGJ7n9ttBOV8s3LEZnEBiv6EcqpPlasE5DqhV8mGu5VGUPhxQa55?=
 =?us-ascii?Q?y8j+vRp8ItbRfjIrtnyBeu5Z/ipxJ1r1KDCXPI/P4qRjpQa3JjKoHbow4kIq?=
 =?us-ascii?Q?J2sIEUBLkwWE2salisQcqKkyxvDO+AUPdbHYf76P+Day7I8Yfp0X4m4fEF1j?=
 =?us-ascii?Q?vULELpBGgAGF/saf0PiXIVCdk41OL0Qgd4ktOUNTSQvAspLffXzp4r89H0GG?=
 =?us-ascii?Q?R9tRMIGtPGozQqRGn9JwK+TbrBnER58SriirQg51py48LSXHeZ5KF1v8pUGb?=
 =?us-ascii?Q?Nl2eoY4afBZMIBgaXj5mImRNW/w5eYWFE3gcgAGnxD0M73xASLvoGLIYpdBl?=
 =?us-ascii?Q?asB6qtnYZ6sj6DhqVoykmkufZ5WcMJPbit57dXu+77F5h8lvCv7GWmdonrkc?=
 =?us-ascii?Q?FExkv2nvHHZODzNnOhIp0Ucsv1oodx3HAmh/zQ7C5HDj5xs4Pcz/LxPTSpdw?=
 =?us-ascii?Q?oDzfkUI23HCHB10Bg3ZqhC3er3uyzAImwPDmg/2HoRGCHMAwKY1WE/kkhaZd?=
 =?us-ascii?Q?ZDIIHmvkEvllN2YDc3e0dvLUlE3sEJ2f8VTM2asbELOdE3jSktDMOJ9rg5sJ?=
 =?us-ascii?Q?csQprBUPs6AZ6rrnVdWGCk9r5gsyHzyqSlFHe8eTNVgGRYVKPRk5Q4S0Xvvu?=
 =?us-ascii?Q?gE5FPxFrwadjtgNUblXS6K8jdHpVsQi0yg3D4Bu3g7SjWDv8yYTl2SMFuX48?=
 =?us-ascii?Q?tjpu6Rs4E4GD0DkOWTriM9EF133aslq9KkNCtxuDgiCqOC+GQv249oryJ3co?=
 =?us-ascii?Q?EJCZp5QnskTmrtdUhYintU9JQ/+mK+Mm9Hin37jK32JSvg7IgPyw/k4wekoZ?=
 =?us-ascii?Q?M+sWpkeKiQj2bwrHvljje+MjlFqCML/ME0rE8PPqZgpLU08DIU85fUuqbNQp?=
 =?us-ascii?Q?YcDFpRglizJDG2fhGZP4oKiMmDQqv08/lIiNh9m08mKOLsqMVX6Wxc+MO0IO?=
 =?us-ascii?Q?ivfjWTa5Z6sIx2wD4ZFlzC2YHAihdnXayfzxim/DmiYP1UiZt77Ur89Uzl4D?=
 =?us-ascii?Q?BnbMgV9EsD1PKgK2nB4RLvnOkGf0zxEdTAKGINpt6VyYsVEgMrwm9RDles0+?=
 =?us-ascii?Q?ooMtuuGDuur0fy9Ha39xiUtMOYS2lJVI7rJ9lZ2FA1rT1D34FBDA9ILGDZPc?=
 =?us-ascii?Q?o59SFRhPg5gGSJxUDpnExPgwYdEi7GCMHHEVzlevZGfl4MGi1jVmbw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A083E8B3BFE15642A06B17AD7C4576ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8812
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fdbaef7c-2caa-4878-6395-08dde58bb849
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xtSlrXVW8cEymydEDx2fNmnocVFBJYeZdkMLt/xW9slW+4Sml8LTF9KNwBeO?=
 =?us-ascii?Q?O5vBN4jXZB7GTCnZ7auYC5VlcBxdEwz2yBIJqb87mCYVuB7nUuqq8LMdxonT?=
 =?us-ascii?Q?sM61WECYhZP4epeRkqwn2fklm45IwyK6OUq1VTroLrV/Bmyul4c3KV3/lXEt?=
 =?us-ascii?Q?xj1HdKkBzocVU9q7LinIf+vfmjxrfyRo/NEVinGT+Hn8hnYEQ+ddf84jFynA?=
 =?us-ascii?Q?zBkKQf7E5rdg++sQxKdK8qoGAAmlJc/VUWvTgHFt6TwQ/OSLrtJX+6rOU8H2?=
 =?us-ascii?Q?riiLAxIHn0Y39W9eSxIToo6nplzit+z35+KZCxveRc1eWt++ndxQu9JhOJza?=
 =?us-ascii?Q?/I1Cuk7RraaDGS3aDbWvDdFyKQnTmkB7cV7ZRe9mSM8h1UW1SPGbdpGLNzNs?=
 =?us-ascii?Q?tgrDaT5TMPBDnWNc3tinwIEjjA4NktZIMsg4dDr2oVkTXFrahvhtJGY8WKRJ?=
 =?us-ascii?Q?vKvi9XQjPjkh4RNeEifGGXlcFo4s6ovpHr5ZG0KAlbJtVNZ3RwK0NjeuwUOz?=
 =?us-ascii?Q?ztVNO8gZamj6/DQId0qv1mzNKz61SZLBaivC0/xYWlAZuA+27yAkLikITVIo?=
 =?us-ascii?Q?756/ycfhG+zFD0QANICDSkTIQfJlfQY9ypu0R8hOCon0djLZ0ZwCkb97FbiA?=
 =?us-ascii?Q?orINA8bHfmTebyP5/M5ziNaUAHujIRSriZfN6r4AzMXYYtAZXfAUJ1JzbY06?=
 =?us-ascii?Q?pGHJlk8UAILBf0u0vUF2c48R6Iv5zgM6RzLwAUqKwDt00gFmD+BTP1ei2DpB?=
 =?us-ascii?Q?0bKpLStbxXJ/CDcfAtrrmi7zK1HBGaIKIW4aW7qH4EN+6HpxwCSHkr9j7xKS?=
 =?us-ascii?Q?OudyuyPxqs0DvrGhlWwjH+iku2TRAZw+BV25uV/nut8UY9ZpMZgA49q9s98W?=
 =?us-ascii?Q?g66gz6/PsgaC0TExA2Fvycq1p4SV72pcp/32+1FSOjvh5RrNjJoWTcN21aYP?=
 =?us-ascii?Q?ndhbMypcYaMePeAgXmvq+ce+XqQ4Lk0HZJokKqv8HizKL84ytC9XOKgt5HB2?=
 =?us-ascii?Q?fzZ+4df/NsUbDrwDWI7J9EPpbRt3eHzhrYiO0drNj5BCJwChd1MY5REbmefj?=
 =?us-ascii?Q?DYlL2KjlAB8EG+3PhkZNIHTCv+S1hJhrZ4jPS34uuMslNOZ7IjNG85f0ri2n?=
 =?us-ascii?Q?fVj1bcws9tI8VqBFBVxqbAYHJ89DoVJeblt6R6GynSsGjZMGtsZ5ECnfS+Yz?=
 =?us-ascii?Q?8V/7a3dN21F9nKS450rqT9laDuiWXH+JhugaYNwgbJUEwkn5lNFINFAmn1jh?=
 =?us-ascii?Q?WPFXPxpfR8vMcxBdzSk5T3X4JJcJ5VIl57tsFwamf6QhmwgnTgJisO3yQXCR?=
 =?us-ascii?Q?OoXwrHrq4NSEMPu/7Xl2qTOwke1Md6t9x6GgrtHTXS1l0nbsdp4LcwzWQj0I?=
 =?us-ascii?Q?kSxYQqsFz8hqxbiaiuWf5ZSQNukzT71P5LuARrsQUrYyAQG3kpsXGDo/mgAp?=
 =?us-ascii?Q?9bAp8e72s3c/a11klj6NMPLEz2bitbAxdAaVCOSi/SRm1qLTPinl0SOpZFrI?=
 =?us-ascii?Q?cPNioLoEuuEHy0le1DuiRi0qZk+BDJJO7/0i?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:04:37.5689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5bcd8d-4b02-4b8e-5ba7-08dde58bce0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8330

Hi Michal,

> And actually, this could be calculated
> in init_pdx() next to max_page to avoid requiring each arch (arm32, arm64=
, mpu)
> to set it exactly the same.

I have not implemented this in this series, as it seems like an unrelated c=
hange that should go separately. However if you prefer I can re-spin with t=
his change also?

Cheers,
Hari =

