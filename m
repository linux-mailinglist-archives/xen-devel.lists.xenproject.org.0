Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470508FC4C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:29:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWeN-0002BN-AR; Fri, 16 Aug 2019 07:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWeL-0002BC-Py
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:27:49 +0000
X-Inumbo-ID: 56d072dc-bff7-11e9-8bb0-12813bfff9fa
Received: from smtpe1.intersmtp.com (unknown [213.121.35.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56d072dc-bff7-11e9-8bb0-12813bfff9fa;
 Fri, 16 Aug 2019 07:27:45 +0000 (UTC)
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:27:22 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:27:43 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:27:43 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 04/42] target/mips: Access MemoryRegion
 with MemOp
Thread-Index: AQHVVAQXgdDGsPFhD0WOP1A9ybepgA==
Date: Fri, 16 Aug 2019 07:27:43 +0000
Message-ID: <1565940462507.85555@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 04/42] target/mips: Access
 MemoryRegion with MemOp
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
Content-Type: multipart/mixed; boundary="===============9185701046331137954=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9185701046331137954==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594046250785555btcom_"

--_000_156594046250785555btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 9e2e02f..1c72a00 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "exec/memop.h"
 #include "sysemu/kvm.h"

 /*************************************************************************=
****/
@@ -4740,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong a=
ddr, uint32_t op)
     if (op =3D=3D 9) {
         /* Index Store Tag */
         memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     8, MEMTXATTRS_UNSPECIFIED);
+                                     size_memop(8), MEMTXATTRS_UNSPECIFIED=
);
     } else if (op =3D=3D 5) {
         /* Index Load Tag */
         memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    8, MEMTXATTRS_UNSPECIFIED);
+                                    size_memop(8), MEMTXATTRS_UNSPECIFIED)=
;
     }
 #endif
 }
--
1.8.3.1

?


--_000_156594046250785555btcom_
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
<div><span style=3D"font-size: 12pt;">The memory_region_dispatch_{read|writ=
e} operand &quot;unsigned size&quot; is</span><br>
</div>
<div>being converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Convert interfaces by using no-op size_memop.</div>
<div><br>
</div>
<div>After all interfaces are converted, size_memop will be implemented</di=
v>
<div>and the memory_region_dispatch_{read|write} operand &quot;unsigned siz=
e&quot;</div>
<div>will be converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>As size_memop is a no-op, this patch does not change any behaviour.</d=
iv>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;target/mips/op_helper.c | 5 &#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c</div>
<div>index 9e2e02f..1c72a00 100644</div>
<div>--- a/target/mips/op_helper.c</div>
<div>&#43;&#43;&#43; b/target/mips/op_helper.c</div>
<div>@@ -24,6 &#43;24,7 @@</div>
<div>&nbsp;#include &quot;exec/helper-proto.h&quot;</div>
<div>&nbsp;#include &quot;exec/exec-all.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu_ldst.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;sysemu/kvm.h&quot;</div>
<div>&nbsp;</div>
<div>&nbsp;/***************************************************************=
**************/</div>
<div>@@ -4740,11 &#43;4741,11 @@ void helper_cache(CPUMIPSState *env, targe=
t_ulong addr, uint32_t op)</div>
<div>&nbsp; &nbsp; &nbsp;if (op =3D=3D 9) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Store Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_write(env-&gt=
;itc_tag, index, env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8, MEMTXATTRS_UNS=
PECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(8)=
, MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;} else if (op =3D=3D 5) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Load Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(env-&gt;=
itc_tag, index, &amp;env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8, MEMTXATTRS_UNSP=
ECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(8),=
 MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594046250785555btcom_--


--===============9185701046331137954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9185701046331137954==--

