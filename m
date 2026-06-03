Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ATTGDus3IGraygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:19:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC826387BB
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:19:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="gN3bW9/j";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326482.1591931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmR7-0008T2-My; Wed, 03 Jun 2026 14:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326482.1591931; Wed, 03 Jun 2026 14:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmR7-0008QR-Iu; Wed, 03 Jun 2026 14:19:13 +0000
Received: by outflank-mailman (input) for mailman id 1326482;
 Wed, 03 Jun 2026 14:19:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmR6-0008QL-KA
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:19:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmR6-001A5o-0k
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:19:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2037dd-5cb7-0a2a0a5109dd-0a2a4501c41c-12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:19:11 +0200
Received: from [52.101.62.7]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2037de-c1f2-0a2a45010019-34653e0730ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:19:11 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by LV1PR03MB989608.namprd03.prod.outlook.com (2603:10b6:408:3f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:19:08 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:19:08 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL1TOxBYW2XyJcp/77W4JnUyQWvlhce2tsIX2rUkrQnSsgy58v5/etbX7S+c9HpXvVsQsg78zj3huOqPArBShVV9kPQoXQO3javqyrIi2uw6h1o1Jk0qhjAFGvKb18yVUdWpZwn4McIx6SONVEXOgiwqFHVnxEtdIy/iA0KCKK2vX0N1HZTFaBW0mwuXeE62nEYJTsYAT3pm4SWYW4ORYfMWoGpi88NGbNJPV7455cPOPfE3fjRaAm62wRe3ehFvj3acq0bPaMTffGcObv3x7KQPdf7wrglAJeiIbklcY/8rMBOSmbhE7/JiF3Uiomfgo0FEaPm4o+V1Ke/gEQGqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GWJXXh6iF5n49mHzoEujM6S8NjnebJCWnlFB9DM4ZU=;
 b=L/CVNvMuBbSORvnpD8z54biJmO1PIU7Vsc0FhYZEU66C1zFXirBDfQMhHfuZos/8e2LyBfpZUr5b0ptBFJ2IAWTvzMoY8YboLcdlT2nXTdaE6TtauXfV1jR1G6jVT3bsUUziI7ikNSG5VPBSUep1jFS/F9XlBL4BuVslsdzcZN+HT3EuGemNDXi41PicmuwqDfhzzSHDcMh2YIJUDSamoVs4BIhoyqKa1ocNwG4mY0Z7y5oluBx45zqYSsR41VsqZFTEOpdIcGt2ElwPFRstoF+bzN1QeBCc9D4+MBYMe4KxHz3NFVGTzmZpwpu6C1BWP4rBui2ok76ArOcBLYXzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GWJXXh6iF5n49mHzoEujM6S8NjnebJCWnlFB9DM4ZU=;
 b=gN3bW9/jpjyCAjoZuKovOryGLx7y/ai+8SbUju/Aa+D8OJw4RQLlCUWtLqJ4WCXL6WNj86FQzCgMdi++F+XlezehHyP/sylaEISFwNsc4HUnbItVaRt4kTwu3CmEVzsCsu5M+0Cl6LshHGVNfzYlraZFZ2iv3uGEusMb/Acxc3Q=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/2] xen/mm: Fix offlining pages only make aligned
 buddies, fixes Xen crash
Thread-Topic: [PATCH 2/2] xen/mm: Fix offlining pages only make aligned
 buddies, fixes Xen crash
Thread-Index: AQHc7rG97rz5vj9jlUWcOgJRfT0PHbYrXS4AgAGK/YA=
Date: Wed, 3 Jun 2026 14:19:08 +0000
Message-ID:
 <LV3PR03MB7707A881E351B37D830EB2E587132@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1779979589.git.bernhard.kaindl@citrix.com>
 <cdaec995676e17f0943cb921eb5ad9f87b96526c.1779979589.git.bernhard.kaindl@citrix.com>
 <017fd1f2-d00b-45a8-b36f-945a0f42a85b@suse.com>
In-Reply-To: <017fd1f2-d00b-45a8-b36f-945a0f42a85b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|LV1PR03MB989608:EE_
x-ms-office365-filtering-correlation-id: b977e17e-e0ff-4dba-ec7c-08dec17b13a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 Em/5hN3KLD6EAH3a+bchRJT08+FVFL6j8q9RGIHDZWUt+k4voE8vLEJZWQW8PFt5L6IWhinQPfFrkQVIctPMySEBeth57Z2ymJeCuKPUEcSn8ZuoJGiNTgFrKNvquIh8X7G0vw4oxTNB4p17Jt5ZtowvF6bNDEw5F5ZsZcMoEznrb8g35MkUHmvU2k+1Sq63bPMjp2tu/QhJiaFbMwbVKeYTDlj3q+a2QjZM49/ci2hsCPwEEhVlW0cmlDfRzpVH4g+W014KdUPeRytWA1jM+EDUprn5pJ2Z45RLPM0tdmHt61hrY1Uf8Bd09etP5UOpgDhcK56i+G5uiOJEhKTSLRM4uaFmRV7yaDYSYVJXrcHbnskF/8N2WPQOwMfSy9YXbbuvAWOXRHCSYoS/F0cwox1vG9oVOWHDP/Dy+EVZJ4AUuf4UbplVh9XnRN1uqilGksrlub0roI092zxornJdtu2ylyfTXpv01h1H2psC2xWgg/aLZXQ4CG1YBrokXH/2+jCHJEWL3iyUffZEXJGuxmn1wWvZm8Z8b/CsPZFzYUGJjHvKL3ZVf7FpYtXxriFtHAcs3mge2CYvM3Zp+1C2dhOHcxec1iUlic910w4ZfYiJe6Fr8NMdqtqlLASwPfvNizcNRebbm2OAdrYz5ZI8zXznjEIuRqU1ymTj/t/r11YQRRs6Bo5kagh3GU3D2obn3QB26KcGerOxSCOZG95L1ggnbuPA/O+NVsiUenFKgprvGI5IR7INY3FSOndqkXwh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkF5QXNqRmIwMTBSWnBqLy90Tzdaelg5cTRCRDkvQjBNZ245Z1V5Y1QwRWV0?=
 =?utf-8?B?UzFYV1FCWVUvc004TXl0LzhZR21tdG1ic3lmREJjd2ZKMEN5VFJOSnZwUS9w?=
 =?utf-8?B?aGRSMWV4VWtmNTd2TWFnNXVrUWxhUGRuYlhhbnFDL1BHbTVwdGgzbHZPbnhl?=
 =?utf-8?B?QmhlbXhpSjJyNVFlZm5rN1J4clhTMnB6S3d1Y0xrczBiNnUvUWxNSFozVDNj?=
 =?utf-8?B?RmpZUDNOOGd5NDY1NkRUY2c3UGNmcnpDWC9LVW9ZVFBTSmtmZTlIRTlwM01E?=
 =?utf-8?B?WDVlaERCZ3hEcGo5TW1vNExYcTNwTWFBOEQybXdiVnorVGxCQXliZ0trL28y?=
 =?utf-8?B?a3lBVnZUWEFSL2VmRkpxb0VmZ3Vyc3dMeUROZGNJaG5KTHI0a3Y1c3hiTW5a?=
 =?utf-8?B?bUxQUU1Iblk4bWZCdjYzU09NUEpNd2lwTTRzN1JjQVIzUldMc2hScXJ1ZUpT?=
 =?utf-8?B?OTJHMkc2LzNabEZrTlZXNlFhZG41amk5NEZFUVBRZEpnR1NQSDNsZDdUY0ZP?=
 =?utf-8?B?RHFZd3FGV0FPV3FYOHBONHNvQW16S2ZrNEFPdkdVVjB5ZXhLaExheDhUM0lm?=
 =?utf-8?B?SUR5azcxRUFTZkZVdmxHd3QvM3RJLzRONCt2N0RFV3BhckNNN05IK2E4VGFy?=
 =?utf-8?B?cVI4ZEJESmtMTjlXZlFRMEQvai9ES3F1RFdQN3p3L05Ra3FsbnBDYnQzTSsz?=
 =?utf-8?B?Nm1scDBZemVvanF0azZPNktrYTNZODFOc2lkU3hWY1FzMVFoamlGamRRTDZE?=
 =?utf-8?B?eUZKYmJjNDJQaDZ4MFlhdERTeEwxSURXWkdqSjFQZEc0ZytXS080TU00TFg4?=
 =?utf-8?B?eUFGK3I1ZDFNTEsvNXVhai9OTE9mVHhtVTFZaTZocjhEUlY5SFJwSmF1RUwz?=
 =?utf-8?B?Ulc3bmhFNVpjb0hFdDFhN1QyNFpqZWV6OG1XNEZpVTl5YkJsTENjREErbVJ4?=
 =?utf-8?B?MkJTc0Y1SDNWOG5HSGRndnN4TVhEdXJrK1FXWndndzB3YjgvNFUzOFZpL3Ny?=
 =?utf-8?B?dExkS1NwemVBc04rTTNlbkxxSUpNMmp2VUVxcEU0WjJrcm5BeWpkQ2w3QlFV?=
 =?utf-8?B?OTJRNW1jVWxHYldxTHpXYUNESGRzQndkSFoxMGFHdXhScWZ5T0hGMm1VQ3A1?=
 =?utf-8?B?eXR3NWJsczhPR2lVWXQvbmhwZjZsV09UTzRuQmFxdHpzSm1wUGxDZThlZUgx?=
 =?utf-8?B?TW9vQnNaSi9GaEIvL0RKUjRjR2UxcldrK2RCQzNPVC9jc0pMeVRIQU92NlE5?=
 =?utf-8?B?Wld2TGZTYyt0ZHFJaW1BNHloZnozaDFHNTZpRTdQdVpDZkFzQUg1aTN1Q2tX?=
 =?utf-8?B?SjdUODFTRmNjOWxQZGdwWWdyNzZmUTZSSitlZjkycFVrMzBVUCtrN2hER1g5?=
 =?utf-8?B?TGVPQzhiVExiWXJGWTgxbGlZeHdqSTFaTG1uQlpQd01qbjB1ek00b3BKanha?=
 =?utf-8?B?UWh4K1pWalQ1c01ZVXhKby9qTXBHVFQ0Rkx3ZjZKeUtVMzZEdFVuaGpsdnhI?=
 =?utf-8?B?Y0hRU3RzYTVKM28vM200WEExekZVOVJQNVdQb1dVdWhqWjZOMFdFdGs4blRj?=
 =?utf-8?B?V1BDU3JjTDVZS3VsUXY4Z0M2TEtPZDN6ZTJNNndBS09EUjk0QUdaazkxTDJB?=
 =?utf-8?B?dXc3U2U1dFdvbUlvaWNVYVBjWjdKb3N0ZkdlcUgzbkZzM3FFVWZpMnlyTEhO?=
 =?utf-8?B?U3pYSm1KNlo4K2hua0xsTDVJSHVUcFk3MGpNS1ZTa3RkTktjdExSVDFKZGF2?=
 =?utf-8?B?SS8vQXBHSUs3UlNTaUhuQ3FqNVBGWlNNOEs1UGsvTFFmWlptcmZLMHVIcGJZ?=
 =?utf-8?B?cDZlcVQ3RllPT1AvZ25hNmpuM1dYaTk1bHNkdTgwUlpra3B1a0ZWMGlGOW9z?=
 =?utf-8?B?S1JTRVhKMGFRcms3RDFRSWhGSFNIdWpqY0V5TUMrdWJUNGdBaDl3UVAzbUxJ?=
 =?utf-8?B?OXNPYTV1K1BFWkRlNlg0THF4eGlSSkdwMDVyL3RJZ0NVbVUwRE5MbUMrMmtU?=
 =?utf-8?B?MG1QRWkyT2Y0Mk85UGI5UHpGM2Y3M3ZjVWhDVmhaZGIwUFFDRHg4dERCa2xT?=
 =?utf-8?B?cjIraXhGVjd3OWFLMTFnU3ZKYWp3WWhvWWVGSmJlRjc3b2w1R2d4bFdFZHpV?=
 =?utf-8?B?blFSN1FTcEJqUUI0Y0VDR2xremJvdDdOckR2TU0zL09XenNMUHc4VVBKa2RK?=
 =?utf-8?B?MFhLeDFGakd5UE96Q1paUWgxaXhDUkk5U1B2c1k2ZlhLcVVJejBmNVBlaXEy?=
 =?utf-8?B?NE56R25qRzlKaFRLODdlbVFMeldNd0lBRmozMklDenhCQkVFNGtiWjhHbXBt?=
 =?utf-8?B?RDMzTzIzeFRWb0w2K3ZMR0lna3F2aXdrNVE5Z21OdldZQ0RSd2FxRjBxbVY3?=
 =?utf-8?Q?NbeGWdiklZkvV8EspQ9G4JZixGY/SMHLi+8PwEgoAoj5m?=
x-ms-exchange-antispam-messagedata-1: 12t+iXCwTfVyCg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b977e17e-e0ff-4dba-ec7c-08dec17b13a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 14:19:08.7654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sRrMfmV1fjn29eqxScyoy9wFidbtaG4MIN/mfLE6yfd/PGO4VW7JgYlXTPrB1TFsa8gJfRKwBDPjmjwjdLN7n4fMyCDs0MnAWGaxlfC06LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989608
X-purgate-ID: tlsNG-d62444/1780496351-B494FFF4-647F6403/0/0
X-purgate-type: clean
X-purgate-size: 502
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.08 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC826387BB

DQpbLi4uXQ0KPiBXaXRoIHRoaXMgaXNvbGF0ZWQsIHdpdGggdGhlIHRpdGxlIGNoYW5nZWQgdG8g
c29tZXRoaW5nIHdoaWNoIGNhbiBiZSBwYXJzZWQNCj4gYW5kIGRvZXNuJ3QgZHVwbGljYXRlICJm
aXgiIGFzIGEgd29yZCwgYW5kIHdpdGggdGhlIGV4Y2VzcyBwYXJlbnRoZXNlcyByZW1vdmVkDQo+
IGZyb20gdGhlIGlmKCkncyBleHByZXNzaW9uOg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpBY2ssIHRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KSSds
bCBzdWJtaXQgdjIgd2l0aCBhbGwgY2hhbmdlcyBhbmQgdGhlIHNpbXBsaWZpY2F0aW9uIG1vbWVu
dGFyaWx5Lg0KDQogICBCZXJuaGFyZA0K

