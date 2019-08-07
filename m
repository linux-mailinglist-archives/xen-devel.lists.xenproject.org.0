Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC450847B6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHPG-0002dm-8n; Wed, 07 Aug 2019 08:34:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHPE-0002cp-8q
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:34:48 +0000
X-Inumbo-ID: 35e05970-b8ee-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [62.239.224.234])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35e05970-b8ee-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:34:46 +0000 (UTC)
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 09:34:22 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:34:41 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:34:41 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 24/26] cputlb: Byte swap memory
 transaction attribute
Thread-Index: AQHVTPr0XHOobhwzF02y9V3sLlC8dA==
Date: Wed, 7 Aug 2019 08:34:40 +0000
Message-ID: <1565166880633.15851@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 24/26] cputlb: Byte swap memory
 transaction attribute
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============1829762541040913918=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1829762541040913918==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516688063315851btcom_"

--_000_156516688063315851btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Notice new attribute, byte swap, and force the transaction through the
memory slow path.

Required by architectures that can invert endianness of memory
transaction, e.g. SPARC64 has the Invert Endian TTE bit.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c      | 11 +++++++++++
 include/exec/memattrs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 473b8e6..f6f4dd5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -738,6 +738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulon=
g vaddr,
          */
         address |=3D TLB_RECHECK;
     }
+    if (attrs.byte_swap) {
+        address |=3D TLB_FORCE_SLOW;
+    }
     if (!memory_region_is_ram(section->mr) &&
         !memory_region_is_romd(section->mr)) {
         /* IO memory case */
@@ -891,6 +894,10 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEn=
try *iotlbentry,
     bool locked =3D false;
     MemTxResult r;

+    if (iotlbentry->attrs.byte_swap) {
+        op ^=3D MO_BSWAP;
+    }
+
     section =3D iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs)=
;
     mr =3D section->mr;
     mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
@@ -933,6 +940,10 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry=
 *iotlbentry,
     bool locked =3D false;
     MemTxResult r;

+    if (iotlbentry->attrs.byte_swap) {
+        op ^=3D MO_BSWAP;
+    }
+
     section =3D iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs)=
;
     mr =3D section->mr;
     mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index d4a3477..95f2d20 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -37,6 +37,8 @@ typedef struct MemTxAttrs {
     unsigned int user:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+    /* Invert endianness for this page */
+    unsigned int byte_swap:1;
     /*
      * The following are target-specific page-table bits.  These are not
      * related to actual memory transactions at all.  However, this struct=
ure
--
1.8.3.1

?


--_000_156516688063315851btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">Notice new attribute, byte swap, and =
force the transaction through the</span><br>
</div>
<div>memory slow path.</div>
<div><br>
</div>
<div>Required by architectures that can invert endianness of memory</div>
<div>transaction, e.g. SPARC64 has the Invert Endian TTE bit.</div>
<div><br>
</div>
<div>Suggested-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</=
div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp;| 11 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;</div>
<div>&nbsp;include/exec/memattrs.h | &nbsp;2 &#43;&#43;</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 473b8e6..f6f4dd5 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -738,6 &#43;738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, ta=
rget_ulong vaddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;address |=3D TLB_RECHECK;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;if (attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;address |=3D TLB_FORCE_SLOW;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_is_ram(section-&gt;mr) &amp;&am=
p;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!memory_region_is_romd(section-&gt;m=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* IO memory case */</div>
<div>@@ -891,6 &#43;894,10 @@ static uint64_t io_readx(CPUArchState *env, C=
PUIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp;bool locked =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;if (iotlbentry-&gt;attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;section =3D iotlb_to_section(cpu, iotlbentry-&gt;a=
ddr, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D section-&gt;mr;</div>
<div>&nbsp; &nbsp; &nbsp;mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PA=
GE_MASK) &#43; addr;</div>
<div>@@ -933,6 &#43;940,10 @@ static void io_writex(CPUArchState *env, CPUI=
OTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp;bool locked =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;if (iotlbentry-&gt;attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;section =3D iotlb_to_section(cpu, iotlbentry-&gt;a=
ddr, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D section-&gt;mr;</div>
<div>&nbsp; &nbsp; &nbsp;mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PA=
GE_MASK) &#43; addr;</div>
<div>diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h</div>
<div>index d4a3477..95f2d20 100644</div>
<div>--- a/include/exec/memattrs.h</div>
<div>&#43;&#43;&#43; b/include/exec/memattrs.h</div>
<div>@@ -37,6 &#43;37,8 @@ typedef struct MemTxAttrs {</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int user:1;</div>
<div>&nbsp; &nbsp; &nbsp;/* Requester ID (for MSI for example) */</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int requester_id:16;</div>
<div>&#43; &nbsp; &nbsp;/* Invert endianness for this page */</div>
<div>&#43; &nbsp; &nbsp;unsigned int byte_swap:1;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * The following are target-specific page-table bi=
ts. &nbsp;These are not</div>
<div>&nbsp; &nbsp; &nbsp; * related to actual memory transactions at all. &=
nbsp;However, this structure</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156516688063315851btcom_--


--===============1829762541040913918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1829762541040913918==--

