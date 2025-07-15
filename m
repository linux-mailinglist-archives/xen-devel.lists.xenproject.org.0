Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B974B0565A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 11:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043912.1413956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubc0r-00086L-Fb; Tue, 15 Jul 2025 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043912.1413956; Tue, 15 Jul 2025 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubc0r-00084Y-CT; Tue, 15 Jul 2025 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1043912;
 Tue, 15 Jul 2025 09:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXV7=Z4=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubc0p-00084S-VF
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 09:31:48 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8605f737-615e-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 11:31:45 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB7067.eurprd03.prod.outlook.com (2603:10a6:10:1f6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 09:31:42 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Tue, 15 Jul 2025
 09:31:42 +0000
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
X-Inumbo-ID: 8605f737-615e-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mM16R93Y0v7ceGhxVLTTNZqfrT9rbmU06c7fzoKgodvdNQX7eebwtK93RF88KR7sSLpot8AEZlMAHQ0difZW47+CwyE+UGB8+rm/955BrdtHl0iWGfxads+ezJE+GvgP9jxORCEmfizC0TqcAEC/ynYB5e7dkqaE8otXxER0WiBN1zjTCgzhK+prQYzDuxj2m7rsJT/pEQlMm7/MTWXd5k63Zg40rtuexZpwzyOnvj2tDOtmG8bSN+2dtR2g2M0tcC1Ax9iS/2N5swfDdj8mSPHUdgBG2zdNP9yIjuZEK25OBcZVy++ZhHggnlF3nQNrWqe8uxSvr6LHB+1L0sFsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbFVt0C7vOHCZC2L6ii2U+O+joo2XPYh+CKP4ivmrJA=;
 b=Q3X5cr5oSFxj2PAQkns7jNiiXqsyJzu1FW5IqcmR5zpaekeakiITUmDDVcX4n6ggpAvVG7Hgi6rLPOpNwA730UWrqPnpvMHqpbiGK394T/ZrmRCz3hXiWtNKBI3kByhHSY67sOs9DyUOMDT0HknsTGTg9L5SNNGhGYva6wvZNQI+BM3wXWv+ufPURFu/PHmQh/Ivh0A+STLpGSWTvLaf4JTZ8j/ayrJIqLmpzm63me7r+ROzvmhvNvuCe8lGZso0e1r7euAh3PTiH4J/OK5nKytADtBERmPvGCR0sixdCf66/GX6X6mEcRcaU+wxbc6nNl2nmks86W+dke4Z8mfHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbFVt0C7vOHCZC2L6ii2U+O+joo2XPYh+CKP4ivmrJA=;
 b=HC5cZnhdBqHjcPhnZygDKb0B0oYJwHIKysWNi4JtxigjTmQe6vjK4eEZt9ROhK6UX3S+QmmUNmgpFsXxjTlcay36tv3UFRBjaG5itB9/KTBe1lcluDzkrj+EiwXMQsPtPe6GWxR2ImMPFgzJwl4An19Oeuog9h/LZaNObuvIUlV8UtQKLLwTaM5XroaoUpCGVlz74S6+xE5EBG1NNtZk+D6ctzYLcqSlJbOipoSNMbcK5HgeiSobQ3xg9KlEJfmWDZesUsCkyo+f8mrbbAHGxiYCAsDDy3PyXkB9hVOw1SK+jyr9Qo70SkAs1EbcYBGJTuyx7VPj67rbpkGTuGVN+g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v5] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v5] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb9WtGauJBpc3EJkaPoqdZvIhy9A==
Date: Tue, 15 Jul 2025 09:31:42 +0000
Message-ID:
 <c5a035e0e6b3bd69bafbd3a0397a5924d942f995.1752571686.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB7067:EE_
x-ms-office365-filtering-correlation-id: 5251b69f-dcd9-49d9-ac6c-08ddc3826892
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NmiZMIGKTGQngKETlO7TJat+gp8az7G8HPav2NFTAnqFbho1vR+j5JBjBu?=
 =?iso-8859-1?Q?KGYskNzAAcN9DNvPSz/DQsOhgBuvyR7dw3EMoXHOOCOX7uBUjCm1SbDgXX?=
 =?iso-8859-1?Q?2BrGGV7d6j5iSPrN0oL/aOQkEC6+kdd9jx+PNGaKmMLYymIbUF2gaovDKv?=
 =?iso-8859-1?Q?3Jc9u6ODbH4nq/cTKhnBoo1SpdZk+eyTuVwYvI9feYyv99HLJyAekmKxxK?=
 =?iso-8859-1?Q?XsGJ0ZqQDLHis9Z2CAfSscDE06iQ5jF4vdVshZqKHsbJa9mO5OGanp7tdK?=
 =?iso-8859-1?Q?yCStKzCgYNTd4bWxNHlmhbe0RGmKvPBx5+uGVIvghihtOhnuqBCwli9Q76?=
 =?iso-8859-1?Q?dGQkugV03AmpVY/S3J65Ry1U/2hhSo1JZBQTLL2LsQnOyqOtxt6QsiYAHh?=
 =?iso-8859-1?Q?vAJByrFRuhSSRE1uNrmxVKoaQJ9Gq9jRB9AtIQ2NF85+BVPgcXaG1NGzjL?=
 =?iso-8859-1?Q?N/YF+ecVuqO+eBN4+cWaAqQRqf+mBzjlbIJ2edx6zhKUybMQpMveXOKXkR?=
 =?iso-8859-1?Q?2g2lK89WauLUa891TZYAsjCDCXDcQUUrS08HGuPw56Az1k5UWRQltCszj2?=
 =?iso-8859-1?Q?ZsB8Dl9DSQwz+mV5ucZ6HH24WIvhKLcHsfXIRvL7+W7EH2EfGvZuwD7guh?=
 =?iso-8859-1?Q?Rr8jfcSnecY9XpQUFPbD51s5kSC/lK2kZzN8YA06x0gumGpPWFL4rwJ+5/?=
 =?iso-8859-1?Q?zlSQcfdAR6X+D9eXzF1cgKgSoIxM5NWgLTjL2ixIEda74UzUrhxPr/VM61?=
 =?iso-8859-1?Q?AU5EzFNa7uNtm0d3Xh6M/yooiQLd8jbHgskjsuUnfEs9IDCX2xNuXMrrbx?=
 =?iso-8859-1?Q?4SspWhBWpGB30+GQR57KYZM7379lutxoSVvgMCKRpnBvcmbkfuqxfNK0SV?=
 =?iso-8859-1?Q?b47QVjYRDARVCBxWaXXs7h16oLyqbySGM9mf2rt1lIm9I40l8ZS3Rn4R9l?=
 =?iso-8859-1?Q?S1VvlcKsmxlyYcLXsk9RsANvkld7yTN2MTo0FsD1OREeWTixqKMeQUl6G6?=
 =?iso-8859-1?Q?CyNcxcNKQnOIQj3t4Nq0v1ikEExbbC6MFcyI8vsbN7bKqCVAc+p+Zb/Zrl?=
 =?iso-8859-1?Q?ncQ2+65pyOzOsIi5MyjmJCrcfhroc87v5FYg+1ogME1hXzlEGztKYD02BB?=
 =?iso-8859-1?Q?VhpNw9jHye+6xvxoJIC/8ujVb1kFov5sKG8V89R5trqSurNXHgtjWROaPg?=
 =?iso-8859-1?Q?WrPqYGhNuTHDG9zzZNle4P+bTtWx1ifEUOrlMRlG3ZksrhHFGQn25lAsRg?=
 =?iso-8859-1?Q?4keNRFAvuMO+ws84CR5Ps6oPr8/mJZm208X3Ka07IxVfbafjF6MwDydArY?=
 =?iso-8859-1?Q?NQJi83U8xpX6QFcE2w/iOuB3p2iDmrWO1a1YA1hhAGO49kXvNSF+OzK4Ln?=
 =?iso-8859-1?Q?3ulTPCwcgwBGr59nhqpP1Osy8+BKQ6SXDZX85wyXpqIbTGJaeam3QwH4u0?=
 =?iso-8859-1?Q?veVT5hIW2TD8J1UeZHmQt2n9hFXnS3oJt+U/ybwNP13g0nWBjBwEqXVOuo?=
 =?iso-8859-1?Q?CF8h7DljnqBGFfPW767pSxthLDPzIj7/CQqVt7Aj98xw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qeU4QzrHxyOpNNqwv2zzMd0KAGjEFBzqnyqwc4+cjYuOf2PLlZVIiVvxVo?=
 =?iso-8859-1?Q?8vwT1dki3iSZa315UqC0Fw+0ZSC85o7//VXRITnzjfRUqBC00bc3jCeVSu?=
 =?iso-8859-1?Q?6wOfgcFanY/Y8NhSe3/2yjoa6OvUhoywv/voGXipUcM6t6HmdHvG7BTq3Y?=
 =?iso-8859-1?Q?1mM7Anw+I50ZkIUtH36a81/R+70PJLyMLvqBIp0ovBa/V2ok1cKkAIDUcs?=
 =?iso-8859-1?Q?94BRPjsGrojX/betVDGjdSSCtcFqJTAIKiYPQ8yhs9Ag1QNCfTnmkbgWpB?=
 =?iso-8859-1?Q?FNOTyPq2VbIYvx8xWRzvMGikHLkj0aGFnyqwNXSeqtdI8J46/KqUVDEjus?=
 =?iso-8859-1?Q?6+jozYRQYTthAvfuDgozL3UMFSNrqP6gixpCU1dxgUF1INA0Th6sNvU0GB?=
 =?iso-8859-1?Q?ngHomiEJuIaKfYuJgYiZ0SYji+t8nn+3nmOJ+NnwIEVRCVirn0DlogoOpG?=
 =?iso-8859-1?Q?ouwVZVfDQCqt2kvoAel7VKNPXz4AHxPQQYw6923xwTJmc4pb+QTsfc28Pk?=
 =?iso-8859-1?Q?Gp2+/f23MCKfqawE4t81t3E6kxkeVQYupICIkwvDGs/hy+qq+adB2WZoRW?=
 =?iso-8859-1?Q?ewduHeyUOPXZkJmyph3DpcHrKNClZUeo/bsKlZZJUIVPru/BCSDLgkU4nU?=
 =?iso-8859-1?Q?SIGKy+RSX3gxu4MOJPupSokEPG888G2nIXhfSrofEY3L7U2fbDCWhv4nNd?=
 =?iso-8859-1?Q?dmNjlAqQx9TboBkqlKbH2arxV9fgsqMm+WcnHAbBbfD/PskXmCFmd66+yc?=
 =?iso-8859-1?Q?KFUMfEZvop4tmgil4Jhig1qF28UYFw2OZ+ibbN99oOa6QoUoOUGbb2NMQf?=
 =?iso-8859-1?Q?D+vIb6VKrn40zfdWoeoLjcIExTsmA1OU2yYgCPPuRSyhaZLQOwM0pHvbjX?=
 =?iso-8859-1?Q?YGLqiCpetAWMyfmawFCpkpxi5rhvPspulNX8Q/hSO/1LvxaYy+SU3jLvE6?=
 =?iso-8859-1?Q?9mXiajTT13iEiNpkuTshA1DtwPqfh9PIzAVc1Hqh1FY1NuxzVmvWB/JjgO?=
 =?iso-8859-1?Q?xjDr/sHIFJxR0GsgRVzweZbyMAzXASwQYYeACZGAVN/2t6TQpFdlBmtfi1?=
 =?iso-8859-1?Q?w5Zi9Ism1BIkIfHOvMaj0nocMzgJfGfIwFSI/Z5UbglQa5NnwHEVpkhWl/?=
 =?iso-8859-1?Q?zD1gTFOr0icSq2uraW5nQZ6Egj6kiAJCowh5B4JUc7lGWNxdnSssN4KMr4?=
 =?iso-8859-1?Q?hxKK/54kBIajQN+3ajQn7DJ/0oNWQRLwQKuA5eMD+vava17TH7yc2VdO1z?=
 =?iso-8859-1?Q?MpOqoODp7E2tT6gq4xKdOl+Pt1OkE03z+qojeITQim9pYtYzE672AtcaNr?=
 =?iso-8859-1?Q?EBzUN4GuZZLVTXMvYbSWHiT22feAxy7PbisNoiLD6rdvlzEC7Y/UeHEQdk?=
 =?iso-8859-1?Q?Ul6G3gv9nKfCmT41bT12wOsxyAkNHPESZ1JHAiRZI4mH8rWzeMWiLo3klO?=
 =?iso-8859-1?Q?JEwn4T9QWPmMQ6IyKcUgqryTGLwCgimW30mN0U2dZegruvhFWrPA+NhztB?=
 =?iso-8859-1?Q?mQ1/Juy2WuIOGhyOmWEUHd4fNKtsvxiTQu8Mk1Zl1SUeIm/WLiV/WFNvYY?=
 =?iso-8859-1?Q?6rShUnMgRZwSMSnv1iFE5eEv+u4o1gI+vDcoX+3XJ3ComI/RZHC7LVCc1b?=
 =?iso-8859-1?Q?WyM2tvhHSKnm5c0IlxRS8oUDI5lk+JltBKz1CA+1CpVUZdPiT9Pa2CxA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5251b69f-dcd9-49d9-ac6c-08ddc3826892
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 09:31:42.3612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ox+x906PM1X1fNEVXaYguxu1VUSm762jvMmI0+ZyDTZOHyF02FeM8icEbY5uB2t7XBLD6Hpz29DVAWAw/IYE7TQXjzhT0JezYPpBE4JJUFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7067

Rule 10.1: Operands shall not be of an
inappropriate essential type

The following are non-compliant:
- boolean used as a numeric value.

The result of the '__isleap' macro is a boolean.
Suppress analyser tool finding.

The result of 'NOW() > timeout' is a boolean,
which is compared to a numeric value. Fix this.
Regression was introdiced by commit:
be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.)

Remove pointless cast '(const unsigned short int *)'.
The source array and the destination pointer are both of the same type.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes since v4:
- described dropping cast reason
- updated SAF text
---
 docs/misra/safe.json                  | 8 ++++++++
 xen/common/time.c                     | 3 ++-
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e3489dba8e..3584cb90c6 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -116,6 +116,14 @@
         },
         {
             "id": "SAF-14-safe",
+            "analyser": {
+                "eclair": "MC3A2.R10.1"
+            },
+            "name": "Rule 10.1: use boolean as an array index",
+            "text": "Using a boolean type as an array index is safe."
+        },
+        {
+            "id": "SAF-15-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/time.c b/xen/common/time.c
index 92f7b72464..c873b5731b 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -84,7 +84,8 @@ struct tm gmtime(unsigned long t)
     }
     tbuf.tm_year =3D y - 1900;
     tbuf.tm_yday =3D days;
-    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y)];
+    /* SAF-14-safe use boolean as an array index */
+    ip =3D __mon_lengths[__isleap(y)];
     for ( y =3D 0; days >=3D ip[y]; ++y )
         days -=3D ip[y];
     tbuf.tm_mon =3D y;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index df16235057..4058b18f2c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -315,7 +315,7 @@ static int queue_poll_cons(struct arm_smmu_queue *q, bo=
ol sync, bool wfe)
=20
 	while (queue_sync_cons_in(q),
 	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
-		if ((NOW() > timeout) > 0)
+		if (NOW() > timeout)
 			return -ETIMEDOUT;
=20
 		if (wfe) {
--=20
2.43.0

