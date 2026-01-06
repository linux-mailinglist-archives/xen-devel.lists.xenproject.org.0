Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740DCF74C2
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 09:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195878.1513761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2QA-0007dI-D5; Tue, 06 Jan 2026 08:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195878.1513761; Tue, 06 Jan 2026 08:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2QA-0007aX-A4; Tue, 06 Jan 2026 08:28:06 +0000
Received: by outflank-mailman (input) for mailman id 1195878;
 Tue, 06 Jan 2026 08:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vd2Q9-0007aP-06
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 08:28:05 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9df90e24-ead9-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 09:28:03 +0100 (CET)
Received: from AS9PR06CA0583.eurprd06.prod.outlook.com (2603:10a6:20b:486::20)
 by AS8PR08MB6565.eurprd08.prod.outlook.com (2603:10a6:20b:33c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:27:58 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:486:cafe::8f) by AS9PR06CA0583.outlook.office365.com
 (2603:10a6:20b:486::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 08:27:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 08:27:57 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by DB4PR08MB8176.eurprd08.prod.outlook.com (2603:10a6:10:380::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:26:53 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:26:53 +0000
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
X-Inumbo-ID: 9df90e24-ead9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SwNzLV+JYEOFSNFFzs9l78y9OqER+NNCkmPhlN4+aAgqnTr+n/9KMFGXFYfka3+3Ut4egLf3dFlrMQjF/GrydN5pkBEuBRpsilFdSP2v33d/XOwK7wOOCEud2pIL2iiRUpKnBFASQkHubDqQSAmvQYTrr++aYiFKxH9AM/1wZxrSgPmQocecNTIx/ShEKWnyTQ3xt1bc4R+HeHTWwgND8CU06xxApWP/idpwp/FM4zT4DSLd2NL25rCI4qG8LUH+UNInhm1DyaqFOHfbhOIhSC9el0jFN1n+VvEFLH+9/rk/KvPdIUTRyHBAWUT51GsyvWZ6w5uakWeqCtBC5QEZwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pji4ghQaSnjwkr++d3QS7//Q2KJcQ+HUDXzPXClNDuc=;
 b=Wc5+ln7KhyMOK4urkYxoJAgzVL0feNeYhPVFMOGiMmUP+itzwRZmX45GA1Iu+qDfuyeZ4/r5lJcpO+5fHIsUPYBDs8G9C2CTgGy7qN5iUNuGzU5Q1pd8k7vbDOWkSxCW5hCOXl+ja3PPZzt31Mmxfl/DbUuMFBLFCiLCwRoJjkGzXagzezKneqkZOtneCzmx+Fe/uyBuxJushV9K8z7FERIzcwkjvfFR5V/362Bpoyc9XFo+KUDaWLbp/cAS4U/SK04J9GBYzBBFnNjRlBotQBNOKd1Z+DeGxQG0Q5xvZqo/hNx4aKp9S9J9j2ZnZqTVrSxHw3bka0hJdqsFqiimUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bugseng.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pji4ghQaSnjwkr++d3QS7//Q2KJcQ+HUDXzPXClNDuc=;
 b=NeFoJKy3sGBxtydxVu5QZn3QTydUNR5LuviY7yNYEuhOwmwYhnReCoIXpjy3Z2Z93PiPzsEDJbfGtRn4NSuf3x7hnbBdTZwpf7pxt3GTqDC77dmlieoujYwlzJIz/kzAZpHyRWbROdBPsUI/tW8N2416dhfsk47kxlg+c34SXtk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRn4HA2Qjv2nTHsb3GjcJ0OhWLvuW8vnIuV+tNxl0gLngCSFj9R9dL1gd4VEuNlY+3hqHqRvnBTtRV5dA909/QlDOTTCdG7qlrb9juFv4uGLDh+sYIY8kwa1x9VXVlPrCB/9tDXIrNxOstd0N5eoj0t7hf0ME6vu56f1OleBqVPuMja4zFnokWkxa90NfoI2QrDGt0/v2HnAlKovbrFhRFT1JOnwp/XIerZXosUleU3P00+2wUHT4Nf8Qiy3o1EzlS0G7tVH2HhnonXUgPBXXndPOLwjanoBHC42mAORW/Z6dfyeO7aHy0yuJ57Vfxtd6D1cUdmjXDHhsWDPhbugRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pji4ghQaSnjwkr++d3QS7//Q2KJcQ+HUDXzPXClNDuc=;
 b=lVMpdivIqzjfkOA/Yq99/7tbRYVn/W5Wz6n9TMglPkDQPflCIGgg/YcyVEp8urrj4ldDMBOPSslDSCYrH3pb6yDIMyeTXfuoN4dIdkP+j7JwCx1OrUHHGv7uCzvg3oNme4SBmyptseF+hVJKn4vsE6ZxdVZhQ9mZjG1gctAKhZa6wgHheVzLv/3JjqKy/C8h/MEqRxhCqRmm7yYWG+DzVAU95g4FVIqoY/Kpkg/35rJid8FCHFzWoTUJp0G+2o+fjZ68er6/nZDo/MvoBmQy+f9L49BWChzGw8LeP8msXIliAR73LAec9iJ04ObOJgw8dMlxTPWPw44kYxlzoyp5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pji4ghQaSnjwkr++d3QS7//Q2KJcQ+HUDXzPXClNDuc=;
 b=NeFoJKy3sGBxtydxVu5QZn3QTydUNR5LuviY7yNYEuhOwmwYhnReCoIXpjy3Z2Z93PiPzsEDJbfGtRn4NSuf3x7hnbBdTZwpf7pxt3GTqDC77dmlieoujYwlzJIz/kzAZpHyRWbROdBPsUI/tW8N2416dhfsk47kxlg+c34SXtk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Jan Beulich <JBeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
Thread-Topic: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable
 as much as possible
Thread-Index: AQHcfj5G7fNp7PSkb0GiHPxZx0yorLVD4eGAgADfJYCAAA7cAA==
Date: Tue, 6 Jan 2026 08:26:53 +0000
Message-ID: <541EF107-3536-4525-ACC2-065A9A13481B@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
In-Reply-To: <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|DB4PR08MB8176:EE_|AMS1EPF00000044:EE_|AS8PR08MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac1bcef-4c8c-42e3-31d4-08de4cfd7f1d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?aU/KuodPe+a4xOxtcguK4qU7lXyjj2JzNzfKYI2aXUxfb9JrinDGhr22om?=
 =?iso-8859-1?Q?nSdm406SSnatSqwTQDxDGdAYCZ75tzoEevkY/uMk3HEG4nGqAnLorPwMRg?=
 =?iso-8859-1?Q?2QQSiuWNi6mWa2xE1Kk/Tno+MOjTfPlN57DMi5YwGWokDRZU8CpCQmXQRm?=
 =?iso-8859-1?Q?JLpxr+unGs3KfGTUyypCK2pUWPcIQ37DTAb7MlKLwjo+1rYAPCB9gIF0FD?=
 =?iso-8859-1?Q?P6wRVVIFLH+EDLQy4l5bACGBoSC7eWy/HRu0Glns7P4ttJx012WYMkkwgk?=
 =?iso-8859-1?Q?Gz1ZmsI0qEsNfTVdpuKMH/4Q2u4SKTiMDuR6rCCc0tK94MTN9e99t29TdI?=
 =?iso-8859-1?Q?JONmA2Oy5/l+R6tXWYzE/EVL7lS7XlcXxoaf3FBOCkIOt8trwByYbJuSgn?=
 =?iso-8859-1?Q?bsgy7DPLLBLgjPFjw46ve1N315RjWdfy3zJ1Vs8fBYJnTZDumZTmrRcPq2?=
 =?iso-8859-1?Q?xlgEC30Z6Y3KuMfLXgkxSC1ZqWCrjPzotoC3Ukmd2F/K3VpKXauWNwxK5x?=
 =?iso-8859-1?Q?iBhiHdOQcWHWJbhc3xz76sgjA7d1pCIareA/ldg3aGrkkhOwkXg9BWBdsv?=
 =?iso-8859-1?Q?ycAsOpSOI59lVfUNvo9cUJ8/KOs+4tRqKwbyGfGuml6GZz1I3MXpvEaiH3?=
 =?iso-8859-1?Q?bypSGcie2ktFS3ulRQxvh59Z8agBbBVtkWV2svwPfDzzXRx3EulkSUkLua?=
 =?iso-8859-1?Q?mNN1Pe4zUIDu1RnLa4lQjAi0jEuiIYHCR0SL4uyb6lAepzwdMyoW3+UgTy?=
 =?iso-8859-1?Q?RZUQ89cpKYzI/N1BO8fn63+r0vwlbpsN4/6FAEWCFxKsLZXp5sCI21cUnq?=
 =?iso-8859-1?Q?9nRWftaT8VUtGsvY4ta7LBke6j8u8FQjP/1VE/n0lQM2geti5G201hcaBH?=
 =?iso-8859-1?Q?K5TKclWYqtoRkQxKt/9NlwWnpBz+kIamXhzemomaLa8eb+EKqP3q5M1KGC?=
 =?iso-8859-1?Q?tNqvOD6HII63+/uioh7MWQkzX87h4k+a0NERGDzFXNXic+HisFNft5n8Bc?=
 =?iso-8859-1?Q?pEvGQZPDpg8rOfNO02t3kve5bezy2pU+2I1mGIrxTiLNy3kWgUlpFy+5Ix?=
 =?iso-8859-1?Q?+zchKRC3t6WUb4wxTIzVNePhjdEnQqFPVfPzz6NkJV9PU9tlsVI1h+M6NU?=
 =?iso-8859-1?Q?nvDJgsx9rGDHZWwneQy+ovsF9tc1Hhy+MQIgb1hqtW5Pf1demOCTfqqRzV?=
 =?iso-8859-1?Q?H5tiZiOouh5NHjRuoE5/QTzHI4b3nqIxRR9Z2TdgbNg+09gqqvSX2SBDZT?=
 =?iso-8859-1?Q?kBWV6RR7OrOWujT9Wpvi971lrnrVI0om6+xx0nkgcPwTKSCTPxA0EJ0Lk9?=
 =?iso-8859-1?Q?frriglY44NgSVJ6kBMJqtvPnadabHN8eUda9JSvA233bwwdBeKxVWBzJgk?=
 =?iso-8859-1?Q?9oAWo8BehjVUKZPcDs0mR4zKAVzq+Oufb2MLs37Wqyz6zabubyxYIIT0y0?=
 =?iso-8859-1?Q?Ekl3P2P2X3EMNlLFT0ACbxswo+ipSgESQZHVk6k0ssujArgxvz4cAX8TuQ?=
 =?iso-8859-1?Q?euPBJQWFEXaZsoTuk7RBI10uBZ9QJOcuD9JviXa+6MiA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DB1B190754D95A47A4DCFF7DF3DAFDB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8176
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24d8947b-9a87-48ff-aacc-08de4cfd58ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|376014|1800799024|7416014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xDEwiZTmMP4HZcdtv4yza9viXKhdwXQ2i54RqQDzcx35n4uqwlKilqAwUG?=
 =?iso-8859-1?Q?HHxcTiN7rFT6RqJKSM+kLJeslJ/q/2rYDsgoOrbqj35f0xZ6ohjwqusfdy?=
 =?iso-8859-1?Q?f+/n6uUlMk/RxKCvkJqSMkMywKeAeSpiPOzNJAYf0F4xQStZdTCMjCAuaD?=
 =?iso-8859-1?Q?kjsjhwbTO++fWe7IlsBOmuanr7hhPNz1z6S8zR5kAFctHSBAh7yjJMWc5L?=
 =?iso-8859-1?Q?gh68dtevz/GwphwbRNeCJfZMsx95HeDYU2ujv6I6oy7RSPCabecfxf49Io?=
 =?iso-8859-1?Q?g60id1me7xnoOy5JalDoUiKL6ZIkPo1ppcx43yV1mvRIqqH0chp8xsHy3j?=
 =?iso-8859-1?Q?Cf0oUFxPx+K9l7+mGsEfs/RPbVB6B2vEU9ntZc0rftK4yhIkqhTqcFJ+uK?=
 =?iso-8859-1?Q?ZBXOBa61vkjqIiU6jVZjMaOnJuhC4i25JTyJLG/3XDBr+VO+UdJ5+Bbsvx?=
 =?iso-8859-1?Q?6BDtx5h/4Qz0aRwocZ/xkiIQTdGdqTWATdK58ekm9cC7S+Jf1vqk2RsVkP?=
 =?iso-8859-1?Q?atwGQHKRjtI0a0fTAboCpkwdDe9Q2WryWRlpSapLZekY1cXEgzB/MSB/wK?=
 =?iso-8859-1?Q?hUruuAAQvSzla1lAVndvpDpuqLirdz8amWAj+MqD/4ULNoNGJiVT6W3pMU?=
 =?iso-8859-1?Q?kYGOyLnXKvNbqG6ZCZzW9tiF2QuuJrPhBS03Qx7hVQ2R13o9yDwnBVoDWU?=
 =?iso-8859-1?Q?SvbPvP1gNyWxyJ8fMdFisc3j63frRgWdKRMFYHiXulH3VwpPwhirQfOlyO?=
 =?iso-8859-1?Q?+ZjEFEHnuoe+s5x6ORUiv64xrRjqJeKZrc4bwjEz/lrHo9UUfwCb2AiEaX?=
 =?iso-8859-1?Q?DY2f/Mq2ZuI9Is4lMBXJNx2vecTDVI6/z0JDSYouAvN8Jy+0CeHecgpZ0b?=
 =?iso-8859-1?Q?pv7jCSL34uDpoFbg3eheI2Ekk3+xeK3WexHIe85p1izlwU16ncO6jA6x7c?=
 =?iso-8859-1?Q?REPijqjXVERQgtdtaWVYBfHrCNH4/YAQjfIT+dl8NmQpeVczNRkb3gEl3J?=
 =?iso-8859-1?Q?j+7kDNunPeEHxQBtn6IRSvy5jmdc0Wj8cg98m2UN1wj/+m1HU+RMTkahzf?=
 =?iso-8859-1?Q?wAYI4stXbMbBlmvDBzDO0MqOv/aR70mgwj2MpbiPbioAst737dHfsFs71o?=
 =?iso-8859-1?Q?ixnLiF8GESy/V+5v0tsPsgHZdVLEx5o9XDp8GTqq84lgoX/7uykKnWOWfz?=
 =?iso-8859-1?Q?MUXsA6+7C+GP1CUBYuq1C3jXoMb8dfSAVMCuAnJZ0WZsrY8o0mVi8f14JN?=
 =?iso-8859-1?Q?dWH7Uzsz7KyyrazakZqBzAO9jsJVNCD4ZJtIH4gDT+I6jk5B/8entNOFHz?=
 =?iso-8859-1?Q?ew+Y0wX4qB4JMMxUSM63Wodenmq8OpIPw8celygr0hmnRwH2wf/rqVKUPH?=
 =?iso-8859-1?Q?5Aon8jCLqQyCqwPcrs2huE2flPSvcvT3yC1spMGfphdZNYvuvjGTfb+eYK?=
 =?iso-8859-1?Q?rhxNOcq/YdY10ze5Pj00E2kyNkM/OYccVxw0LQNhTqffXDJ5mQjoOf05Mr?=
 =?iso-8859-1?Q?CrIlzJz9fOzVXVDNQT85R58bpzlGIuHSp9vWjLLmE0/hfKgco2PYY8vBWI?=
 =?iso-8859-1?Q?sRCeIh7yEYEMWl2SbAnK97DEJk/9?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(1800799024)(7416014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 08:27:57.5310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac1bcef-4c8c-42e3-31d4-08de4cfd7f1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6565

Hi Nicolas,

On this subject, could you help me understand what the following error mean=
 and how I should fix that:
https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen=
-project/hardware/xen-staging/ECLAIR_normal/andrew/eclair/ARM64/12604499722=
/PROJECT.ecd;/by_service/MC3A2.R20.12.html

Thanks
Bertrand

> On 6 Jan 2026, at 08:33, Bertrand Marquis <Bertrand.Marquis@arm.com> wrot=
e:
>=20
> Hi Andrew,
>=20
>> On 5 Jan 2026, at 19:14, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>>=20
>> On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>>> eclair-x86_64-testing:
>>> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>>>    LOGFILE: "eclair-ARM64.log"
>>>    VARIANT: "ARM64"
>>>    RULESET: "monitored"
>>> +    EXTRA_XEN_CONFIG: |
>>> +      CONFIG_ACPI=3Dy
>>> +      CONFIG_ARGO=3Dy
>>> +      CONFIG_ARM64_SVE=3Dy
>>> +      CONFIG_ARM_SMMU_V3=3Dy
>>> +      CONFIG_BOOT_TIME_CPUPOOLS=3Dy
>>> +      CONFIG_DEBUG_LOCK_PROFILE=3Dy
>>> +      CONFIG_DEBUG_TRACE=3Dy
>>> +      CONFIG_DEVICE_TREE_DEBUG=3Dy
>>> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy
>>> +      CONFIG_EXPERT=3Dy
>>> +      CONFIG_FFA=3Dy
>>> +      CONFIG_FFA_VM_TO_VM=3Dy
>>> +      CONFIG_GICV3_ESPI=3Dy
>>> +      CONFIG_HAS_ITS=3Dy
>>> +      CONFIG_IOREQ_SERVER=3Dy
>>> +      CONFIG_IPMMU_VMSA=3Dy
>>> +      CONFIG_LIVEPATCH=3Dy
>>> +      CONFIG_LLC_COLORING=3Dy
>>> +      CONFIG_OPTEE=3Dy
>>> +      CONFIG_OVERLAY_DTB=3Dy
>>> +      CONFIG_PCI_PASSTHROUGH=3Dy
>>> +      CONFIG_PERF_ARRAYS=3Dy
>>> +      CONFIG_PERF_COUNTERS=3Dy
>>> +      CONFIG_STACK_PROTECTOR=3Dy
>>> +      CONFIG_UNSUPPORTED=3Dy
>>> +      CONFIG_VM_EVENT=3Dy
>>>  allow_failure: true
>>=20
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
>> shows 122 failures in otherwise-clean guidelines.  Some observations:
>>=20
>> llc-colouring.c uses binary literals.  These are safe to use now since
>> 4.21 with the updated toolchain baseline, but the Eclair config wants
>> updating to allow this language extension.
>>=20
>> ipmmu-vmsa.c has a git:// url inside a block comment, which is
>> considered to be a Rule 3.1 violation.  In principle this ought to fix i=
t:
>>=20
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automati=
on/eclair_analysis/ECLAIR/deviations.ecl
>> index 7dee4a488d45..8f5fc6c93bc5 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is neg=
ligible."
>>=20
>> -doc_begin=3D"Comments starting with '/*' and containing hyperlinks are =
safe as
>> they are not instances of commented-out code."
>> --config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*https?://.*$=
))"}
>> +-config=3DMC3A2.R3.1,reports+=3D{safe, "first_area(text(^.*(https?|git)=
://.*$))"}
>> -doc_end
>>=20
>> #
>>=20
>>=20
>> but I've not tried it yet.
>>=20
>> There's a R8.4 violation against __stack_chk_guard.  I think this wants
>> deviating locally, because it's a fairly magic construct.
>>=20
>> Other than that, there's a smattering of violations.  Some will be fixed
>> by some work I've got pending for the x86 side of things, but most are
>> specific to arch/arm/.
>>=20
>=20
> They are quite a lot of violations coming from ffa.
> I have a pending serie on FF-A waiting to be reviewed/committed.
> I can push something to fix the findings after it, if that is ok for you =
?
>=20
> I will retrigger the CI from the branch corresponding to my serie and wor=
k
> from there.
>=20
> In any case, very good thing to activate all those and check with the CI,=
 thanks a lot :-)
>=20
> Cheers
> Bertrand
>=20
>> ~Andrew



