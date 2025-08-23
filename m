Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61474B325F2
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090788.1447890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcFe-0000QY-8P; Sat, 23 Aug 2025 00:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090788.1447890; Sat, 23 Aug 2025 00:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcFe-0000P4-5J; Sat, 23 Aug 2025 00:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1090788;
 Sat, 23 Aug 2025 00:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upcFc-0000Oy-IN
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:36:56 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44a27fe4-7fb9-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:36:54 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB8011.eurprd03.prod.outlook.com
 (2603:10a6:20b:43e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sat, 23 Aug
 2025 00:36:52 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 00:36:52 +0000
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
X-Inumbo-ID: 44a27fe4-7fb9-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3vLtHpM3Flzry/4+33du2B2EzxDC4fyu/P/uKcjabrXKETVW9pdXwNjmB4W/d8m47vTHXxElUzGkx0Aqtw8afxfZKc/d/mtjxIdsRdYqWWlR1GbdcdBC+Zkgo09RVAS0GPc71nE1FDt9hBeaYyuW9HGP+NaJr8eTk6kwJmJfBY/gM1+A3zI3q4Oar/nmBut0LGNVOrbd7H8SFJquDRHIPELr0xFIRoIZz9vijaXw+p2PpHGbXBWaoKWKX5BAQjYFXsNyOplcg3W6mco9iWKgvayddRqhmIiut5a1SdU40UbtojX7dg3N0O8pcn6NYHDjd5ctUi1+UhRpY8R6ICFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzOYsrfC8+EllYNwzzxcH1YW8G0O1MA7x46OJNns/no=;
 b=gm+9BVnHgNd32rjVSzuy3mh/KnAJBrME2ZYwzsQ/OTsRTcTSBXqFsmdMfLo5y7ai7dW2PpCEOw3Ns870TakU1Ufo9k4mGAb37fSydwYDGKpRvu1mYtnIisi+K0dsewsqXKfcr89tG2tfVOsC627GqG3fKyYU5/ZaHoTi2psWQw9T0KUO6q/riw3VstVAQizn77EPvKoen/UYc2qIo3RQblh6frbCpUzjlBJp5Ql04NmFJb8fR7R3VyKLrSetkizfSlKA19HE73CaopxX7Mee0WTy1UTeMDOEWzDgaX1F9MFhSxou2d+xurLvh/KVPfnfqwPwrn+HvYGqUW+kJnzSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzOYsrfC8+EllYNwzzxcH1YW8G0O1MA7x46OJNns/no=;
 b=l3t2NhYB+n4cqZKy63MwgZYrjbO2TRwEsO5YVRwUYQG5JfRhdFzOGLfEYGZMvSu5i3SbCznXJmmTIvJX+UeFJorkLHarQN2x4IohzZceFGNhfQd/fBrEeMtToXas1IVWKaHN9oZWHPS0BHc3CM10LSP7GDdtkLkPtfNRXr8KeGA7M57cDJsc9h9c+Fwt7hwzLTlHb7bKB4sX5eGZGTsHNdfIXS0l1w8jO3QsajlIXFixjkb15tnLxutIa0m6X5UnJInhXaQSzFFJexGb4zkPaU8/q1jaAffBGOuU4db0IvP1vkPH/sY4izwrPbR81Og1UuWXD1D0KTc1ux5BZqkgag==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 04/12] xen/arm: Prevent crash during
 disable_nonboot_cpus on suspend
Thread-Topic: [PATCH v5 04/12] xen/arm: Prevent crash during
 disable_nonboot_cpus on suspend
Thread-Index: AQHcCwFbWICkeXmBzU6Bv3/6IpnNyw==
Date: Sat, 23 Aug 2025 00:36:52 +0000
Message-ID: <87qzx2an6k.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<98957da5c5068ae8340a21a9aa15a962905a8a22.1754943874.git.mykola_kvach@epam.com>
In-Reply-To:
 <98957da5c5068ae8340a21a9aa15a962905a8a22.1754943874.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:00 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB8011:EE_
x-ms-office365-filtering-correlation-id: 8a39ed81-67ae-4399-50a1-08dde1dd277a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AErdYK/K/Ql28pbKlfjs6/VFjePjfvZG2VngZQQk4W7boG3TYgNNW8MBZL?=
 =?iso-8859-1?Q?szC1Lq6AKPFakru/43SZQozQsVydGCIM1di9zllNflxXtE/7FE8irEQU7m?=
 =?iso-8859-1?Q?CplWPqVBGHd1g1spHN+TfFhkwNLL6KAUNOBgNdPyiQGixvtI5xJgtS/ORA?=
 =?iso-8859-1?Q?r8vFvwISems3aKlVjeMlJvJUxUTG0PeH6uBm52ZvKjToNEc28neXGohR0y?=
 =?iso-8859-1?Q?o/+h0kYnv8/m01YpjpLHYcMfawYFaetfn2P3Kx/0F0Ucdo72NS5+G48IwP?=
 =?iso-8859-1?Q?gWACyaa4HcFpYM3Hfqib036F8jbaMnn3ClghFi8qL4r+wYchLC0IRfXpn5?=
 =?iso-8859-1?Q?j+DKUvkGmS1JZz+2njU1VRegiJxumlbZoz3RoYEcWYl2L+MKHj8bmeEX4Z?=
 =?iso-8859-1?Q?T2AUsp1Gc/LKHj67ffxUr6MZ8etkb+OR99zGxuBATYMTs6uhkFcXICBaF0?=
 =?iso-8859-1?Q?QhVglw2O8BpE8x2T8SkqogM5mWRUfDUmxCVOvzp6on+ljn6KtbQT4maOem?=
 =?iso-8859-1?Q?lqE3kq+8ccIWVTY75sWwaEbrS6NwnB6DNUOTT81Qf/7eEACy5vh7ikbn1B?=
 =?iso-8859-1?Q?i+7GAgIAdZMleAH5DutpBniM+8M3DyWKgGYA6rLXc2RKh+hgPVd4nn0bqS?=
 =?iso-8859-1?Q?H7irKJIifksxQzoaZzVrf1J48fqzMHOuxkqaeqINwEAGL/rlpwHyTynHGD?=
 =?iso-8859-1?Q?An3OLjJcHnWFoFweP9GlMDijis0gi07kvAmDU+Qf88ADVQKQJKp2Veax1+?=
 =?iso-8859-1?Q?BImkStAinvCd/NmfWjmaXzEE0GuRRwlU05eRTnEJ6xIPN0hH/wiFGsQvdM?=
 =?iso-8859-1?Q?wFVkypz+OnSyTFuaAsmqGYdLSeTtZZFTKgXO9J/SbxyKHZxltZOUFfcIcs?=
 =?iso-8859-1?Q?qaIIFUgFEkEWIDmbyrsIFJJVo1W5IT77FcrFBmgiYd83ZIAJctJoWWdatW?=
 =?iso-8859-1?Q?IfnXLmruxmyubTWcOUz5O4RaHiQvgvoB3a4Viwl4X2QSfyIoLNBg4+LDHJ?=
 =?iso-8859-1?Q?ilSvjDxBfZuGJBXA/YoB2rfQcCXM1RbZdcVLBb8SGO8V/qaOnkV0/kvDpC?=
 =?iso-8859-1?Q?uNJqvaOZAHVlQ7nflhFfTW41qsylMEhcXBXUrqmUQk6o6djZy0ir/BAZq+?=
 =?iso-8859-1?Q?uJko8QNLXskISvoN6TzDgvhYNcXoiR5cof+BN0/SdOiHp6VQXRz4FgfdMN?=
 =?iso-8859-1?Q?2RnpSpIjPt+9wxufKt7YGusIo0u6hf5Ntkwr9OLlqjin+haciJOIcL8F4+?=
 =?iso-8859-1?Q?N98RBFmTon6Auqahm9De8f21EM+VWEkTvtwAi51RHAaR/FfOX7cGtE6qxY?=
 =?iso-8859-1?Q?gkTf8mfiOMsm4b4DYbMlj7x8zjRGHRWPtBY4B7zLU3H/2DSzG89ch/e2rp?=
 =?iso-8859-1?Q?xUKYXKdWHMmjltIRl+xjJsVyKgB6P/rrmlW5LP4PviElw5ZilLeNurnzY1?=
 =?iso-8859-1?Q?xIIYuK4AMv1HHSzmJ68XHluws+W3YO9akyzL3yUVCcT/AXBwNTyWOWxiz4?=
 =?iso-8859-1?Q?80qqcR1AlfrvXxApv/Q8N8dEmdA9aBHzg8cU6MIoJ9HfnILM5VQXmjPWbt?=
 =?iso-8859-1?Q?5a8Rbms=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?idyyaZNLjg4sf6yvQ+3ZDtIQIoP4E34Of0SNJTXKBlj7OgIVQ+wG+vUZpj?=
 =?iso-8859-1?Q?oKhUwsB8yZWFEhuER0wt/rLpjjLVYWmuskhD/Ccr6cWDf1lGxK3tcB0pw5?=
 =?iso-8859-1?Q?K6qRCmQux2Zqdw7OAjPfcSwNm75iGWZXLYNgWcsKGhf2/2Caip/S7XylW5?=
 =?iso-8859-1?Q?hp7BiFuP55VMwD6MIObOmpwkbK3l/XJ8gXszliVPpZAEgyCqBwo6rSGmBa?=
 =?iso-8859-1?Q?wAe9wxXKqXXRFa4M+8IC5CSMuE5lqohiiwJ6ZPToNN4sdA2oFZWHCpMAp2?=
 =?iso-8859-1?Q?8I4biOFKNbJ6qex2irBezjO5rHB9qwfhqQ0uvC+3tsb9tkQp5CNLHfOyW9?=
 =?iso-8859-1?Q?gJgyzEfK86nU9TYpOqFZg+tD7HlO/3sADVGZDFartX29bK7f6tF04G/VL/?=
 =?iso-8859-1?Q?XwwoHPGMmmJy+oyoyj17wsk0y9i7l0hyJMauOKco2eJBoyRAAhoL4KPsSM?=
 =?iso-8859-1?Q?XO991k7ZKWueZvNGhP4wxJLekYRHs9U81B5ut/wcJwqAnE4wIO3770tPUm?=
 =?iso-8859-1?Q?Nibo1Iy4C/YtgO/Rm47rHFRyKTsI7Sqy8VEFAN3JpkphcwxjfnbSrriNwB?=
 =?iso-8859-1?Q?mqNhLOp+bM+Gh9EfrGekgDxS9xlKdvq9rpbWWtaS6tNIxlfvIK0lAhH/cJ?=
 =?iso-8859-1?Q?IdmWNAG2H7DRblXL5kcQEkgZ3GzXWZr5Ua+dSqGeT4WXdyX9JxlsQLrRck?=
 =?iso-8859-1?Q?ezmU4XEmj6J5d2Uu1p8eeM49IweoFgbUTN47/i6PtcbCa102QQGhHVR3tn?=
 =?iso-8859-1?Q?scb0oXoIfxJUmt7B06fcH7EXviLngU64gVQ4YwCpmZUVrrZNkfjWKt76tR?=
 =?iso-8859-1?Q?JLidhbl3MMbIbXcdS/kOi/Nh9E9FeDkMI7ygwHYevarcgH785KDm/g5yEu?=
 =?iso-8859-1?Q?l4nAOH6BQN5hcfJZMG6EUNoJq1CnkNPp9tTVWMUFNPuQ6suK4dBzDDYhxN?=
 =?iso-8859-1?Q?qGzuVKdCMSak+bIryTB2jx6jJkblxwlGb2rfzwn/sBj+X/zlmHRmfaHVr4?=
 =?iso-8859-1?Q?GP3bJI7InQkkdtBaSvNrjocqdImH/6vQ31zRiO/iaZAyXLRDUIB4rav9QY?=
 =?iso-8859-1?Q?XLeML0hlRZezidSVvFJWmAtVlsmIxgqLzLwP60R6Cbxg3YTt+E6aaU20aS?=
 =?iso-8859-1?Q?uVXEvlfaI06wHUxb4NeZfeDeMFpSqC4pslxc5TopWOzoBZa3PqNnNZkEY+?=
 =?iso-8859-1?Q?uEFhww1D0AqpFsDl7H1w8moduG+FLwY+QVENek2AveR+TDh1Yy4fTzlAnR?=
 =?iso-8859-1?Q?6KiStC4mHk2qmRhqF34YpFOaH4Tg2j+klcm30K8RcqpbSKq4E9ti3AJJJ7?=
 =?iso-8859-1?Q?RDJPXbv3tTQhnWBKpmcOIyxJhcYnlxBWS7gaXlEPbb3XbVC95kfH0y+myf?=
 =?iso-8859-1?Q?s1HsV5kmiFILgiRs6G16/1XFTA5gSNe9FoT2EKJLp2/OAN7RdsxOI5h+t1?=
 =?iso-8859-1?Q?9MKh+TsZBeReJboCL6thPEYBpxmUwU7GNDeqV6+AiMPUi5HG3p7jNDTEih?=
 =?iso-8859-1?Q?rrFzmydhWcREz54KpaWX2UhQ5/U91aq26BfX7OQikDTt5M5QxfJV+ylZqy?=
 =?iso-8859-1?Q?zJM491GAm6CifI19xxl9/2nKwgfXMQnBbkZhXHSJoNNfwPzI1Kw8c9YWO4?=
 =?iso-8859-1?Q?Ua2mKSBO/jVL3ZY/COjZuTPam5P7TTnoA8fOa+0eo1ErZQkor/ovkLjA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a39ed81-67ae-4399-50a1-08dde1dd277a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 00:36:52.2520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpTodp4sblzGlR4FXEN/PuZDY+6QE8ZlnXRi8/wkodWuRBv2DgWJaoSYdIjimTWfpeA5kp1DwMZcvEhliN/Z/u4Yi/ocFlrbVQHQCR1NA0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8011


Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

While I approve the change, the commit message is somewhat
unclear. Maybe "Don't release IRQs on suspend" will be better?

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

If any call to release_irq() during suspend will trigger ASSERT, and it
is fine to leave IRQs as is during suspend, maybe it will be easier to
put

+        if ( system_state =3D=3D SYS_STATE_suspend )
+            return;

straight into release_irq() code? This will be easier than playing
whack-a-mole when some other patch will add another release_irq() call
somewhere.


>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V4:
>   - removed the prior tasklet-based workaround in favor of a more
>     straightforward and safer solution
>   - reworked the approach by adding explicit system state checks around
>     request_irq and release_irq calls, skips these calls during suspend
>     and resume states to avoid unsafe memory operations when IRQs are
>     disabled
> ---
>  xen/arch/arm/gic.c           |  6 ++++++
>  xen/arch/arm/tee/ffa_notif.c |  2 +-
>  xen/arch/arm/time.c          | 18 ++++++++++++------
>  3 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index a018bd7715..9856cb1592 100644
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
> @@ -461,6 +464,9 @@ static int cpu_gic_callback(struct notifier_block *nf=
b,
>      switch ( action )
>      {
>      case CPU_DYING:
> +        if ( system_state =3D=3D SYS_STATE_suspend )
> +            break;
> +
>          /* This is reverting the work done in init_maintenance_interrupt=
 */
>          release_irq(gic_hw_ops->info->maintenance_irq, NULL);
>          break;
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 00efaf8f73..06f715a82b 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -347,7 +347,7 @@ void ffa_notif_init_interrupt(void)
>  {
>      int ret;
> =20
> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI && system_state !=
=3D SYS_STATE_resume )
>      {
>          /*
>           * An error here is unlikely since the primary CPU has already
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index ad984fdfdd..b2e07ade43 100644
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
> @@ -338,8 +341,11 @@ static void deinit_timer_interrupt(void)
>  {
>      disable_physical_timers();
> =20
> -    release_irq(timer_irq[TIMER_HYP_PPI], NULL);
> -    release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> +    if ( system_state !=3D SYS_STATE_suspend )
> +    {
> +        release_irq(timer_irq[TIMER_HYP_PPI], NULL);
> +        release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> +    }
>  }
> =20
>  /* Wait a set number of microseconds */

--=20
WBR, Volodymyr=

