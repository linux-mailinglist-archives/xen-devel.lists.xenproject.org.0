Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D55C546F7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 21:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160465.1488593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJHOd-0003te-Iy; Wed, 12 Nov 2025 20:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160465.1488593; Wed, 12 Nov 2025 20:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJHOd-0003so-ER; Wed, 12 Nov 2025 20:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1160465;
 Wed, 12 Nov 2025 20:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJHOc-0003si-Br
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 20:24:50 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a22dde3e-c005-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 21:24:48 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS4PR03MB8506.eurprd03.prod.outlook.com (2603:10a6:20b:576::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Wed, 12 Nov
 2025 20:24:44 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:24:44 +0000
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
X-Inumbo-ID: a22dde3e-c005-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YigWvIQujKMWnW1ZG6+SD7YcDZJ1cJ4elcJ5GVSBIFn8VkJKneuTlKz3kuGcIMjVVzPdtwss+2xJdikVn+m+eGqyxvVZdUjakxjCIh0RD8ny77aNnwylR13cdxlK1cjxdSwjpSm5gUrWI9+ER+2sXygBEkg0yaeS6a05jFUvHmVzS+xIiRDPbb4CH2uYoMOGb5PTWmZbAOyALZ7MN7b6S4fpHXN1L3cwCu7SzXXnbSKzHcLD9MtOVzbUrBnuFlyuW9EgIKGfoeHNUyymQCqWVwc6kNRHd+MZ5I55z2qYT8TKXR84sp0cnLXIuKO63rS1smwl0BIWMgVCydgt4cfM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDN1Xz98/FqKkXmOY2pxplpXxc8aFt7mDbeg21m2vRk=;
 b=nGz4PqAZrqw6tvOsJ+BdofvPbGGXQPXhMNcF9uqctBMMT/uVl7gYczvt710wu8T1juMxqgt9mKmcZk5BlmMjjdNlkpmqvs6qGg0gi1JREqDp8WWk7Vb9LtCAlOWMh3KZbHhp/RdmvYGOr87qJmQYWlyEKtoKSb65W8lII7SGzTyQcvK6fr2V5ao56IJdsvdzbiZtp2LU6mPEv8cbgwTuZ7PFr+3sTmiCBySw2g/mdJpoIlmWxgXP4fneSoiXda4/PPrXg4nozR6Fp8AeIKWtohQ2sB2fQ41PKM6DiZUudcdeBevVqmt8+UpaHWTE7f2mn+aLkUf/q4LEzKFwDSxoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDN1Xz98/FqKkXmOY2pxplpXxc8aFt7mDbeg21m2vRk=;
 b=JWwmZtrm3yrvmRJnrEhIn/xJbxtcpq6BL+UFrdQPGCvMQ4fwHhUIW+2dKMCIm0BCPM8/5ZxpTMh+GtlxqfFZMs3JjWKx4VJdw/nNoYBQoMY9w8kj5vRjvHZKHCpOyIOqhsvuVizIlDt5NfkQ73t5vXie8UVXaFfbfRtC8P8wTiJm2yd5udRJLjhL0xK1sOkHwMmY+kb3K3vzuZ/lutaDSbRA3oS36Ue+FAXa+G2yf2iJ9K1F5kIbbYL1oG0SpKYZtVIHI5B06e9L9LFTvs+inH1tXNkNCTKC+5Fv8DR/A4UH6kInvflNx2HVT6pbW58x4SqCYX5MB4NM71Of6Y5P+Q==
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
Subject: [XEN][PATCH v2] xen: make VMTRACE support optional
Thread-Topic: [XEN][PATCH v2] xen: make VMTRACE support optional
Thread-Index: AQHcVBJh32SIAsW070+7GZyMQ8BkVA==
Date: Wed, 12 Nov 2025 20:24:44 +0000
Message-ID: <20251112202442.3879997-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS4PR03MB8506:EE_
x-ms-office365-filtering-correlation-id: bbf0c264-22de-456f-7def-08de22298456
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FoHNpH3vTlZ2rvTnuyHL8YImM/CR0pYz3ug1sryA7Ow8fipqlovYrqZhf3?=
 =?iso-8859-1?Q?qGgVlrywFE3W7IgN8fxVqqSp5XjZaYbLTBv5loML5vrEB+Pd7oH4I6/o8S?=
 =?iso-8859-1?Q?6oU63D98iboD5qJ7SeAnBlDgNXxw2FxkhGOZ/PTGof5qBYWEhWGmKzACzm?=
 =?iso-8859-1?Q?pUhsrfXCFSALyZu0s86+5yeZT/Xh7oXwigc/s8VkM/w5XKaz8vx27yud1/?=
 =?iso-8859-1?Q?qLxAW6CmAS7YMJDOi5bXpLiCgMxlSnN7RmuXBGHxuMd31C0COUD/ParQty?=
 =?iso-8859-1?Q?ev9CWICUF0vAeL7rKbGi+AyYTjpEYA98i0rN3007kUjKqSBUVofzd1r61X?=
 =?iso-8859-1?Q?FfrQBj3FaEWqdM28RmdEGfMimgFF28FxjQ1Gxf54E//CWx1YohykX154wp?=
 =?iso-8859-1?Q?SJ4VR/G+RrEbMO9pnHydgjF2d+/DTmrGXOuXW7gSWKec2piEFU1vV6SlGd?=
 =?iso-8859-1?Q?HI6e6xhlDCuS30LqAZEmjlWAYKaeoQZdWQmBMjZSn14UILyDPHfgRSw+ow?=
 =?iso-8859-1?Q?8U+iNbKmgTGd91HNW2t0uo3UBjm5ZJitu37TkelmIg+yQUByxsXVxJRPLX?=
 =?iso-8859-1?Q?zQYm0YSsg/JSTxTSdVIT6juYARNOg3LpY384Nk6so2r7a1yHSYSCrpYgIx?=
 =?iso-8859-1?Q?8DORJKr/cN3LROoNg04GUUWk2xlOsKQdwYJ2Y/peuERHpmpVMKRvq8DuQk?=
 =?iso-8859-1?Q?OE9zBoqyKxKHWPPfYxFjeMyAHe5L1E6Nac+6k44zo6ljAjOOwR014b3vAO?=
 =?iso-8859-1?Q?4wEF52CHQQaZ3Hrm97V1CZ/4zEI9mxTdQFbBSQY3ZWUMkfREDjKxr6AYy3?=
 =?iso-8859-1?Q?I5UAcL4eIAMawIRNFZE+uVe7L7TQvGD+DXKFF/W4gONutSFthDdxc62eXN?=
 =?iso-8859-1?Q?5F4dlwVbYm2mgYkMlTOmkEVIlpJQnRKzYjUvhhY1VangdriVCskN13Xn+K?=
 =?iso-8859-1?Q?Yk2dCWSH4p42R4F9y0V3fzFGuXdXn+FXM7y5JIGQQWKUVpbwNYpuABz7a4?=
 =?iso-8859-1?Q?4gURuJjhOe4aKiKbvz35tIhj5Xtlx/pvL+CR/UZp3qj5AzRvGVsZ97/ZaV?=
 =?iso-8859-1?Q?KS7FCcYl+LL95KS9gKAEM7gt05ewdmEkMyaI3g564dTKGb2PHggweSWwD5?=
 =?iso-8859-1?Q?eMzv9NmjHtNYFXTwQjHaTNtFqBpcrok+uiKLqjGo5XWojd7qYOe5UZP0zD?=
 =?iso-8859-1?Q?fuYDbVUUQg3uQ9KbQ4iZh1bZV83Zxfs+JIX7pL4XFaIK8sY3MR4LcHJd0d?=
 =?iso-8859-1?Q?U7wyR/9I+wTR/wSVKEUE41vS2B6r2vrOu9nA0seg2kb8Cs8L4u73kJyeiJ?=
 =?iso-8859-1?Q?dXtdg1vvlQx0niZdrCR9tQxE6NDvZYkkvkekJ669t0txXN//cyCw+HX7g5?=
 =?iso-8859-1?Q?sza8jsiLx5V2WVfC5lIqbMiDUR/YN4vvU4f7LkKFxG0fCGrGRxAeksG23a?=
 =?iso-8859-1?Q?rEdy5nFzMX8AkgZuZuzsLHlA66PNlprkS2J6vRLwkyOpqMv3K1YyMULCEN?=
 =?iso-8859-1?Q?jV1Y8Xcc1aQdfe8uKwYshgKwiEOVHtPUbmi/7pae2ivrDWv+strFGa7e+M?=
 =?iso-8859-1?Q?Pmmeh2+tmB95yacyF31DADAiFl51?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dJQqOIHWs4Zbv2NukShPClhJOggd4rC1S49B0zjTyE/DYkf2NcQVeSpjXk?=
 =?iso-8859-1?Q?5z/bQf+YnN31ygd/jMwaYK1FfvpFqdA1Svc0gMhWI7aPMTf9yB26t6S2Et?=
 =?iso-8859-1?Q?KCVmZuztuhX05Rc9ELnVoQx/6m46iDAiDCRO4i574MHO1hKp9VIltzXU8N?=
 =?iso-8859-1?Q?HerrxbWBRmwQv/7ZhuHURRGwQx9vRQrPTTni30t1rFVvI4fw+jBmqbamoa?=
 =?iso-8859-1?Q?cLOK2YIfFjlfJbhX4RikdSOkVs7D2iR1Y7/5fDGPrjO9/4sscL9mdx8lfg?=
 =?iso-8859-1?Q?z2pHddQj9dc0SAey/AUTzeXmZ2kJemrwUxll2jgwmgm2DN/CWlmjf/xV84?=
 =?iso-8859-1?Q?5aesUJNoa0abnjRCMKMKVXTd2sbfxvpe0TrE3Tb8eaSDkGXKRjs+ajdYDb?=
 =?iso-8859-1?Q?zqfNcMxp1LOZ9zcgv9hxmNBD73piZXMsbuXmtVzfU6OuVC6/o0VWtmon2L?=
 =?iso-8859-1?Q?EaqBgd33k1CCvOyvozltmOFHYITQylJI4AvyL/HL/nIWr+sSl7ZfGuMtJc?=
 =?iso-8859-1?Q?VZZKv8G59M9+5uN69brdnuxhx7UO3j70QvyRLOeUr6T+SJ89B8Id9j+E8w?=
 =?iso-8859-1?Q?hMBeOkwL8dB+Sk+yJivX/ZSTb3Z3iNSfP5nWc90qHafuv4Zu0yB+DM1ymd?=
 =?iso-8859-1?Q?mxziWcHNK/czps+GbKewuhClBc1NGA07Dg+bWAQ/IF6JvgpAOCjKtJIQCP?=
 =?iso-8859-1?Q?zQSCtoCn48PLUV2PE8h+eG2NSB+c6QElfbd3ze3ZgByc1LvamXaB0dgTTa?=
 =?iso-8859-1?Q?un2qRCnqwqxij07JBUZJx9srhsihMwZO6XUlC9Vf8UG9su7q45ZO4HOJ/d?=
 =?iso-8859-1?Q?AKEzdwqC7OvarblBlNGwAc4qbL21Yi9RcL52METgAcFIJhuUe5UVzbHjOP?=
 =?iso-8859-1?Q?CaWNBJfG2/ZKePCgO3ha6/htYNlUXLNWqKwOC1NAMSh7vPNmxhqgE6n6wB?=
 =?iso-8859-1?Q?dyzocLyQfKSx3pIHQbV9cyiWSHH9YOmdk0cGdtQhNM1/l0/RtldpSgrUvD?=
 =?iso-8859-1?Q?EN+eL76+lVYeTlQ/A4cBzBOmLpyZuc1kIQypDWSEZNkDDygaCeZpBjCyzI?=
 =?iso-8859-1?Q?RLA8nt8PC5/jIgI2aIt28B7kQeptor3OT/qbhYG0b80+yTDfa2GHupfSh/?=
 =?iso-8859-1?Q?ys9ladkvPPs7PR6cD3yYRBr8qxlXjXBnPWgZ6vmR7tE+akSGbA3bmDOt1p?=
 =?iso-8859-1?Q?L3hd3eGj0EAcupLwfW3N7sxWQyQP6HtXXIKdYDWJYIPgdrmcv4La3LJOdw?=
 =?iso-8859-1?Q?rG8Um9qCncgkYslovcgGwd4jz5yNyFedyFgvAOVMPC3LXhASeX/dsdvuxx?=
 =?iso-8859-1?Q?EWk3UVggNfVEAHkwbjuvrY2hCchGgrr8GgTk18Le580G/qmpJLgJR9xSp0?=
 =?iso-8859-1?Q?TSxb1veHZYn0zt+C++G3Pp5d9dD+kGq8eNw4qKhnITo0ETbfd7Qlm5Taea?=
 =?iso-8859-1?Q?dNY5E5Paag664F1yDASC79/xXd0kAtt35i3MipvwHEhwJnd/xL/S1ceF2x?=
 =?iso-8859-1?Q?WKi6i41wpuLI6eziXYCxkMqqyMcgjE7vXz9oRYdYmaahrZCNrGTbbmmyfP?=
 =?iso-8859-1?Q?9ByLayRlMxwdaOrwuupLCb+5fKNs7eZviP20NKjK2te7itqyOdJcHkDcNi?=
 =?iso-8859-1?Q?VbIIUd3m3F3aBHVCO/ilxDqHlikAgL0Q4RvCQsk/fUteAS4v+w0pnyrg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf0c264-22de-456f-7def-08de22298456
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 20:24:44.2242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOHRy2lgcMw/WnBzFXI3UdIOdeND1zyyKUnVuja0wbh8odI3K631wGqa54lcMpJMuhSm6tyAfSOLpefd4FCcSzVBdNid11OFk5AI1FFHkwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8506

From: Grygorii Strashko <grygorii_strashko@epam.com>

The VMTRACE feature is depends on Platform/Arch HW and code support and now
can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
This makes VMTRACE support optional by introducing HVM Kconfig option:
- CONFIG_VMTRACE to enable/disable the feature.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
 - fix comments from Jan Beulich
 - move CONFIG_VMTRACE in HVM
 - drop HAS_VMTRACE
=20
v1:
 https://patchwork.kernel.org/project/xen-devel/patch/20251031212005.133821=
2-1-grygorii_strashko@epam.com/

 xen/arch/x86/domctl.c                   |  4 ++++
 xen/arch/x86/hvm/Kconfig                | 12 ++++++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c              | 11 +++++++++++
 xen/arch/x86/include/asm/guest-msr.h    |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      | 10 ++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
 xen/arch/x86/mm/mem_sharing.c           |  2 ++
 xen/arch/x86/vm_event.c                 |  7 ++++---
 xen/common/domain.c                     | 10 ++++++++++
 xen/common/memory.c                     |  6 ++++++
 xen/common/vm_event.c                   |  3 ++-
 xen/include/xen/domain.h                |  4 ++++
 xen/include/xen/sched.h                 |  4 ++++
 14 files changed, 75 insertions(+), 4 deletions(-)

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
index e2b5077654ef..66367adf3393 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -619,6 +619,7 @@ static void cf_check domain_creation_finished(struct do=
main *d)
=20
 static void vmx_init_ipt(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     unsigned int size =3D v->domain->vmtrace_size;
=20
     if ( !size )
@@ -629,6 +630,7 @@ static void vmx_init_ipt(struct vcpu *v)
     ASSERT(size >=3D PAGE_SIZE && (size & (size - 1)) =3D=3D 0);
=20
     v->arch.msrs->rtit.output_limit =3D size - 1;
+#endif
 }
=20
 static int cf_check vmx_vcpu_initialise(struct vcpu *v)
@@ -721,11 +723,13 @@ static void vmx_save_guest_msrs(struct vcpu *v)
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
@@ -744,12 +748,14 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
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
@@ -2563,6 +2569,7 @@ static bool cf_check vmx_get_pending_event(
     return true;
 }
=20
+#ifdef CONFIG_VMTRACE
 /*
  * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_=
CTL.
  * These all pertain to data-emitted into the trace buffer(s).  Must not
@@ -2705,6 +2712,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
     v->arch.msrs->rtit.status =3D 0;
     return 0;
 }
+#endif
=20
 static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
@@ -2877,11 +2885,14 @@ static struct hvm_function_table __initdata_cf_clob=
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
index 6f174ef658f1..e59d91ded63d 100644
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
@@ -735,6 +737,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *=
v)
 bool altp2m_vcpu_emulate_ve(struct vcpu *v);
 #endif /* CONFIG_ALTP2M */
=20
+#ifdef CONFIG_VMTRACE
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool re=
set)
 {
     if ( hvm_funcs.vmtrace_control )
@@ -769,13 +772,20 @@ static inline int hvm_vmtrace_get_option(
=20
     return -EOPNOTSUPP;
 }
+#else
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
+    return 0;
+#endif
 }
=20
 /*
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index ecd91389302c..24fd3162af40 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -146,8 +146,10 @@ struct vmx_vcpu {
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

