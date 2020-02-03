Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068215080A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:07:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycKQ-0002DZ-6V; Mon, 03 Feb 2020 14:03:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h6e4=3X=bombadil.srs.infradead.org=batv+ee6ca6619dd19d736ee9+6007+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1iycKO-0002DO-B2
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:03:52 +0000
X-Inumbo-ID: f9b5a400-468d-11ea-b211-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9b5a400-468d-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ywQM+jK2q2qfqEmQXb2NPnPUDHZswLV53FnzjgIFPww=; b=rNQtMyCUPR9kBXxc+WZNzjCOXV
 NtioSZR7GlvVTlIbYAlTn4E+KxpgZtbxjMrOfTiF13a4wWDRdV7GhxmVc62bU8sFGf5YKCDxNCNg+
 6tx0ldkQk2HEBBXNKWNrl+nYCE0GtEI3Q2B4gERZaj1Vv8zB4yqE4rscgr84CDaB11B0j27B86WTD
 8fu3x7UoO5htMcIJVXb+A9f4fDcxDfy1y+h4hOYGCZ2UxX+FhIvTeiwnrBgb/Bs8J0J4lTVWbHhq1
 LIVbogZOWXTIw7mGpZrNwNMcYjkExYxMi77zCTIxlAeq2YYegd5y96B8Dto3uMGDEeilESYQWJup3
 0hR57tLw==;
Received: from [54.239.6.185] (helo=freeip.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iycK8-0000dw-HM; Mon, 03 Feb 2020 14:03:36 +0000
Message-ID: <27e3a6f4e5096f4efab1e4f0949ee0407d592373.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: "Xia, Hongyan" <hongyxia@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Mon, 03 Feb 2020 14:03:32 +0000
In-Reply-To: <0e53f505856481691536d542222a86f08f9eacda.camel@amazon.com>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-6-dwmw2@infradead.org>
 <0e53f505856481691536d542222a86f08f9eacda.camel@amazon.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 6/8] x86/setup: move vm_init() before
 end_boot_allocator()
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
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Gautam,
 Varad" <vrd@amazon.de>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "Durrant, 
 Paul" <pdurrant@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7836318843880117410=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7836318843880117410==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-28v+y4GNbsWbMePWIy32"


--=-28v+y4GNbsWbMePWIy32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-03 at 11:10 +0000, Xia, Hongyan wrote:
> Is there any problem to move vm_init() even earlier than this, like
> right after init_frametable()? ACPI and NUMA functions need a couple of
> things permanently mapped.=20

You want it sooner than that, don't you? The code calls
acpi_boot_table_init() and srat_parse_regions() while looping over the
e820 regions, before init_frametable(). But that's OK; you can call
vm_init() the moment you have the pages in the boot allocator to
support it.

So you can do something like the hack below, for example.

This boots in all three of the liveupdate=3D, <4GiB, >4GiB cases on
x86_64 =E2=80=94 but will probably break Arm unless you make vm_init() run =
soon
enough there too, and will potentially run vm_init() more than once on
x86_64 if acpi_boot_table_init() fails the first time(s).

But as a proof-of-concept, sure.

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2071e5acee..8aee55f31a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1487,12 +1487,16 @@ void __init noreturn __start_xen(unsigned long mbi_=
p)
             continue;
=20
         if ( !acpi_boot_table_init_done &&
-             s >=3D (1ULL << 32) &&
-             !acpi_boot_table_init() )
+             s >=3D (1ULL << 32) )
         {
-            acpi_boot_table_init_done =3D true;
-            srat_parse_regions(s);
-            setup_max_pdx(raw_max_page);
+            printk("acpi/vm init\n");
+            vm_init(); // XX: not idempotent
+            if ( !acpi_boot_table_init() )
+            {
+                acpi_boot_table_init_done =3D true;
+                srat_parse_regions(s);
+                setup_max_pdx(raw_max_page);
+            }
         }
=20
         if ( pfn_to_pdx((e - 1) >> PAGE_SHIFT) >=3D max_pdx )
@@ -1677,14 +1681,16 @@ void __init noreturn __start_xen(unsigned long mbi_=
p)
     init_frametable();
=20
     if ( !acpi_boot_table_init_done )
+    {
+        printk("Late vm/acpi init\n");
+        vm_init();
         acpi_boot_table_init();
+    }
=20
     acpi_numa_init();
=20
     numa_initmem_init(0, raw_max_page);
=20
-    vm_init();
-
     if ( lu_breadcrumb_phys )
     {
         lu_stream_map(&lu_stream, lu_mfnlist_phys, lu_nr_pages);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index f1e7d81edc..e5d938f8ca 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -322,7 +322,7 @@ void __init init_boot_pages(paddr_t ps, paddr_t pe)
                  MAX_ORDER + 1);
 #endif
     BUILD_BUG_ON(sizeof(frame_table->u) !=3D sizeof(unsigned long));
-
+    printk("init boot pages %lx %lx\n", ps, pe);
     ps =3D round_pgup(ps);
     pe =3D round_pgdown(pe);
     if ( pe <=3D ps )
@@ -395,7 +395,7 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, un=
signed long pfn_align)
     unsigned int i =3D nr_bootmem_regions;
=20
     BUG_ON(!nr_bootmem_regions);
-
+    printk("alloc_boot_pages %ld\n", nr_pfns);
     while ( i-- )
     {
         struct bootmem_region *r =3D &bootmem_region_list[i];
diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 4c8bb7839e..b7fcee408e 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -92,10 +92,11 @@ acpi_physical_address __init acpi_os_get_root_pointer(v=
oid)
 void __iomem *
 acpi_os_map_memory(acpi_physical_address phys, acpi_size size)
 {
-	if (system_state >=3D SYS_STATE_boot) {
+	if (1 || system_state >=3D SYS_STATE_boot) {
 		mfn_t mfn =3D _mfn(PFN_DOWN(phys));
 		unsigned int offs =3D phys & (PAGE_SIZE - 1);
=20
+        printk("ACPI vmap %08lx\n", phys);
 		/* The low first Mb is always mapped on x86. */
 		if (IS_ENABLED(CONFIG_X86) && !((phys + size - 1) >> 20))
 			return __va(phys);
@@ -114,7 +115,7 @@ void acpi_os_unmap_memory(void __iomem * virt, acpi_siz=
e size)
 		return;
 	}
=20
-	if (system_state >=3D SYS_STATE_boot)
+	if (1 || system_state >=3D SYS_STATE_boot)
 		vunmap((void *)((unsigned long)virt & PAGE_MASK));
 }
=20


--=-28v+y4GNbsWbMePWIy32
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
MjAzMTQwMzMyWjAvBgkqhkiG9w0BCQQxIgQgu8YyJbwki2GvVrIZvAq8XEga9f1EciVJ34OIDMfD
Vwwwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAHOPWDWNPh63KZ0HY+ot63tmxCdxnAqir22PjjLtd8zWlqyqO/oOylpvh3g1nwFb
cPMEkNXhJfassTU2VAwnAF3W9QPyYbm5bzY2l1LaTS1DOuLsf/TEirAYFB5pY2jql+e3rrFSI6kg
94zFlUHyQXPKvKLwvGYfzl7/4ds4gSDAoOUKIFnt2soxNB/MybQsQbFxlfYHiusc/bc7nKPjXXuL
1j8vtK9Rqnx2DuMLe6QMzkWgOUr7AAJbdSoAmi4F/KLP2BUcGYtz2akvkQ1Em49d9/7C2t1Tjcl8
t0Qyi2iru4EZJQlGNRqCF+Wj7THXF5SC1jkALaCVDzpzMDp8gooAAAAAAAA=


--=-28v+y4GNbsWbMePWIy32--



--===============7836318843880117410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7836318843880117410==--


