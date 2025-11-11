Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39FC4F550
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159202.1487622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZW-0001av-4I; Tue, 11 Nov 2025 17:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159202.1487622; Tue, 11 Nov 2025 17:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZW-0001Yq-0T; Tue, 11 Nov 2025 17:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1159202;
 Tue, 11 Nov 2025 17:54:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsZU-0000bw-2R
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:54:24 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 744a069a-bf27-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 18:54:22 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM0PR03MB6323.eurprd03.prod.outlook.com
 (2603:10a6:20b:159::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:54:18 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:54:17 +0000
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
X-Inumbo-ID: 744a069a-bf27-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGtbIXYXG46U8/BoBTsjcxQALLYUXHtoWWvCrY1012tU3SAKS9yYFDYR/m5A1X4+UAmQ9LHAAspePYZLj8VZIVjniT124pD7w5qmSdLyyKel7QQrZTWzId6m7NGvXv+PDljUrUE+YZMqJ7zQmghGb2YgcwiwK0WX6BKW3vThXP4C5YX6PHA4N58QY4zJTmFfmHUdHC10aLdjBJqzHODbzTBMCnhmqAopStyjwuYkFRCdZ+qP9y8i58DWbR4QrBVruKwk9ic6PPaXmrvQzNznN4b3K5P8PjgZbIg0m8q/Phu49/pxV2Y9ITSIueSI3jxoU2WYEWiY/5S+ERP2cpCqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS6MnFghC+Qj7tFhTma9PYKjRin7yKtaSHIg329odxk=;
 b=CpX1xtXE/cBfnmVVwcsu5Bf6PWC0BvHHz0tFleQ4ziWcwnSAFvIYOzAcpuZIV35EGbfwlVU18dXGeR3iYqARIpAx0HET2g9Tg4fcyU6/hHFTTKKf6OXhAcdb/LRf6dSPbQY0nQwbFz63jEW3Zn03B/i8FAtLfC1MNFoCaTvNfSW7r26IJvrPqha9lgO+kesQDrR/KUgy6/JqLKmSJZyYItryCG0/wFK2Kh6Ylvq4RV7t1sK1Acn3ErhgVyZb/Sf3ervw/RueYHzIxyAELQhumDFMvOvO9qus3FUD51TyZWzhNwU10jNDF9gomMwoFtYG5ErZMwQmRasH2+udjML5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS6MnFghC+Qj7tFhTma9PYKjRin7yKtaSHIg329odxk=;
 b=IFEZdKKuLiCMv+PY9mM53iI4pSW+6FxJzyzba8z+WPJJ+y536DUNB91xUeNhXFMwJy24eowxH7rqD5YjA97LEe2GG9OGhtgU0JT9Y2svcsxC6Zcq8QLp0epd3s8KncCuGCAQMZy5/LOD/i+C8DoL3PL5GMUOh/b3M4N0Q+00D3B8YeqFGV9zGdhvnkC/HnSu4AWezuTeM39BLwShceHnEZLRx+lVFcrEqYKC6OVCN1sNDkQIGJ62fZa5HQAsGjNh5sXgTOEohNtCUFS1/dRp3eFYGCRA34wKbnMKzNQrDXiX0hQbRU6+UCxHlu+W5EsWu2Dn2D0ockCwT1rv/q7ciA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
Thread-Topic: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
Thread-Index: AQHcUzQziKdu2C0rLUOkIzlzxAvY8g==
Date: Tue, 11 Nov 2025 17:54:17 +0000
Message-ID: <20251111175413.3540690-4-grygorii_strashko@epam.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM0PR03MB6323:EE_
x-ms-office365-filtering-correlation-id: fd30497c-ccaa-4067-dac9-08de214b55c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jwCmjtiPQqA5NVKfb7I1OCm/DLN4guIBzSUG+BDYLQM7Hq7AORcmYuZj2J?=
 =?iso-8859-1?Q?D3ruCBl4C9dHIpeAz07tZUsFmaj0vbeq1r72RLM2cO33gRmjxns9TcVi6S?=
 =?iso-8859-1?Q?AJYsovVKhVM8fELtHgT3R6fHIeLJXa85O/+EECR2vAJvC5Wj3VoJh1uZPO?=
 =?iso-8859-1?Q?fGKBLBd7jfyN/7BS17eXPN+q1hHDZsEOciZZ/clPbR6MSpwQcBqq5ZGE8t?=
 =?iso-8859-1?Q?Sb1eWmOLvHJkF4Db2O5WcItZ5omSxlJ5dOijUPiIaEuETcFAk6I9wJUWMH?=
 =?iso-8859-1?Q?c4j3Y25gTRVdXk8Wte7h5DzM7Tfj3q6TyxnSpL6VR3/6ojISG6rfE1imlt?=
 =?iso-8859-1?Q?iOqJmXnh1+wDmStZRTMU9uJgq3RiyPAFRUm2JXgfZogxd7t9hjXBzJ2dJd?=
 =?iso-8859-1?Q?Rn4m73CqqFpVwWvEfAJlmB350SCRSR4vW89xgxRm/M4W20R6U5/ABgTsgp?=
 =?iso-8859-1?Q?A7T3Cxj+Xmz3hIzDfdqsvbExAMQdfdddlfa1xx8fWQ3mkIB2GmO8RYizv/?=
 =?iso-8859-1?Q?i2ewChEwm2Zai3Aw97/Ltptk5Tbof2JoFf7lCr4/M+YX+3niWp1tVl/5mW?=
 =?iso-8859-1?Q?ED6AN7iIjIAgXCJM7ryg1f1GtdcvV8n3Tvg5ds66DJJPj5ebT8xri+/uv+?=
 =?iso-8859-1?Q?NWcIVupVgP0/I5dTevdKg9ohJyH/tuH1nP9PVDDTF3H670FD1cCKA753OJ?=
 =?iso-8859-1?Q?IjnEuRVdm/pBhaB4XTiTSQMirj6rjN+uhEifxgfSkdUgKMkIYlRuYN/FiB?=
 =?iso-8859-1?Q?W63y/9tyzMDCCNcEOpFgdCqqPTmT78dszUkfPh1h2AKMcZXLW/DmFs3i6d?=
 =?iso-8859-1?Q?6yTLhtQXk//frx6Z2eBDBV+zsyrlKTh/kUZLCQIYBEgoTxBUIOdEKzUXJG?=
 =?iso-8859-1?Q?ajxbXlnbvTBhqmXPZ7kZaHrbb7cIiUUzsnmmIzfLokxJjqDuK8/nZcmqum?=
 =?iso-8859-1?Q?5QWJNwgvrvLT7uhMcQDyS14/351RgBvZhoF03WAZdrLz8iZWRWVq5sO1hZ?=
 =?iso-8859-1?Q?RA3d6S3d9RjfhbXT9K7zBMZTurGEGaPLPmKyKIuoDCLBHFzfPk3Q1aiXJV?=
 =?iso-8859-1?Q?C2Cixo+LI1/dI6PUHwpEtCsoHja+VVTcz6H6FrSUVS1Ananv/77A1UKGct?=
 =?iso-8859-1?Q?Z94XBtgoBu85RwB0utG2OewrQKB5USpkkZKRucl3mjLhl9Zs5ZuMQcaAVb?=
 =?iso-8859-1?Q?0zAl1y35mUDKPuDfS6cifOoZbkXBTE9JHomY90Qu8sB0J3wrtLPrqLJBrM?=
 =?iso-8859-1?Q?KmO30msRUM7u8zy6/T/r7/DOEWLuRP749JY7arq2x6GekCU2COhFOjDOno?=
 =?iso-8859-1?Q?gWagFZnW5/b6ShgZ7YHdFeLrdxZK8hHNKaMCMeNnSqBrukdqVzRG37r6fA?=
 =?iso-8859-1?Q?fD4K95z0tA5WUUDgiv7yfDvJhnc6LHDBlhM41mEavg9kT1wXG7O0kSmtQj?=
 =?iso-8859-1?Q?ZA/C499l62z4oPtv2GL+ZgkERdY6/2OfH5FzXqcbgiK5uS21lMyzSIcCsH?=
 =?iso-8859-1?Q?cDDs/n5xz1j7U3HX4ItzV8JVn0i+uxQAzb+CWeZm7Irx/PVLzPWjvwVVyd?=
 =?iso-8859-1?Q?CxNFvoi1XiCsQZ9YSEYTZ0+ODWgW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SenZggk+Cp6pup9tIBD0jMc5X7hTOtE/Yz3gwnjPkrNMyXW/CnRSqZouXO?=
 =?iso-8859-1?Q?ejDYYzEUsaue5Qz8atHKb4h70rLlo4bhrCjal/UNSRzAZl2zh7bvRxzDiI?=
 =?iso-8859-1?Q?GjMlCunZejrcf39ro3/hnJIviv+tngaxcK7mHBQfAvCqnAWcQnkM32qUYr?=
 =?iso-8859-1?Q?fHyxjnlzj8X7PhtMPPuwlSoAbJAZW+x1qtG17sNFjfwQVJiKohVViZiLY+?=
 =?iso-8859-1?Q?9gvQraRAmKfpaHXKN6Uqb3Lb9LsLcEjwpzO48uE88T1yMOgl+DZfvh2Y9Z?=
 =?iso-8859-1?Q?MiI63MBfD9L1kNBt0bnc+vACFdT+/labWmpoq0usClOWb1O1Y5U0qWW3/J?=
 =?iso-8859-1?Q?5uettgAQ+vq7k8YgvHRIQtehvn2Q/x5RwgSD6D1hyQnK7Fc/z6BY3Up/Or?=
 =?iso-8859-1?Q?PSpYR2z8xiq1ofbUAcnQvJ53t+dFb8Q2rwUGL5xaS4VllzA/Eo47l7/nm0?=
 =?iso-8859-1?Q?ZybDE30IXPT2+aFNXzXDs3Q4k5ExLweY5GxCfhweEgXFws3tkkZSX9p652?=
 =?iso-8859-1?Q?Z8vWEnLi8sG1nLXCBSeuMzCq0yyvgssQW9x++1sRz38Tvc7pGKHiWIEECM?=
 =?iso-8859-1?Q?/BcqOdsL7H2C16M2PMM3/+CBzVR0ObxMSVwqnyo5T1n8tIUrA3DlzFn4mL?=
 =?iso-8859-1?Q?TF0ZjvScpng+/bQEBlnj56NarJA7VqrGJEAD7TX6xQ5Z3D0mXoSh2j1usk?=
 =?iso-8859-1?Q?qxqlKRLhypnP3FHQprtvTpXyw/5y++vCjUwhjkDFgP8sWsUnyQfZlM1rv2?=
 =?iso-8859-1?Q?xduAi1acxjObYmBGVp6gSf0A4xP3lEU3/LlIRhUtzi9voMZ90pLOm2KheW?=
 =?iso-8859-1?Q?ES6NeFjAoJLQca/pm5we+y+3Q2APkuAUtkFFOyXOFDHRbar3JOm4GAMyHn?=
 =?iso-8859-1?Q?v7NnuBb6hwZTf6aaVjM9wabxepKcJ0YXwJjoKNKKFgdU1ZPPeDw0BvA8m/?=
 =?iso-8859-1?Q?POqEo6MdyakpQMIlnpaFE6H32+Oyf6KqLAnnUMxh4g64BanyFE15X5nmC/?=
 =?iso-8859-1?Q?AgkFi6rFx4W+8maSNx5VjbBk6n+ZfVHUGQQByqYvhuZZmemzBS9Z8HQLev?=
 =?iso-8859-1?Q?rG+qPHRqMRnaplmcBMEKUrbb/5h/wF43BRbrOgf0Gqd2CTjl/FybUch/rd?=
 =?iso-8859-1?Q?JkQDXJYC5fBwynt7zv1tfKhoJM9i83+nYzsIOu5ma5W/Y7nG2XWRar+Zsr?=
 =?iso-8859-1?Q?yNx3QT9k5pI+kwy7sW2cUz/l+VxoJ80XAMtv7AhW2AiUL41Y8z8uTD3QPo?=
 =?iso-8859-1?Q?K6GDZPNGIguUntMcXTW2/ImE8l3hF9tQSgnTEJ/OO5H0e0qAEB+NgD5i2x?=
 =?iso-8859-1?Q?6P2g/RltEJ3012cIZeRtbJk9jWSXEjbHPYyggF3HfAYbgtHYzKcNigpF/G?=
 =?iso-8859-1?Q?HFbeb28lhFT9TachrS0+d3O+utOJEj0jqHCU16MDStxsNwwLnmGP81Y8cV?=
 =?iso-8859-1?Q?q9kodkKB1/nFJlF9zBu0pEETf8F260baqtYQ7MPjnnSJhqTaBxF/60jw/N?=
 =?iso-8859-1?Q?v+5O7y5Cfjr6RsdN9XSj++yDauocV0cfzWo9axqHPRTRrd8meKsKHRONnS?=
 =?iso-8859-1?Q?KkNB8UZT8DdDt6MOF/yBES66Xofa8+Hqxfo3lQxgonKFPSQnmoZIhCAgpc?=
 =?iso-8859-1?Q?Ov+NYU77h5ZWzyKSBS9tdoWvBxaaPTmyv7CSlSQrBidEM4CQ5FQHMf+A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd30497c-ccaa-4067-dac9-08de214b55c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:54:17.7563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KEVDnbwkNVNmxjcbH3xxB4XCAxaaMSDzV9OysOzUaDondxPaL2A7Y9fwrnUvK6RaKsC14FGt7LX0sdk9MD7mKC4GPPkwuSlt8AClVfs2Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323

From: Grygorii Strashko <grygorii_strashko@epam.com>

Factor out COMPAT HVM code under ifdefs in preparation for making HVM
COMPAT code optional.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/hvm.c       | 13 ++++++++++++-
 xen/arch/x86/hvm/hypercall.c | 37 +++++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2e47a71714fd..56c0059401d0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -69,7 +69,9 @@
 #include <public/version.h>
 #include <public/vm_event.h>
=20
+#ifdef CONFIG_COMPAT
 #include <compat/hvm/hvm_op.h>
+#endif
=20
 bool __read_mostly hvm_enabled;
=20
@@ -1255,6 +1257,7 @@ static int cf_check hvm_save_cpu_xsave_states(
     return 0;
 }
=20
+#ifdef CONFIG_COMPAT
 /*
  * Structure layout conformity checks, documenting correctness of the cast=
 in
  * the invocation of validate_xstate() below.
@@ -1267,6 +1270,7 @@ CHECK_FIELD_(struct, xsave_hdr, xcomp_bv);
 CHECK_FIELD_(struct, xsave_hdr, reserved);
 #undef compat_xsave_hdr
 #undef xen_xsave_hdr
+#endif /* CONFIG_COMPAT */
=20
 static int cf_check hvm_load_cpu_xsave_states(
     struct domain *d, hvm_domain_context_t *h)
@@ -3991,7 +3995,7 @@ static void hvm_latch_shinfo_size(struct domain *d)
      */
     if ( current->domain =3D=3D d )
     {
-        d->arch.has_32bit_shinfo =3D
+        d->arch.has_32bit_shinfo =3D IS_ENABLED(CONFIG_COMPAT) &&
             hvm_guest_x86_mode(current) !=3D X86_MODE_64BIT;
=20
         /*
@@ -4965,6 +4969,7 @@ static int do_altp2m_op(
 #endif /* CONFIG_ALTP2M */
 }
=20
+#ifdef CONFIG_COMPAT
 DEFINE_XEN_GUEST_HANDLE(compat_hvm_altp2m_op_t);
=20
 /*
@@ -5064,6 +5069,12 @@ static int compat_altp2m_op(
=20
     return rc;
 }
+#else
+static int compat_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    return -EOPNOTSUPP;
+}
+#endif /* CONFIG_COMPAT */
=20
 static int hvmop_get_mem_type(
     XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 549e25445e67..f8b2c90b7c41 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -29,10 +29,12 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_=
PARAM(void) arg)
         return -ENOSYS;
     }
=20
-    if ( !vcpu_is_hcall_compat(current) )
-        rc =3D do_memory_op(cmd, arg);
-    else
+#ifdef CONFIG_COMPAT
+    if ( vcpu_is_hcall_compat(current) )
         rc =3D compat_memory_op(cmd, arg);
+    else
+#endif
+        rc =3D do_memory_op(cmd, arg);
=20
     return rc;
 }
@@ -57,10 +59,12 @@ long hvm_grant_table_op(
         return -ENOSYS;
     }
=20
-    if ( !vcpu_is_hcall_compat(current) )
-        return do_grant_table_op(cmd, uop, count);
-    else
+#ifdef CONFIG_COMPAT
+    if ( vcpu_is_hcall_compat(current) )
         return compat_grant_table_op(cmd, uop, count);
+    else
+#endif
+        return do_grant_table_op(cmd, uop, count);
 }
 #endif
=20
@@ -96,10 +100,12 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
         return -ENOSYS;
     }
=20
-    if ( !vcpu_is_hcall_compat(curr) )
-        return do_physdev_op(cmd, arg);
-    else
+#ifdef CONFIG_COMPAT
+    if ( vcpu_is_hcall_compat(curr) )
         return compat_physdev_op(cmd, arg);
+    else
+#endif
+        return do_physdev_op(cmd, arg);
 }
=20
 int hvm_hypercall(struct cpu_user_regs *regs)
@@ -171,6 +177,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
                     regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi)=
;
=20
+#ifdef CONFIG_COMPAT
         curr->hcall_compat =3D true;
         call_handlers_hvm32(eax, regs->eax, regs->ebx, regs->ecx, regs->ed=
x,
                             regs->esi, regs->edi);
@@ -178,6 +185,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
=20
         if ( !curr->hcall_preempted && regs->eax !=3D -ENOSYS )
             clobber_regs(regs, eax, hvm, 32);
+#else
+        regs->eax =3D -EOPNOTSUPP;
+#endif
     }
=20
     hvmemul_cache_restore(curr, token);
@@ -208,10 +218,19 @@ enum mc_disposition hvm_do_multicall_call(struct mc_s=
tate *state)
     }
     else
     {
+#ifdef CONFIG_COMPAT
         struct compat_multicall_entry *call =3D &state->compat_call;
=20
         call_handlers_hvm32(call->op, call->result, call->args[0], call->a=
rgs[1],
                             call->args[2], call->args[3], call->args[4]);
+#else
+        /*
+         * code should never reach here in case !CONFIG_COMPAT as any
+         * 32-bit hypercall should bail out earlier from hvm_hypercall()
+         * with -EOPNOTSUPP
+         */
+        unreachable();
+#endif
     }
=20
     return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
--=20
2.34.1

