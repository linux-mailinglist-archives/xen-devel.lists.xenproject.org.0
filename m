Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R4eCHp6zVGrwpgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 11:45:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC37749700
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 11:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=lDvjjiqM;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361555.1613747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjDDR-0005Mh-Sq; Mon, 13 Jul 2026 09:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361555.1613747; Mon, 13 Jul 2026 09:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjDDR-0005K0-Q9; Mon, 13 Jul 2026 09:44:45 +0000
Received: by outflank-mailman (input) for mailman id 1361555;
 Mon, 13 Jul 2026 09:44:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wjDDQ-0005Ju-17
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:44:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjDDP-006VsJ-AS
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 11:44:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a54b37f-5cb7-0a2a0a5109dd-0a2a450cddec-28
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:44:43 +0200
Received: from [52.101.84.88]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a54b38a-e897-0a2a450c0019-34655458308c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:44:43 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by VI1PR03MB10079.eurprd03.prod.outlook.com (2603:10a6:800:1cf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 09:44:38 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 09:44:37 +0000
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
 b=MHdM0rJoyPGCnW6SdMv8td41qmfkCsjUXglVR8vSu8OPJNo8o3wCeV+Nvf/Tg7M+FttVeh7Ao7gZx45rILLSTDQwx89Rx+Szia/YjiO6amb6F+oOmxMbRa2S7r3h4MNLfoh0QBPmPfHjGc7xOw5yOlrJKk+nnbMNtT62oo91DeX9NiRm7d2n0+B4bL8QRs32jjErLS/2flsjzEz3aKXiBlRtOcT/yZUKRzqBN/ou6AwlRYQjF9fT4jt411yy4wjZTaIGwFmv4t1DXX7VGYZEJKipD96Q+S6gaUXDcoNkm30CDPH+sJZUb6uWlaE83VOyYFIHvo6V3ZM05jyTmzGEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwuSUcrSXcB4oQmMcwHcC8098ZqXr2F7X2ivf5acVh4=;
 b=w+GHB1ZKBxuIPYyVpJn9ZNsnNPxYG9Q5Ib8LyPLY221fgc/p0VIQneXohu95h/2fXgB4jsuFPxGMKOE/odgqYzjc8a/1BonHTgO1Oazd0a/KFBIY/dJiQ5yrlRQ4xZEYusg7YnOSIDfWLc7yVPVgik5rUZd6qK5vLq7FG+kdEBa5M3Yp00ZddXuupywAaEPSVcjRz4WTfMZKmlknNyXeuVzIwpI0Mqlkbg0oZk7Tp4FjSHa6gpgEobyMUVnc+xwY8Qp0zsfUEidQFBAzdx9RBqKPByvwzWh2MxnEYNmRyCBTGgwIVYExMkqkq28UKv8oNCo++XTEUUnI5Iznn3y1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwuSUcrSXcB4oQmMcwHcC8098ZqXr2F7X2ivf5acVh4=;
 b=lDvjjiqMq7I/966Tl46n1jvhgaRSzbgD7eh67X+SKLyK7sw4Zidfhe6iPbQmWg4NdGgWoKN5ntgpiZv3bnAKdWh2cMbkmyf+eN6fXo84aWP51ljRHyxUSWZ8VcyQAThjsiEpp40VKZPDj8OWsFcMSfO+RzEQaS30bfRMEZEMyzQo8mRDSl7QIZatoGivPngMQbmBrHwU+Pu6nY5HJfYFvbBsxT2+0ASbSjaurQpi/iTOd0txY2pi5Bp4XYj9w+l7WQn6ZARMgPKGa9PhOHLHjB8c/W+duWNqgIUTXN0AwXOzPsfwyEZuzhNzLoVw5tAnb1H6+hhPcWZKEEENvKSqqA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v6] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH v6] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdEfWIck0nSDsiiEuWy8nQa16TY7ZrDIuAgAAn+YA=
Date: Mon, 13 Jul 2026 09:44:37 +0000
Message-ID: <ee26bcf6-ace8-470c-871d-95e20e4f0c9e@epam.com>
References:
 <351b89ba726d5524fd920cc28b7204d683fa8c43.1783856794.git.dmytro_prokopchuk1@epam.com>
 <e61f2f7e-4686-4566-8916-b22f38332786@amd.com>
In-Reply-To: <e61f2f7e-4686-4566-8916-b22f38332786@amd.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|VI1PR03MB10079:EE_
x-ms-office365-filtering-correlation-id: e2953846-c6e1-4ad3-d16e-08dee0c35abb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|42112799006|366016|1800799024|38070700021|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007|4133799003;
x-microsoft-antispam-message-info:
 99X9S1cWQwwRY90ze7TwDuzO0pzgpFH9RiAjOqlO/0IXukECkmJWsofjW5gYCxSOV51M6tqHOTeCw1DVWVhPW9L1jE/gtrjC8Ro07my2/vOQPi4BpZXGuFYilyFH3aJP7Yx3SK0JmO9pcCv2slpe1AY1O/m5wqlsXGkCLJxAJoV11E1yroaC5RdYUKRhMXJg3gUBmtNaChTgnqkZIADBrLYWft54upW9Tn1rixTbpWLZqPlPDdhVR5+7LO7yYAUmyu99kDf7/MVWSkn7gmtMiwcT8fBKCrqOhPoimBft2uMUajh15r2qfTKfY4aKMiIpeOVcSuTp2lqntMps4VM8safXAHhyfyzpQW77g6p1k9mxF/YiI98IrvcMJv/Vrb2Rf2FefqIygRcs/SZOfPhJ06u3oRvI5Oh97CSjbyAS3pWUoXwEvi28JVnMhdRdl/Y8kD9NBvXX6RHDNA6PRkrU7B88TQtxAHKVB9PjTOG/C1uF6EaYSSCTsfh5qbxXS/mpECBaCUxsgzMkbUGASHLdz6EnMJXNrsKzq0iu1tgf1aAG7EHzNkHirWdO0bPm8wo9nWgpn4WvViA4+rQy/OszsBbp+jhcpELA+CzCPMW0DQdNNneWqi1eheFkERf9LGLb2ZSyo0Qcoce3HDdm1WpEx+ogtoDrgTaytZqUK8YpPGlkz1IyqlWcL1Oac055B0Y9Z4PO4U28gJ2Ftt8chusWPtIEzTd25Qdp0JczIyVydzo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(42112799006)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007)(4133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2ppTXdzQzZ6YWpteFVUaituSTltdUJyR2I1anNaVng4UHE0czZkeUMwM1Bi?=
 =?utf-8?B?UDJNN3U1alJrcEUvempXdkRaQzRBOGJUaFpJVm1ZWUkycmxhbjdlR05DVy9o?=
 =?utf-8?B?UkY4YWtOSnJvUTVqUlpKNUpuejJLUDJaV3lFc0pqNDlUMmVCemNaUlA0OGd5?=
 =?utf-8?B?Nkt1bmg5THVlZXlHUHFlUHpxNCtneUVJam1YcnhOZ3JiR3U2ZzVweHg5SGVO?=
 =?utf-8?B?QnZLR2l2T2djNjRKWFhBTUY0eThIRC9WVXF3VHY0aVQ0dlNqQmJCeXVMd2Jr?=
 =?utf-8?B?Ui9MbnlHejh0WnU1ekllWjRvVmVYMXl6bWE4bFVkMWRFRFRHQ2FVdmdwVnVu?=
 =?utf-8?B?N1Nwb0Rwa1REWEgxQTR4N1o0YXYwUzFacWNpelJDcHl0TUNqMjExQ2NXU1Rm?=
 =?utf-8?B?UW9ZNnlocmRLcjBmYk9UZ01Ta2JPTFdQUEpycndmalpja0ZsdkRUZG1wQlow?=
 =?utf-8?B?QUxEVjNJaFFFNkYzOEo0VWVoUlROb3dGWlVVdlpHT0paMlRBdHhVVEliVkpO?=
 =?utf-8?B?ak10STN1VjQ3c2JPQW03L1JQQmZJcjVHZXVlWE82VlAyNWZkRlN0a0IrdDBr?=
 =?utf-8?B?K21xVlRFN1hkRk9kVDE1UjZYeUhxRGo4N0xvYVNQRzRUTkRnSkJQamxDcXlo?=
 =?utf-8?B?cndCU1hSaWxQZ25wUUtvOERBc0s4WEpGOUFyNWVhL3NxQ0JwSEdXME51UjY0?=
 =?utf-8?B?Skppbm5FZkZ2bldsWTNtSHN4bElubFFlbXF0UEhUL01GTGFGYjc2ZTkrbFJv?=
 =?utf-8?B?QUNXMzQ0VWl1RGdFY1d3M3NyZkUzVVFLdThtQnZxSDFJTWVyZmZmc0hiOWpL?=
 =?utf-8?B?amM2cGFPUVpMSHlXOFUvN1IyYnZzRi8yaDgvM0xaVlRia2hRMThCRjkzK1dY?=
 =?utf-8?B?RnBPSkM0aURLZWlhRzk4U3F4Y3ZzQVV1amdTRWhmY0JLdTRVU3JRRTdGR1Nl?=
 =?utf-8?B?Z1FWK0dzZ3F4ZHEvVzBBUmd5Q05LTUVEd2gwZEtWaFkrNGs0UStsTEd1R2k3?=
 =?utf-8?B?em9HWWN1ZXZYOHFZMXRvZCtHR2drWkZlRUh6UFdzbTVrVWVobjZra3NaU2pN?=
 =?utf-8?B?b0xsbHhkOEVQQk9mWkRXcTl4Vm9XMEJwS3NmSGM5dlZPMHpsd1haV0R6Wko0?=
 =?utf-8?B?ODdoYlRtU2lvbUN2V1ovYXpsNVVxT2VJeWt6bGtFaTBjNEUrYW82SnBUSnhL?=
 =?utf-8?B?VFpDYjFPVkhVSzdoMTk5MGxPVENGQXkxT211SHc3Z0ZWYzZlbGJRbW8wOEpT?=
 =?utf-8?B?eE54Ti9oMitpSjVMYnRpQm5BbXkyTWxoanBxakh3cDF0bis0WmE3MmJSdUV5?=
 =?utf-8?B?M1loRTN2d1dnWHhrZkNNVGJJVWlqbHZmRVVvUjlRSE5waVcrVk5SOE4rZGFK?=
 =?utf-8?B?T0NJT0UzUXR4ZGY0a0J0aEZ1ODMvbVMzYUlFdDNYYldjSkFLRFYydDROMDU5?=
 =?utf-8?B?K2l4VWJKcWpqRVl4L0JvUFlHdVFWZUJTODNHRXlPWk9uaFlNRk0xMFR5UTN6?=
 =?utf-8?B?Zjg5ekZsczVjaDd1MmdFVFpvVFh2bWtTYUl0bk9XQll3QUllYzJoY1JUdm5M?=
 =?utf-8?B?czR6QWVxZStCN0tINFR4cTdyOVpJOVBGRTJucUI4NEE1RlVIblRkc2JwaFhu?=
 =?utf-8?B?REhxREt1MnAzVXUyd0JiOW5sUGhOMEwydm03WXlrUVVESUw2c2NSdUNWR0Nq?=
 =?utf-8?B?K1Y2ZjFYZCt1V3NCV1V1Rk5oTmVlMjNSVWRnWUVvOG0vM29MRzJqZDlZMzN6?=
 =?utf-8?B?K3Y5VEFKTXJJNERCVHlPYnIwVXJyZVBRMlBFNkVjMEgva1pTMWJFZnVldkpq?=
 =?utf-8?B?TkZhZzBYMDZyNDEyNzgwdkFDVlpLS3k1Rm8ydFNoTHo0N0dIUXkrRFUrM2pm?=
 =?utf-8?B?NEY3V0FRb0Z6QzVBQkVMMTdaaVRCUkZkZGhoekp4Si9rR1ZkSnduUm1hY1p0?=
 =?utf-8?B?R1E1UnNmSVArNm9qeE1DVzJ1UEl0QzluRjVwNW1mZ241VGlxbGErc0N3OWdl?=
 =?utf-8?B?M2FNVFEyOGI5b1ZNb3htSTRBSnl1cmZnSFlJN2Z6YmhEUGVBQ2loWk9sUmI2?=
 =?utf-8?B?Y240eTRYcEtVaTVsY3FrRW1RYWZHaHVNRlJZdVpVWE1zYkVLSC8yY2hzekRV?=
 =?utf-8?B?eVBsaTJPMVljVUZYRDZrSFFZOTVybUdVS1I1STd4L210c3A4NXFvV3NHbkV2?=
 =?utf-8?B?SUw0Z3VnZE4rNTBJcTF4UkVlcDcwdGV6WmxEZGUwTnhPQjFjTUhDQ2ZSa1Zh?=
 =?utf-8?B?WkRZeW5KRWtpemYyVE5vZnY5SDdUWXhHZDFPeFR3elE2bS9pVmV6WGpINklB?=
 =?utf-8?B?bmpibnVIUmZ2NHNkd292WWpYRmNrWW56UURROE50RjdMZFd3S0dEQ3VEZk9Q?=
 =?utf-8?Q?Mq6Qj73xiZANlen4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BCEF319226CF14BB95E92E29958FB80@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2953846-c6e1-4ad3-d16e-08dee0c35abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 09:44:37.8470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2wjWdcKe2hfCwXZkvrTAZlgjpTeTycQCT78i4hZYjqyoiXG8IwxUQfPkxIy6YiFSwgOoC60ulET+zVKzVsjo96diq14c4K/qXjyBZH2T+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10079
X-purgate-ID: tlsNG-d25034/1783935883-452FA6B2-F8451A0A/0/0
X-purgate-type: clean
X-purgate-size: 4758
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AC37749700

SGVsbG8gTWljaGFsLCBPbGVrc2lpDQoNClNvcnJ5LCBkb2luZyB0aGlzIHY2Li4uIEkganVzdCBm
b3Jnb3QgdG8gYWRkICJmb3ItNC4yMiIuDQpQbGVhc2UsIGluY2x1ZGUgdGhpcyBwYXRjaCBpbnRv
IDQuMjIuDQoNCkJSLCBEbXl0cm8uDQoNCk9uIDcvMTMvMjYgMTA6MjEsIE9yemVsLCBNaWNoYWwg
d3JvdGU6DQo+DQo+DQo+IE9uIDEyLUp1bC0yNiAxMzo1NiwgRG15dHJvIFByb2tvcGNodWsxIHdy
b3RlOg0KPj4gQSBtYWxmb3JtZWQgcGFydGlhbCBEVEIgc3BlY2lmeWluZyBib3RoICcjYWRkcmVz
cy1jZWxscyA9IDwwPicgYW5kDQo+PiAnI3NpemUtY2VsbHMgPSA8MD4nIGNhdXNlcyAnKGFkZHJl
c3NfY2VsbHMgKiAyICsgc2l6ZV9jZWxscyknIHRvDQo+PiBldmFsdWF0ZSB0byAwLiBUaGlzIHN1
bSBpcyBzdWJzZXF1ZW50bHkgdXNlZCBhcyBhIGRpdmlzb3Igd2hlbg0KPj4gY2FsY3VsYXRpbmcg
dGhlIG51bWJlciBvZiByZWdpb25zIGluIHRoZSAneGVuLHJlZycgcHJvcGVydHkgaW5zaWRlDQo+
PiBoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcCgpOg0KPj4NCj4+ICAgICAgbGVuID0gZmR0MzJfdG9f
Y3B1KHhlbl9yZWctPmxlbikgLyAoKGFkZHJlc3NfY2VsbHMgKiAyICsgc2l6ZV9jZWxscykgKg0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YodWludDMy
X3QpKTsNCj4+DQo+PiBUaGlzIGxlYWRzIHRvIGEgZGl2aXNpb24gYnkgemVybyBleGNlcHRpb24g
aW4gdGhlIFhlbiBoeXBlcnZpc29yIGR1cmluZw0KPj4gYm9vdCwgY2F1c2luZyBhIGh5cGVydmlz
b3IgcGFuaWMvY3Jhc2guDQo+Pg0KPj4gRml4IHRoaXMgYnkgdmFsaWRhdGluZyB0aGF0IGJvdGgg
J2FkZHJlc3NfY2VsbHMnIGFuZCAnc2l6ZV9jZWxscycNCj4+IGFyZSB3aXRoaW4gdGhlIHJhbmdl
IG9mIFsxLCAyXSBhdCB0aGUgdG9wIG9mIGhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKCkuDQo+PiBB
bnkgaW52YWxpZCBjZWxsIHNpemUgY29tYmluYXRpb24gaXMgc2FmZWx5IHJlamVjdGVkIGVhcmx5
IHdpdGggYW4gZXJyb3INCj4+IG1lc3NhZ2UgYW5kIHJldHVybiAtRUlOVkFMLg0KPj4NCj4+IEZ1
cnRoZXJtb3JlLCB1cGRhdGUgaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3AoKSB0byB1c2UgdGhlIHNp
emVvZigqY2VsbCkNCj4+IGluc3RlYWQgb2Ygc2l6ZW9mKHVpbnQzMl90KS4NCj4+DQo+PiBGaXhl
czogOWNlOTc0YzQ3NTg4ICgieGVuL2FybTogYXNzaWduIGRldmljZXMgdG8gYm9vdCBkb21haW5z
IikNCj4+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1
azFAZXBhbS5jb20+DQo+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBh
bWQuY29tPg0KPg0KPiBZb3UgZHJvcHBlZCAiZm9yLTQuMjIiIHN1YmplY3QgcHJlZml4LiBXYXMg
dGhhdCBpbnRlbnRpb25hbCAoeW91IGhhZCBpdCB1bnRpbA0KPiBub3cpPy4gSWYgbm90LCBwbGVh
c2UgcHJvdmlkZSBwcm9zL2NvbnMgZm9yIHRha2luZyBpdCBpbnRvIDQuMjIgYW5kIGRvbid0IGZv
cmdldA0KPiB0byBDQyBPbGVrc2lpIChkb2luZyBzbyBub3cpLiBJdCBpcyBub3QgYSBjcml0aWNh
bCBidWcgYW5kIGl0J3MgYmVlbiB3aXRoIHVzIGZvcg0KPiBhIHdoaWxlIG5vdy4gVGhhdCBzYWlk
LCB0aGUgZml4IGlzIHZlcnkgc2ltcGxlIGFuZCB1bmhhcm1mdWwuDQo+DQo+IH5NaWNoYWwNCj4N
Cj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2NjoNCj4+IC0gbW92ZSBjZWxscyBjaGVjayBhdCB0aGUg
dG9wIG9mIGhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKCkgd2l0aCBhIGNvbW1lbnQNCj4+IC0gcmV3
b3JkIGNvbW1pdCBtZXNzYWdlDQo+PiAtIHJlcGxhY2Ugc2l6ZW9mKHVpbnQzMl90KSB3aXRoIHNp
emVvZigqY2VsbCkgKHVzZSBleHByZXNzaW9uIGluc3RlYWQgb2YgdHlwZSkNCj4+IFRlc3QgQ0kg
cGlwZWxpbmU6DQo+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFw
cmtwNGsveGVuLy0vcGlwZWxpbmVzLzI2Njc1OTY3NjENCj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9u
L2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMgfCAxNSArKysrKysrKysrKysrKy0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIGIveGVu
L2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+PiBpbmRleCBlYWNmZDkzMDg3
Li45NTEzYzFjODM3IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20w
bGVzcy1idWlsZC5jDQo+PiArKysgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1
aWxkLmMNCj4+IEBAIC0xNTIsMTAgKzE1MiwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVf
cGFzc3Rocm91Z2hfcHJvcChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPj4gICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICAgICAgIH0NCj4+DQo+PiArICAgIC8qDQo+PiArICAg
ICAqIHhlbixyZWcgaG9sZHMgZmxhdCBob3N0L2d1ZXN0IHBoeXNpY2FsIGFkZHJlc3NlcyBhbmQg
c2l6ZXMsIHNvIHRoZQ0KPj4gKyAgICAgKiBpbmhlcml0ZWQgI2FkZHJlc3MtY2VsbHMvI3NpemUt
Y2VsbHMgbXVzdCBlYWNoIGJlIDEgb3IgMi4gVGhpcyBhbHNvDQo+PiArICAgICAqIGd1YXJkcyB0
aGUgbGVuIGRpdmlzaW9uIGJlbG93IGFnYWluc3QgYSB6ZXJvIG9yIHdyYXBwZWQgZGl2aXNvci4N
Cj4+ICsgICAgICovDQo+PiArICAgIGlmICggKGFkZHJlc3NfY2VsbHMgPCAxKSB8fCAoYWRkcmVz
c19jZWxscyA+IDIpIHx8DQo+PiArICAgICAgICAgKHNpemVfY2VsbHMgPCAxKSB8fCAoc2l6ZV9j
ZWxscyA+IDIpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIklu
dmFsaWQgYWRkcmVzc19jZWxscyAldSBvciBzaXplX2NlbGxzICV1XG4iLA0KPj4gKyAgICAgICAg
ICAgICAgIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMpOw0KPj4gKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICAgIC8qIHhlbixyZWcgc3BlY2lmaWVzIHdo
ZXJlIHRvIG1hcCB0aGUgTU1JTyByZWdpb24gKi8NCj4+ICAgICAgIGNlbGwgPSAoY29uc3QgX19i
ZTMyICopeGVuX3JlZy0+ZGF0YTsNCj4+ICAgICAgIGxlbiA9IGZkdDMyX3RvX2NwdSh4ZW5fcmVn
LT5sZW4pIC8gKChhZGRyZXNzX2NlbGxzICogMiArIHNpemVfY2VsbHMpICoNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHVpbnQzMl90KSk7DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZigqY2VsbCkpOw0K
Pj4NCj4+ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbGVuOyBpKysgKQ0KPj4gICAgICAgew0KPg0K

