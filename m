Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8F742714
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 15:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556827.869634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qErUA-0004kj-4T; Thu, 29 Jun 2023 13:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556827.869634; Thu, 29 Jun 2023 13:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qErUA-0004iJ-1o; Thu, 29 Jun 2023 13:14:58 +0000
Received: by outflank-mailman (input) for mailman id 556827;
 Thu, 29 Jun 2023 13:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brDF=CR=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qErU8-0004iD-GF
 for xen-devel@lists.xen.org; Thu, 29 Jun 2023 13:14:56 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1c104a-167e-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 15:14:53 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6686ef86110so403470b3a.2
 for <xen-devel@lists.xen.org>; Thu, 29 Jun 2023 06:14:54 -0700 (PDT)
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
X-Inumbo-ID: ef1c104a-167e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688044492; x=1690636492;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FUn1yuj1TcoYinLRfRNegHhsklB/AYkVgTVJnBEcxHs=;
        b=S72s/aK92zlP+brGnO0ofs1gbzV77BTf7LrWbuOemuDoPcGcn4B8Gzixk0XY3FVXJ8
         Txd2niu0BmNJA0vX/ObjWGdKNmVA1LHdAipMShm2q4gh4aH/eJd7fjz8rQT7+pEw2jTF
         SIQlkgpNpZ7W4v/Hfx+Csb/UGaM/V/b+42mpPH7vgLnHi/CwW9DfJ9dyUBwYCxce9R8W
         Exmf5UqUeXIVMfNS32iMA/06BZHm7rQlm/so3H/B2NRWs20hsSTfjLpl1JZPmlZy1MYa
         5ECfsLj73yB8zeYAZ4dYCCTbOMSHSw9RIzQhtAz+5uPIFAsBUwjXyd5wHzH0G4Hnp35b
         pDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688044492; x=1690636492;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FUn1yuj1TcoYinLRfRNegHhsklB/AYkVgTVJnBEcxHs=;
        b=avnAK5YEh2AvS0RydKz5SSG7jub48wxUdFN5teL5o8vevmaCzCmRu0vZSdkt9tdzoL
         Fm25KPtNSHP86ibW7tP5gf4TVGhoyRIDHa9ACSj01SZ2rilgZi9gxKDh8DgUaH2OJ09C
         kkJn6WcQ0apapc2ySF2SS4PZwx33B2QnCDhJcvj3XRKlMHYeL7qJOi+cj7RkPFhrwfM0
         DSU6tcAefMmMlzml6vJLFl6xy8ufN8FhoDFvkQ1uQWJvA36khuaaiDov6Q0mz9vz3pCf
         K3K75eH8uyLPsmqtO5tqNVOckuEdJrPlEqnFgEr0/P/sJvcJcNeII6O6Tt1u1PiV375S
         IhyQ==
X-Gm-Message-State: AC+VfDxqAQGnBxRlWsdEnO9Q18Zsdbb0JvDTcFWq1764y5MTBjjKEDw9
	ZZktlTfScdv+iVUXAEVXAQ6BxnZAK+sXzwhOry2sRt39th9QNQ==
X-Google-Smtp-Source: ACHHUZ6y79FZlSGVNafCwnTpvjeaTQzZZ0RguXSfXhN2xcGnIJlEMHmSaljwMHgcnovHdBr0ylBv0OkM3eia769+CQU=
X-Received: by 2002:a05:6a20:3ca2:b0:12b:d7cb:54f2 with SMTP id
 b34-20020a056a203ca200b0012bd7cb54f2mr6082692pzj.11.1688044492122; Thu, 29
 Jun 2023 06:14:52 -0700 (PDT)
MIME-Version: 1.0
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Thu, 29 Jun 2023 16:21:25 +0300
Message-ID: <CA+SAi2uir6R4dmhLmbMqLPwvW01yTrD6xinv=BoJHTXx0-XyXw@mail.gmail.com>
Subject: hardware aes issue related to xen cache coloring
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000516e4b05ff447cab"

--000000000000516e4b05ff447cab
Content-Type: text/plain; charset="UTF-8"

Hello guys,

Be careful. Futher on will be long read...

Still continue to fight. What I found out ?
I built xen with cache coloring for Xilinx zyncmp.
In xen we are enabled harware encryption for some necessities.
Actually there one only change in xen/arch/arm/platforms/xilinx-eemi.c
at bool xilinx_eemi(struct cpu_user_regs *regs, const uint32_t fid,...)
function to the function id switch/case handler.
It only passes through our request to hardware aes core. It looks like

/* userspace AES operations need to pass */
   case 0xC200002F:
    gprintk(XENLOG_DEBUG, "Forwarding AES operation: %u\n", fid);
        goto forward_to_fw;

After flash it maybe worked some time. Unpredictaible it my got a hardware
fault.
These may be seen as hardware fault in pmu/Microblaze

(XEN) d0v0 Forwarding AES operation: 3254779951
Received exception
MSR: 0x200, EAR: 0x19, EDR: 0x0, ESR: 0x861

These strings printed from pmu firmware
lib/sw_apps/zynqmp_pmufw/src/xpfw_core.c at void
XPfw_Exception_Handler(void) function

or as assert somewhere at DMA functions like

Assert occurred from file xsecure_aes.c at line 410
Assert occurred from file xcsudma.c at line 140
Assert occurred from file xcsudma.c at line 143

Before than I have seen a lot of messages related to errors in aes requests
like

[ 188.737910] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR: Gcm
Tag mismatch
(XEN) d0v0 Forwarding AES operation: 3254779951

[ 188.748496] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR : Non
word aligned data
(XEN) d0v0 Forwarding AES operation: 3254779951

[ 198.826279] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR : Non
word aligned data
(XEN) d0v0 Forwarding AES operation: 3254779951

[ 198.837363] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR: Invalid
(XEN) d0v0 Forwarding AES operation: 3254779951

A string marked by (XEN) tag printed from above mentioned plase at xen.
All other strings printed from the Dom0 kernel. In particular this is the
file
drivers/crypto/xilinx/zynqmp-aes.c at
static int zynqmp_aes_xcrypt(struct skcipher_request *req, unsigned int
flags) function.

An aes request structure contains 7 x64 bits data. I pointed it out from
the Dom0 kernel's point of view
struct zynqmp_aes_data {
u64 src;
u64 iv;
u64 key;
u64 dst;
u64 size;
u64 optype;
u64 keysrc;
};
You may see it at drivers/crypto/xilinx/zynqmp-aes.c xilinx's kernel file.
A memory for the request
allocated by driver from related DMA area.

So I found out a path of aes request.
ui application -> Dom0 kernel -> xen -> Security Monitor
A last one contains ARM Trusted Firmware/ATF
and Microblaze separate chip which executes request handlers.
Particularly from the function block point of view it contains
Platform Management Unit/PMU
Configuration Security Unit/CSU
They are executed xilsecure and other libraries.

Dom0 kernel invokes xen by hvc instruction. A hypervisor invokes Security
Monitor by smc instruction.
Further on request get into ARM Trusted Firmware in concrete
plat/xilinx/zynqmp/pm_service/pm_api_sys.c
at pm_ret_status pm_aes_engine(...) function. It sends this request to PMU
by Inter Processor Interrupt/IPI.
These errors have never arrived when hypervisor built without chache
coloring.
Then I dumped these requests from DomU kernel and PMU side in both cases. I
got a lower mentioned picture.
With cache coloring
==== Dom0 kernel part here ====
[   27.263734] zynqmp_aes [0] ffffffc00912d000 1194c000
firmware:zynqmp-firmware:zynqmp-aes
[   27.266314] zynqmp_aes [1] ffffffc009135000 1194e000
[   27.271331] zynqmp_aes [2] dump request align 1 ++
[   27.276143] 00 c0 94 11 00 00 00 00
[   27.279688] 50 c0 94 11 00 00 00 00
[   27.283234] 00 00 00 00 00 00 00 00
[   27.286780] 00 c0 94 11 00 00 00 00
[   27.290327] 40 00 00 00 00 00 00 00
[   27.293874] 00 00 00 00 00 00 00 00
[   27.297420] 01 00 00 00 00 00 00 00
[   27.300967] zynqmp_aes [3] dump request --

========== xypervisor part here ==========
(XEN) d0v1 Forwarding AES operation: 3254779951

==== PMU part here ====
01194E000 agn 1
1E A7 D1 B1 35 22 7B 1F
AE 84 8F 56 99 03 80 3F
15 49 E7 F3 DE C9 E1 17
FB C7 7C 16 CF 58 DF A1
AF CF DC 07 F9 55 49 3F
E0 D9 35 89 50 81 FA AE
87 B6 29 16 96 F6 5F F2

==== ATF part here, i printed just after the request ====
INFO:   pm_aes_engine ### args 6 ret 0 addr 0 1194e000 ###

==== Back to Dom0 kernel ====
[   27.336699] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR : Non
word aligned data

Without cache coloring
==== Dom0 kernel part here ====
[   16.746389] zynqmp_aes [0] ffffffc00910d000 5ecfd000
firmware:zynqmp-firmware:zynqmp-aes
[   16.751548] zynqmp_aes [1] ffffffc009115000 5ed1e000
[   16.756557] zynqmp_aes [2] dump request align 1 ++
[   16.761400] 00 d0 cf 5e 00 00 00 00
[   16.764944] 50 d0 cf 5e 00 00 00 00
[   16.768490] 00 00 00 00 00 00 00 00
[   16.772037] 00 d0 cf 5e 00 00 00 00
[   16.775582] 40 00 00 00 00 00 00 00
[   16.779130] 00 00 00 00 00 00 00 00
[   16.782676] 01 00 00 00 00 00 00 00
[   16.786231] zynqmp_aes [3] dump request --

========== xypervisor part here ==========
(XEN) d0v0 Forwarding AES operation: 3254779951

==== PMU part here ====
05ED1E000 agn 1
00 D0 CF 5E 00 00 00 00
50 D0 CF 5E 00 00 00 00
00 00 00 00 00 00 00 00
00 D0 CF 5E 00 00 00 00
40 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
01 00 00 00 00 00 00 00

==== ATF part here, i printed just after the request ====
INFO:   pm_aes_engine ### args 6 ret 0 addr 0 5ed1e000 ###

==== Back to Dom0 kernel ====
[   16.821959] zynqmp_pm_aes_engine addr 5ed1e000 ret 0

As we may see here with the xen cache coloring dumps of request in both
sides are equal.
Without the xen cache coloring dumps of request in both sides are different.
So I got a guess.
According to Stefano's comments the difference between both modes is in
SMMU.
Without the cache coloring all the memory mapping does programmaticaly by
xypervisor.
With the xen cache coloring all the memory mapping does by SMMU.
This is the point to my mind. SMMU does not know anything about the DMA
between Dom0 and PMU.
This is the point.
Could someone suggest me a way how to fix it ?
Thanks for patience.

Regards
Oleg

--000000000000516e4b05ff447cab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello guys,<br><br>Be careful. Futher on will be long read=
...<br><br>Still continue to fight. What I found out ?<br>I built xen with =
cache coloring for Xilinx zyncmp.<br>In xen we are enabled harware encrypti=
on for some necessities.<br>Actually there one only change in xen/arch/arm/=
platforms/xilinx-eemi.c <br>at bool xilinx_eemi(struct cpu_user_regs *regs,=
 const uint32_t fid,...) <br>function to the function id switch/case handle=
r.<br>It only passes through our request to hardware aes core. It looks lik=
e<br><br>/* userspace AES operations need to pass */<br>=C2=A0 =C2=A0case 0=
xC200002F:<br>=C2=A0 =C2=A0	gprintk(XENLOG_DEBUG, &quot;Forwarding AES oper=
ation: %u\n&quot;, fid);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto forward_to_fw;=
<br><br>After flash it maybe worked some time. Unpredictaible it my got a h=
ardware fault.<br>These may be seen as hardware fault in pmu/Microblaze<br>=
<br>(XEN) d0v0 Forwarding AES operation: 3254779951<br>Received exception<b=
r>MSR: 0x200, EAR: 0x19, EDR: 0x0, ESR: 0x861<br><br>These strings printed =
from pmu firmware<br>lib/sw_apps/zynqmp_pmufw/src/xpfw_core.c at void XPfw_=
Exception_Handler(void) function<br><br>or as assert somewhere at DMA funct=
ions like<br><br>Assert occurred from file xsecure_aes.c at line 410<br>Ass=
ert occurred from file xcsudma.c at line 140<br>Assert occurred from file x=
csudma.c at line 143<br><br>Before than I have seen a lot of messages relat=
ed to errors in aes requests like<br><br>[ 188.737910] zynqmp_aes firmware:=
zynqmp-firmware:zynqmp-aes: ERROR: Gcm Tag mismatch<br>(XEN) d0v0 Forwardin=
g AES operation: 3254779951<br><br>[ 188.748496] zynqmp_aes firmware:zynqmp=
-firmware:zynqmp-aes: ERROR : Non word aligned data<br>(XEN) d0v0 Forwardin=
g AES operation: 3254779951<br><br>[ 198.826279] zynqmp_aes firmware:zynqmp=
-firmware:zynqmp-aes: ERROR : Non word aligned data<br>(XEN) d0v0 Forwardin=
g AES operation: 3254779951<br><br>[ 198.837363] zynqmp_aes firmware:zynqmp=
-firmware:zynqmp-aes: ERROR: Invalid<br>(XEN) d0v0 Forwarding AES operation=
: 3254779951<br><br>A string marked by (XEN) tag printed from above mention=
ed plase at xen.<br>All other strings printed from the Dom0 kernel. In part=
icular this is the file<br>drivers/crypto/xilinx/zynqmp-aes.c at =C2=A0<br>=
static int zynqmp_aes_xcrypt(struct skcipher_request *req, unsigned int fla=
gs) function.<br><br>An aes request structure contains 7 x64 bits data. I p=
ointed it out from the Dom0 kernel&#39;s point of view<br>struct zynqmp_aes=
_data {<br>	u64 src;<br>	u64 iv;<br>	u64 key;<br>	u64 dst;<br>	u64 size;<br=
>	u64 optype;<br>	u64 keysrc;<br>};<br>You may see it at drivers/crypto/xil=
inx/zynqmp-aes.c xilinx&#39;s kernel file. A memory for the request <br>all=
ocated by driver from related DMA area.<br><br>So I found out a path of aes=
 request.<br>ui application -&gt; Dom0 kernel -&gt; xen -&gt; Security Moni=
tor<br>A last one contains ARM Trusted Firmware/ATF<br>and Microblaze separ=
ate chip which executes request handlers.<br>Particularly from the function=
 block point of view it contains<br>Platform Management Unit/PMU<br>Configu=
ration Security Unit/CSU<br>They are executed xilsecure and other libraries=
.<br><br>Dom0 kernel invokes xen by hvc instruction. A hypervisor invokes S=
ecurity Monitor by smc instruction.<br>Further on request get into ARM Trus=
ted Firmware in concrete plat/xilinx/zynqmp/pm_service/pm_api_sys.c<br>at p=
m_ret_status pm_aes_engine(...) function. It sends this request to PMU by I=
nter Processor Interrupt/IPI.<br>These errors have never arrived when hyper=
visor built without chache coloring.<br>Then I dumped these requests from D=
omU kernel and PMU side in both cases. I got a lower mentioned picture.<br>=
With cache coloring<br>=3D=3D=3D=3D Dom0 kernel part here =3D=3D=3D=3D <br>=
[ =C2=A0 27.263734] zynqmp_aes [0] ffffffc00912d000 1194c000 firmware:zynqm=
p-firmware:zynqmp-aes<br>[ =C2=A0 27.266314] zynqmp_aes [1] ffffffc00913500=
0 1194e000<br>[ =C2=A0 27.271331] zynqmp_aes [2] dump request align 1 ++<br=
>[ =C2=A0 27.276143] 00 c0 94 11 00 00 00 00<br>[ =C2=A0 27.279688] 50 c0 9=
4 11 00 00 00 00<br>[ =C2=A0 27.283234] 00 00 00 00 00 00 00 00<br>[ =C2=A0=
 27.286780] 00 c0 94 11 00 00 00 00<br>[ =C2=A0 27.290327] 40 00 00 00 00 0=
0 00 00<br>[ =C2=A0 27.293874] 00 00 00 00 00 00 00 00<br>[ =C2=A0 27.29742=
0] 01 00 00 00 00 00 00 00<br>[ =C2=A0 27.300967] zynqmp_aes [3] dump reque=
st -- <br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xypervisor part here =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D <br>(XEN) d0v1 Forwarding AES operation: 3254779951<b=
r><br>=3D=3D=3D=3D PMU part here =3D=3D=3D=3D <br>01194E000 agn 1<br>1E A7 =
D1 B1 35 22 7B 1F<br>AE 84 8F 56 99 03 80 3F<br>15 49 E7 F3 DE C9 E1 17<br>=
FB C7 7C 16 CF 58 DF A1<br>AF CF DC 07 F9 55 49 3F<br>E0 D9 35 89 50 81 FA =
AE<br>87 B6 29 16 96 F6 5F F2<br><br>=3D=3D=3D=3D ATF part here, i printed =
just after the request =3D=3D=3D=3D <br>INFO: =C2=A0 pm_aes_engine ### args=
 6 ret 0 addr 0 1194e000 ###<br><br>=3D=3D=3D=3D Back to Dom0 kernel =3D=3D=
=3D=3D <br>[ =C2=A0 27.336699] zynqmp_aes firmware:zynqmp-firmware:zynqmp-a=
es: ERROR : Non word aligned data<br><br>Without cache coloring<br>=3D=3D=
=3D=3D Dom0 kernel part here =3D=3D=3D=3D <br>[ =C2=A0 16.746389] zynqmp_ae=
s [0] ffffffc00910d000 5ecfd000 firmware:zynqmp-firmware:zynqmp-aes<br>[ =
=C2=A0 16.751548] zynqmp_aes [1] ffffffc009115000 5ed1e000<br>[ =C2=A0 16.7=
56557] zynqmp_aes [2] dump request align 1 ++<br>[ =C2=A0 16.761400] 00 d0 =
cf 5e 00 00 00 00<br>[ =C2=A0 16.764944] 50 d0 cf 5e 00 00 00 00<br>[ =C2=
=A0 16.768490] 00 00 00 00 00 00 00 00<br>[ =C2=A0 16.772037] 00 d0 cf 5e 0=
0 00 00 00<br>[ =C2=A0 16.775582] 40 00 00 00 00 00 00 00<br>[ =C2=A0 16.77=
9130] 00 00 00 00 00 00 00 00<br>[ =C2=A0 16.782676] 01 00 00 00 00 00 00 0=
0<br>[ =C2=A0 16.786231] zynqmp_aes [3] dump request --<br><br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D xypervisor part here =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D <br>=
(XEN) d0v0 Forwarding AES operation: 3254779951<br><br>=3D=3D=3D=3D PMU par=
t here =3D=3D=3D=3D <br>05ED1E000 agn 1<br>00 D0 CF 5E 00 00 00 00<br>50 D0=
 CF 5E 00 00 00 00<br>00 00 00 00 00 00 00 00<br>00 D0 CF 5E 00 00 00 00<br=
>40 00 00 00 00 00 00 00<br>00 00 00 00 00 00 00 00<br>01 00 00 00 00 00 00=
 00<br><br>=3D=3D=3D=3D ATF part here, i printed just after the request =3D=
=3D=3D=3D <br>INFO: =C2=A0 pm_aes_engine ### args 6 ret 0 addr 0 5ed1e000 #=
##<br><br>=3D=3D=3D=3D Back to Dom0 kernel =3D=3D=3D=3D <br>[ =C2=A0 16.821=
959] zynqmp_pm_aes_engine addr 5ed1e000 ret 0<br><br>As we may see here wit=
h the xen cache coloring dumps of request in both sides are equal.<br>Witho=
ut the xen cache coloring dumps of request in both sides are different.<br>=
So I got a guess.<br>According to Stefano&#39;s comments the difference bet=
ween both modes is in SMMU.<br>Without the cache coloring all the memory ma=
pping does programmaticaly by xypervisor.<br>With the xen cache coloring al=
l the memory mapping does by SMMU.<br>This is the point to my mind. SMMU do=
es not know anything about the DMA between Dom0 and PMU.<br>This is the poi=
nt.<br>Could someone suggest me a way how to fix it ?<br>Thanks for patienc=
e.<br><br>Regards<br>Oleg</div>

--000000000000516e4b05ff447cab--

