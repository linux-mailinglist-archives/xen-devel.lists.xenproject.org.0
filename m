Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E84C5D89E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 15:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162699.1490247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJugn-0001PO-Pr; Fri, 14 Nov 2025 14:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162699.1490247; Fri, 14 Nov 2025 14:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJugn-0001Ms-Ms; Fri, 14 Nov 2025 14:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1162699;
 Fri, 14 Nov 2025 14:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTzj=5W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJugm-0001Mm-KX
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 14:22:12 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee696b5-c165-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 15:22:11 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7191.eurprd03.prod.outlook.com (2603:10a6:20b:2ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 14:22:09 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:22:08 +0000
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
X-Inumbo-ID: 4ee696b5-c165-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqij3U/GDpv16qpX+xG+2+q+k0oZIeMmAGWolihrLMXoT2//WyCr9PR1fEgBpLni7gOb6q0GXwoJqOuNhNHsPB/E0ihZDN2I1SndYWsnwrrj/k8+jscKJUXsXfR69gUSrtKz+IYzLS+GF3TjPMs4iE1oz0pOk9DO56YNub6/WMLg8xyrSPXtfwMk+DgRLKptpu3pGCSBAxT/0LjIGG+l19zY/np5tdZIYgnxrh72eAHX95f3ED67LDs+nIhMMYdybRtRa21yT8OCh40AzCcE8a2wnYHuJE+Z0dJGDWDpMmTocQCycDzXPuA3oHM3PRgGDHvA/BWe5M2SIYf3kjXaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6CjEf5hNvYHDl2uCvVcp/WqWMosBJlofzdgbI/8mko=;
 b=B6b8CQVcnWi1h7Tly47v+r96mD0a/cc+tMXdOTdUzw3x5qnM9de6kWuxBy2efanjU7IU1Aty+rCCsAP1pPKNi88R0ixievPEhekq6V6i1bxZXIVbb+4zaznP2JIOW7fFCdzHpk8N/B0hC44cBnIv9VAHNgVUT/OaJM54tASVx4Vufh48HDts1gYyt6IixgAs0PH6d9makPfMnFWmzPeCk2IXCsIrQXfUCvf6EvDc0/W3B1vd4bt/lWCDYZskmsXQXXOeyNN1HCMXSW8sDcSjBHKKfEWXjERN4PpGrCd+dgD70I5UZiT0NRquuvRrIYmZnqP29/ZESepPXOeYkY2j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6CjEf5hNvYHDl2uCvVcp/WqWMosBJlofzdgbI/8mko=;
 b=hfEJxkNkS3AF22dkCPeTarFLGhaE7WH7WdC+69BCi3IMfx9kf3gLOaPFVCwnUlxgXaCSDrwjv3aCfIirdOSqCwB7D/P/SJASnog/rDuwEDwsmK5375olRVzzOmRtCCmpmfYVqClOShtXjiKHy3hiVZrRRWexcrvAVotVdWN5yFfEhVY03QiFYlNVlqJuxSjNj+soHdMY0At/fkan+ayUOi4gsaqEGgC2aPcv53CVrYVo4M0Rs/7WDS4crg+92uy5gl5tBd4IZwMfZ7ESkdDqDGdq6/b3ych+UXvNTOc3zpB39ZmfAIIsf7ojrwlDqzrMyiVYJfOIGX2iA0XeFW1Ofg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tamas K
 Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>, Teddy Astie
	<teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [XEN][PATCH v3] xen: make VMTRACE support optional
Thread-Topic: [XEN][PATCH v3] xen: make VMTRACE support optional
Thread-Index: AQHcVXIP26AfHxCGuEiFwRo5YoIXjA==
Date: Fri, 14 Nov 2025 14:22:08 +0000
Message-ID: <20251114142207.279834-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB7191:EE_
x-ms-office365-filtering-correlation-id: 77fc1a78-5d8d-42e2-3ad1-08de238931fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZPC/rtk9Duk+LVMTyYrwJs03imI33wBriCevwwkuiGwJrJ+cvm5MkPVtWn?=
 =?iso-8859-1?Q?pK7GJSRjY6m8MA2gefAZqgrG7kWfS2MecgZbBe+0wWo3ltEMIMaBobL6GL?=
 =?iso-8859-1?Q?fEMPbDFoBN67/A5Z1vPOZlMljSWYLJtLXRGsDoKwlGf8I5qs4sukW9YITD?=
 =?iso-8859-1?Q?7MDm22z+xkl0Rm5u0m+iIZdBTunDERr5wQiiGc2eR4KtBY9peyrFuuzlS6?=
 =?iso-8859-1?Q?lE6sDf/jZkQU7RXdE5H3881dH4jUdWb/sLGFanrhIHgKqcjwFQpuYldKLN?=
 =?iso-8859-1?Q?iGiu2uQ2UKKCFfz2qp4P/485UZ3GQQo2/ntXnH1lG8NRJiwrSQdp25Wcb6?=
 =?iso-8859-1?Q?UdiEosN6jDYaReR/uLkLptncHx0MTHPnMztLCVmUH3ZvkHllonDyDOYPO+?=
 =?iso-8859-1?Q?ZC2o8LndMZ4Kzqyo4/rDa77INNeiY6SY5xt8lOaBFnfNjIiN6GqiMksD7f?=
 =?iso-8859-1?Q?twarYphmxK5LL+Uiem0789xJii0Z1jKFL6FWwgqPXowzgAFCXh8OWmjEEN?=
 =?iso-8859-1?Q?P9owiYARnkdb0WPzCz3AdL6PySe+ied1TWoQOZXitUlqgr4blWw3W2WNa3?=
 =?iso-8859-1?Q?E8QLK6v1dngYovs+zEJAs41srxHbukn9ENJSXVViCrxXDhbjqNfSelvOEx?=
 =?iso-8859-1?Q?0IpWugtErx1H52hEo4oQo5uzwyR6b4mGqBuoNDGa13o4S7s5TAMKDcqwRI?=
 =?iso-8859-1?Q?c7a5xhHFAHPPR1f8I+IgeMKPrQJj3fZdAfdE+cbdaB9D3NP90XJwpu2ydR?=
 =?iso-8859-1?Q?1+AAjx2MQ+58N0xh733Oz2Ygdg+oVHlSt5dMamsKEk7yFR2ZVaXctmy4Hu?=
 =?iso-8859-1?Q?XH42Shl9n7OJTDvM53WC7wkIn8UMJBB2GwjkxCsDlO+P7k7XIaCy+OxJuL?=
 =?iso-8859-1?Q?LC8PVsczg5NJZeHEdIONSNbbOixPjH5bezB+qjACrhs1axnADj3HM63xgV?=
 =?iso-8859-1?Q?nN2coYHXGY/N9WXxLG8NDJeotOtReBDQpB2uCYevYS4SMvW7dm+UfzmB0K?=
 =?iso-8859-1?Q?ZFNCcMThnNqtxh33YKbT6eVApmv2PTMOM/8gcl6W5RJs/YZyxpVQhnmyNU?=
 =?iso-8859-1?Q?zicE33Xn3/fAE2nI0WpQhvg2Nu5nbbJMex86pFeU4X+z2w5+zTjPEBUatg?=
 =?iso-8859-1?Q?ZtnxGdy8L5sMyO4PIbuLtjfaxPMSSMUkWFR+AWNEH15QWlRdhjaP8egQZr?=
 =?iso-8859-1?Q?JAb2L6HTUyt6/wYre/RAAyh4bguoLEFJ3Xtryp8Lc0KWQhRuMboEop/kSj?=
 =?iso-8859-1?Q?1060dWbpxEAGsNUhXhKRYvTMnOgiligdjnc+Fcvnz3VKqFv7BdwES4MIy1?=
 =?iso-8859-1?Q?a/Te4cQyDal+Gw2bpg2iB92rM57wf7AzNxgAdbSfRlT1Xr6TDvXaNUPnxN?=
 =?iso-8859-1?Q?r36sGbLzzbGUW1dxChFIdLqndDcfX1u4Ra6IRHqcB+X7Cu0ia/fCv0QVLi?=
 =?iso-8859-1?Q?i131tjUjlXvYQYhGD0UVwakoAEyZaRj3G0pHOVvvTaY2s5VpJ6RYg00FZK?=
 =?iso-8859-1?Q?fEC+SFvtQf+TX/0/6Q2Et1ecivvJ+zdEWGF9jVxrYxbE/IubuakAFwYPFi?=
 =?iso-8859-1?Q?Ob5aqpDjDrwrahVejGoe9CJ4AP/f?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2gvySbqw87P2DkU8jO35Ro6EiP0FQPg3hfooa8UDwR8xW9uwPN9IJ9mvkG?=
 =?iso-8859-1?Q?6rUr/X19jvXSxT2V0FGojG3qtnc4wqjfkhYAGAjLZzfIUktRdU0x577iep?=
 =?iso-8859-1?Q?+DoCKI4/0ToJ6o27UNnT3GRq6j3vz7FyYNOUuzZ+IUq0pr+h6MZUkysAY5?=
 =?iso-8859-1?Q?Kg6HDOilkFxcvyOF1XgXlFq9wyEed+/ZirKGHJJa0cT1VT341uys6Y+dTu?=
 =?iso-8859-1?Q?8/0D1nbNkuuhh8DfW1imWpe2Y/uWFG6Xsx3qijTp10RhPof2m4O6mr+YxB?=
 =?iso-8859-1?Q?vFV5L79bRzneDspP/VMOweyV5ZsEJ9GyM0EJwgBHzGkhuy3PFXPKtot62P?=
 =?iso-8859-1?Q?8btVbjyb5hAlFKMRoNBypAwHhn/Tt4Gjx6IYya/Wply5AjATBgzn76SEjo?=
 =?iso-8859-1?Q?ped4bFx4de57ViPhLa4CqHz6SAwJklLlN+/OewArgULDo5vVG6ajL+V8cr?=
 =?iso-8859-1?Q?ox28LePH77aSwrwQIH10jLfsxaiP1pQ+tJxwA48oVIa37vfRxiQsCNM3gj?=
 =?iso-8859-1?Q?+t+j8DR1jH2stgWNypxW8Vft33BJn3QNRllkCDqh7wEcFTq0s7r7YlctIY?=
 =?iso-8859-1?Q?fEUfcuaiaDoA6Qbo3NOwhGvIGWO1Az+SeqC6BQgc2j0N6XtOHywWxkoFoO?=
 =?iso-8859-1?Q?CSR1ZxFyiD9av+xhHgzFkJvYan6W6usNH6rp3WdaTuCV2u9MOf+FJC7W6V?=
 =?iso-8859-1?Q?h2R6yg83dNVzuN+YgenxBt/qjl7QQ5Ocj1QIQm8CrHi+wrsB4wIXE4MNdl?=
 =?iso-8859-1?Q?rWLlNnVEkMPTZnIj5LHcLUx9tNgAOpEvr1Hhqak2Eka9GVESwJAzO0wULJ?=
 =?iso-8859-1?Q?hRyZttifsLSudc3YVEuopVdWUlmv/TL4mDNKDgSO6VHljlrF3GEJUXWzZp?=
 =?iso-8859-1?Q?PkbeJrwvSo5FBcw2VsiO932gTJehuqaABmePh4MWn9yaQd9X5d9S6kYppN?=
 =?iso-8859-1?Q?RBC6Z0hy9/M1YwgYDuE6c7cIX/L3vIexLEslWWKPdrFg/G4QxTYDA4rfAf?=
 =?iso-8859-1?Q?7kBe6UeuCsAnS/MC2h3xpRhHStWczLoPWgeW5TU2/Gr1m0TNJT3r2HWILq?=
 =?iso-8859-1?Q?llBmH96K1+IYBs/GJx2XLrtlVRVRmVbzO0i6/E8JlNStBpCS7PstoSdTJ9?=
 =?iso-8859-1?Q?1KuClXxyOjI+YHQwzEQVNVZCRJSiRz5TAK2QWLTK5bCboJJvOyitKtYh3E?=
 =?iso-8859-1?Q?G7SHv/YaT5e0iYnwUVBnZu9pgVJHBZXl9vDOMp8qFn2FFGJy953RSWmYG9?=
 =?iso-8859-1?Q?rHRUUgpBSjdggj9zlgKENOZv7RN8nYQ7mUubymx3jrGg0VntTG9XQOS0aX?=
 =?iso-8859-1?Q?ZjnE4Gr2RkN3Q7UYRNvgSEu+sktJNmzf4sQlTzHRaWsNUBFcB1xqsTrJOD?=
 =?iso-8859-1?Q?W/shn9cNFrHi4fqvThkzu/yHZVHGibP0yXhy7V7Yg/wBQiLQVUaw13vjyt?=
 =?iso-8859-1?Q?5o9FRef12vhMOFurd825P+Sy5f04GveXnoyo6TGp87UawJy5wL2gXS89wy?=
 =?iso-8859-1?Q?UJI9wLXfoO99C3jQvhajr5JesxM3I5Cw0hkq1gUUe5L6aLBNqZuQNzO/FH?=
 =?iso-8859-1?Q?/4Hu4P44Ix1rW1LM6Ykz+wIjvyoHe1x7AbJqfPJzi2/dIleOmXR5AJDkAC?=
 =?iso-8859-1?Q?5jYC9hnXnZZtLjq9Vscc0tgsCPanrXPECRJxaYVw5Sq0to/EaKZqYi0w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fc1a78-5d8d-42e2-3ad1-08de238931fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 14:22:08.8825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wL8qX+QrOc67lq6pQs4FdB35lIyqk2zcDLPRaea/7UV3MQadHEG9oO60lRC3h36XHc4EtyEUE+taLAGvGDDUvOeGDo9ImzbsTarZW3TGCIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7191

From: Grygorii Strashko <grygorii_strashko@epam.com>

The VMTRACE feature is depends on Platform/Arch HW and code support and now
can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
This makes VMTRACE support optional by introducing HVM Kconfig option:
- CONFIG_VMTRACE to enable/disable the feature.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v3:
- drop vmtrace stubs for HVM=3Dn case from hvm.h (VMTRACE depnds on HVM)
- hvm_vmtrace_reset() fix return err code
- add comment about using func declaration without definition

changes in v2:
 - fix comments from Jan Beulich
 - move CONFIG_VMTRACE in HVM
 - drop HAS_VMTRACE

v2:
 https://patchwork.kernel.org/project/xen-devel/patch/20251112202442.387999=
7-1-grygorii_strashko@epam.com/=20
v1:
 https://patchwork.kernel.org/project/xen-devel/patch/20251031212005.133821=
2-1-grygorii_strashko@epam.com/

 xen/arch/x86/domctl.c                   |  4 +++
 xen/arch/x86/hvm/Kconfig                | 12 +++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c              | 11 ++++++++
 xen/arch/x86/include/asm/guest-msr.h    |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      | 36 ++++++++++---------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
 xen/arch/x86/mm/mem_sharing.c           |  2 ++
 xen/arch/x86/vm_event.c                 |  7 ++---
 xen/common/domain.c                     | 10 +++++++
 xen/common/memory.c                     |  6 +++++
 xen/common/vm_event.c                   |  3 ++-
 xen/include/xen/domain.h                |  4 +++
 xen/include/xen/sched.h                 |  4 +++
 14 files changed, 79 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 6153e3c07e2d..d9521808dcba 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -154,6 +154,7 @@ void arch_get_domain_info(const struct domain *d,
 static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *o=
p,
                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
+#ifdef CONFIG_VMTRACE
     struct vcpu *v;
     int rc;
=20
@@ -198,6 +199,9 @@ static int do_vmtrace_op(struct domain *d, struct xen_d=
omctl_vmtrace_op *op,
     vcpu_unpause(v);
=20
     return rc;
+#else
+    return -EOPNOTSUPP;
+#endif
 }
=20
 #define MAX_IOPORTS 0x10000
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index c1a131d1851a..5c47a45c9350 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -35,6 +35,18 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
=20
+config VMTRACE
+    bool "HW VM tracing support"
+    depends on INTEL_VMX
+    default y
+    help
+      Enables HW VM tracing support which allows to configure HW processor
+      features (vmtrace_op) to enable capturing information about software
+      execution using dedicated hardware facilities with minimal interfere=
nce
+      to the software being traced. The trace data can be retrieved using =
buffer
+      shared between Xen and domain
+      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
+
 config HVM_FEP
 	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
 	default DEBUG
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index cd5ac8a5f0e3..2fffc2006ab0 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
=20
     /* Check whether IPT is supported in VMX operation. */
+#ifdef CONFIG_VMTRACE
     if ( bsp )
         vmtrace_available =3D cpu_has_proc_trace &&
                             (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
@@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
                smp_processor_id());
         return -EINVAL;
     }
+#endif
=20
     if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTRO=
LS )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ee6977e94127..3f0e113b0b67 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -622,6 +622,7 @@ static void cf_check domain_creation_finished(struct do=
main *d)
=20
 static void vmx_init_ipt(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     unsigned int size =3D v->domain->vmtrace_size;
=20
     if ( !size )
@@ -632,6 +633,7 @@ static void vmx_init_ipt(struct vcpu *v)
     ASSERT(size >=3D PAGE_SIZE && (size & (size - 1)) =3D=3D 0);
=20
     v->arch.msrs->rtit.output_limit =3D size - 1;
+#endif
 }
=20
 static int cf_check vmx_vcpu_initialise(struct vcpu *v)
@@ -724,11 +726,13 @@ static void vmx_save_guest_msrs(struct vcpu *v)
      */
     v->arch.hvm.vmx.shadow_gs =3D read_gs_shadow();
=20
+#ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
         rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+#endif
=20
     if ( cp->feat.pks )
         msrs->pkrs =3D rdpkrs_and_cache();
@@ -747,12 +751,14 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(msrs->tsc_aux);
=20
+#ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
         wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
         wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+#endif
=20
     if ( cp->feat.pks )
         wrpkrs(msrs->pkrs);
@@ -2626,6 +2632,7 @@ static bool cf_check vmx_get_pending_event(
     return true;
 }
=20
+#ifdef CONFIG_VMTRACE
 /*
  * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_=
CTL.
  * These all pertain to data-emitted into the trace buffer(s).  Must not
@@ -2768,6 +2775,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
     v->arch.msrs->rtit.status =3D 0;
     return 0;
 }
+#endif
=20
 static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
@@ -2940,11 +2948,14 @@ static struct hvm_function_table __initdata_cf_clob=
ber vmx_function_table =3D {
     .altp2m_vcpu_emulate_ve =3D vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc =3D vmx_vcpu_emulate_vmfunc,
 #endif
+
+#ifdef CONFIG_VMTRACE
     .vmtrace_control =3D vmtrace_control,
     .vmtrace_output_position =3D vmtrace_output_position,
     .vmtrace_set_option =3D vmtrace_set_option,
     .vmtrace_get_option =3D vmtrace_get_option,
     .vmtrace_reset =3D vmtrace_reset,
+#endif
=20
     .get_reg =3D vmx_get_reg,
     .set_reg =3D vmx_set_reg,
diff --git a/xen/arch/x86/include/asm/guest-msr.h b/xen/arch/x86/include/as=
m/guest-msr.h
index 5f0cb0a93995..702f47fe1e16 100644
--- a/xen/arch/x86/include/asm/guest-msr.h
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -50,6 +50,7 @@ struct vcpu_msrs
         };
     } misc_features_enables;
=20
+#ifdef CONFIG_VMTRACE
     /*
      * 0x00000560 ... 57x - MSR_RTIT_*
      *
@@ -81,6 +82,7 @@ struct vcpu_msrs
             };
         };
     } rtit;
+#endif
=20
     /*
      * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 7412256a2dab..93da4dd2dc4b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -234,12 +234,14 @@ struct hvm_function_table {
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 #endif
=20
+#ifdef CONFIG_VMTRACE
     /* vmtrace */
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value=
);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *valu=
e);
     int (*vmtrace_reset)(struct vcpu *v);
+#endif
=20
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
     void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
@@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *=
v)
 bool altp2m_vcpu_emulate_ve(struct vcpu *v);
 #endif /* CONFIG_ALTP2M */
=20
+#ifdef CONFIG_VMTRACE
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool re=
set)
 {
     if ( hvm_funcs.vmtrace_control )
@@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
=20
     return -EOPNOTSUPP;
 }
+#else
+/*
+ * Function declaration(s) here are used without definition(s) to make com=
piler
+ * happy when VMTRACE=3Dn, compiler DCE will eliminate unused code.
+ */
+int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
+#endif
=20
 static inline int hvm_vmtrace_reset(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     if ( hvm_funcs.vmtrace_reset )
         return alternative_call(hvm_funcs.vmtrace_reset, v);
=20
     return -EOPNOTSUPP;
+#else
+    return -EOPNOTSUPP;
+#endif
 }
=20
 /*
@@ -934,28 +948,6 @@ static inline bool hvm_has_set_descriptor_access_exiti=
ng(void)
     return false;
 }
=20
-static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool re=
set)
-{
-    return -EOPNOTSUPP;
-}
-
-static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *po=
s)
-{
-    return -EOPNOTSUPP;
-}
-
-static inline int hvm_vmtrace_set_option(
-    struct vcpu *v, uint64_t key, uint64_t value)
-{
-    return -EOPNOTSUPP;
-}
-
-static inline int hvm_vmtrace_get_option(
-    struct vcpu *v, uint64_t key, uint64_t *value)
-{
-    return -EOPNOTSUPP;
-}
-
 static inline uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
 {
     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index 8ff7c8045fc6..879ec10cefd0 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -154,8 +154,10 @@ struct vmx_vcpu {
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
     bool                 ept_spurious_misconfig;
=20
+#ifdef CONFIG_VMTRACE
     /* Processor Trace configured and enabled for the vcpu. */
     bool                 ipt_active;
+#endif
=20
     /* Is the guest in real mode? */
     uint8_t              vmx_realmode;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4787b2796479..074f1b2562b3 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1888,7 +1888,9 @@ static int fork(struct domain *cd, struct domain *d)
         domain_pause(d);
         cd->max_pages =3D d->max_pages;
         *cd->arch.cpu_policy =3D *d->arch.cpu_policy;
+#ifdef CONFIG_VMTRACE
         cd->vmtrace_size =3D d->vmtrace_size;
+#endif
         cd->parent =3D d;
     }
=20
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index fc349270b9c5..e9ac1d497594 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -253,7 +253,8 @@ void vm_event_fill_regs(vm_event_request_t *req)
     req->data.regs.x86.shadow_gs =3D ctxt.shadow_gs;
     req->data.regs.x86.dr6 =3D ctxt.dr6;
=20
-    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos=
) !=3D 1 )
+    if ( IS_ENABLED(CONFIG_VMTRACE) &&
+         hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos=
) !=3D 1 )
         req->data.regs.x86.vmtrace_pos =3D ~0;
 #endif
 }
@@ -303,12 +304,12 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_=
response_t *rsp)
 #endif
 }
=20
+#ifdef CONFIG_VMTRACE
 void vm_event_reset_vmtrace(struct vcpu *v)
 {
-#ifdef CONFIG_HVM
     hvm_vmtrace_reset(v);
-#endif
 }
+#endif
=20
 /*
  * Local variables:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e13e01c1d272..ce4f55339fb4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -136,7 +136,9 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
=20
 vcpu_info_t dummy_vcpu_info;
=20
+#ifdef CONFIG_VMTRACE
 bool __read_mostly vmtrace_available;
+#endif
=20
 bool __read_mostly vpmu_is_available;
=20
@@ -318,6 +320,7 @@ static void vcpu_info_reset(struct vcpu *v)
=20
 static void vmtrace_free_buffer(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     const struct domain *d =3D v->domain;
     struct page_info *pg =3D v->vmtrace.pg;
     unsigned int i;
@@ -332,10 +335,12 @@ static void vmtrace_free_buffer(struct vcpu *v)
         put_page_alloc_ref(&pg[i]);
         put_page_and_type(&pg[i]);
     }
+#endif
 }
=20
 static int vmtrace_alloc_buffer(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     struct domain *d =3D v->domain;
     struct page_info *pg;
     unsigned int i;
@@ -377,6 +382,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
     }
=20
     return -ENODATA;
+#else
+    return 0;
+#endif
 }
=20
 /*
@@ -825,7 +833,9 @@ struct domain *domain_create(domid_t domid,
         ASSERT(!config->altp2m.nr);
 #endif
=20
+#ifdef CONFIG_VMTRACE
         d->vmtrace_size =3D config->vmtrace_size;
+#endif
     }
=20
     /* Sort out our idea of is_control_domain(). */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd5032..66dc7f7a0a41 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct=
 domain *d,
     case XENMEM_resource_ioreq_server:
         return ioreq_server_max_frames(d);
=20
+#ifdef CONFIG_VMTRACE
     case XENMEM_resource_vmtrace_buf:
         return d->vmtrace_size >> PAGE_SHIFT;
+#endif
=20
     default:
         return 0;
@@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
 #endif
 }
=20
+#ifdef CONFIG_VMTRACE
 static int acquire_vmtrace_buf(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
@@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
=20
     return nr_frames;
 }
+#endif
=20
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
@@ -1238,8 +1242,10 @@ static int _acquire_resource(
     case XENMEM_resource_ioreq_server:
         return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
=20
+#ifdef CONFIG_VMTRACE
     case XENMEM_resource_vmtrace_buf:
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
+#endif
=20
     default:
         ASSERT_UNREACHABLE();
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index b2787c010890..cf0258223f50 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -441,7 +441,8 @@ static int vm_event_resume(struct domain *d, struct vm_=
event_domain *ved)
             if ( rsp.flags & VM_EVENT_FLAG_GET_NEXT_INTERRUPT )
                 vm_event_monitor_next_interrupt(v);
=20
-            if ( rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE )
+            if ( IS_ENABLED(CONFIG_VMTRACE) &&
+                 (rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE) )
                 vm_event_reset_vmtrace(v);
=20
             if ( rsp.flags & VM_EVENT_FLAG_VCPU_PAUSED )
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93c8..aa86a9f46022 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -191,7 +191,11 @@ void vnuma_destroy(struct vnuma_info *vnuma);
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma=
); }
 #endif
=20
+#ifdef CONFIG_VMTRACE
 extern bool vmtrace_available;
+#else
+#define vmtrace_available false
+#endif
=20
 extern bool vpmu_is_available;
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce37..dcd8647e0d36 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -300,9 +300,11 @@ struct vcpu
     /* vPCI per-vCPU area, used to store data for long running operations.=
 */
     struct vpci_vcpu vpci;
=20
+#ifdef CONFIG_VMTRACE
     struct {
         struct page_info *pg; /* One contiguous allocation of d->vmtrace_s=
ize */
     } vmtrace;
+#endif
=20
     struct arch_vcpu arch;
=20
@@ -623,7 +625,9 @@ struct domain
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
 #endif
=20
+#ifdef CONFIG_VMTRACE
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. *=
/
+#endif
=20
 #ifdef CONFIG_ARGO
     /* Argo interdomain communication support */
--=20
2.34.1

