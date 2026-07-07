Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qcEgDXEYTWoTvAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:17:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E471D26D
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:17:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b="S7DYu/dj";
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356339.1610975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7XK-0007z8-2E; Tue, 07 Jul 2026 15:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356339.1610975; Tue, 07 Jul 2026 15:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7XJ-0007xi-VY; Tue, 07 Jul 2026 15:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1356339;
 Tue, 07 Jul 2026 15:16:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wh7XI-0007xc-4S
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:16:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh7XG-007usg-LD
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:16:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4d184f-5cb7-0a2a0a5109dd-0a2a4504df0c-18
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:16:34 +0200
Received: from [40.107.162.78]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4d1851-a01d-0a2a45040019-286ba24e566f-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:16:34 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV2PR03MB11523.eurprd03.prod.outlook.com (2603:10a6:150:320::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 15:16:31 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 15:16:31 +0000
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
 b=uIFPCZDjV1YSlHtepxCV4vezJlAWBeeRJYJAluYs0Jy46vazuTtInzywGoxUnMcVNH9vJAomRusfIiau+beAvtPJU24SxIvg1AL1iuy5C7m7d2IIePSWIctGlz2Oms0Ys1z/swGpgKfhdhgBQ/LwBSAa+oFK2+8b5f9m1UOea4F/pKbaCvGSWCdHYVjk+h2/N+8MZugliwKEqW4QymL4EJsLJGczvfJfPZz94AF/rJii/JKFwC0W+Z75Ir6MdhFi7ONUwIR4WOV3lrcFzpSEmoA1COm2GHQ0PNuz3Rm4AnG2AAfqoG8bdUdp7uyOvgYB3PTaQuOWig0OuNkNcxyLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRQt5BmN7D/iyyK46Ikpo+PNXru/dALXtPZtBI7Jja4=;
 b=LZSVdP3JN4pdLB4/ZjMKdbVH/e/P+EDp1rY9tC3j9RKtFUcB1Ti6qE3NR6+XvjYpqEWAcSOzNoztYe9xP/4oqOw+7aKCOp2rq8He5lTNUOao+8bpZ+regwo1JRorNmoair1xzU8+UggTCHsEilSNr3l/Jq3VoNTArKH8mpxFghT6sTkmIEScPIVhUrWGitzeLfFbePs/ZVRUHVV1bhWpz2inOrUhBMn3QSkLrXTSNmR4sg+cGExWRu4S+CTJ6nXJJhELUA6eH4AGCSnpLCh2vj8lSFxSZO7cqVFpDYDzJnEIbanPedudmQLqMUHLOEb5BwbMOutnG3hBVTzptdj+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRQt5BmN7D/iyyK46Ikpo+PNXru/dALXtPZtBI7Jja4=;
 b=S7DYu/djuXJzDVh/LPYL91/Gi/7+/RmK8tscg5sYtxd9LoHNU7O0S+iZcFyN292IEpqB0c7qT69FJbdXMz/Z5kwaTPC32iileKhSegcAjchuyhsTZ+do15ZcHc3X+hvk5siULAP2CQrcwPwYItAncB2XIEA1WY4ga6w1I5+YsI2ef0F46uVhzZKumHIfMavGbCY394qEm9UAKfzsASK4/sVtfBRugwYhaHuGRoNmPK+mli7lTBaQcUBp2+2mhyMMPkEv1qZQ9tyFrcViHJGizrC+EOx0MwzLBRWHIIGdXlf6KYyox90CJElawOEx/MDod17iIq9qtAEjO0DqMbxQSA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdDiOX7r4PlObs6ESPVB8UpORlsw==
Date: Tue, 7 Jul 2026 15:16:31 +0000
Message-ID:
 <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV2PR03MB11523:EE_
x-ms-office365-filtering-correlation-id: ff41c76f-5d68-472e-c072-08dedc3ab9a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|23010399003|366016|18002099003|38070700021|3023799007|11063799006|56012099006;
x-microsoft-antispam-message-info:
 CcMrvRuPu4JlJhiZ2brpR24EnDEtKA0CGvrrRCFHdPc8v8R1zmezi32uqK4MfeSzq21VOq7P//ky6BsWhhDWgnc3rpfhoyY7yiLGGKu6+aC5++f1hiIjCGYagWlYLikSGwd+IzILiRJSw9pZGc5MMUxdoK/qPl54UZHtMdWRkTHWK4WaA2WfMD5S5nZpIoUx9In+fmeOGmd/B6JDWx9wJ4T07IaZ7WCB1D5iePyvQxkx9KjusnwzA+LF2VBxNlBy8iS2801DuZaYTBItKtqfB41FhiIrQDxXG5T3gMnkgwUCWOfm3l6JCc5xDOUa0jmkdQ4Uhx5wNlhdniBVzkbZAa7cu0e1nRuBMBBlNklitIFBb+Hpxss309xEXksAvHueIKEAgbiWI2TLMB+sRbSYwPq//xzUhhM+zz41LlODd2mr57tz2tcoo7IihfZVURuJIr4IeO8eMZ+sDqAa9TnrV8hWC14Kf5EJRirW3s9wOgqKqSMEXZxnjNAVueGnddkLM9wo7qRYluj6tcTFWyy1A+9Ukggma35bjFDBv52VlTA+BxViDI/+33Kqd5ntbtUeeXws0Mo6hJWYXKugs6MjjxTEwMH382thVU3XxBR7MjG9ymb6PS9Qw+ahS2Zc2NBmGwsgIixhU7o+HRu9HrG226xx+LApT85i9yrHxJZNAwMAmQLxHGRIHI64hqNI63fv4aIiI0ZC/b1zQyoWZVpLheBDl+gfY0cVWl7GdJtOTQA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(23010399003)(366016)(18002099003)(38070700021)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6MAZnI8BgytSzMlNKcz1c6gUitFLE+J4bjc09Jk5oLq422MIPWO43+eysx?=
 =?iso-8859-1?Q?WF0gWBkVEqa/ffLY7MOwfI4Z9XGS8Nx6Jz7fwQ0eVMsmPSPab8lsuTrjHM?=
 =?iso-8859-1?Q?U+swI9LZ/k88uDI/7LRBNO+jFpVRkZbX55RQZFmugCoVkphidpmEekCH+r?=
 =?iso-8859-1?Q?6QJUBpUci3VN6AkxmIjJGcfVu7Yfm2F0SK3i+zGaIVMzH0mMoyaHIVoJo5?=
 =?iso-8859-1?Q?yksZG8AS700mk2+b108x2yKVOHI2m/m/a95Gyge5Au1YxgPEpeCMtjjKYr?=
 =?iso-8859-1?Q?Uw32NIx3JQUAHCJwOW9Zw6NLEzWHSelUe+1rpZ2IOarmzIvXd+tNPtJFQ4?=
 =?iso-8859-1?Q?zbURIo8wsgFxjIRIfv4v/ytfHromYblasX3+a5vXNpTbDXxomKoNt/xhTI?=
 =?iso-8859-1?Q?Ed5efARGwciWsxlFBoHA6QOahDuAdStMMD5hbR7b3Rq7wW3/tIDlRQcLFi?=
 =?iso-8859-1?Q?KJk4zs1MD/ZQLkmDASKeHU++hbEVbLe8c96roi+JD1Cc1b701PJyFtFjeH?=
 =?iso-8859-1?Q?o7WJWqsDQcoD7WNa4Xm7sw1h4DCy+axkKJn1xdsd+ygqteDmSkpXQ2rqX9?=
 =?iso-8859-1?Q?pJ6w3kZVzhoAEtj9qXDWta7LL4BPYnr0cdpT1ndAZKIw9aTpQR5tZGc4ae?=
 =?iso-8859-1?Q?U4+tpooxjWThKNcvaF2euAuUqN034Mn/w97kuYCrIbEWpgclCt/l/Ei5hw?=
 =?iso-8859-1?Q?EoeLvIccMaW5dachs/lafggylhVUqT1CYB4Qu4NAxhymoQc7R6kgOfkKl2?=
 =?iso-8859-1?Q?qSnh+4h3ekYYB+WtYT9dikEpjPQ58rCg6pWXEOwIxyKXU4NVOvRXlzKrBN?=
 =?iso-8859-1?Q?gkKey0oM0+mrjZya9428xKkXPkWpID+0tuK3HbOzBkdo+70maqxhNeqxVw?=
 =?iso-8859-1?Q?IzCHfZYH1mfPFWWSW9JGp3Xm6LS2sLRlFEVvyV2ojMxPgku/IvNB0AHXCd?=
 =?iso-8859-1?Q?PxJFQpqeColIGMpQXAMB33fG3+nFTgJhxl5MN1O7PvAMdcu7muZX+ji0cD?=
 =?iso-8859-1?Q?dOc9WqwBNOiO8+kixEQwePlW3ugbx5WjAlwA1CRfu2YIJxVlML4Fq0SNfM?=
 =?iso-8859-1?Q?oDVCChyseSgI0y9AC6oUgsV5owW6OEZpu3c26sA7ilZulqqx0Fbn2A/oDk?=
 =?iso-8859-1?Q?15sBY24iOgO+X4e/vQVxZyJHqwNUqAYvQjADcSgI96SZ4jkjvj9ap3Qhdn?=
 =?iso-8859-1?Q?sBqa/iGkpQusHp7u90m7Z1tGjlEDE2tscv84SlZ9JCn4maei5Y6xrWw4R4?=
 =?iso-8859-1?Q?CsLQR73kDcqT5H4In+qjuNIn5xeCipDp/E6P5of5fNCY5X+NmYRvUCgICl?=
 =?iso-8859-1?Q?6/QReuxxyvEaBRoR1SAw26y8xD0YNDXyYrT8yPEyYsXjKvufvMpkfBGLek?=
 =?iso-8859-1?Q?yQjNwBD5iKtF+iBDR2UgzPEbZKHd1T5YZz94JupGG/c3sY/YeSrCDu7SRO?=
 =?iso-8859-1?Q?BnuHbHBPH4dfrYprrZV6qasfBTx3OfggOkL1wz1vrw18gq254iXf2TmnWR?=
 =?iso-8859-1?Q?wYSBFXPrz+Bg87Jtjr33mWfBJaIwNYmgJ9qoR+mQj5qsCYZ4LkqPT/e5Ty?=
 =?iso-8859-1?Q?EAw+Lb9Kdi4lZUCxhF+nlkX6gROaBNYFQxXkp03hY7uD4WuwJKUkYNdInF?=
 =?iso-8859-1?Q?7ZMH662GRXyWWPb0MqZ2eBj3QtKmp+tKNcmGNOSDfyE7zOaXFIU5PqtrA5?=
 =?iso-8859-1?Q?arRdSGaxG0gfduEYCNC5hDp5MaJnPEXKdAObx9uqFg51VsbbtXL4JMxDQq?=
 =?iso-8859-1?Q?HviJiplkZlH/KvmYxcfC+kPmmBg9J/zdjXFhdD0wUK69yTfhzuMNL/BNRw?=
 =?iso-8859-1?Q?uMEHT5m4niz+Hz7Mx4PFXd9QFd3fX7M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff41c76f-5d68-472e-c072-08dedc3ab9a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 15:16:31.3892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hvtmh3eVbU+sjgfkxzY+HODbCFhWSW7KfdnbgQUILef7dIMLDnhItpUfQUqVWOCi10RLwYUBzWrBVkA1KLgvBpakJbGiZ9PcV2aSKoBpQQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11523
X-purgate-ID: tlsNG-ebf023/1783437394-AFD241CC-947CDFDB/0/0
X-purgate-type: clean
X-purgate-size: 1655
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C6E471D26D

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

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
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

