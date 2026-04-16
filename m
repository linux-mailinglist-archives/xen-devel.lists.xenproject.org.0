Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDqqDpx14WkCtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 01:49:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13D415BAB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 01:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283910.1565929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDWRy-0000pW-0S; Thu, 16 Apr 2026 23:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283910.1565929; Thu, 16 Apr 2026 23:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDWRx-0000n1-PG; Thu, 16 Apr 2026 23:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1283910;
 Thu, 16 Apr 2026 23:48:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wDWRw-0000mv-7f
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 23:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDWRv-007Hvt-KZ
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 01:48:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e1752a-bab6-0a2a0a5309dd-0a2a450bbc34-36
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 01:48:43 +0200
Received: from [52.101.43.67]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e17559-212f-0a2a450b0019-34652b43700f-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 01:48:43 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SA0PR03MB5658.namprd03.prod.outlook.com (2603:10b6:806:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Thu, 16 Apr
 2026 23:48:39 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 23:48:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1Ztp8WSKDUK9XnxzC/YNJlTEccLtorgKqh3sRBiO3NHk3G69xG7gWvRxwnIp1oPpobCjIxKtFjUG4g77ngLUrFnY05mgNKDBuh1fbhKF0KVbUwOtJamnkgZNAKGahvSEJfpdiUCnEQjFBmmeE7F7b2mlSrcKf6xolUpauyR6WQI5+Yuvf/9pgGhfBkiP9C6qvBRQA+mMPBT240s9anbQK1PHZFNACxThPcUsSAjN+qsaMxyUES5RNFTKbRXb5FHW3VmUDOjoD74dUiMkZEJJAOEf5isuqctgEGThaFJgQe4fbi283//Hdy2WpYdG/ZaI4dOrakcJvSHZabmne4sWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV97ZyoIliXkR1/EiuiCiASjWioXeXJYUap5tXGwMPA=;
 b=JTHRw3ERPPx0JQOWmexxePDDZsjR/DXhzDOH9h2udR7srAtgDDcXOGnNgBoxmTrftrNTlGBxoA+hFG3Q1qMzwfzajH8Sn3ZsZaNiTDstX5oJ6vBjN6lPZo4bI/El+XRO2TSsBnJcdskYNQsxXiZ/hXhMpC+2R2qMaMGlj1u6/B9CIZHYdH2Js0d0P29MflaL6H0VO3lWEmujyJJSsFAUf9BsUR8u5Ghz6JnbUd0v+ChLEXLIEqV7vKLubYVAJGVb8QX+ecM7fbVtij1DrqvDvztrglgDDHqtcjKHqglAzwN7+jIhfawPpR8fS0wmzD7vtjz0j0iiuJj8KRpv72fcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV97ZyoIliXkR1/EiuiCiASjWioXeXJYUap5tXGwMPA=;
 b=q7x3MBEeLgB4idXmwKhX6zaCXMr1sFS+7CT2mqgNdHRRXin4gRJO05bjd+g6oRKwbFMizUmwKbcLTnXToAxPweqjjBbs03iD2S/utBUteX6zBWt35zA2hmbSqDpri0nzdXyo2NC4Y4vzIejDE0HXKB2pxu5a4QfN7Iz/Wxqyy9k=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Topic: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
Thread-Index: AQHcpy8NKyz6wh/Wrk6CsdW/rK3ShrWf2LiAgAAdICCAQZUugIABBMnw
Date: Thu, 16 Apr 2026 23:48:38 +0000
Message-ID:
 <LV3PR03MB7707EA3CB86C2D3D16D001CF87232@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
 <7d439bb1-7381-4fa4-af79-423e8c7fafb1@suse.com>
 <LV3PR03MB7707A579E5CBD292B127995C87252@LV3PR03MB7707.namprd03.prod.outlook.com>
 <589b36fe-946d-4a34-8227-a4dc558db304@suse.com>
In-Reply-To: <589b36fe-946d-4a34-8227-a4dc558db304@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|SA0PR03MB5658:EE_
x-ms-office365-filtering-correlation-id: 5c07b66d-2220-4ba5-a77a-08de9c12aec0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ZG31PbO6Aqzd183mXDZNPNkuCD3Xvi29QD7dcLea3zir1xzzJIzjOvq3fUbykdvB56wXJEC+Nk4ZRI/GHAuNiicSV9PvvF2GhP0eSrtengMqnDKjhBUxr/Nu7VLOd60dfQQJ9RbZ622N7pMGKYKpQzlmUvE0CllhjAO3N09UTbwY8U7rop3GBFXifTJ41KGHPBAGdMIdT8ZRTz3KP631opMrz/npw3EAi2wKPQtRfpwNVJBLWNf+WUbcAAC6cl8k/tRlcg0EwfUydZg35XyheXeUZBEXbAnQh9TZ+Yf06w4vwnVc6ce5srhHOyh2y9uZ4nTrr3nbNI/k54T52sIAl+LO755OraU7mT1isV+EsfK1QHw3DSRwxzPyjox7Y9Z8tI2S3r0Aee38vYjlktkNgbbACeRzqQQkmb8g95kBBh3ps+q5F4nJ2lSAratoUE63IMPhSkZyzbrrF2Y2c627zIhzPiirABjvZuSQTphF9qShLTjAFnmuPC5+1F3CdlRdrpWr7FtbZ73rfDnza6a54LmRjvoPq6Ry2Ehh0Fla7PquuEay+sVgrTKwJO/vu0dJSfSGxOa54P305gzFBaPiz7jiO26SF/wz1og3+Kww3xBwF2FmREcnmQ4W1AK6z1Wf8gWapoRSqfRTo0kLz614HTKjt59QnHF0PqnZ9KQ43HI7q146KGESndJg0/4MmBkEJ1OEijyXQOjVRhKXr9yi9eFXoTOfXgRtjkQXtcyb/6ul3PpnlMLkXoB8l2TpVjhd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkNweFM3Q0MzU2YraDA0bExIQmpvUlk3aEgxV3JkR0JNVmpEOE40Y0tUR01t?=
 =?utf-8?B?RVBxV1pRN0xxcGg0VG1rcFh6Y0VrVnUwNERGbXFORGxHZUJaTG5CRWZtcGVO?=
 =?utf-8?B?cXJYUXpNNmNaYjFkbFdzN3V0Q1dUUnpDZmczSWt4WnhKYUtpS01ySlFQSjBr?=
 =?utf-8?B?aVI3YjhaYUlZSEgrRmRDVjg1eW5TV1BCSExxZUcxZkFGN0FQc0VuRFVpS3FY?=
 =?utf-8?B?RUd6S0ordVF0T1gwdk8zV3dnRHB5NEdOY200VzEyRXBJbW1MeUI3MnNaTU1P?=
 =?utf-8?B?aFJIRU9LMVVIRndtOTlaOHJBYjZBSkI2RXBYUStCamV4OXJtVVM0d2xCdEUw?=
 =?utf-8?B?YldHRCtaeUx3UUxjWDQ3aHNId0FFS1FsclptTW5rQ3F5RTRLUmcrSmdjNlJa?=
 =?utf-8?B?ZmJJemRJdTU2TnExZ2QvQXEyR2Q3YlNyRjNWQzNpVEtSTzdDbWxNZU1EUTNZ?=
 =?utf-8?B?STdSUVI4Zk43K0VCVWx6WURKOE5vZlVRaUJHSE5lZGRhQzRZR29Kaks3L0pF?=
 =?utf-8?B?OVcza0hPMjlSTUVlRU8rV3FEMnE4U1Zvb3RncnhHZ0tVRVN2anM3RG4ySTBM?=
 =?utf-8?B?dmJEbUpyZTExZUM5cHEwRWRGN2N5b1N4STVMem5NMGtaVU9GWW9ZWldVNFlp?=
 =?utf-8?B?UWEvbzU5ZFJnZFJYditlbGFaTVVTRHp4STl1QmthY1JqMVBWakxHeEk4VnRm?=
 =?utf-8?B?RDNNVDMrQnZFb2MxL2dOMWIvYnliOUNDRzRQamlZbGJzSVZFTkpqcjArTWRJ?=
 =?utf-8?B?dlJkQmV3bzZoL0cxTVJuYzVWa3BDZFdlanlPZHRyQ1FEWmxkWXc3d1E4NTF4?=
 =?utf-8?B?K1g0QlFUaG96d3haSGQyNmZOVjJVWktxcUxTWU01dmQ4ZkFZdjVaTjBnZVdv?=
 =?utf-8?B?bHNpN1krTXZKbFNDRE5PTGlxb3d6dDFxOW1VT1lOQ09mREQzcDEwZjNsVDk0?=
 =?utf-8?B?bkgwY0NUbXBaTmo5ZzJYZzZ3UlA4UEdQNzQrUCtlVXpJbFViOWVJVGwrMWdv?=
 =?utf-8?B?T3lhdUxidS9TWHdjdnEwMkNiS0dRMjV5SmVEOERRSE93SGlWR3I5UTdjbFky?=
 =?utf-8?B?WWl3WEJvcTlrMDY2MElSZWh0ZXdlT3E5cFA3R3hiY0Q4Sm5XL29TRlRMazkw?=
 =?utf-8?B?LzVvUmRjaVdHMVMyS3Y4UlVpK0tLVnJvOTllOEVmR0xFdmZaSGtGSU1iVURS?=
 =?utf-8?B?SWpWOWx3a2RCZE5hUE94MFhoN1JtekFSNnFTend1Rk1YYVJLV0h5RlYzRTYx?=
 =?utf-8?B?WVdzbjdQakQwTlpIUXN4Zml0SVBQV2JoU0EzSGhtVVFhZjVWZlBseFp3Lyta?=
 =?utf-8?B?dzN2L3IyMzgzbFdMUDJHYm5KSWZ4bHZ1OThxamZhVkNSL09aZ0JwRTNaN21n?=
 =?utf-8?B?TU13dTFuTEI3NkF1SWRsZmp0Y20xK3lPdXpwY29UVkhETCt4SUpxS3FLdnEv?=
 =?utf-8?B?YkxoVG5KV1lSVzVMUllsZUREZ1A4anhrR2Z3a25hUktMTU5WZUpOTjEwYkZw?=
 =?utf-8?B?bGsrUndJejZuK3EyZjM3dDY1Vms1TU0wQm9YRU5ZTkZTamEzQ1hFZ0UwM2xz?=
 =?utf-8?B?M0VtcDUya3pucWVCeUl4bW00VTN6RGFzdEF5ejNHcUhTUlBtdVBDNHVocVhs?=
 =?utf-8?B?aFN2VWR1YzM0SWZCL0hkQ3FGd09LQ2dNVTgyUzNhZ2dWeDViMnAyRFAyN09H?=
 =?utf-8?B?WDc3R2VYTUlNUm1BdERqajFSL3BtanloWVp5cXg2bzdzSXR0emw1RDhPVlJJ?=
 =?utf-8?B?MXRVWEtFeExHU1FBQ1FCb3JLMmZhR0s3VXlZQjcrbmVLaC9GbFA4RjRUSm5X?=
 =?utf-8?B?RVNIZ2xHdSs0S1pZeG9tbGpYS2VkZXRZQTBuNnZ3MlZVRnpJR3k2L0pVKytz?=
 =?utf-8?B?M2RpUExxWXgzYWsrRWlXWmRLTmRRZ3lFNzhtekN1eUlnLzFFcjVIOE1ibktD?=
 =?utf-8?B?UktvQXhMcG0yc1AwdU1YdGl1K0JvNS84ekpvL0xoN0RBdEd4QnJYRnZmV2Rh?=
 =?utf-8?B?RlRRb3Flc1p5UGlpVWVTd2I5OEEyeTAzelRKc1RsVFJEMTQzYjU5VzgranJl?=
 =?utf-8?B?ZDJvNGJleE5peUtzWTVnaFJEVDhqWkNwS0hyNGl4S2FYa0FpUUVqZ0twbXE1?=
 =?utf-8?B?V2pMY05BaGQyT0tBR1hORVZ5Mm5BRGpNYW9aOXgwSXkrWUlSOEdzSXRGYVM1?=
 =?utf-8?B?RjVmNllGMEpwQys5SG5nSG04QlgySlRIZmdTaFhvbTVtZkttRTBRZFNLeXF5?=
 =?utf-8?B?TWpUSHdmTWR4SmN5Ni9aZTk5VmlVRTJZM2dvcHBlb09lOER2QTF5M1NHV2VI?=
 =?utf-8?B?UzlLU3RUdEphTWJZVllBSG1RZDNYSDJRc1JzOGFQdy9ueU9naG9KUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c07b66d-2220-4ba5-a77a-08de9c12aec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 23:48:38.7874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ei8VQYkgQXcrg8WcMGkCY6IFq1o6j2jCf1vy8fxCq8Nu40zQvy7ZXsphssuVPUEq6ip1ckuHssiPATyroC59TYrC4i4bVh3CIOzePlPGdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5658
X-purgate-ID: tlsNG-42698a/1776383323-240B6F3B-DECF847D/0/0
X-purgate-type: clean
X-purgate-size: 2866
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,bernhard-xen.readthedocs.io:url,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8D13D415BAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gSmFuLA0KDQpJIG9ubHkgcmVwbHkgaGVyZSB0byBhY2tub3dsZWRnZSB5b3VyIGNvbW1l
bnQuIFRoaXMgY29kZSBpcyBvYnNvbGV0ZSBub3c6DQoNCkl0IGlzIGhpc3RvcmljYWwgd2l0aCB2
NiBub3csIHdoZXJlIHdlIGhhdmUgbmV3IGNvZGUgYW5kIGRpZmZlcmVudCBjb25zaWRlcmF0aW9u
cw0KdGhhdCB3b3VsZCBiZSBvZmYgdG9waWMgZm9yIHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgb2Jz
b2xldGUgdjQgc2VyaWVzICh0aGUgc2luZ2xlLQ0Kbm9kZSBpbnRlcmZhY2UgZG9lc24ndCBleGlz
dCBpbiB2NiwgdGhlIG5ldyBpbXBsZW1lbnRhdGlvbiBpcyBtdWx0aS1ub2RlKQ0KDQo+ID4+ICsg
ICAgaWYgKCBjbGFpbS5ub2RlID09IFhFTl9ET01DVExfQ0xBSU1fTUVNT1JZX05PX05PREUgKQ0K
PiA+Pj4gKyAgICAgICAgY2xhaW0ubm9kZSA9IE5VTUFfTk9fTk9ERTsNCj4gPj4NCj4gPj4gV2hh
dCBhYm91dCB0aGUgaW5jb21pbmcgY2xhaW0ubm9kZSBiZWluZyBOVU1BX05PX05PREU/IEltbyB0
aGUgcmFuZ2UgY2hlY2tpbmcNCj4gPj4gdGhlIHByZXZpb3VzIHBhdGNoIGFkZHMgdG8gZG9tYWlu
X3NldF9vdXRzdGFuZGluZ19wYWdlcygpIHdhbnRzIHRvIG1vdmUgaGVyZSwNCj4gPj4gYXQgd2hp
Y2ggcG9pbnQgdGhlIGZ1bmN0aW9uJ3MgbmV3IHBhcmFtZXRlciBjb3VsZCBiZSBwcm9wZXJseSBu
b2RlaWRfdC4NCj4gPg0KPiA+IG5vZGVpZF90IGFuZCBOVU1BX05PX05PREUgaGF2ZSAoanVkZ2lu
ZyBieSB0aGUgZXhpc3RpbmcgaW1wbGVtZW50YXRpb24pIGFyZSBub3QNCj4gPiBleHBvc2VkIGlu
IHRoZSBwdWJsaWMgQVBJIHRvIHRoZSBjb250cm9sIGRvbWFpbi4NCj4gPg0KPiA+IFRoaXMgc2Vw
YXJhdGlvbiBpcyBwcm9iYWJseSBhIGdvb2QgdGhpbmcgYmVjYXVzZSBpdCBhbGxvd3MgdG8gY2hh
bmdlIFhlbiBpbnRlcm5hbHMNCj4gPiBsaWtlIG5vZGVpdF90IGFuZCBOVU1BX05PX05PREUgaWYg
c28gZGVzaXJlZCB3aXRob3V0IGNoYW5naW5nIHRoZSBwdWJsaWMgQVBJLg0KPiA+DQo+ID4gTlVN
QV9OT19OT0RFIGlzIGRlZmluZWQgYXMgMHhGRiBhbmQgbm9kZWlkX3QgaXMgdTguIEJ1dCB0aGF0
IGlzIGp1c3QgYW4NCj4gPiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2YgdGhlIEh5cGVydmlzb3Ig
aXRzZWxmLiBJZiBuZWVkZWQsIHdlIGNvdWxkIGNoYW5nZQ0KPiA+IHRoZSBpbXBsZW1lbnRhdGlv
biBsaWtlIHRoaXMgc2VyaWVzIGNvdWxkIGRvLCBpZiB3YW50ZWQuDQo+IA0KPiBZb3Ugc3BlbGwg
aXQgYWxsIG91dCBoZXJlLCBidXQgdGhlbiB5b3UgZG9uJ3QgZHJhdyB0aGUgY29uY2x1c2lvbiB0
aGF0IEkgd2FzIGFpbWluZw0KPiBhdDogSWYgc29tZW9uZSBwYXNzZXMgaW4gMHhmZiwgdGhhdCBf
c2hvdWxkIG5vdF8gYmUgbWlzdGFrZW4gZm9yIE5VTUFfTk9fTk9ERS4gSGVuY2UNCj4gZm9yIHRo
ZSB0aW1lIGJlaW5nIHlvdSBzaW1wbHkgbmVlZCB0byByZWplY3QgMHhmZiBpZiB5b3UgZG9uJ3Qg
d2FudCB0byBleHBvc2UgIm5vDQo+IHNwZWNpZmljIG5vZGUiIGV4YWN0bHkgdGhhdCB3YXkgaW4g
dGhlIEFCSS4gQW5kIGluZGVlZCAuLi4NCg0KQWgsIEkgbWlzdW5kZXJzdG9vZCB5b3VyIGNvbW1l
bnQsIGFja25vd2xlZGdlZC4NCg0KRWFybGllciByZXZpZXdzIGFza2VkIGZvciBub2RlIGNoZWNr
aW5nIGluIGRvbWFpbl9zZXRfb3V0c3RhbmRpbmdfcGFnZXMoKSwgd2hpY2gNCnNob3VsZCwgYXMg
eW91IHN1Z2dlc3RlZCBoYXZlIGJlZW4gbW92ZWQgdGhlcmUuIEJ1dCB0aGF0J3MgaGlzdG9yaWNh
bCB3aXRoIHY2IG5vdywNCndoZXJlIHdlIGhhdmUgbmV3IGNvZGUgYW5kIGRpZmZlcmVudCBjb25z
aWRlcmF0aW9ucy4NCg0KICAgIGN1LCBCZXJuaGFyZA0KDQpQUzogSSBzdWJtaXR0ZWQgdGhlIGN1
cnJlbnQgZGVzaWduIGRvY3VtZW50IHRvIHJlYXNvbiB0aGUgZGVzaWduLCBhbmQgdjYgaXRzZWxm
Og0KaHR0cHM6Ly9iZXJuaGFyZC14ZW4ucmVhZHRoZWRvY3MuaW8vZW4vY2xhaW0tc2V0cy12Mi1k
ZXNpZ24vZGVzaWducy9jbGFpbXMNCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyNi0wNC9tc2cwMDU4Ny5odG1sDQo=

