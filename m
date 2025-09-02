Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E2B40EC9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107489.1457900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXvX-0001Vn-OO; Tue, 02 Sep 2025 20:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107489.1457900; Tue, 02 Sep 2025 20:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utXvX-0001UE-Kk; Tue, 02 Sep 2025 20:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1107489;
 Tue, 02 Sep 2025 20:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdbA=3N=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utXvV-0000zx-QN
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:48:25 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af2ae60-883e-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 22:48:24 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9666.eurprd03.prod.outlook.com
 (2603:10a6:102:2e9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 20:48:21 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:48:21 +0000
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
X-Inumbo-ID: 2af2ae60-883e-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHQoCCogiUznew1yIX/8/Y1mK6nF3+kvmMbhetIeieWsjWr5qpb+YJ+RIo7ocdhLlE3yqwDiHCKEkBf5zL8oLBFy7SomlR5NXJCq9X+jsYEWqV//Gp8pOeQr4LlK/OtmqOwjquohQthB8b1N/KcioLyfzJnA7BPzyfsVOl9WplD4BUUwBJWhiXJfw+9e4EzrRw0Wny2VujRhiRQenY6TAWUIWZ0y7Z+zQfOY43MxTvIiXJm19yqigKCsWwNYtVuMYpk7B5tXwsancBJjLDVEN/bGwo3gi28z/soEcM9KmqwRBbJQq2RZITv4mbr5Gk7UlhiGXOaUzX0XSMpPAnkoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqqRyw0Mk2IQZN5rPaDBbkHYOk7OT9L56hUetDGQ9b8=;
 b=il/Wa2RDdqoJqjnq8Wux7Me4sYXadsdvGcNGZCcKuj6MP89M5Dg5g0DAnM0PmoKQ4qsaWHXIALlywHDZUMhrJ52MM3W0q/lv6qAn3Hy3td+9m4Dj9zzbW6jLSWRimtMeEss/QziRGRkfjnDFYWuzOIPO+ugoXdBhFevLRGL8F9ZEouNu67CFSS2+C7OjqdWbIyvlGPj7TFkJz9UyU9vWdDQBE89P5/vhmWqUJMnqagYZyarbq/2kpmEe0qALar2TZAzUCRpRcGBM7ctBcKi54WEobLAgJpl/VG6gB2BI0OPdIgfjoftg9lUhIq0cp66dN/u+MfUaCrl7VT5awCLbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqqRyw0Mk2IQZN5rPaDBbkHYOk7OT9L56hUetDGQ9b8=;
 b=Y8HPqid6xnA6kro7a6EORjemrrRzjg/PzXSxSfCQODAL7kFEGqr3cCZ7OqvB27LUKba4WFZYtkQ2iAz1yaa7L4qzAmhP2h8GsXwwn0jPWwwLLU1I2DLnUX/eqSbigZWg38Wmg+TmsgBN4e0EEG5JBfVFCn6cHBdiEtd4NIj9cZIjosYRWqebJS3idKs6nlfrbBm+PspAmbQp5bv3CGQPvGs82XQXVxP0hp9quFcoMXeJjKrKxMNOIHszpyYNSvX5UA+jYi72NGLjdrcJ+u1+wUDUl4N2/LkjWl9N/mgjlyJsaM2HC6+o4OLHLo+8quMbc3pN46fPUFhMD5uaLGRJ8g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v6 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Thread-Topic: [PATCH v6 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Thread-Index: AQHcG405yzu82Zbgnk2mcrS8YfaGcg==
Date: Tue, 2 Sep 2025 20:48:21 +0000
Message-ID: <87qzwovawb.fsf@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com> (Mykola Kvach's
	message of "Tue, 2 Sep 2025 01:10:04 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9666:EE_
x-ms-office365-filtering-correlation-id: b3352e95-c069-4577-ca65-08ddea620dc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sBGb1Z0UAIHi00OvS3QGUW+Q5K89JYCL9SD7N94G6jDV1atCOFgt71roFL?=
 =?iso-8859-1?Q?VCDLE/iFjG3EejZd+HJ64B81unT/bvmBXH6nA02cBaeXtxlUNfCHWGuHvT?=
 =?iso-8859-1?Q?zQpwuyQVulh7ADsNpkbwesNDK/TpYkyLt4Bg+JEDcbHdcHb25vQcBxgHZH?=
 =?iso-8859-1?Q?GVH3NyBdMrf1PZknbr9EAlX6fWErFtTKJ1wzBrQTvAOsMeTojTjU/mrwJA?=
 =?iso-8859-1?Q?WhyYSgTkc/HsrdfbsiZGjmLUdKlecRAXxyUrR/mqO1XgsXPrfWzvYyY4Mh?=
 =?iso-8859-1?Q?k+evri+Xm1L9LqpK6xCXd5J1CjMOANF4d6E5HGY/l9fF0gmy8AxxEYPoZc?=
 =?iso-8859-1?Q?lx3NmpmIO7MgMywNj6moRDHMrZj72tRcRd84sQh3gyYHbDIQD9MyNC/Mug?=
 =?iso-8859-1?Q?v0RstQH/mpIfpl7H6pPpK1mXX1mXHtRx2TQPlT4vTURlpo6XiT/HoC2rSH?=
 =?iso-8859-1?Q?AaEMh9DRgTvo9o2cuWZp0t/Loo3CkgyJc2O3U4fSVX3NMhwznr9oHea5Co?=
 =?iso-8859-1?Q?Ygpd7PCjs9L6IWQfpLSq/dB13VhnzgFWqdkn7oNMgHm5VZGYSeXtWt2iBe?=
 =?iso-8859-1?Q?ZGCEm8BOAargOCxR8lr7eLclJaa4LnXoIOvbMGxVT6/AZPAFCrNaa2Whqi?=
 =?iso-8859-1?Q?qCX8ZHkT/M/aGo3za0+qEa6jv0uOjx8Z0o2cHVaSD1ff+CbGAgSWBFWuiy?=
 =?iso-8859-1?Q?qIdXkEZsWBMBC5NDVcxz9OTU6Y9M7TCoEqaQvwHGSDJAg1bmuLAVBCcOCw?=
 =?iso-8859-1?Q?vJBFa7V9CcSxSYk/UtC54nkf4uD/Lolya3vzSVm6p9eWih81wvNp0iW+Za?=
 =?iso-8859-1?Q?+F0RgESdT/Lxni2V4ihF1423Qo5gExh6Bo7cNZMu8Rjl1+5dapqHws8LMn?=
 =?iso-8859-1?Q?2lR62BECHsBI/Mz7yZgyAZm6w1/khntQnZvmz9uOU/RXNy1JurBuQZlUhG?=
 =?iso-8859-1?Q?rD/FQK+09kBH4vE5DyaAlbtaZE+5iIrOidRC0JPXxb0DPV+SeClgaX2zvr?=
 =?iso-8859-1?Q?//0QAAf6IH+CEMkivp8C5RdF+/ysEM0SmvEE7KRZBDvI96jevI+9WQ5KYi?=
 =?iso-8859-1?Q?iUyEmtR1CPB7NiZ66nD7sTYXPhAoH/R3PIdLhqeUJHVQPyUJp6JJYryKuu?=
 =?iso-8859-1?Q?ZoOlIs4KtOq3vnpxz4Zv0o3d1ccix8StCA/36hmjOl3IMRn8siVDopzSNs?=
 =?iso-8859-1?Q?GNu3mqSClNUo+YqwORlasuaIfcPG7sSqti7X2fo8MyXH+zgfeGsfgawz4Q?=
 =?iso-8859-1?Q?CSx9Q35gVQPk3QwOs7sJngR/exd2S3ps7yblw5gEc8GVJdwAWr5GN4mo5a?=
 =?iso-8859-1?Q?jebRIFAXSZbvHlOVYcN45MR8kk/16yirQ1zXpN8JtaU+GK6TR3MmVt6iXh?=
 =?iso-8859-1?Q?ZDY+ttloagnvv2A8Zgf/OqwnqnS/+XI+FVyGVvMtiOG5RRnDbw1dodLv1b?=
 =?iso-8859-1?Q?O1DFn+kFvRS5aOy6cnVMLXC2xuwu4FyRqBTJ/5DkrwbAyA91QDTPXjGoS/?=
 =?iso-8859-1?Q?Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IdgfL7XISriIuqOq52ajG18x+oaMrUWm7t4m82das67EKX6HWFcoUovDGW?=
 =?iso-8859-1?Q?eqv0G3ql7g4dWrAQUeuaxdnIrbr7dxYjKnDu1W9/x6A3686ii2dl1TgB6q?=
 =?iso-8859-1?Q?AiiPXg186khFbKITdXUM9BQDmAg5/4VJ496/yK1OgAJp7+7q8Y1x1TPgTc?=
 =?iso-8859-1?Q?RtzFmt5hr6xT4CT9HN3UyXsTohqizsy+1HTAWpaNzqPhq2YhfnyYpTmFGR?=
 =?iso-8859-1?Q?84ignLnFvpfUi55FBUCPZ/3gnHDz0R2v2UJU+qvfN8kENitlihpkhaZmFR?=
 =?iso-8859-1?Q?+6Zm85SAxTb1D4uO9R0a/FJ2mM0rZLEYzqeRPgIifANURdUKQJ0KQJb9o0?=
 =?iso-8859-1?Q?ry5F9L0lRCT8ylXnnzgcvCwqIXHmeW29+GhPCDT+TxrrwLyaDgtOYVdzkY?=
 =?iso-8859-1?Q?9UHmxUpMMaa7nMfsf3ixOZlcskcCr1UYJgQ2b0oUS0wdaP2vQbqC/Y6FUA?=
 =?iso-8859-1?Q?WtGTg5v1PMBrxqkpsyXNLUAWYV9v1hzzKNsKbAV5zfn6bvyP9tqTwkRc0F?=
 =?iso-8859-1?Q?M8fEHFW1flrrNr8nnlnRYv2gtuEueg6RJfWL2bhgriCjqb9aQHkv/QOaKp?=
 =?iso-8859-1?Q?h/h04WX8inQkLuhXjfhVQQWhXS2m0p0gioZLFbHXQH3xeTUPIPeetHPckR?=
 =?iso-8859-1?Q?ZpoISY06MYX6ROWLlZjlmA/EhaoyPDcNvM6yRUBc4T8E09C7qeo8oYUpX9?=
 =?iso-8859-1?Q?vWD7O8Jbt6ozMwpfL/6ZHyQAimVDsR5YbUFkcmFc+uHuUuwhgQGYaE2/1d?=
 =?iso-8859-1?Q?jlGlMJeoY0o3FtG+/DZJxwXDd7zqduMsO3a1O+tECEm6MLegvIB4ozQl5v?=
 =?iso-8859-1?Q?I+nCIGjXL80NegMgUiVaMN1qlg1SC+o1u8elDP9s3rYH31vG/WugdEy8GA?=
 =?iso-8859-1?Q?Imbx5gILCqPA2yj8s9o2RxNW1C4bfRdgIqiyI4WqyiroDM954EqxsajYrQ?=
 =?iso-8859-1?Q?8WvZgDAXVeRT2fc5GvYm8Xt1hyKJw+wxmLdGpaIkWKNxwcmWjToG5mc6HK?=
 =?iso-8859-1?Q?kR/qmT/z/lusYKm1t5zQZqLi6Kc2z+vGzyQDnhcJJVCEqdeys+CwOWce38?=
 =?iso-8859-1?Q?HcY2/BZ6HLMWyOIL6b9eAJ1tOZAGnlmKMb8anXRipUbAQ4ZHSYUF5dIgpr?=
 =?iso-8859-1?Q?yNboTXmrnfu15OAqEgZWsnfpQRvaNV9xbh6xohB+9lMEw5TCm02T5xUzyB?=
 =?iso-8859-1?Q?Ttf/cXBMvTDyhzXC+mvuqp6L96rmCUqyOpjXCsfosB3A1U/dm+Et7Oj/Mx?=
 =?iso-8859-1?Q?94MQo48bJusItOhicxGJXfd+H8sT8rwX7cMbyv6Y0OmdNe+AeGJxnp9kp/?=
 =?iso-8859-1?Q?L/sjLjr2fhTCblal7I728RWavbxr3BpHp7MVe4DMfZTgQ+0lbAj3k70wzF?=
 =?iso-8859-1?Q?1l1ed6XGup2FF0I+KmmjxtHQdjuzOPel9ttIvRHvQoLj5gtCQIkWVI+0S8?=
 =?iso-8859-1?Q?yaeWDC9TBQ+UIrMs9YllsUqphRND3+omXwuY1yaCvodX4zdqDVGsniN3Hd?=
 =?iso-8859-1?Q?J8H8DzGhiJy6gG9+iC7HUNv1nZJqoJlq5mcPE3KLmQ4NiHeLgCJdxNP0IP?=
 =?iso-8859-1?Q?4PrgFbnq7lusmKhvxWnp3Myk7TAS8p1X3gtyMwB+SaGRjcacOo6pb5ntTL?=
 =?iso-8859-1?Q?8h/Tdgjyd5pIan2lpvKqytvHlyXsxR3TL2Yqs/X+KgYM4JnDns/0waIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3352e95-c069-4577-ca65-08ddea620dc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:48:21.4450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e379bXLMHeXXvShhbQ9v7sxmP8e1C2OPfLOV/weR50HHXpe+hUBFg5Stt6t0JhYRQCKINQ6ZEudkjgp26KT1iw4u8Jn1G/W1cM66icXJTyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9666


Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> This is part 2 of version 5 of the ARM Xen system suspend/resume patch
> series, based on earlier work by Mirela Simonovic and Mykyta Poturai.
>
> The first part is here:
> https://marc.info/?l=3Dxen-devel&m=3D175659181415965&w=3D2
>
> This version is ported to Xen master (4.21-unstable) and includes
> extensive improvements based on reviewer feedback. The patch series
> restructures code to improve robustness, maintainability, and implements
> system Suspend-to-RAM support on ARM64 hardware domains.
>
> At a high-level, this patch series provides:
>  - Support for Host system suspend/resume via PSCI SYSTEM_SUSPEND
> (ARM64)

I am wondering if you had to split this into 3 patches. Looks like patches
8 and 9 are useless without patch 10. They just add bunch of dead
code. Maybe it is better to squash them into one patch? I may be wrong
here, so maybe other reviewers/maintainers will correct me.


>  - Suspend/resume infrastructure for CPU context, timers, GICv2/GICv3 and=
 IPMMU-VMSA
>  - Proper error propagation and recovery throughout the suspend/resume fl=
ow
>
> Key updates in this series:
>  - Introduced architecture-specific suspend/resume infrastructure (new `s=
uspend.c`, `suspend.h`, low-level context save/restore in `head.S`)
>  - Integrated GICv2/GICv3 suspend and resume, including memory-backed con=
text save/restore with error handling
>  - Added time and IRQ suspend/resume hooks, ensuring correct timer/interr=
upt state across suspend cycles
>  - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
>  - Improved state management and recovery in error cases during suspend/r=
esume
>  - Added support for IPMMU-VMSA context save/restore
>  - Added support for GICv3 eSPI registers context save/restore
>
> ---
> TODOs:
>  - Test system suspend with llc_coloring_enabled set and verify functiona=
lity
>  - Implement SMMUv3 suspend/resume handlers
>  - Enable "xl suspend" support on ARM
>  - Properly disable Xen timer watchdog from relevant services (only init.=
d left)
>  - Add suspend/resume CI test for ARM (QEMU if feasible)
>  - Investigate feasibility and need for implementing system suspend on AR=
M32
> ---
>
> Changelog for v6:
>  - Add suspend/resume support for GICv3 eSPI registers (to be applied aft=
er the
>    main eSPI series).
>  - Drop redundant iommu_enabled check from host system suspend.
>  - Switch from continue_hypercall_on_cpu to a dedicated tasklet for syste=
m
>    suspend, avoiding user register modification and decoupling guest/syst=
em
>    suspend status.
>  - Refactor IOMMU register context code.
>  - Improve IRQ handling: call handler->disable(), move system state check=
s, and
>    skip IRQ release during suspend inside release_irq().
>  - Remove redundant GICv3 save/restore state logic now handled during vCP=
U
>    context switch.
>  - Clarify and unify error/warning messages, comments, and documentation.
>  - Correct loops for saving/restoring priorities and merge loops where po=
ssible.
>  - Add explicit error for unimplemented ITS suspend support.
>  - Add missing GICD_CTLR_DS bit definition and clarify GICR_WAKER comment=
s.
>  - Cleanup active and enable registers before restoring.
>  - Minor comment improvements and code cleanups.
>
> Changes introduced in V5:
>  - Add support for IPMMU-VMSA context save/restore
>  - Add support for GICv3 context save/restore
>  - Select HAS_SYSTEM_SUSPEND in ARM_64 instead of ARM
>  - Check llc_coloring_enabled instead of LLC_COLORING during the selectio=
n
>    of HAS_SYSTEM_SUSPEND config
>  - Call host_system_suspend from guest PSCI system suspend instead of
>    arch_domain_shutdown, reducing the complexity of the new code
>
> Changes introduced in V4:
>  - Remove the prior tasklet-based workaround in favor of a more
>    straightforward and safer solution.
>  - Rework the approach by adding explicit system state checks around
>    request_irq and release_irq calls; skip these calls during suspend
>    and resume states to avoid unsafe memory operations when IRQs are
>    disabled.
>  - Prevent reinitialization of local IRQ descriptors on system resume.
>  - Restore the state of local IRQs during system resume for secondary CPU=
s.
>  - Drop code for saving and restoring VCPU context (see part 1 of the pat=
ch
>    series for details).
>  - Remove IOMMU suspend and resume calls until these features are impleme=
nted.
>  - Move system suspend logic to arch_domain_shutdown, invoked from
>    domain_shutdown.
>  - Add console_end_sync to the resume path after system suspend.
>  - Drop unnecessary DAIF masking; interrupts are already masked on resume=
.
>  - Remove leftover TLB flush instructions; flushing is handled in enable_=
mmu.
>  - Avoid setting x19 in hyp_resume as it is not required.
>  - Replace prepare_secondary_mm with set_init_ttbr, and call it from syst=
em_suspend.
>  - Produce a build-time error for ARM32 when CONFIG_SYSTEM_SUSPEND is ena=
bled.
>  - Use register_t instead of uint64_t in the cpu_context structure.
>  - Apply minor fixes such as renaming functions, updating comments, and
>    modifying commit messages to accurately reflect the changes introduced
>    by this patch series.
>
> For earlier changelogs, please refer to the previous cover letters.
>
> Previous versions:
>   V1: https://marc.info/?l=3Dxen-devel&m=3D154202231501850&w=3D2
>   V2: https://marc.info/?l=3Dxen-devel&m=3D166514782207736&w=3D2
>   V3: https://lists.xen.org/archives/html/xen-devel/2025-03/msg00168.html
>
> Mirela Simonovic (6):
>   xen/arm: Add suspend and resume timer helpers
>   xen/arm: gic-v2: Implement GIC suspend/resume functions
>   xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
>   xen/arm: Resume memory management on Xen resume
>   xen/arm: Save/restore context on suspend/resume
>   xen/arm: Add support for system suspend triggered by hardware domain
>
> Mykola Kvach (5):
>   xen/arm: gic-v3: Implement GICv3 suspend/resume functions
>   xen/arm: Don't release IRQs on suspend
>   xen/arm: irq: avoid local IRQ descriptors reinit on system resume
>   xen/arm: irq: Restore state of local IRQs during system resume
>   xen/arm: gic-v3: Add suspend/resume support for eSPI registers
>
> Oleksandr Tyshchenko (2):
>   iommu/ipmmu-vmsa: Implement suspend/resume callbacks
>   xen/arm: Suspend/resume IOMMU on Xen suspend/resume
>
>  xen/arch/arm/Kconfig                     |   1 +
>  xen/arch/arm/Makefile                    |   1 +
>  xen/arch/arm/arm64/head.S                | 112 +++++++++
>  xen/arch/arm/gic-v2.c                    | 143 +++++++++++
>  xen/arch/arm/gic-v3-lpi.c                |   3 +
>  xen/arch/arm/gic-v3.c                    | 288 +++++++++++++++++++++++
>  xen/arch/arm/gic.c                       |  32 +++
>  xen/arch/arm/include/asm/gic.h           |  12 +
>  xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
>  xen/arch/arm/include/asm/mm.h            |   2 +
>  xen/arch/arm/include/asm/psci.h          |   1 +
>  xen/arch/arm/include/asm/suspend.h       |  46 ++++
>  xen/arch/arm/include/asm/time.h          |   5 +
>  xen/arch/arm/irq.c                       |  46 ++++
>  xen/arch/arm/mmu/smpboot.c               |   2 +-
>  xen/arch/arm/psci.c                      |  23 +-
>  xen/arch/arm/suspend.c                   | 175 ++++++++++++++
>  xen/arch/arm/tee/ffa_notif.c             |   2 +-
>  xen/arch/arm/time.c                      |  49 +++-
>  xen/arch/arm/vpsci.c                     |   9 +-
>  xen/common/domain.c                      |   4 +
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 257 ++++++++++++++++++++
>  xen/drivers/passthrough/arm/smmu-v3.c    |  10 +
>  xen/drivers/passthrough/arm/smmu.c       |  10 +
>  24 files changed, 1220 insertions(+), 14 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/suspend.h
>  create mode 100644 xen/arch/arm/suspend.c

--=20
WBR, Volodymyr=

