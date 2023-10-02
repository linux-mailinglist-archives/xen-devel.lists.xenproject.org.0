Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF067B4F60
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 11:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611367.950928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnFVM-0003fr-3d; Mon, 02 Oct 2023 09:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611367.950928; Mon, 02 Oct 2023 09:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnFVM-0003eA-0Z; Mon, 02 Oct 2023 09:46:20 +0000
Received: by outflank-mailman (input) for mailman id 611367;
 Mon, 02 Oct 2023 09:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/9Xl=FQ=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qnFVK-0003ck-7V
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 09:46:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8769554a-6108-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 11:46:15 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-406619b53caso23711855e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Oct 2023 02:46:15 -0700 (PDT)
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
X-Inumbo-ID: 8769554a-6108-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696239975; x=1696844775; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69vCOCbkUwz9oeuuBbbBSOwYZLNY3NDsjhrUlPfYO9U=;
        b=hau73OY4R6w49dFV8O/dIfFJXlTNpxDR8/JibBd7RDr0zx7dCWXnJfuQootrJ6UqSt
         c3cjt5QbGPoKcEFDwp4rRg4waip64xJjWKtTSzIrGePghssYs1uXsM/q/DllKx2HuYVw
         mFK/BrC+385mO7qGRRa3o9sYulpZyleT4JrWgxDxKza0trLuloXy8KKBw7+ft+71Tajf
         BgxwyyWfsSP+gdf22O5DFqZvBcQXmwOa6/3Qkom3y7Jd5GyZQzP1DKnrkSpJr9GCBYk2
         etr5nq4OSusKiI0AUCaZ1Ztc3S6ihxXDIHmJuCWxV+nZlbm/veCF5weGWuT3eHaaD7SO
         7+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696239975; x=1696844775;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69vCOCbkUwz9oeuuBbbBSOwYZLNY3NDsjhrUlPfYO9U=;
        b=vuSK+5MxHqRobN1rotaC1iLLYmsSVf9Vp+ANz4l9i+KlNiFSZBkh7kJUeLa9c7F4OG
         PG5a3oQ6Vkg9Fm8Sf3kZ//MYoH/djlw+C/x4wZ3YGwwbt1r+hh2HCs67kzTEGCFHGpne
         DREjicVpUuNAu5kssuXWQrteRAD1OAKCbZKRWoVoIgVbpSYYlTSXXfdsl/bvWB7H36df
         nMs9R7VrP5kHUHG8lWEnoQirUimeoyKHsOw4JKnF1/4uyMmGPAgGf9hv4nR+MQtt/EI8
         JaZ+yBp72+++pdYm1ZqUOki3HTUrYatSknGzP1Oh4ATAPqtYEqC++9vqyT90DWQzI1Fm
         tQlQ==
X-Gm-Message-State: AOJu0YxmtLWrADCSIUmTa4f498FVa1y9PAr0/mPwq9bms2sHzwdjp2II
	oMf+FcVdx+SqUv5SW7GLYe8NRU6E42GsdXIIV6g=
X-Google-Smtp-Source: AGHT+IHDAcIGo2wPX70l+RnpujvEGDdu8sRrHDxyarR/KDA3V9x71sd8g+R6mToHIuV/YpjpjhrGIN1jAUPtI09jQVc=
X-Received: by 2002:a5d:60cd:0:b0:317:4ef8:1659 with SMTP id
 x13-20020a5d60cd000000b003174ef81659mr9347722wrt.28.1696239974727; Mon, 02
 Oct 2023 02:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
 <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org> <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com>
 <alpine.DEB.2.22.394.2309281447180.1996340@ubuntu-linux-20-04-desktop> <CA+SAi2vZie+PcKgkAbLxcaimG7strkWot1z4LTpCGLeJxuaT2g@mail.gmail.com>
In-Reply-To: <CA+SAi2vZie+PcKgkAbLxcaimG7strkWot1z4LTpCGLeJxuaT2g@mail.gmail.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Mon, 2 Oct 2023 12:53:17 +0300
Message-ID: <CA+SAi2u2auZgzQh_s+pFspH1YLN4biCf0K7-V7NGWPZQjGoH0g@mail.gmail.com>
Subject: Fwd: changing Dom0 data during smc call inside of xen during cache coloring
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Carlo Nonato <carlo.nonato@minervasys.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Stewart.Hildebrand@amd.com
Content-Type: multipart/alternative; boundary="00000000000025c65c0606b8a5c7"

--00000000000025c65c0606b8a5c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefano,
Hello Julien,

> OK I see the question is about the Xilinx Xen tree. In the logs below we
have:

I see. After the correction r2 to r1 CSU got aborted immediately.

(XEN) d0v0 Forwarding AES operation: 3254779951 136bb00000000000 ->
fffffffffffff000
Received exception
MSR: 0x200, EAR: 0x2F, EDR: 0x0, ESR: 0x861

I printed the value which I got after the expression which I provided in
the 1-st email executed.

So I may conclude that Xilinx's real physical address calculation scheme on
the xen CC is incorrect.

Could you suggest a correct one ?

Regards,
Oleg Nikitenko

=D0=BF=D1=82, 29 =D1=81=D0=B5=D0=BD=D1=82. 2023=E2=80=AF=D0=B3. =D0=B2 00:5=
0, Stefano Stabellini <sstabellini@kernel.org>:

> On Thu, 28 Sep 2023, Oleg Nikitenko wrote:
> > Hello Julien,
> >
> > I am still fighting with xen Cache Coloring with aes.
> > When I sent a request to hardware aes after xen with CC started I got
> the mistake in CSU.
> > When I dumped structure contents on both sides I got the different data=
.
> > Xilinx related contact wrote to me.
> >
> > When cache coloring is enabled, Dom0 is not 1:1 mapped (guest physical
> addresses in Dom0 !=3D physical addresses). If the Xilinx drivers in
> > Linux (xcsudma.c) issue EEMI calls with a guest physical address (for
> instance the address of a memory buffer allocated by Linux), then
> > this address is no longer a physical address and would need to be
> translated. EEMI calls always get forwarded to Xen first, then Xen issues
> > a corresponding EEMI call to the firmware (see
> xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi). But Xen is probably
> passing the EEMI
> > calls parameters unmodified. Then PMU tries to read the address but
> since this is not a physical address, it fails. Basically we need to
> > add code to Xen xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi to
> translate any guest physical addresses passed as EEMI calls arguments
> > into physical addresses before making the EEMI call to firmware.
> >
> > This is an example patch, which is translating the parameter on registe=
r
> x2 for the EEMI call 0xC200002F. I haven't checked the EEMI
> > protocol for this call but this just an example to show you how to
> translate parameters.
> >
> > diff --git a/xen/arch/arm/platforms/xilinx-eemi.c
> b/xen/arch/arm/platforms/xilinx-eemi.c index 500c86dc69..bff1b71196 10064=
4
> ---
> > a/xen/arch/arm/platforms/xilinx-eemi.c +++
> b/xen/arch/arm/platforms/xilinx-eemi.c @@ -409,6 +409,30 @@ bool
> xilinx_eemi(struct
> > cpu_user_regs *regs, const uint32_t fid, } goto forward_to_fw;
> >
> >  *  case 0xC200002F:
> >  *  {
> >  *  uint64_t example_possible_address_param =3D get_user_reg(regs, 2);
> >  *  uint64_t translated_address =3D
> mfn_to_maddr(gfn_to_mfn(current->domain,
> >  *  gaddr_to_gfn(example_possible_address_param)));
> >  *  translated_address +=3D example_possible_address_param & ~PAGE_MASK=
; +
> >  *  arm_smccc_1_1_smc(get_user_reg(regs, 0),
> >  *  get_user_reg(regs, 1),
> >  *  translated_address,
> >  *  get_user_reg(regs, 3),
> >  *  get_user_reg(regs, 4),
> >  *  get_user_reg(regs, 5),
> >  *  get_user_reg(regs, 6),
> >  *  get_user_reg(regs, 7),
> >  *  &res); +
> >  *  set_user_reg(regs, 0, res.a0);
> >  *  set_user_reg(regs, 1, res.a1);
> >  *  set_user_reg(regs, 2, res.a2);
> >  *  set_user_reg(regs, 3, res.a3);
> >  *  return true;
> >  *  }
> >
> > + default: if ( is_hardware_domain(current->domain) ) goto forward_to_f=
w;
> >
> > The aes request structure contains physical addresses of the source and
> destination.
> > These addresses are obtained via two calls dma_alloc_coherent.
> > The address of this structure is kept at x2 register.
>
> OK I see the question is about the Xilinx Xen tree. In the logs below we
> have:
>
> > (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 ->
> 11432000                                                        log from =
xen
>
> So it looks Linux passed 0 as address in x2, which cannot be right?
>
>
>
> > I applied the suggested scheme in xen for xilinx_eemi(...) function.
> >
> > case 0xC200002F:
> > {
> > uint64_t paramaddr =3D get_user_reg(regs, 2);
>
> It would seem that this is not read correctly? It should not be zero.
>
>
> > uint64_t phyaddr =3D mfn_to_maddr(gfn_to_mfn(current->domain,
> gaddr_to_gfn(paramaddr)));
> > phyaddr +=3D (paramaddr & ~PAGE_MASK);
> > gprintk(XENLOG_DEBUG, "Forwarding AES operation: %u r2 %lx -> %lx\n",
> fid, paramaddr, phyaddr);
> > set_user_reg(regs, 2, phyaddr);
> > }
> > goto forward_to_fw;
> >
> > As a result I got the same issue as earlier.
> >
> > [   17.350086]
> >
> zynq_aes_gcm
> user
> > log
> >
> > [   17.350202] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes
> @                                                       kernel log from D=
om0
> > [   17.353015] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
> > [   17.358515] zynqmp_aes [0] ffffffc00910d000 2806000
> firmware:zynqmp-firmware:zynqmp-aes
> > [   17.366546] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @
> > [   17.372347] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
> > [   17.377775] zynqmp_aes [1] ffffffc009115000 42a14000 keytype 1
> > [   17.383660] zynqmp_aes [2] dump request align 1 ++
> > [   17.388501] 00 60 80 02 00 00 00 00
> > [   17.392032] 50 60 80 02 00 00 00 00
> > [   17.395583] 00 00 00 00 00 00 00 00
> > [   17.399117] 00 60 80 02 00 00 00 00
> > [   17.402664] 40 00 00 00 00 00 00 00
> > [   17.406226] 00 00 00 00 00 00 00 00
> > [   17.409755] 01 00 00 00 00 00 00 00
> > [   17.413311] zynqmp_aes [3] dump request --
> >
> > (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 ->
> 11432000                                                        log from =
xen
>
> Here
>
>
> > @ 000042A14000
> >
> @
> csu
> > log from aes
> > 04 E4 00 6F 05 E4 00 6F
> > 06 E4 00 6F 07 E4 00 6F
> > 10 E4 00 6F 11 E4 00 6F
> > 12 E4 00 6F 13 E4 00 6F
> > 14 E4 00 6F 15 E4 00 6F
> > 16 E4 00 6F 17 E4 00 6F
> > 18 E4 00 6F 19 E4 00 6F
> >
> > ERROR:   pm_aes_engine ### args 6 ret 0 addr 0 42a14000
> ###                                                                ATF lo=
g
> >
> > So the address of the structure was not changed.
> > This is the question.
> > How can I map this address to xen and change physical addresses there ?

--00000000000025c65c0606b8a5c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr"><div>H=
ello Stefano,</div><div>Hello Julien,<br></div><div><br></div><div>&gt; OK =
I see the question is about the Xilinx Xen tree. In the logs below we have:=
<span><br></span></div><div><span><br></span></div><div><span>I see. After =
the correction r2 to r1 CSU got aborted immediately.<br></span></div><div><=
span><br></span></div><div>(XEN) d0v0 Forwarding AES operation: 3254779951 =
136bb00000000000 -&gt; fffffffffffff000<br>Received exception<br>MSR: 0x200=
, EAR: 0x2F, EDR: 0x0, ESR: 0x861</div><div><br></div><div>I printed the va=
lue which I got after the expression which I provided in the 1-st email exe=
cuted.<br></div><div><br></div><div>So I may conclude that Xilinx&#39;s rea=
l physical address calculation scheme on the xen CC is incorrect.</div><div=
><br></div><div>Could you suggest a correct one ?</div><div><br></div><div>=
Regards,</div><div>Oleg Nikitenko<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D1=82, 29 =D1=81=D0=B5=D0=
=BD=D1=82. 2023=E2=80=AF=D0=B3. =D0=B2 00:50, Stefano Stabellini &lt;<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, 28 Sep 2023, Oleg Nikitenko wrote:<br>
&gt; Hello Julien,<br>
&gt; <br>
&gt; I am still fighting with xen Cache Coloring with aes.<br>
&gt; When I sent a request to hardware aes after xen with CC started I got =
the mistake in CSU.<br>
&gt; When I dumped structure contents on both sides I got the different dat=
a.<br>
&gt; Xilinx related contact wrote to me.<br>
&gt; <br>
&gt; When cache coloring is enabled, Dom0 is not 1:1 mapped (guest physical=
 addresses in Dom0 !=3D physical addresses). If the Xilinx drivers in<br>
&gt; Linux (xcsudma.c) issue EEMI calls with a guest physical address (for =
instance the address of a memory buffer allocated by Linux), then<br>
&gt; this address is no longer a physical address and would need to be tran=
slated. EEMI calls always get forwarded to Xen first, then Xen issues<br>
&gt; a corresponding EEMI call to the firmware (see xen/arch/arm/platforms/=
xilinx-eemi.c:xilinx_eemi). But Xen is probably passing the EEMI<br>
&gt; calls parameters unmodified. Then PMU tries to read the address but si=
nce this is not a physical address, it fails. Basically we need to<br>
&gt; add code to Xen xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi to tr=
anslate any guest physical addresses passed as EEMI calls arguments<br>
&gt; into physical addresses before making the EEMI call to firmware.<br>
&gt; <br>
&gt; This is an example patch, which is translating the parameter on regist=
er x2 for the EEMI call 0xC200002F. I haven&#39;t checked the EEMI<br>
&gt; protocol for this call but this just an example to show you how to tra=
nslate parameters.<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/platforms/xilinx-eemi.c b/xen/arch/arm/platf=
orms/xilinx-eemi.c index 500c86dc69..bff1b71196 100644 ---<br>
&gt; a/xen/arch/arm/platforms/xilinx-eemi.c +++ b/xen/arch/arm/platforms/xi=
linx-eemi.c @@ -409,6 +409,30 @@ bool xilinx_eemi(struct<br>
&gt; cpu_user_regs *regs, const uint32_t fid, } goto forward_to_fw;<br>
&gt; <br>
&gt;=C2=A0 *=C2=A0 case 0xC200002F:<br>
&gt;=C2=A0 *=C2=A0 {<br>
&gt;=C2=A0 *=C2=A0 uint64_t example_possible_address_param =3D get_user_reg=
(regs, 2);<br>
&gt;=C2=A0 *=C2=A0 uint64_t translated_address =3D mfn_to_maddr(gfn_to_mfn(=
current-&gt;domain,<br>
&gt;=C2=A0 *=C2=A0 gaddr_to_gfn(example_possible_address_param)));<br>
&gt;=C2=A0 *=C2=A0 translated_address +=3D example_possible_address_param &=
amp; ~PAGE_MASK; +<br>
&gt;=C2=A0 *=C2=A0 arm_smccc_1_1_smc(get_user_reg(regs, 0),<br>
&gt;=C2=A0 *=C2=A0 get_user_reg(regs, 1),<br>
&gt;=C2=A0 *=C2=A0 translated_address,<br>
&gt;=C2=A0 *=C2=A0 get_user_reg(regs, 3),<br>
&gt;=C2=A0 *=C2=A0 get_user_reg(regs, 4),<br>
&gt;=C2=A0 *=C2=A0 get_user_reg(regs, 5),<br>
&gt;=C2=A0 *=C2=A0 get_user_reg(regs, 6),<br>
&gt;=C2=A0 *=C2=A0 get_user_reg(regs, 7),<br>
&gt;=C2=A0 *=C2=A0 &amp;res); +<br>
&gt;=C2=A0 *=C2=A0 set_user_reg(regs, 0, res.a0);<br>
&gt;=C2=A0 *=C2=A0 set_user_reg(regs, 1, res.a1);<br>
&gt;=C2=A0 *=C2=A0 set_user_reg(regs, 2, res.a2);<br>
&gt;=C2=A0 *=C2=A0 set_user_reg(regs, 3, res.a3);<br>
&gt;=C2=A0 *=C2=A0 return true;<br>
&gt;=C2=A0 *=C2=A0 }<br>
&gt; <br>
&gt; + default: if ( is_hardware_domain(current-&gt;domain) ) goto forward_=
to_fw;<br>
&gt; <br>
&gt; The aes request structure contains physical addresses of the source an=
d destination.<br>
&gt; These addresses are obtained via two calls dma_alloc_coherent.<br>
&gt; The address of this structure is kept at x2 register.<br>
<br>
OK I see the question is about the Xilinx Xen tree. In the logs below we<br=
>
have:<br>
<br>
&gt; (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -&gt; 11432000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 log from xen<br>
<br>
So it looks Linux passed 0 as address in x2, which cannot be right?<br>
<br>
<br>
<br>
&gt; I applied the suggested scheme in xen for xilinx_eemi(...) function.<b=
r>
&gt; <br>
&gt; case 0xC200002F:<br>
&gt; {<br>
&gt; uint64_t paramaddr =3D get_user_reg(regs, 2);<br>
<br>
It would seem that this is not read correctly? It should not be zero.<br>
<br>
<br>
&gt; uint64_t phyaddr =3D mfn_to_maddr(gfn_to_mfn(current-&gt;domain, gaddr=
_to_gfn(paramaddr)));<br>
&gt; phyaddr +=3D (paramaddr &amp; ~PAGE_MASK);<br>
&gt; gprintk(XENLOG_DEBUG, &quot;Forwarding AES operation: %u r2 %lx -&gt; =
%lx\n&quot;, fid, paramaddr, phyaddr);<br>
&gt; set_user_reg(regs, 2, phyaddr);<br>
&gt; }<br>
&gt; goto forward_to_fw;<br>
&gt; <br>
&gt; As a result I got the same issue as earlier.<br>
&gt; <br>
&gt; [ =C2=A0 17.350086]<br>
&gt; zynq_aes_gcm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user<br>
&gt; log<br>
&gt; <br>
&gt; [ =C2=A0 17.350202] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 kernel log from Dom0<br>
&gt; [ =C2=A0 17.353015] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@<br>
&gt; [ =C2=A0 17.358515] zynqmp_aes [0] ffffffc00910d000 2806000 firmware:z=
ynqmp-firmware:zynqmp-aes<br>
&gt; [ =C2=A0 17.366546] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @<=
br>
&gt; [ =C2=A0 17.372347] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@<br>
&gt; [ =C2=A0 17.377775] zynqmp_aes [1] ffffffc009115000 42a14000 keytype 1=
<br>
&gt; [ =C2=A0 17.383660] zynqmp_aes [2] dump request align 1 ++<br>
&gt; [ =C2=A0 17.388501] 00 60 80 02 00 00 00 00<br>
&gt; [ =C2=A0 17.392032] 50 60 80 02 00 00 00 00<br>
&gt; [ =C2=A0 17.395583] 00 00 00 00 00 00 00 00<br>
&gt; [ =C2=A0 17.399117] 00 60 80 02 00 00 00 00<br>
&gt; [ =C2=A0 17.402664] 40 00 00 00 00 00 00 00<br>
&gt; [ =C2=A0 17.406226] 00 00 00 00 00 00 00 00<br>
&gt; [ =C2=A0 17.409755] 01 00 00 00 00 00 00 00<br>
&gt; [ =C2=A0 17.413311] zynqmp_aes [3] dump request --<br>
&gt; <br>
&gt; (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -&gt; 11432000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 log from xen<br>
<br>
Here<br>
<br>
<br>
&gt; @ 000042A14000<br>
&gt; @=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csu<br>
&gt; log from aes<br>
&gt; 04 E4 00 6F 05 E4 00 6F<br>
&gt; 06 E4 00 6F 07 E4 00 6F<br>
&gt; 10 E4 00 6F 11 E4 00 6F<br>
&gt; 12 E4 00 6F 13 E4 00 6F<br>
&gt; 14 E4 00 6F 15 E4 00 6F<br>
&gt; 16 E4 00 6F 17 E4 00 6F<br>
&gt; 18 E4 00 6F 19 E4 00 6F<br>
&gt; <br>
&gt; ERROR: =C2=A0 pm_aes_engine ### args 6 ret 0 addr 0 42a14000 ###=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AT=
F log<br>
&gt; <br>
&gt; So the address of the structure was not changed.<br>
&gt; This is the question.=C2=A0<br>
&gt; How can I map this address to xen and change physical addresses there =
?</blockquote></div>
</div></div>

--00000000000025c65c0606b8a5c7--

