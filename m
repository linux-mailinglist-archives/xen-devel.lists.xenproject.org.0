Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E050BB1A86
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 22:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135050.1472460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v430v-0004TE-T8; Wed, 01 Oct 2025 20:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135050.1472460; Wed, 01 Oct 2025 20:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v430v-0004RN-Px; Wed, 01 Oct 2025 20:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1135050;
 Wed, 01 Oct 2025 20:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbxQ=4K=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1v430u-0004RH-7z
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 20:01:24 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 676429a2-9f01-11f0-9d14-b5c5bf9af7f9;
 Wed, 01 Oct 2025 22:01:23 +0200 (CEST)
Received: from GV2PR03MB10998.eurprd03.prod.outlook.com (2603:10a6:150:27b::9)
 by GV1PR03MB8766.eurprd03.prod.outlook.com (2603:10a6:150:89::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 20:01:20 +0000
Received: from GV2PR03MB10998.eurprd03.prod.outlook.com
 ([fe80::3358:d080:db3f:c4a]) by GV2PR03MB10998.eurprd03.prod.outlook.com
 ([fe80::3358:d080:db3f:c4a%7]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 20:01:19 +0000
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
X-Inumbo-ID: 676429a2-9f01-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CN0LaXOdsf5u0m57SflZN30SmSVDgVtNdoaaNZrWpwcm6kqQfzmIBzeX1fVSgqcRBCy0mOinSXN2xQ4uKIj+0k8zK7/W9z91CHZKxBHIVV+BdCKo6aByDK6NI5K7xon0+pxo5tJHI/i0976JivwTKMjLV+JHT2qUmqWZyverWkwIwv5njwDhcFsEYpgcfldcMu/q1ZFdFbjOHKijp4dw5G1egwDu2j+gFLKarNJEcJOsFMfroAPHKMlo04TPrvWyAwwdhAzIwgUi/sG/boSYGyCD24Q4xlkeGCH7a45h2ajHuRGhQGu1BcZRHOWgZai6c6Fooe2VhSo+xRDWMft88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OZ4W9JY6oIr64owyu6CLBdDMrcxrC31dr4eXTBG2Q8=;
 b=w2fF0PmeYpL111iEJQOYuyikAFEw6+lmkIc5rlmE0u5oTUP9ImWX6CUzSi5zPlRALnVbZzNDzlzzVOCSKg9D6hnp0r7gJywtBX4lsxRGsG/dNPSKa0o8wC5KpMRUw+ai1i3MZpgvAuvRxpEEyYF1dWqEja2wFqLnZkrPDbMFkjE88Z1s64lFrz+7SyTny0pmIbuD8SGpJ3+fEb48Ec2Zmd+GtawbrhkPOWBwLOfMXrnIk7LAHuwjjptUkdIjPThqxXoUOzES249ckGAeqL7noIU77NCMEw6LH913uNl574G72u33nqsTUQDxFnOHiVBi2SweUIIrVxhN4aCrqMf6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZ4W9JY6oIr64owyu6CLBdDMrcxrC31dr4eXTBG2Q8=;
 b=sG9H6lPdDmy9ERE/IpoxaILtZ14XOIfTYjy2DYeoQWO0OleteUQ8xy8MoL1remK0gW4HtMzLVrBIa+0+vkeiW8h4CnokZUiJEGHY513gIQSLgRdJ8MlG9SQsrR3evv7fojA/hy5ZZlFcP4MtimZZm3FIV7EnlFCuTwQYgOiGsXMxW6gdkHN6uJwN139A6OO4rT3TTJbi5ocuCX07n4z3UEQQ1y/XUa13PJPHGbBGgoWkDrZQzlqOuf78sb2v8E+KgthcqVLfkea02K+bdp+IDvhlvZQGse9cE9HZTpJmgVs8v30alSUvpNA1AbuPsPlC/QPStRH00Fo25olYz/YWNw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
Thread-Topic: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
Thread-Index: AQHcMw4nGtW4BrEr00ihicoKFqTpuw==
Date: Wed, 1 Oct 2025 20:01:19 +0000
Message-ID:
 <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB10998:EE_|GV1PR03MB8766:EE_
x-ms-office365-filtering-correlation-id: ed98e7d8-ad4c-49f1-d97a-08de012549df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5eiViqHyj5pjsuNMUNt0l1QwQksNaTbioqOSslnsQfLyHlY5rpoWUdmoQ6?=
 =?iso-8859-1?Q?mAwy9uCjpclquagRg6mUM4QoK+zjTq8HcR5kIjC66oYxO6JOs6CFmuR3je?=
 =?iso-8859-1?Q?Iy4XEp8Z5pjkeYU9WjdnpLvqyYyfHJnn+W5qVEp5XCo1gUa389b+HlDWsM?=
 =?iso-8859-1?Q?Bdp6KrdL3xUX9VW9OuSce9mR+2J5QhOSI5TJUSC0sXmLFx6snK66va3++p?=
 =?iso-8859-1?Q?nBQ2Bs4QH6ylT1o2SU3Q1nM6XSI+TAR1Iso1iQXXgFjEcgrZ1INx1AJVSW?=
 =?iso-8859-1?Q?2xW4RVReICOGzrKoYiguXOYPTE4E004JAf++Qm8KdayYWeNnQzfQVemuo1?=
 =?iso-8859-1?Q?P4J4zjsYaxe3JCTEaBz8v/cDVJv7kFz3rpIA4U8eoYJ0MXZjBFiwMiMSOE?=
 =?iso-8859-1?Q?7Wwm4h3CHD9onJ7zxfzoWu4wKtwngawyXLvb4YRM4DSQxo2xk/XYqNOFaB?=
 =?iso-8859-1?Q?X2MQX9z7DGlR1o+uQMJ9WETBHkih+jlB9YomdKcmbHIA9pVl6ozXns1gMS?=
 =?iso-8859-1?Q?Zti2YYITNEUBU1EG0sr2cT/Iia6fmffIS4B69GvH7C2HGY4YT2VSoQhDAt?=
 =?iso-8859-1?Q?NZP7UzXi0KehuZXz/mztLg52ZYkCbxei3iEQC2HGZOodsOY6S2G0Lfqdk1?=
 =?iso-8859-1?Q?QazBi8FFoh8DxL8xhe/1AjyztiP85soIZMeiq/QIWgJgkEGyYnkpS/Eti7?=
 =?iso-8859-1?Q?TFp5I/6J+kBfXPWUgeVrOQLddH2b6uPCgsIPeejmra/8jyLKiuf5luEYQv?=
 =?iso-8859-1?Q?nlZQCKL+Pi0prow7MwTodsaXiQ2PAdFk5IHMGPY/oWADw5Rcp6T5wV8xZ+?=
 =?iso-8859-1?Q?gNbKuRbAIX/cgnRo54N389MxtiHKzkjWgilrPxqZLceKV0DrWL7COh5Fnu?=
 =?iso-8859-1?Q?kWki96JyEzTVoCjVg39Q6PZcAZfrB8yXP2oAPsaSCw9+NVRrdAqgsbp8Gx?=
 =?iso-8859-1?Q?kbJUwlGKW7N80IvWWo+oDH2J1dZ0S91wgZL1G7sDrjMzTw9h25MF05Ir+5?=
 =?iso-8859-1?Q?Tvy+2Dhy7bv/NBsJORXUOqcE4XncD+IggVRgQJuNtXVIYjaOiIRpB7+rXV?=
 =?iso-8859-1?Q?9L1OygP18a1CznmSNI3pOLc3DtT1YLs8kZD20c6DKe3Y+ubRlPuXnRGNod?=
 =?iso-8859-1?Q?zhrZr/PD5iwu9XovUHbU3xYPtwfhRuCtHQaJh0tho92QYgQdX5WsigQgAk?=
 =?iso-8859-1?Q?lf+9lZSRMW4D52O/i1pvRV1j36cS6mcmM+IriCHwdNwrkci8RKduZoDNtI?=
 =?iso-8859-1?Q?+3276oilN4Jzm3qhCSyUTmauipuaERK6U9g/zFCf7Bbpk5aTz4LhGXYP4r?=
 =?iso-8859-1?Q?1z4yyUhlVrl2ExHQl+VgGtEPNDU4Ej/bae/cK8Zs4KkT3XQUxHdAPRz+nh?=
 =?iso-8859-1?Q?z2DEeINZmt3LgyADkWWzNnaocSf9lsRrDMb0VRJn1Hw4mAzmX0KpcmRvgj?=
 =?iso-8859-1?Q?ds2V09avDtzNigF/ouwtncXLl0E1xyP1la2bQvSE6Fh/7KV47oL2W5GHwb?=
 =?iso-8859-1?Q?7kiyTqxS5/dGxe+sLCJ8P55l0+j3dmcUQzosIq1pHSY31WlJrSTSLQk0hl?=
 =?iso-8859-1?Q?eTLfSm3ZJa7qv+3TQO4Gyhj+P58d?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB10998.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Kuts+Bl1MEKjaVtzqVY9aF3fogVy6t2PGH6D+ipA9KW751QCBWbdC0HnSI?=
 =?iso-8859-1?Q?41Xl/z60EW+q1YcRkWcrlLn7hdHIXIHiRC4TqAUCfoOrhzuKg7FfIVq1+5?=
 =?iso-8859-1?Q?Gt4C4d8oNOhZ+YDJP4I5PGcPn6lSMipI9hCIIYF/9JKdWRgBg308PX8dOd?=
 =?iso-8859-1?Q?PpYouQBgytsaTBZtMS1PhRLl0cppIB1YGETD+92ujGqweZm+cvHRblQ49g?=
 =?iso-8859-1?Q?mqaagkCXWaVMap7oV+WQtylXL/I8Qhbi7bdh0Wmdek36Jo9ROq+EVqtAwH?=
 =?iso-8859-1?Q?sHlh39hhr8ITgBI7M09WyrDfl0RE35xqbVPcz/7pSgOyLWVBXElhsLgemk?=
 =?iso-8859-1?Q?kmxXN1geqnMx/uUn3e1pQjBj4sFf9oBnZ2o7068Nx9C75toYQ3ibloyr+b?=
 =?iso-8859-1?Q?OTc3dm5mRECAROYNi9ZzFYnJT+44k+oHMd4/Zn+9AfZFyuQEI23vAQE+QK?=
 =?iso-8859-1?Q?lP8le3/pAq8ZEVXyVZb5KcLM+u4jqCrKmmztFWKw8+iGGFImCvdrZKcJkx?=
 =?iso-8859-1?Q?XsQ1JdC8pc7hyyPbpOCkrPpmwJaMfEtDGL3NF1bwolpaAZytZUgiCJuD5L?=
 =?iso-8859-1?Q?MMwjx5jdGWxO/RuuWNgOMYaHwC1AdCXbe+pDVzedVAfG9PjC4Ce+RAB5AJ?=
 =?iso-8859-1?Q?+JBpC+oLnPQ1+xJTkbCrIt/k9hT6RTPX0gn7SSVR4U/Qs+1bfzZ3g3+mWE?=
 =?iso-8859-1?Q?JLJ9rCfTfIpr/4PoWrLgtuvq3ThFwYH35Eo0855C7HHoUDKg64MMBi2zU/?=
 =?iso-8859-1?Q?etOH3sAk68FJnFXd+8zq2W+yyTsIPcJb6V0Kng0Ksvoq6dmd68wu7LTJox?=
 =?iso-8859-1?Q?uyusbmPkxVxEMLaKbzkVnFSN4acRaHof/uMN5FLByhyXo287vBNH2HhWyo?=
 =?iso-8859-1?Q?W/bhLb1qgiXAjS7ICRbOwkpB+QqD9bUDM6LwR/Qq5ThOjrreCdoblOBaEU?=
 =?iso-8859-1?Q?Gk8si1QvfSTsTRVPPLfITJMQnAphpiN2yPRVlGg5ZxQB3IdzHemNE/9EAF?=
 =?iso-8859-1?Q?2qbiJlErSpIY0c81cD4F+1WR1WDJX1srb0M9PE9MDcjnFdIKqiMwUxzYpC?=
 =?iso-8859-1?Q?znDSm7K8+AGmmWKqmoFbBLdOnZL7kbtYH3m3th3fx7+y+XjKtMHdGZ1HNf?=
 =?iso-8859-1?Q?LZ1z3vTn9Xwzx0EEJuqmX4ahXcvFAKMmhJRGClMUBqCU85a6ChX5NNwIYY?=
 =?iso-8859-1?Q?pSB4y9X3Kt4Po0bmFPyt8YNS+gepAJRZNUWuBrzw3X9u7I5IxnbZZFJZWP?=
 =?iso-8859-1?Q?Xijq4VGX5/N7YrLp7DtK+Qg5ryUFMfWbjCcZZHygkAArXQWPlSzd6+hjEb?=
 =?iso-8859-1?Q?NOGoTu0N4qG52O5umRJ4cdCdpJjDddFKPBXk5yUDiDw3vOIyQ4ENG5u3Av?=
 =?iso-8859-1?Q?nT7qWojxKJH6J6KdH3S09EbY8wHO6iP/ZQATdt0YHEEqNoKnp7kdQb3QZ1?=
 =?iso-8859-1?Q?VACvWw/yiok9iHnAeVgYSJPPmn5IojSRFY/U73Xfvuk5Wmo9jyfAKv0/sn?=
 =?iso-8859-1?Q?Wxtt6oPS5dp/DUuVyBLxhmrXHojO99TBuVpp6lFYYOs+erxJR6JRgBj5Dy?=
 =?iso-8859-1?Q?gVGjkPapjMdH4DfIs9e4MyeecyM0Uz2eW6EiD0vNABSL/voDinixBH1A1N?=
 =?iso-8859-1?Q?9uDLXL8im4r+h1lHVpVBevpTqvefXXy3j0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB10998.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed98e7d8-ad4c-49f1-d97a-08de012549df
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 20:01:19.7618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ssIUlVhsguuYfNbJz6Tc21iV2DGG4LfwfNeGb67srnYH+4xI0OOolNJPOQIlm+03EVkjqrErAT3kDzNt7G74g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8766

Signed-off-by: Milan Djokic <milan_djokic@epam.com>

---
XEN_DOMCTL_get_address_size hypercall is not implemented for arm (only for =
x86)
It would be useful to have this hypercall supported for arm64, in order to =
get
current guest addressing mode and also to verify that XEN_DOMCTL_set_addres=
s_size
performs switch to target addressing mode (instead of relying on its return=
ed error code only).
---
 xen/arch/arm/arm64/domctl.c       | 46 +++++++++++++++++++++++++++++--
 xen/arch/arm/domain.c             |  5 ++++
 xen/arch/arm/include/asm/domain.h |  1 +
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 8720d126c9..f227309e06 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -12,6 +12,7 @@
 #include <public/domctl.h>
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
+#include <xen/guest_access.h>
=20
 static long switch_mode(struct domain *d, enum domain_type type)
 {
@@ -33,6 +34,37 @@ static long switch_mode(struct domain *d, enum domain_ty=
pe type)
     return 0;
 }
=20
+static long get_address_size(struct domain *d, uint32_t *address_size)
+{
+    long rc =3D 0;
+    struct vcpu *v;
+    /* Check invalid arguments */
+    if ( d =3D=3D NULL || address_size =3D=3D NULL) {
+        rc =3D -EINVAL;
+    }
+    /* Domain structure type field and actual vcpu mode must be aligned */
+    if(rc =3D=3D 0) {
+        for_each_vcpu(d, v) {
+            if(vcpu_get_mode(v) !=3D d->arch.type) {
+                rc =3D -EFAULT;
+            }
+        }
+    }
+
+    if(rc =3D=3D 0) {
+        if(d->arch.type =3D=3D DOMAIN_32BIT) {
+            *address_size =3D 32U;
+        }
+        else if(d->arch.type =3D=3D DOMAIN_64BIT) {
+            *address_size =3D 64U;
+        }
+        else {
+            rc =3D -EFAULT;
+        }
+    }
+    return rc;
+}
+
 static long set_address_size(struct domain *d, uint32_t address_size)
 {
     switch ( address_size )
@@ -54,14 +86,22 @@ static long set_address_size(struct domain *d, uint32_t=
 address_size)
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
+    long rc =3D 0;
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_set_address_size:
-        return set_address_size(d, domctl->u.address_size.size);
-
+        rc =3D set_address_size(d, domctl->u.address_size.size);
+        break;
+    case XEN_DOMCTL_get_address_size:
+        rc =3D get_address_size(d, &domctl->u.address_size.size);
+        if(__copy_to_guest(u_domctl, domctl, 1)) {
+            rc =3D -EFAULT;
+        }
+        break;
     default:
-        return -ENOSYS;
+        rc =3D -ENOSYS;
     }
+    return rc;
 }
=20
 /*
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1a8585d02b..9096dc7411 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -608,6 +608,11 @@ void vcpu_switch_to_aarch64_mode(struct vcpu *v)
     v->arch.hcr_el2 |=3D HCR_RW;
 }
=20
+unsigned int vcpu_get_mode(struct vcpu *v)
+{
+    return v->arch.hcr_el2 & HCR_RW ? DOMAIN_64BIT : DOMAIN_32BIT;
+}
+
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index af3e168374..e64402a67d 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -252,6 +252,7 @@ struct arch_vcpu
=20
 void vcpu_show_registers(struct vcpu *v);
 void vcpu_switch_to_aarch64_mode(struct vcpu *v);
+unsigned int vcpu_get_mode(struct vcpu *v);
=20
 /*
  * Due to the restriction of GICv3, the number of vCPUs in AFF0 is
--=20
2.43.0

