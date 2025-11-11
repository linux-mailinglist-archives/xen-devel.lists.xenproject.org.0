Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42204C4FACD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159343.1487713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugp-0007Vm-Mq; Tue, 11 Nov 2025 20:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159343.1487713; Tue, 11 Nov 2025 20:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugp-0007TF-Jk; Tue, 11 Nov 2025 20:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1159343;
 Tue, 11 Nov 2025 20:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIugm-0006ga-K6
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:10:04 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68c19a29-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:10:03 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:10:01 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:10:01 +0000
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
X-Inumbo-ID: 68c19a29-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uqqrbz1fkos4x7kBPHdwWFSUVzINzWgiIufyXJj0dGO8++zyKGAIj2Mu6aITQSlzodf3vKCNFQs8eYbzvEf+y3aTAwMap4q38pUJ9E0uAs2CANwZuQNmt7jqv6in91eJ97UKFHVaQlt5c1Jan0TJM3yCQ/4n2nDsP2iqbCsnG+cwMMrcWeHd+uVG4WW5xDZ+yUrsSPHBFPq+U6THOzZmcL/mUix9heQuNBlzeJeh7BQk1uCXvQENkHIywct8M1VPhlUSpTGPNIKWcdpUbJSmpE8JqI2wH5xu5hjInVpHw6YCdHD61cDDH0CusfRLp89+cOCLv9qZMS7p5emG/70Few==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+avs39yG5SK8mfCma+H15nY8tDlKMQPGd027kBE3V08=;
 b=cj7Qg+Qvm0K/gJv/g100ujBGKk2iEcngFIDX8EenC7oC2RSUKy7ZyLtsmUI8anRxbi89hMoIKbij6svktY2+NTAOUx05CqO+NNJUYq5XOcPd++/0q/meI461IgAj8ZjYFZiaapEgOjLPS7nHP073qXpZ0Ye89WhNYyG9A9BuL5lQIocLsGOFAMt0lC9GR1MZp30suz91bYgkRTaY8dKX5nmdyoQ5gq1qcM1Oio0fX/tTmQIB1jViy7woOIaJjxlKLb1in5CO2ZQZ6stuIoDGzBuwKeSmwm4Lgzh5y5K3QIXGdcvYzq1zFPP1GQ2vUcMNp7d1Ck3zBIg/IPymckfaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+avs39yG5SK8mfCma+H15nY8tDlKMQPGd027kBE3V08=;
 b=jnM21kvUxEmgw5VuTbkCibomGjwSmfuOmYZFu88I/khYJ0hbwa2/crHRmJ1ls8e7BpdEP47T+c0EgI5VTN455UpPtavcGc4DBc/IlCstP9F/+IS+wFPesHkfx8M+dHiFyrWz+5qTzcBXsWlEjCMxZhlQywC3vjQNI47WuSI1XfU+bMlAaJCUGV1jSUivbONLPATXt6oJuItO+d05MpldMXoTRw69sMunz2ybIWURMh80v/jar77/GKkJxhG1so8NwFfhVD2Btm50+qUbMwny5Q4NVsYo+OdlH55VKUrPQTdxjzGm4OKLwXXrSnIBkk/+UlCRef6cBSylWuox28xwdg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
Thread-Topic: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to
 vmx code
Thread-Index: AQHcU0coeroPA1YNb0eMzNzEaOtgJQ==
Date: Tue, 11 Nov 2025 20:10:00 +0000
Message-ID: <20251111200958.3576341-2-grygorii_strashko@epam.com>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111200958.3576341-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: f14df5e5-b372-4f34-8d9b-08de215e4bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AGasMzrpATybdeml51+oHyQfy3913jr+rA1gW8zKjwF7Sg+v0ZY5w1vu6I?=
 =?iso-8859-1?Q?O43G9Qxo9udlnWCSEgP2iLzCGJTTRgGv829mgF5rQs8JEv270+1lSFfEtC?=
 =?iso-8859-1?Q?tIHUbZmXABiLPU8+Ogu086gi+u+KXOGJT9nIY4uDs/fHGED1dMp75pkoem?=
 =?iso-8859-1?Q?zQ9QwMrwPEc40dXW7Db2FHQAGn4LPewEbggJd2icpBrz/b7OGt/Bw82h3v?=
 =?iso-8859-1?Q?XdOCSgnApz0TYZQJOx7xi1/6zTnU9S1f7lGHcnLhMhMsZlB8kAaTHF3fRU?=
 =?iso-8859-1?Q?NLia3SL3+RKS/WRvH75WbW/q21tRcXe0muO2+ijllqjMzRHwglDxg5wJwf?=
 =?iso-8859-1?Q?I6ybGu+XfBUY5S89vR8z4KvgiLN+oU1/yYQMAlEMNoTiRSajOzuf40RA/F?=
 =?iso-8859-1?Q?+wGEMEddAnsYw6Zt9smSVDGUPyBlaPRxGeJmiZ8qslU7qN0zpyPU5RHgI2?=
 =?iso-8859-1?Q?92/gUgEYvahFkK7/wx458LLVixdy0PR1WGFg9+/LiOHgjv5iZp4l8ILLv/?=
 =?iso-8859-1?Q?jSCyBl63jF/RhI2lquIr9CkbjEiloyiKlDD+gfp+acd/A83WwzAr0KCa/f?=
 =?iso-8859-1?Q?N2LpcrvnR0042zLZh3Pj+RyF9NdmI8J65X/nLBcEjillmmWZWJngcsYQyX?=
 =?iso-8859-1?Q?jo9fEIZZPRRuNqDXCv6VikLVZJ+bsG04Mk8fwaFncMkska4zzKSEDeoQs4?=
 =?iso-8859-1?Q?WgFU/mFpMlUQshPBMdmnJnLErMyYI1lgj7MNJPKMNVq+Zt6tS0K2WRNxSu?=
 =?iso-8859-1?Q?cXcMifxE/vQikVnLqaZUcFkcYjTEAQF4g6WPvcVtUQlvel5iIEMW6SUmRo?=
 =?iso-8859-1?Q?IxSn055ZXqLdUC7ilU65nadW0lC21rE1ROi0eR4j9fxDD7KA2iAk1+vH16?=
 =?iso-8859-1?Q?jJQIC511Dv7BbpIj8Rp7qASk20BwYj2kK8Rujkr+SxiX9Ocp4Dj+1nCGHR?=
 =?iso-8859-1?Q?bmdx1DmrqFrxMyIZEfjvrkiSbBEyKXiZb3E84dc6HYdlicAF2MboqQIx1P?=
 =?iso-8859-1?Q?nPXtUkOZ87x/nv8pGgx6uT7AaCpmqeWTpFDzNQlb5gelE5eHLId2jrcbro?=
 =?iso-8859-1?Q?zeQxBi06VGZV7kqOA4vC5uEhH71uT0AQ7qmPEgU6gWcuch1M6a3ZtQ8JyR?=
 =?iso-8859-1?Q?EmcKCskmTrbhrBSpCQF2ZZfqC9/fNeEFhYmCUe3Jqdasmy5zRp2PP8Ft09?=
 =?iso-8859-1?Q?7RKIiYQRPF12dnpH4TUCfr+Oax8z9hMVqvYKr5h4NIRo0DLMgyTilNnJ5u?=
 =?iso-8859-1?Q?b0OuWQL4Vx5BoQRe0TOQN9mKNY6a6dhPO40aD8Arggg/00tlHq0698dM4r?=
 =?iso-8859-1?Q?FXm/BWf1jH+S1kNnzTwJFMHzD9qCOrHQcT7gf1YEu5dOxBTLvReOK9g23B?=
 =?iso-8859-1?Q?YG7hhanMaDRlcDkXvIsEyWMZQJPU/3WX5KrKyNbUIBKGWTMnnesyR/e91m?=
 =?iso-8859-1?Q?xOsgwyjVkpZjdPH9keT4bibvFwMkdaYWB6kSancv9jZL9CYxhrHPHXpHEj?=
 =?iso-8859-1?Q?MsND8zyRGG0bXQsbyobvgqeg4708pmzz7XF8HnTbnE6xls4EPcd7KtmnqC?=
 =?iso-8859-1?Q?c8wvkyaZOyPbNIpIJtrSwLaUbbyu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HNu/SlnkzQoXocXQyj+yMQxFyDSfs832PTizwcfqpPQgPbyhH1Ji89Igiz?=
 =?iso-8859-1?Q?gvfL6cvTkZLyAfdfQQkHV6c+gux1rpDjU2wBPOcV7UcSvQxFGvRnpxVNR8?=
 =?iso-8859-1?Q?nUTWxu43jvB64jJ8hQyxaB9MNh/SUSsYwa2UOEa/O8xc4xtn1f9oNGpmRC?=
 =?iso-8859-1?Q?OfzbithEmSPBMHfKaBhoZlxq55KKBvFHVeU4bvsAS3m9UcPqIuEitVpfET?=
 =?iso-8859-1?Q?3cRq6tfBtiO/Sjep8LABU5Aw8tTOYMnIkYsKsDwTqJDqrdkAqXjlOQm8Gs?=
 =?iso-8859-1?Q?vP68Ve7vW3WqEZUNLvo6tT5/5f2XWQRBjTgzFPtNPHtWVrUMcxlJPjSMTs?=
 =?iso-8859-1?Q?nzotaZXqX2gng5MAkh67g00Dt+4wgqVlnTZb5W6nwVx95GUaIBI6WncviX?=
 =?iso-8859-1?Q?IP9mjPSACvrlC96yiP5npcGxK5H90VR7wxudzysgA521XiHlT2+lNEWVvL?=
 =?iso-8859-1?Q?3Fvqjgbb6J4KDs8FyJP6+dxJH18LEsDPSMzdDrqvdvxvkDYfDTsPG5eSX7?=
 =?iso-8859-1?Q?UJUWfjZaW80wdiZyrN7q/07BphMODK9H+rc9kCadVGIJiQf2ccTKRbwb5D?=
 =?iso-8859-1?Q?GB6gMrQ+f2kWGd9+VPCIwFj0DjjZoYvaByd52YDPg4LnbEeAVtx6mx6ANQ?=
 =?iso-8859-1?Q?UvFUkfNZyZYZJfuMBSfxjVMfCeeimi7yaI/wTo0MXNUxnu8rhOCAYXgkWF?=
 =?iso-8859-1?Q?4XE2O2nYe+6ratPsXRKrCq7YRq1Nc4iVWy1fuyMhYAYP7P+mI57/SrFCzO?=
 =?iso-8859-1?Q?YikVNjn6PejjNeSmKuWXlSNrSOXzLE5/R+2+i5UzfrpEoLjHEmrJwYHnHS?=
 =?iso-8859-1?Q?LHNZ75fo+77K6BqpygkhoQXcQaak63ccK38hSs73l3BeU1U+E089OOfu9w?=
 =?iso-8859-1?Q?6+MQ1U3JrUX2LQV1tI79Kgsl6V60gi7d195q8KX1SLu2ShaN98XKBlU5aK?=
 =?iso-8859-1?Q?jqv5SDx5S9hezlw+KACMEKFSLqc67piFRsCnjkcz2wnKDQQp5iyYHH6jOr?=
 =?iso-8859-1?Q?z5viBKyO+xy3h8cOldLrSSNjwIbKTLJhyI7HhHl/0AaSOxaHqgxa9SgwQ7?=
 =?iso-8859-1?Q?akOGWVDW7uR5UlaGWZmlsWZex/0yO3yzT4XAlj/oijfbjUyH+VG83UytYB?=
 =?iso-8859-1?Q?8CLAEVnnc90c2TeJ77weLGPr5zNMO0e3jHHXQMbHzUI3dh4T6ZuoCSbLbq?=
 =?iso-8859-1?Q?OeZgW0Ub4Ak4s74/GT+apXVX5ftVhHvEuvFPe7BVXd0k7fSYCAKs2x87Bm?=
 =?iso-8859-1?Q?I82l+g+yIjJCKydlDHY2NawcAI/uI+nGFAo8uveTBtGa+If2b9uVkoehbk?=
 =?iso-8859-1?Q?u+9AR5LKbVTO7ZikH5W80EBF1jRqLEJyboV+oLUPsn8RTfAjKjsCLu1dlR?=
 =?iso-8859-1?Q?G0lb+96+WObv1mINKB3ebMjA/GNrey2oGjkASHyOsqRm09NdgLghUigx7U?=
 =?iso-8859-1?Q?c34k58S17KN5FWOXRBKdJZr6zJFUAmC2hgqYUd/EAru9qENJEtY5hg0YwT?=
 =?iso-8859-1?Q?ofzryADm9MOa28M8UH588f30aizn3laQPHB6BXF4CF9xrjLzBkUxJolhTH?=
 =?iso-8859-1?Q?+n7uBzLMhvn1onKwDdf5wvfEX55rx70zFKYPtE/1pnSuIgk/wFfadf2/RZ?=
 =?iso-8859-1?Q?mnqlo99fTF16b+xQJOfgEAMvwTOhs/2zdZaiEnRF7fHm+Dpit1/hdPwQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14df5e5-b372-4f34-8d9b-08de215e4bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:10:00.2924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLpOg/lUrMhLeMu15ZzPZOvIbY3IRzTPHMu9ng/mbXw3jNsPgekHynekggG0xK/qe+36nbKiYzoQj2PXnqDINPrzlefjWQLqmjw2o5Lp3IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

Functions:
 hvm_shadow_handle_cd()
 hvm_set_uc_mode()
 domain_exit_uc_mode()
are used only by Intel VMX code, so move them to VMX code.

While here:
- minor format change in domain_exit_uc_mode()
- s/(0/1)/(false/true) for bool types
- use "struct domain *" as parameter in hvm_set_uc_mode()
- use "struct domain *d" as local var in hvm_shadow_handle_cd()

No functional changes.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- use "struct domain *" as parameter in hvm_set_uc_mode()
- use "struct domain *d" as local var in hvm_shadow_handle_cd()
- move code before vmx_handle_cd()

 xen/arch/x86/hvm/hvm.c                 | 58 ------------------------
 xen/arch/x86/hvm/vmx/vmx.c             | 61 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/support.h |  2 -
 3 files changed, 61 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index da3cde1ff0e6..9caca93e5f56 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2168,30 +2168,6 @@ int hvm_set_efer(uint64_t value)
     return X86EMUL_OKAY;
 }
=20
-/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
-static bool domain_exit_uc_mode(struct vcpu *v)
-{
-    struct domain *d =3D v->domain;
-    struct vcpu *vs;
-
-    for_each_vcpu ( d, vs )
-    {
-        if ( (vs =3D=3D v) || !vs->is_initialised )
-            continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
-             mtrr_pat_not_equal(vs, v) )
-            return 0;
-    }
-
-    return 1;
-}
-
-static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
-{
-    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
-    shadow_blow_tables_per_domain(v->domain);
-}
-
 int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
 {
     struct vcpu *curr =3D current;
@@ -2273,40 +2249,6 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gp=
r)
     return X86EMUL_UNHANDLEABLE;
 }
=20
-void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
-{
-    if ( value & X86_CR0_CD )
-    {
-        /* Entering no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
-
-        if ( !v->domain->arch.hvm.is_in_uc_mode )
-        {
-            domain_pause_nosync(v->domain);
-
-            /* Flush physical caches. */
-            flush_all(FLUSH_CACHE_EVICT);
-            hvm_set_uc_mode(v, 1);
-
-            domain_unpause(v->domain);
-        }
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
-    }
-    else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
-    {
-        /* Exit from no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
-
-        if ( domain_exit_uc_mode(v) )
-            hvm_set_uc_mode(v, 0);
-
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
-    }
-}
-
 static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned long v=
alue)
 {
     v->arch.hvm.guest_cr[cr] =3D value;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6f2cc635e582..d7efd0a73add 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -44,6 +44,7 @@
 #include <asm/processor.h>
 #include <asm/prot-key.h>
 #include <asm/regs.h>
+#include <asm/shadow.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
 #include <asm/x86_emulate.h>
@@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v=
, u64 *gpat)
     return 1;
 }
=20
+/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
+static bool domain_exit_uc_mode(struct vcpu *v)
+{
+    struct domain *d =3D v->domain;
+    struct vcpu *vs;
+
+    for_each_vcpu(d, vs)
+    {
+        if ( (vs =3D=3D v) || !vs->is_initialised )
+            continue;
+        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+             mtrr_pat_not_equal(vs, v) )
+            return false;
+    }
+
+    return true;
+}
+
+static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
+{
+    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    shadow_blow_tables_per_domain(d);
+}
+
+static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
+{
+    struct domain *d =3D v->domain;
+
+    if ( value & X86_CR0_CD )
+    {
+        /* Entering no fill cache mode. */
+        spin_lock(&d->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+
+        if ( !d->arch.hvm.is_in_uc_mode )
+        {
+            domain_pause_nosync(d);
+
+            /* Flush physical caches. */
+            flush_all(FLUSH_CACHE_EVICT);
+            hvm_set_uc_mode(d, true);
+
+            domain_unpause(d);
+        }
+        spin_unlock(&d->arch.hvm.uc_lock);
+    }
+    else if ( !(value & X86_CR0_CD) &&
+              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+    {
+        /* Exit from no fill cache mode. */
+        spin_lock(&d->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+
+        if ( domain_exit_uc_mode(v) )
+            hvm_set_uc_mode(d, false);
+
+        spin_unlock(&d->arch.hvm.uc_lock);
+    }
+}
+
 static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( !paging_mode_hap(v->domain) )
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/=
asm/hvm/support.h
index 2a7ba36af06f..9e9fa6295567 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -119,8 +119,6 @@ void hvm_rdtsc_intercept(struct cpu_user_regs *regs);
=20
 int __must_check hvm_handle_xsetbv(u32 index, u64 new_bv);
=20
-void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value);
-
 /*
  * These functions all return X86EMUL return codes.  For hvm_set_*(), the
  * caller is responsible for injecting #GP[0] if X86EMUL_EXCEPTION is
--=20
2.34.1

