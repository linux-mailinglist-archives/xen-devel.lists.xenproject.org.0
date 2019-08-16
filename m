Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C2C8FBC6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:11:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWME-0000Mn-DR; Fri, 16 Aug 2019 07:09:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWMC-0000Mi-GE
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:09:04 +0000
X-Inumbo-ID: b886c678-bff4-11e9-a661-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [62.239.224.235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b886c678-bff4-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 07:09:00 +0000 (UTC)
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:14:54 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:08:58 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:08:58 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 01/42] configure: Define
 TARGET_ALIGNED_ONLY
Thread-Index: AQHVVAF5i4oYfhiDzEeoIHrQlSlk7Q==
Date: Fri, 16 Aug 2019 07:08:58 +0000
Message-ID: <1565939336110.11174@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 01/42] configure: Define
 TARGET_ALIGNED_ONLY
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 gxt@mprc.pku.edu.cn, robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, balrogg@gmail.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============3779173990314752004=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3779173990314752004==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156593933611011174btcom_"

--_000_156593933611011174btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Rename ALIGNED_ONLY to TARGET_ALIGNED_ONLY for clarity and move
defines out of target/foo/cpu.h into configure, as we do with
TARGET_WORDS_BIGENDIAN, so that it is always defined early.

Poisoned TARGET_ALIGNED_ONLY to prevent use in common code.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 configure             | 10 +++++++++-
 include/exec/poison.h |  1 +
 include/qom/cpu.h     |  2 +-
 target/alpha/cpu.h    |  2 --
 target/hppa/cpu.h     |  1 -
 target/mips/cpu.h     |  2 --
 target/sh4/cpu.h      |  2 --
 target/sparc/cpu.h    |  2 --
 target/xtensa/cpu.h   |  2 --
 tcg/tcg.c             |  2 +-
 tcg/tcg.h             |  8 +++++---
 11 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 714e7fb..482ba0b 100755
--- a/configure
+++ b/configure
@@ -7431,8 +7431,13 @@ for target in $target_list; do
 target_dir=3D"$target"
 config_target_mak=3D$target_dir/config-target.mak
 target_name=3D$(echo $target | cut -d '-' -f 1)
+target_aligned_only=3D"no"
+case "$target_name" in
+  alpha|hppa|mips64el|mips64|mipsel|mips|mipsn32|mipsn32el|sh4|sh4eb|sparc=
|sparc64|sparc32plus|xtensa|xtensaeb)
+  target_aligned_only=3D"yes"
+  ;;
+esac
 target_bigendian=3D"no"
-
 case "$target_name" in
   armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|mips64|moxie|or1=
k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus|xtensaeb)
   target_bigendian=3Dyes
@@ -7717,6 +7722,9 @@ fi
 if supported_whpx_target $target; then
     echo "CONFIG_WHPX=3Dy" >> $config_target_mak
 fi
+if test "$target_aligned_only" =3D "yes" ; then
+  echo "TARGET_ALIGNED_ONLY=3Dy" >> $config_target_mak
+fi
 if test "$target_bigendian" =3D "yes" ; then
   echo "TARGET_WORDS_BIGENDIAN=3Dy" >> $config_target_mak
 fi
diff --git a/include/exec/poison.h b/include/exec/poison.h
index b862320..955eb86 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -35,6 +35,7 @@
 #pragma GCC poison TARGET_UNICORE32
 #pragma GCC poison TARGET_XTENSA

+#pragma GCC poison TARGET_ALIGNED_ONLY
 #pragma GCC poison TARGET_HAS_BFLT
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 5ee0046..9b50b73 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -89,7 +89,7 @@ struct TranslationBlock;
  * @do_unassigned_access: Callback for unassigned access handling.
  * (this is deprecated: new targets should use do_transaction_failed inste=
ad)
  * @do_unaligned_access: Callback for unaligned access handling, if
- * the target defines #ALIGNED_ONLY.
+ * the target defines #TARGET_ALIGNED_ONLY.
  * @do_transaction_failed: Callback for handling failed memory transaction=
s
  * (ie bus faults or external aborts; not MMU faults)
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index b3e8a82..16eb804 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -23,8 +23,6 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"

-#define ALIGNED_ONLY
-
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index aab251b..2be67c2 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -30,7 +30,6 @@
    basis.  It's probably easier to fall back to a strong memory model.  */
 #define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL

-#define ALIGNED_ONLY
 #define MMU_KERNEL_IDX   0
 #define MMU_USER_IDX     3
 #define MMU_PHYS_IDX     4
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 21c0615..c13cd4e 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1,8 +1,6 @@
 #ifndef MIPS_CPU_H
 #define MIPS_CPU_H

-#define ALIGNED_ONLY
-
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat.h"
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index aee733e..ecaa7a1 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -23,8 +23,6 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"

-#define ALIGNED_ONLY
-
 /* CPU Subtypes */
 #define SH_CPU_SH7750  (1 << 0)
 #define SH_CPU_SH7750S (1 << 1)
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 8ed2250..1406f0b 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -5,8 +5,6 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"

-#define ALIGNED_ONLY
-
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
 #else
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2c27713..0459243 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -32,8 +32,6 @@
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"

-#define ALIGNED_ONLY
-
 /* Xtensa processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index be2c33c..8d23fb0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1926,7 +1926,7 @@ static const char * const ldst_name[] =3D
 };

 static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] =3D =
{
-#ifdef ALIGNED_ONLY
+#ifdef TARGET_ALIGNED_ONLY
     [MO_UNALN >> MO_ASHIFT]    =3D "un+",
     [MO_ALIGN >> MO_ASHIFT]    =3D "",
 #else
diff --git a/tcg/tcg.h b/tcg/tcg.h
index b411e17..529acb2 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -333,10 +333,12 @@ typedef enum TCGMemOp {
     MO_TE    =3D MO_LE,
 #endif

-    /* MO_UNALN accesses are never checked for alignment.
+    /*
+     * MO_UNALN accesses are never checked for alignment.
      * MO_ALIGN accesses will result in a call to the CPU's
      * do_unaligned_access hook if the guest address is not aligned.
-     * The default depends on whether the target CPU defines ALIGNED_ONLY.
+     * The default depends on whether the target CPU defines
+     * TARGET_ALIGNED_ONLY.
      *
      * Some architectures (e.g. ARMv8) need the address which is aligned
      * to a size more than the size of the memory access.
@@ -353,7 +355,7 @@ typedef enum TCGMemOp {
      */
     MO_ASHIFT =3D 4,
     MO_AMASK =3D 7 << MO_ASHIFT,
-#ifdef ALIGNED_ONLY
+#ifdef TARGET_ALIGNED_ONLY
     MO_ALIGN =3D 0,
     MO_UNALN =3D MO_AMASK,
 #else
--
1.8.3.1

?


--_000_156593933611011174btcom_
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
<div><span style=3D"font-size: 12pt;">Rename ALIGNED_ONLY to TARGET_ALIGNED=
_ONLY for clarity and move</span><br>
</div>
<div>defines out of target/foo/cpu.h into configure, as we do with</div>
<div>TARGET_WORDS_BIGENDIAN, so that it is always defined early.</div>
<div><br>
</div>
<div>Poisoned TARGET_ALIGNED_ONLY to prevent use in common code.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>Reviewed-by: Aleksandar Markovic &lt;amarkovic@wavecomp.com&gt;</div>
<div>Reviewed-by: Cornelia Huck &lt;cohuck@redhat.com&gt;</div>
<div>---</div>
<div>&nbsp;configure &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 10 &#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-</div>
<div>&nbsp;include/exec/poison.h | &nbsp;1 &#43;</div>
<div>&nbsp;include/qom/cpu.h &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;target/alpha/cpu.h &nbsp; &nbsp;| &nbsp;2 --</div>
<div>&nbsp;target/hppa/cpu.h &nbsp; &nbsp; | &nbsp;1 -</div>
<div>&nbsp;target/mips/cpu.h &nbsp; &nbsp; | &nbsp;2 --</div>
<div>&nbsp;target/sh4/cpu.h &nbsp; &nbsp; &nbsp;| &nbsp;2 --</div>
<div>&nbsp;target/sparc/cpu.h &nbsp; &nbsp;| &nbsp;2 --</div>
<div>&nbsp;target/xtensa/cpu.h &nbsp; | &nbsp;2 --</div>
<div>&nbsp;tcg/tcg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 &#=
43;-</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;8 &#=
43;&#43;&#43;&#43;&#43;---</div>
<div>&nbsp;11 files changed, 17 insertions(&#43;), 17 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/configure b/configure</div>
<div>index 714e7fb..482ba0b 100755</div>
<div>--- a/configure</div>
<div>&#43;&#43;&#43; b/configure</div>
<div>@@ -7431,8 &#43;7431,13 @@ for target in $target_list; do</div>
<div>&nbsp;target_dir=3D&quot;$target&quot;</div>
<div>&nbsp;config_target_mak=3D$target_dir/config-target.mak</div>
<div>&nbsp;target_name=3D$(echo $target | cut -d '-' -f 1)</div>
<div>&#43;target_aligned_only=3D&quot;no&quot;</div>
<div>&#43;case &quot;$target_name&quot; in</div>
<div>&#43; &nbsp;alpha|hppa|mips64el|mips64|mipsel|mips|mipsn32|mipsn32el|s=
h4|sh4eb|sparc|sparc64|sparc32plus|xtensa|xtensaeb)</div>
<div>&#43; &nbsp;target_aligned_only=3D&quot;yes&quot;</div>
<div>&#43; &nbsp;;;</div>
<div>&#43;esac</div>
<div>&nbsp;target_bigendian=3D&quot;no&quot;</div>
<div>-</div>
<div>&nbsp;case &quot;$target_name&quot; in</div>
<div>&nbsp; &nbsp;armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|m=
ips64|moxie|or1k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus=
|xtensaeb)</div>
<div>&nbsp; &nbsp;target_bigendian=3Dyes</div>
<div>@@ -7717,6 &#43;7722,9 @@ fi</div>
<div>&nbsp;if supported_whpx_target $target; then</div>
<div>&nbsp; &nbsp; &nbsp;echo &quot;CONFIG_WHPX=3Dy&quot; &gt;&gt; $config_=
target_mak</div>
<div>&nbsp;fi</div>
<div>&#43;if test &quot;$target_aligned_only&quot; =3D &quot;yes&quot; ; th=
en</div>
<div>&#43; &nbsp;echo &quot;TARGET_ALIGNED_ONLY=3Dy&quot; &gt;&gt; $config_=
target_mak</div>
<div>&#43;fi</div>
<div>&nbsp;if test &quot;$target_bigendian&quot; =3D &quot;yes&quot; ; then=
</div>
<div>&nbsp; &nbsp;echo &quot;TARGET_WORDS_BIGENDIAN=3Dy&quot; &gt;&gt; $con=
fig_target_mak</div>
<div>&nbsp;fi</div>
<div>diff --git a/include/exec/poison.h b/include/exec/poison.h</div>
<div>index b862320..955eb86 100644</div>
<div>--- a/include/exec/poison.h</div>
<div>&#43;&#43;&#43; b/include/exec/poison.h</div>
<div>@@ -35,6 &#43;35,7 @@</div>
<div>&nbsp;#pragma GCC poison TARGET_UNICORE32</div>
<div>&nbsp;#pragma GCC poison TARGET_XTENSA</div>
<div>&nbsp;</div>
<div>&#43;#pragma GCC poison TARGET_ALIGNED_ONLY</div>
<div>&nbsp;#pragma GCC poison TARGET_HAS_BFLT</div>
<div>&nbsp;#pragma GCC poison TARGET_NAME</div>
<div>&nbsp;#pragma GCC poison TARGET_SUPPORTS_MTTCG</div>
<div>diff --git a/include/qom/cpu.h b/include/qom/cpu.h</div>
<div>index 5ee0046..9b50b73 100644</div>
<div>--- a/include/qom/cpu.h</div>
<div>&#43;&#43;&#43; b/include/qom/cpu.h</div>
<div>@@ -89,7 &#43;89,7 @@ struct TranslationBlock;</div>
<div>&nbsp; * @do_unassigned_access: Callback for unassigned access handlin=
g.</div>
<div>&nbsp; * (this is deprecated: new targets should use do_transaction_fa=
iled instead)</div>
<div>&nbsp; * @do_unaligned_access: Callback for unaligned access handling,=
 if</div>
<div>- * the target defines #ALIGNED_ONLY.</div>
<div>&#43; * the target defines #TARGET_ALIGNED_ONLY.</div>
<div>&nbsp; * @do_transaction_failed: Callback for handling failed memory t=
ransactions</div>
<div>&nbsp; * (ie bus faults or external aborts; not MMU faults)</div>
<div>&nbsp; * @virtio_is_big_endian: Callback to return %true if a CPU whic=
h supports</div>
<div>diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h</div>
<div>index b3e8a82..16eb804 100644</div>
<div>--- a/target/alpha/cpu.h</div>
<div>&#43;&#43;&#43; b/target/alpha/cpu.h</div>
<div>@@ -23,8 &#43;23,6 @@</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;/* Alpha processors have a weak memory model */</div>
<div>&nbsp;#define TCG_GUEST_DEFAULT_MO &nbsp; &nbsp; &nbsp;(0)</div>
<div>&nbsp;</div>
<div>diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h</div>
<div>index aab251b..2be67c2 100644</div>
<div>--- a/target/hppa/cpu.h</div>
<div>&#43;&#43;&#43; b/target/hppa/cpu.h</div>
<div>@@ -30,7 &#43;30,6 @@</div>
<div>&nbsp; &nbsp; basis. &nbsp;It's probably easier to fall back to a stro=
ng memory model. &nbsp;*/</div>
<div>&nbsp;#define TCG_GUEST_DEFAULT_MO &nbsp; &nbsp; &nbsp; &nbsp;TCG_MO_A=
LL</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>&nbsp;#define MMU_KERNEL_IDX &nbsp; 0</div>
<div>&nbsp;#define MMU_USER_IDX &nbsp; &nbsp; 3</div>
<div>&nbsp;#define MMU_PHYS_IDX &nbsp; &nbsp; 4</div>
<div>diff --git a/target/mips/cpu.h b/target/mips/cpu.h</div>
<div>index 21c0615..c13cd4e 100644</div>
<div>--- a/target/mips/cpu.h</div>
<div>&#43;&#43;&#43; b/target/mips/cpu.h</div>
<div>@@ -1,8 &#43;1,6 @@</div>
<div>&nbsp;#ifndef MIPS_CPU_H</div>
<div>&nbsp;#define MIPS_CPU_H</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;#include &quot;fpu/softfloat.h&quot;</div>
<div>diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h</div>
<div>index aee733e..ecaa7a1 100644</div>
<div>--- a/target/sh4/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sh4/cpu.h</div>
<div>@@ -23,8 &#43;23,6 @@</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;/* CPU Subtypes */</div>
<div>&nbsp;#define SH_CPU_SH7750 &nbsp;(1 &lt;&lt; 0)</div>
<div>&nbsp;#define SH_CPU_SH7750S (1 &lt;&lt; 1)</div>
<div>diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h</div>
<div>index 8ed2250..1406f0b 100644</div>
<div>--- a/target/sparc/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sparc/cpu.h</div>
<div>@@ -5,8 &#43;5,6 @@</div>
<div>&nbsp;#include &quot;cpu-qom.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;#if !defined(TARGET_SPARC64)</div>
<div>&nbsp;#define TARGET_DPREGS 16</div>
<div>&nbsp;#else</div>
<div>diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h</div>
<div>index 2c27713..0459243 100644</div>
<div>--- a/target/xtensa/cpu.h</div>
<div>&#43;&#43;&#43; b/target/xtensa/cpu.h</div>
<div>@@ -32,8 &#43;32,6 @@</div>
<div>&nbsp;#include &quot;exec/cpu-defs.h&quot;</div>
<div>&nbsp;#include &quot;xtensa-isa.h&quot;</div>
<div>&nbsp;</div>
<div>-#define ALIGNED_ONLY</div>
<div>-</div>
<div>&nbsp;/* Xtensa processors have a weak memory model */</div>
<div>&nbsp;#define TCG_GUEST_DEFAULT_MO &nbsp; &nbsp; &nbsp;(0)</div>
<div>&nbsp;</div>
<div>diff --git a/tcg/tcg.c b/tcg/tcg.c</div>
<div>index be2c33c..8d23fb0 100644</div>
<div>--- a/tcg/tcg.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg.c</div>
<div>@@ -1926,7 &#43;1926,7 @@ static const char * const ldst_name[] =3D</d=
iv>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const char * const alignment_name[(MO_AMASK &gt;&gt; MO_A=
SHIFT) &#43; 1] =3D {</div>
<div>-#ifdef ALIGNED_ONLY</div>
<div>&#43;#ifdef TARGET_ALIGNED_ONLY</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UNALN &gt;&gt; MO_ASHIFT] &nbsp; &nbsp;=3D &qu=
ot;un&#43;&quot;,</div>
<div>&nbsp; &nbsp; &nbsp;[MO_ALIGN &gt;&gt; MO_ASHIFT] &nbsp; &nbsp;=3D &qu=
ot;&quot;,</div>
<div>&nbsp;#else</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index b411e17..529acb2 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -333,10 &#43;333,12 @@ typedef enum TCGMemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_TE &nbsp; &nbsp;=3D MO_LE,</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;/* MO_UNALN accesses are never checked for alignment.</=
div>
<div>&#43; &nbsp; &nbsp;/*</div>
<div>&#43; &nbsp; &nbsp; * MO_UNALN accesses are never checked for alignmen=
t.</div>
<div>&nbsp; &nbsp; &nbsp; * MO_ALIGN accesses will result in a call to the =
CPU's</div>
<div>&nbsp; &nbsp; &nbsp; * do_unaligned_access hook if the guest address i=
s not aligned.</div>
<div>- &nbsp; &nbsp; * The default depends on whether the target CPU define=
s ALIGNED_ONLY.</div>
<div>&#43; &nbsp; &nbsp; * The default depends on whether the target CPU de=
fines</div>
<div>&#43; &nbsp; &nbsp; * TARGET_ALIGNED_ONLY.</div>
<div>&nbsp; &nbsp; &nbsp; *</div>
<div>&nbsp; &nbsp; &nbsp; * Some architectures (e.g. ARMv8) need the addres=
s which is aligned</div>
<div>&nbsp; &nbsp; &nbsp; * to a size more than the size of the memory acce=
ss.</div>
<div>@@ -353,7 &#43;355,7 @@ typedef enum TCGMemOp {</div>
<div>&nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp;MO_ASHIFT =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;MO_AMASK =3D 7 &lt;&lt; MO_ASHIFT,</div>
<div>-#ifdef ALIGNED_ONLY</div>
<div>&#43;#ifdef TARGET_ALIGNED_ONLY</div>
<div>&nbsp; &nbsp; &nbsp;MO_ALIGN =3D 0,</div>
<div>&nbsp; &nbsp; &nbsp;MO_UNALN =3D MO_AMASK,</div>
<div>&nbsp;#else</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156593933611011174btcom_--


--===============3779173990314752004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3779173990314752004==--

