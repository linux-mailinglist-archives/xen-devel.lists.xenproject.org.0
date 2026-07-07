Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u+RTGCg2TWqdwgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 19:23:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966871E403
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 19:23:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=fmQTBUXn;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356462.1611087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh9VV-0004XT-Tp; Tue, 07 Jul 2026 17:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356462.1611087; Tue, 07 Jul 2026 17:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh9VV-0004V7-Qp; Tue, 07 Jul 2026 17:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1356462;
 Tue, 07 Jul 2026 17:22:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wh9VU-0004V1-A1
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:22:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh9VT-008EpU-68
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 19:22:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4d35e0-2eae-0a2a0a5409dd-0a2a4503d7ce-10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 19:22:51 +0200
Received: from [52.101.69.120]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4d35ea-ec1a-0a2a45030019-346545783597-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 19:22:50 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9848.eurprd03.prod.outlook.com (2603:10a6:102:31c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 17:22:48 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 17:22:48 +0000
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
 b=lb4cYvdny89zcwpyPTeFoi+AHq3xwZDCzoOqlOvZGCvJPlM0VY1xcPC079XoXe/Ah+nFMQebycSrB6oHiYpXtpcztErjDCJt/9OxWa0FqDaK1P3QTu4dGQ9GnBJOG8N1o6tJXD0Z34TQDhDVmotJwNaZYFmWqucONWc9CR0lSxC/39SFLCeLtYtmpT00w5P0ATT8PqHbCFP+4KvNOxMMILb0l4tRueXQT2aFS0HmMiZgzxZyhqg4uQKwkxa2tE9JS+ihAxAhZ32KQaGWXP68vqFh0EZiRZawxZp3kJooEFpK3J5gSXiIrsBSGs3ySkSQpQmMsHe5HOEFTxmd1vMFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFi3uEwnIeZGQNeWi++DWXbjD/RgN6Pznd2g6JvFo4A=;
 b=rJ5DFO+zn8HnsjSLN43yqMQZ8cHN1E9/DvhUjrYd1hEF8b82Ac2OlDG9f4kZqEkJakWgwQ1hpRrvHNPEalVgPHK1R1fpEzze+Vo4zXZ37yCIVkqGY8n5NmZjEFNvbnpMLec69Vh1uoAg0Rcs++sLbzeW/NTPvxaha0RdP3jvxEnk+H44AFyIMWfC9K8MDnph9SFBOr/9aKuGNGRfvTG23aOjE2XTxiszkOIwgnmRLwvQvZL9+QPbT7xS4biX/exwiG6+9no91D3sOzbmqfH9QURYaVZ8Tn5brCwfWbUMQ4r+351+b6gkv+lk/xLnEizW+WbvLOe6HdDaXyWommByww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFi3uEwnIeZGQNeWi++DWXbjD/RgN6Pznd2g6JvFo4A=;
 b=fmQTBUXnxjBmD6kAJTP5bryHmjudjpc07VfMVvhjHjVxDRQUtaozG1nw9tWvaAQDp5j69qeKh3yyhNi9RiX6V6TRBobh17DU30VV8JWTk437YCKpVOcwIzaIvUP8BTmzfJHz7jh4aGN6rqYL9MLNIXXXIpkAY6HNDtAUQPZOIwmePU6OAijWFQzYnQnTZrGIaBThuTDXGNbbjunzTTWbpodH1N33Qm4vz4V63j14SnyOVO9O6HgoK/kLeMzCdCe1/f0DNT46Djfs8iGIHkZ+OMntx+IyxSBVaFAAroVhrfTlVR1Omb5RqZ9kk8KiGs9TdyvCAIBN1OotiHJv0X1hlg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v2] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdDjU70ZWnanEzpkGiW5tTx+TsVg==
Date: Tue, 7 Jul 2026 17:22:48 +0000
Message-ID:
 <121636638689ab0d27679fdb711dd9488e5933d4.1783444762.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9848:EE_
x-ms-office365-filtering-correlation-id: 8b5fe13e-0041-4f94-109e-08dedc4c5e1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|23010399003|18002099003|11063799006|38070700021|56012099006|3023799007;
x-microsoft-antispam-message-info:
 If0fuOs/q5TyjBiflc3fMASz2PWtBvX8ggIiKXtWvNBDR0PDz5Jdm3QMHjNEBYRRRusr0UV7ff7dYY34e5G+YFV9D1VCpnKt4R12JIWKO+Kk+17LYjSDDCToLMDvH4eIHxZXcinGxANbDw6hTmphAS/emKj9xIgdqj4I2CL7NSHgTuP3S+slURpmRz3bSlFMFIDNkRYSBBhCefBj77FLQ+BZtd9/Sw+WXJgCbSFTzZWZ9RqHJ0u3/0ywad9a1GYqHcgWZjNc3+EgUcnkoAekKumpwvQsueBLij0KRwrvh059Mkfl6eZvYWhc0kCvuXVDFD2/h/5aIPDPNrMgPpnquVYLlJxWAwSgZnQ/qyzH3MI/H7GJO/ZFxnzajyC4p8L9VGDeiclJ156WZvowWH2BvmQ0JXvxCLmtWFTs6uV9jeRhgJgdoWt40WZxUFItB8SW+/QNKIyk3Cfbcg+NzLbTBmS84lrl+Iu23/XJuj9w3JvfZ2UFvosJF8UExuHHdFWm02Xu+1wrmJfRcH+VUUxSUdEidAs5gCYs0nAzIuZ2cN3s9yojRJVPv6APsNtND1pkrHJHu7frj957qwRS8w7ICDF4dTujQSXvtNHrulLLOsczCnAp2528aao7gCBNF0PWrFj6vU7gbaITwlbwtuHzru/j6+bIVaTBZIfBDYe37rsn2fNmws6BDfi/EDzmHIdmaZ9btfBheiHXFhPJN3iYC+wnGbLuxTjZJ5Fpf0MBG+U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(23010399003)(18002099003)(11063799006)(38070700021)(56012099006)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yEP8X39NOHRuVQ1AwY32TipbchJfhSTIYC4sJBSDsNHK07lk6/8+ekBhQp?=
 =?iso-8859-1?Q?SYl96AmQl72sckLzTsSm8+vD0KMyJNMUCBIWKMOZ/Gk9TfUmVrBP1o/eR8?=
 =?iso-8859-1?Q?FlPjLQ8HVZvPUIiyAaD0qNfI6NIs6B8dkat0+A2e3gxOa5G93p92I5LHOT?=
 =?iso-8859-1?Q?gBDQg1DNfpBWUNJHhp+n0NsLyoc1seUXAaWgZZASpz8EsI0ap9lrjH9v5H?=
 =?iso-8859-1?Q?+cCdoOemiFHllW/m4W7YFobfyQ+QAaynPo6tNb5jomSVu8kAkgID38uX69?=
 =?iso-8859-1?Q?qgv9Eqn0Vrk+U40LG+IJtxYHAXW4WWaCXUvFHEB4/rm2XL3I5Bs/EONb4L?=
 =?iso-8859-1?Q?+9esKyW5w9W+/wdVaBFhmV/n/fd6PmGyCBKxlaXVn9/ZFUSxrfyMhpp+h6?=
 =?iso-8859-1?Q?l3tLf5iM9anbj/vRjxcG4rYxr3eh1QC8/APrCiQP0B1K8t128DlQHuEYgf?=
 =?iso-8859-1?Q?k8U9Z2LRqN5/k7UFUgxIo0AWOFKs14wInDEPVpfQDuvRHtpuGxxQMiuT4c?=
 =?iso-8859-1?Q?mkckRc/yyKJzc9eObApo2BgOFCIYPZRZYP/tNlcl5sDrQNR6PqbrB8fHCj?=
 =?iso-8859-1?Q?ZwFEHmYDb5y1rLoqYRvaBxA+k5Gutoqek9K+lMFJq91D/c9tcrcdhZe+ND?=
 =?iso-8859-1?Q?OCf27x6h2W/LvHtw7o2BPu1pjH3wuORL5+J2UYM0df8iEIaSq70N4ijaZR?=
 =?iso-8859-1?Q?KE+vEEQIm92hvtLmeoih74q/YhG9Gsc9/gz5HNQWqGAZQp34Ng0kqHDARV?=
 =?iso-8859-1?Q?ehhfcGzfKiIM2OjGS5q+shIuhHJXDVhJ7Df2ZZDq3KOM4C5P95i4Dh7ZJO?=
 =?iso-8859-1?Q?UYIhOqMjTm0xfUEZKSF7i1bPn0abiJ0UK6sMg+AylwtnIdTlVMvdsbPuNW?=
 =?iso-8859-1?Q?MAApdDvNYLGQi0qEBT3HIZKyBxpLx2YZeLwEIk8KsVtr1ecsWNrrnrbTRU?=
 =?iso-8859-1?Q?n65bJsqD5yo+X3pCCnhgu8fbL+QmAICjxTiTJjnpAkH+BatMHnTz3VONzN?=
 =?iso-8859-1?Q?BYZHeugh1DGsG6h3y10K5MyBCVFzHWgefUjwIdYGxSII2HlTrcghWTcDTF?=
 =?iso-8859-1?Q?uBFM1r8Cs7lqSSrFS+n2MG3psLt8vXFqka/mH1MbP8j4pZLsnKtARTiKST?=
 =?iso-8859-1?Q?XIcA2TIzdC1Txo/fEH/g8Xk1pZiN+EvPT/Qb3I7VEhHROsOS10C/NezMgW?=
 =?iso-8859-1?Q?GSdmkCXduYA8648N2Hf+AUgGSUjh5lx+auIGAYmie21/h0DGHHjSQ9uVt8?=
 =?iso-8859-1?Q?zWPX2zq0L/EpmjpfbBmdMh1JVaFJyWDEO2HoCdF0f55F8+/Km6Re6ZK+/s?=
 =?iso-8859-1?Q?knmU6Aeh3qO55yD02Iu0eWbuQmSRQ1wkurdpt6E5wzOrDs9gtebGqakm5L?=
 =?iso-8859-1?Q?XEJtmnc03JTNgV71RqHscYJi00J39N+g9bMNglFAjtFSYluHRQIBRtvME8?=
 =?iso-8859-1?Q?hUO99UW9ukr0NvIYGSkM5HdlvZZtxXHpVsJlH+0ML9A/K6IoJ9PKsFwQym?=
 =?iso-8859-1?Q?2yaAKNuiSW3dZ0WA2+de21q7GmPeHCpk8Ur2XUYS85tmmDuroheTstP5cC?=
 =?iso-8859-1?Q?teyrM3drwfE1GM+hw6tkr7UIvrBMBvzq6i8VouHTxktBgaAcItYerDzHBv?=
 =?iso-8859-1?Q?PEp7E9k6YBurqStnNQ1R0hhZjAk1/FJxUr5vKqhDZSFnhuEndYsAnQuIR4?=
 =?iso-8859-1?Q?xCs139Rgum55bc4qcZGCvkEtzs49W8zzaI9BBckg1RD+UZEbP1bvhs8Ean?=
 =?iso-8859-1?Q?yUlh1FSBflG7bp0lhQgzQFDRzGtXS+tMWOSZtzjVeFtniE0tibCv+H3mWR?=
 =?iso-8859-1?Q?nekFUjGMPluE8eOCSS8oeXUvqJHnkzw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5fe13e-0041-4f94-109e-08dedc4c5e1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 17:22:48.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Duu8FbVw9g10c3p2MFVcDEis72myW5GgfFIEDJrVsFGz94qP4cAKCBDi7KB6UBJxKe4HWky9a4rrIoPWFee/ABkFoVoElkPtkv2AcMc45hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9848
X-purgate-ID: tlsNG-33051d/1783444971-BC9825D1-321923E8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9966871E403

A malformed provided partial DTB specifying both '#address-cells =3D <0>'
and '#size-cells =3D <0>' causes '(address_cells * 2 + size_cells)' to
evaluate to 0. This sum is subsequently used as a divisor when calculating
the number of regions in the 'xen,reg' property:

    len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) =
*
                                        sizeof(uint32_t));

This leads to a division by zero exception in the Xen hypervisor during
boot, causing a hypervisor panic/crash.

Fix this by validating that '(address_cells * 2 + size_cells)' is greater
than zero before performing the division. If it is zero, log an error
message and return -EINVAL.

Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
- added Fix tag
- added Oleksii's R-b tags
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index eacfd93087..6796851844 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -154,6 +154,13 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
=20
     /* xen,reg specifies where to map the MMIO region */
     cell =3D (const __be32 *)xen_reg->data;
+
+    if ( (address_cells * 2 + size_cells) =3D=3D 0 )
+    {
+        printk(XENLOG_ERR "Invalid address/size cells combination (both 0)=
\n");
+        return -EINVAL;
+    }
+
     len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells)=
 *
                                         sizeof(uint32_t));
=20
--=20
2.43.0

