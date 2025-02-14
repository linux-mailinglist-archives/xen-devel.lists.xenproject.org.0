Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155BA352FE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 01:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888224.1297614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tijeo-0005r2-HL; Fri, 14 Feb 2025 00:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888224.1297614; Fri, 14 Feb 2025 00:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tijeo-0005ov-EZ; Fri, 14 Feb 2025 00:34:14 +0000
Received: by outflank-mailman (input) for mailman id 888224;
 Fri, 14 Feb 2025 00:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1J1=VF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tijem-0005op-Rb
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 00:34:12 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681c701f-ea6b-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 01:34:10 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9343.eurprd03.prod.outlook.com
 (2603:10a6:20b:57e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 00:34:06 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 00:34:06 +0000
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
X-Inumbo-ID: 681c701f-ea6b-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCx8NIoRWpEzBmNR3hFsSIyalHANwRTJ2ltobBRyiBoz+bKDJ1Zurcx5Bgg4swzhoHMIInTRAqOqqHcNiMOU7g87jWlB/RiUZQHpKwEupaN0x/Tjfu+XvHLR0alUgaLwN87ATN++r0m7AlhOrJ519OTbrTraTjTTZTuKUOLgij957WHy917cL8RRB5DaX5IaaN1bJWBIKtBZiI+Lj3qwp7cXv/hWKvJ4V9qBn7DQpMBdX8SGbzxThNHzQObPMmWf7bywfmaYjxFS0iKM2qb7JvstTAoMsmR7aTpuNDmGmK748iAfl0n5CzKh9z7eHCAqnLNa4t3Q8BY+dUyA+WOcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqfqFF5Roe3ld7PADy91r6NEWpgXO76JvQgamCHSwu8=;
 b=bbo5KmDhrNnUENnSgFr9gDqKOcODSO6uSzTYLeQJvSNRYxcJXU74UhOTziOGZ9kZv6QPXI/nedAudhcwW7qyDRHZBD8sJIcmLDkb26lwKF5zGyXyIkwsEylJCGc5WzDZk35C1aaG2RVJUmCSx4WNW7amkMLqX6VseirepQGLPBcWXuSlsJMEspIL6RXROPgCUYXn0QSikETkzG3kIXo+eNO3alQbUzF8nER20Fm7q0S5lUPwcYGRpo1ov+PHjwAkRs93UXHuaHTnT7WCHJMKPs3T+zbZMTR9ulsYpOmLfG3FTJEDWh9GiL0eRTueACv2ZOypW/AbwrtfD8P8zWNbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqfqFF5Roe3ld7PADy91r6NEWpgXO76JvQgamCHSwu8=;
 b=nxAaUZKR29LUcdodEKc4rF/NH00A92Qodg4O0sTNvsm5d/QYA57/qGfAhcO/VNJPIRhu8vuCf4mUEYWyrZDDzR2OkMo/gBu3A3tbaU0eSp3jBDXybdo5b0wzFcEcUoQYZuUlZ5Qz5tE/JKHB8ghwblEyehWrPBxpfeVScfm/hCaKheBvJX6zIJGhgyDeQCzSVlv7GWeInLfN7JgVMCWrnmy0iLTsVjv4paKjsb+GWOiPifpPoZ6IcZOTlgGU4EHouYRo9WhfPFNdc7jrGR0H0x/JaqtLsh8003sqEiE+jXYryj30JMGCe5kJ+FPz6pIWI1oWKR7nXeHzKQUC4bgY3Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v5 for-4.20(?) 0/4] Add/enable stack protector
Thread-Topic: [PATCH v5 for-4.20(?) 0/4] Add/enable stack protector
Thread-Index: AQHbfmKw/tGT9yjL0kaIj8ILYUmnHQ==
Date: Fri, 14 Feb 2025 00:34:06 +0000
Message-ID: <87jz9tz7nn.fsf@epam.com>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
	<2af57b53-5b01-4435-a134-a3dc00a3d3a4@citrix.com>
In-Reply-To: <2af57b53-5b01-4435-a134-a3dc00a3d3a4@citrix.com> (Andrew
	Cooper's message of "Thu, 13 Feb 2025 23:18:54 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9343:EE_
x-ms-office365-filtering-correlation-id: f251a329-ea1b-47eb-85f1-08dd4c8f49ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oNoTPh1nNa1oxZWaj+J/hSK5NmHn7QOtTTI4a1iWk06AhoVN6tJfSn/z+l?=
 =?iso-8859-1?Q?S+wWGQ5EMD/XmYTO6ruLmr4fTVTmOz5d3bIJqa9E+NSLn1hccBAbQOXaRx?=
 =?iso-8859-1?Q?eMM/YIjhR1zRiU9fn6tSCqB4CW4s7+GBUs968hyPVsms22kPMAj/ucvAF1?=
 =?iso-8859-1?Q?5k3p04YAsPdOh/ZCrKvGat/RJMJq3JrIg9EO/JrGhsSISa5rzfKs9837i5?=
 =?iso-8859-1?Q?vHJDjexfxBwOWvdYEz+D9sftTLxlnR81kUCcqonlnNfLlsswPapxnBj18P?=
 =?iso-8859-1?Q?/wlLzUC8TuB3IObW7l2M1bg+HSeAHPlZORr80Zhx6rcDZAwi9yJtjUTL3u?=
 =?iso-8859-1?Q?32ypLGwgkjqp8I+4uFbY+BRRSfs/0HihQLBbCNZ7c0k5AXTzLUi/pF+Uat?=
 =?iso-8859-1?Q?iJ4cOUbSZV3dlhAnmBPbEVn4jomV5EznmSIaOFMVEhItR9qLrqFz9hUPAy?=
 =?iso-8859-1?Q?3GHn92C6EUNCpDU1a9xfk83xmbGafYVvXE9RBhMmw4iiaT2NiieIh7dyQd?=
 =?iso-8859-1?Q?ppAHsmo1yOHX6FhyjygWhP+akiZQcpWbwi4AAh7VoxiVJ7iq+UiRDh2srr?=
 =?iso-8859-1?Q?w9nZy2O95gLdG9mShzjMIJac1wcpIeWszgxjCdeFRoIXmIxFnjRCgB0ikv?=
 =?iso-8859-1?Q?jIxVwf10b9+K0RJ39KsB5FaW2oYja58ZSW+yTXo7svrmT9elvw9EBpqz3z?=
 =?iso-8859-1?Q?ry1SNoUWv9+vz/EAcvIumZgaodf7RMoz3rNpWijEY/fBaNWotLa84nTNoM?=
 =?iso-8859-1?Q?y1whbX7MenMDSYuxSYMypu8L0GEx4DIneBGkXz3QZxS04WB6mc3tpju+Dl?=
 =?iso-8859-1?Q?NfuEibBlZdcMtTzXk4gfdOqzSmnRfoMPmbTJ2KRqQgL5atOX4Q+ihYxKUa?=
 =?iso-8859-1?Q?JzRGAj4p365ObFBBI9/hxn42LfNa7srOaOdqoL789kS7lU/4sbFmw862fb?=
 =?iso-8859-1?Q?IkECGhs37yEo5NiCkLhR2Q85Lsv2DTlTdoxpp8Nni5yZZS6P8kzUxtkUDB?=
 =?iso-8859-1?Q?gTpcNDL9WK9V2qc3PZqVpJpYlDDpk57bKK4jceUSOE62vxeMScUG75mFUT?=
 =?iso-8859-1?Q?jgoevgodUKvBsjyU9CNZ0BdIouVqN7m3SvFgznaT7/naeIVQ7qTpX0AVE2?=
 =?iso-8859-1?Q?QKG1nQjNnn5M4hps2ZLRtQgISHSqXIXTYhZboKDBJfXoZSODKszizitGnj?=
 =?iso-8859-1?Q?D7PUXgEs8l0DMtEy5wOWp1YKmyPplfuF1Nc+cm1B+8wUV4UZ4GYf0BvdVA?=
 =?iso-8859-1?Q?i/U7/ypDTLsbIm1e6rczxRLlD0I/88y/kr2YlW/EKqDNrcbevmVWkDK4d5?=
 =?iso-8859-1?Q?1qviIkpSkjyoIrheHYguQ16IoZDBwP9OodEywCIfrk21by0aHEiNHazeYT?=
 =?iso-8859-1?Q?MxBF2rn3I8xVt9dHUh7WKJKW2P3/6KVvs+lG7zMqT8Dm/CU65/sSKd2KWt?=
 =?iso-8859-1?Q?4UvVOMLS3uMvhyyT9CKXKVHEUx3ITnaXDBJBJq/08mkr5Xz1YtY4MksxIN?=
 =?iso-8859-1?Q?lgkNff7Id77xr81RUBvZdL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PjFpZSHATeoPLZF/rTL/eZv6+vAhYAVYOLlq+7oUbJiGYVBMxJbAE4bBru?=
 =?iso-8859-1?Q?xmKW9VvSCzYPj27WcLnifBzya5+TLa6lDRrcdZ/hdW7RtdeWSAuMmiP3Xp?=
 =?iso-8859-1?Q?8Xxen0Emj2ZsrpFVDIUu89eLcyuYxmeIccWBMYXC/a8VRK+VUUlsGCK33w?=
 =?iso-8859-1?Q?G2t9i1j+VmHfNb9J5FByqX3Cw9+aRCkN7tWOwL/Yd1AW9biezdf/BZN9QW?=
 =?iso-8859-1?Q?6XJd2L+hD9idsS/TfhfYMwIXHR5pyb7foUfSEY2GUhByqoQP14yeJs8ONX?=
 =?iso-8859-1?Q?suqKnZXQ0GHP+jBsRbXR5gIOUrikQHoxeWqQNpwJDVFd5v1+nyprLY3iQj?=
 =?iso-8859-1?Q?dP0AdJqSws4Uu/36bCkLCQJtitmsp6MdtWFqFmi0EF+on76HayQEk+t06O?=
 =?iso-8859-1?Q?/fUSbOF0N8IFc1d+NfnDyfHV4FuMn/HdkDB8Oti7Jl7N2z1Tlp929z1NGL?=
 =?iso-8859-1?Q?x/2HA/am9ssd1SNp8MfT/7UJ9s51er4sMsmpNR/hEVYFMxQBL0qgpqQIbl?=
 =?iso-8859-1?Q?lpPqKX36K1ikBO/WrHQ+cGy9y3gBgJsue/Wn45hqDXfmxmlypVJxXl/zpl?=
 =?iso-8859-1?Q?MqhBp3qD3WPGGbwSlEEj4x0AoCYl0sZB/eKPtCoCBGWnSs6oHNq5797j/r?=
 =?iso-8859-1?Q?Lo6lzWKL5fkxTZujTx75FLQ2ZpUjmjygTuUs4erDzxXuh8+ivlH9PEZ90I?=
 =?iso-8859-1?Q?9gAfwbRS+ektRgtP8+Ixjw4dmaCj74GMHYvk7OF95ZrZglEQZK7W3/ldJj?=
 =?iso-8859-1?Q?I1PPANWU7pWkT5CHf700jXvjxePiGvgxYZBxrABT/yfpWoAjOBCYWYJqKV?=
 =?iso-8859-1?Q?6P5+3A5jwfkqeBMdARh7vOi+JYu1dgNGWuRTVhkoLEMQWhtLU2rZA/FozC?=
 =?iso-8859-1?Q?4qHnocbYgLN1di8w0QecxMJblWgx4RH3N13WJ+zAZsQlDmoaO3OVdpY/c1?=
 =?iso-8859-1?Q?JZSEqaa7QuAkBqtaMSso2IaWtiOtkTRId7VLtSN/cWbq0OD1EHGrPumTjI?=
 =?iso-8859-1?Q?AbDS9SnlwQ84c/4KQFhKPVfRTRyypuYHPozcdQXDYStR9oxaDJp8GLaVDg?=
 =?iso-8859-1?Q?7FeUUkELg0xsSUbKYusadDlPmhF6Y/EsgBp9RQR1EKL7LEcDVIN6XdnsT8?=
 =?iso-8859-1?Q?dO6Y5WaaEdn5eT3ireTVfxboGJo749m36yDBs/tDfzEZ/4xuBNG1bJdbgI?=
 =?iso-8859-1?Q?fs6BOiDSkRZnUNysleqNT6PSXeVn70CzRIhvDt+RHK1e2q2Z99SDzr7qIl?=
 =?iso-8859-1?Q?sbv6S99f0KL2/DAKguliAvldaTULqzIW1XP+G43eKApeYl9cg2wMkAHDHh?=
 =?iso-8859-1?Q?+onZ6OWW6tTHpDXVH1hrtQhFA7IbKZkGqn+o/fg7gvEmhiFw32bfCNIkqA?=
 =?iso-8859-1?Q?hBEjZ7iMyAoFEwzu05aJ4B8Yv0uSiDrTlFji48T6e+GLbEZ7irt9i0l/OE?=
 =?iso-8859-1?Q?bZftkQwKf7lygNAcU/CKfFjqZUAFY81z1FvQOYqSumN22AKvLOAc720+4i?=
 =?iso-8859-1?Q?vzCnjbIy5/6mPdA5mYRhsc7vjhV15ndIu88yfrOkrKVw41ohiQUgj5pqsm?=
 =?iso-8859-1?Q?GTsCHNW44NQjG+bgtED2jvDBMTF//RmOtF8nzzBieVBygnU4BGQxzVxOZM?=
 =?iso-8859-1?Q?O/teaKPLTMxRB6SRYpYKgXCQb/xXb7vkT3EgMEO8IZyrv2n5rWIYZxIg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f251a329-ea1b-47eb-85f1-08dd4c8f49ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 00:34:06.0745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KL84awYRP0YI66hmhiwod/GfgAE4A2zl1LHpkBOiaJLTH7EUgt9418cwkc2dE1v5ekqLsTDX3+Z+OIpVG0fEL6DfH1myEcTogS+wtRaF3ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9343


Hi Andrew,

Andrew Cooper <andrew.cooper3@citrix.com> writes:

> On 13/02/2025 10:00 pm, Volodymyr Babchuk wrote:
>> Volodymyr Babchuk (4):
>>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>   xen: common: add ability to enable stack protector
>>   xen: arm: enable stack protector feature
>>   CHANGELOG.md: Mention stack-protector feature
>
> Given the last minute observation on v4, I ran this through GitlabCI
> with STACK_PROTECTOR forced on.
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1670468808
> is the full run.

I noticed that you enabled both UBSAN and STACK_PROTECTOR for
arm32. Have you tried to run arm32 test with UBSAN only?

[...]

--
WBR, Volodymyr

