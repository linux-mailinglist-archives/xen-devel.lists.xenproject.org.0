Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F5B4287D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 20:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108866.1458844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utrnZ-0007XL-Gf; Wed, 03 Sep 2025 18:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108866.1458844; Wed, 03 Sep 2025 18:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utrnZ-0007Vr-DW; Wed, 03 Sep 2025 18:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1108866;
 Wed, 03 Sep 2025 18:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CyF=3O=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1utrnY-0007Uy-1A
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 18:01:32 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00f1febc-88f0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 20:01:25 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by TYCPR01MB10068.jpnprd01.prod.outlook.com (2603:1096:400:1e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 18:01:17 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 18:01:14 +0000
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
X-Inumbo-ID: 00f1febc-88f0-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a99O0zeIa6R2KcrQggsIUSVylnziOZ7KeDdmmtHUItn3PN7p9wCB4i2aPZfsYjzILTIKMJ+7j3GQae/dtC4L62ttjGf5w4hFow2sfP68ZWx1/Pkuwu3ZmWdrjKvnOB1EiqnAzRVMfP1AsaV6ztxw0g79k7BzcKyVEW74zAe71fGuvC0XvDI0KAebm1QUaWvWlS84em/wZl7ZTPfajutd4V8LgepQfaQh4kapS5Fjz0h3xTB4KtsgJkG0dCJUmYLbaHkjkl33+grFunRi0cwLI7yM7YCPqVY05mynLgxwxybelTQdvdTRrZMAYO38HQ/cjekJbFSy3PMgYMGsths35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8l4gIdEqhE1cmUACxb3kdeS4deI+iS6Qx7kCU94diQ=;
 b=wRly8STEC8ku4PaozAOAQiuPBa0T/o0xNZiv3ZaMgfK5pFBsdcjuAS1b2Z9nAuTHLPo1bm4ldZjI6PXM3VMwCdxL96OtpgoORWciuDZPK09gQYLGQmo4vwfJISM0SI27jgkW8Cbb2KBBvk9NbQh2SSUgPhaZItVfH5/DNKso4AB1ZkWMzUZikEp2Bde69bDdVZ2h+uHxgjo4TC7hVFDefKp/v/EGlgF9lZvNCEFulu4hGJQa37dTrCEYKhpaz2v77XtkyglLLpRo0ySye0JQ77Z1b1IGv0uKSH2eGCAVVJqnsbNqrQugayd3DMSOQb4oTTyOxhaUO+Ytw/7Nq0p5ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8l4gIdEqhE1cmUACxb3kdeS4deI+iS6Qx7kCU94diQ=;
 b=GStT71peDdBw/DivR0+8SAcgKX/P3qLNokyfhmBF5rikYm/jQP8hCmsJv/ZbtYnA1MzVNnU1JqQgz1v8I/lU2XOFQxw0R8uvNeXcaWuQl7be7b1KLj4Y4nfT6WDZZiyFALFvEhsphahK86lw4W5/buVF+XEfpQ58h3fFsqNufyI=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Anthony PERARD <anthony@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>
Subject: RE: [PATCH v4 0/4]  xentop: add physical CPU usage support
Thread-Topic: [PATCH v4 0/4]  xentop: add physical CPU usage support
Thread-Index: AQHcHLzc0wf0/CGB+EiRtdeisPpMILSBn8yAgAARDACAAA3CgA==
Date: Wed, 3 Sep 2025 18:01:14 +0000
Message-ID:
 <OSOPR01MB1240807D763061E93E90D14A8AB01A@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
 <aLhnZ1AsqZoM8nPd@l14> <aLh1tLB0ue379Kwu@l14>
In-Reply-To: <aLh1tLB0ue379Kwu@l14>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|TYCPR01MB10068:EE_
x-ms-office365-filtering-correlation-id: 31d6c3b2-413f-4e5b-0e47-08ddeb13dfb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GDQdySSdjDSCa2BW0JGOa/GxAIbD+hY42IHQF+X4X1G5ofuEsvJqNIYBtss9?=
 =?us-ascii?Q?O/MhYJHD36EGO0Syq2+gQP0fNpUXsWbcoyW9hbexsXmwscnvodhKkXvXgrHY?=
 =?us-ascii?Q?OzSSe5qMFQU+9Rf2t7bY76RAJj3I4ODsJFkHRq0429hdBvEUp40Scycx2kxY?=
 =?us-ascii?Q?e83zQURNMo5lFujlG7X1nxkU0Xd+ELLr1Hff9eViGe811JRcfNfKcRNjXY0k?=
 =?us-ascii?Q?9i5Ubd8MswcIDM8kZXSqFkTCa0+UebtGQ9SxruQIsuqgjR/2Azj8F+VvCST0?=
 =?us-ascii?Q?onSjfZuTED9ZxpOlBIaNhUvBxcWSSRMrTVmAN+unaRRfFS0NjJaxbJVU97ba?=
 =?us-ascii?Q?SV1kA4jtKETBW+iecYYSEZKCKISWAUlLDp1qFf/5tbboYWcD61UdQ0U08gMb?=
 =?us-ascii?Q?fB9nWib59tLkrHAAz6ce+xo1z74VBg0Aov3s2d6EdItIlkXnGwMWuzD7xGWY?=
 =?us-ascii?Q?mmev9Qm0WU2IgpkkxFYcYw1T42l6kE703lC7eFn3EgKGVxLrG3Q6TbM+Lmq9?=
 =?us-ascii?Q?RdShs4hedXISwMThiVQ5Tfaf4FbtED5YVSf1znowadXKgCO9f7Q/xXCvZDl0?=
 =?us-ascii?Q?kzTla599sXdAKW7JhJm5kTJXOhkjTnbVaDUA1HGd5Kr3B2cUuhZx4ji5YoA8?=
 =?us-ascii?Q?blMlfzK9tnYuBM2vOf2psusRfJeUDueslke0nf/ubvzn8y3bwEZ7HLa3E5JT?=
 =?us-ascii?Q?epK0/EZ3ia6txts3w1q7pUCwB4xF88p9Urezh1r8RrCccAMaWpwIDmVoULra?=
 =?us-ascii?Q?13Z/g5wq0qJKfiHN/swFXWvg98kXG36D/7UJRn//q1jyEbSFZJKrYdyU9BqU?=
 =?us-ascii?Q?40IvrG6cUXhgvWNVD+k9dAdEPeeGQMaaYmn9qClqHd6ZfsnIJhK7KscL1ahr?=
 =?us-ascii?Q?Qe56vCjz5dG9twxUsxOxkbskGHhguWa5SU/bpvkyOE8bfvihsG1jKe32enKd?=
 =?us-ascii?Q?Qtqo+V32tmMvzBfCgkJe2c0aUqM/Ug35ekQfM5Gclz+mQjU4P9TLGAexkhn3?=
 =?us-ascii?Q?1vyRMJdjN9YGg+DfnIdj9ffhy0IDkfEdBDXyYx9TLSbaU1t5p7cFVvaKV3Cj?=
 =?us-ascii?Q?Eidkw/Rk4p+hcFYSApSfNVXRMQGoTi+CIq0LQcqp7pFN21qsrBQhgKSFMu8E?=
 =?us-ascii?Q?VVNpVHQDju5WMt9KNfV/jJlo1PRGzE+T8NI5m4qRy2hIartehm774Yy8moM6?=
 =?us-ascii?Q?wnRB9hiVLBYNe4r7Y+7bPD+QvVrYLe2+z+xn23pjg3gqTvERToQVtOnA1glG?=
 =?us-ascii?Q?ub5Fh+AEyjSOO+G6W+axttQToL+loudllt4A+xifq/sWrGrv+/E8vhGMr5gk?=
 =?us-ascii?Q?AjlmuaIcsPPrlp/k++0K63L8llSyhts+4FrtFyriPyoykYSgsP7q7nJX8aTl?=
 =?us-ascii?Q?74tbX/D1EkKyUjkPv2xc/5kE7pGUxmd1sNQxZegfobEe8rMSI7ZxUOrwnQRS?=
 =?us-ascii?Q?ikfrz9/mAtqJ82Rqf/bXo+jpDaGG/zLPcU55WQJkc9WLVYyy38gP0w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jKIBsEMjjd8Pa4wFF0PtNXJVKotI6kgrsPAO3jZRKsK+DGaXFP9+XDmft+fU?=
 =?us-ascii?Q?QHDdLPrQ7D5sCCLbXltfgVgH5RgxKZPteQby/vk7ICvg69mNGwlLweY6u7o6?=
 =?us-ascii?Q?QUwrzR8Os2EUUOKYoEZj4ctiKWgoc7QWEf0+kWh2Qkjy40M20axGYycBGVle?=
 =?us-ascii?Q?QSbdqAdh7842S1GllmtdfCHWdtIF8sNSNwEU17ctVPM6b4mQAf5VIx0IksLs?=
 =?us-ascii?Q?rih/bGDDmQIx+zA3y5272DAabWfZJ4mGjrunVsZ9GuO5X6b6u1esCkxcjq1k?=
 =?us-ascii?Q?yqSuDmaknd6vWtrSQaOhY3zYVrOmesq7xidsuM9wjD53c5C/ybyiTnGTs6pu?=
 =?us-ascii?Q?yXS4Nv/IHuf5YQf1h/tPS92QcsNsT8NXWLH3orZ8zzSnzWw9eaiMBfEuJATz?=
 =?us-ascii?Q?N4Dum93SBN/QIEQ4IgR/KNbm+CXmS9pdiTxZBSmqUc+TPOqxV23CUOKfm6fg?=
 =?us-ascii?Q?boLXf++cM3xBDUuNdFqF08mIpv/zbLD9cH0Xl5Y+Ef87KsyI3IP4dqvT0R93?=
 =?us-ascii?Q?nGQS/VJMThaETamzlzrhRh9v09GY3WbtnMTHuXnDhzJQQ40cKyIo61PaXCb9?=
 =?us-ascii?Q?GxyK1vW3L4M+S4VvAvpMX6tMJxZAjNCcJ+nndVFpyFwZWemScTrT4yM2gsNG?=
 =?us-ascii?Q?7l8gOFUTMgTRzOFDnSPCE47q4Gk/CtuaYZ5aTg0misJZvejiEBeoIMxLgThN?=
 =?us-ascii?Q?uDQdqBMQepUj4CnKS/XYRQZXYOlE3CDl+ixyMB/AWEbGfYP/wb2uR6wsSd+R?=
 =?us-ascii?Q?gNO1kp5Wk27KSHhufiawnAvgWctFE6O1T6dC0og42+vwAOWSwRNLC7wYJ3zW?=
 =?us-ascii?Q?r5hBB9iPx9XjrcEcjUpi3tD+WVgwNWbUhc66QeCEg+gWaHpQI+e/sYuvnAw8?=
 =?us-ascii?Q?actunGrb6HIGqQMrLOB4sm+RPTS/vuyGHFoL8lvQfOwCIRUxyoQHQ+1a6yZ0?=
 =?us-ascii?Q?+JRl4sKrES5Q3ufCtkbeHK1cIoK6tvJ+ewimEal6F3vBzaRBk1itj+/Wy/Q1?=
 =?us-ascii?Q?8pyeixhgWEnhjO8Ucjj9L65qSR62RUedLrrMnMJTcid3YVC0SUhX8oX1B4MH?=
 =?us-ascii?Q?z/EtoahbBiuqUXqv5X44/aW1Eep7P7hp14Qs7AKmW5feg2bVlM9q7IkDYGa7?=
 =?us-ascii?Q?Dh2gX4RSshI84rWcSFYsfxjLQ44BB19xC8xr2b4UmI6FydfdozAlTblq8WVa?=
 =?us-ascii?Q?g3cto2/DEh8YJm2GgmAFvWXzJAvPpYYbkaoFtfCGzuRWr+/pkG/kPwyqD6x8?=
 =?us-ascii?Q?n6OVb/b51a8UXQOrzAE6yc2ZgFOsnWsakyK6QP2HHoN1kSbrnVtBUucAlAlZ?=
 =?us-ascii?Q?FUiaGTv/jnGrWpN73Xemxnakj+NijSSPYlObNJdX7clp6v+HDEClaIgJC9Ra?=
 =?us-ascii?Q?gnWwtrtmHlafxRCsJJgun+0dTru/3p+rpF0mh0e6VgN/QaXjcsPtkJ1hz85d?=
 =?us-ascii?Q?N5pkZ1ho315fxdFGwVxOtDcTSzdZiEgnIXXc1torRbrSveNjZBs6qe28Xogl?=
 =?us-ascii?Q?PZjWqUWdKY7h7ZC0moQcXsIim4iLZNj/FLA5D4kd9BuTcNfSWZrNyfsOptGG?=
 =?us-ascii?Q?Fpj3TDqmL0bY9bKUdDfWJvHLQW9Vcp5VJXxcTQIg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d6c3b2-413f-4e5b-0e47-08ddeb13dfb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 18:01:14.6475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1AbNN2a1tMRpfx7L55HQyYTy4I6/GerDBAZFvpsCl+sgqPh8/8sOpato4MNvOgDumy8w+l/z+A1a8P7WSLbShG0MQE7vw62uIiYP9Bhz8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10068


Hi Anthony,

>> Anyway, squashing back all the patch is the way to go I think.
>>=20
>> I'll have a look at the changes.

> So the code looks good, but only if it is a single patch like on v3.
> Would you be fine if I merge the change, but squash all patch of v4 toget=
her and take the patch description from v3? (or the patch description of th=
e last patch with "integrate" replace by "introduce".)

> If I do the squashing, I'll just ignore the remark to use "unsigned int"
> instead of "int".

> With all patch squash together, more or less: Reviewed-by: Anthony PERARD=
 <anthony.perard@vates.tech>

Thank you for the review and feedback.
I completely understand. Please feel free to squash the v4 series back into=
 a single patch for merging, using the patch description from v3 as you sug=
gested.

Thanks again for your time and guidance.

Best regards,
Jahan

