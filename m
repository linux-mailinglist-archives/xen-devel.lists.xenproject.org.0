Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id raqoF+mUT2pykAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:32:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C06731013
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:32:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=ZTqvbdNJ;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358105.1612376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnuq-0001Al-CI; Thu, 09 Jul 2026 12:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358105.1612376; Thu, 09 Jul 2026 12:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnuq-00018T-9F; Thu, 09 Jul 2026 12:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1358105;
 Thu, 09 Jul 2026 12:31:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1whnuo-00018N-LC
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:31:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnuo-00EtOe-0L
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 14:31:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f94a0-5cb7-0a2a0a5109dd-0a2a4501d5be-32
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:31:41 +0200
Received: from [52.101.70.77]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a4f94ad-3ea4-0a2a45010019-3465464d68c4-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 14:31:41 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PA4PR03MB7135.eurprd03.prod.outlook.com (2603:10a6:102:ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:31:39 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 12:31:38 +0000
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
 b=HJxfpbbHHOSg2U451wWYnqorbDhVjfUuj1k1TpL5ISlMehXtX/nX/gHocZUBzb8C2lpWkmjSfzMQgR1Uffktpj0yvdD3QQqF212UBDl207UaQ0+SJnuBpLoWYhZ06BkI3kkfIyNY9QWegg9bhqGceukBjM4VaT3AWdiX1vE/0dIitPq4wHBfzO4sS/3vS8YmcOckylB8+BHY7QEkTfOc0nnrf4HrWBQFG2XfxH228Oqviidncx4TTYtpgapJYUKbxTfMP/yt5NHoHsM350Eqm0iiHXC03A5hX7vGwBl4rZ7YM80ycaVRhHAxyGX0gxXdstryjIzOXHISQ2XqjD5/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mms2V30MltA9AZj5FU0MdVVfu/1AsbSX2lJZeLlLKDY=;
 b=ZcaGsUlbh19mXWhit+UusUMny27es3/pkY7t8zSkSvaZvLROWdqf3WHXip0TwcjO1NrZhQfLIw1TzhtBDrnEGVkaMThYgZ0e9mnpSgWsgDRiemmpo+MhsMh3ks9bC306QH2daHxG0yFnvZg9ZFai3Tw/j7Ye3UJXt8Y5Yq3z2nzHtljqRYiN8PI1IsXRaSi7ijX/CwK4lTVy0QqE2WkFPHlpB0prExT56VRjiLH7HBNOjse76INPb5oy+Cv7PfR7O2FD60dpgerA3cfyeaALpcdKKvT/viN7JOP6Iv+LRKfymfeu0cgtm0mvA55pv2ZgmqRx+l0777Kr9hMZx8Kdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mms2V30MltA9AZj5FU0MdVVfu/1AsbSX2lJZeLlLKDY=;
 b=ZTqvbdNJJTaoUEDnNbyrwzKFA7aJIP0nN0HDJNADAuPGg2bzdbkxubTK0mZ8/az4YOTRKLaFfpc2tTKc0HomjVwPfPhzdJyLTaon8AiRkQQSj6GBuFj9Lh5A+REfYeXtBZr8cDJbsRGps7fePwlhlkhu9QU8mf9KqfyHsG6klf39nJNr5ptoqY1AcEFwi3zivSUrTg95y97vxoEDVhOYnkWvzsoJXYURDi5p0qvVKPIqinQNyIQMbcDQKkAqw0i+h51xyInYdUvLIw4W2mryjzyqTnCj/jO7/KxJ/YtuLvW/qRwgBM6pHHxCCi76t4xnYhKmeDhhS8ORBr3Boz57Xw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH for-4.22 v5] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Topic: [PATCH for-4.22 v5] dom0less: Prevent division by zero in
 handle_passthrough_prop()
Thread-Index: AQHdD57jetXi2xq2zkS8tff7r9QcYA==
Date: Thu, 9 Jul 2026 12:31:38 +0000
Message-ID:
 <7a146536c13431933899ffffc93c85724dfbaf87.1783599357.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PA4PR03MB7135:EE_
x-ms-office365-filtering-correlation-id: 2ba52dd9-c0c7-42dd-e9bb-08deddb60614
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|42112799006|366016|38070700021|3023799007|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info:
 w+hnUMUXVuMLEulLO4DKeChiFODWIm08qp2p82c1rLG9dLozn63kwDPafwUkZgqPxxlbrFsEcPkGc6PVUZPptdrak4U+/1STIXRDFygHcXf+XgMUBw3fc/xzy2wVsVbttKQSD62kLumjaTeaxpm8LUWB1rnyLwEWowsIWsQ7QHLm2XMZZhSGjYEPfhTqadHoB9xTmOSjEdTjMS1ngxTMlU+O5oI7XzC1YhJOyvPDer44ZXItG3i1xme8bRdok13sKl3uwiwTa09w5h3sE5A3/uukfeJ/ZoLBofyv6APpIvmkAscxAwGtme0ljRrEXC9s2Z4jZFJhaG/meWWFIRLjclo70P2InflJY29JjQCflTZw2YG2vFGvVaRZvgOK6kFZO/fB6aE/34VnBiJSXA2Ma4fyB17Zl3nDGM2xshLMWU3lzaF+n52pFQ81Vj1zbPGd9HgqS6BKCavJejz43JtT81hLMCrXukfty3/8+p3NUfamwHT3Zj0qqYFMMj/U5xaTofedMbSIJ1/O6gHZO86seiGgraxt6DYkj9jkp5giOciBM2kc+7LNfnj0TNBYn1v2RjsO9qSWNtQbPlf5mlLgD8JiBL0+bdeBpnUKl3rVEzu0beAXbTToI65pFBE5Ax1wQHVtZrQHrze82YMu7GC8M7wJYzzkVUA2FMp+o4Do1G/+UjRaxvnEekXxfID6smYu1+fwCOTTbtSskgNUfEXN1FbFMA/DZ4tQW5NIiBlw/Bo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(42112799006)(366016)(38070700021)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2jYoiGlYKgPUlMqheAHFgYDbfas1wTP4ZLgBiSPnCDARA6k3A6LjesmqZi?=
 =?iso-8859-1?Q?Q2yKDdoZnZNPZI4gMQyLIuVI/HZAruxWYndk9cDtm7crTIdVKbDXeLJiCp?=
 =?iso-8859-1?Q?2XhDDlKRabOtHK+b/XTFVKijS082Kf+Xwe0X6YK9YZPvpz42nHbH8aUH3z?=
 =?iso-8859-1?Q?gEl6TowZU42LVQ4CBjKFZ682n+DYMfHJU3jU0ziGdL38cGj36n9e0nmxPR?=
 =?iso-8859-1?Q?s4VDnpxwe76VsadAKl0DXSYZYMeI8LMrBxBRkvlcRcgbKA4eWOKxn7Pd1d?=
 =?iso-8859-1?Q?eEDfbm0l/ltaiLJbOg+GoNLtHgYL0L/AVtTdKTNBoZdv0fqjJGWE7EKMEK?=
 =?iso-8859-1?Q?//YRQnO7vxrgxRaFf6A7/sY6Falfy3fFgNBED61rPRqEjTcxWJl4LwJGA6?=
 =?iso-8859-1?Q?9u1xDkj8OF8NCQW5SuuRbVeTVN7o5sOP22JXaLlhzssURukzIxW1Aclejo?=
 =?iso-8859-1?Q?cQdOrM4kdRYXpb20rCuBxMmarN/wqArdJ2+9CtVeN5KAR5sIB4icm3NVts?=
 =?iso-8859-1?Q?o+iRRS2yRVPyOubpPPg441J5mZTgfLWAx0J//2Z6+H36yP+51aCRyHwOPl?=
 =?iso-8859-1?Q?td3tNhAai/vuGqM7J1IpMivHWIYHp8I+lI0olBhh1IwQya5iYXckiyB0Jb?=
 =?iso-8859-1?Q?H+D5yoeSXFZxvMPdvvNY++he6uKeET8x1xfwf28wgBkl3I7L0WcVPelx1t?=
 =?iso-8859-1?Q?GR1pEsJe1A1JpeuMRhpiXktoMmDEN1PDM4MsDl2JC8Omh0IFOF2xgSx+zy?=
 =?iso-8859-1?Q?x4pfkA1L2stBM4UlX/9GwU05ORKxQ2Ns/hhHm7gM/YPaLyLSdXguQbXLPf?=
 =?iso-8859-1?Q?e7cZe7OEv/M2RJo+uBsoPdAy8dTSy9nV9RMzuLTNjev8zLAnyf8fuz3UDi?=
 =?iso-8859-1?Q?Cv9aqIvq2Ad1mhYJ7lro36G7D9oS+zag5bNkw3mBjwcY7GDs7vnEDZfsYp?=
 =?iso-8859-1?Q?jLPaT3VomEAgBT8+8jEdqySICj6+aL2z+Z6yA4An/Y8vjSgWjbYXOx+wDQ?=
 =?iso-8859-1?Q?CetUFaAZed5q4tTWLWmsF9VkF0+gEzjjf2a+bZS+PuwbfteGzSZxtRNISh?=
 =?iso-8859-1?Q?vsgvGJE9zwOFahxKKBeJZ7pVKa/lBruWxRDjeP9xnIWFJwT4COd0pVE8zA?=
 =?iso-8859-1?Q?/kG7iyX+Vdm6G1X6CnJjOPwiCB0LzM/VCzxKqxKsRAZtoo8RJ+apzLeKzD?=
 =?iso-8859-1?Q?ml54Igofq2dAkw8zIsPOTDo6I4RGoHqW3XjP7YLALNq1s8CHKewDRH9mmd?=
 =?iso-8859-1?Q?ATBhwMRiN7OTvmMPbPxz1o+RpR2R2UfXxBayJu8Bk4s9ZsSBtBaBXrAJyj?=
 =?iso-8859-1?Q?NpjaUkdfuD46TR8Ac3m00m+oCZIb9UY8xitJTCWzVgPQZtuu0LydCpQdg4?=
 =?iso-8859-1?Q?jhJknzStcpWUbKFZFA9PcPnuh0GBxTvvtZms5PyzSCPLYRkz5pz9XBK2O0?=
 =?iso-8859-1?Q?+QM2K4IAG7zyiOuvsE+kmC7qxP8GhvStd77WWiJnJ3ggXzjRVsSs8lE/3S?=
 =?iso-8859-1?Q?95aqR2Wz7nf3GFQis+IlLXoMxQKYQBqUJkgF8gaWtnLGpIKxzQHqXcjCX3?=
 =?iso-8859-1?Q?g9KG84JwPKzAmm5eQb1dGn2wvf8B9jM2Hcy7mYzT/elpr3wSFXj3V4NEa+?=
 =?iso-8859-1?Q?L3/EK4vfUyY3HIB4sBoItauFGkKmbv656E6nrwyiPQ0WvP00HZc/UABQ6L?=
 =?iso-8859-1?Q?pHPXqvNSk8k+CtW3ygg0H0ma+l+t5p8LX2k3jQXxoj8JclVgxO8nsWtUPv?=
 =?iso-8859-1?Q?ltTBWCV0kGK/PmxmvHwP7tnuc5wLh5p/1qz11xJyj4I3VtsII3Z2xn4r/I?=
 =?iso-8859-1?Q?r3bdWjsx+EKOXR3a/U4u7oUHXU11f4Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba52dd9-c0c7-42dd-e9bb-08deddb60614
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 12:31:38.8836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxRwrpyLMDnpAJp1rGJDB8QGyuxhHpryFlxfNFaKPRlXOwSYZr1/FXWvvfTfI/iJNucOKhFptFW5NMLjZEseAn+79t1xlXlbc72KCpaFtvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7135
X-purgate-ID: tlsNG-d62444/1783600301-3DEEE0A8-9777C43B/0/0
X-purgate-type: clean
X-purgate-size: 2082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5C06731013

A malformed partial DTB specifying both '#address-cells =3D <0>' and
'#size-cells =3D <0>' causes '(address_cells * 2 + size_cells)' to
evaluate to 0. This sum is subsequently used as a divisor when
calculating the number of regions in the 'xen,reg' property inside
handle_passthrough_prop():

    len =3D fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) =
*
                                        sizeof(uint32_t));

This leads to a division by zero exception in the Xen hypervisor during
boot, causing a hypervisor panic/crash.

Fix this by validating that both 'address_cells' and 'size_cells'
are within the valid range of [1, 2] at the read side in scan_pfdt_node()
immediately after they are parsed. Any invalid cell size combination is
safely rejected early with an error message and return -EINVAL.

Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v5:
- fixed mistakes around dprintk()
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2664600678
---
 xen/common/device-tree/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index eacfd93087..c054ea4e2f 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -341,6 +341,14 @@ static int __init scan_pfdt_node(struct kernel_info *k=
info, const void *pfdt,
     size_cells =3D device_tree_get_u32(pfdt, nodeoff, "#size-cells",
                                      DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
=20
+    if ( (address_cells < 1) || (address_cells > 2) ||
+         (size_cells < 1) || (size_cells > 2) )
+    {
+        dprintk(XENLOG_ERR, "Invalid address_cells %u or size_cells %u\n",
+                address_cells, size_cells);
+        return -EINVAL;
+    }
+
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
--=20
2.43.0

