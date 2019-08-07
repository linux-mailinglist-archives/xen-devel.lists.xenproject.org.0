Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCB847B9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:38:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHPl-0002tA-Mc; Wed, 07 Aug 2019 08:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHPk-0002sx-Sc
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:35:20 +0000
X-Inumbo-ID: 48e13e3c-b8ee-11e9-8b10-1b62b6a34d5b
Received: from smtpe1.intersmtp.com (unknown [213.121.35.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48e13e3c-b8ee-11e9-8b10-1b62b6a34d5b;
 Wed, 07 Aug 2019 08:35:18 +0000 (UTC)
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:35:06 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:35:12 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:35:12 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 25/26] target/sparc: Add TLB entry with
 attributes
Thread-Index: AQHVTPsHOMOJY1ka10+nfLY5C/70vQ==
Date: Wed, 7 Aug 2019 08:35:12 +0000
Message-ID: <1565166911751.16655@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 25/26] target/sparc: Add TLB
 entry with attributes
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
Content-Type: multipart/mixed; boundary="===============0258353548311112398=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0258353548311112398==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516691175116655btcom_"

--_000_156516691175116655btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Append MemTxAttrs to interfaces so we can pass along up coming Invert
Endian TTE bit on SPARC64.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/mmu_helper.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index cbd1e91..826e14b 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -88,7 +88,7 @@ static const int perm_table[2][8] =3D {
 };

 static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index,
+                                int *prot, int *access_index, MemTxAttrs *=
attrs,
                                 target_ulong address, int rw, int mmu_idx,
                                 target_ulong *page_size)
 {
@@ -219,6 +219,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
     target_ulong vaddr;
     target_ulong page_size;
     int error_code =3D 0, prot, access_index;
+    MemTxAttrs attrs =3D {};

     /*
      * TODO: If we ever need tlb_vaddr_to_host for this target,
@@ -229,7 +230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
     assert(!probe);

     address &=3D TARGET_PAGE_MASK;
-    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,
+    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,=
 &attrs,
                                       address, access_type,
                                       mmu_idx, &page_size);
     vaddr =3D address;
@@ -490,8 +491,8 @@ static inline int ultrasparc_tag_match(SparcTLBEntry *t=
lb,
     return 0;
 }

-static int get_physical_address_data(CPUSPARCState *env,
-                                     hwaddr *physical, int *prot,
+static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
+                                     int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int rw, int mmu=
_idx)
 {
     CPUState *cs =3D env_cpu(env);
@@ -608,8 +609,8 @@ static int get_physical_address_data(CPUSPARCState *env=
,
     return 1;
 }

-static int get_physical_address_code(CPUSPARCState *env,
-                                     hwaddr *physical, int *prot,
+static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
+                                     int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int mmu_idx)
 {
     CPUState *cs =3D env_cpu(env);
@@ -686,7 +687,7 @@ static int get_physical_address_code(CPUSPARCState *env=
,
 }

 static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index,
+                                int *prot, int *access_index, MemTxAttrs *=
attrs,
                                 target_ulong address, int rw, int mmu_idx,
                                 target_ulong *page_size)
 {
@@ -716,11 +717,11 @@ static int get_physical_address(CPUSPARCState *env, h=
waddr *physical,
     }

     if (rw =3D=3D 2) {
-        return get_physical_address_code(env, physical, prot, address,
+        return get_physical_address_code(env, physical, prot, attrs, addre=
ss,
                                          mmu_idx);
     } else {
-        return get_physical_address_data(env, physical, prot, address, rw,
-                                         mmu_idx);
+        return get_physical_address_data(env, physical, prot, attrs, addre=
ss,
+                                         rw, mmu_idx);
     }
 }

@@ -734,10 +735,11 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
     target_ulong vaddr;
     hwaddr paddr;
     target_ulong page_size;
+    MemTxAttrs attrs =3D {};
     int error_code =3D 0, prot, access_index;

     address &=3D TARGET_PAGE_MASK;
-    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,
+    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,=
 &attrs,
                                       address, access_type,
                                       mmu_idx, &page_size);
     if (likely(error_code =3D=3D 0)) {
@@ -747,7 +749,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
                                    env->dmmu.mmu_primary_context,
                                    env->dmmu.mmu_secondary_context);

-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
+        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, prot, mmu_idx,
+                                page_size);
         return true;
     }
     if (probe) {
@@ -849,9 +852,10 @@ static int cpu_sparc_get_phys_page(CPUSPARCState *env,=
 hwaddr *phys,
 {
     target_ulong page_size;
     int prot, access_index;
+    MemTxAttrs attrs =3D {};

-    return get_physical_address(env, phys, &prot, &access_index, addr, rw,
-                                mmu_idx, &page_size);
+    return get_physical_address(env, phys, &prot, &access_index, &attrs, a=
ddr,
+                                rw, mmu_idx, &page_size);
 }

 #if defined(TARGET_SPARC64)
--
1.8.3.1

?


--_000_156516691175116655btcom_
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
<div><span style=3D"font-size: 10pt;">Append MemTxAttrs to interfaces so we=
 can pass along up coming Invert</span><br>
</div>
<div>Endian TTE bit on SPARC64.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;target/sparc/mmu_helper.c | 32 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------------</di=
v>
<div>&nbsp;1 file changed, 18 insertions(&#43;), 14 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c</di=
v>
<div>index cbd1e91..826e14b 100644</div>
<div>--- a/target/sparc/mmu_helper.c</div>
<div>&#43;&#43;&#43; b/target/sparc/mmu_helper.c</div>
<div>@@ -88,7 &#43;88,7 @@ static const int perm_table[2][8] =3D {</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int get_physical_address(CPUSPARCState *env, hwaddr *phys=
ical,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index,</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index=
, MemTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong address, int r=
w, int mmu_idx,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong *page_size)</d=
iv>
<div>&nbsp;{</div>
<div>@@ -219,6 &#43;219,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong vaddr;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&nbsp; &nbsp; &nbsp;int error_code =3D 0, prot, access_index;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * TODO: If we ever need tlb_vaddr_to_host for thi=
s target,</div>
<div>@@ -229,7 &#43;230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp;assert(!probe);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;address &amp;=3D TARGET_PAGE_MASK;</div>
<div>- &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr, &a=
mp;prot, &amp;access_index,</div>
<div>&#43; &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr=
, &amp;prot, &amp;access_index, &amp;attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addres=
s, access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_id=
x, &amp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp;vaddr =3D address;</div>
<div>@@ -490,8 &#43;491,8 @@ static inline int ultrasparc_tag_match(SparcTL=
BEntry *tlb,</div>
<div>&nbsp; &nbsp; &nbsp;return 0;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static int get_physical_address_data(CPUSPARCState *env,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwaddr *physical,=
 int *prot,</div>
<div>&#43;static int get_physical_address_data(CPUSPARCState *env, hwaddr *=
physical,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int *prot, Me=
mTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong=
 address, int rw, int mmu_idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cs =3D env_cpu(env);</div>
<div>@@ -608,8 &#43;609,8 @@ static int get_physical_address_data(CPUSPARCS=
tate *env,</div>
<div>&nbsp; &nbsp; &nbsp;return 1;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static int get_physical_address_code(CPUSPARCState *env,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwaddr *physical,=
 int *prot,</div>
<div>&#43;static int get_physical_address_code(CPUSPARCState *env, hwaddr *=
physical,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int *prot, Me=
mTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong=
 address, int mmu_idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cs =3D env_cpu(env);</div>
<div>@@ -686,7 &#43;687,7 @@ static int get_physical_address_code(CPUSPARCS=
tate *env,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static int get_physical_address(CPUSPARCState *env, hwaddr *phys=
ical,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index,</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index=
, MemTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong address, int r=
w, int mmu_idx,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong *page_size)</d=
iv>
<div>&nbsp;{</div>
<div>@@ -716,11 &#43;717,11 @@ static int get_physical_address(CPUSPARCStat=
e *env, hwaddr *physical,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (rw =3D=3D 2) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_code(env, phy=
sical, prot, address,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_code(env,=
 physical, prot, attrs, address,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; mmu_idx);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_data(env, phy=
sical, prot, address, rw,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu=
_idx);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_data(env,=
 physical, prot, attrs, address,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 rw, mmu_idx);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -734,10 &#43;735,11 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr =
address, int size,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong vaddr;</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr paddr;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp; &nbsp; &nbsp;int error_code =3D 0, prot, access_index;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;address &amp;=3D TARGET_PAGE_MASK;</div>
<div>- &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr, &a=
mp;prot, &amp;access_index,</div>
<div>&#43; &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr=
, &amp;prot, &amp;access_index, &amp;attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addres=
s, access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_id=
x, &amp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp;if (likely(error_code =3D=3D 0)) {</div>
<div>@@ -747,7 &#43;749,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; env-&gt;dmmu.mmu_pr=
imary_context,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; env-&gt;dmmu.mmu_se=
condary_context);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tlb_set_page(cs, vaddr, paddr, prot, mmu_=
idx, page_size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tlb_set_page_with_attrs(cs, vaddr, pa=
ddr, attrs, prot, mmu_idx,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (probe) {</div>
<div>@@ -849,9 &#43;852,10 @@ static int cpu_sparc_get_phys_page(CPUSPARCSt=
ate *env, hwaddr *phys,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&nbsp; &nbsp; &nbsp;int prot, access_index;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;return get_physical_address(env, phys, &amp;prot, &amp;=
access_index, addr, rw,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_idx, &amp;page_size);</div>
<div>&#43; &nbsp; &nbsp;return get_physical_address(env, phys, &amp;prot, &=
amp;access_index, &amp;attrs, addr,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rw, mmu_idx, &amp;page_size)=
;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(TARGET_SPARC64)</div>
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

--_000_156516691175116655btcom_--


--===============0258353548311112398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0258353548311112398==--

