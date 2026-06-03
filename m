Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2M/gHVJIIGp30AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:29:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D174A639327
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:29:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=q0nRz9sJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326903.1592183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnWl-0005yD-17; Wed, 03 Jun 2026 15:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326903.1592183; Wed, 03 Jun 2026 15:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnWk-0005uQ-Tg; Wed, 03 Jun 2026 15:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1326903;
 Wed, 03 Jun 2026 15:29:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUnWj-0005uK-Ne
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:29:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnWj-007gTe-3Y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:29:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a204836-5cb7-0a2a0a5109dd-0a2a45029938-8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:29:04 +0200
Received: from [40.107.200.6]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a20483f-af86-0a2a45020019-286bc806cf0e-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:29:04 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by LV3PR03MB7430.namprd03.prod.outlook.com (2603:10b6:408:1a4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:29:01 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:29:01 +0000
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
 b=D8oUIcj+opwPxC2lacEv5Oh8nNHQjPZx7ympdc2Me9Zjl6oJtx+A8aZo/S1MuumGM9eVPoh2vBwum337k8oov8Tkb3Duyd26dICFH251SGiMI+1BiqtJyqjGbXauWJa2/WRoOMvJnrwEbCYVM25nIzZMF9mVkHSNmdTU5WwAInf+LEk8RE39uxRIA0IDQaSJjXKEnuHz0DSuxBh8+u8W4BD70NwNykxEpstUUqAil9bz5vy57TvZkI0/2iWvwlgBOJMF0/4gXQzgDku9k0ylMBHvtfrlmVfpv0EOVO+zSgqHiw9eF4QpRpRhczySq9EPx1CqXwP5o/MvdYFKqZp36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4XJIvKxr0Z31TG9GpCfxmWuA9vCJix2e126sYKyKeM=;
 b=ipGCSX5FDUw8Sy0x/DogKYrM7ArEq+N82PCdoS6vYbyoDYnpX1lIBgmwbgMOdP0EYY58crZCl4S2MNwTNgyH5lPvXw4p3r/iSiwGKlFUOZxukrk1mDPMC8pW0F1EYTabHRtx8tv5TitQK65cIgsV6f+7aG9m7aG0JJLCRJJJVIcbhmM0PTyiD7UrZQE8/vrjQSFpUMlx+Er7Ayopw2hgtov9gWc/gVhAiZo/cfpAsyb1NLzYIbhhnAiXQ71rT7CvhnkUDNEOoQxwtoElb5UFk9Ss92KIYuMe9Rj7L3gK2F4YExGJgMPJ+LKJ3GDoeuRkZVViEqn+G03sITjI0HrqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4XJIvKxr0Z31TG9GpCfxmWuA9vCJix2e126sYKyKeM=;
 b=q0nRz9sJECFfKVOdzV7ySgNQEXBe1bJhIUdEoedoKU1RXDsJwQyBZ0KfTauQsARC/QZPCOq2vZnFAgoeN1Ng/ligVXYj/Duv9+QzTJPIFv6oOKLT3CGGJj/Ohni2i63g4fnGGO6fWXd/+qkA1svM46+o38xNhvlqw1Pw3UIYAbE=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/2] xen/mm: reset PFN_ORDER for offlined buddy heads
Thread-Topic: [PATCH v2 1/2] xen/mm: reset PFN_ORDER for offlined buddy heads
Thread-Index: AQHc82uuqs/PL4CJokeLBKpHrSQtSrYs838AgAAAflA=
Date: Wed, 3 Jun 2026 15:29:01 +0000
Message-ID:
 <LV3PR03MB7707F1D1DFE3DE6ABEB9BD3587132@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1780499500.git.bernhard.kaindl@citrix.com>
 <3d899d52c26e4ff6a45ff33864b355651ce5d081.1780499500.git.bernhard.kaindl@citrix.com>
 <5472f497-8071-4e30-9919-72106122d4ca@suse.com>
In-Reply-To: <5472f497-8071-4e30-9919-72106122d4ca@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|LV3PR03MB7430:EE_
x-ms-office365-filtering-correlation-id: 7222aa28-088e-41c1-30a5-08dec184d6c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700021|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ql4ylhiFZPI2fiM1mFc4BBNfxJkU9d2KWQ6Jar9g+xaSUuoPRAI9Lt8S6mlBEARUoDgvHdfzgVnevcag/oYE37kFodJEKjD0LZDTS34EjGUKMdpe0xEaqTdiu2W4FQg+1pdIGMYErwh8R544nZEQVHp6d68WsURD1lndE0FW5zxwaTOyKRBbiQvSpEs0KuE2Yy+H89CcrwkQfYFEYGvB+9Dv18jm80Xx4sMqoH9YZl90dlGMVxxKoSvhHFwE/WnB0r30rcTlehNRfJ74pyIu2nKMY/KWpXRJ0+v6/BJT//Db8VZVuwtKvmjgTw81xwpgp52KLHuFUm6RC45XoFG5KmI3WXkNaPsjyrmjsoRgq50EtMtyjxNKDOxt/gINwxoFsBzKpuzoh+/NZ1bevGlbcSI3Q8fUNC8PCqTKjJKJ7yCCmRhrJ0f/+AI3gbd5x+S3leNe4DjolB+9cDIKQSolA4u3fx/v5Uk0Znzr0blrCKD31XgcsGw8zqRILwZ8WQIEKuc44G6tx9B3NwQPwC5JK/ftWlbA/w3Kx6bz2eE5FzOwezFq5KmTe6kyirvdaYwOx+gS2JVj5bFwb8z7nNZaTOwDaqrxOq7tr/5BbCYdLlJ6zhyycnFGxID5ZPQoslbb2HMNkWLJukKnH6jEe0jGiLGb/YGS5b8lalvabSXHPPaeou/pmWMKpvk41TzmptLmDq0JgeL+4LLweejZT92zYm6OaxpSf0cKcarjfSFXIIkodbxJbs2dWc5BRXUkbd2k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eW5JdXZIbklpbmNzWEtsVDNCVU5mNGdBT1J6MWo4bUduVFIzL0psaldIREYy?=
 =?utf-8?B?Y3NTeldqV0FIdjhUbFk0djRkY2ZaaEpUaDNRTDA3K003SzliNzFCNTFDR0RG?=
 =?utf-8?B?RS8vNVQ0d1gxVFRBa0NpSlROY1NlZ3RQMWQ5MWJVc3lxdmYreWhaeGFBeTFO?=
 =?utf-8?B?NTBsWDZWeXBFZzdSSklOdTRpaytGTXY3M0p0TEpVODdTQm1ZMjdtdmFlRW9T?=
 =?utf-8?B?dVRVeFFkMkNQdmtkYlpQbkpiRzAxemduTCsvbGovMTBzWld1SE9lbFNkcmV4?=
 =?utf-8?B?WmtGWjJoZkxRTFBMQ1NQUkR6NTVpRG5HcnF4ZjJ2WGEyQ3h1QUFuNnBuZnZR?=
 =?utf-8?B?MDRSNGZXVlJLYVI1QjNoN0ZqcnpoSDJyT3huY1NsYnE0LzhmeFljOWo5MXVF?=
 =?utf-8?B?WmR2VVN4ZkFqd2pzS3NTZ3VpQ2FBSTFxSDEwdnZXT3hMck8yNGVPVVFPai9m?=
 =?utf-8?B?NURERVY4bjI4T3RlUGJ5VW55cEphR0JsdGJzQ0tGcndOUWFiV0NIUmJFSytw?=
 =?utf-8?B?dXcvbUxGeDJXNkE5c2x5Z2xROXU0TXVaVmJjS21BVVlNRE42ZWN1MGFvb0Rr?=
 =?utf-8?B?MEF5V0FxL3FUYVkwdWYzbnVETTQyemFRYmZFZDd6TTNDYVkyL3FEQ1BmbjA5?=
 =?utf-8?B?aEdQbExXUzQwMEN0aFRYSTMvZitFV3lIVExrcC9nelg4QW9TcGx0cCtxcldV?=
 =?utf-8?B?SktETm9PUU9SVGhFa3N0TWlZU1RQcHVhYXlZRnF2VGFEcDJVc2h0Mk1Na2dE?=
 =?utf-8?B?RXRjaWFnbVlEYkFONjgzeW5aMUsrb0p2dVZXLzIvbExWcGloSWZKS25PMUt3?=
 =?utf-8?B?aC9MdUVOMCsyeDBTQ296MmF6emxHSnJJSVpUVlRGYmp2T3EyTEtsRWFINFpH?=
 =?utf-8?B?QXZqKzc0ODQrTU4ydzFhYktrS2JDZ1dhWi8xM0hVUVB2OVZDMm5ZMnBabVVo?=
 =?utf-8?B?SEIwMXRvQXRzMzhEOVdCSmJEbEI3TUROdFlmUGJBS2N5Mmk0Nm5RRzJxek5T?=
 =?utf-8?B?RjFPbGhvQ3VDcDFKUStWR0phRFBuS24vZWxtbG1lRzZJMnFjS2lWMHYwRWpz?=
 =?utf-8?B?bUt0SnQvcTFpbzNla3VBd3ZVcWdmL3NjcFAzV3E0RzRpdnNkb0loeHdMR0l2?=
 =?utf-8?B?OHFWY2podGFsbXV5TzZia05RcW9PN21iK2wrRGZCUjZWVWd3alFVQkJpQXNi?=
 =?utf-8?B?SVR0c21WUTdTeXYzMW9DdklYNUpranVocHJBd2lXOGZkeWpVYThwaDVrZjBC?=
 =?utf-8?B?cFg5WkJBMFgrY0U3UkxIUktpOUNMdi9oSVlkZnFTT0FGSWZudzkwUWo1bFBo?=
 =?utf-8?B?NEYyRjlkc1pNRm9qeHZRMlhiZHJneEZyMWlKb0w2amQvSFRoSDdsRTMzUlpp?=
 =?utf-8?B?VUVIM1llZ3NpRjRoZit2NnFnUWxtNXpnT0lxQ24yNXNXTEIwdnI5ajRNVDJt?=
 =?utf-8?B?WlRzVnNadTM0NFRPSHIybElsV1QyUUFNWkphdkpXTXVNRHVEYmp1dFlsdnc2?=
 =?utf-8?B?dWJrcE1Zb0FYTlVPWm5mbTgvQktlZTRTWjFtMENMb2IrZTJVL2wzUjVHeGcy?=
 =?utf-8?B?Z24rUDBpMElKajF3WE15aVNoTmJMVmpXNlhnT3BXaTVyRm9UanVYN0hTaDJZ?=
 =?utf-8?B?NXdMUjNCVFFRc2d4OVhLUEo4U3VQZjZZNVZMVzlLZXZ1djRsZ29NTnBjZE5B?=
 =?utf-8?B?ZGxEZVBQQTA5WnpaaFlsK1Yyek5sWk5wRms0VUVZQ1o4L3lISVpnSEhVcVV1?=
 =?utf-8?B?VVJSbThwZkJvc3QxTmVwc1J2YzBPY3g3eVFSSE1aNU1yNmJpSVhQcjhQUWl6?=
 =?utf-8?B?WkFGMUdoaW9nWnJIdVdsZHd0dU96bWlkc0RNekJoMVNFaHlGdk50UjFHaHlR?=
 =?utf-8?B?KzhPYVp1ZktqdkJIcE9PcjFuVm1jK1pPZk9STWVseU5yMkFrZUx3SFVHa0gy?=
 =?utf-8?B?aEQ1bWtvL2o0WXJScFBDWi81TTlIUkw1TGJRV3UwRWtTMVVWdDJiZVNvN3lD?=
 =?utf-8?B?aHZQU2J3dVM4Q2Z4M3JUYjIyOTBFOHpnelpyZjEwWmI0RmVTM0FFSHJ5OHFZ?=
 =?utf-8?B?WEgzM3Z0ajdCUE5BSTExQUduaXZ1MSsxM3Fsb2h5YjZNeEJ0bGhVSkEyVVNE?=
 =?utf-8?B?K0grNDRLVHJKaGRSWTVTSXphOXRuTG0yNXphYXBVRVJkcnVuM1pGS3pXdzZ3?=
 =?utf-8?B?MFN0S0FtckhiWkM2bEloNWpneHE4SEdROU9Jajl4QzFuSWNhdmpuUHVsYjQw?=
 =?utf-8?B?alVMYXd3MUpsNGhqL0VXVFdUNlF3VG1aMll0bzMzOEdOTEdZWHNwOEpNNFNI?=
 =?utf-8?B?OXNkd3llSmYrZElDZm9sSVFuR2R6UU91bzJsdWtMMHF3ZXRyK1htRlNZRWcv?=
 =?utf-8?Q?hKVKueKULyPGX3nrW5XVo6dGWPB8UeLa1lqZ+njNjWtWq?=
x-ms-exchange-antispam-messagedata-1: VoiHhNJSwanxzQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7222aa28-088e-41c1-30a5-08dec184d6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 15:29:01.5966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mc+eA4zewuyBAfJWqAAhcgZoMcvHiQaJ7KU4RAf20eRGF347/OaabeO0yaW4vJwV0yT/HxqAPuvM84YXYQuKRSzAPcMrxCwuuCCfKwQMNLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7430
X-purgate-ID: tlsNG-720697/1780500544-7BF66161-CCBD8DD4/0/0
X-purgate-type: clean
X-purgate-size: 350
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:from_mime,citrix.com:dkim,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D174A639327

PiAuLi4gaXMgaXQgcmVhbGx5ICJuZWVkIHRvIj8gSSdkIHN1Z2dlc3Qgc2ltcGx5IGRyb3BwaW5n
ICJ3ZSBuZWVkIHRvIi4gQWxzbw0KPiB1bmxlc3MgdGhlcmUncyByZWFsbHkgYSBnb29kIHJlYXNv
biwgY29tbWVudHMgYmV0dGVyIHdvdWxkbid0IGVuZCBpbiBjb2xvbnMuDQo+IENhbiBtYWtlIGFk
anVzdG1lbnRzIHdoaWxlIGNvbW1pdHRpbmcsIGFzIGxvbmcgYXMgeW91IGFncmVlLg0KDQpPZiBj
b3Vyc2UsIGNvcnJlY3QhDQpCZXJuaGFyZA0K

