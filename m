Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE05155D66
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 19:08:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j07zU-0007QT-DV; Fri, 07 Feb 2020 18:04:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=daOb=33=bombadil.srs.infradead.org=batv+10f92a014825235f1817+6011+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1j07zS-0007QN-TX
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 18:04:31 +0000
X-Inumbo-ID: 48cdd33e-49d4-11ea-a677-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48cdd33e-49d4-11ea-a677-bc764e2007e4;
 Fri, 07 Feb 2020 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pdzGIh6GHeQ+zSXi2jsOiP/+/eLN9C3enP27/pCCJLE=; b=kCq40OszrB80VUrt1s4BfwJ8Oi
 ifg1qFLGHTH5/8Huwzx4dHN+vAYMebo+uXMmg9ZbjYGebxW63lf0TvtfAubhTXkpM7QZxFGKXt/P5
 hyNqXLYckxUFzGzxQal+oMDAkP7tFifVTsQZWZtwzBEhpmGh4iieL8+eRUUwz68mfaX/jm3O7kCrA
 PCdjBM4XYVPkUxz73Qdfp+vI7sdKXmGZXv12JEhXJvkwj7RYHjGZQkjuCAAkBdnyL+WcZnHQVdE4v
 jgS+hC4iAjiyPE4uxYi5L+p+gCToeBu/H4KvARlvA51ji/Smqv923FS2ZXju5stXSG6/0QBnCewZs
 6ANmM3Fw==;
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=freeip.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j07zA-000594-Ar; Fri, 07 Feb 2020 18:04:12 +0000
Message-ID: <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: "Xia, Hongyan" <hongyxia@amazon.com>, "jbeulich@suse.com"
 <jbeulich@suse.com>
Date: Fri, 07 Feb 2020 18:04:06 +0000
In-Reply-To: <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3314079267306141996=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3314079267306141996==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-73xndcL7xwwW8/3u8e7j"


--=-73xndcL7xwwW8/3u8e7j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-02-07 at 17:06 +0000, David Woodhouse wrote:
> On 7 February 2020 16:40:01 GMT, "Xia, Hongyan" <hongyxia@amazon.com> wro=
te:
> > On Fri, 2020-02-07 at 16:32 +0000, David Woodhouse wrote:
> > >=20
> > > ...
> > >=20
> > > Ideally not because init_heap_pages() then calls free_heap_pages()
> > > and the "recursion" is best avoided.
> >=20
> > Kind of depends on where we change its pg to initialised. If we do that
> > in free_heap_pages this does recurse, but if it is done in
> > init_heap_pages before calling free it does not.
>=20
> True. It would *look* like it might recurse, but never should in practice=
.

Looks like this. Less duplication of the 'if (uninitialised)
init_heap_pages() else free_heap_pages()' construct, more scope for
people to na=C3=AFvely complain that it "recurses". I think I prefer it thi=
s
way.



From: David Woodhouse <dwmw@amazon.co.uk>
Date: Fri, 7 Feb 2020 13:01:36 +0000
Subject: [PATCH] xen/mm: Introduce PG_state_uninitialised

It is possible for pages to enter general circulation without ever
being process by init_heap_pages().

For example, pages of the multiboot module containing the initramfs may
be assigned via assign_pages() to dom0 as it is created. And some code
including map_pages_to_xen() has checks on 'system_state' to determine
whether to use the boot or the heap allocator, but it seems impossible
to prove that pages allocated by the boot allocator are not subsequently
freed with free_heap_pages().

This actually works fine in the majority of cases; there are only a few
esoteric corner cases which init_heap_pages() handles before handing the
page range off to free_heap_pages():
 =E2=80=A2 Excluding MFN #0 to avoid inappropriate cross-zone merging.
 =E2=80=A2 Ensuring that the node information structures exist, when the fi=
rst
   page(s) of a given node are handled.
 =E2=80=A2 High order allocations crossing from one node to another.

To handle this case, shift PG_state_inuse from its current value of
zero, to another value. Use zero, which is the initial state of the
entire frame table, as PG_state_uninitialised.

Fix a couple of assertions which were assuming that PG_state_inuse is
zero, and make them cope with the PG_state_uninitialised case too where
appopriate.

Finally, make free_heap_pages() call through to init_heap_pages() when
given a page range which has not been initialised. This cannot keep
recursing because init_heap_pages() will set each page state to
PGC_state_inuse before passing it back to free_heap_pages() for the
second time.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 xen/arch/x86/mm.c        |  3 ++-
 xen/common/page_alloc.c  | 40 ++++++++++++++++++++++++++++------------
 xen/include/asm-arm/mm.h |  3 ++-
 xen/include/asm-x86/mm.h |  3 ++-
 4 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 9b33829084..bf660ee8eb 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -488,7 +488,8 @@ void share_xen_page_with_guest(struct page_info *page, =
struct domain *d,
=20
     page_set_owner(page, d);
     smp_wmb(); /* install valid domain ptr before updating refcnt. */
-    ASSERT((page->count_info & ~PGC_xen_heap) =3D=3D 0);
+    ASSERT((page->count_info & ~PGC_xen_heap) =3D=3D PGC_state_inuse ||
+           (page->count_info & ~PGC_xen_heap) =3D=3D PGC_state_uninitialis=
ed);
=20
     /* Only add to the allocation list if the domain isn't dying. */
     if ( !d->is_dying )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 4084503554..95984d6de0 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -252,6 +252,8 @@ struct bootmem_region {
 static struct bootmem_region __initdata
     bootmem_region_list[PAGE_SIZE / sizeof(struct bootmem_region)];
 static unsigned int __initdata nr_bootmem_regions;
+static void init_heap_pages(struct page_info *pg, unsigned long nr_pages,
+                            bool scrub);
=20
 struct scrub_region {
     unsigned long offset;
@@ -1389,6 +1391,16 @@ static void free_heap_pages(
     ASSERT(order <=3D MAX_ORDER);
     ASSERT(node >=3D 0);
=20
+    if ( page_state_is(pg, uninitialised) )
+    {
+        init_heap_pages(pg, 1 << order, need_scrub);
+        /*
+         * init_heap_pages() will call back into free_heap_pages() for
+         * each page but cannot keep recursing because each page will
+         * be set to PGC_state_inuse first.
+         */
+        return;
+    }
     spin_lock(&heap_lock);
=20
     for ( i =3D 0; i < (1 << order); i++ )
@@ -1780,11 +1792,10 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
  * latter is not on a MAX_ORDER boundary, then we reserve the page by
  * not freeing it to the buddy allocator.
  */
-static void init_heap_pages(
-    struct page_info *pg, unsigned long nr_pages)
+static void init_heap_pages(struct page_info *pg, unsigned long nr_pages,
+                            bool scrub)
 {
     unsigned long i;
-    bool idle_scrub =3D false;
=20
     /*
      * Keep MFN 0 away from the buddy allocator to avoid crossing zone
@@ -1809,7 +1820,7 @@ static void init_heap_pages(
     spin_unlock(&heap_lock);
=20
     if ( system_state < SYS_STATE_active && opt_bootscrub =3D=3D BOOTSCRUB=
_IDLE )
-        idle_scrub =3D true;
+        scrub =3D true;
=20
     for ( i =3D 0; i < nr_pages; i++ )
     {
@@ -1837,7 +1848,8 @@ static void init_heap_pages(
             nr_pages -=3D n;
         }
=20
-        free_heap_pages(pg + i, 0, scrub_debug || idle_scrub);
+        pg[i].count_info =3D PGC_state_inuse;
+        free_heap_pages(pg + i, 0, scrub_debug || scrub);
     }
 }
=20
@@ -1873,7 +1885,7 @@ void __init end_boot_allocator(void)
         if ( (r->s < r->e) &&
              (phys_to_nid(pfn_to_paddr(r->s)) =3D=3D cpu_to_node(0)) )
         {
-            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s, false);
             r->e =3D r->s;
             break;
         }
@@ -1882,7 +1894,7 @@ void __init end_boot_allocator(void)
     {
         struct bootmem_region *r =3D &bootmem_region_list[i];
         if ( r->s < r->e )
-            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s, false);
     }
     nr_bootmem_regions =3D 0;
=20
@@ -2151,7 +2163,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
=20
     memguard_guard_range(maddr_to_virt(ps), pe - ps);
=20
-    init_heap_pages(maddr_to_page(ps), (pe - ps) >> PAGE_SHIFT);
+    init_heap_pages(maddr_to_page(ps), (pe - ps) >> PAGE_SHIFT, false);
 }
=20
=20
@@ -2260,7 +2275,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
     if ( mfn_x(emfn) <=3D mfn_x(smfn) )
         return;
=20
-    init_heap_pages(mfn_to_page(smfn), mfn_x(emfn) - mfn_x(smfn));
+    init_heap_pages(mfn_to_page(smfn), mfn_x(emfn) - mfn_x(smfn), false);
 }
=20
=20
@@ -2301,10 +2316,11 @@ int assign_pages(
     for ( i =3D 0; i < (1 << order); i++ )
     {
         ASSERT(page_get_owner(&pg[i]) =3D=3D NULL);
-        ASSERT(!pg[i].count_info);
+        ASSERT(pg[i].count_info =3D=3D PGC_state_inuse ||
+               pg[i].count_info =3D=3D PGC_state_uninitialised);
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcn=
t. */
-        pg[i].count_info =3D PGC_allocated | 1;
+        pg[i].count_info |=3D PGC_allocated | 1;
         page_list_add_tail(&pg[i], &d->page_list);
     }
=20
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index c9466c8ca0..c696941600 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -117,12 +117,13 @@ struct page_info
   * { inuse, offlining, offlined, free, broken_offlining, broken }
   */
 #define PGC_state                  PG_mask(7, 9)
-#define PGC_state_inuse            PG_mask(0, 9)
+#define PGC_state_uninitialised    PG_mask(0, 9)
 #define PGC_state_offlining        PG_mask(1, 9)
 #define PGC_state_offlined         PG_mask(2, 9)
 #define PGC_state_free             PG_mask(3, 9)
 #define PGC_state_broken_offlining PG_mask(4, 9)
 #define PGC_state_broken           PG_mask(5, 9)
+#define PGC_state_inuse            PG_mask(6, 9)
=20
 #define page_state_is(pg, st)      (((pg)->count_info&PGC_state) =3D=3D PG=
C_state_##st)
 #define page_is_broken(pg)         (page_state_is((pg), broken_offlining) =
||  \
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 3edadf7a7c..645368e6a9 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -72,12 +72,13 @@
   * { inuse, offlining, offlined, free, broken_offlining, broken }
   */
 #define PGC_state                  PG_mask(7, 9)
-#define PGC_state_inuse            PG_mask(0, 9)
+#define PGC_state_uninitialised    PG_mask(0, 9)
 #define PGC_state_offlining        PG_mask(1, 9)
 #define PGC_state_offlined         PG_mask(2, 9)
 #define PGC_state_free             PG_mask(3, 9)
 #define PGC_state_broken_offlining PG_mask(4, 9)
 #define PGC_state_broken           PG_mask(5, 9)
+#define PGC_state_inuse            PG_mask(6, 9)
=20
 #define page_state_is(pg, st)      (((pg)->count_info&PGC_state) =3D=3D PG=
C_state_##st)
 #define page_is_broken(pg)         (page_state_is((pg), broken_offlining) =
||  \
--=20
2.17.1


--=-73xndcL7xwwW8/3u8e7j
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAw
MjA3MTgwNDA2WjAvBgkqhkiG9w0BCQQxIgQgE3p1kGBcin2/63Vd2WUwSb5cZOr2TAv7MADsX8zB
uwQwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAIOOCfz/dTXn4FGVaaYlNWIi04Y1yqjwMIJGzEotegLuXp9ZgvUOpil9DYMUnyCt
AeWik5yx6zuQxuh4sRR9mOMqUxpTY7qJE7wJUPMyjGe0ZNDCrbcqFXpYtgCCBABWIRaepAFrUZnq
1nImUKb6Jjzd39UeEF7pHp21DWRjj9+o47mhz2LqFKmXMuJRUDW6/fRUblMBb+InAO7+Fgu0PNmu
OgJ72nv5oKj0ACkBqvl6Rc4v3SsbmEezEuxQf1HWMRop3udlIEDCL9UT9ml5tAbctSzbS+GI0vcu
1kdzEuj71HimIm26xiwe/e/eyrLo60MI02DbcVKTC6MQy8DOzOoAAAAAAAA=


--=-73xndcL7xwwW8/3u8e7j--



--===============3314079267306141996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3314079267306141996==--


