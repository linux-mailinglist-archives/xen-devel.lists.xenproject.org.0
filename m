Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349BCD2175
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 23:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191159.1511199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWini-0002M0-J7; Fri, 19 Dec 2025 22:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191159.1511199; Fri, 19 Dec 2025 22:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWini-0002JR-Fp; Fri, 19 Dec 2025 22:18:18 +0000
Received: by outflank-mailman (input) for mailman id 1191159;
 Fri, 19 Dec 2025 22:18:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTMo=6Z=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vWing-0002JL-PH
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 22:18:16 +0000
Received: from outbound.ci.icloud.com (ci-2002k-snip4-11.eps.apple.com
 [57.103.88.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99f2b714-dd28-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 23:18:10 +0100 (CET)
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-central-1k-60-percent-0 (Postfix) with ESMTPS id
 E379218000AE; Fri, 19 Dec 2025 22:18:06 +0000 (UTC)
Received: from p00-mailws2-866456d649-wmkn7 (unknown [10.168.160.104])
 by p00-icloudmta-asmtp-us-central-1k-60-percent-0 (Postfix) with ESMTPSA id
 1F70418001A0; Fri, 19 Dec 2025 22:18:06 +0000 (UTC)
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
X-Inumbo-ID: 99f2b714-dd28-11f0-9cce-f158ae23cfc8
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space; s=sig1; bh=+osd5Zf0RTz296wXlcH2LnPFa+dQLQn9W8hzJqFiWFQ=; h=To:From:Subject:Date:Message-id:Content-Type:MIME-Version:x-icloud-hme; b=PCbVXRHJ/gXfX1b4F85VVx6rUEZU+5S5/qCDJEPrgOe/eysdB4QZNSFwiLQAxmL829Ef7iaatYvntVewblWqbdVpH2i8V7VBR2GADUIfXUqef6Rrhl0+W7J4ElPdtu1UzZTFp5xgC1FJdOA2YE03dYVMFFc23+HgRCko1xoXpPPaFQvqG+oSAy3x7rSL2P4fBLYKl23N3Z3wPhGThKX/KhBtf1uvU++Oea7q7UpWkE55SM4CwDgOLXNlVnG4l8v2w/aONdC0Lxit1l0ZWG9f5JExOt8Gg+winYi+Sos8KQI/SqU/Hhnf8ZdZ1S3XVUpJQJjz4wvaopU0uTSt4YBLHA==
mail-alias-created-date: 1688796967087
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com,
 darwi@linutronix.de,
 sandipan.das@amd.com,
 kai.huang@intel.com,
 me@mixaill.net,
 yazen.ghannam@amd.com,
 riel@surriel.com,
 peterz@infradead.org,
 hpa@zytor.com,
 x86@kernel.org,
 tglx@linutronix.de,
 mingo@redhat.com,
 dave.hansen@linux.intel.com,
 xen-devel@lists.xenproject.org,
 stable@vger.kernel.org
From: Ariadne Conill <ariadne@ariadne.space>
Subject: =?utf-8?B?UmU6IFtQQVRDSF0geDg2L0NQVS9BTUQ6IGF2b2lkIHByaW50aW5nIHJlc2V0?=
 =?utf-8?B?IHJlYXNvbnMgb24gWGVuIGRvbVU=?=
Date: Fri, 19 Dec 2025 22:18:06 +0000 (GMT)
X-Mailer: iCloud MailClient2546Build28 MailServer2502B13.7c5914c7dad3
Message-id: <4ae8b46d-a6c0-45df-8a65-bfdb2f32697c@me.com>
Content-Type: multipart/alternative; boundary=Apple-Webmail-42--edc0375d-e504-49bd-8788-ebb7f32c0c3e
MIME-Version: 1.0
In-Reply-To: <aUV4u0r44V5zHV5f@google.com>
References: <20251219010131.12659-1-ariadne@ariadne.space>
 <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
 <aUV4u0r44V5zHV5f@google.com>
X-Proofpoint-ORIG-GUID: 0hlVhL4e5sjq8N1xbI0E99qSYcqu6k3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE4NiBTYWx0ZWRfX9OZfVdqhdMh4
 sic2mSmWNsS3eKbD/G1Z4nytaR+P/GbseYWbf86Snd99Bxk9zb0Edijw0kw/L82b+DiRyLUhb/K
 plWl/G1+qETivVk5WKEzTk6eVRjlNpWf7X8uKz1IfloYzi7FOk7H08VVxQtj1EiZfg3SWpI3DyP
 ECiaa8LFVkHXrzF8Umx+yDe8qmbTfE3DG9KDH0kkCKeOwzN0/x5r61PbTBZ3E530DrUn7gRY14r
 bvtYBMUVG+bnsJNC8wAOliLFOAAI8S4/7KyncGBd006Mz5I98AQXhVKdOCJyCwPlNvagd2222Kq
 zuycUPDtZW47urSEipf
X-Authority-Info: v=2.4 cv=OaaVzxTY c=1 sm=1 tr=0 ts=6945cf20 cx=c_apl:c_pps
 a=T0mU/zd77MEem+zjWCBf6Q==:117 a=MKtGQD3n3ToA:10 a=wP3pNCr1ah4A:10
 a=5KLPUuaC_9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kmYkUENqAAAA:8 a=1XWaLZrsAAAA:8
 a=cWRNjhkoAAAA:8 a=VwQbUJbxAAAA:8 a=KAvpD4PgdfPX3it7qZcA:9 a=QEXdDO2ut3YA:10
 a=1YVGi5tgGHFMkX38AGwA:9 a=8fbitOLmDIUjEh3D:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=p9kz6gysRiz6SGr9lVkz:22 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-GUID: 0hlVhL4e5sjq8N1xbI0E99qSYcqu6k3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_07,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=946 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512190186
X-JNJ: AAAAAAABlsJn4ryQjkkOOaHphaMlaJShFydw9fDk1r7YdhmQR+uRZEmR+8E2ST8puW37QBrtVAaYhCRCnaCQnmyjoxyXb0NeyDNPvumnt16BYkf3vV9vgsPwJXHQlxcqpAzCs4Vh4G8SdTezHKHNw/OqL1iozdYpgH+6c5ZPw9jIOzwlMRgTCTHP1otd8dqiUtTxxEOts1PpVttG7a11+kneCV5vSi/tSXcqblfBHsj8FFaWVC6HBDI+YbLqPd3oEbOyVeXpR2x3OMt3KPR44rLKvzc2F6TWDbhbNBGV5t23xZaXK4z5bCcrg3rDq2XclH8DMq4jB+rmP8jnJXVweOWQ9G1dXZp8leZwVWSV0BTjZsJ4Zpmj5hAfs3ZlfAVqRHFs8GXzInitLV46khs8+aY0sD7YUABi25p0X1Ktrs+f4qM5nvz5+vW7eOFhF5awZ5QnHQNegKqn+X18vhOtazuiJPtSnE5isWdVc7T4SkhVpLf/pQE5QJTD/ndotFuzwFw4NEUm4jPDnaH8GlU2nlUtzba0uEEy8D2govn2gxZd7wAQNUO7JgrEB773WvyWpM6Jf+GBjaDrYsjcrIfKZ1ITaxYET+eErbsFdsJ4ZzhOQalVXBZorWz8hwq4dVIaWYfh0GwCMeMcpZaFNla/A/mUuOdonAxhic6luQCz+aY+ltfQUKC213O3IUyQ5i0bgb7x3Vadd0lNDt6/JBcVRi5UroxPC8fzrA20qPFX4sCtwnq+fXSR9qzM5PUHC531qI+5gA285CT30eADVSxQ92XsiDpKyquGV/BHBXQZSS3PiR+CgZxpxASfqwo0C0onVheWcRY6O9Lq2K6GpfJrY91L1Y3pzWUz1pcut038sLBGegbGkhuUY1TH5A==


--Apple-Webmail-42--edc0375d-e504-49bd-8788-ebb7f32c0c3e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
    charset=utf-8;
    format=flowed

Hi, On Dec 19, 2025, at 8:09 AM, Sean Christopherson <seanjc@google.com> w=
rote: On Fri, Dec 19, 2025, Borislav Petkov wrote: On December 19, 2025 1:=
01:31 AM UTC, Ariadne Conill <ariadne@ariadne.space> wrote: >Xen domU cann=
ot access the given MMIO address for security reasons, >resulting in a fai=
led hypercall in ioremap() due to permissions. Why does that matter though=
? Ah, because set_pte() assumes success, and so presumably the failed hype=
rcall goes unnoticed and trying to access the MMIO #PFs due to !PRESENT ma=
pping. Yes, which results in the guest panicing on Zen platforms. >Fixes: =
ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset") >Signed-=
off-by: Ariadne Conill <ariadne@ariadne.space> >Cc: xen-devel@lists.xenpro=
ject.org >Cc: stable@vger.kernel.org >--- > arch/x86/kernel/cpu/amd.c | 6 =
++++++ > 1 file changed, 6 insertions(+) > >diff --git a/arch/x86/kernel/c=
pu/amd.c b/arch/x86/kernel/cpu/amd.c >index a6f88ca1a6b4..99308fba4d7d 100=
644 >--- a/arch/x86/kernel/cpu/amd.c >+++ b/arch/x86/kernel/cpu/amd.c >@@ =
-29,6 +29,8 @@ > # include <asm/mmconfig.h> > #endif > >+#include <xen/xen=
.h> >+ > #include "cpu.h" > > u16 invlpgb_count_max __ro_after_init =3D 1;=
 >@@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(void=
) > if (!cpu_feature_enabled(X86_FEATURE_ZEN)) > return 0; > >+ /* Xen PV =
domU cannot access hardware directly, so bail for domU case */ Heh, Xen on=
 Zen crime. >+ if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_=
domain()) >+ return 0; >+ > addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET=
_STATUS, sizeof(value)); > if (!addr) > return 0; Sean, looka here. The ot=
her hypervisor wants other checks. Time to whip out the X86_FEATURE_HYPERV=
ISOR check. LOL, Ariadne, be honest, how much did Boris pay you? :-D Nothi=
ng :) At Edera we have been running with this patch for a few months, I ju=
st forgot to upstream it. I was reminded of this patch when an Alpine user=
 opened a bug[0] demonstrating the same behavior on 6.18. [0]: https://git=
lab.alpinelinux.org/alpine/aports/-/issues/17789 Jokes aside, I suppose I'=
m fine adding a HYPERVISOR check, but at the same time, how is this not a =
Xen bug? Refusing to create a mapping because the VM doesn't have a device=
 defined at a given GPA is pretty hostile behavior for a hypervisor. I thi=
nk it would be better to fix this in a more generic way if we can. Ariadne
--Apple-Webmail-42--edc0375d-e504-49bd-8788-ebb7f32c0c3e
Content-Type: multipart/related;
    type="text/html";
    boundary=Apple-Webmail-86--edc0375d-e504-49bd-8788-ebb7f32c0c3e


--Apple-Webmail-86--edc0375d-e504-49bd-8788-ebb7f32c0c3e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
    charset=utf-8;

<html><body><div><div>Hi,</div><div><br></div><blockquote type=3D"cite"><div>On Dec 19=
, 2025, at 8:09 AM, Sean Christopherson &lt;seanjc@google.com&gt; wrote:</=
div><div><br></div><div><br></div><div><div><div>On Fri, Dec 19, 2025, Bor=
islav Petkov wrote:</div><blockquote type=3D"cite"><div>On December 19, 20=
25 1:01:31 AM UTC, Ariadne Conill &lt;ariadne@ariadne.space&gt; wrote:</di=
v><div>&gt;Xen domU cannot access the given MMIO address for security reas=
ons,</div><div>&gt;resulting in a failed hypercall in ioremap() due to per=
missions.</div></blockquote><div><br></div><div>Why does that matter thoug=
h?  Ah, because set_pte() assumes success, and so</div><div>presumably the=
 failed hypercall goes unnoticed and trying to access the MMIO</div><div>#=
PFs due to !PRESENT mapping.</div></div></div></blockquote><div><br></div>=
<div>Yes, which results in the guest panicing on Zen platforms.</div></div=
><div><blockquote type=3D"cite"><div><div><div><br></div><blockquote type=3D=
"cite"><div>&gt;Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for th=
e last reset")</div><div>&gt;Signed-off-by: Ariadne Conill &lt;ariadne@ari=
adne.space&gt;</div><div>&gt;Cc: <a href=3D"mailto:xen-devel@lists.xenproj=
ect.org">xen-devel@lists.xenproject.org</a></div><div>&gt;Cc: <a href=3D"m=
ailto:stable@vger.kernel.org">stable@vger.kernel.org</a></div><div>&gt;---=
</div><div>&gt; arch/x86/kernel/cpu/amd.c | 6 ++++++</div><div>&gt; 1 file=
 changed, 6 insertions(+)</div><div>&gt;</div><div>&gt;diff --git a/arch/x=
86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c</div><div>&gt;index a6f88c=
a1a6b4..99308fba4d7d 100644</div><div>&gt;--- a/arch/x86/kernel/cpu/amd.c<=
/div><div>&gt;+++ b/arch/x86/kernel/cpu/amd.c</div><div>&gt;@@ -29,6 +29,8=
 @@</div><div>&gt; # include &lt;asm/mmconfig.h&gt;</div><div>&gt; #endif<=
/div><div>&gt; </div><div>&gt;+#include &lt;xen/xen.h&gt;</div><div>&gt;+<=
/div><div>&gt; #include "cpu.h"</div><div>&gt; </div><div>&gt; u16 invlpgb=
_count_max __ro_after_init =3D 1;</div><div>&gt;@@ -1333,6 +1335,10 @@ sta=
tic __init int print_s5_reset_status_mmio(void)</div><div>&gt; 	if (!cpu_f=
eature_enabled(X86_FEATURE_ZEN))</div><div>&gt; 		return 0;</div><div>&gt;=
 </div><div>&gt;+	/* Xen PV domU cannot access hardware directly, so bail =
for domU case */</div></blockquote><div><br></div><div>Heh, Xen on Zen cri=
me.</div><div><br></div><blockquote type=3D"cite"><div>&gt;+	if (cpu_featu=
re_enabled(X86_FEATURE_XENPV) &amp;&amp; !xen_initial_domain())</div><div>=
&gt;+		return 0;</div><div>&gt;+</div><div>&gt; 	addr =3D ioremap(FCH_PM_B=
ASE + FCH_PM_S5_RESET_STATUS, sizeof(value));</div><div>&gt; 	if (!addr)</=
div><div>&gt; 		return 0;</div><div><br></div><div>Sean, looka here. The o=
ther hypervisor wants other checks.</div><div><br></div><div>Time to whip =
out the X86_FEATURE_HYPERVISOR check.</div></blockquote><div><br></div><di=
v>LOL, Ariadne, be honest, how much did Boris pay you?  :-D</div></div></d=
iv></blockquote><div><br></div><div>Nothing :)</div><div><br></div><div>At=
 Edera we have been running with this patch for a few months, I just forgo=
t to upstream it.</div><div><br></div><div>I was reminded of this patch wh=
en an Alpine user opened a bug[0] demonstrating the same behavior on 6.18.=
</div><div><br></div><div>[0]:&nbsp;<a rel=3D"noopener noreferrer" href=3D=
"https://gitlab.alpinelinux.org/alpine/aports/-/issues/17789">https://gitl=
ab.alpinelinux.org/alpine/aports/-/issues/17789</a><br></div></div><div><b=
lockquote type=3D"cite"><div><div><div><br></div><div>Jokes aside, I suppo=
se I'm fine adding a HYPERVISOR check, but at the same time,</div><div>how=
 is this not a Xen bug?  Refusing to create a mapping because the VM doesn=
't</div><div>have a device defined at a given GPA is pretty hostile behavi=
or for a hypervisor.</div></div></div></blockquote></div><div><br></div><d=
iv>I think it would be better to fix this in a more generic way if we can.=
</div><div><br></div><div>Ariadne</div></body></html>
--Apple-Webmail-86--edc0375d-e504-49bd-8788-ebb7f32c0c3e--

--Apple-Webmail-42--edc0375d-e504-49bd-8788-ebb7f32c0c3e--


