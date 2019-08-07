Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC384780
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMN-0000fX-4o; Wed, 07 Aug 2019 08:31:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHHx-0008QS-VW
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:27:18 +0000
X-Inumbo-ID: 299e2507-b8ed-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [213.121.35.71])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 299e2507-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:27:16 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:27:02 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:27:14 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:27:14 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 04/26] target/mips: Access MemoryRegion
 with MemOp
Thread-Index: AQHVTPnqprcONrFqPEOth6dH3Z+T4Q==
Date: Wed, 7 Aug 2019 08:27:14 +0000
Message-ID: <1565166433653.42084@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 08:31:48 +0000
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 04/26] target/mips: Access
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
Content-Type: multipart/mixed; boundary="===============1710684932088692574=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1710684932088692574==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516643365342084btcom_"

--_000_156516643365342084btcom_
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


--_000_156516643365342084btcom_
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
<div><span style=3D"font-size: 10pt;">The memory_region_dispatch_{read|writ=
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
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156516643365342084btcom_--


--===============1710684932088692574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1710684932088692574==--

