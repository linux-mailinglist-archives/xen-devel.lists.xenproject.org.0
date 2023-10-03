Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E327B65EA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 11:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612167.952012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnc3o-0004TO-Pr; Tue, 03 Oct 2023 09:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612167.952012; Tue, 03 Oct 2023 09:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnc3o-0004Rb-Mh; Tue, 03 Oct 2023 09:51:24 +0000
Received: by outflank-mailman (input) for mailman id 612167;
 Tue, 03 Oct 2023 09:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btf1=FR=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qnc3n-0004RV-Gx
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 09:51:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68634e49-61d2-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 11:51:21 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3231d67aff2so769491f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Oct 2023 02:51:21 -0700 (PDT)
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
X-Inumbo-ID: 68634e49-61d2-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696326681; x=1696931481; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kCOO9vY4XeJYNxX3kPm0MdrbKKjAfl65XKCcU6PCuP0=;
        b=chNb0gYI78FlHQzejJtbYnEMi2ow0l7ki9NVx5q9Ahy/o82xefUF2FprXHJ4N33kq3
         Wp972sRI+9WY+9KTBLGtZxgWgtj8YEGOXHRX3BttmKfN4N1dMTAJKRFpGumJOVmV6Uyk
         u3F91h69SsE1h+ljyVxX5+2kQC9gp8H9Ln1sbagKjo2T2mp7d7y69aOJWvmLLhumQ4yW
         5a09hcAPLcpCf+DxpgpJ3hPRtfP7EHlWVylgxxXhNGjgTShiVNJgPIj34qDwREbsnqio
         MaqB6ppygY/ZB73A6LriX/m8GNa0HXbmOFLitpTTaFyZvtByQEAmE+X3JtQptAFQoNim
         Kpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696326681; x=1696931481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCOO9vY4XeJYNxX3kPm0MdrbKKjAfl65XKCcU6PCuP0=;
        b=F8EPgLRkHeeaDdH4SsRJy1XU4JV7GKgkoWbVru6Fi5/0Y0evVhNboB5SbkwFB/1ZbN
         ai4tND/jjWCLeLJVWKgkgZhK5/dhO1cyDArn3ye+whAREoqHNJB2Q6iiESwJGW/AcLGf
         +ceD+UeEFj9vI9zt2Wu8GWjzzZ2UGmSxrj4dGDjzEkHd7ddyb/JDADKUgspQbf/ujcZC
         AySKCZGlVmdZ7G2CdLgCy+BOSMkmhYZFO4Bq5wRPmW7QNqouza0Ewv7kiPsET9Yld4ml
         aSBd8oJ8anCTuoyN7tV4HGvk4Gov6hK2Q6KNoJTrksrByv+tmRrTn7t+zAZkXLWNmS0l
         FTDw==
X-Gm-Message-State: AOJu0YwZ3ydUxkZCrXjxdem3VSA2SSmJsSiZeYb0thduahXnGdMq2T+s
	FOkDgvlJin8srWJf/szesKdzctdUbtR3DvHj9Cc=
X-Google-Smtp-Source: AGHT+IH0+bW6g+AzyDzknhCAt12bkHn/92N8A1hsO/aSxJuqakP7jL5ZbcsQHZzV6lRtauS9A5r8Q4QJnauJRyphb80=
X-Received: by 2002:a5d:6888:0:b0:314:ca7:f30b with SMTP id
 h8-20020a5d6888000000b003140ca7f30bmr12102066wru.54.1696326680887; Tue, 03
 Oct 2023 02:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
 <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org> <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com>
 <alpine.DEB.2.22.394.2309281447180.1996340@ubuntu-linux-20-04-desktop>
 <CA+SAi2vZie+PcKgkAbLxcaimG7strkWot1z4LTpCGLeJxuaT2g@mail.gmail.com>
 <CA+SAi2u2auZgzQh_s+pFspH1YLN4biCf0K7-V7NGWPZQjGoH0g@mail.gmail.com>
 <alpine.DEB.2.22.394.2310021608180.2348112@ubuntu-linux-20-04-desktop>
 <c101624b-96a3-30a4-b3a9-344dad5e8fa5@amd.com> <fe7c359e-60e0-41fb-7d39-93a8d6772073@amd.com>
In-Reply-To: <fe7c359e-60e0-41fb-7d39-93a8d6772073@amd.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Tue, 3 Oct 2023 12:58:25 +0300
Message-ID: <CA+SAi2uATXEWiBPJq06TCk=gdmjjn_fKzwNuGhf1SVUXRXcnpw@mail.gmail.com>
Subject: Re: Fwd: changing Dom0 data during smc call inside of xen during
 cache coloring
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Stewart.Hildebrand@amd.com
Content-Type: multipart/alternative; boundary="0000000000003cc5090606ccd5ff"

--0000000000003cc5090606ccd5ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michal,
Hello Stefano,

Thanks Michal. Your receipt worked.

Regards,
Oleg Nikitenko


=D0=B2=D1=82, 3 =D0=BE=D0=BA=D1=82. 2023=E2=80=AF=D0=B3. =D0=B2 10:33, Mich=
al Orzel <michal.orzel@amd.com>:

>
>
> On 03/10/2023 09:28, Michal Orzel wrote:
> >
> >
> > Hi Oleg, Stefano
> >
> > On 03/10/2023 02:13, Stefano Stabellini wrote:
> >> Hi Oleg,
> >>
> >> You are getting this output:
> >>
> >>> (XEN) d0v0 Forwarding AES operation: 3254779951 136bb00000000000 ->
> fffffffffffff000
> >>
> >> Which means that the guest physical address is 0x136bb00000000000 and
> >> the translated physical address is 0xfffffffffffff000. It generates an
> >> error so you are asking if 0xfffffffffffff000 is incorrect because the
> >> translation is incorrect.
> >>
> >> This is possible. However, I think it is more likely that
> >> 0x136bb000_00000000 is incorrect. This an extremely high address. Coul=
d
> >> it be wrong?
> >
> > I think the issue is due to a different way of forming the r1 register
> for this particular EEMI call:
> >
> > Take a look at the PM AES function from Linux:
> >
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/=
zynqmp.c#L1975
> > and EEMI call invocation:
> >
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/=
zynqmp.c#L390
> >
> > The register passed as r1 is formed a bit differently than "normally".
> FWICS:
> >  - the upper 32 bits of address are stored in the lower 32 bits of r1
> register.
> >  - the lower 32 bits of address are stored in the upper 32 bits of r1
> register.
> >
> > That is why you are getting a very high address in r1
> 0x136bb000_00000000.
> >
> > Please, try to do the following (not tested):
> >
> > case 0xC200002F:
> > {
> >     register_t gaddr, new_gaddr;
> >     paddr_t maddr;
> >
> >     gaddr =3D ((register_t)get_user_reg(regs, 1) << 32) |
> (get_user_reg(regs, 1) >> 32);
> >     maddr =3D mfn_to_maddr(gfn_to_mfn(current->domain,
> gaddr_to_gfn(gaddr)));
> >
> >     /* Most probably not needed given dma_alloc_coherent use */
> >     maddr +=3D gaddr &~ PAGE_MASK;
> >
> >     /* Convert back to required format */
> >     new_gaddr =3D ((register_t)maddr << 32) | (maddr >> 32);
> >
> >     arm_smccc_1_1_smc(get_user_reg(regs, 0),
> >             get_user_reg(regs, 1),
> >             new_gaddr,
> Wrong placement. This should be for register 1 and not 2, so:
>     arm_smccc_1_1_smc(get_user_reg(regs, 0),
>             new_gaddr,
>             get_user_reg(regs, 2),
>             get_user_reg(regs, 3),
>             get_user_reg(regs, 4),
>             get_user_reg(regs, 5),
>             get_user_reg(regs, 6),
>             get_user_reg(regs, 7),
>             &res);
>
> ~Michal
>

--0000000000003cc5090606ccd5ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Michal,</div><div>Hello Stefano,</div><div><br>=
</div><div>Thanks Michal. Your receipt worked.</div><div><br></div><div>Reg=
ards,</div><div>Oleg Nikitenko<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 3 =D0=
=BE=D0=BA=D1=82. 2023=E2=80=AF=D0=B3. =D0=B2 10:33, Michal Orzel &lt;<a hre=
f=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt;:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 03/10/2023 09:28, Michal Orzel wrote:<br>
&gt; <br>
&gt; <br>
&gt; Hi Oleg, Stefano<br>
&gt; <br>
&gt; On 03/10/2023 02:13, Stefano Stabellini wrote:<br>
&gt;&gt; Hi Oleg,<br>
&gt;&gt;<br>
&gt;&gt; You are getting this output:<br>
&gt;&gt;<br>
&gt;&gt;&gt; (XEN) d0v0 Forwarding AES operation: 3254779951 136bb000000000=
00 -&gt; fffffffffffff000<br>
&gt;&gt;<br>
&gt;&gt; Which means that the guest physical address is 0x136bb00000000000 =
and<br>
&gt;&gt; the translated physical address is 0xfffffffffffff000. It generate=
s an<br>
&gt;&gt; error so you are asking if 0xfffffffffffff000 is incorrect because=
 the<br>
&gt;&gt; translation is incorrect.<br>
&gt;&gt;<br>
&gt;&gt; This is possible. However, I think it is more likely that<br>
&gt;&gt; 0x136bb000_00000000 is incorrect. This an extremely high address. =
Could<br>
&gt;&gt; it be wrong?<br>
&gt; <br>
&gt; I think the issue is due to a different way of forming the r1 register=
 for this particular EEMI call:<br>
&gt; <br>
&gt; Take a look at the PM AES function from Linux:<br>
&gt; <a href=3D"https://github.com/Xilinx/linux-xlnx/blob/master/drivers/fi=
rmware/xilinx/zynqmp.c#L1975" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/zynqmp.c#L=
1975</a><br>
&gt; and EEMI call invocation:<br>
&gt; <a href=3D"https://github.com/Xilinx/linux-xlnx/blob/master/drivers/fi=
rmware/xilinx/zynqmp.c#L390" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/Xilinx/linux-xlnx/blob/master/drivers/firmware/xilinx/zynqmp.c#L3=
90</a><br>
&gt; <br>
&gt; The register passed as r1 is formed a bit differently than &quot;norma=
lly&quot;. FWICS:<br>
&gt;=C2=A0 - the upper 32 bits of address are stored in the lower 32 bits o=
f r1 register.<br>
&gt;=C2=A0 - the lower 32 bits of address are stored in the upper 32 bits o=
f r1 register.<br>
&gt; <br>
&gt; That is why you are getting a very high address in r1 0x136bb000_00000=
000.<br>
&gt; <br>
&gt; Please, try to do the following (not tested):<br>
&gt; <br>
&gt; case 0xC200002F:<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0register_t gaddr, new_gaddr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0paddr_t maddr;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0gaddr =3D ((register_t)get_user_reg(regs, 1) &lt;&l=
t; 32) | (get_user_reg(regs, 1) &gt;&gt; 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0maddr =3D mfn_to_maddr(gfn_to_mfn(current-&gt;domai=
n, gaddr_to_gfn(gaddr)));<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Most probably not needed given dma_alloc_coheren=
t use */<br>
&gt;=C2=A0 =C2=A0 =C2=A0maddr +=3D gaddr &amp;~ PAGE_MASK;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Convert back to required format */<br>
&gt;=C2=A0 =C2=A0 =C2=A0new_gaddr =3D ((register_t)maddr &lt;&lt; 32) | (ma=
ddr &gt;&gt; 32);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0arm_smccc_1_1_smc(get_user_reg(regs, 0),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_user_reg(regs, 1),<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_gaddr,<br>
Wrong placement. This should be for register 1 and not 2, so:<br>
=C2=A0 =C2=A0 arm_smccc_1_1_smc(get_user_reg(regs, 0),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_gaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_user_reg(regs, 2),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_user_reg(regs, 3),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_user_reg(regs, 4),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_user_reg(regs, 5),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_user_reg(regs, 6),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_user_reg(regs, 7),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;res);<br>
<br>
~Michal<br>
</blockquote></div>

--0000000000003cc5090606ccd5ff--

