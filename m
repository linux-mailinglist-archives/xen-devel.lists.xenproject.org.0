Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7845B14DEB9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:15:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCRK-00041D-W0; Thu, 30 Jan 2020 16:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZPhi=3T=bombadil.srs.infradead.org=batv+316c8ce85392a3425e94+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCRJ-000418-2N
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:13:09 +0000
X-Inumbo-ID: 610c9084-437b-11ea-8396-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 610c9084-437b-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Pl1euam4viv9alO2QUlikckgONIfiY6HBbf8PLqOHc=; b=tqztyl1+mAI7HUW34hBeEUxnT0
 sCPKZvHtgV2e7ZrUB5Vj8M3R7Ef6zmKH7WbdqzInzwJn5fKaF/CLt1uBEbecCZG0WPq1HELLpUnjK
 nKLZQgoU5IoK0nGgPYcYAQ88v2Ut5Ur4HBDoN45fhjjp0MOPHYLNXrctp1ydHOHImgHItffFJk/1O
 LLYmx3fGotW0O0GIR76o56jklsBJMbdTc2sCBpzED12gyOYEVblyvcUxrE/Ny2HkATKjc9vZW7MB8
 D823ayfLAOQaON3n/mOE4566kN6LL8tMKJgO/3wnagbOubm76VYsRU/AMPQW041Fe76JnOkaJBW+N
 /3k72TAw==;
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=freeip.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCR6-0004Oi-3X; Thu, 30 Jan 2020 16:12:56 +0000
Message-ID: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:12:52 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 0/22] Live update: boot memory management,
 data stream handling, record format
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 paul@xen.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, Amit Shah <aams@amazon.de>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5096036330932177202=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5096036330932177202==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-+oyXMaWrvWaKJbfwhiAk"


--=-+oyXMaWrvWaKJbfwhiAk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now with added documentation:
http://david.woodhou.se/live-update-handover.pdf


v1:=20
Reserve a contiguous region of memory which can be safely used by the
boot allocator in the new Xen, before the live update data stream has
been processed and thus before the locations of all the other pages
which contain live domain data are known.

v2:

As the last gasp of kexec_reloc(), leave a 'breadcrumb' in the first
words of the reserved bootmem region, for Xen to find the live update
data. Which is mostly a guest-transparent live migration data stream,
except the guest memory is left in-place.

The breadcrumb has a magic value, the physical address of an MFN array
referencing the pages with actual data, and the number of such pages.
All of these are allocated in arbitrary heap pages (and not in the
reserved bootmem region) by the original Xen.

Provide functions on the "save" side for appending to the LU data
stream (designed to cope with the way that hvm_save_size() and
hvm_save() work), and on the "receive" side for detecting and mapping
it.

On the way to excluding "already in use" pages from being added to the
heap at start up, also fix the long-standing bug that pages marked bad
with 'badpage=3D' on the command line weren't being eschewed if they were
above HYPERVISOR_VIRT_END and added directly to the heap; only
init_boot_pages() was doing that filtering.

This is now handled by setting either PGC_broken (for bad pages) or
PGC_allocated (for those containing live update data) in the
corresponding page_info, at a time when the frametable is expected to
be initialised to zero. When init_heap_pages() sees such a page it
knows not to use it. Bad pages thus get completely ignored as they
should be (and put on the pointless page_broken_list that nobody ever
uses AFAICT).

The "in use" pages will need some rehabilitation (of refcount,
ownership etc.) before the system is in a correct state. That will come
shortly, as we start passing real domain data across this mechanism and
processing it.

v3:

Define the migration stream record format based on the libxc format,
provide helper functions for creating and parsing those records in a
live update data stream. Send a basic LU_VERSION record.

Refactor __setup_xen() a little to allow for the different code paths
for creating a new dom0 vs. resuming the existing one after live
update. This currently has stub functions for lu_reserve_pages() and
lu_restore_domains().

Next step is actually passing migration records over this interface
which allow us to preserve a Dom0 from one Xen to the next. We do have
that working in our internal proof-of-concept tree and we're working on
cleaning it up for public consumption.

David Woodhouse (21):
      x86/setup: Don't skip 2MiB underneath relocated Xen image
      x86/boot: Reserve live update boot memory
      Reserve live update memory regions
      Add KEXEC_RANGE_MA_LIVEUPDATE
      Add KEXEC_TYPE_LIVE_UPDATE
      Add IND_WRITE64 primitive to kexec kimage
      Add basic live update stream creation
      Add kimage_add_live_update_data()
      Add basic lu_save_all() shell
      Don't add bad pages above HYPERVISOR_VIRT_END to the domheap
      xen/vmap: allow vmap() to be called during early boot
      x86/setup: move vm_init() before end_boot_allocator()
      Detect live update breadcrumb at boot and map data stream
      Start documenting the live update handover
      Migrate migration stream definitions into Xen public headers
      Add lu_stream_{open,close,append}_record()
      Add LU_VERSION and LU_END records to live update stream
      Add shell of lu_reserve_pages()
      x86/setup: lift dom0 creation out into create_dom0 function
      x86/setup: finish plumbing in live update path through __start_xen()
      x86/setup: simplify handling of initrdidx when no initrd present

Wei Liu (1):
      xen/vmap: allow vm_init_type to be called during early_boot

 docs/misc/xen-command-line.pandoc        |   9 +
 docs/specs/libxc-migration-stream.pandoc |  19 +-
 docs/specs/live-update-handover.pandoc   | 371 +++++++++++++++++++++++++++=
++
 tools/libxc/xc_sr_common.c               |  20 +-
 tools/libxc/xc_sr_common_x86.c           |   4 +-
 tools/libxc/xc_sr_restore.c              |   2 +-
 tools/libxc/xc_sr_restore_x86_hvm.c      |   4 +-
 tools/libxc/xc_sr_restore_x86_pv.c       |   8 +-
 tools/libxc/xc_sr_save.c                 |   2 +-
 tools/libxc/xc_sr_save_x86_hvm.c         |   4 +-
 tools/libxc/xc_sr_save_x86_pv.c          |  12 +-
 tools/libxc/xc_sr_stream_format.h        |  97 +-------
 xen/arch/x86/machine_kexec.c             |  13 +-
 xen/arch/x86/setup.c                     | 395 ++++++++++++++++++++++-----=
----
 xen/arch/x86/x86_64/kexec_reloc.S        |   9 +-
 xen/common/Makefile                      |   1 +
 xen/common/kexec.c                       |  24 ++
 xen/common/kimage.c                      |  34 +++
 xen/common/lu/Makefile                   |   1 +
 xen/common/lu/restore.c                  |  39 +++
 xen/common/lu/save.c                     |  67 ++++++
 xen/common/lu/stream.c                   | 219 +++++++++++++++++
 xen/common/page_alloc.c                  | 128 +++++++++-
 xen/common/vmap.c                        |  45 +++-
 xen/include/Makefile                     |   2 +-
 xen/include/asm-x86/config.h             |   1 +
 xen/include/public/kexec.h               |  13 +-
 xen/include/public/migration_stream.h    | 135 +++++++++++
 xen/include/xen/kimage.h                 |   4 +
 xen/include/xen/lu.h                     |  62 +++++
 xen/include/xen/mm.h                     |   2 +
 31 files changed, 1492 insertions(+), 254 deletions(-)


--=-+oyXMaWrvWaKJbfwhiAk
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
MTMwMTYxMjUyWjAvBgkqhkiG9w0BCQQxIgQgbJxcTPU2o2yCYxC6gF2jaYzEDR0dBr+LfBJAOwvA
W68wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBACOIKfzvdWG2gug7h6okZpjCIV3yVqMRYzCGHZ0nFD/99tsJ4gKqUXzHaj2wST7h
rNMpQcOXH8q/P8aLOjqF8052aflr/d0FHF3iOKEUb1WJ/XMLcMS8Sxf2H/EJG3ljPKYMiUxmuV4w
MoUCNE314MRc03aKVKrl08mLwGC9bpN1UXBhgj9tEnu0CBlHeTIXRIWb72TgFD3QPVsmURWZbf+/
w+WwiizxaKBLeKqRW3r39dcSdl5k0+wDYtXhCsi2ASDXjV1neM9XZlKk6w1Df5nShiY9h8Oik2RQ
rJRmyUb6Dg1CXIvYNF9q389WCQdoBYVWSzMQvu0O8mS+jS5lklUAAAAAAAA=


--=-+oyXMaWrvWaKJbfwhiAk--



--===============5096036330932177202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5096036330932177202==--


