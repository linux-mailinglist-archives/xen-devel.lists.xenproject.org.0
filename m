Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6431B40E91
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107447.1457870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXfh-0006vb-T3; Tue, 02 Sep 2025 20:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107447.1457870; Tue, 02 Sep 2025 20:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXfh-0006tn-QK; Tue, 02 Sep 2025 20:32:05 +0000
Received: by outflank-mailman (input) for mailman id 1107447;
 Tue, 02 Sep 2025 20:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdbA=3N=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utXff-0006th-UZ
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:32:04 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e14c969d-883b-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:32:01 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV1PR03MB10208.eurprd03.prod.outlook.com
 (2603:10a6:150:16e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 20:31:57 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:31:57 +0000
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
X-Inumbo-ID: e14c969d-883b-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8hGgysEbR8wGy1Go2WJoRI01GgHkF4rt3wgAh32tS1ebNUc8OjUDuarzPkJ34NePyWA2HmUFIaKktBC0Y/xT+/VI+ADvN6xiV7n8tAKZyr15BIXC83aprDWw/+dT7CqhOL4rGPYrGAnsx9xd9vKhjiqgWZkrghFkPPSTO8JJEs42sNDiim5mZajk3NnKQzRqwvKKQSw1n1/aExsL2q/IoDYe+GajLGs01WDFIhdvDbbL0DFB+Vzr0AY/IfMYDLYLymasNTcIU2s5OIMYyhjQnBBVSc/FGAWHYz/K+ce4JR6idL+Ee5IsS7ohId9tLKFBtPe6b/+FRdZQH/WNDJqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obyXw49Y6GCbPfYlK437SY6qiLtFejO9rSyOMNUoTVA=;
 b=XZilVSJ+3aVbNv7EMBl6T4a40GAIYScvD+DZGpx8TaR1bEy4iR6a7siIBwxFSy55zyuGFdCYP3WXZdrEi+/MwufRqkNQyRQqSk8iXb10DBkuoYS4y8EJ2yLfhcGwS56bPjol4JOcem1licyG3ysY6VEFj11UBYHk+NU2JhL9lLF/5CHNARJaf19p9cgQG0zvcimxhy1bGbkGfRlWyCOPRFsk40EKpUBleGYn8mhhI9s0AQsLDyg24hOYraEG+Wy+rPYIO0Sn5FvlWQ45S1XxBmglHZY1P5XBfmG6han8yEI6r6eoRgJ+mn+d2jadv0q31bem4sIqcdjc1v3Dj5TFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obyXw49Y6GCbPfYlK437SY6qiLtFejO9rSyOMNUoTVA=;
 b=LYMNCKQtmU/eCn8kTyoTZNCl/fB8hgG/uIvaZHer/+ZsMRIx62ZD9H3J0bls+C+X7rpybCj9AV2NquvIUOn7DHtUW3+YMcthypCg3T9/LQGhSDWhzWFo7u3lpVjp4544T6D+dMSMlf2USKfSmiUNqM2TPz8Uje66eCcvGCz2BZQpBXu0e3M907ZOJFdMvUKVfL1fVzbfeMMjbQ9TeTsD9zxoCOFZFYcnLKCescQ4Uke94vN04r3gmYZ0+W0NfQ9GWsYFXpMl24xd/pa3rDxLmUR883OXfSrdTdhOq2HdfNok3XtaYUBrX9NMV4ZHnLUY54Zeekk4A2hkCjL18l+57g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 04/13] xen/arm: Don't release IRQs on suspend
Thread-Topic: [PATCH v6 04/13] xen/arm: Don't release IRQs on suspend
Thread-Index: AQHcG4070V6Pun9gkU+MtbSzx0yRtQ==
Date: Tue, 2 Sep 2025 20:31:57 +0000
Message-ID: <875xe0wq83.fsf@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
	<293acbb653b5f4d5bf71dc459f9de3e729bff3e1.1756763487.git.mykola_kvach@epam.com>
In-Reply-To:
 <293acbb653b5f4d5bf71dc459f9de3e729bff3e1.1756763487.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 2 Sep 2025 01:10:08 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV1PR03MB10208:EE_
x-ms-office365-filtering-correlation-id: 24a7b23c-1001-4709-3702-08ddea5fc309
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Ix57hZpw2SnZ0EywFxXqR7x1zSUZNiEhzM7iCEVdn3zUBoVpmCuGbCc62K?=
 =?iso-8859-1?Q?c7eAZbDvBcK7EkjLPPhbmev2e41h5mQ+WnjZcudH5fgEWO1brP8frGuOeX?=
 =?iso-8859-1?Q?v7CWIX3J5blvKnQbHMZ9NgWcWTTcsKc5hxCLC5yAyS7qCXwMbcM6yDGXFx?=
 =?iso-8859-1?Q?eEeT7aioilvgAkEqb/Ai9qc+fOKpuSjxp3R/DySxLr4dqQvvd/YXf+oAdt?=
 =?iso-8859-1?Q?r/Fqz/OO+q/f02jpFHdFDQaLb2nRTt6tY5gWAGGW4ib5NRIj19Y83bwYW0?=
 =?iso-8859-1?Q?ajoQRPiljkTbNH/Q6RXJG+xTHN6o0+BHYBe3qHR5JPU3K6WkmYTpVUq7Q8?=
 =?iso-8859-1?Q?F5J3Pau/sfQwVXImqjGXui7ugWH9IWd/qULh3kXWv2slx6hwRCjLwtQO6i?=
 =?iso-8859-1?Q?Gpc+peIOrXN6rHt+Q4DhQg4muq4+hIdRzyEkXUFzwr20rm3nksTEhcwjIr?=
 =?iso-8859-1?Q?WMYOvNMuj3jwFwXpP/zyYKeExOiX/JvkQR/PPy6WqYy7Ndpt3afM4U3X2+?=
 =?iso-8859-1?Q?GDnRzHOICIL0v8qipyj1EeW84+undw1E5d0LqXFd3m6XfCQ3QMKohP9QwJ?=
 =?iso-8859-1?Q?H5de0+S6+bhGLtCY3yvVBiAk2XODDGIhyqBAUECbrkw0B0dlyLqx+v0qKf?=
 =?iso-8859-1?Q?sZxQD6CgTJ1ZQqgPVP6LJDqJzka17+Vg09ghP4lMFTLYKVBPukNOKNITpt?=
 =?iso-8859-1?Q?P80e9I+jTQuMZguGrVQja1CLthc7NRC1tm5U8vPglJE7oMzDKNN/MQZi3C?=
 =?iso-8859-1?Q?L5KIbWrzuDzamdjUnoaPwbqkZiltN3IkpQwHmEnEwq+/7jGcz+Xc/PxJsx?=
 =?iso-8859-1?Q?H18FCqY3f1LNd3yjhtZCcDW1MyyEg+piII41qnxSU2dJuReJfpEF/+J0f+?=
 =?iso-8859-1?Q?NQgWRmTJebFAERc7pipNIq3lSnD5d3P95vGP2dLxXjE9E4jCe71RF+ijCt?=
 =?iso-8859-1?Q?qOyy4Uzcbs5UwO8NdgxVPgVeFyBFEPbF6dUGd/29JD6D6HAz9f+iuukCL5?=
 =?iso-8859-1?Q?DRkEvdJwqhfgMTgJf+MbLr5Ie0llCnWc7NvIJwtTng45xcCD5nyzmMzyA3?=
 =?iso-8859-1?Q?WLZ5y6swnDsStoy98N7dx8vAM1Zs9+cbPaGHBbQ5RxuF6LzRrtqyNEYl5M?=
 =?iso-8859-1?Q?ay7sdro4tfOANzw6O6TkF+DfIl65mcA0fQXZ7NdOFJf3OAnZZEtektoQ/J?=
 =?iso-8859-1?Q?akw7iEL6kBGbmompg7/7oLbNkskeXdpgwYwyVaqKb2GhPy0qt23MfXpxY7?=
 =?iso-8859-1?Q?edg3rKKVS2wlee54pARPai1aCrmA8NcWOZwRFqb/8hDVdWTNNTXrwv8yOR?=
 =?iso-8859-1?Q?xpTqWgeMPMPW5QSKOA9yZ+f+pgDH0kzya1NWCTC29UmWXjkkuO0syUuW8k?=
 =?iso-8859-1?Q?ab21sW1611O0daPw5+uuubk2EqJ1IclMK7EDB+Nwocxd+KfOCorrKy0+Pb?=
 =?iso-8859-1?Q?EAShQC0IKM9CqHkh3j9lUj9aluoro+u1dZXrl/G55jKVcLr2WwnUkXPuwi?=
 =?iso-8859-1?Q?0YulerfjGVXi6KgEdAiQQrTFte8lormVhE/OljyzWmSA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?l8tYZjZKdBmlKBRX6gEd2aHWUL3cKKReWhdZlq02SRMyu73MsERe7sKa+A?=
 =?iso-8859-1?Q?5NcSXEnz453ZmUnXxO13FVLTdUBcXf9avsm8SSUkzCPFkgsi0sZIJ2GfEX?=
 =?iso-8859-1?Q?f03WAyPQT9Lqa7GDxxyhNahfrqATLd7tSDh2EkLZnEgMeXoqBIEV6pqUUz?=
 =?iso-8859-1?Q?uq+8Sa6exipMn9u0JyASTSewq3GZagO372r8TyvJsKmKNaX6BjBMjoYC3Q?=
 =?iso-8859-1?Q?txQENefd03V8ab6yotsWwEAjIQRnRsQrMfCTqSgZKrA+MgR8vSR8aOWrcl?=
 =?iso-8859-1?Q?MaPHtcyD+3wCgR+OIpsMy7VExezYpUH/sbCyGYgJI1W5uJZH5buECOVo/e?=
 =?iso-8859-1?Q?s6T+IXFU4T8RvSlnANcg8HyEsK8Ky5w8Tqyjbv6F4Zq5Z2KHydVj8GHF0M?=
 =?iso-8859-1?Q?BVVk/p87eZ2MGYtNSf81Gyw96M0oFoUyXsFhem8VD6+NRTL43GpHmBL1C/?=
 =?iso-8859-1?Q?2TDbsvIub/GswFjFOgM+kjvIFACTq7il091/otMgQ02gJGJg9mLx9EMaq8?=
 =?iso-8859-1?Q?v1XKtMsbCzpCuBh5/Xu7YiyVNmwnm6DTstClHmFl9p0C7hR30KUMohhxHw?=
 =?iso-8859-1?Q?QjJ5TLg8oWS0GqJ4dVLvjyHMwrwU+XfhJmm+MoNB4n6wrgaXhDXIES1/rA?=
 =?iso-8859-1?Q?Am8Gth5tB+6Sq5t5SIpDvsombPitTdSplSHbpJk2uBziAsUJA0qw3QIl9j?=
 =?iso-8859-1?Q?btwjQR+eZNki7cayE1C6fJKKFNhXHOD933CKn/KokDOy+s+Ge92/tLxCDK?=
 =?iso-8859-1?Q?kLCXbWlikLaDyR94rV44+DIpzGo4wP1pRSXSqM+Atg9yxYSpHA/7EEfE0n?=
 =?iso-8859-1?Q?JNSEV6rQ9FtDyeCH1I6R6oZ+MZxBKJWnBOvXV8uGyYH/Rez+oe/JPB8hM/?=
 =?iso-8859-1?Q?2/wtxuvrmixI/O0yA0cCPupwF1MCdPzBpUcpQHW65mof4VdsNqhqYqyUmO?=
 =?iso-8859-1?Q?Gptsv82n+K/jQn3jC9Zg40Lyu66QTDFB7mKVr/EcU7ZfNhljx5oqSZg8gA?=
 =?iso-8859-1?Q?zldXBJxaDk+f9vD0TXcO6LwLDfF0ZoRIaSRdjVa+rMIzRdMKmHNjpL0yjg?=
 =?iso-8859-1?Q?qUvVamb/SsqmsVl2lcIRWBYcB6N//OLihQj1h+Uqxl2Im3E6oe+k1kRb7J?=
 =?iso-8859-1?Q?efb0NyRJ8gsBVxl3RXv0pQm3M0RtIo6TwsJGC0IYt6TMG2h75yWa+5hIsy?=
 =?iso-8859-1?Q?kwsf+P7klYahjUkhM4kAoKxMHdymWt4UxaIcqA0IE1J5GKH44ZM0zhBxPB?=
 =?iso-8859-1?Q?D8YJXFd3EOnEGaIkFdJlqNwWwFqCrWR2c+cRD1i+oT4+VkH9G7eo9PKJ5X?=
 =?iso-8859-1?Q?pHzmudiLRUvJrxBC3kw04XX74BbaIm8Rk/vh7S/wNEqLg2h/viHfEbWnD+?=
 =?iso-8859-1?Q?xbUi9yp383490Ll00dJ+IQMp1IWSMY5fJyu65j4VftAppLsl9ed0GTZJx+?=
 =?iso-8859-1?Q?kkLU2hzhLHi0gGNl4LTn3DIOMhJwT3XGbNlaH18mICJ2e9ZSg3OZBaoB5a?=
 =?iso-8859-1?Q?aSA6SldNKjsYm9xfPo5H9UNXV+TMg6CaDF5UfYqtoFAv9CdN/9i+uHR+Ob?=
 =?iso-8859-1?Q?kaEik3cChDDP95mrq10gSALsTXKVvsMlLuqiJylYYbKQtvtQb5ALxcsfsu?=
 =?iso-8859-1?Q?E+Aj9mXBvVXZtIdCWbIbbOv+1/MkILnKnioxqWrK0lRykbgDP0YHDtnQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a7b23c-1001-4709-3702-08ddea5fc309
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:31:57.0815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETpEsE0ffbHZkvCi41wjvfOu6x7P2LPiqOOjjUd4ifhoUkMALVvptzz9CwhdsCgtV0dJ6euOIzQ39XBP69FY9cRRz87JQy/1iqzLGCY/Zag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10208

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> If we call disable_nonboot_cpus on ARM64 with system_state set
> to SYS_STATE_suspend, the following assertion will be triggered:
>
> ```
> (XEN) [   25.582712] Disabling non-boot CPUs ...
> (XEN) [   25.587032] Assertion '!in_irq() && (local_irq_is_enabled() || n=
um_online_cpus() <=3D 1)' failed at common/xmalloc_tlsf.c:714
> [...]
> (XEN) [   25.975069] Xen call trace:
> (XEN) [   25.978353]    [<00000a000022e098>] xfree+0x130/0x1a4 (PC)
> (XEN) [   25.984314]    [<00000a000022e08c>] xfree+0x124/0x1a4 (LR)
> (XEN) [   25.990276]    [<00000a00002747d4>] release_irq+0xe4/0xe8
> (XEN) [   25.996152]    [<00000a0000278588>] time.c#cpu_time_callback+0x4=
4/0x60
> (XEN) [   26.003150]    [<00000a000021d678>] notifier_call_chain+0x7c/0xa=
0
> (XEN) [   26.009717]    [<00000a00002018e0>] cpu.c#cpu_notifier_call_chai=
n+0x24/0x48
> (XEN) [   26.017148]    [<00000a000020192c>] cpu.c#_take_cpu_down+0x28/0x=
34
> (XEN) [   26.023801]    [<00000a0000201944>] cpu.c#take_cpu_down+0xc/0x18
> (XEN) [   26.030281]    [<00000a0000225c5c>] stop_machine.c#stopmachine_a=
ction+0xbc/0xe4
> (XEN) [   26.038057]    [<00000a00002264bc>] tasklet.c#do_tasklet_work+0x=
b8/0x100
> (XEN) [   26.045229]    [<00000a00002268a4>] do_tasklet+0x68/0xb0
> (XEN) [   26.051018]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x19=
4
> (XEN) [   26.057585]    [<00000a0000277e30>] start_secondary+0x21c/0x220
> (XEN) [   26.063978]    [<00000a0000361258>] 00000a0000361258
> ```
>
> This happens because before invoking take_cpu_down via the stop_machine_r=
un
> function on the target CPU, stop_machine_run requests
> the STOPMACHINE_DISABLE_IRQ state on that CPU. Releasing memory in
> the release_irq function then triggers the assertion:
>
> /*
>  * Heap allocations may need TLB flushes which may require IRQs to be
>  * enabled (except when only 1 PCPU is online).
>  */
>
> This patch adds system state checks to guard calls to request_irq
> and release_irq. These calls are now skipped when system_state is
> SYS_STATE_{resume,suspend}, preventing unsafe operations during
> suspend/resume handling.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in V6:
> - skipping of IRQ release during system suspend is now handled
>   inside release_irq().
> Changes in V4:
>   - removed the prior tasklet-based workaround in favor of a more
>     straightforward and safer solution
>   - reworked the approach by adding explicit system state checks around
>     request_irq and release_irq calls, skips these calls during suspend
>     and resume states to avoid unsafe memory operations when IRQs are
>     disabled
> ---
>  xen/arch/arm/gic.c           |  3 +++
>  xen/arch/arm/irq.c           |  3 +++
>  xen/arch/arm/tee/ffa_notif.c |  2 +-
>  xen/arch/arm/time.c          | 11 +++++++----
>  4 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index a018bd7715..c64481faa7 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -388,6 +388,9 @@ void gic_dump_info(struct vcpu *v)
> =20
>  void init_maintenance_interrupt(void)
>  {
> +    if ( system_state =3D=3D SYS_STATE_resume )
> +        return;
> +
>      request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_interr=
upt,
>                  "irq-maintenance", NULL);
>  }
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 02ca82c089..361496a6d0 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -300,6 +300,9 @@ void release_irq(unsigned int irq, const void *dev_id=
)
>      unsigned long flags;
>      struct irqaction *action, **action_ptr;
> =20
> +    if ( system_state =3D=3D SYS_STATE_suspend )
> +        return;
> +
>      desc =3D irq_to_desc(irq);
> =20
>      spin_lock_irqsave(&desc->lock,flags);
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 86bef6b3b2..4835e25619 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -363,7 +363,7 @@ void ffa_notif_init_interrupt(void)
>  {
>      int ret;
> =20
> -    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI && system_state =
!=3D SYS_STATE_resume )
>      {
>          /*
>           * An error here is unlikely since the primary CPU has already
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index ad984fdfdd..8267fa5191 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -320,10 +320,13 @@ void init_timer_interrupt(void)
>      WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
>      disable_physical_timers();
> =20
> -    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
> -                "hyptimer", NULL);
> -    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
> -                   "virtimer", NULL);
> +    if ( system_state !=3D SYS_STATE_resume )
> +    {
> +        request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
> +                    "hyptimer", NULL);
> +        request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
> +                    "virtimer", NULL);
> +    }
> =20
>      check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
>      check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");

--=20
WBR, Volodymyr=

