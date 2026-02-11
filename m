Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EEPKnZjjGkFmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:09:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE561123C12
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227303.1533649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq861-0001w9-TC; Wed, 11 Feb 2026 11:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227303.1533649; Wed, 11 Feb 2026 11:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq861-0001uh-QR; Wed, 11 Feb 2026 11:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1227303;
 Wed, 11 Feb 2026 11:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq860-0001ub-J1
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:09:24 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ecb63c1-073a-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:09:23 +0100 (CET)
Received: from AS4PR09CA0023.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::13)
 by VI1PR08MB10174.eurprd08.prod.outlook.com (2603:10a6:800:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 11:09:19 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::fd) by AS4PR09CA0023.outlook.office365.com
 (2603:10a6:20b:5d4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 11:09:18 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 11:09:19 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB8734.eurprd08.prod.outlook.com (2603:10a6:20b:564::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 11:08:14 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:08:14 +0000
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
X-Inumbo-ID: 1ecb63c1-073a-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DZtO/PDlacwKc+7IGQoD1yMIMfvTwnVkD/1wWWwcDW8cfSp7GhcZBN7hjYmjElipoQRXZ2is21sKrrzUNKks+ANMZi8hp4ypwiPm+gevSDWz4fi76lT4HaEIs/F0b955716yGU9fLMIK/CEF42kWTrKV4zq1l0yJUaL3ijSZ/31/1DjsrCnQwfoF4OpVOkJfJnIL3KZsG/C5c6eO0eVMgKstHDcGsjqRsMAUgLqb9mG4bk1NEO456CNFGxi5N0kxop+IViiKaCGqpnRIVePJ13bC5sK1WtshFNPqwUHbNLr1qDlhAczP08CdEtH+c7ZQQWNov5ZEwh9KPa9T8JTnRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omeW+HwHxjhhmMyqROUjTaoySPW34Najk1rGtQyUc/Y=;
 b=pmiZSi4G+t4PSRGRFiKxUBBCItNFGXUDlcQQo2uowuvhDGj2D+3HTj6XoVMT2vdc9M9QsUIlduPPJBi4SDrhuENDgSSHIY15KNjMRKUPatkkkPXYc2ODSAKyBxCnHZDZ6gb77pYgBR6YK3ucz9wEFaYPOkPSZoqTHDsjQqho8RSXKeDOYXvX7udeXZbs1n/pGpLWBF1JGkNzVYMPIAaGD25iFdh53QowVtaZCPkzPsKaXtFA8iFoWujhEVCjEzQyaqkj9TRaWAwOUkiKWt1zd+qD6/gxnEphA5TBlHr/7sq2tFuNu53oNndhVZVHjSkzPn0R0vFrlp8tWhsuP+UqWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omeW+HwHxjhhmMyqROUjTaoySPW34Najk1rGtQyUc/Y=;
 b=kX56Bo8S16Vj6NLj0IWqtGomyervQwYGh3mnD7stVhTS31GHrqrZ46RNnuCsrDsMM96ae/UjehSIO5wXdKAUmCYHP2bCQVxq4UguI/PGTkliL2czOfbQgUAXp7g7YbJLyrhZVBX1wR2UTa4M4OfV3BkDCT4/D8P8keX4oBRAMf0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwusZM5CdIqxeANoBcj1O5RCnt1aqF9PihynA0TS6JvLyAkH1xLpUL9PXWfqE9U0sLdMA4dWCg9mrfjTJ+gk9OpCjphrVbjsIRnO9yGvI3CtqjfCX6wpgLGyYrUZ3SMswSbFNiFFa7G5X7dAVRvLP7Kt9IHDw34C1kZ2ckU8frxGeDDYrRaS12HUOdiXP3q9/Egav/xMJV3jAYrZEd7ripdLNY+9kmtaprgCiQ/OsRjvG/QMc/E2qxipiZBpmpXZkMXO2VhNrpi7hnNfHc0NHQ/+0NRvHkjvsnzMquQj+QTEy9NIdGhcM9Dv/ogdcIj9Cp5zG1bSJ1yWP3Ug0rBwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omeW+HwHxjhhmMyqROUjTaoySPW34Najk1rGtQyUc/Y=;
 b=T3Pi9gRb05FVV2izm0fj7eqHOix4dvuTSWibXJ6MLxBnyOVfJggaNd0UKm03xovfDwVlAuyCjpFUq6hqS11otmsXIOtpgswxzOPxEiW0QeIMEf7f+h9p+RdJv95h+gBtFPc3JjnVU+0lZpYWAgrBIPhgiS6uKM1P0eFAKjP8uVn6WpSbct/hfSFV7dG6eBGfkVlJUKKHGiXA85FwvkL7JCtzuqKzP/QKzvDWycanAGE7duruRlz/OsThyDNzJzaGZhNoufXji+WuZ/vuEjM1pYu2rRc2K3HOIKFq7piFZdA2/2HBrtBN3ck9Y8c5otK3H7bJmT1+BMCKOl16SXit+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omeW+HwHxjhhmMyqROUjTaoySPW34Najk1rGtQyUc/Y=;
 b=kX56Bo8S16Vj6NLj0IWqtGomyervQwYGh3mnD7stVhTS31GHrqrZ46RNnuCsrDsMM96ae/UjehSIO5wXdKAUmCYHP2bCQVxq4UguI/PGTkliL2czOfbQgUAXp7g7YbJLyrhZVBX1wR2UTa4M4OfV3BkDCT4/D8P8keX4oBRAMf0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 2/5] xen/tools: remove usages of `stat -s` in
 check-endbr.sh
Thread-Topic: [PATCH 2/5] xen/tools: remove usages of `stat -s` in
 check-endbr.sh
Thread-Index: AQHcm0PEG2YcjpXtf0qy6VnbXjUrurV9VtsA
Date: Wed, 11 Feb 2026 11:08:14 +0000
Message-ID: <2F1AE4B8-3055-4953-9A8C-DB38E646B496@arm.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-3-roger.pau@citrix.com>
In-Reply-To: <20260211104638.7938-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB8734:EE_|AM3PEPF0000A79C:EE_|VI1PR08MB10174:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea30bd4-08f0-404e-cc20-08de695e00cb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dEovMmZzMXBhRXR6TXJFNmMzTjFaRWpidkVnZGNlU2JGckpKRWNpZk5mMk04?=
 =?utf-8?B?UFh2UHFnSEFrVU5leXkyN0NwZTV1WGRXWGhjV1VlaEpxS0VlalJhbmZWaXJT?=
 =?utf-8?B?MzVxRmhXNGVITHlPK0kyR2dFZlZXcUNiM29PR0Z3bk0yUVhreWJINHB4ZzVY?=
 =?utf-8?B?QmlON3poSldPK2JuRFY0dVBNWmhkR3NNOWp5VDV0M21zazc0UFhlMm5xM3lJ?=
 =?utf-8?B?dms1Rjh0ZXB1Qm5KbDU1UHdlSGtUOHUwR2FUTDhKTEpYcmlKaDg3K2pHY2tD?=
 =?utf-8?B?ZFpBTldxU0gzZzBzNWJEL0FRbkEwTHFGMnhwcHVXbTNqWTlzSGJNYzB5eFRy?=
 =?utf-8?B?OThtZjhzem56MUMwdERCWXRKdm5oUHA0ZS9oYmJIWmZvWGE1NWRyZmNBT0Ro?=
 =?utf-8?B?eFFpdzhkL29PNjZ3NHI3b0dFamU5elpkZG9XbVd1MFNzU24wTmRKUERqYlZO?=
 =?utf-8?B?S2duZGpPeGJYQi9qek5VamhWb1krVkxmeVVaU0t3OFNBSUV5alFSSE9VM3Br?=
 =?utf-8?B?OGdkdkt2bUlEOElrQW9Rcnd3aWZxS1lyTjJaRytTdjkxOFNlYm1UbEVLQzlT?=
 =?utf-8?B?d2dibmlva2xuNE5xOHNyOVBjU0pLR0VWR2ZEVzI2eXlPRG43eTZuMDNZOTFa?=
 =?utf-8?B?TmxqSTFxek9YOVlCTnEyOWdwdUxiNEJJSHpQY2IyYUcvMGxKWkRmc281VU1l?=
 =?utf-8?B?bU4rb1F6VW9zait2SHpuQWZ6eHBVMlZ3MkRXMDhjbldieURXUVd0RW00dnhk?=
 =?utf-8?B?c3BLODM4SkVnbCtOWFNaNHRUVHVLcHp3ZXJJbk84eDVnM3VoaEhSczVQNUln?=
 =?utf-8?B?K1VWcnUvY01nb3dqRnlhVzlZN0d4eERvNE1RbkRPRTUyOUtJSlhlbVl0MzVl?=
 =?utf-8?B?RFF4MUZBVXVtUmFVdXFVUHA1SkcwSGQwVmdMWUtDM3k4dE1BVFpMUGwwVzIw?=
 =?utf-8?B?WG1CMGVwYkxVcXdNa0h5VVF5UVhpaGdFbWdDQjI2TGxRVjYxb2NDeHRIc0N1?=
 =?utf-8?B?VUFJUEViVDNEaHgzckxmUnF0c1lhZlU4dHZjZmt1NVoxcUpteVVIT0dEcXZu?=
 =?utf-8?B?OUcrbVY3cUNRbjlIT1R0UHdrTmNZU3Rha3JNa0QxTFZvbXJ1SjlvWnlXbC92?=
 =?utf-8?B?MFZOT0w4U3FTZ1Z2RGJ6K01rWGFzMzVBVTVtVmFDSks3TkJ5TWpYakozZy9p?=
 =?utf-8?B?bHRwMnNtaXd2TldCdnc1VTlLeUtJNXI2Y0oraUxLQTF6NFhYZUZFYTNPak1I?=
 =?utf-8?B?ZFMwbFlvNSt3RGlaRTd4VlhXN0wyNmlmNDZxSGdKMll5RzVaV1FxWlp1NHlr?=
 =?utf-8?B?V09QQjMvVCs1bk9wUmJsdGlDWGl5WVhteFhTTHlPaFJSaStGcHFCZ2NXK3Zy?=
 =?utf-8?B?elhPK2hGd2cvbWpKcGpxeXVYRXJ6OTNiQ2tKeVIrRTVEc0hCVGxLSjB3Q3Zh?=
 =?utf-8?B?R0ptak4waElicDFrK2ViV1ltZWEyWTc5OStFMHNtUkNoQ01pbWV4NHhrVWVX?=
 =?utf-8?B?YUhZNUxDU21IZTVCL0JadVMzLzh0Z3o5NngxZWg2NEJUK1NEeUFMT0x3ME5x?=
 =?utf-8?B?cE5OcmVoWVdsOXNla3NFQ2JRUEFpdkR5K2VKUjErdU9lUjFBNmN2R3ZZbHRu?=
 =?utf-8?B?MUx3ZnZZWkY2ZE5KdTFXcWlLUEZXNHFTUWV3emc2UnpoYnU0MlloeHhyWE5Y?=
 =?utf-8?B?WHoxbTFKaFVSaGJzOUpLV09saTVTRUVuNFNybnduM1JwZHk3S2I2UngrVUVm?=
 =?utf-8?B?bVJWRnpDOWlCRzdhSnR0SHZNQU1Rb1RENGlOMXkxTlZiR2hiTXlyVzdudlR3?=
 =?utf-8?B?RUhyNG92SnhDTmdKRHFpL2tOaW1HRXpJRlhMM2JwdTFUendXRy90d3JFd0FL?=
 =?utf-8?B?ZUkydzhETFBuVEUzZjVmdEdRc2h1SjZvYUVzTCszOEYxWmNJUmJ3UjNZMDA0?=
 =?utf-8?B?S0g1VldyWGFyc01mQW1QbnFjN2FIL1UvQ1I0U3FJUTBpKzFNcE05YWJSR2hq?=
 =?utf-8?B?SCtaY1pUbXVhR2l4Y1EyTFU2R1htb3dxenZlVHpubWM0MG1JaEwvdSt3SUM4?=
 =?utf-8?B?dFErOHFPNW5ZMUhhbVdwcXBqa1Avano4QzRKT0VuVHU5NjlRb0FBQnBZV3Bz?=
 =?utf-8?B?TDBzSzM0RHV6WEJKRzQzOXlMNyt4SmsyNGJGeFBMWGdRWEFndVdNNFBYUDlv?=
 =?utf-8?Q?nmbazI9tjKpzG3z+6VsadH0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E1C1D406370C14289FF18616A344479@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8734
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0efb4a1-5dbb-463e-e3fc-08de695dda17
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDZtd1BTWlZzSFE1NkFCSFFPd0Z3TFFNbVFGa0dpVk9HclA2YmtoZjZWby95?=
 =?utf-8?B?NDJmdjd4YXlKaTk4TFJERzJ6ZVRnaUN4cE9MWndKRUVOZldveEl0cmwxVmF2?=
 =?utf-8?B?REJ3QVhWTzI4elRDU05HblY5Wkw5SkJoUVJmb0NhMzlCMU9PS2xDQTJsb2JE?=
 =?utf-8?B?VEY0RG9EZFFZaWwvSnhRWkxQR2Y1RS82aFY5eWNMOTJ3L1RRUE1KWUpCOStH?=
 =?utf-8?B?ZEJiZTFBYzRZRVd1cnhNNlVKbjROaDBCMG16dlU2eStKMndoMENuQ3MwZFVl?=
 =?utf-8?B?L0M0emNjRmhSa1A0UUN0UkordGpDVUFvbndLWFdXMndlTHRnVXhmeUJweVh3?=
 =?utf-8?B?ZzE1M0xJWmtIMkJTdlVGNUN6V3QwR0hrdjFDY0d4UGh2MmNud3B2VjFYK2dJ?=
 =?utf-8?B?Vlg2UWVNZlorN0pVeFJINmRZNkhUemNNRTk1emhWUDdzc3gzdHNxRHFtQ0M5?=
 =?utf-8?B?UHV6QzZCODBLN2t5Z2IxenRkMmF0aVdXbktCanVPdm14MmdxSGMza2hwditZ?=
 =?utf-8?B?U2c1d1hMUFo1NXB3RTFNUHY4V0JKRDVrVlhOd3V3RXlJd1hoa0ZKampuOTJK?=
 =?utf-8?B?MkxFTmZ1RWV0ZkxXaDMyVkM2VWM5TmRtSllheVR0bjhEbDhOOCtLY21MVVIw?=
 =?utf-8?B?eFhEcC9mYjFTSC9sTFA3T1dxZlVWaUorV3g3dnRhVGFyc3AzSHVEK3MvMWJP?=
 =?utf-8?B?THBWQ2hRTWRISkQxdlFVR00rRkFRRmh1K1hzOXNpWGVsY3E0RndUU3BJVCtJ?=
 =?utf-8?B?VUtPSXdXckx0QWJTOXFEWGF4b0E0bDZnSmVPaDFBUEhwWm10dmVHcDFJMTIy?=
 =?utf-8?B?QXllcTJDRDQwL1FqbmI0ZUlzai9OT0ZJSXlRdkFmMjRlYzRIb0N2UWxsUUhh?=
 =?utf-8?B?eEVMNUl3MHBGZVlpMHZ5VTdxazFWNjZVQ2lTeXFIbzB1b1FrSG5ycDJ1VjY1?=
 =?utf-8?B?VlVYOGp3akNaMnA4MWtGV3AvYnV4OExuTzUwQUhkeGkzSGJZYWlaWmNJekVq?=
 =?utf-8?B?d1JleFkrR1pNcHY5cDVSRnNMOUxzNHNGS3Mxd3NqdXRCUEFQZEZMTGVDTUFO?=
 =?utf-8?B?MS9kLy9DdWRpUDFaMndkNFArdW85dkxMc1hwSmR5VjVBVXFEWTA3clViMktF?=
 =?utf-8?B?OEhzQjl1K0doUmdrTEtoVkIyNkI1VVdCS3hONExWSHZsMS9BZGJFaTRBamUy?=
 =?utf-8?B?L2xFVHRFcHVNZFpQdkM0czg5dDc0dzJlMzJXWEJMTThaYzJUdE94UHFxMVgx?=
 =?utf-8?B?ZFRYSHR0NGxoY1FBTmk3TUg2TkFmVEtZQzNwUysvT0JpT1FlenkzSDF6MzdP?=
 =?utf-8?B?N1lCRzIvNitjSjFXcHUxanFNNmhnVFh4K2trTUtOSEYyUW13UXpISExCY3d1?=
 =?utf-8?B?SVhWSjYwN1ppdFg4cnlaV3g2SGVFZkVqM2dXcElibkU2OVlVUlZWdE52Qk5X?=
 =?utf-8?B?WlpCbk82WWtUVXpVK0VnY3hvTGIzck1ScDZHZGpBMlN1b0daMFNNZDRWMmN0?=
 =?utf-8?B?RUhyaU11cmdqRTE1aFFlMkQxM2NaRG1NdW5tekNBWW4vUGJmVHBobEdXb3Vj?=
 =?utf-8?B?azNZNk9LM0dxN2lCS3JjR2FxZEgvbnErcmxIMVVhVU96Zm5WWjVNbHZmY1dr?=
 =?utf-8?B?SURHMDdxeDV2WXNiK0dQRFpQbjRMeCs3cWFaVmlSQVRhM3dRbGFObE5jSGRz?=
 =?utf-8?B?SjlxWVhHWEJKMXd1Mzg0T3pWeThPLy9id1M3K0NhWEN4b2pnZ3VyQXJQMHJY?=
 =?utf-8?B?bGxCeXNvMktGdE1tS0RrRGtiQUU2WU92U3pQdVk2VXlQWitjYWo4OXNsYlhZ?=
 =?utf-8?B?YUhETDhDSVZGMU9Qdk5KYktqYVVOWlVvT3BjcktSVDFOWkZuelhyeUtMYTVs?=
 =?utf-8?B?NkpHY3ZHdXIrSktCblVTcUxScnZRRnRtNTQxQ0g4bVVlYTloVUdjdU5TTXMy?=
 =?utf-8?B?NnpwdndlMTc2ZmcwakRpMUV0NFBRZ3BBQ2RLTlJYVmV2K0RvL2hPOGtYZVVN?=
 =?utf-8?B?UG1lOFlsNVBXclo4ZDQwa01aZDZNZzJrS0ExZ3crcE50SGV4WEhHKzRZSlMz?=
 =?utf-8?B?NU1jVDhMN1JQbWxnOWJhbGlZUTZKaFFKbkxRWnJzTUdjTktTVUVOODNlUkl4?=
 =?utf-8?B?Wjc2U25FU25qTk0rTGc3TWJEdWlOMDNTOFUrQjBqVlhlRlpEUm5Tdmp1azJp?=
 =?utf-8?Q?G8XhGAOVnsLCoUZzpK/c5gR/0bvhzr5Ky6xN+EWXR/Ys?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R5Sp/F1+0uHbkBeyQtSBBdvYL84kVXRzGw/8I4QekNZbx5V9kygMELJW9F3jau+j420xWdFxKb9uI6Riearjvp6HpVAVWXhTHnhhsB9JvQycupBrKiMZuS7xWfuyTW+bA1+zI37EUmiDggb6c2OQCGQcB4vO1WliFekSsH4vM67gkfAeKHcvYKZNiF76CL0AfvFHIL5duLC5yveKIgYFhC+HK10I/s8kfqUJXFERuZ8YIpgb2/SIZ2uQDpsf61xMSEWvjQChfzBmwBYTzcGzAWuyABN2s+2lEq+LUcjfMuBJuJ83qGBDuf0uZPDcRkAjrcd6qHaxns4qgyJvVumgbRBwxvTRDYZs/TWklqi4XUv/va5RKKr8Y2hViYIpFmgx++cDbjIhzUhesKoc0cgM+n6/lySFu/HLvG/uT080QxzZTTkdh3Dt9lDyIhfww1hW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:09:19.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea30bd4-08f0-404e-cc20-08de695e00cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,arm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CE561123C12
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gMTEgRmViIDIwMjYsIGF0IDExOjQ2LCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoZSBgLXNgIG9wdGlvbiB0byBz
dGF0IGlzIG5vdCBQT1NJWCBjb21wYXRpYmxlLCBhbmQgaGVuY2UgcHJldmVudHMgdGhlDQo+IGNo
ZWNrLWVuZGJyLnNoIHNjcmlwdCBmcm9tIHJ1bm5pbmcgcmVsaWFibHkuDQo+IA0KPiBUaGUgZmly
c3QgaW5zdGFuY2Ugb2YgYHN0YXQgLXNgIGNhbiBiZSByZW1vdmVkIGJ5IGZldGNoaW5nIHRoZSBz
ZWN0aW9uIHNpemUNCj4gZnJvbSB0aGUgb3V0cHV0IG9mIG9iamR1bXAgaXRzZWxmLCB3aGljaCB0
aGUgc2NyaXB0IGFscmVhZHkgcGFyc2VzIHRvIGdldA0KPiB0aGUgVk1BIHZhbHVlcy4NCj4gDQo+
IFRoZSBvdGhlciB0d28gaW5zdGFuY2VzIGNhbiBiZSByZXBsYWNlZCBieSBjb3VudGluZyB0aGUg
bGluZXMgaW4gdGhlDQo+IHJlc3BlY3RpdmUgZmlsZXMuICBUaG9zZSBmaWxlcyBjb250YWluIGxp
c3Qgb2YgYWRkcmVzc2VzLCBzbyB0aGUgc2l6ZSBpbg0KPiBieXRlcyBpcyBub3Qgc3RyaWN0bHkg
bmVlZGVkLCB3ZSBjYW4gY291bnQgdGhlIG51bWJlciBvZiBsaW5lcyBpbnN0ZWFkLg0KDQpJIGNh
biBjb25maXJtIGNvbXBpbGF0aW9uIHdvcmtzIG9uIG15IHNpZGUgYW5kIGNoYW5nZXMgc2VlbSBj
b2hlcmVudA0KYnV0IGkgd291bGQgbGlrZSBhbiB4ODYgbWFpbnRhaW5lciB0byByZXZpZXcvYWNr
IHRoaXMgb25lIHRvIGNvbmZpcm0gdGhhdA0KZnVuY3Rpb25hbGx5IGl0IGlzIG9rLg0KDQo+IA0K
PiBTdWdnZXN0ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQoNCkFja2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5j
b20+DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiAtLS0NCj4geGVuL3Rvb2xzL2NoZWNrLWVuZGJy
LnNoIHwgMTMgKysrKysrKy0tLS0tLQ0KPiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi90b29scy9jaGVjay1lbmRi
ci5zaCBiL3hlbi90b29scy9jaGVjay1lbmRici5zaA0KPiBpbmRleCBiZjE1M2E1NzBkYjQuLjM4
M2Q3ZTcxMGE1MyAxMDA3NTUNCj4gLS0tIGEveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNoDQo+ICsr
KyBiL3hlbi90b29scy9jaGVjay1lbmRici5zaA0KPiBAQCAtOTIsMTQgKzkyLDE1IEBAICR7T0JK
RFVNUH0gLWogLnRleHQgJDEgLWQgLXcgfCBncmVwICcgZW5kYnI2NCAqJCcgfCBjdXQgLWYgMSAt
ZCAnOicgPiAkVkFMSUQgJg0KPiAjICAgIGNoZWNrIG5ldmVydGhlbGVzcy4NCj4gIw0KPiBldmFs
ICQoJHtPQkpEVU1QfSAtaiAudGV4dCAkMSAtaCB8DQo+IC0gICAgJEFXSyAnJDIgPT0gIi50ZXh0
IiB7cHJpbnRmICJ2bWFfaGk9JXNcbnZtYV9sbz0lc1xuIiwgc3Vic3RyKCQ0LCAxLCA5KSwgc3Vi
c3RyKCQ0LCAxMCwgMTYpfScpDQo+ICsgICAgJEFXSyAnJDIgPT0gIi50ZXh0IiB7cHJpbnRmICJi
aW5fc3o9JXNcbnZtYV9oaT0lc1xudm1hX2xvPSVzXG4iLCAiMHgiICQzLCBzdWJzdHIoJDQsIDEs
IDkpLCBzdWJzdHIoJDQsIDEwLCAxNil9JykNCj4gDQo+IC0ke09CSkNPUFl9IC1qIC50ZXh0ICQx
IC1PIGJpbmFyeSAkVEVYVF9CSU4NCj4gLQ0KPiAtYmluX3N6PSQoc3RhdCAtYyAnJXMnICRURVhU
X0JJTikNCj4gKyMgQ29udmVydCBvYmpkdW1wIGhleCByZXBvcnRlZCAudGV4dCBzaXplIHRvIGRl
Y2ltYWwNCj4gK2Jpbl9zej0kKHByaW50ZiAldSAkYmluX3N6KQ0KPiBbICIkYmluX3N6IiAtZ2Ug
JCgoKDEgPDwgMjgpIC0gJHZtYV9sbykpIF0gJiYNCj4gICAgIHsgZWNobyAiJE1TR19QRlggRXJy
b3I6IC50ZXh0IG9mZnNldHMgbXVzdCBub3QgZXhjZWVkIDI1Nk0iID4mMjsgZXhpdCAxOyB9DQo+
IA0KPiArJHtPQkpDT1BZfSAtaiAudGV4dCAkMSAtTyBiaW5hcnkgJFRFWFRfQklODQo+ICsNCj4g
IyBpbnN0cnVjdGlvbjogICAgaGV4OiAgICAgICAgICAgb2N0Og0KPiAjIGVuZGJyNjQgICAgICAg
ICBmMyAwZiAxZSBmYSAgICAzNjMgMDE3IDAzNiAzNzINCj4gIyBlbmRicjMyICAgICAgICAgZjMg
MGYgMWUgZmIgICAgMzYzIDAxNyAwMzYgMzczDQo+IEBAIC0xMTYsOCArMTE3LDggQEAgZmkgfCAk
QVdLIC1GJzonICd7cHJpbnRmICIlcyUwN3hcbiIsICInJHZtYV9oaSciLCBpbnQoJyQoKDB4JHZt
YV9sbykpJykgKyAkMX0nID4NCj4gd2FpdA0KPiANCj4gIyBTYW5pdHkgY2hlY2sgJFZBTElEIGFu
ZCAkQUxMLCBpbiBjYXNlIHRoZSBzdHJpbmcgcGFyc2luZyBiaXRyb3RzDQo+IC12YWxfc3o9JChz
dGF0IC1jICclcycgJFZBTElEKQ0KPiAtYWxsX3N6PSQoc3RhdCAtYyAnJXMnICRBTEwpDQo+ICt2
YWxfc3o9JCh3YyAtbCA8ICRWQUxJRCkNCj4gK2FsbF9zej0kKHdjIC1sIDwgJEFMTCkNCj4gWyAi
JHZhbF9zeiIgLWVxIDAgXSAgICAgICAgICYmIHsgZWNobyAiJE1TR19QRlggRXJyb3I6IEVtcHR5
IHZhbGlkLWFkZHJzIiA+JjI7IGV4aXQgMTsgfQ0KPiBbICIkYWxsX3N6IiAtZXEgMCBdICAgICAg
ICAgJiYgeyBlY2hvICIkTVNHX1BGWCBFcnJvcjogRW1wdHkgYWxsLWFkZHJzIiA+JjI7IGV4aXQg
MTsgfQ0KPiBbICIkYWxsX3N6IiAtbHQgIiR2YWxfc3oiIF0gJiYgeyBlY2hvICIkTVNHX1BGWCBF
cnJvcjogTW9yZSB2YWxpZC1hZGRycyB0aGFuIGFsbC1hZGRycyIgPiYyOyBleGl0IDE7IH0NCj4g
LS0gDQo+IDIuNTEuMA0KPiANCg0K

