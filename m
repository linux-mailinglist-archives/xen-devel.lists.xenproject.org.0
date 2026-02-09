Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH3KA0+xiWndAgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:05:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035210DF5B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225105.1531570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpO7k-0004VT-4u; Mon, 09 Feb 2026 10:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225105.1531570; Mon, 09 Feb 2026 10:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpO7k-0004Tq-10; Mon, 09 Feb 2026 10:04:08 +0000
Received: by outflank-mailman (input) for mailman id 1225105;
 Mon, 09 Feb 2026 10:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpO7h-0004Tj-Pa
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:04:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d79706-059e-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 11:03:59 +0100 (CET)
Received: from AM8P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::11)
 by PA4PR08MB6221.eurprd08.prod.outlook.com (2603:10a6:102:ed::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:03:56 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::a8) by AM8P251CA0006.outlook.office365.com
 (2603:10a6:20b:21b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 10:03:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 10:03:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI0PR08MB11408.eurprd08.prod.outlook.com (2603:10a6:800:302::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Mon, 9 Feb
 2026 10:02:52 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:02:52 +0000
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
X-Inumbo-ID: a6d79706-059e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M6vinsgfn/Ya4CpKAdbWFwXhkLG4psMhyyUd6CduqOcYOh4qpN5guQxyp3Mtd+an7kEwScONLOovmCDIEfRsKN9KMqZQwPk7gt5KOlNYfNvI/nxFoUA8TxvFoxH3bWz3Yb+MO3uBedh6TMPKrV37XUxzI+MmIAQJSLEZCMC+TXSos6cNRSFqCl1zq+1pmWMeNIJCvrqSJH83wxPMi42XVJwFEosyC33go1nOISuN8962eGBkVT/PHXgZcLJgzxe+zr6LjlGXT1DZIwHz7rGJL8+Jxsp6iQEZ4N/6nhugEMAajaZKCa6Z9IcfwLGP59Wj9Qc3O3m1zsba45YW67hzJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbZc3J2/CTPqP6i6o8sB3W52G9qJzIrSebqk2GYF6T0=;
 b=KFAmtSFSPx4NNMW723UZSZ/Ml+Gy/AowawOPWpAyWUJX+I9GqSGyMGVlC1OVqdZcH8SgkU5O+2U0zX9BzJp/AhWoTPlUgtkXmMAJLdjLYDJz86KCp7o6FmgfXsU2s3IOI9IwRYs6vqWYgM7idxSKbjiOHIiIqcilSNObFcoERslGRAK6iTKqu3giMSIHX6UXJYvWkthIMDpHv6IuixYMg5fELnO024eu5f7xvf2EzWDqA8MvfkRveB/XtacHEcR6FkiaqsLjOT7JadkK6jN6/BXlZSN9hPHvP2BHNQuxB3PORecmWUugskl8eyBYDj6KKWoLlQIAG7M0vL+0LmO+Nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbZc3J2/CTPqP6i6o8sB3W52G9qJzIrSebqk2GYF6T0=;
 b=FoI2MpZMo383EY0NGfmJVp51/w1d/Np8XrgLWWCP89NuKQzISRMCcHYfTmnbSNdOpEU1vCaM50yy4Xj4xlS8ND1vS2cW8DQmbAFUWDQJDvHmbXvK0+UbDdh/i6NMPizbNwUyElpZWtduaPrX6ZTP8pTyFRmYW/i/Ck1M7LTq/8U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7uSOjlDS+qmmX2RsN/JIpx36kl0AvzLSYu5yfK8x/ZQ+DILqHvh7gODKDuN59yRmp4PQKIwY/eIe9CPnvExsWVOuP7FAFain2rZs2cgTgm+3QJCLrcBcr21rvxBpoYLDme0l5fRZqYsjsGAYYCJHZ1pssR2q6rk6AuxuXIFR/T+AIcyFGFsGeH0qJditd0HNVM9KIsbO9e4l4JS+B24A2KWs2TZiD14kgcbMaWJmG4lWq6hBWw/JXGhYK+lpiomkpTTquOw8Um23D+wJWlE+mCcBlZ01hRrd38CgUM1f+N5Xwuu3Fx6oIIy+EkqpsSJ3yN1bNPqbMEsYEJpU3x8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbZc3J2/CTPqP6i6o8sB3W52G9qJzIrSebqk2GYF6T0=;
 b=c0iEqxw13wi3kCFJ+lo3IlzVQlEG5ZYhyljOy3KFEwY61QksX2TqbfePdyJAE8nnB9BLNnKW3m+4/Rn9HKsnjTkZ8Qli57S9jGwAwtLyyTRpsVrrDtDwsL8tPJWPQYXCyeqcek4vQMvOURRbvAxaKdgQHxasUZtPkFoHk7PBUiMemXT7Je5GkVnLZiN9emolnn+yiauiYivMLocXXY0A4z3rjZ7TNoavMoKXiggrgowfS0hTpLUDW5LwsVShPWmvbi+DXe967ixqTZvyr+0dVug6bKFHb/XbpqqGu1xwJqqNHOHUgol9Ylwv2d7o5dqN1ZL0xK2kyzQSWNVzlHOA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbZc3J2/CTPqP6i6o8sB3W52G9qJzIrSebqk2GYF6T0=;
 b=FoI2MpZMo383EY0NGfmJVp51/w1d/Np8XrgLWWCP89NuKQzISRMCcHYfTmnbSNdOpEU1vCaM50yy4Xj4xlS8ND1vS2cW8DQmbAFUWDQJDvHmbXvK0+UbDdh/i6NMPizbNwUyElpZWtduaPrX6ZTP8pTyFRmYW/i/Ck1M7LTq/8U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Thread-Topic: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Thread-Index: AQHcl4TDvkxax6jik0exjnZrMlGqw7V17BsAgAQQvwCAABwvgIAACZqAgAAEx4A=
Date: Mon, 9 Feb 2026 10:02:52 +0000
Message-ID: <C851E211-4B56-489A-8F06-6512D785B611@arm.com>
References:
 <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan> <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
 <aYmksdxh5PM7IHDN@Mac.lan> <d43840ca-4e06-45c4-853d-bd666ea06bc0@suse.com>
In-Reply-To: <d43840ca-4e06-45c4-853d-bd666ea06bc0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI0PR08MB11408:EE_|AMS1EPF0000003F:EE_|PA4PR08MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: d16b6253-ea6b-45dd-74a7-08de67c2898c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OFA1eUV0WEhUOUpzZ2g5SHBUYUJnSzNubWNtYTNPNXBud2JkZ3R0cnJodHlD?=
 =?utf-8?B?aDZtRnFma295cjh2b1hpN2VGRkhZd0FCU05ha21VQTBUMnA0SVh1WlRoRStv?=
 =?utf-8?B?OGIwdUprUG9mcmJneWZydWlsWUhtaWRtTFd0MWRQMUtHaUNBeGNLM3VpRWdz?=
 =?utf-8?B?ajhGZ1I3YXUyc21rMDA3eThLdVVsTXhvT2pGcDlsVHhmeHhpWnNjZHBGaXJI?=
 =?utf-8?B?Y09xajBHVmNRQlQ2R3ErUEY3UCtjdWdyb3hlVW5jSVdUWnlsSGR5VmlYYnN2?=
 =?utf-8?B?aUVDaStYZ0pqU0UzWHhmNkxVZXBJeS8xUTRRdmVlYUxBU2daeXg2cGU1S0Ex?=
 =?utf-8?B?QVlFZ2tFaW5pUGFOdUlxUDJLQS9iNWlGd084NHY0d21DRmdTMGtnQjA3WU16?=
 =?utf-8?B?OWdRdnh5dmJsUVFlNkxXbTNTZnVPZ082YnhmbHBlVHMvUGVyQ0lWTUlrajVY?=
 =?utf-8?B?V2tQdWNoclQwUFB0NldSODdyZ0VOUWRYcWNuRFVyb3YvME5MUTVsc1FYWC9B?=
 =?utf-8?B?WEhVTmc4ZFJ6VTNiMjJWZ0NwQ3VuWDk5am1NZFh6UCszNkxuTTRtRTRjZGJs?=
 =?utf-8?B?c29MY0N4c2JMTm9uTjdMWm9ORHBEbFViS3F2M0twNUdqQm9lbGVhazJ4MjZl?=
 =?utf-8?B?aTBZbkxaV3ZNZVlNYzcyOHFleGMrbllxY296MG81clVLL0lia2lndXQrZzRM?=
 =?utf-8?B?bnAzUWNIeFQ3TVM0Q2V4cVZmVXluaVhBaHZraElnazBuRWUxSEc3VTlydDlM?=
 =?utf-8?B?UG1UT1ZpQWFoSVZoSktaeUJ1cXNWQlMzUTA4cnNhL3dHMWY0emVOMUFvNWVm?=
 =?utf-8?B?bnIwL1hTTGk2V0tpK1U0a3c4Y2JxVStITUJNSTZOSkRDZmh3NUF2L0pFNStN?=
 =?utf-8?B?VEpDSzNVL3I0aitJaXdQOGhBT21pT0hHV2VhNVlRNTJnQ3FXeHhRZlJ6azZV?=
 =?utf-8?B?N3A1bkJ5M0M3d3BVZ2VXZmNkOHMyOWVXYUc1bUhuUVF2MFJhd0pmVVltd0Vs?=
 =?utf-8?B?bHprYzV4SGVEeWkzNjRESTFiYURXVTk4Z0Y0Mzcvc1V4VlArT0h1WU5ZeUlX?=
 =?utf-8?B?V1dES2Vzc2RuYlp2T3lVd0k2M3psMjQ3eEtaVVhTZThXT2VsalAvaXVKMG9B?=
 =?utf-8?B?SzcyeGtTU0hlTFFhYUJuVVVFTEdCZ3J1VWp5bFJreVFPODVQYVd1bEpzb1M1?=
 =?utf-8?B?NUtQTmJ3cWFzaFRnK0g4WldYT1FMY3IrS3dyaGN2K2Z2dDVSOW00QllnMC9M?=
 =?utf-8?B?Qlc4VjFiVTNtQjYxWVQ3SFhoandQQjQ4QmFmazlyK3FvRUdQVFJ5Z2ZuQ2xy?=
 =?utf-8?B?eXZjTTJmd2dYbDFYa3lYRHppeTVleDNRRDZsZVhnZGhwd0htRHBDT2Y2N3c1?=
 =?utf-8?B?bzljclUvQitJOWpwd3ozNmZtUGYza3NKTktrZmtzZmRmT005WXNlQWc2cVFr?=
 =?utf-8?B?ZmNGMzV1eU5Odm9JQ0w4RWtBZXhuRXhlL2dIUklqUHB1N1UwMjh2bTRLWWMw?=
 =?utf-8?B?OHZkRTBob0xZQ1ZXa2Vua044L3pMM08vZ21kRERPRk1kQS9tR3Q4UXNNNUs0?=
 =?utf-8?B?SWF1aXMwR0lSNjVPSitCTStzUFVJd2ZRc3U1WmRGSnYyQklLaXphc3RlbmZ3?=
 =?utf-8?B?VnJPU3l3N1I0NkdSb2owR0o1T0xkTGd5V25IakEyc1Q5VzlKS1JpV1MzRWU2?=
 =?utf-8?B?QTNEZFJHQWdyRHBMNkU3TzVZZ2plRmZUdEtWcTVIRjBGL2tWbk0vb0RyZ3ly?=
 =?utf-8?B?T0E3eUZ3YWRnMG5QeDB0VlJZM0xIWk84S2NCR1RVUjV1VUJtemRmUUVRdEdi?=
 =?utf-8?B?dGlVYjhvK3V6a3BraGRxb1diREQwSmF2d3M3U0hTOVUzVWhRbmI2L2FvZk1o?=
 =?utf-8?B?NG5ja3p5RHh0b1VzRjUyMkUxU2dkWjdGVWpMTk5GZUtRa2ZJRCtvcjhqb0Zz?=
 =?utf-8?B?N3JYSDF3M0lFYVN3bDJES0FxeFNtR0xNdXFPaWdPKzR2Yld2eVJmZzFxSnR1?=
 =?utf-8?B?ckRQeVBHSjR2YjJVTkZ2L2x0VlQySFFxWFVwVXhDNXMzUHhyMEFPdmlEMmpa?=
 =?utf-8?B?RDhzaVowRUVGaStnT2lqWjE5VHMvV3hVSE04VU9oRWZmcjVVZlgwUG9zMUs0?=
 =?utf-8?B?ZUF0bVc3a3krUGJWUHlwMTRleW5abmdWOVg0amJqeGwzcHUwZklxUy96a09r?=
 =?utf-8?Q?w7bY6xEzm/3A4mVAFYh0OTI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCA2117C57B2104694AB6507E99FADEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11408
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8df4ff0-423d-4d5a-ad81-08de67c2639b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0R6bG1oOFdIVjdJMWM2cjdQQTdiOWIyMWlwNHpqaEdMRnI5WkxYU21PbmdC?=
 =?utf-8?B?MzIvNlppcGhYQVhicTQzUGFQdlNoNGFpNTRpN0RwRFMvbFE2UTBDOEcxY211?=
 =?utf-8?B?dlpSWFgwLzRKeHh3T3VxOExQNjN2OHFLNldKd1pTSzZmeUd0bTBLQmVJN1M2?=
 =?utf-8?B?aXk4ZVpOck9QMmhMWmdaaTQrUXNYczBDK0FLWEJwbFBvWWZvdzc2TEp1cWZy?=
 =?utf-8?B?ZTAwb1d2OEFmdkkzcHZtbWpYbW56OUU1VEpGbFRleDNGU0RxQ1gwa01MUGFR?=
 =?utf-8?B?UVhwMFVaZHNXcEdnVURnWGw4WmJxQVFVdGRzN2MwVzA2bmdHSU5OTmd5ZTAx?=
 =?utf-8?B?RlVuZDdHQ0RDTUNsaVNmV3hMTmVmRHY5U1JCcmVLMlpSUlYyeDVNQkw3cDdE?=
 =?utf-8?B?K2V1S3IrdldpUWxkZFBtU3J4ZHBWZk0rM25Ha2JXZXJZSkFZTzlkV1ZMZHB0?=
 =?utf-8?B?TG84SUNTV3BGT1Vab2ZWS1AreWNObUR0MlUrdGNyWDdQSmdPalZTU1lWbEpy?=
 =?utf-8?B?WjR2ZUV2dSs2bzZ0eUxUc2RKWkF1dkprTGVsYnJNTUhNaExDWkJxd1dOekRw?=
 =?utf-8?B?NmV4dUZFd1ptMmp3T3c4MklOdnhyM1JtTHV1aW5IMGloSDZOZXFDS2VET01N?=
 =?utf-8?B?eWFub0xrQWZwSDc1ZDdQdFZiZlVZVkpuOHA4OVFPSFB3VVA2dUFkekNMR0Fq?=
 =?utf-8?B?NmQ5QkVXSTdlL09ZS3ZDZHNTRUhDODdiT2FZazN5blM1QS9YN1Q5M21HSWdL?=
 =?utf-8?B?NHhkUlJjbWovOGVEVW0zU3RDSjYzNkRpV3ZLUnRCT2lGNE4wUHEycEJzRncy?=
 =?utf-8?B?VUl0RVMvaWs5N2JlNkR4aHlDbHRZQWM3QW1zSkI4SVc2Wkw2ZWZJZk1mYWNM?=
 =?utf-8?B?NmdsOXR3bnFrRVMrdVFaOUQ3cUxJUStjZE1GNVg4bWFQYS9maVRxSm9TMm43?=
 =?utf-8?B?YTFRTmJGWjVreUhTM2VFV29EUGhIVGNqMTZJRTRkNis1dWJ3SVZHYVdidFR5?=
 =?utf-8?B?NEt0ZzJzK0ZXNE5hL1llcmErVENtZVJFZHBYSHM5SlpaRjBuajNUaDlsT3BP?=
 =?utf-8?B?Z2Y4RnB0bCtTVlpKN2k3TXJtZkJ5MlNIQk1ydURPYkgxWVJBN0ZDaWtEd3k5?=
 =?utf-8?B?Z3hMTWp1eHhsTU45aXRLbng0c1c4alhOWXJMS3hjRm5RMkFNdkRUV29sdk9N?=
 =?utf-8?B?TEVWSThNdkI2cHBVVjJZd0FxbnNKMFZacDNLQXdaaWhxWVY3SjF3OElLV0xO?=
 =?utf-8?B?bkhOQnB4US8rRkVBaHZjRDMzZU1nUG9iamR2dUFsV045b2MxSEo4aUZ6SnU5?=
 =?utf-8?B?OWZaa0xwMzJhYjZBRS9PbVZXZ2hWM1QzWWxzQ1d3cU55N1hSZk5FV3I3Qllj?=
 =?utf-8?B?aXV2RU11Y3RRbk1TbGF2ZzY3akE3L1BGaWdOTWdRV0dNazAxdGZwVjhIUmdO?=
 =?utf-8?B?dlFab0Z0M09NTnZPNTdVb21paVhMei9KQjlUSjI5TVBjZzlFWWJ4ajV6NkJY?=
 =?utf-8?B?eXArQWVVZERVaGFRNjZtN3I4RGYwbFhYRjJsWERpa25VbE92RDhscUlUZG02?=
 =?utf-8?B?N2RkNmdaN0RSOHNBSStFeWJ4aGVPU1l2Mm9Eb2JrYUNSMFgwakJnMDJQQVdV?=
 =?utf-8?B?S0xzYWxEWWhXYWViWHpzVENtT3hVbWFBaXVyNmZEYktWM1VueHpKanorWmVq?=
 =?utf-8?B?eWk2KzZKQ1QvY3ZMdXJrSmUxZzU0Ym5zd280aEs2cG4zdzB1TzZROVgvdFRY?=
 =?utf-8?B?NDFDSng0Rzd4U0ZDZ2xEWmJSSllhQ2NyK0hCbXhxZ3h2RXZpRlQ4bDVSdFhj?=
 =?utf-8?B?NkRIaStDL0tDRGpMZEJrZkNoYTB4N1pQdXZUc1JBTCs5L3E2d0tlMHk5d2FP?=
 =?utf-8?B?SE81WjQ3ZTVIbjY3dFUxM1A1SVNPVTRKUFQ5Nmc1YkpsVjYyREREWnVVanlV?=
 =?utf-8?B?RG9HMEtWSnhlbkduQk1ISFVEZXN2ekR3SUlaeFFFOFNLUEo3UzJ4c1NISHVr?=
 =?utf-8?B?UklweTBVdWk4aWJwZXgxdDNsd28ybzhtNDZpa1NkWHNjVzVkeUZvMy9vaWNS?=
 =?utf-8?B?b0lpbkxkOURXM2FMY29lRzcrbGFOQlR1Q1grS2J3WEtaK05XVVBkWDVHV2VJ?=
 =?utf-8?B?Uktlb0lLSmxzZncyN2FaL1dXRTVZWUU1aUkxTGFOVkZqM0RhK1hoVDFiOTVw?=
 =?utf-8?B?NXdDcy8zZDhucWFDZVZ2K2hhNEtJMzNjamhsdVViUXFsMjluRVB1OUxQOVdX?=
 =?utf-8?B?bUJhSEJacjk2enhRZVR5TFl4SG1RPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9bRGcvAK71yFjJFPOdbFXLrIY1IY1QdOmWLNZslrBvP/jjDUHaxoQaFXhRQrMfmNvs7yYj9V7vQRQAP91EXjLWIroEsDXhySywFWaFUBZqzsPlC4eUh3fm6bon47sDHewQvPd2GvbBuFXovncMuXOIHpho6CEfr25gFn9XvDdXk0s4JpfPMEvzbxOzOSzr7hUe2XgRgMDrmYTewUA3NaJb7BwayrGI9EtKUgYlAjsEE+vHNGxbS3WLf5D2KgtyQ3026YeoEmJdZDzZzS8e1QgDGWomSEJfw03S0eDV5eoTCBNeG2SDg99wiWb78E6OJaDw0b2Xbvliag3Sft4CrafKrvrOsAupYYrYSnSlm9tUDt8MSCrvWV+DohSllm8VMep7xV3v04ezOhNE0ZK3WRuhke7UMp4wIqq4uUpP/SnRw7FjCRa27VUooKE5vM/GkS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:03:56.1067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d16b6253-ea6b-45dd-74a7-08de67c2898c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,stdgnu.mk:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1035210DF5B
X-Rspamd-Action: no action

SGkgSmFuLA0KDQo+IE9uIDkgRmViIDIwMjYsIGF0IDEwOjQ1LCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDIuMjAyNiAxMDoxMSwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToNCj4+IE9uIE1vbiwgRmViIDA5LCAyMDI2IGF0IDA3OjMwOjMwQU0gKzAw
MDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gSGkgUm9nZXIsDQo+Pj4gDQo+Pj4+IE9u
IDYgRmViIDIwMjYsIGF0IDE4OjI1LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiBGcmksIEZlYiAwNiwgMjAyNiBhdCAwNToyMTo0
NFBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gWGVuIGRvZXMgbm90IHBy
b3ZpZGUgYSBEYXJ3aW4gYnVpbGQgY29uZmlndXJhdGlvbiBmb3Igc2VsZWN0aW5nDQo+Pj4+PiBH
TlUgdG9vbCBkZWZpbml0aW9ucy4gT24gbWFjT1MsIHRoZSB0b29scyB3ZSB1c2UgYXJlIGVpdGhl
ciBHTlUNCj4+Pj4+IGNvbXBhdGlibGUgb3Igd2Ugb25seSByZWx5IG9uIGZlYXR1cmVzIHN1cHBv
cnRlZCBieSBNYWMgT1MsIHNvDQo+Pj4+PiB1c2luZyB0aGUgR05VIHRvb2wgZGVmaW5pdGlvbnMg
aXMgYXBwcm9wcmlhdGUuDQo+Pj4+PiANCj4+Pj4+IEFkZCBjb25maWcvRGFyd2luLm1rIHRvIGlu
Y2x1ZGUgU3RkR05VLm1rIGFuZCBmb3JjZQ0KPj4+Pj4gWEVOX0NPTVBJTEVfQVJDSD11bmtub3du
LCBlbnN1cmluZyBEYXJ3aW4gYnVpbGRzIGFsd2F5cyBmb2xsb3cNCj4+Pj4+IHRoZSBjcm9zcy1j
b21waWxlIHBhdGggYXMgd2UgZGVwZW5kIG9uIHRoZSBMaW51eCBBQkkgc28gY29tcGlsaW5nDQo+
Pj4+PiBvbiBNYWMgT1MgaXMgYWx3YXlzIGEgY3Jvc3MgY29tcGlsYXRpb24gY2FzZS4NCj4+Pj4+
IA0KPj4+Pj4gQW4gZXhhbXBsZSBvZiBob3cgdG8gYnVpbGQgdGhlIGh5cGVydmlzb3IgZm9yIGFy
bTY0IG9uIE1hYyBPUw0KPj4+Pj4gKHRvb2xzIGNhbm5vdCBiZSBidWlsZCBmb3Igbm93KSB1c2lu
ZyBhIHRvb2xjaGFpbiBmcm9tIGJyZXc6DQo+Pj4+PiAtIGJyZXcgaW5zdGFsbCBhYXJjaDY0LWVs
Zi1nY2MgYWFyY2g2NC1lbGYtYmludXRpbHMNCj4+Pj4+IC0gY2QgeGVuDQo+Pj4+PiAtIG1ha2Ug
WEVOX1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NPTVBJTEU9YWFyY2g2NC1lbGYtIEhPU1RDQz1j
bGFuZw0KPj4+PiANCj4+Pj4gSW5zdGVhZCBvZiBgY2QgeGVuYCBJIHdvdWxkIHVzZSBgbWFrZSB4
ZW4gLi4uYC4NCj4+PiANCj4+PiBBY2sgdGhlICdjZCB4ZW4nIGxpbmUgaXMgdXNlbGVzcyBhbmQg
c2hvdWxkIGJlIHJlbW92ZWQuDQo+Pj4gDQo+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4+IA0K
Pj4+PiBBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+
Pj4+IA0KPj4+PiBPbmUgY29tbWVudCBiZWxvdy4NCj4+Pj4gDQo+Pj4+PiAtLS0NCj4+Pj4+IENo
YW5nZXMgc2luY2UgdjM6DQo+Pj4+PiAtIHNldCBYRU5fQ09NUElMRV9BUkNIIHRvIHVua25vd24g
aW5zdGVhZCBvZiBEYXJ3aW4NCj4+Pj4+IC0gbGlzdCBiaW51dGlscyBhcyBhIGRlcGVuZGVuY3kg
dG8gaW5zdGFsbCBpbiBicmV3IGluIGNvbW1pdCBtZXNzYWdlDQo+Pj4+PiANCj4+Pj4+IENoYW5n
ZXMgc2luY2UgdjI6DQo+Pj4+PiAtIFN1YmplY3Qgd2FzICJ4ZW46IEFkZCBtYWNPUyBoeXBlcnZp
c29yIGJ1aWxkIGNvbmZpZ3VyYXRpb24iDQo+Pj4+PiAtIFVwZGF0ZSBEYXJ3aW4ubWsgY29tbWVu
dHMgdG8gbW9yZSBhY2N1cmF0ZSB2ZXJzaW9ucyAoSmFuKQ0KPj4+Pj4gLSBSZW1vdmUgdGhlIGJ1
aWxkLW9uLW1hY29zIGhlbHAgYXMgd2UgaGF2ZSBubyBkZXBlbmRlbmN5IG9uIGFueXRoaW5nDQo+
Pj4+PiBjb21pbmcgZnJvbSBicmV3IGFueW1vcmUgYW5kIHRoZSB0b29sY2hhaW4gY2FuIGJlIHJl
dHJpZXZlZCBieSBsb3RzIG9mDQo+Pj4+PiBvdGhlciBzb2x1dGlvbnMgdGhhbiBicmV3IG9uIG1h
YyBvcy4gU3dpdGNoIHRvIGEgc2ltcGxlIGRvYyBpbiB0aGUNCj4+Pj4+IGNvbW1pdCBtZXNzYWdl
IGluc3RlYWQNCj4+Pj4+IC0tLQ0KPj4+Pj4gY29uZmlnL0Rhcndpbi5tayB8IDcgKysrKysrKw0K
Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IGNvbmZpZy9EYXJ3aW4ubWsNCj4+Pj4+IA0KPj4+Pj4gZGlmZiAtLWdpdCBhL2NvbmZp
Zy9EYXJ3aW4ubWsgYi9jb25maWcvRGFyd2luLm1rDQo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xNzZiMjdlYWM2NzYNCj4+Pj4+IC0tLSAvZGV2
L251bGwNCj4+Pj4+ICsrKyBiL2NvbmZpZy9EYXJ3aW4ubWsNCj4+Pj4+IEBAIC0wLDAgKzEsNyBA
QA0KPj4+Pj4gKyMgVXNlIEdOVSB0b29sIGRlZmluaXRpb25zIGFzIHRoZSB0b29scyB3ZSBhcmUg
dXNpbmcgYXJlIGVpdGhlciBHTlUgY29tcGF0aWJsZQ0KPj4+Pj4gKyMgb3Igd2Ugb25seSB1c2Ug
ZmVhdHVyZXMgd2hpY2ggYXJlIHN1cHBvcnRlZCBvbiBNYWMgT1MuDQo+Pj4+PiAraW5jbHVkZSAk
KFhFTl9ST09UKS9jb25maWcvU3RkR05VLm1rDQo+Pj4+PiArDQo+Pj4+PiArIyBYZW4gdXNlcyBM
aW51eCdlcyBBQkkgc28gd2UgYXJlIGNyb3NzIGNvbXBpbGluZyBvbiBNYWMgT1MuDQo+Pj4+IA0K
Pj4+PiBIbSwgaXMgdGhpcyBhY3R1YWxseSBmdWxseSB0cnVlPyAgV2hhdCdzIHRoZSBMaW51eCBB
QkkgZXhhY3RseSBoZXJlPw0KPj4+PiANCj4+Pj4gRnJlZUJTRCBidWlsZHMgWGVuIG5hdGl2ZWx5
LCBhbmQgaXQncyBub3QgdXNpbmcgdGhlIExpbnV4IEFCSS4NCj4+Pj4gRnJlZUJTRCB1c2VzIG5v
IHNwZWNpZmljIC10YXJnZXQgdG8gdGhlIGNvbXBpbGVyIGludm9jYXRpb25zLCBhbmQgdGhlDQo+
Pj4+IGxpbmtlciBlbXVsYXRpb24gaXMgc2V0IHRvIGVsZl94ODZfNjRfZmJzZC4NCj4+Pj4gDQo+
Pj4+IEkgdGhpbmsgdGhlIHBvaW50IGhlcmUgaXMgdGhhdCB0aGUgdG9vbGNoYWluIG11c3Qgc3Vw
cG9ydCBidWlsZGluZyBFTEYNCj4+Pj4gb2JqZWN0cyAvIGltYWdlcywgYmVjYXVzZSB0aGF0J3Mg
dGhlIGJpbmFyeSBmb3JtYXQgc3VwcG9ydGVkIGJ5IFhlbi4NCj4+Pj4gV2hldGhlciBpdCdzIExp
bnV4IEVMRiBvciBGcmVlQlNEIEVMRiBkb2Vzbid0IG1ha2UgYSBkaWZmZXJlbmNlIGZvcg0KPj4+
PiBzdGFuZGFsb25lIGVudmlyb25tZW50cyBsaWtlIHRoZSBYZW4ga2VybmVsLg0KPj4+IA0KPj4+
IFRoaXMgZmlsZSBpcyBhbHNvIHVzZSB3aGlsZSBjb21waWxpbmcgdGhlIHRvb2xzIGFuZCBmb3Ig
dGhvc2UgeW91IGRlZmluaXRlbHkNCj4+PiB0byBjcm9zcyBjb21waWxlIGFzIHRoZXkgZGVwZW5k
IG9uIExpbnV4IEFCSS4NCj4+IA0KPj4gSSdtIG5vdCBhbiBleHBlcnQgb24gdGhpcyBhdCBhbGws
IGJ1dCBJTU8gdGhlIHRvb2xzIGRvbid0IGRlcGVuZCBvbg0KPj4gdGhlIExpbnV4IEFCSSBhdCBh
bGwuICBBbnlvbmUgY2FuIGFkZCB0aGUgbWluaW1hbCBPUy1zcGVjaWZpYyBiaW5kaW5ncw0KPj4g
cmVxdWlyZWQgZm9yIHRoZSB0b29scyB0byB3b3JrIG9uIGVudmlyb25tZW50cyBkaWZmZXJlbnQg
dGhhbiBMaW51eC4NCj4+IFdlIGN1cnJlbnRseSBoYXZlIHtOZXQsRnJlZX1CU0QgYW5kIExpbnV4
LiAgSW4gdGhlIHBhc3Qgd2UgYWxzbyBoYWQNCj4+IFNvbGFyaXMsIGJ1dCB0aGF0IGhhcyBiaXQg
cm90dGVuLg0KPj4gDQo+Pj4gTWF5YmUgdGhhdCB3b3JrcyBvbiBCU0QNCj4+PiBidXQgaSBkb3Vi
dCB0aGlzIHdvdWxkIGJlIHRoZSBjYXNlIG9uIG1hYyBvcy4NCj4+IA0KPj4gSSBkb3VidCB3ZSB3
b3VsZCBldmVyIGhhdmUgYW55IG5lZWQgdG8gYnVpbGQgYW4gT1NYIG5hdGl2ZSB0b29sY2hhaW4s
DQo+PiBhcyBpdCdzIHVubGlrZWx5ICg/KSB0aGF0IHdlIHdpbGwgZXZlciBnZXQgWGVuIHN1cHBv
cnQgaW4gdGhlIERhcndpbg0KPj4ga2VybmVsLg0KPiANCj4gSWYgRGFyd2luIGhhcyBzb21lIHdh
eSB0byBsb2FkICJtb2R1bGVzIiAoZS5nLiBkcml2ZXJzKSBpbnRvIHRoZSBrZXJuZWwsIGl0DQo+
IG1heSBpbiBwcmluY2lwbGUgYmUgcG9zc2libGUgdG8gcnVuIE9TWCBhcyBhIEhWTS1Eb20wLCB3
aXRoIGEgWGVuIGRyaXZlcg0KPiBsb2FkZWQgc2VwYXJhdGVseS4gVGhhdCdzIGZhciBmZXRjaGVk
LCBJIGtub3cuDQo+IA0KPj4+IE1heWJlIHdlIGNvdWxkIHNpbXBsaWZ5IHRoZSBzZW50ZW5jZSB0
byBub3Qgc2F5IGFueXRoaW5nIHdlIGFyZSB1bnN1cmU6DQo+Pj4gDQo+Pj4gIyBDcm9zcyBjb21w
aWxlIG9uIE1hYyBPUw0KPj4+IA0KPj4+IFRlbGwgbWUgaWYgdGhhdCB3b3JrcyBmb3IgeW91IGFu
ZCBpIGNhbiBzdWJtaXQgYSB2NSBvciB0aGlzIG1pZ2h0IGJlIHBvc3NpYmxlIHRvDQo+Pj4gZml4
IG9uIGNvbW1pdC4NCj4+IA0KPj4gSSdtIGZpbmUgd2l0aCBpdCwgSSB3b3VsZCBsaWtlIHRvIGhl
YXIgSmFuJ3Mgb3Bpbmlvbi4NCj4gDQo+IEFzIGxvbmcgYXMgaXQncyBjbGVhciB0aGF0IGFsbCBv
ZiB0aGlzIGlzIG9ubHkgYWJvdXQgYnVpbGRpbmcgdGhlIGh5cGVydmlzb3INCj4gKHdoaWNoIGRv
ZXNuJ3QgbG9vayB0byBiZSB0aGUgY2FzZSByaWdodCBub3cgYmV5b25kIHRoZSBleGFtcGxlIGdp
dmVuIGluIHRoZQ0KPiBjb21taXQgbWVzc2FnZSwgd2hpY2ggbWF5IGJlIHRha2VuIGFzIHJlYWxs
eSBvbmx5IGFuIGV4YW1wbGUpLCB0aGF0J3Mgb2theQ0KPiBbMV0uIEknZCBzdGlsbCBwcmVmZXIg
dG8gbWVudGlvbiB0aGUgU1ZSNCBBQkkgaGVyZSwgdGhvdWdoLCB0byBhdCBsZWFzdA0KPiBzb21l
d2hhdCBleHBsYWluIHRoZSAiYWx3YXlzIGNyb3NzIiBhc3BlY3QuDQo+IA0KPiBJIGNhbiBtYWtl
IGVkaXRzIHdoaWxlIGNvbW1pdHRpbmcsIGJ1dCBJJ20gdW5zdXJlIHdoZXRoZXIgdGhhdCdzIHdh
bnRlZCBpbg0KPiB0aGlzIGNhc2UuDQoNCkkgd291bGQgc3VnZ2VzdDoNCg0KQ3Jvc3MgY29tcGls
ZSBvbiBNYWMgT1MsIG9ubHkgaHlwZXJ2aXNvciBidWlsZCBoYXMgYmVlbiB0ZXN0ZWQsIG5vIHRv
b2xzDQoNClBsZWFzZSBkbyB0aGUgZm9sbG93aW5nIGVkaXRzIG9uIGNvbW1pdCBpZiB0aGF0J3Mg
b2sgZm9yIHlvdSA6DQotIHJlbW92ZSAnY2QgeGVuJyBmcm9tIGNvbW1pdCBtZXNzYWdlDQotIHVz
ZSBwcmV2aW91cyBjb21tZW50IGluIERhcndpbi5taw0KDQpPdGhld2lzZSBoYXBweSB0byBzdWJt
aXQgYSB2NQ0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0KPiANCj4gSmFuDQo+IA0KPiBbMV0gWWV0
IGJldHRlciBtaWdodCBiZSBpZiB3ZSByZWZ1c2VkIHRvIGJ1aWxkIG90aGVyIHRoYW4gdGhlIGh5
cGVydmlzb3IuDQo+IEknbSB1bnN1cmUgdGhvdWdoIGhvdyBlYXN5IGl0IHdvdWxkIGJlIHRvIGFj
aGlldmUgdGhhdCBpbiBhbiBhdCBsZWFzdA0KPiBoYWxmd2F5IHRpZHkgbWFubmVyLg0KDQoNCg==

