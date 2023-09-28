Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F677B175E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609400.948475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnKX-0006Rm-8v; Thu, 28 Sep 2023 09:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609400.948475; Thu, 28 Sep 2023 09:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnKX-0006Of-5r; Thu, 28 Sep 2023 09:29:09 +0000
Received: by outflank-mailman (input) for mailman id 609400;
 Thu, 28 Sep 2023 09:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np3/=FM=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qlnKV-0006OV-R6
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:29:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7887ce5c-5de1-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 11:29:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-533c8f8f91dso12289361a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 02:29:06 -0700 (PDT)
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
X-Inumbo-ID: 7887ce5c-5de1-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695893346; x=1696498146; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KHRJXD7DiRS40s3/8QZnjCp2rbNIRcGZKRJ74EW+bgk=;
        b=a1Iwa1jwhR/YtwksfeSyZlJG9OZUMuPZzx7jGJBvB8OT9avi3jFac5IkQrPVSfK/ff
         nasO5EfXCXL/Ilux/EVd686KoE0YqCBcWUvQQj3ZnMrZQNqZHHnI0rs+LXbKuifnWBas
         AkWCPpKZsSCX+YI1elt4BjdgOCypMPNrXGszi8njewQHSOhXU/fcHEmPmo3/azMmiWo8
         Offa9101y2hKZdNuWqEC0Wk4oqrVYHDQnM365VomLGnnpVQnnXh5gWKsak/8UGwRYVa1
         x2Me5/V5Vj3RSbW1a7QjXDUXGQ/t7V2If5Sc465CSO6jKlCLIcpIse5UUmPO/kp6hL4y
         8eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695893346; x=1696498146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHRJXD7DiRS40s3/8QZnjCp2rbNIRcGZKRJ74EW+bgk=;
        b=sFKwDd70aHHAvGp55ik/tyJpSZYKJvmJlrIKZdEvmIxtDH741IotGIbupsazzOMDGf
         KA2eUz/lK4sEjHIFhUt8REtGJSmOqcpLwvTOSfPr0+NBG8zqse0BE4Ggyg0EGhZOK+tw
         c3Q1LAeipZq4TXnNr/9MN7blZbZKFB8dS9n2G42/vZ0ysxfbY0AlRtZYcdmwghepRCQA
         2JcPmH2jNggsOKoIRmh11pPvwqcb/MNrs/arpRwYQWqnZrFbCAv5rgBzkJGuCUlgaUCR
         6A94I7p9GTh/I5IgaHUMy9bGpqJcoKofn+X4O/FsX8+B9nJp6GIx3WZ/pkYcCYPCpoAQ
         OyDA==
X-Gm-Message-State: AOJu0YwK52uKKVqIl9qqk7lnnMdzT6rALEol8gOMC8IdVZ3LyCK7hgUf
	T2b4hS+uzGrtMPWAai0h2cVdWO6QCKj3R8gFh6U=
X-Google-Smtp-Source: AGHT+IHGy7HIbVdVgdFn+o4Rai6ZOxww0cBR30dFqZ2nNVkcO/8QC48zWAoTDwjFliQwl81aKxqNFMMPPcilzgrHJuI=
X-Received: by 2002:a17:907:985b:b0:9ae:55f5:180a with SMTP id
 jj27-20020a170907985b00b009ae55f5180amr749229ejc.9.1695893345889; Thu, 28 Sep
 2023 02:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
 <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org>
In-Reply-To: <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Thu, 28 Sep 2023 12:36:01 +0300
Message-ID: <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com>
Subject: Re: changing Dom0 data during smc call inside of xen during cache coloring
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000757301060667f067"

--000000000000757301060667f067
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

I am still fighting with xen Cache Coloring with aes.
When I sent a request to hardware aes after xen with CC started I got the
mistake in CSU.
When I dumped structure contents on both sides I got the different data.
Xilinx related contact wrote to me.

When cache coloring is enabled, Dom0 is not 1:1 mapped (guest physical
addresses in Dom0 !=3D physical addresses). If the Xilinx drivers in Linux
(xcsudma.c) issue EEMI calls with a guest physical address (for instance
the address of a memory buffer allocated by Linux), then this address is no
longer a physical address and would need to be translated. EEMI calls
always get forwarded to Xen first, then Xen issues a corresponding EEMI
call to the firmware (see
xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi). But Xen is probably
passing the EEMI calls parameters unmodified. Then PMU tries to read the
address but since this is not a physical address, it fails. Basically we
need to add code to Xen xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi to
translate any guest physical addresses passed as EEMI calls arguments into
physical addresses before making the EEMI call to firmware.

This is an example patch, which is translating the parameter on register x2
for the EEMI call 0xC200002F. I haven't checked the EEMI protocol for this
call but this just an example to show you how to translate parameters.

diff --git a/xen/arch/arm/platforms/xilinx-eemi.c
b/xen/arch/arm/platforms/xilinx-eemi.c index 500c86dc69..bff1b71196 100644
--- a/xen/arch/arm/platforms/xilinx-eemi.c +++
b/xen/arch/arm/platforms/xilinx-eemi.c @@ -409,6 +409,30 @@ bool
xilinx_eemi(struct cpu_user_regs *regs, const uint32_t fid, } goto
forward_to_fw;

   - case 0xC200002F:
   - {
   - uint64_t example_possible_address_param =3D get_user_reg(regs, 2);
   - uint64_t translated_address =3D mfn_to_maddr(gfn_to_mfn(current->domai=
n,
   - gaddr_to_gfn(example_possible_address_param)));
   - translated_address +=3D example_possible_address_param & ~PAGE_MASK; +
   - arm_smccc_1_1_smc(get_user_reg(regs, 0),
   - get_user_reg(regs, 1),
   - translated_address,
   - get_user_reg(regs, 3),
   - get_user_reg(regs, 4),
   - get_user_reg(regs, 5),
   - get_user_reg(regs, 6),
   - get_user_reg(regs, 7),
   - &res); +
   - set_user_reg(regs, 0, res.a0);
   - set_user_reg(regs, 1, res.a1);
   - set_user_reg(regs, 2, res.a2);
   - set_user_reg(regs, 3, res.a3);
   - return true;
   - }

+ default: if ( is_hardware_domain(current->domain) ) goto forward_to_fw;
The aes request structure contains physical addresses of the source and
destination.
These addresses are obtained via two calls dma_alloc_coherent.
The address of this structure is kept at x2 register.
I applied the suggested scheme in xen for xilinx_eemi(...) function.

case 0xC200002F:
{
uint64_t paramaddr =3D get_user_reg(regs, 2);
uint64_t phyaddr =3D mfn_to_maddr(gfn_to_mfn(current->domain,
gaddr_to_gfn(paramaddr)));
phyaddr +=3D (paramaddr & ~PAGE_MASK);
gprintk(XENLOG_DEBUG, "Forwarding AES operation: %u r2 %lx -> %lx\n", fid,
paramaddr, phyaddr);
set_user_reg(regs, 2, phyaddr);
}
goto forward_to_fw;

As a result I got the same issue as earlier.

[   17.350086]
zynq_aes_gcm
user log

[   17.350202] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes
@                                                       kernel log from Dom=
0
[   17.353015] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
[   17.358515] zynqmp_aes [0] ffffffc00910d000 2806000
firmware:zynqmp-firmware:zynqmp-aes
[   17.366546] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @
[   17.372347] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
[   17.377775] zynqmp_aes [1] ffffffc009115000 42a14000 keytype 1
[   17.383660] zynqmp_aes [2] dump request align 1 ++
[   17.388501] 00 60 80 02 00 00 00 00
[   17.392032] 50 60 80 02 00 00 00 00
[   17.395583] 00 00 00 00 00 00 00 00
[   17.399117] 00 60 80 02 00 00 00 00
[   17.402664] 40 00 00 00 00 00 00 00
[   17.406226] 00 00 00 00 00 00 00 00
[   17.409755] 01 00 00 00 00 00 00 00
[   17.413311] zynqmp_aes [3] dump request --

(XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 ->
11432000                                                        log from xe=
n

@ 000042A14000
@
csu log from aes
04 E4 00 6F 05 E4 00 6F
06 E4 00 6F 07 E4 00 6F
10 E4 00 6F 11 E4 00 6F
12 E4 00 6F 13 E4 00 6F
14 E4 00 6F 15 E4 00 6F
16 E4 00 6F 17 E4 00 6F
18 E4 00 6F 19 E4 00 6F

ERROR:   pm_aes_engine ### args 6 ret 0 addr 0 42a14000
###                                                                ATF log

So the address of the structure was not changed.
This is the question.
How can I map this address to xen and change physical addresses there ?

Regards,
Oleg Nikitenko

=D1=87=D1=82, 28 =D1=81=D0=B5=D0=BD=D1=82. 2023=E2=80=AF=D0=B3. =D0=B2 11:1=
5, Julien Grall <julien@xen.org>:

> On 27/09/2023 11:07, Oleg Nikitenko wrote:
> > Hello,
>
> Hi,
>
> > It is necessary to change some structure contents from xen.
> > I have access to the registers.
> > One of them keeps the physical address of the structure.
> > But this physical address is valid for Dom0 only.
> > Dom0 kernel gets it by the call dma_alloc_coherent
> > A lower mentioned scheme does not work.
>
> It is not clear to me what you mean by does not work. Are you getting
> the wrong address?
>
> >
> >              uint64_t paramaddr =3D (uint64_t)get_user_reg(regs, 2);
> >              uint64_t phyaddr =3D mfn_to_maddr(gfn_to_mfn(current->doma=
in,
> >                  gaddr_to_gfn(paramaddr)));
> >              phyaddr +=3D (paramaddr & ~PAGE_MASK);
>
> Can you provide a bit more context of what are you trying to do with
> phyaddr afterwards? Are you trying to map it in Xen?
>
> Cheers,
>
> --
> Julien Grall
>

--000000000000757301060667f067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Julien,</div><div><br></div><div>I am still fig=
hting with xen Cache Coloring with aes.</div><div>When I sent a request to =
hardware aes after xen with CC started I got the mistake in CSU.</div><div>=
When I dumped structure contents on both sides I got the different data.</d=
iv><div>Xilinx related contact wrote to me.</div><div><p>When cache colorin=
g is enabled, Dom0 is not 1:1 mapped (guest physical addresses in Dom0 !=3D=
 physical addresses).
If the Xilinx drivers in Linux (xcsudma.c) issue EEMI calls with a guest ph=
ysical address (for instance the address of a memory buffer allocated by Li=
nux),
then this address is no longer a physical address and would need to be tran=
slated.
EEMI calls always get forwarded to Xen first, then Xen issues a correspondi=
ng EEMI call to the firmware (see xen/arch/arm/platforms/xilinx-eemi.c:xili=
nx_eemi).
But Xen is probably passing the EEMI calls parameters unmodified.=20
Then PMU tries to read the address but since this is not a physical address=
, it fails.
Basically we need to add code to Xen xen/arch/arm/platforms/xilinx-eemi.c:x=
ilinx_eemi to translate any guest physical addresses passed as EEMI calls a=
rguments into physical addresses before making the EEMI call to firmware.</=
p>
<p>This is an example patch, which is translating the parameter on register=
 x2 for the EEMI call 0xC200002F.
I haven&#39;t checked the EEMI protocol for this call but this just an exam=
ple to show you how to translate parameters.</p>
<p>diff --git a/xen/arch/arm/platforms/xilinx-eemi.c b/xen/arch/arm/platfor=
ms/xilinx-eemi.c
index 500c86dc69..bff1b71196 100644
--- a/xen/arch/arm/platforms/xilinx-eemi.c
+++ b/xen/arch/arm/platforms/xilinx-eemi.c
@@ -409,6 +409,30 @@ bool xilinx_eemi(struct cpu_user_regs *regs, const uin=
t32_t fid,
         }
         goto forward_to_fw;
 </p>
<ul><li><span>case 0xC200002F:</span></li><li><span>{</span></li><li><span>=
uint64_t example_possible_address_param =3D get_user_reg(regs, 2);</span></=
li><li><span>uint64_t translated_address =3D mfn_to_maddr(gfn_to_mfn(curren=
t-&gt;domain,</span></li><li><span>gaddr_to_gfn(example_possible_address_pa=
ram)));</span></li><li><span>translated_address +=3D example_possible_addre=
ss_param &amp; ~PAGE_MASK;
+</span></li><li><span>arm_smccc_1_1_smc(get_user_reg(regs, 0),</span></li>=
<li><span>get_user_reg(regs, 1),</span></li><li><span>translated_address,</=
span></li><li><span>get_user_reg(regs, 3),</span></li><li><span>get_user_re=
g(regs, 4),</span></li><li><span>get_user_reg(regs, 5),</span></li><li><spa=
n>get_user_reg(regs, 6),</span></li><li><span>get_user_reg(regs, 7),</span>=
</li><li><span>&amp;res);
+</span></li><li><span>set_user_reg(regs, 0, res.a0);</span></li><li><span>=
set_user_reg(regs, 1, res.a1);</span></li><li><span>set_user_reg(regs, 2, r=
es.a2);</span></li><li><span>set_user_reg(regs, 3, res.a3);</span></li><li>=
<span>return true;</span></li><li><span>}</span></li></ul><p>+
     default:
         if ( is_hardware_domain(current-&gt;domain) )
             goto forward_to_fw;</p></div><div></div><div>The aes request s=
tructure contains physical addresses of the source and destination.</div><d=
iv>These addresses are obtained via two calls dma_alloc_coherent.<br></div>=
<div>The address of this structure is kept at x2 register.</div><div>I appl=
ied the suggested scheme in xen for xilinx_eemi(...) function.</div><div></=
div><div><br></div><div>case 0xC200002F:<br>{<br>uint64_t paramaddr =3D get=
_user_reg(regs, 2);<br>uint64_t phyaddr =3D mfn_to_maddr(gfn_to_mfn(current=
-&gt;domain, gaddr_to_gfn(paramaddr)));<br>phyaddr +=3D (paramaddr &amp; ~P=
AGE_MASK);<br>gprintk(XENLOG_DEBUG, &quot;Forwarding AES operation: %u r2 %=
lx -&gt; %lx\n&quot;, fid, paramaddr, phyaddr);<br>set_user_reg(regs, 2, ph=
yaddr);<br>}<br>goto forward_to_fw;<br></div><div><br></div><div>As a resul=
t I got the same issue as earlier.</div><div><br></div><div>[ =C2=A0 17.350=
086] zynq_aes_gcm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user log</div><di=
v><br>[ =C2=A0 17.350202] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 kernel log from Dom0<br>[ =C2=A0 17.353015] @@@ fi=
rmware:zynqmp-firmware:zynqmp-aes 0 @@@<br>[ =C2=A0 17.358515] zynqmp_aes [=
0] ffffffc00910d000 2806000 firmware:zynqmp-firmware:zynqmp-aes<br>[ =C2=A0=
 17.366546] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @<br>[ =C2=A0 1=
7.372347] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@<br>[ =C2=A0 17.3777=
75] zynqmp_aes [1] ffffffc009115000 42a14000 keytype 1<br>[ =C2=A0 17.38366=
0] zynqmp_aes [2] dump request align 1 ++<br>[ =C2=A0 17.388501] 00 60 80 0=
2 00 00 00 00<br>[ =C2=A0 17.392032] 50 60 80 02 00 00 00 00<br>[ =C2=A0 17=
.395583] 00 00 00 00 00 00 00 00<br>[ =C2=A0 17.399117] 00 60 80 02 00 00 0=
0 00<br>[ =C2=A0 17.402664] 40 00 00 00 00 00 00 00<br>[ =C2=A0 17.406226] =
00 00 00 00 00 00 00 00<br>[ =C2=A0 17.409755] 01 00 00 00 00 00 00 00<br>[=
 =C2=A0 17.413311] zynqmp_aes [3] dump request --<br></div><div><br></div><=
div>(XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -&gt; 11432000=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 log from xen<br></div><div><br></div><div>@ 000=
042A14000 @=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csu log from a=
es<br>04 E4 00 6F 05 E4 00 6F<br>06 E4 00 6F 07 E4 00 6F<br>10 E4 00 6F 11 =
E4 00 6F<br>12 E4 00 6F 13 E4 00 6F<br>14 E4 00 6F 15 E4 00 6F<br>16 E4 00 =
6F 17 E4 00 6F<br>18 E4 00 6F 19 E4 00 6F</div><div><br>ERROR: =C2=A0 pm_ae=
s_engine ### args 6 ret 0 addr 0 42a14000 ###=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ATF log<br></div><div><br>=
</div><div>So the address of the structure was not changed.</div><div>This =
is the question.=C2=A0</div><div>How can I map this address to xen and chan=
ge physical addresses there ?</div><div><br></div><div>Regards,</div><div>O=
leg Nikitenko<br></div><div><br></div><div>=D1=87=D1=82, 28 =D1=81=D0=B5=D0=
=BD=D1=82. 2023=E2=80=AF=D0=B3. =D0=B2 11:15, Julien Grall &lt;<a href=3D"m=
ailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;:</div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
7/09/2023 11:07, Oleg Nikitenko wrote:<br>
&gt; Hello,<br>
<br>
Hi,<br>
<br>
&gt; It is necessary to change some structure contents from xen.<br>
&gt; I have access to the registers.<br>
&gt; One of them keeps the physical address of the structure.<br>
&gt; But this physical address is valid for Dom0 only.<br>
&gt; Dom0 kernel gets it by the call dma_alloc_coherent<br>
&gt; A lower mentioned scheme does not work.<br>
<br>
It is not clear to me what you mean by does not work. Are you getting <br>
the wrong address?<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t paramaddr =3D=
 (uint64_t)get_user_reg(regs, 2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t phyaddr =3D m=
fn_to_maddr(gfn_to_mfn(current-&gt;domain,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gaddr_to=
_gfn(paramaddr)));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phyaddr +=3D (paramadd=
r &amp; ~PAGE_MASK);<br>
<br>
Can you provide a bit more context of what are you trying to do with <br>
phyaddr afterwards? Are you trying to map it in Xen?<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--000000000000757301060667f067--

