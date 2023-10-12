Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF47C7947
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616070.957837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s5-0002av-U3; Thu, 12 Oct 2023 22:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616070.957837; Thu, 12 Oct 2023 22:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s5-0002WE-NI; Thu, 12 Oct 2023 22:09:33 +0000
Received: by outflank-mailman (input) for mailman id 616070;
 Thu, 12 Oct 2023 22:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s3-00016s-Lq
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:31 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 036dea3c-694c-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 00:09:29 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqmlC008371; Thu, 12 Oct 2023 22:09:25 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:25 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:18 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:18 +0000
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
X-Inumbo-ID: 036dea3c-694c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K01p0D6CTf1gJqbojqphmWFrqYpv3U2b5T130F9+y8xPt8mmHhLcS/g38NSfVCgVjJau+wJwcQScJiBUmgnbaseBHByBel2MgcMABUzoZ0BTjXmClUETTHRwXEpmGzcf0jA87HU3hFlm3jl8p2yniFkHIFiMebWBxpDX8YTrhFK6G2Bv186fuIO0m72nAxLYjPH7GH9tI1mtc8QS+f5vCxwEyZ2HJLZKlD6nePDuKtT2dqdiGW7FqC43ZkbDjoiBMBZNVhUN3mowySjGjkY+/0nNl0FvUydcfG42DJXPuVNVZnXiEXyUaBgURYDhns8vvLoAdEAKZFyVAgvKI0DVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CXc+8tX6pBxxfJFpCA5LYlgxAC78/KBYrjedW2YSTs=;
 b=aAR2gCzjmxBMHzjEyAMQnk6E5fnrRTbS4q0ULpDxzKFjsHj7s1RdJjqEliG1Byl+EyQ3cnbSVHLh8ohTMJOg9utnl7rUe3VLr7pbf0jtKKOU73LaFkFF/XY/2CL4Da8DmdxKalx1f/9bm4oSPzNN1uEiB61mOY3BMw00rPcNo+OAowjbR6JvRaceENDE1TibDZEnvzUiUe7RNPKD7Ss1245uIhuIq5oLyQ2gTeqOCeLX68jcmXYiAE/x3denuWc2ueObD0+irbwN7eT39C0G2KakW709Y37wWutDb4GY1nd4VWpBxR+nuLfkFAlpEQ3WdJx6T0SVMK+gEKEj7Ec6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CXc+8tX6pBxxfJFpCA5LYlgxAC78/KBYrjedW2YSTs=;
 b=mFsLeuqU5CVV0qamOsO0ew1vbsWymMJ96rbk3rEiwtJUm+wqe9MSqZQEmoxytRFDp/iORH8DDEEEKRlAVQlh3wzOuYo+pOdjBDdVMlkx8km67C5JvOEB5tO5pHp4LYBD2YcN/BbB+b/gJXhnoytcH5R1xZaSWXdsZpyfdhq+GCmuAilWbmWkIEH/GQcpiF150YyGp422ZF61Ht/O/X41tEuEF89hP9LgKds9iwYpzL3une9AgCngmEhOYJ2vaUqe2PIpvwHrJief2PNqAJK4LcPUIYB8BgPlbD23iNERnE6t9KQDL7pkNOs/5VAQf0Dtl3inaU6nKDWdXArE4j5w7A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v10 08/17] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v10 08/17] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHZ/Vi9FGz7fvuB1UuuzM8p/4QjlA==
Date: Thu, 12 Oct 2023 22:09:16 +0000
Message-ID: <20231012220854.2736994-9-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 50804346-9409-4745-3ece-08dbcb6fe110
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WbdXn/iWcHUfvCky1h5v0IRMQybWxeH5I6vc7/G6AieH4buFhCm6x4z5Vrxyq6JI9StcvHXd+pCSK+B0X9eoo8SoJtubeyZ+ftwm+qQcbMvxeXoRWMisZrzhbO8IjrW9MMafR/Y941WGgiuVYV1jOL7yJTm3Us/i8vAgaVVVj4mn2DWjLR3Z4y/dWHjfuWoMhhbIlbdyYuYuZDW6Kz3VolWSpKffCjhgZaEPTnP6uLbvmCehAdVNy3s4tHX1BWq3lye4tvihu3+9nSKmW506rUjux1eh2mACvK/tiMnXjnDFuolSiBKftUmMNlCVD24LwWxSN5i2FB0R4X3u4yhuVDBGLOeA/U+sfekPBah+wbW0W2cPkE756dmMJG41VdL2b32d030hBmfTw8w9XbaqktRadfwnzTuBiMy24laOQRBV6ukyGZdNmnLbdSn9EgqJR/+jYuPg9Ro+W1UWrjBCtLYmCm8x+XF5FlcerUnFy9sv6LbJaFrals03EjloOFAUlEpx+HRARldTsD8NF4VQVriHbDlgd+BprElAb4mbd36+H245He+nUxDsQpBUvxFerhj5p/Qn1WVIRV4vn+O6uGugCymwViCfqub4VYQIrTJfuUwwMHDqwoH4MNS6weid
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xyc9xJ94f5mYD7PnywC1qW9i3uRG+HqKKAW8XWZ5aGSXlOYEOP1WiNaAMG?=
 =?iso-8859-1?Q?ytDC6rF1hFlUT81J0D/9VHsgh/ygyQRN3sOg3fvWeu3qFKLYlHMxOS+1U4?=
 =?iso-8859-1?Q?GDIHiuyoaGKUtnXoGJjg5dlwfSNf23edL5CjuTwP+smvph7DUYMQ4uliJr?=
 =?iso-8859-1?Q?M1Q0sW5NAsZmBbYEnRx2yB1seLmH4YXOOcrxYo8/6+Pwg8HhKukR308wJi?=
 =?iso-8859-1?Q?Q8Tc7EikwPv7eCtUdTZz5jWm1LeZb575vF3swYYGIg6IipsG3S7ecrT5Bh?=
 =?iso-8859-1?Q?+FrIattLK1X3UipRl+y49HwPce2bXQhggRl4VKknnYs2KScRh4oVyk8Umr?=
 =?iso-8859-1?Q?5UMBvQ0KAzGW62fWBw1mCxl86p9lxDCZWv0dpyckbod/GlutiPA00Vtk4c?=
 =?iso-8859-1?Q?161/lFCebIyMJrTa9udwV2QlTK7qYiYcPeIdHG/pX/bWo83FtKR/rAFLjT?=
 =?iso-8859-1?Q?REPDqr7YhmvVOlupWcgp4K4AUBRBzc2O18pKsYZ712PXAbkzeMcseUs/SM?=
 =?iso-8859-1?Q?kEReWbLb8cWAMH2A4n8MZzo2tdeOzuaE5BCjs12VGg4LUyPepVXvYexe/8?=
 =?iso-8859-1?Q?No/ttF1+wwTv5He4GDmCiUVxBHLHdrKz/GT0/wOIVIS7s3s5AQ1FT/r7zy?=
 =?iso-8859-1?Q?JsOSFS3KwOy/VtDcCzbGTswsfUInQsbxsvUc7LUnUlJXZowwagfTSdHCIO?=
 =?iso-8859-1?Q?Z7o46s6beniJoNLI4bPEJCVd6xaNQbgNTarSNrZUycsMFOYbYerEXcVh85?=
 =?iso-8859-1?Q?gBLJa+FQPM5vbZbI7J4Fg14Q4qpen7eP8wE9Jx8D70CnkHgtMH5jah7FR8?=
 =?iso-8859-1?Q?Jy3jfcdheHte74sPwUtTfERODgyVFZMi8dUOUOrxwMx1ASwjRvIZdsA5nn?=
 =?iso-8859-1?Q?UYCxMvc5BSRwtmfGwyDcmf3sBF3BeXyNlIMn/mGfP7TbbDJjnYEoj8xGXG?=
 =?iso-8859-1?Q?zaOZKTWUUsJyYBiaJcTg+TxKi3vLIer6XqltilWY+4NP0s2BfA07Q58ONx?=
 =?iso-8859-1?Q?BfkYI6NW5hwWmTgeLgpkRztz7WpkYZP1eusnpGr/5S5XY4eq8XiHk8+4it?=
 =?iso-8859-1?Q?DNYzbTHZs8/hqkndQXQOTy7MJuPR3FgURWnceA/fZ+NX8rrv6mg5GmhF1s?=
 =?iso-8859-1?Q?pSivPI3R4dXD3+imyiwxqnitB1GW2F2mjOKiEdm9eTi/z5vraxAR0lYQU8?=
 =?iso-8859-1?Q?MVpn9qc7PYNQXySp1tOXT6429trdQBCzJNmOxkn4q0WaAtrUXxluQDI9ZJ?=
 =?iso-8859-1?Q?W6MA4aNcmNGmpBFsmS7ZIw/5D9u1REC14MlKCOW4/S/BjJ4AuouxD2cE7y?=
 =?iso-8859-1?Q?k0R52Tw3smOAbh+iDNGMIwXZ70mzCA+aPmhldShl3NZpsYMVHq8ur6dqxO?=
 =?iso-8859-1?Q?oKMYlFf9w27A2T47EOnI+yk6oLoe3i51vu4B/z34RAHxVqIoN5KiVctku1?=
 =?iso-8859-1?Q?jLwWTJjz90i1SVAJ1lEQdmXJx2p3lg0w/4HdJcqTk26cBaBxC7tMtxnP5l?=
 =?iso-8859-1?Q?dPW0N8/pUZsOD97GSiHc2h44Buh7yjYEVSVFCAWarqeTy9nqHhFwse7Iwd?=
 =?iso-8859-1?Q?gCEVIUt2qNLpa/TQynmPG3D0o8AD/ZptRrBP8pSPXQwSUXfQlWMA35PVS1?=
 =?iso-8859-1?Q?5kgPRiWhUCaNdmLnCqOa+ximZaJBvK2igIOTQ9qmPRF/blMFDl+asaXA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50804346-9409-4745-3ece-08dbcb6fe110
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:16.9516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: athmZe0YnSiUKlKOx/JaNiwB/22yXYb5ojlolh2IbIqs/Z0xfyUd9g4BfdIcz/6BwtBoskeCJ1WH8vLP5ODlrgjSW/CLXM1R19E38cX8Li0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: 3FMKdQ3tyOgELXzpi1gM4MVpENRkgynf
X-Proofpoint-ORIG-GUID: 3FMKdQ3tyOgELXzpi1gM4MVpENRkgynf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Since v5:
- comment indentation (Jan)
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index f3baf52ab6..35c3420885 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
     INIT_LIST_HEAD(&r->range_list);
     r->nr_ranges =3D -1;
=20
-    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
+    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
     r->flags =3D flags;
=20
     safe_strcpy(r->name, name ?: "(no name)");
@@ -575,6 +575,9 @@ void rangeset_domain_printk(
=20
     list_for_each_entry ( r, &d->rangesets, rangeset_list )
     {
+        if ( r->flags & RANGESETF_no_print )
+            continue;
+
         printk("    ");
         rangeset_printk(r);
         printk("\n");
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 135f33f606..f7c69394d6 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -49,8 +49,9 @@ void rangeset_limit(
=20
 /* Flags for passing to rangeset_new(). */
  /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+#define RANGESETF_prettyprint_hex   (1U << 0)
+ /* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
=20
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
--=20
2.42.0

