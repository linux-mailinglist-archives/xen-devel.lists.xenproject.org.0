Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CCDB1443C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 00:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061979.1427592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugW7i-00021p-Jb; Mon, 28 Jul 2025 22:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061979.1427592; Mon, 28 Jul 2025 22:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugW7i-0001zW-FF; Mon, 28 Jul 2025 22:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1061979;
 Mon, 28 Jul 2025 22:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugW7h-0001zQ-3U
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 22:15:09 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51274088-6c00-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 00:15:06 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA6PR03MB10244.eurprd03.prod.outlook.com (2603:10a6:102:3d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 22:15:03 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 22:15:02 +0000
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
X-Inumbo-ID: 51274088-6c00-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyVU9jnQonxcSjMA2jsMS79MuwX45+qk0kcVDEe4qSy2PbFGmqJkg60OMFo4g7KLaULGpqwCbeRPnt4SbLul7K+s9LBlMlksOVCgl8Eys4SPL+KkZ8rMUW/ECeTHRfGHtX7BaHhpxNvVFhpCjMnz2dryo6HfAx0X5VT5jvjGmXDDrr+HsTa7IeWxTpl/XfSaYhjCtwIGXaTjOrFwuyM9r3V8By5ka0ZqZaW6TKKRZ4OR0x5rOdTcQpzpv3l+TyDT2b4h95HYSGj8OzeqkGyPjwRuKKqXDXcl5S0VKRC10Q2l1cbC+UVHNty0n3s6XW1aN48bbHTtAn5396SWmmkWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPdE5XEh1lmOM8CGOCe1XMb/1rdRrKm63xpOavuKZUA=;
 b=t8PleQNQ63TM+hQZz5LPrAY9/7ECHByqm6P9sl+vzc7CRjGtUAJ8y2aYMrWyqg4741MOJKAihmaNsbC7nerBxJDTXhpu+J8xkTQ3x5OH3/nMhjBhWq5IhaXTVbokrA9RmSRSL6sQdh6zwX/Fm6DnZMzx227jNVEvefsbprh2DstyU0KOCIVZUZtvamB2Yf6yG3NfuOXGBMVQvckAENSQzOFlXyufjJb4Lkl+qNG1JY11/mA9tt+MNy9n1nXeO+WswfRGSEzorrkMefqCvb7bxLuLa9DIieTgkFNYocnwef6ezU5KI71bmubIxkRPtPz3AiAIrKaS/dozz1UwK7DWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPdE5XEh1lmOM8CGOCe1XMb/1rdRrKm63xpOavuKZUA=;
 b=M+2xzEFUQFeeniR0ML13+MNVYGj+tSNxSSmOjXhutxRN9tSW+VqvQ5RPxUnyyxnz8GW0Bisln+vA/QYyGXMkmr0cfnAAFIulQvwjEXW9Ni2yEIKchrdWzxRbvLRmimnxGdmL/NoVR6jKYlAgYO1TBwpDXtPsES/hKuV0MiEVACRZPhDpbbG++Ipr0qmAhccMApWWObn99cJkwFIVUkgQCcqg7LoK8le/B68gF4wNdg5uDU8IZzA1CMzLbB6eANzypKX+s4L/ecXb+BKVWM5/MwObOO2zTm/4w8nJAl0DOQJg3Vyc2gVrj4Epq5/txtLrSq8yPk2HV/Ilpph5z6QXHg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra/eclair: set 'noreturn' attribute as safe during cast
Thread-Topic: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
Thread-Index: AQHcAA0QZaFBUUSap0maTjLkZJJTcQ==
Date: Mon, 28 Jul 2025 22:15:02 +0000
Message-ID:
 <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA6PR03MB10244:EE_
x-ms-office365-filtering-correlation-id: 39520472-f566-43e7-83ef-08ddce2432fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K+ulHRQ+0GXvexrIGuaulVXv/ZnfSZhCtIYpd57TqEvY+SpXElB9YbAs7W?=
 =?iso-8859-1?Q?6pRhNtI+WgONdTHxQy1Kh2NR+WOJdoBBv66v/w+/hR7/wIZULiWGL1lG+o?=
 =?iso-8859-1?Q?SUo2SmtO/IGTpTzg9HGVEBSebh0YzKdwT1kvI9PR37MHagVbyZTYhxjrJT?=
 =?iso-8859-1?Q?cA4O6g3EdkQYa4C4bo9r5DM+u9zCtxBYgc+v+MF+gCV5qR7On+xpwOpOEx?=
 =?iso-8859-1?Q?mQg2m7tCOg3C5a11e7a1ciahsxXWL7Bc/DKfoW9aMlXZlmCkQSpCLsV3PE?=
 =?iso-8859-1?Q?G94LYzwYFVTu42D6yt/BolbfVr/kGPJ3AszUjMQbdIsG2z8zAhlpBgjfPC?=
 =?iso-8859-1?Q?1a6D8Io/+0+AIAiwxr40aybqgWCM9f2yaZ44R5zrqTG/NCLwG2mOwE2ehO?=
 =?iso-8859-1?Q?ZMYQvTwovjrDd3AxS1rBN1JS5PiGGyg7DK7ZHrjgGgi6wx8uXJCL/6vedN?=
 =?iso-8859-1?Q?gOv7f67lVi7tZaFanI2kUEJtK3FxgcOHakJEFacxPplmpb300FhIjCmwpP?=
 =?iso-8859-1?Q?oYK7O1mDOC279IbxmBUBy726I0tf+W9qmo/EirCxFjvYRmk1HFb2idKmx7?=
 =?iso-8859-1?Q?Kn14rWcI+wVnfdNKtcClCqAlHDXbgh3UMaaAHohw0m8PWBDFT8CI0vJPX/?=
 =?iso-8859-1?Q?BO3PEVBj9Hwe9PkOFxu4Z8u05+3dh45uKB1AR98Nfmq24GuwH0CZaHZUH6?=
 =?iso-8859-1?Q?WE+0c3q6xL92amNZMnxnTsN6PUc00+slmpfb2lpOWngpuangGqhjNI2+O1?=
 =?iso-8859-1?Q?CXrxkWk00ed4lcWTG23x+sI+xdJZX/opRr7fsQ9JWKUf3dK/aWwe+EXib6?=
 =?iso-8859-1?Q?4z10BvE9F/Jtaicv8pkSi01ZgAQaRR19AHHL649lrcVVMZPvXR9sloC62X?=
 =?iso-8859-1?Q?097ie8Uao29xjJS2B4ID+H2VgTOEYwbX8papNxyrimw9khS4X7WYIS50WX?=
 =?iso-8859-1?Q?o0ekCFfqQyzJryCuR4ZuRoaXkYKHsi1on1S+fNZubjt+8Iam9As0EmyOLG?=
 =?iso-8859-1?Q?MaEVR2tzA/Cj/agaGSWAxGD72gxODFgkk/hg/C3q8qRk48sJMbufzlx9HM?=
 =?iso-8859-1?Q?D95UWEdv2o3BR9/ay8ZcMyRmy+t95zJ9ylE4zw0ytjDBcyDXJfDV4tYw1B?=
 =?iso-8859-1?Q?EtGANtCGiCXgSzoDweelfKMPt2/47jUXcLaZ8I9+WIISvsq53VJHH1PQ9f?=
 =?iso-8859-1?Q?zy/pg1JYrjgl0txUdD8JuPKe9hhQ6Va6eZu5fItTRWimGWGtpnYEpi8nR1?=
 =?iso-8859-1?Q?3/1jLzr87Kj9X286JqAysrElES33fcryYeD61yh3U3yjxChD/3HOAJvIXH?=
 =?iso-8859-1?Q?0oPqgDcy7UUGbchVvKX6gCwuKDKJ+IH/kAVVFgsGdmXgLcFjj3iExRJKvW?=
 =?iso-8859-1?Q?HOIciH44vMyX8A0zSR9luNqJjaE8F01oyUJRiMtEQT+zI9lZ4UdGsPANsl?=
 =?iso-8859-1?Q?qWINuVSKgyKXzX8x4eZZNXnOKNbuUxyCR+1F9upQQtSByg5dY+iaxt+0XW?=
 =?iso-8859-1?Q?Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yxZTYLRloccFrY6jWxD9VFfHhahMhDZejt3eswvznJs8eS7sgdNOvQUWHG?=
 =?iso-8859-1?Q?QPHRxWYRSR4Nc3uQh3yHjl/CFSnpqrvYYeLhLLD/B2CBwfSwt8+Cbd8xK2?=
 =?iso-8859-1?Q?YdgjRHtBd6Qxdm9w73CEN/fgkqY0H6Dv1iDdbx+hyF1ynRDwlvy2FFzYK9?=
 =?iso-8859-1?Q?dWUtpyYt0IULGdvkO7+deVaFCVlvmvLlZ544ICgknfaKOsVYu7gaLFnn7e?=
 =?iso-8859-1?Q?zF5f78vN9ZXoWQSISSR57ZRgRd143KI1RFgqh3lpTaPrecFlAbJsIfqQSC?=
 =?iso-8859-1?Q?bigtYnNy25V9PNZ8oQzJtY+Sbc5WxSHbBFulf99qL+al6EmTxr8H1xwXgp?=
 =?iso-8859-1?Q?QDGyi3V0NxDINySXyAoQeev9JdXISkh3zoz+sNqFUHZuxrUCtcMWp0jdWN?=
 =?iso-8859-1?Q?BIpLrkRm7oQFHMXnpOhK4V2heRn08EjxReGq/9LrH2/6KpBk5Ngn5JrsTv?=
 =?iso-8859-1?Q?NY03wk4EDqdURVSvyCeUcvv59nlw3euB1cd9LNS/mjBgj9s1aBoWLPo71e?=
 =?iso-8859-1?Q?RkBZ/Lra/b22r/mL499JBOxh0CivZH8vFxr/aOD4NdZBeI6Aw8mDLdYFQY?=
 =?iso-8859-1?Q?K1Abbqhwhoa6U1uxy2InCw5b/G/eirn8MLt5wtMSOsIXqzU3wBh7hGiAU2?=
 =?iso-8859-1?Q?iS+uVCinYEVmKMrS19gXpTGpIDnguS4Cv2ZqujeINbPYZXf/+fgvh1Z48K?=
 =?iso-8859-1?Q?JlVed1QVn5vndDqrJJALopfvht5Z9umoH2FmARAxMU/FGq0iRIWK6d9oO7?=
 =?iso-8859-1?Q?1ezbBHCPuN/Jcq6Kqcq+TIyDIELerHNW6iCGoiQnuVUkCgFGSSZf08dy4C?=
 =?iso-8859-1?Q?xapcZPyUlcA5Oak09mxugd8maLtVfCkkcGT++R9TK4tGOtalcz9J3XvOQw?=
 =?iso-8859-1?Q?47vdqcByCVMAM6AxwrQmFlZP8z6w5jAbzqB4PyLATb5RzwUzJ5X1M/NfH2?=
 =?iso-8859-1?Q?42UQ8oh0PhaHQ9boggk9cZ0WrLqsGLXBosEFRMyMq8OYnqQaKHMGLl6xbE?=
 =?iso-8859-1?Q?56qyK1mGIOI/03taE8erRzF2N8ypc0C1CwIookaWQYPeSJGskT1vobf9wg?=
 =?iso-8859-1?Q?D1uojDiUyQeHrU39K5SxYjzerm2mShzkzAX7mAES+aXnsSk2GRgda6fWIq?=
 =?iso-8859-1?Q?LcLvdhlkHmLIBHYdKS/sVrcYi8vFtSU+zTgxuCl6Zhrx5V5SddGQNmEAk/?=
 =?iso-8859-1?Q?tOtaQcsmgeUi5iBNDvbXILFE/idtyRXpjSWRy7R1vjsDLNhNjbRGYFiIK9?=
 =?iso-8859-1?Q?IDZfaLLQwbge5MgmPMSOJQKqxyGkuv3oxH+489kmVHTf1Vi9GwhzvEJFN3?=
 =?iso-8859-1?Q?SvCFdCI2BqnZVIudh8BTmfNAFBH0WUqoT9FtqtVv0/pYKhnjP/ekvKEGU3?=
 =?iso-8859-1?Q?ri7JPJ33l+ud57liFRgi5LpBHEAsZMsNgZPwjOMHjixr7uUPVDqDFrsNMk?=
 =?iso-8859-1?Q?neoU/Hrde03pWVp1IcJ/f+W07cgl1A+53QHp9fMIrO62YXIBxWmhZ9CGod?=
 =?iso-8859-1?Q?rOxRHagYp2Vsw68pF5HIRm415ZELpNZ8PFFzF3qELUWyQXkqdYf/kUMyQg?=
 =?iso-8859-1?Q?Q/yiDnsQCMOFMdHsLLx1raQg4z519q7Xj4Vpl86StxXCmoJxly/N/4nvzI?=
 =?iso-8859-1?Q?aQTw44l6mYtrkHFmaA2JDXiZueDARUjbeGKD3NuG+gFCbeltu/jDhN9g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39520472-f566-43e7-83ef-08ddce2432fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 22:15:02.5643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /N6+4nRd8GrwI8ykER/k8BneBx/kvA1LIUWsiPrc2KYMuWst1at/AKZAXM6JkntTGGyVxWV+uMcHn+2hbYU8PzK/Bawo7YajDKEI4YLJcsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10244

ECLAIR reports a non-compliant cast due to the presence
of the 'noreturn' attribute in the callee function.
The issue occurs when casting a function pointer with
the 'noreturn' attribute (void noreturn (*)(void *))
to a general function pointer type (void (*)(void *)).

Configure ECLAIR to treat 'noreturn' attributes as safe
in this conversion.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Previous discussion thread:
https://patchew.org/Xen/181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1953370442
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 6 ++++++
 docs/misra/rules.rst                             | 3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..0e04681c4c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -367,6 +367,13 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"The conversion from 'void noreturn (*)(void *)' to 'void (*)=
(void *)' is safe
+because the semantics of the 'noreturn' attribute do not alter the calling=
 convention or behavior of the resulting code."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
+   ref(property(noreturn)))))"}=20
+-doc_end
+
 -doc_begin=3D"The conversion from a pointer to an incomplete type to unsig=
ned long does not lose any information, provided that the target type has e=
nough bits to store it."
 -config=3DMC3A2.R11.2,casts+=3D{safe,
   "from(type(any()))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..4e430bb17e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -342,6 +342,12 @@ Deviations related to MISRA C:2012 Rules:
        semantics that do not lead to unexpected behaviour.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *=
)'
+       is safe because the semantics of the 'noreturn' attribute do not al=
ter
+       the calling convention or behavior of the resulting code.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.2
      - The conversion from a pointer to an incomplete type to unsigned lon=
g
        does not lose any information, provided that the target type has en=
ough
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..82a26162a9 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -404,7 +404,8 @@ maintainers if you want to suggest a change.
        function and any other type
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to
-       bool and void* are permitted.
+       bool and void* are permitted. Conversions from 'void noreturn (*)(v=
oid *)'
+       to 'void (*)(void *)' are permitted.
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
--=20
2.43.0

