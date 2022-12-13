Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437CF64BDA3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 20:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461134.719178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BLw-0003bh-Oo; Tue, 13 Dec 2022 19:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461134.719178; Tue, 13 Dec 2022 19:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BLw-0003YY-LM; Tue, 13 Dec 2022 19:54:12 +0000
Received: by outflank-mailman (input) for mailman id 461134;
 Tue, 13 Dec 2022 19:54:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsqc=4L=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p5BLv-0003YK-0r
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 19:54:11 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0094.outbound.protection.office365.us [23.103.208.94])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e85604e7-7b1f-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 20:54:10 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1144.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 19:54:07 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 19:54:07 +0000
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
X-Inumbo-ID: e85604e7-7b1f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=O+/0vzajBh+OmvEUVk170fpT1FVhL9xZerkWC9wVoBhm+76ZUfWDDiSq53jgf484a0FCKz7iykqFkUS1g+NzXrBdWOgjdKYTnDBVkOUPqpbcCyIrbTxWfo1+XlATZ+tCexOiqankzhuunFudI9knhUczE7H35F3/nze2i7Uj0oXNp+x7avawrMOx87K2Y/N7pdb7Y8nw62H20CUh629cV8HpGsodfD9bpdoGkXql/0Xure20hcaFD9L1rKSXUCJmhDRXeoomnmhRna9NDsY+OsABU4hgVMtReoHw9HPyfXhf9aalzsDbZWdUboprJoXimBZLAqxn3qL52TYFlIOqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0hQaAJM6caWYQsVLchpOdKLdgvJiFe099wRxpfgIbQ=;
 b=1CKsVqn1PcNis65wzRqOGVxOjJkHRIBph4jSu8QzQUZppcZ2pg8KDzg6FLmy4XIYVzN8lDeXgN/fIseSD1659V3cUYgszp6f1Dxiczc35cCaqHMCunlQ+TZ/PCMTaqDbQ0jHZoijOO6RXA+3vvkBircDtzU/kEIXsb9EoDXX76yqybIjO32PBgW35nVrH2/y8DpYPhiJV4F40jKQj8bmKl+2uGV9lGDfJ1Hwr6HBBghju6NS9+QwaVG0WEC1HTINSN4/rLcMEShzX7TPoJKvQcIfqtSqypybIJBNbSD58zj/waMQVJ8MjIwd6k56OD75wzEOIt7lFe2lvq22YJvGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0hQaAJM6caWYQsVLchpOdKLdgvJiFe099wRxpfgIbQ=;
 b=KYG33CvJUZs56K0bN5ZPLS9FkDuZEnHLZJeKc1TgVkE+BSmez5lfQTS3nqd1eN4nSk9BW4Obvi6FCO6kLZVUu9xsmUl4LxSx2rkM1J98SOJYSKbXRQz7irM/BCLXuRA2mkIxJ+FbDwiTT79SH11CGRY05URcogiFzMHjWAbKuPMAsG9KH4CyTxjzLoiXeHZu2DKRW7d+RF0gBoUr+gij+ZnSwAQspGI1ibzJ+L6CoUrcpiL+RGK5F7YT/8X/Gt2J0Tget54eb7nJ24jkdY+TEPhKGnEmM6u6EUbs95O6kGYf4uX2gPWkx+00iEkoR7D/Dpj4hihchsBGRvWHkBdPYg==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "demi@invisiblethingslab.com"
	<demi@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: [RFC 3/4] Add xen superpage splitting support to arm
Thread-Topic: [RFC 3/4] Add xen superpage splitting support to arm
Thread-Index: AQHZDyypbad3do/0AUGsmgE77Sct8w==
Date: Tue, 13 Dec 2022 19:54:07 +0000
Message-ID:
 <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: a5e26e9e-108f-3533-e10a-338a3d7bfe08
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1144:EE_
x-ms-office365-filtering-correlation-id: 5f3813f8-b491-42a9-268d-08dadd43cbde
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7XpYaVGp3N8EOCa2JupsF7Ms8g0/3Bm5wueOBuuz2r/8w2s1QH6z466VbVgkaDeBXmlLwsRTczgcTK5zpitTcH185bMmdpWxaPOg/2i/uIUPwajJ+hN4u0odtKoBYCZNGDjn7vg/lX16FQ4vISQU8gFfWPzKC/+bBW1+hod13nVdMKp2XEnqF0JejL8/SsqFG2lyU7IwtZhKn874ERf5p0XJ6A7ww36YLl9t9VZSD+BSE0jW0pUfZ1OMRpaW43+sb0zc9JMIIT3sUbMxh/yFnKJThkv8CSTfdAOoepB3LducXSPJSbAUVIadhekZXyA2S/tR7jNJVTHapb3GEONr9xAfrTCMey7aKMVoqCY1HvFtD/1khO5m90ICpJK5v+q42v84KZhaT2L4eS6rS0kE4hzXjSbQVUp4kS/sUTQ+6Fjkj3yrEOZ2OkIhchk9UzTLIYaPvkh6qXq1NX5vpzRqbX6Yve9UnlGyXgm3UAsVYj3KZPQJBnBcJWtRbHJioH2AKj9s5S+/YdBt1U6waJTT7g4Kltn9lx5UAY3UpwYioqZ/DRF3GpVOZ058lb/f4sXrCOjKUpa3DQi4/S1YvoHwuDiEFOaVUZfHxsOL+RJ7WEu9DkJA0uFV9RV5LepqigCByyf5PazZ5wqD8U0iWbkqtg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(451199015)(6506007)(83380400001)(7696005)(9686003)(2940100002)(508600001)(2906002)(6200100001)(86362001)(55016003)(33656002)(54906003)(38100700002)(82960400001)(38070700005)(76116006)(71200400001)(66556008)(66476007)(26005)(4326008)(66946007)(64756008)(8676002)(186003)(66446008)(8936002)(7416002)(6862004)(122000001)(5660300002)(52536014)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 32tv+ytXFtOPFk15lgXZU+fK8Ft0ParkAqR3ZHgLV0XCrRfT+TuM4K7OCz0QJEjECOc5Y6wlVu2Mg3SrlvJj5B3BHfk6j+7SQvV9GwP1XwVAliUF+DSRgvM2HmQwXq3e18dnvoxTrzzkoxllX1Fz6jaRD3lkhtujXspxPEQYBC8bmNEvMDAWgTC7TgdQ/L/7UNcuCfziTQmgkgebVo0wXAMMnWlPUD9xr10Ryg8BuRS9pi4aH/b90JZ7O8PHuIAKYt7iTHdd3nc6sjAWT0yvTiS1owoKjsY9FZf+yqmv8fKQfLIsGEx4+2TZId2rOCoIHnTp3Xh2Ktz1HBqbD38o73G9VtYA6F1dm7QpL3s6yMviV0B59QEk0Ce7IC/hZnuTjxK50GUU8erXt1e2jfJykCuvYRQeaqWFYpkRSOMx8LM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3813f8-b491-42a9-268d-08dadd43cbde
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 19:54:07.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1144

Updates xen_pt_update_entry function from xen/arch/arm/mm.c to=0A=
automatically split superpages as needed.=0A=
---=0A=
 xen/arch/arm/mm.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++----=
----=0A=
 1 file changed, 78 insertions(+), 13 deletions(-)=0A=
=0A=
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c=0A=
index 6301752..91b9c2b 100644=0A=
--- a/xen/arch/arm/mm.c=0A=
+++ b/xen/arch/arm/mm.c=0A=
@@ -753,8 +753,78 @@ static int create_xen_table(lpae_t *entry)=0A=
 }=0A=
 =0A=
 #define XEN_TABLE_MAP_FAILED 0=0A=
-#define XEN_TABLE_SUPER_PAGE 1=0A=
-#define XEN_TABLE_NORMAL_PAGE 2=0A=
+#define XEN_TABLE_NORMAL_PAGE 1=0A=
+=0A=
+/* More or less taken from p2m_split_superpage, without the p2m stuff */=
=0A=
+static bool xen_split_superpage(lpae_t *entry, unsigned int level,=0A=
+                                unsigned int target, const unsigned int *o=
ffsets)=0A=
+{=0A=
+    struct page_info *page;=0A=
+    lpae_t pte, *table;=0A=
+    unsigned int i;=0A=
+    bool rv =3D true;=0A=
+=0A=
+    mfn_t mfn =3D lpae_get_mfn(*entry);=0A=
+    unsigned int next_level =3D level + 1;=0A=
+    unsigned int level_order =3D XEN_PT_LEVEL_ORDER(next_level);=0A=
+=0A=
+    ASSERT(level < target);=0A=
+    ASSERT(lpae_is_superpage(*entry, level));=0A=
+=0A=
+    page =3D alloc_domheap_page(NULL, 0);=0A=
+    if ( !page )=0A=
+        return false;=0A=
+=0A=
+    table =3D __map_domain_page(page);=0A=
+=0A=
+    /*=0A=
+     * We are either splitting a first level 1G page into 512 second level=
=0A=
+     * 2M pages, or a second level 2M page into 512 third level 4K pages.=
=0A=
+     */=0A=
+    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )=0A=
+    {=0A=
+        lpae_t *new_entry =3D table + i;=0A=
+=0A=
+        /*=0A=
+         * Use the content of the superpage entry and override=0A=
+         * the necessary fields. So the correct permission are kept.=0A=
+         */=0A=
+        pte =3D *entry;=0A=
+        lpae_set_mfn(pte, mfn_add(mfn, i << level_order));=0A=
+=0A=
+        /*=0A=
+         * First and second level pages set walk.table =3D 0, but third=0A=
+         * level entries set walk.table =3D 1.=0A=
+         */=0A=
+        pte.walk.table =3D (next_level =3D=3D 3);=0A=
+=0A=
+        write_pte(new_entry, pte);=0A=
+    }=0A=
+=0A=
+    /*=0A=
+     * Shatter superpage in the page to the level we want to make the=0A=
+     * changes.=0A=
+     * This is done outside the loop to avoid checking the offset to=0A=
+     * know whether the entry should be shattered for every entry.=0A=
+     */=0A=
+    if ( next_level !=3D target )=0A=
+        rv =3D xen_split_superpage(table + offsets[next_level],=0A=
+                                 level + 1, target, offsets);=0A=
+=0A=
+    clean_dcache_va_range(table, PAGE_SIZE);=0A=
+    unmap_domain_page(table);=0A=
+=0A=
+    /*=0A=
+     * Generate the entry for this new table we created,=0A=
+     * and write it back in place of the superpage entry.=0A=
+     */=0A=
+    pte =3D mfn_to_xen_entry(page_to_mfn(page), MT_NORMAL);=0A=
+    pte.pt.table =3D 1;=0A=
+    write_pte(entry, pte);=0A=
+    clean_dcache(*entry);=0A=
+=0A=
+    return rv;=0A=
+}=0A=
 =0A=
 /*=0A=
  * Take the currently mapped table, find the corresponding entry,=0A=
@@ -767,16 +837,15 @@ static int create_xen_table(lpae_t *entry)=0A=
  *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry=0A=
  *  was empty, or allocating a new page failed.=0A=
  *  XEN_TABLE_NORMAL_PAGE: next level mapped normally=0A=
- *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.=0A=
  */=0A=
 static int xen_pt_next_level(bool read_only, unsigned int level,=0A=
-                             lpae_t **table, unsigned int offset)=0A=
+                             lpae_t **table, const unsigned int *offsets)=
=0A=
 {=0A=
     lpae_t *entry;=0A=
     int ret;=0A=
     mfn_t mfn;=0A=
 =0A=
-    entry =3D *table + offset;=0A=
+    entry =3D *table + offsets[level];=0A=
 =0A=
     if ( !lpae_is_valid(*entry) )=0A=
     {=0A=
@@ -790,7 +859,8 @@ static int xen_pt_next_level(bool read_only, unsigned i=
nt level,=0A=
 =0A=
     /* The function xen_pt_next_level is never called at the 3rd level */=
=0A=
     if ( lpae_is_mapping(*entry, level) )=0A=
-        return XEN_TABLE_SUPER_PAGE;=0A=
+        /* Shatter the superpage before continuing */=0A=
+        xen_split_superpage(entry, level, level + 1, offsets);=0A=
 =0A=
     mfn =3D lpae_get_mfn(*entry);=0A=
 =0A=
@@ -915,7 +985,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned lon=
g virt,=0A=
     table =3D xen_map_table(root);=0A=
     for ( level =3D HYP_PT_ROOT_LEVEL; level < target; level++ )=0A=
     {=0A=
-        rc =3D xen_pt_next_level(read_only, level, &table, offsets[level])=
;=0A=
+        rc =3D xen_pt_next_level(read_only, level, &table, offsets);=0A=
         if ( rc =3D=3D XEN_TABLE_MAP_FAILED )=0A=
         {=0A=
             /*=0A=
@@ -941,12 +1011,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned l=
ong virt,=0A=
             break;=0A=
     }=0A=
 =0A=
-    if ( level !=3D target )=0A=
-    {=0A=
-        mm_printk("%s: Shattering superpage is not supported\n", __func__)=
;=0A=
-        rc =3D -EOPNOTSUPP;=0A=
-        goto out;=0A=
-    }=0A=
+    BUG_ON( level !=3D target );=0A=
 =0A=
     entry =3D table + offsets[level];=0A=
 =0A=
-- =0A=
2.7.4=0A=
=0A=

