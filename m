Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL6ZLx37hWmzIwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 15:30:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106AFEF83
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 15:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223299.1530855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voMqv-00054p-2Q; Fri, 06 Feb 2026 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223299.1530855; Fri, 06 Feb 2026 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voMqu-00053J-V8; Fri, 06 Feb 2026 14:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1223299;
 Fri, 06 Feb 2026 14:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voMqt-00053D-Fq
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 14:30:31 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 634aae5e-0368-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 15:30:30 +0100 (CET)
Received: from DU2P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::8) by
 AMDPR08MB11367.eurprd08.prod.outlook.com (2603:10a6:20b:717::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 14:30:26 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::39) by DU2P251CA0012.outlook.office365.com
 (2603:10a6:10:230::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 14:30:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 14:30:25 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PR3PR08MB5755.eurprd08.prod.outlook.com (2603:10a6:102:86::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 14:29:23 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 14:29:23 +0000
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
X-Inumbo-ID: 634aae5e-0368-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TvcaZ/flgCdpzHx9zAIKNdo3zb2YC3pOszhPpdRAdmK2LAuUOLWJhdTOiYNOr2r51/PdPpkeQTwOGaTmdwjN42+FkTE2dS6VlbqmRZ0yArPX3wD5OyYLIsRlZNEPO3+8Hh3+ARhytLIMzK1E1eagGAsNRbl4wNFHekghCWCfQ4jvZO4FVKesGLAZlfRd0J7p6Tf4k7o6qVKaIQF0qAAtAoAmUSFOfAaXzGMatfRJJcVqLxJDm0JcVEkEh8lYJLNzJPR/ZInC4pAZ1sDhjPS1VSGWU2cDZFEA7QAk3vXenFdG/WakdXYTg7oSwbH+3b190Eq3xxXzvYmSKCHzCX7sWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFTmHDCqa6Y2s6X6nc8m6Jgh9gGlZwbbiP0hkvPapI0=;
 b=xoasaXywx8G1TNyMRmRpwetfIuO7od1ND4+CNCj1n77UwKFJwi+iVryqY8LV3u4IM/pI+gPjqwcztDVaXIEsAoKUSCF3g+uA27LFtAYho4+LqZtYiUQEv6y6PePgcANRjwU3iLhBG8GupO2gXVOha6rntqGwxoE9yuyqwoyzbcuKmIpoAMnY7ENVaHUEK0q4HrW/ci28uJLVKuZFUSzKiSWAkyB+P13BRqPfOLYbFTpMkV9YgO7Di7qzpFZvgq6tEj9RWxdeN3pa2GXbATeJyw683Dqrz1zISLLsCWVKnjjcebXvTcb1A2pqZSnv+ldpp9c4QjtWAzY2e+kW1UTggg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFTmHDCqa6Y2s6X6nc8m6Jgh9gGlZwbbiP0hkvPapI0=;
 b=pWAUD6w8KiFYRDGJHnP2p1KzT/ZCyQ0vr4M5kPnhINDVRJLAqTzbFZxaiDN4blQh4EEnLZNnZkVo4ruVq1+a+Wv8OwB1McwZ62n5nvZA7rjx9rZKI/ya7sT2xU3JgbkSFSaehiqfp+yANAzghS07EfObwrH6S0hNa8ZMFxANYeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD2x8bhETLxZJIKJWVeIvkZBalWtyN9iqeRFF24JHevArmsNjadQ0DLTncGNeTHsYTFgK0ZOwYKD6CbV4UO4MdTSflSor1JoHwG9UU0t9JegcAu4ZcBowIaXNRBrXndov0C1lmUpQYm2dyULdvOnM+hm4n3r9nNWmFn78IXMgX6VPOLu9LzeDcHgyT2ii9+MReE8s1zBr2ykKW5D46A+OafHSPtuHvb+AO/PLypHgt5MrAA6fuwoNAFJRlz3CdULe7tyuylcD5X/jc4EtFWLjejp3LdO/YZweSuuHwnF/aFksZ5cKoSHpLNfSXb40sFrDP5nsVCu61mHsBPBu6Hi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFTmHDCqa6Y2s6X6nc8m6Jgh9gGlZwbbiP0hkvPapI0=;
 b=huZtdHcDDZLVhcWGZ3XiaIzm86Nl30IxDXBpeGR83Sdx06WNXAsw1PVunpU2CTgqKHQfnm1m/PYd6dkLOO3NqaU+xpz+O2F5sW6XQTKy0GXojeBhX3O+SxRqkPc7D5W2PH3eg3qkcR8d9Po30P8DiodvwRsu2+VvPuLvM36VTzHJ/o0SVDtw25Xo/0Ae/0LD1i3GJ3Om443qcGtNUJlIGshV48W/0bSD8HE3hoKE04CUS6sITxr7dZIOtU/RMndUt+NhkoTo4oa+pMTCt7AJ6scEvCOmUSilFNs5b8oS8paF9eL3J8sgM0h0AmY/lawByveWOkqlAhqvELodchXWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFTmHDCqa6Y2s6X6nc8m6Jgh9gGlZwbbiP0hkvPapI0=;
 b=pWAUD6w8KiFYRDGJHnP2p1KzT/ZCyQ0vr4M5kPnhINDVRJLAqTzbFZxaiDN4blQh4EEnLZNnZkVo4ruVq1+a+Wv8OwB1McwZ62n5nvZA7rjx9rZKI/ya7sT2xU3JgbkSFSaehiqfp+yANAzghS07EfObwrH6S0hNa8ZMFxANYeQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Thread-Topic: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Thread-Index: AQHcl0ETIV6m5wqgrECh60MWgPTuGLV1etQAgAAv7QCAAAFMgIAAC8oAgAADkwA=
Date: Fri, 6 Feb 2026 14:29:23 +0000
Message-ID: <F0D0BAE5-9B94-4734-AC5A-4269A30D24DC@arm.com>
References:
 <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
 <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com> <aYXsvu3HlPuCUuY8@Mac.lan>
 <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com> <aYX3uBr6NcCZoP10@Mac.lan>
In-Reply-To: <aYX3uBr6NcCZoP10@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PR3PR08MB5755:EE_|DB1PEPF000509E7:EE_|AMDPR08MB11367:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7d9568-56a5-4c84-0ddd-08de658c4506
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dG9JV1lTdGVMcHo1aVJjVWhkVzRSWUF4eU13Q01wU3Iwc2lMWHJBZlRkMDhr?=
 =?utf-8?B?Tk5DYW5lVE1mSzYxdkFHVTdTUWt0ayt5ZTQzYnhXZlhMRkh6RlRTZDdxR0RN?=
 =?utf-8?B?MHByemtuUm5HcmxyblloNm9lNHBwZ2I4eGZiV1NUY1pRc0ZFbmdhMlo1VEZw?=
 =?utf-8?B?bnNDRitUUzE0blFnYXJVKzJFbzVEWHROWFN4L0ZlNXZhTWxRTVROWm1PYVl5?=
 =?utf-8?B?LzFUWE9UemhIZEJ2eXpaUGNIVUJhZXVhV24rbnlZejNqS0FiSWZyenFFQmtI?=
 =?utf-8?B?bnJ5TzF1UTF4VFFpVmQyd2l5Z3d6OGpJZ0xnWm8zOE15Qjc2Y1ZSTjY1WnM0?=
 =?utf-8?B?VlNCdjBQUEFjaDFmOFJXdDh4bURmRCsyQjR0RDVScWhnampyemwyTHBmNEZU?=
 =?utf-8?B?enNieHIrSmpmQmRZRDBLSWpqSEx6MlFaanBoMGV5aEZxcnp2K3R2SjM3Sjd4?=
 =?utf-8?B?TFFoVkpycDF1YmtsYnlqNDNlTXVobGtEamVkYzd4WUhLTXh5QmpjWFlsZFBl?=
 =?utf-8?B?VDhHdTBtRm9BWWJXbGJILzNmTitRdkdKTTgvOERFK2M3SmF3azZYZzcyQ2p6?=
 =?utf-8?B?aE9HaFYydHJjRVQyMzExenQrM1loYmlVV1o5Vk96N0hIOFJvZ3ZHOWJSL05m?=
 =?utf-8?B?dGtLNmlqdFY2d0d4NUlZVmhtTDR5SEpWNzNndDRRaktiTm1VRHppdWZ0OGF5?=
 =?utf-8?B?RzAxL2ZtM3JHWWp6czdnZDY1ZW11NWw1eDF6UCszUmIyS2VFYTdBbWFOZEow?=
 =?utf-8?B?c095Y243M0lEVzRFMzFnR0tpODdOT2R1TUdkc1d6UVVWOEFIZkxJOHNVbGkv?=
 =?utf-8?B?SG1ucndpTVFBeEtpYndLalh6WWpQY0k4MjVkcnNzODJ5TkU1akc1MXNDekwy?=
 =?utf-8?B?N3p1aGFzRnlHYlBZaEU0dlRiQjZ5Vkl2dEJ1U1RSdStrSlFkSjZOUGtSSllw?=
 =?utf-8?B?ZlQyVUdiWUY2dUJwRFIzMVdkTlpGUThLdG41TnV3OWl6MzU3NURFYzlxK3JB?=
 =?utf-8?B?UXNtWUtBK2ZFd1BFQjd5bityN3M1TmlxRVRyUUdiNXB0K2JtTjU4aGNvMGIy?=
 =?utf-8?B?NEtVdXVWeW5Uckdzc2hjOUZNZGRmaWNQMFZrVFk5STBKcCtwaHZqNCtzRVdV?=
 =?utf-8?B?VlRIb0JkcXlpVlh5NTgwRTRLNXdPU3NoZnVqdHd0dXBxN2hBeEFtcm4zdnFM?=
 =?utf-8?B?NytNWFBmcWtObHJJc056ZU52MFEyeGxVSkpnQVg3eXAvRndXOHZHZ04ySmFV?=
 =?utf-8?B?R0tuaU1HRFRJT1lxczRYcTVEOVBSc3NMeVJ6TXo5NVhxd2pQQTE2K0ZzeFdB?=
 =?utf-8?B?VWZ3OHdlLy8rMVlxUmNPc0VpSHpPYlpvQ3lqdk9DdmdFZjVLWlBSUTlxYnFZ?=
 =?utf-8?B?OUh4MVFUZnlkQ0NvcGgwS2JFenJWbTluMWRhQmQ2QndWNkkxZk55b1d0OWlK?=
 =?utf-8?B?YnZhRTVOQUYvL3pUeXNMYkI0aGIvN2EvV3RjdHdoQ1BSZ0xsbnFGTG44ay9o?=
 =?utf-8?B?UUlVYVRXbXVDaG54Wk5TYklPWk5WSU1zR1lUYXRlRnZiUEVEaWRFRzRubk1l?=
 =?utf-8?B?NVVxTW9uOVZvTDNTWVpscXNoYmlFV1dpOEp1NHpYVi91dURlcitmMml3Zzdq?=
 =?utf-8?B?cTJ4MHZhQUlUcWFoTlZOYTdFZWFBOGFwTlZ5M0hyYTlEUkRSam5QQnlpRDM0?=
 =?utf-8?B?S2xSRVdCMFlJWWxkVytKeVJDYkdhYzNQeHBXejBTUk1aVThIWitkTFF6djJp?=
 =?utf-8?B?dWNmOTBCd2RsNDRpUGZIM2Vad3lKZHU2b1k5MWdIWTYxN1VoMUtETG9tZUc1?=
 =?utf-8?B?bG5CSHNDUFUxaDUxMmt5TVpjdk9SMDQ1a3BaY1ROSVZLVk5nb2p6ZjdWbzlE?=
 =?utf-8?B?VU1VY0JsMHVNVk1abkZQWFZ2RkJSTjMyZjNRM3ZVeUdnT0kyeVE2T0dEVXpQ?=
 =?utf-8?B?Nk84U3IrR3RCYXJxeVVwdmhmdnJzUkQ3TDBOSDh3NjI0bWNySU00M3YybHNi?=
 =?utf-8?B?TnpFUi8rbXh4QzZZRDVJQ0JvM0UrakZZRWdHdVMzS0E0Tk5MNGgydE4yTjRF?=
 =?utf-8?B?YVB0OTNadmpiR1k3V2NGTjhWZmlzLzB4N000ZG5PbVpHOWxtNytBYWF1Mkgx?=
 =?utf-8?B?OEoxRXBKam5uU0J5SWxscFFlSnNiVzVEdmZDTXpZTzRhWlVSQjl1ZVgvaE9o?=
 =?utf-8?Q?/P63mJD6pTmJ4Zit8JAECUs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E1BB7190E39234B83419B1595267871@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5755
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e79edb80-aa97-4ae2-c2aa-08de658c1fbf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTlWUGdYZlZtQzloU3ZNRXJweVpNdytEUDViTU1WY01hVWZ3aThoaDRaTDA3?=
 =?utf-8?B?V21KbUplWXY5eStCS1E2bTVyRnFlR2FFRi8xbTVkc0M2M1pPbEgyeVJ3Y0xF?=
 =?utf-8?B?MEVIaWErYUk3M1lkTUhtUXZ5dUtLQnBNdWZPT2gySWhXNWMyQlZ0ZnU2MHVT?=
 =?utf-8?B?OFl2OUxqcUlUK0hPUmFmMDZMRkJ2M0RldjFRL3ZvZEowQ0V6UWdXdGlsRkl5?=
 =?utf-8?B?UDJ5MG1KSUNUSnQySzhlWG9kSnJUZ0daejJCSDVkbFRFSDhtR0NYS1U5ai9O?=
 =?utf-8?B?T0g1WWV4Y1d0RVlxaG1tcEtKNkxjT2pNVEFMMEdHc3c1d2FQTjF6S3BUWWdD?=
 =?utf-8?B?YmU0dEZGUmVZbWFKd2lWOUNvUnJzUnIvdkhrK0YxTXNRZHpmOVpCcnpKTUdV?=
 =?utf-8?B?N0ZnZFZPUmhBdXMrdG5Hd0lvekkrUkR4NGEvVGFQYVRHclhxT3U2TFYrQmpm?=
 =?utf-8?B?VEIyUnZVa290d2hNMHBaSHNRdzZrTGxSYU5vazA0blZKaWx4UUlZcGZpTHhR?=
 =?utf-8?B?MlhFWEtnenVtb2Q4a3R2NVZvYzljY3pSZXBwYTA4YmFsZHlTVnBZNTQ5Rjlr?=
 =?utf-8?B?U0NsbWQ0TkdpanpZUitWMU9SSkdCUUk3UnoweHB0Tm15OTUxdHVTcWpkVVVr?=
 =?utf-8?B?WHBDZDM1VE0yQjlEK3JUYlNENFVtZURndUNpSmRNODdJbnFCTlBvcnVlWTho?=
 =?utf-8?B?dHRRa1Jobzl5RFhCSStLM2ZmWFZiWHdqSkpQWnJta25qWE1XeFA3VHdQWndS?=
 =?utf-8?B?RVhVVnNuTitsbTVaZkpWQkdjcWJXekx6ang2WnhFbi84ZFFUVjdRNDJUYzJT?=
 =?utf-8?B?RXAySEhMME52SUhHa3kzZS9ZZXU2YVhWcW9USXdZVXErU1phRnR3UnozMTNZ?=
 =?utf-8?B?Q01wYmtwSkl4c0Nna3pET3ZIVDZlRkRLY0NVSms0aGk2ZXZMUVdZekFYdDJI?=
 =?utf-8?B?UVNqMGd6elpBQzF5YjRzbGpka0tCRGtHcWs2UDlPT2xDWmJzTThFQW9wcklv?=
 =?utf-8?B?SUQxc2FWazU0S2dLNGR3WFRhTU5rODFhUHliOWdjTVZWLzZFYTNrdWNKalgw?=
 =?utf-8?B?MXQ1a3ZhMUlrRWMwVXcyZm1ka2x3QThuWFBKSmNLVnlwNmdRd0sxdkpRUHVE?=
 =?utf-8?B?cXEvVE5rOEFZL0V2c3dPRXRCWmxqSUdTbzBqUHdRNTRMRUFYL3ZlS0FOSXFI?=
 =?utf-8?B?bnBmQXFkSXExUTBsZHo0L3AyUm1qbmRydWhLVlhBaktxK1JnVkx0Tk4rOFYx?=
 =?utf-8?B?MFpvRlhZNFdUbzdGZVc0cVhjb0w4cFVSMmxsVk0veUhSdjJ5Nk9sdWc4Vjh6?=
 =?utf-8?B?OGxvb3g4YzRDcDkycnVzb2xUWFoyblJTQlhpTmdiR0lUVDYzekUrSEdtdDdu?=
 =?utf-8?B?alY2UmlDczBSS09tL3pkUWx6aWViOE1lcFN1citSSzdLNWI4MjhJaGFieVhm?=
 =?utf-8?B?VUNRcnVERC9XVy9nMzgzTTNKNFdJVHFqTWhyM1FKZW9tV213WndFOWdjRnRk?=
 =?utf-8?B?RHVvQ1RrRjFwWi9BT29PanM2TDJOd0k2VzJDYmVrei9xRzhDTGdpeXJBNDh2?=
 =?utf-8?B?Y0JXRStEMGR1UnFWdEhOakpSNkZtaDhWV1N1eGMxcnF4Z0w0TmJmOUc5bzlo?=
 =?utf-8?B?MFh3Y05SN0tFZVVEQm5TZlBVOTV6dkNzWXlKczUxVW10bFVicE9iYjRBWFhr?=
 =?utf-8?B?TlU1b1F3cVU3Ny9JVy95cnZ6b2lDTTROWGVXMmJWYzBHN1hTVTkySGxnelhu?=
 =?utf-8?B?U1pQOXpRVXp5ekkyUUZaNVFOUDlIWkNWQ215bnVsKzQwNVlrenQwRHdIRzJM?=
 =?utf-8?B?TldUUjMxODBjQ1cxUE9oR0c0WlUrcGlJMlNBMldGTDJWaXY2ZW9MT2xCekpP?=
 =?utf-8?B?ME1rMHJKTzlMakdqWVo0RFNpNkMxR09NVmxQdHIyRlgyK2JpZ3BhS3ZSMEtW?=
 =?utf-8?B?eFlzT2F0dnZZTjBYbUZRcVNQcnhVMjAxc1JBSDU0UStoUFZCelBQbWwya2pM?=
 =?utf-8?B?MTBjUDMzaE9UV0JmNlBmdUpYR1Jkb21DVGpHSTNmdHNJSm1uMGhxNHRidWtN?=
 =?utf-8?B?dHpXZUpPTGZjY2I3akZadkt1QjB4Y01iWTJLaDFNK1lhVHJyYWVFZzFLZFVP?=
 =?utf-8?B?UTlaU1g2a0J2TU8ycDM5Yy9hRXc0eEQxSDY2bnZHOCtkMkhlTnE3QnYzcHln?=
 =?utf-8?B?c2lPQ01kbjNFaGhFTkRvR1ZpODhiOTRYY1RzcXZFazJtOTR6WEhvN3k3azVR?=
 =?utf-8?B?WUQyZngyZGRsTlZlaVN2eHZDTTJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cH1w2DNzjeEm1KMuVJg7BPwjWqrlPjQJ9GJklEbkgLmN+fPwkKM7vK/zcakbCKvdKkp28aoK/RCOcbvTq0W8FQM/BRGBXtot8mkPJsQvx+t8tM2bklHKNto+cJ1r/j9kVdD2hfFIALZ4+MkTHy8nwBMKtUiJ7mX4A6+Bvn//QBHLCk1XnIv6vRgebFuCcdjjEo0b3fMLEoyvbTcVFdobbYM//ID4rrAdOMJXZ51nQcoZ/Y7Aw5JjvkQxBEL2sx4JZYoR4G3CKlrO9RQDPQSV7WxIDKADradeanZSqCIHSTQlnZWzuT/FsxWdrdlcVdCMjEJaaIW0v7OAZXEn2v4KaG4D9OZjGj5FVlLYr1AEwS77YjJSD2q2zbsBjXKwX3YDS3PdFomgTBo7Sc95PTFvmd8SCAwWC3Af6+ASWDr9DSB4EZWoSqZUoNplwobLcgCQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 14:30:25.9831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7d9568-56a5-4c84-0ddd-08de658c4506
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11367
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,config.mk:url,stdgnu.mk:url,arm.com:email,arm.com:dkim,arm.com:mid,darwin.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 1106AFEF83
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gNiBGZWIgMjAyNiwgYXQgMTU6MTYsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgRmViIDA2LCAyMDI2
IGF0IDAxOjM0OjIzUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiANCj4+IA0K
Pj4+IE9uIDYgRmViIDIwMjYsIGF0IDE0OjI5LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMTE6
Mzg6MDJBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA2LjAyLjIwMjYgMDk6
MTcsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBYZW4gZG9lcyBub3QgcHJvdmlkZSBh
IERhcndpbiBidWlsZCBjb25maWd1cmF0aW9uIGZvciBzZWxlY3RpbmcNCj4+Pj4+IEdOVSB0b29s
IGRlZmluaXRpb25zLiBPbiBtYWNPUywgdGhlIHRvb2xzIHdlIHVzZSBhcmUgZWl0aGVyIEdOVQ0K
Pj4+Pj4gY29tcGF0aWJsZSBvciB3ZSBvbmx5IHJlbHkgb24gZmVhdHVyZXMgc3VwcG9ydGVkIGJ5
IE1hYyBPUywgc28NCj4+Pj4+IHVzaW5nIHRoZSBHTlUgdG9vbCBkZWZpbml0aW9ucyBpcyBhcHBy
b3ByaWF0ZS4NCj4+Pj4+IA0KPj4+Pj4gQWRkIGNvbmZpZy9EYXJ3aW4ubWsgdG8gaW5jbHVkZSBT
dGRHTlUubWsgYW5kIGZvcmNlDQo+Pj4+PiBYRU5fQ09NUElMRV9BUkNIPURhcndpbiwgZW5zdXJp
bmcgRGFyd2luIGJ1aWxkcyBhbHdheXMgZm9sbG93DQo+Pj4+PiB0aGUgY3Jvc3MtY29tcGlsZSBw
YXRoIGFzIHdlIGRlcGVuZCBvbiB0aGUgTGludXggQUJJIHNvIGNvbXBpbGluZw0KPj4+Pj4gb24g
TWFjIE9TIGlzIGFsd2F5cyBhIGNyb3NzIGNvbXBpbGF0aW9uIGNhc2UuDQo+Pj4+PiANCj4+Pj4+
IEFuIGV4YW1wbGUgb2YgaG93IHRvIGJ1aWxkIHRoZSBoeXBlcnZpc29yIGZvciBhcm02NCBvbiBN
YWMgT1MNCj4+Pj4+ICh0b29scyBjYW5ub3QgYmUgYnVpbGQgZm9yIG5vdykgdXNpbmcgYSBjb21w
aWxlciBmcm9tIGJyZXc6DQo+Pj4+PiAtIGJyZXcgaW5zdGFsbCBhYXJjaDY0LWVsZi1nY2MNCj4+
Pj4+IC0gY2QgeGVuDQo+Pj4+PiAtIG1ha2UgWEVOX1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NP
TVBJTEU9YWFyY2g2NC1lbGYtIEhPU1RDQz1nY2MNCj4gDQo+IEkndmUganVzdCBub3RpY2VkOiBp
dCdzIGEgYml0IG1pc2xlYWRpbmcgdG8gdXNlIEhPU1RDQz1nY2MgaGVyZSwgYXMNCj4gKHVuZGVy
IGEgbm9ybWFsIE9TWCBzeXN0ZW0pIGdjYyBpcyBhIHBsYWluIHdyYXBwZWQgYXJvdW5kIGNsYW5n
Og0KPiANCj4gJSBnY2MgLXYNCj4gQXBwbGUgY2xhbmcgdmVyc2lvbiAxNy4wLjAgKGNsYW5nLTE3
MDAuNi4zLjIpDQo+IFRhcmdldDogYXJtNjQtYXBwbGUtZGFyd2luMjQuNi4wDQo+IFRocmVhZCBt
b2RlbDogcG9zaXgNCj4gDQo+IFlvdSBtaWdodCBhcyB3ZWxsIHVzZSBIT1NUQ0M9Y2xhbmcgYW5k
IG1ha2UgaXQgZXhwbGljaXQgdGhlIGhvc3QNCj4gY29tcGlsZXIgaXMgY2xhbmcgYW5kIG5vdCBn
Y2MuDQoNCnRydWUNCg0KPiANCj4+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQg
TWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiBDaGFu
Z2VzIHNpbmNlIHYyOg0KPj4+Pj4gLSBTdWJqZWN0IHdhcyAieGVuOiBBZGQgbWFjT1MgaHlwZXJ2
aXNvciBidWlsZCBjb25maWd1cmF0aW9uIg0KPj4+Pj4gLSBVcGRhdGUgRGFyd2luLm1rIGNvbW1l
bnRzIHRvIG1vcmUgYWNjdXJhdGUgdmVyc2lvbnMgKEphbikNCj4+Pj4+IC0gUmVtb3ZlIHRoZSBi
dWlsZC1vbi1tYWNvcyBoZWxwIGFzIHdlIGhhdmUgbm8gZGVwZW5kZW5jeSBvbiBhbnl0aGluZw0K
Pj4+Pj4gY29taW5nIGZyb20gYnJldyBhbnltb3JlIGFuZCB0aGUgdG9vbGNoYWluIGNhbiBiZSBy
ZXRyaWV2ZWQgYnkgbG90cyBvZg0KPj4+Pj4gb3RoZXIgc29sdXRpb25zIHRoYW4gYnJldyBvbiBt
YWMgb3MuIFN3aXRjaCB0byBhIHNpbXBsZSBkb2MgaW4gdGhlDQo+Pj4+PiBjb21taXQgbWVzc2Fn
ZSBpbnN0ZWFkDQo+Pj4+IA0KPj4+PiBEaWQgeW91IHNlZSBSb2dlcidzIG5vdGljZSBvbiBNYXRy
aXggYWJvdXQgb2JqY29weT8NCj4+PiANCj4+PiBJIHRoaW5rIEJlcnRyYW5kIGNvbnNpZGVycyBv
Ympjb3B5IHRvIGJlIHBhcnQgb2YgdGhlIHRvb2xjaGFpbiwgaGVuY2UNCj4+PiAicmV0cmlldmlu
ZyBhIHRvb2xjaGFpbiIgaXMgbWVhbnQgdG8gaW5jbHVkZSBvYmpjb3B5IChlaXRoZXIgdGhlIEdO
VSwNCj4+PiBMTFZNIG9yIGVsZnRvb2xjaGFpbiBvbmUpDQo+PiANCj4+IFNvcnJ5IGkgb25seSBz
YXcgeW91ciBtZXNzYWdlIGluIG1hdHJpeC4NCj4+IA0KPj4gSSBjaGVja2VkIGFuZCBpIGluc3Rh
bGxlZCBib3RoIGdjYyBhbmQgYmludXRpbHMgaW4gaG9tZWJyZXcuDQo+PiANCj4+IFNvIGkgdGhp
bmsgdGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIG1vZGlmeWluZyB0byBzdGF5Og0KPj4gDQo+PiBi
cmV3IGluc3RhbGwgYWFyY2g2NC1lbGYtZ2NjIGFhcmNoNjQtZWxmLWJpbnV0aWxzDQo+PiANCj4+
IHRvIGJlIGZ1bGx5IGNvbXBsZXRlLg0KPiANCj4gWWVzLCBJIGRpZG4ndCBub3RpY2UgdGhhdCBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgeW91IGV4cGxpY2l0bHkNCj4gbWVudGlvbmVkIHRoZSBicmV3
IGluc3RhbGwgZGVwZW5kZW5jaWVzLiAgVGhlcmUncyBhbHNvIGJpc29uIGFuZCBmbGV4DQo+IG5l
ZWRlZCBmb3IgS2NvbmZpZywgYnV0IEFGQUlDVCB0aG9zZSBhcmUgcGFydCBvZiBjb21tYW5kIGxp
bmUgdG9vbHMuDQo+IEkgdGhpbmsgcHl0aG9uIGlzIGFsc28gcGFydCBvZiB0aGUgY29tbWFuZCBs
aW5lIHRvb2xzLCBhbmQgbm90IHN1cmUNCj4gaXQncyByZXF1aXJlZCBmb3IgYXJtNjQsIGFzIGl0
J3MgcmVxdWlyZWQgZm9yIHg4NiB0byBnZW5lcmF0ZSB0aGUNCj4gY3B1aWQgaGVhZGVycyAoYnV0
IEkgZG9uJ3Qga25vdyBpZiBhcm02NCBoYXMgYW55dGhpbmcgZXF1aXZhbGVudCkuDQoNCnB5dGhv
biBpcyBub3QgYXZhaWxhYmxlIG9uIG15IHNpZGUgKHB5dGhvbjMgaXMpLg0KSSBkbyBub3QgdGhp
bmsgdGhpcyBpcyBuZWVkZWQgb24gYXJtIG5vLg0KDQo+IA0KPj4+IA0KPj4+Pj4gLS0tIC9kZXYv
bnVsbA0KPj4+Pj4gKysrIGIvY29uZmlnL0Rhcndpbi5taw0KPj4+Pj4gQEAgLTAsMCArMSw3IEBA
DQo+Pj4+PiArIyBVc2UgR05VIHRvb2wgZGVmaW5pdGlvbnMgYXMgdGhlIHRvb2xzIHdlIGFyZSB1
c2luZyBhcmUgZWl0aGVyIEdOVSBjb21wYXRpYmxlDQo+Pj4+PiArIyBvciB3ZSBvbmx5IHVzZSBm
ZWF0dXJlcyB3aGljaCBhcmUgc3VwcG9ydGVkIG9uIE1hYyBPUy4NCj4+Pj4+ICtpbmNsdWRlICQo
WEVOX1JPT1QpL2NvbmZpZy9TdGRHTlUubWsNCj4+Pj4+ICsNCj4+Pj4+ICsjIFhlbiB1c2VzIExp
bnV4J2VzIEFCSSBzbyB3ZSBhcmUgY3Jvc3MgY29tcGlsaW5nIG9uIE1hYyBPUy4NCj4+Pj4+ICsj
IEZvcmNlIENPTVBJTEVfQVJDSCB0byBhIGZha2UgdmFsdWUgdG8gbWFrZSBzdXJlIGl0IGlzIGFs
d2F5cyB0aGUgY2FzZS4NCj4+Pj4+ICtYRU5fQ09NUElMRV9BUkNIID0gRGFyd2luDQo+Pj4+IA0K
Pj4+PiBJIGZpcnN0IHdvbmRlcmVkIHdoeSB5b3Ugc2F5ICJmYWtlIiwgc2VlaW5nIHRoZSBmaWxl
IGlzIG5hbWVkIERhcndpbi5tay4gQnV0DQo+Pj4+IGluIENvbmZpZy5taydzIGNyb3NzLWNvbXBp
bGUgY2hlY2sgdGhlIGJ1aWxkIGhvc3QgT1MgZG9lc24ndCBldmVuIG1hdHRlci4gU28NCj4+Pj4g
eWVzLCBpdCBuZWVkcyBmYWtpbmcgaGVyZSBmb3IgdGhlIHRpbWUgYmVpbmcuDQo+Pj4gDQo+Pj4g
SG0sIHNldHRpbmcgaXQgdG8gIkRhcndpbiIgc2VlbXMgd2VpcmQgdG8gbWUuICBJIHVuZGVyc3Rh
bmQgdGhlDQo+Pj4gcHVycG9zZSBvZiB0aGlzIGlzIHRvIGZvcmNlIHRoZSB1c2VyIHRvIHNldCBY
RU5fVEFSR0VUX0FSQ0gNCj4+PiBleHBsaWNpdGx5LiAgSSBob3dldmVyIHdvdWxkbid0IHNlZSBp
dCBhcyBmdWxseSB1bmNvcnJlY3QgdG8gbm90IHNldA0KPj4+IHRoaXMuICBJdCB3aWxsIHRoZW4g
ZXhlY3V0ZSBgdW5hbWUgLW1gIGFuZCBnZXQgYGFybTY0YCBiYWNrIGZvciBBcHBsZQ0KPj4+IHNp
bGljb24gbWFjcyAod2hpY2ggaXMga2luZCBvZiBPSz8pLiAgT3RoZXIgSSBzdWdnZXN0IHdlIHVz
ZSBhIG5vbi1PU1gNCj4+PiBzcGVjaWZpYyB2YWx1ZSBoZXJlLCBzbyB0aGF0IGlmIHJlcXVpcmVk
IHdlIGNvdWxkIGRpc3Rpbmd1aXNoIHRoaXMNCj4+PiBjYXNlIHdoZXJlIHRoZSB1c2VyIGlzIGV4
cGVjdGVkIHRvIHByb3ZpZGUgWEVOX0NPTVBJTEVfQVJDSC4NCj4+PiANCj4+PiBNYXliZSBYRU5f
Q09NUElMRV9BUkNIID0geyB1bmtub3duIHwgdW5kZWZpbmVkIH0/DQo+PiANCj4+IEkgYW0gb2sg
dG8gY2hhbmdlIHRoaXMgd2l0aCBlaXRoZXIgYnV0IG1heWJlIHVuc3VwcG9ydGVkIGNvdWxkIGJl
DQo+PiBhIHRoaXJkIGNob2ljZT8NCj4gDQo+IE5vIHN0cm9uZyBvcGluaW9uIGZvciBlaXRoZXIg
bmFtaW5nLCBhcyBsb25nIGFzIHdlIGRvbid0IGV4cGxpY2l0bHkNCj4gdXNlICJEYXJ3aW4iLg0K
DQpvayBsZXQncyB1c2UgInVuc3VwcG9ydGVkIg0KDQpJIHdpbGwgcHVzaCBhIHY0IHdpdGggdGhl
IGNvbW1pdCBtZXNzYWdlIGFuZCBEYXJ3aW4ubWsgZml4ZXMNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQoNCg==

