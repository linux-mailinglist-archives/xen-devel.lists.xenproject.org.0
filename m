Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF01ECA5B1B
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 00:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178356.1502218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRIo9-000505-Kf; Thu, 04 Dec 2025 23:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178356.1502218; Thu, 04 Dec 2025 23:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRIo9-0004xQ-Hv; Thu, 04 Dec 2025 23:32:21 +0000
Received: by outflank-mailman (input) for mailman id 1178356;
 Thu, 04 Dec 2025 23:32:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYI0=6K=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vRIo8-0004xK-Gc
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 23:32:20 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c80ba2-d169-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 00:32:18 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GVXPR03MB8307.eurprd03.prod.outlook.com (2603:10a6:150:6f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 23:32:12 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 23:32:12 +0000
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
X-Inumbo-ID: 78c80ba2-d169-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhOsl1krlkS1p6dpVDkX78Zfk4WcyugGgW+4VK6ogOFaXGJzgYClZrZrKF1BxRfKjOi1L1lInbF/u85jwZhdmFnRsg34XzCo7Fuy+1GczD6N1fjEDw9Kal35o+PoCXij6uB6u4Giw6bgYTbLardnoLo7X5vZ+PXgXhUq3JbMrGOE5+mqWrSabUFR0aywDxlELqvetcy0x6QaxgQAo7MVFNgAsjuuCoVojbV3pufUInf5uRh/VhzTXY1MW0AucDwEzN0On/5hgf+X1Gk0lRk2JAvVRmGtWN9CbhI9ZeTIct5QIKrdgXVCJEpaBq/vDlhpIeCDQYMnaFXXKDUOjbcnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMRJAKsb9K9uB+kPMBEqMhvInS5859NUvvO6Dcxef/k=;
 b=qGePmDnNrT1aYih0otTRaIyGpIFppMdOX3a4U+VwehINOWU4akkflMjKGqvdh87QtIq4DCOjeH7XS5YTUSUChfW5nyntUy5sP9igCHF6jXJnB7g09HZmb64x8jExSbtOpxSx/mNB6u8JaJxULQx9CRgvljDklo0j5IZpY+2FN5bY/IbdD9A9Cwxi0nKM8nrv/ZCzJXUwUiKlzCka0q9EQT+VPhCqoQYn0w+6tPzEm7aRvybooicKzArl0Xqi7S/yBx4EJ4f5luAfJd4YXZxyi+/ZLHluzhvylmJRhxQcTovEPONlQqYw55AzkIATPdouC4zAJapp1mXCaqECq4awwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMRJAKsb9K9uB+kPMBEqMhvInS5859NUvvO6Dcxef/k=;
 b=tM4bP/lQVV/f67yC4fWuzKJrwWVbkGkKrQxs+UIfGWm3f6vSEuc/akCN6Qh9hUXIDjHwDS97H2ss2t5pWJ1JYwpWQdw53Lc3orhL1cqCgbnHnVKfAzdejOYv9cKB0M3lkD9Qso4oqqL0/vWeUD9y91bhPJZjuDAD5MTGaODTfBIxxt0fM+at/mrxeiENMKuBEutxLE68IaaleGjXkT1xGs4CnFPk0fs/zrsjaz12FWz9nZsZFs3iURis58BM4TP4JFTN/UFIpf7CEM/wF8eps8aT95uJ98B0lquPHd/PJVLH/ufukrzBXp6vMqtwtfTu74uOC5g38Exml1BH0UHPqw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jason
 Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: [XEN][PATCH] console/consoleio: account for xen serial input focus
 during write
Thread-Topic: [XEN][PATCH] console/consoleio: account for xen serial input
 focus during write
Thread-Index: AQHcZXY3Nl349El2IUi++g6UhbChUA==
Date: Thu, 4 Dec 2025 23:32:12 +0000
Message-ID: <20251204233211.980862-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|GVXPR03MB8307:EE_
x-ms-office365-filtering-correlation-id: 988e0cac-bef3-4c5d-9a5b-08de338d59cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VB2b3AV8p4+MEvr2doehmMb1Cadbg7nIsHHeAVc5RsSgSKhNVZnyCVP6bn?=
 =?iso-8859-1?Q?F4djMHMvrCnJHjVgV42UIzbhFDI0OOmiZthvkVTqxhzw+6mFV2xPqc/ekV?=
 =?iso-8859-1?Q?MIugoEKTMVRhxqtpVz/V2lHr+vcIYAY/TvBXrEqJC0kWy/fxP5NU51WdCB?=
 =?iso-8859-1?Q?oToUnpCXgUoBbFuYytO+Y4dlSJ9UHMg1TBm0/T9z6g+SUUCe5QJLkB6kSm?=
 =?iso-8859-1?Q?JsvMAdLzVzpwk6no4aH9gtE8e93YatsDH0iH5Qq7xOVy4rYL3jMtsMYfWv?=
 =?iso-8859-1?Q?/gQHbAISeeKKfEt1CyPoKASv4HvhffaETts663x2jK3wg5X+AjCR/HtrIB?=
 =?iso-8859-1?Q?2r6M8h6ijbU12YAygoFybVOSZbd3uZM9BbSG0XiguMqvHv93bHsd4NmvQ5?=
 =?iso-8859-1?Q?KWdanfn4YeJjGOIWJ0HduUMCdVv4g6VVL7IVvc1yCDa5/wMLfQG/YgvLjs?=
 =?iso-8859-1?Q?3LVyyKbmI/tJ7D+KOxQvX/ALwHZpi4OWcUZYdk1x4D7Za/nxX5iOLG5MMy?=
 =?iso-8859-1?Q?8yAvTvdTDFs/2y0KbYuR55wUZjD1bUnJSYqAlhM/BsHJ57Hvo3XFdS8bqq?=
 =?iso-8859-1?Q?r+30momJqhqK75MinqvxyPjHdkDesZo/yEiGn1Wp07RHNDdXWfQxPiICu0?=
 =?iso-8859-1?Q?l+n7Ck3ji7BawMlRUrLKiKsPZOOE8IiSyKsvkdtVQZYQ1O+lHesUgOUj7a?=
 =?iso-8859-1?Q?j7XyiI0InZ4LIxDBrBKCzfgRESqa0AT95z8xxVFIuyL5O2+JiFxjaMw9x3?=
 =?iso-8859-1?Q?GI/uCVzVloh8UgDmq+ZKHyw8zYO8P3rjxu9wZbUbJPhm7SKPJdXRNADuR4?=
 =?iso-8859-1?Q?VnaVv/bKL5FphP6sbwIOsjz+p4FAV2oqKqdtSxR7vCTVuLjSlUGoAzoSEK?=
 =?iso-8859-1?Q?Q9eAdQT10238OaUKX5eEFOs22Q0bMzbQmHEqADhiCN20Nm39EoeYDjvjaA?=
 =?iso-8859-1?Q?KxdHqNjEzcF1uYT0mOtHARdZic3UCVpSWnvL4mj1fZLOHGbRSQiKaDNM36?=
 =?iso-8859-1?Q?I2Bxe31q/IbwgwPfcSUcupTJdgdGoudBXSEbzCaCfgN8uJtLNRBULxQWAB?=
 =?iso-8859-1?Q?nwIVVBKPFPQAtYOddxHKMGkdpGceta45TwxXLjkDHir4KQHHjKkMJOuY9+?=
 =?iso-8859-1?Q?fvU/FoHr34xaKLiS10f+AHUu66W5cogDArp14ZVXKzKOMNeA3VOj6cd6zB?=
 =?iso-8859-1?Q?bnH4J6JIKCs7O+SSyj32oQOMjR5RHQ9+tYaktzPCEQRqvt4eAuI7f4WJx6?=
 =?iso-8859-1?Q?hOGGJMeLe0TvaUFZ4VqPcAAC7iqAhbmW65hOJbNj9PLyGu1/jP4B/g9Nz2?=
 =?iso-8859-1?Q?gHX6sCjw/LCdFrgVU9D9J6ulZfnPz8CxEA5EsEYXFsO6N3zSWT2Fs9m+xR?=
 =?iso-8859-1?Q?lHKHQgvYs9tJwEBegAC7b16zHxV4OeOhJ1jNUmmrOu4NUxn4vg7ImhaGtl?=
 =?iso-8859-1?Q?oaN6dRtvj6cM/tXoCXyUnmZHxGexH4tTeRSn+mrLqZuG99PKjoEBIz7/P9?=
 =?iso-8859-1?Q?2iBDHrGK0t4zT+cMSdGtEbr4UJ8b3UxtEoplI+i1cd1s0SRHL34vBZukxr?=
 =?iso-8859-1?Q?5Ic4/xJpmXmgPPtqdhWNaX9sqrMs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WIH8l+ugyRO+ySJuxLIplOriwkme5d9f7R6zCFaRTthfDI4CKTdZzpPLIk?=
 =?iso-8859-1?Q?Zv5kfK8INVhfLwM+x8g+ieB4ouyP18hJpwsBeh58jPk408P0Tj6mpCC23F?=
 =?iso-8859-1?Q?H8NimBWiYHb1E6gEi564ihqk4LR1Htq0RNl3j4XG8Uag02l8JlFgQXB7nr?=
 =?iso-8859-1?Q?aOrDS+7DtupgkpOsDLSV86dyCjCYSMl2V5idDmBrRTfXFeHgOSITpq+s4Y?=
 =?iso-8859-1?Q?bULmrJ4RxRv0eEcC+NOsCt7g53RSLPw8sUHmgLKri8SldpAwtxHNMB76nA?=
 =?iso-8859-1?Q?sdZA4Kwf/IH3O65ak12o3/pIpi9jBSChqUMYagkW182LfrAV85hQj591uQ?=
 =?iso-8859-1?Q?fvghd0QZIuHUJrFuiLIsc89RV3VO0jUULL3CCdwufVKX0XwopUCulqbV2b?=
 =?iso-8859-1?Q?XTMKkvdv582qC0nKbaeTT5bX8ptlbj5ZxdzAo2qkTP/scF9cEYMUx5R18P?=
 =?iso-8859-1?Q?jQmCtWdAV5d0YkF3jvuhtbvnyrCMQ73ch3Mor0smWqZhBr0naJ9QghSYGp?=
 =?iso-8859-1?Q?ii4loWNrCS0pnvlHFdsENrsPDvO/t/b79mvYw1vP1a7wey+cWBNSwIlEhX?=
 =?iso-8859-1?Q?vtvnZYkhjUBWDwkykNs66V76BfcKK0TzDsBvTd+60aiOAVUognkSYsCFqX?=
 =?iso-8859-1?Q?uSyYW6fjPwpO5WogNkYvLG+PhM5TyyTa8fb5QMZig/zja2pw/bCm0dwUKi?=
 =?iso-8859-1?Q?OzK1GZupu+OD49+2O9/8waoNwn745izY7jfkHUEi/oRUTxol3+pp4WkUpH?=
 =?iso-8859-1?Q?SBsy4CCP2OdCFah6gGRQAPBUlZLi54INgCAiF2pcD7brebATutj2pFlR3r?=
 =?iso-8859-1?Q?Hwm2oW//bS67cZQI6aOx/C8LaChj76ZSkt1m1gcJ9J/T9R8hpiKPnw5xwL?=
 =?iso-8859-1?Q?HTtczgyI9mUaq1c6kxXeINzVrFebKj7QS/l3I/Z0RGBMR/i6RfG/uqhQj4?=
 =?iso-8859-1?Q?iAHs2o0Tf6TbMNu6K4D1BiarF7jhll/vGOrCeo0lxqKuJLMthzpIXoKgFN?=
 =?iso-8859-1?Q?EHU6V1hjyVHvQOiwF+vvg3mURurAzpmPpHrQ/AV7doaBQFJAlnHBaZQFZE?=
 =?iso-8859-1?Q?O9TMI5VVoAcEVpbn0G+yD8I0EiJz9kal1UgKb4OxvTpLaEOQHYVDTDeoUA?=
 =?iso-8859-1?Q?0QXZUApzblDiILKD2lt2Bn+BMrjN5Mr4oMkCwAInwdo5UGpHpbW8vtviTW?=
 =?iso-8859-1?Q?VT8zsiJbKpmkKjks0UP/KOosL82iOPXHkT7NgnNwaz7GZ67vHVX4cUYLBQ?=
 =?iso-8859-1?Q?oPxhC42H7jthqIOq/6CZ0bKPkr3nybJyxxhJJgEI1h/nS4ZkL7NyVc/V/C?=
 =?iso-8859-1?Q?kRwSkUDQkYKX3oBv2tP9YDe56JhPyUtbPFe5jp07cjjZeWystAEXUse9RD?=
 =?iso-8859-1?Q?eGrzP7pqt6gzqNnq9LkConjWOoMrg/ZYuzgBsgqHWUNb3+ALTiVCGWUEcb?=
 =?iso-8859-1?Q?vTz/Rx1kwo3dzN/xK6VyFGpWXDEtEjx/r2ZyQe29LamOShkzI1gflH+5I/?=
 =?iso-8859-1?Q?5fdITEOM+0t/ZFqUcvHpXu8/U3nC/nbsdW+ytDfrS63iF8P5NqlATh8bcp?=
 =?iso-8859-1?Q?GMyZ9D8BZKDDA9vesn1AFgO84Hmf3zIPTRT87jtfAO6yNiHWjikS3pzZqU?=
 =?iso-8859-1?Q?YYQ4HaR39vH4P4kMwnXnbyWU220rQQZwbgDd/xcEkki7PyZ3+PSDufdg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988e0cac-bef3-4c5d-9a5b-08de338d59cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 23:32:12.2729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aeLVdAbcYA2gqrE96lN1ukZ+iV9hV1XcLbyMnAuw+HQ0MYPKONzRTC/JE8F4/kSvCwWJnqwv3hGr2JaC+gWiKSmHpzSSLrfDdcDG0cwlFjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8307

From: Grygorii Strashko <grygorii_strashko@epam.com>

When 2 or more domains are created and:
- one is hwdom with "hvc0" (console_io) console
- other DomUs with vpl011 or "hvc0" (console_io) console
console output from hwdom may mix with output from other domains.

Example:
[    2.288816] Key type id_legacy registered
[    2.291894] n(XEN) DOM1: [    1.016950] DMA: preallocated 128 KiB GFP_KE=
RNEL|GFP_DMA32 pool for atomic allocations
fs4filelayout_init: NFSv4 File Layout Driver Registering...
(XEN) DOM1: [    1.018846] audit: initializing netlink subsys (disabled)

This happens because for hwdom the console output is produced by domain and
handled by Xen as stream of chars, which can be interrupted when hwdom is
scheduled out and so, cause console output mix.
The Xen consoleio code trying to mimic serial HW behavior for hwdom
unconditionally by sending available data to serial HW on arrival.
Xen consoleio code does not account for Xen console input focus, comparing
to emulated serial hw, like vpl011, which does the same for domain with
active Xen console input focus only.

Switching console input focus to Xen improves situation, but not enough.

This patch changes consoleio code to account for domain with active Xen
console input focus - console output will be sent directly to serial HW
only if domain has active Xen console input focus. For other domains -
console output will be buffered and sync on per-line basis.

Example output:
(d2) [    4.263417] Key type id_legacy registered
(XEN) DOM1: [    4.658080] Advanced Linux Sound Architecture Driver Initial=
ized.
(d2) [    4.277824] nfs4filelayout_init: NFSv4 File Layout Driver Registeri=
ng...

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
This causes random multi-domain tests failures due to inter-domain console
mixing which breaks console parsing checks.

 xen/drivers/char/console.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a99605103552..391cefc1a7c6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -733,6 +733,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
=20
     while ( count > 0 )
     {
+        struct domain *input;
+
         if ( kcount && hypercall_preempt_check() )
             return hypercall_create_continuation(
                 __HYPERVISOR_console_io, "iih",
@@ -742,7 +744,9 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
=20
-        if ( is_hardware_domain(cd) )
+        input =3D console_get_domain();
+
+        if ( cd =3D=3D input )
         {
             /* Use direct console output as it could be interactive */
             nrspin_lock_irq(&console_lock);
@@ -783,6 +787,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
             spin_unlock(&cons->lock);
         }
=20
+        console_put_domain(input);
+
         guest_handle_add_offset(buffer, kcount);
         count -=3D kcount;
     }
--=20
2.34.1

