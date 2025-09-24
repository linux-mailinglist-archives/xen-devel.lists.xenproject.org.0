Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A22B99636
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 12:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129242.1469286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1MW3-0006Yg-0r; Wed, 24 Sep 2025 10:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129242.1469286; Wed, 24 Sep 2025 10:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1MW2-0006W7-UP; Wed, 24 Sep 2025 10:14:26 +0000
Received: by outflank-mailman (input) for mailman id 1129242;
 Wed, 24 Sep 2025 10:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXxj=4D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1MW1-0006Vn-Cz
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 10:14:25 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e066a39-992f-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 12:14:23 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9931.eurprd03.prod.outlook.com (2603:10a6:20b:643::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 10:14:20 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:14:20 +0000
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
X-Inumbo-ID: 3e066a39-992f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krCuK+3v9RYXOsfcQ0DdZRaHdsK1q4uFb5hYTzQzKUwLob9/IEcAyzyNrEvw3MqLZ0EFUIH56OuR3KaekYkUjW+sNDMgRXGqk4ojbgzDUKh08OTZcIleSaP0+KLMtvGtIrVbxXz9ayUzbWNySle6efcifQmKzQxtINah+H7SUhVL4ctov3+pTgk+/E3VXu1de/5EZGehMk+RBli88kgRZ/JdJiiTHwy1S8Hb6Vp7GX0dW4ZgPAaIvsffK+O+16zuR93LjR1Wsl7WGbNxrIgnsIRrQCUkNtJdN3ugTYonP/yZmj0csvnlLqbjPatgbo6ZQ++M2zULPAqtUB3A4HCH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLmc699oXlLG5mSYjMYHmCNDmt537LCCPHJmUJDwiL8=;
 b=WL1Ldt6ym2doOHJiaAOTZXj+bIDK2RIRALpwF7jJ9lSX0izRMw4TSkkUjw4h7e7sIn5BFJ/3Xm9ZLqGxt4UnRSdaHlX+0eSrlxBTn5G2gRNvkXbvk26q5YS7rKkCjBjGfZv6lJJARjP7pSahazuH9IOWXDAwklNS87/dTqAUP1vbK94aSwvEluk4M7DfBiJs7dIvYPPei5abuQeR7wkisPTFgkshsulEGYmKj1q9vM6A/D+OoTuQgIKD57lfAJU3fmuFPT2Lu+5j7/LmRtQYdwQeNgKWz/eqpHZLnfmtEp5vxamlCiFR9O+R39l8BtOqo+cMNhI1A8jZO4ISjhQiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLmc699oXlLG5mSYjMYHmCNDmt537LCCPHJmUJDwiL8=;
 b=G9Ts0yIazJl5kKafTR0fL7R5D9q5YrFt5p9WEATtpzGFu++lR+UfYdFqEDMpvCCdZ2nqmqb388lF/KCpHpGjq9mpAv/bQffnKtVSV2tl/Ljlvzd5sLOdtbQpdPP6yEpmLQVqMXfr09DMb342BD/4NVfpncd6g89bZfZUK6Hp9jKxXaJaauqtfxUwjgT5eV207tET92tdOSbkpVHr2AJVgMOPyOHTDKh7CNdu7jfcnbaREHPKCqtf3ky9p/jxhiFG8UzrKm819anC0CJGhwjyaGTPrXn2jwiCLz/KkTW9aRxfYV8FBHqpL6FjmU4/nMeKtukkutHPJzHJHBRfIhNpRg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
Subject: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
Thread-Topic: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
Thread-Index: AQHcLTv95iVXlAGVVkGmfKuqtAYpwg==
Date: Wed, 24 Sep 2025 10:14:19 +0000
Message-ID: <20250924101417.229108-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9931:EE_
x-ms-office365-filtering-correlation-id: ca0bd3e8-64aa-4e0e-b9f5-08ddfb532040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ggUGvNQDxnPMCQm4fOf/ir1FIxeqma6QyOaJhXSq+DAET5MQdMSHYSNk/d?=
 =?iso-8859-1?Q?0T2a+KyHF8V13i783Nf2On2kttzA+QAcyuBR2BaJnSuLemegKdpOczDuaU?=
 =?iso-8859-1?Q?O2zVQueP9j1dVXb5A324NE3Rl1DdKbu7l6wY6DvJQlwAe2+3e6+Z5BKSDo?=
 =?iso-8859-1?Q?VoIhGJF4mPgkEFsn+P9dqFj8Ukm5HhRYaEf/MfsrrL1FiKApNsdhMaZvVh?=
 =?iso-8859-1?Q?cAwHOmeNtZ/n5XAGgMiNvDU97OjULA02hpeY08n+NPRR6SzmEQ8Pk/h9iW?=
 =?iso-8859-1?Q?azk3xuHEGb5mxGi0vSmx0v+mwJakpUYjpiv/Cukfdb9PavQmtcg+ldIbJi?=
 =?iso-8859-1?Q?9V5ha7XU1epx/V48FXqt5m8TC/Ka/TXNTgjASM+zLa7l/9T64hrmjb+qxb?=
 =?iso-8859-1?Q?Xi9KJ6FE7k+IDDzgE/6iZr5Mtonl3EFW48yNNIr+d9fZMyHgZVvDtYk1zU?=
 =?iso-8859-1?Q?eKD0UBi9sBHBsvX36CJe9iEV/rwYzAo/EgwT84rHYnI8Vzz5idDBurX8QE?=
 =?iso-8859-1?Q?nDAYCm50ylYwBr1knZazqYg8a29pLd0HgHUfbLZgmaqEvz4terKu1hjnS1?=
 =?iso-8859-1?Q?4LRaY5vpW3JBBOxp86y2gMNNUq1pHxfaewWt7FIrdEf+Ui+SnLWsn7uYpA?=
 =?iso-8859-1?Q?swM9u7iL9n2pyJ7xlyJ4zhfyS4q17evSv6tys/r/7MIyMhKrWi/ohGHtSl?=
 =?iso-8859-1?Q?C5NrYGFZJAUh0vKjbh6GAuNmixNTSTAbRSviffoMzZCjs1SKyrxfPe3pSn?=
 =?iso-8859-1?Q?8aH3Uiyn5D/F7oXDeYnaaFNrNbbfyOJ2Am92PqYCWNiqeTQIFHCDi7YwSW?=
 =?iso-8859-1?Q?GfaHsnbv12auGhDeLxJ28RR1B7dnZE1RKV0z6sU/v4qlxhfIDiI9QviesZ?=
 =?iso-8859-1?Q?VhmNVxZiboAh9GKQxhfhn1aFNo0yHxCpU0j2zrKBDIRKSykuQB+ftijNL7?=
 =?iso-8859-1?Q?FrZ1lXRC3QRFAs0AsrL4eCWtcdF0yZFisp7BxqeCgmTL8x7P7xh2VcOTwj?=
 =?iso-8859-1?Q?rXSKnR76FiyMVaIOixnQ6xCgcYfOYUjVywOtbRb2jUheXb8VqTSZs5L0jo?=
 =?iso-8859-1?Q?ixZy2CdtuuAZI6tH6AsNI4rNlVQoLvFamTxs66Wh35CxVsUoX/CDc8ShM2?=
 =?iso-8859-1?Q?4vFeWYHcGAwLLRFiMuhm40Zm8h/vFiBJeKUFFub1uXBvvjqzcIvD5LpOJa?=
 =?iso-8859-1?Q?a0ne9MOWjOBfJi79CcwcVn/oWmIC31hGFrGDc3Z9b5V8gTYCEc+MoVrmXF?=
 =?iso-8859-1?Q?eLZke9eBSY1QtNtQ05OnA0ZQvRobfejhUjdVZdrAG4jkgHN6DPhFCyhxnO?=
 =?iso-8859-1?Q?lhvqiPYb96jGM/4xiycWgrv8vgjDq3L8CkS2m6Wt7Q1ZQij710qpOqbGJv?=
 =?iso-8859-1?Q?cvTR2oYZ3jTPjU/Y3iDUAF4+UPIxeybsrL0eYMJ9FG6x9+oeIr0sEJt3bn?=
 =?iso-8859-1?Q?GLP+NQ57By4HC75ljyRvLrbBAjNJEyQhLWoGZHIVZDGK7zEMo9a0HD7BgU?=
 =?iso-8859-1?Q?trcHC+IoZkbdMuQzvgQaPq5M+Y6T5/yA7hA2ZuXkXduw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VQc/memkJ6zhT64ptY/WueAORZ88YTW6jqPxfhhIAEYC6bjJSC1YxBNRIx?=
 =?iso-8859-1?Q?bHL25TzoAhaDzB1EocABU/cnEgm4XxooZey/B01jJ4BAoI+3Y3IMWaQjfc?=
 =?iso-8859-1?Q?h8MNANRY7ZZ3UwUi2qpdmfy5kx3xHKYxmRPDaXTzSqN7W7q7uWGruN/jV9?=
 =?iso-8859-1?Q?Dqcq5zVjylEjp2K2GYGiIPfgf7ce06XfCOPk2QwBF8R64NzNMbIzZtbzAy?=
 =?iso-8859-1?Q?sCrolt3a1XC9PoW7W/61TjlOONdj4mWnjOYsWl+pFAxmfeJGWymTIUZVpG?=
 =?iso-8859-1?Q?ypa/HQfKOBgOBMd7dQN7Fc9qfkjks+DBcxr3ZRs6SzdCthBUFS5VIlC4pE?=
 =?iso-8859-1?Q?FXXNwG7yt1RZzLOz40Io/BGsxbQtjMDarMKWRZB5j1o4LH5Bx9RC39yyZy?=
 =?iso-8859-1?Q?dzSdqP06Ez81Tc8Q3qMMEhJP0grJBIsUF6DEeNGIz8QtrCig7sHVQ7KNJ4?=
 =?iso-8859-1?Q?Bw1NzwIQhcr89l+xJnEj1aoLl8VUb/vU/DgqE0Ly1sZ/271nH8xyBd+Vnk?=
 =?iso-8859-1?Q?p5nD6VNu6BPth06jKAMNKx0fRnPsT17IKePQIO073Oe1KQbGH+l1BwKmBn?=
 =?iso-8859-1?Q?JuzOc1CPKkxuMLtP01s96RRl8XAaroBmaPJQml2bgda4r+PdgRO9yCnuuA?=
 =?iso-8859-1?Q?7nQTRsin9RRaodVgoOZadQuMOyRH1LXUvpwtALKJ5fsXav8ih28SOCAl1w?=
 =?iso-8859-1?Q?zdTvr4cglVi4RCmvL4RCGcbBkWKjur47XshBT0u0YqShp0d/J+7zR0Kcq0?=
 =?iso-8859-1?Q?7H0zZyZBFJmO8h/6pJkwGlE6sv9Px9M01odY7xU1XQzNL+xm7eNe2L9nbT?=
 =?iso-8859-1?Q?yHT/Qt1nd1tCffiGb+6Gu4e0bQMvMWp0KVmdPm4B4Ot4fT2m4StYoHuIkZ?=
 =?iso-8859-1?Q?uYLeZv79GtP0aTjvOf2LLYvgNJmOR5CbNIaENAvTIMbFOn6Fwc2gQdc6dt?=
 =?iso-8859-1?Q?qqhIaZvnd/6UtPxoxmp/sYsW7e+ns1bTXUbDZfalT0o1go0icQiu+F4Ucy?=
 =?iso-8859-1?Q?Kusm30p6ImLRRvea8Z4nygZxg5ogN1KwLxYBpPEI4j+Q//TyH8DjXy1UV9?=
 =?iso-8859-1?Q?zagMFE9ZkuFtNKfT70b7gQwuhGm4k+IAMQ8OhbQbBRvYznktkzP7fL4k2G?=
 =?iso-8859-1?Q?necE8lT10phftBTuGuDromPJEZPqCErb7jTXjQHULdGhEjU0H8GP7bTek0?=
 =?iso-8859-1?Q?IX0bj+4INjNFyyADEat7nbbEZVmXxOYfSse0bmvdHjFzCWHlD7LycTHN9x?=
 =?iso-8859-1?Q?uI0MCsHn8dkenodLKcGhL8pWULieydUuK+7zDCHjUcnOcPYr4MKK8Gk4e7?=
 =?iso-8859-1?Q?vITYGQPMOy/2/5cQyqqnRCcIlhZHJVgIjUUTmbYAHCvTdRrfyTghilAhDt?=
 =?iso-8859-1?Q?YA/o9Do788Mv+IxZBTd3aol33nhDc+EGPtcyH47JUDWWD8Y8CivgVs+LsV?=
 =?iso-8859-1?Q?TR95XVBtshbqNZNCCm1KKPxw5IBd1Syd2b4QWLAIbD1IipYmnpWulVQuLy?=
 =?iso-8859-1?Q?Bi3nV8X+BnMx8Y5pGIRdK9I0bOKe1aGy9lccSCa6PqD+E1+DFmypA0edle?=
 =?iso-8859-1?Q?ovjqvLGyqQwCdwfyPUQC69hIzEIKQr4IQCpQTI9Mrwg6mZfbqlJhoNCLnO?=
 =?iso-8859-1?Q?CwBwIfXvPogbEfqwxvcw6ksZQ7+ne0XaR3+iUUUVV4IbD4BvjXxPAuPQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0bd3e8-64aa-4e0e-b9f5-08ddfb532040
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 10:14:19.8348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15w5fESrl5SDYmtDoeYRZp0evUtuEaPBHeDfQ01FXmXuBVTsYSETvpwdXYepbc4hugvJkph5y1f0UWOD5mCA9b1zYxT3lhrGz2rLKvFgw8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9931

From: Grygorii Strashko <grygorii_strashko@epam.com>

Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
HVM Intel VT-x support can be disabled, but it still keeps VMX
code partially built-in. Particularly in HVM code there are two places:

1) hvm/dom0_build.c
 dom0_construct_pvh()->pvh_populate_p2m()
    ...
    if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
    {
        ...
        [unreachable for !cpu_has_vmx case]
        rc =3D pvh_setup_vmx_realmode_helpers(d);

pvh_setup_vmx_realmode_helpers() allocates memory and configures
 HVM_PARAM_VM86_TSS_SIZED
 HVM_PARAM_IDENT_PT

2) hvm/hvm.c
 hvm_set_param()
    ...
    case HVM_PARAM_IDENT_PT:

        if ( !paging_mode_hap(d) || !cpu_has_vmx )
        {
            d->arch.hvm.params[index] =3D value;
            break;
        }
        [unreachable for !cpu_has_vmx case]
        ...

Hence HVM_PARAM_IDENT_PT/HVM_PARAM_VM86_TSS_SIZED are used only by VMX code
above code become unreachable in !cpu_has_vmx case and can be optimazed
when !CONFIG_INTEL_VMX.

Replace "cpu_has_vmx" with using_vmx() to account !CONFIG_INTEL_VMX and all=
ow
compiler DCE to optimize code.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-604 (-604)
Function                                     old     new   delta
hvm_set_param                               1602    1473    -129
dom0_construct_pvh                          4438    3963    -475
Total: Before=3D3567191, After=3D3566587, chg -0.02%

 xen/arch/x86/hvm/dom0_build.c | 2 +-
 xen/arch/x86/hvm/hvm.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 5551f9044836..5ac2cf8394d8 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -473,7 +473,7 @@ static int __init pvh_populate_p2m(struct domain *d)
         }
     }
=20
-    if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
+    if ( using_vmx() && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
     {
         /*
          * Since Dom0 cannot be migrated, we will only setup the
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 95a80369b9b8..70331aeec9a0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4302,7 +4302,7 @@ static int hvm_set_param(struct domain *d, uint32_t i=
ndex, uint64_t value)
          * Only actually required for VT-x lacking unrestricted_guest
          * capabilities.  Short circuit the pause if possible.
          */
-        if ( !paging_mode_hap(d) || !cpu_has_vmx )
+        if ( !paging_mode_hap(d) || !using_vmx() )
         {
             d->arch.hvm.params[index] =3D value;
             break;
--=20
2.34.1

