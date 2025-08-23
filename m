Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B354AB32B51
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 19:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091380.1448025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ups8E-0007Ar-E1; Sat, 23 Aug 2025 17:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091380.1448025; Sat, 23 Aug 2025 17:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ups8E-000793-Ag; Sat, 23 Aug 2025 17:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1091380;
 Sat, 23 Aug 2025 17:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ups8C-00078x-TK
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 17:34:21 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65abe7a4-8047-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 19:34:18 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV2PR03MB8605.eurprd03.prod.outlook.com
 (2603:10a6:150:ad::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 17:34:13 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Sat, 23 Aug 2025
 17:34:12 +0000
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
X-Inumbo-ID: 65abe7a4-8047-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOmlnX8Hp1U4D4czyKHMXeiknadyEGKlbBd9Mwx1t3DLAsDYP9EbSLVZymEAU2EElRCD2GGgj7MtlAv8nh54KRWY4FzT1T8+eaOsl5eN56UfPK+4F03R1KHkky607Fi6stkqknapsYQCF+tqfdg8+RErKsNUf4qCsMRdkEczY6zlmpiQZf/8zCZ+iFG348EeS6zWtfYiAhA+Onb6gUbrn1WGjUO31MwVN751ZG34kIbHvLqoCCqTGiy0n1RloXywFbGQkzW+VQvoKC3EUKAWrE+vxoLoVkliGDB3Il50l4Mw/6X9JyYL9ToQ/6qvS/OQlQnO86sfCaH/0K/xeava0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwsWOhsC+gxCsWU0PUNp89pst7olmKW0oRN3XgmCnpw=;
 b=qgdurob77aPzWbk8FOllX+W/T5NRuNtCDhuu7zvTwJH1yHGktfX23WM9xXPzomLdbSX+vT2OO4/ipYOB/ICB2zczsa7lDShqZYBQH4+DoiZA3gwaVr9HgsgamZqEhi9+VGru4rlTMBXKX/wN1wEMk7jgP/wTa5Xj2L0+zC9Jbx0eFzQ3uZ7yOnQvLiobjjuhzZXBrNOXPrZUyRxOhrxrekBwnCeXj2ilL3cotHvxpdQK4xicUgGyZ+XJbWDVWwkYVz76drK6D8rCZvZRs/2X+uhMw/Svfxo+wv0d20N+2vr5GFU1s7/ag9QyixWJjWvbSaeKY6DcT+ctUk4IrS46VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwsWOhsC+gxCsWU0PUNp89pst7olmKW0oRN3XgmCnpw=;
 b=u6EKNSB1liEb+B9greahSXmMaR37LnFIAlBdO0UcH1okjtrCRZqDQj0C0GtYUxdwXyCuL4seeHqcJ1AMhvRoC/GcPp4D7GGiqzoMd7+aajM7/o2zVP9gzHWVMFr8sFFt9V2/jQZ0RaCkasKdlky0oOYciAtyI5g8k3FTrDJ5734j64srG4jmRuTABUzQesSLoTbhgDMc01Vc8+MR7fmcNspxhHCtNr6cLvx6H79RjEALi4xUsnEcytiMEGOZ7/YUR3E9WV4tXLMG8YKhpFEId6i0Ao/kSB/29OGBBAM+hHVfjBWJYqjcvyIGJWgkA2auaApVGnOko2XBNBg2dOU/SQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mirela
 Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Saeed
 Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: Re: [PATCH v5 10/12] xen/arm: Save/restore context on suspend/resume
Thread-Topic: [PATCH v5 10/12] xen/arm: Save/restore context on suspend/resume
Thread-Index: AQHcCwFhwpLsP6pw2kWs0ShQW6gF5Q==
Date: Sat, 23 Aug 2025 17:34:12 +0000
Message-ID: <87zfbq6iy5.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<5441d6712a4ca0e61fd066606b9a96414123aaad.1754943875.git.mykola_kvach@epam.com>
In-Reply-To:
 <5441d6712a4ca0e61fd066606b9a96414123aaad.1754943875.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:06 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV2PR03MB8605:EE_
x-ms-office365-filtering-correlation-id: 3a98f562-60a4-49f9-5f29-08dde26b465c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?s7NKwtATN4rqvRL4ViLK2ApciCDAXi+gZumLOC07O7taAOiD7X0qUfpvPs?=
 =?iso-8859-1?Q?+GRNIM6ltDgQmOdVc6MM7/Q/RArBDt3WkggyLSlRqYRDL8Zt22OD9oVOsZ?=
 =?iso-8859-1?Q?3Smme1VYF/6I2CNrZsxv7wU1bNqU/zYpEsEaDivo6R8rBMvPfsTsRXQ3eO?=
 =?iso-8859-1?Q?EMV6rrggQcKHTIJTGBPdoVI5xwqLKNGoSNGIsCrwTAl02QwFR8WfqWc6oT?=
 =?iso-8859-1?Q?JnXVVkdbcM4/DgdZEIyb62WEosrnmr4D1LdepgtnN/JYM+7Au4OSJUHGkJ?=
 =?iso-8859-1?Q?tYlXEBk/IgIydA1mwwOeOMlauJV31YCEUIM/T99YaN9C5jUWdjoMoOqkUu?=
 =?iso-8859-1?Q?bGKEsPmxGlhc2RCGGmhyfVHMPmUg+LkrZOFNujAUVcQ/eplABCMATap93L?=
 =?iso-8859-1?Q?6/2JxS9rQjynNdycEb7Ve5QJjHV+d0qGZBHFPrRoeosoiRijzdR5rkxwB8?=
 =?iso-8859-1?Q?a30tJ2/zcYwTA53FkvE9btPWSmm7Q7Z+uVtYtHFzz1lXHqMwfhVyEMhYab?=
 =?iso-8859-1?Q?oi434Pz690U+pZ6jwKjq7wRERCqDAD3WMojJd0sODcgbfhIFs3+rf+vIax?=
 =?iso-8859-1?Q?Lb/9j8UgYvRf3sZIPsxPMw2P14BGHh9oC02i5kvgHngVbqSwkMd1aoo0hE?=
 =?iso-8859-1?Q?bWmm5n44bg7dfjT9T8hqT2p3zJPqLtVNCejXpTN2hLnjzTYgxWEYJ84Zz2?=
 =?iso-8859-1?Q?poHMQiC6J+Dqopzu0/qjpLK8ULCmbv2JCQTELrLoQ1sjdEFd2Zd/1McfAm?=
 =?iso-8859-1?Q?+T/SsXPAV9gX3wYaq/P73eia4kVDBflaxdc2FwGBNfrkmkEKP70wf2NFvo?=
 =?iso-8859-1?Q?9SP6opGOrzXJ+rOvqr9cQNVedwe6U/4I2MNiy+Gks2u5QpnTgvyYvOqrZo?=
 =?iso-8859-1?Q?C2+aIY64H7J5us/yLnfKl/8IBwb609B6n0eDVIigqRRlXGx9VKPizzOrtd?=
 =?iso-8859-1?Q?q/qXvj5vkplOU+KbJN+hjf6/9TgCZnuYhEUBKZ9cCERB6Z3FhX+pGgIefc?=
 =?iso-8859-1?Q?z9/zKqiOAAvUlT/+qye3KdBX9oY7yiG+8Y9w+jqP3BF5Ue1oKAh0sys61V?=
 =?iso-8859-1?Q?GJ70MQPLbmrgyHI0rZtStrqm0He2dj+JHyhSjHwHbu3RkBTB1UXyITnK4i?=
 =?iso-8859-1?Q?r+1CcqFhj2bbVC4t4wHpCASEZc8k9mwa4Oos8N6perDGoDs6C8C8FhcKP7?=
 =?iso-8859-1?Q?iyLpjIyUg0hPYsEMMHyHHXyMIc5ZwmMY7QYHMaawqwaVh55wDUeggT3Ham?=
 =?iso-8859-1?Q?SNiAdo1O5LRD0B0q0tvNI3IyXVaHdIBGbn3D+K83ldxgA+CRofT7qyXo+N?=
 =?iso-8859-1?Q?gAjsLjl1ex/ryoZSf36Vf78MHATPnuSS1RoJ+3tq2Ui5K4RIRl1XHOEzK2?=
 =?iso-8859-1?Q?PzcUNFgv+9/lphTKQN/S+PTtiyxXewZzYZbo3SQ9Y+vfktEYeKSfSbrN2O?=
 =?iso-8859-1?Q?l+mo7NzT8xge8kEA3H+mYJoY9InMO4SjmB464yO/0d2TsNC8S673DYbfVQ?=
 =?iso-8859-1?Q?p6MvKwpCnRX9ZxnZmbTF0euHXHI+Qt1qMXOFDsxirAgQnDtMAw7137tzzm?=
 =?iso-8859-1?Q?wRv4Phc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1WvmluZKfX8Sqv89W0C3QwnipfHmXXC7mWGeb93oJ9GMQZCBYLRuqy3pwI?=
 =?iso-8859-1?Q?39afX/8fWdwQoaO+B+lLaoUcpGSK3aQ7rXzzGkz1VXckuzukh5ry7W8G90?=
 =?iso-8859-1?Q?zPhWcnIOzXfKOuc/dvwP01aWoya5i4xNCYVbo5kaufIpDhHtavmvqClK29?=
 =?iso-8859-1?Q?IQe7jsnoDA/1CRiPs6C5QcJ89Feqj4oGsBAwPJhP4dtDwlLKri5cpj+RF8?=
 =?iso-8859-1?Q?CKfAhshRhmdb9r6ePg6fcqrFeB5P/xEia6dgX15xsle2RzmTc9ShO7kh09?=
 =?iso-8859-1?Q?9UfLxDVQmU3SZoRLbp8x08PrjdIRVYfRCYZ/SI1hH0OhsC9u8YJ5SCc6gb?=
 =?iso-8859-1?Q?DZ91gWmUQK1HSDNmwV3Sc+qgTvvtvuIbrU4zkBqnBKIoYVYYozvRdK+VfB?=
 =?iso-8859-1?Q?DoR5RWzuC9tyFxY8zkC0IibdjU0PSKWFs8i0FhNxf35IXMfFE9Ne2CwG2H?=
 =?iso-8859-1?Q?wT8uGvs+wR3fHkNemLnng0iZ1RVuOHdXAx7TMFdC+yNfkAznvd1LGahiQz?=
 =?iso-8859-1?Q?4xy3YxJaxrv49j1QXnYcrIm7WbbrvfeK4LY+nQd5ry0frwCqFYRGckvQCH?=
 =?iso-8859-1?Q?5niaKe0FnenQxZ8gBAzzELhahTzGjjjk7WUUGfhznPoRChmBqz3a9XQ8qL?=
 =?iso-8859-1?Q?RUtZ90h3XSK4Y4i9gIabFqoC7FjRGAaU6A3YG4u3p04uNVvQ8G4IUHTuLa?=
 =?iso-8859-1?Q?+eC9Ui7AEJp5XlP99iQJfJ2WQU7iSL6cxqwu92QZU52wJza1jwhPPns0Kz?=
 =?iso-8859-1?Q?8whyWEcqubQU0B028ijlS1z6YpwPmQdSlzEl9z3sKiSieS7xxb7qThuECN?=
 =?iso-8859-1?Q?xBZ7QydBX2JoIhKnm9TpBZRCyVt6vljEC1gYXxh3p6qlxOXwb81WQREbeO?=
 =?iso-8859-1?Q?E7lrMsw3KqAYXtpU+h2tQZOpT2WjjaIM26xezSnHToEuRZv0SqGAri9jmN?=
 =?iso-8859-1?Q?ui9a+i+QtV1iCG3hC+7bImwZSAdYayGSqCgrxQ7uUWsORMjyq33+JV/YCT?=
 =?iso-8859-1?Q?vJ4xUBBstIzHD7O5h5BW6dDZH8nHkyQd9mhm5v7ibQt9IUK+lQc64CU3v9?=
 =?iso-8859-1?Q?J5U+oVMIzlHKKkttCh/cilGbT6m2eqWwtRvl1mOlLoE5Uuf0BnrCkeLy9w?=
 =?iso-8859-1?Q?oh5bruEB5NXhk05UEBPVuXZZLwZMUYltE9U2Q4kqQQ1UefemAfIlx0x9fN?=
 =?iso-8859-1?Q?PjD1KL4lqziKTaGJXMF9lN51PiHTsp98HdOPuu6hlW79Avb5iJ0h/ayd+S?=
 =?iso-8859-1?Q?WXeLZPMxQH9lrceQ09IgsUWDgFV2RONxLhGrcr7kaJ68Ga5o4ihERQGQ7k?=
 =?iso-8859-1?Q?8vQR+3xeRxwgX1g9xoHrpClszOhZIoeXpfWPhPS2+A0tHuNnPju+RTjfHS?=
 =?iso-8859-1?Q?TBhwZWyz5i37krPrvDD0ZxhBpKmQfSUGnPyuJRc5uSq8juJb9mp5ttqaNB?=
 =?iso-8859-1?Q?g26T+qa6Y0juRIDs/NnAR1gAunKxtUBTJakp7MeZH9ZnwbGkSEgByljWe3?=
 =?iso-8859-1?Q?vk6K+6JFQkq4l4xpM22+k/JVXf++HkFTPf8qFYUYVBtLN7+PSJG/sxKk6k?=
 =?iso-8859-1?Q?dIHx4HaeQmxpUuJgg98Dcxj/tfdTqim6QWEIiboqavBGnsnyYvbDVrgKPj?=
 =?iso-8859-1?Q?Ciy/QwKgmXmc2+VL4BrPXuyYSyTGFc1iCziP4bYPHVJeSreFM+lwOojQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a98f562-60a4-49f9-5f29-08dde26b465c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 17:34:12.5874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BoL8A33mW1ogvZ3lVf7ws2vZ70moJC2K34SnNjQrJmAWEsy7z3GZAHaLYeoZYXNifji+vtPrapB3+jvXMvqjnznFl5ZIONXGh9ZNvOzpkMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8605


Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> The context of CPU general purpose and system control registers
> has to be saved on suspend and restored on resume. This is
> implemented in hyp_suspend and before the return from hyp_resume
> function. The hyp_suspend is invoked just before the PSCI system
> suspend call is issued to the ATF. The hyp_suspend has to return a
> non-zero value so that the calling 'if' statement evaluates to true,
> causing the system suspend to be invoked. Upon the resume, context
> saved on suspend will be restored, including the link register.
> Therefore, after restoring the context the control flow will
> return to the address pointed by the saved link register, which
> is the place from which the hyp_suspend was called. To ensure
> that the calling 'if' statement doesn't again evaluate to true
> and initiate system suspend, hyp_resume has to return a zero value
> after restoring the context.
>
> Note that the order of saving register context into cpu_context
> structure has to match the order of restoring.
>
> Support for ARM32 is not implemented. Instead, compilation fails with a
> build-time error if suspend is enabled for ARM32.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v4:
> - produce build-time error for ARM32 when CONFIG_SYSTEM_SUSPEND is enable=
d
> - use register_t instead of uint64_t in cpu_context structure
> ---
>  xen/arch/arm/arm64/head.S          | 91 +++++++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/suspend.h | 20 +++++++
>  xen/arch/arm/suspend.c             | 23 +++++++-
>  3 files changed, 130 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 596e960152..ad8b48de3a 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -562,6 +562,52 @@ END(efi_xen_start)
>  #endif /* CONFIG_ARM_EFI */
> =20
>  #ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * int hyp_suspend(struct cpu_context *ptr)
> + *
> + * x0 - pointer to the storage where callee's context will be saved
> + *
> + * CPU context saved here will be restored on resume in hyp_resume funct=
ion.
> + * hyp_suspend shall return a non-zero value. Upon restoring context
> + * hyp_resume shall return value zero instead. From C code that invokes
> + * hyp_suspend, the return value is interpreted to determine whether the=
 context
> + * is saved (hyp_suspend) or restored (hyp_resume).
> + */
> +FUNC(hyp_suspend)

I don't think that hyp_suspend is the correct name, as this function in
fact suspend_nothing. Maybe "prepare_resume_ctx" will be better?

> +        /* Store callee-saved registers */
> +        stp     x19, x20, [x0], #16

If you have struct cpu_context defined, then you probably should use
define provided by <asm-offsets.h> to access struct fields. Otherwise,
it will be really easy to get desync between struct definition and this
asm code.

> +        stp     x21, x22, [x0], #16
> +        stp     x23, x24, [x0], #16
> +        stp     x25, x26, [x0], #16
> +        stp     x27, x28, [x0], #16
> +        stp     x29, lr, [x0], #16
> +
> +        /* Store stack-pointer */
> +        mov     x2, sp
> +        str     x2, [x0], #8
> +
> +        /* Store system control registers */
> +        mrs     x2, VBAR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, VTCR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, VTTBR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, TPIDR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, MDCR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, HSTR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, CPTR_EL2
> +        str     x2, [x0], #8
> +        mrs     x2, HCR_EL2
> +        str     x2, [x0], #8
> +
> +        /* hyp_suspend must return a non-zero value */
> +        mov     x0, #1
> +        ret
> +END(hyp_suspend)
> =20
>  FUNC(hyp_resume)
>          /* Initialize the UART if earlyprintk has been enabled. */
> @@ -580,7 +626,50 @@ FUNC(hyp_resume)
>          b     enable_secondary_cpu_mm
> =20
>  mmu_resumed:
> -        b .
> +        /*
> +         * Now we can access the cpu_context, so restore the context her=
e
> +         * TODO: can we reuse __context_switch and saved_context struct =
here ?
> +         */

This is a great idea and I like it very much, but sadly saved_context
struct has no fields for system _EL2 registers.

> +        ldr     x0, =3Dcpu_context
> +
> +        /* Restore callee-saved registers */
> +        ldp     x19, x20, [x0], #16
> +        ldp     x21, x22, [x0], #16
> +        ldp     x23, x24, [x0], #16
> +        ldp     x25, x26, [x0], #16
> +        ldp     x27, x28, [x0], #16
> +        ldp     x29, lr, [x0], #16
> +
> +        /* Restore stack pointer */
> +        ldr     x2, [x0], #8
> +        mov     sp, x2
> +
> +        /* Restore system control registers */
> +        ldr     x2, [x0], #8
> +        msr     VBAR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     VTCR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     VTTBR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     TPIDR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     MDCR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     HSTR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     CPTR_EL2, x2
> +        ldr     x2, [x0], #8
> +        msr     HCR_EL2, x2
> +        isb
> +
> +        /* Since context is restored return from this function will appe=
ar as
> +         * return from hyp_suspend. To distinguish a return from hyp_sus=
pend
> +         * which is called upon finalizing the suspend, as opposed to re=
turn
> +         * from this function which executes on resume, we need to retur=
n zero
> +         * value here. */
> +        mov x0, #0
> +        ret
>  END(hyp_resume)
> =20
>  #endif /* CONFIG_SYSTEM_SUSPEND */
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 55041a5d06..ae71ccb87b 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -5,9 +5,29 @@
> =20
>  #ifdef CONFIG_SYSTEM_SUSPEND
> =20
> +#ifdef CONFIG_ARM_64
> +struct cpu_context {
> +    register_t callee_regs[12];
> +    register_t sp;
> +    register_t vbar_el2;
> +    register_t vtcr_el2;
> +    register_t vttbr_el2;
> +    register_t tpidr_el2;
> +    register_t mdcr_el2;
> +    register_t hstr_el2;
> +    register_t cptr_el2;
> +    register_t hcr_el2;
> +} __aligned(16);
> +#else
> +#error "Define cpu_context structure for arm32"
> +#endif
> +
> +extern struct cpu_context cpu_context;
> +
>  int host_system_suspend(void);
> =20
>  void hyp_resume(void);
> +int hyp_suspend(struct cpu_context *ptr);
> =20
>  #endif /* CONFIG_SYSTEM_SUSPEND */
> =20
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 08b6acaede..b5398e5ca6 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> =20
>  #include <asm/psci.h>
> +#include <asm/suspend.h>
>  #include <xen/console.h>
>  #include <xen/cpu.h>
>  #include <xen/llc-coloring.h>
> @@ -17,6 +18,8 @@
>   *  - Investigate feasibility and need for implementing system suspend o=
n ARM32
>   */
> =20
> +struct cpu_context cpu_context;
> +
>  /* Xen suspend. Note: data is not used (suspend is the suspend to RAM) *=
/
>  static long system_suspend(void *data)
>  {
> @@ -73,9 +76,23 @@ static long system_suspend(void *data)
>       */
>      update_boot_mapping(true);
> =20
> -    status =3D call_psci_system_suspend();
> -    if ( status )
> -        dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%d\n"=
, status);
> +    if ( hyp_suspend(&cpu_context) )
> +    {
> +        status =3D call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI=
 call,
> +         * the code below in this 'if' branch will never execute. Execut=
ion
> +         * will continue from hyp_resume which is the hypervisor's resum=
e point.
> +         * In hyp_resume CPU context will be restored and since link-reg=
ister is
> +         * restored as well, it will appear to return from hyp_suspend. =
The
> +         * difference in returning from hyp_suspend on system suspend ve=
rsus
> +         * resume is in function's return value: on suspend, the return =
value is
> +         * a non-zero value, on resume it is zero. That is why the contr=
ol flow
> +         * will not re-enter this 'if' branch on resume.
> +         */

Looks like this comment is misplaced. It should be before "if (
hyp_suspend() )", right?

> +        if ( status )
> +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%=
d\n", status);
> +    }
> =20
>      system_state =3D SYS_STATE_resume;
>      update_boot_mapping(false);

--=20
WBR, Volodymyr=

