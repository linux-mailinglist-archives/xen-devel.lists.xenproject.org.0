Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A2830007
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 07:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668242.1040288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPzAM-0002q8-UN; Wed, 17 Jan 2024 06:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668242.1040288; Wed, 17 Jan 2024 06:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPzAM-0002ox-Qb; Wed, 17 Jan 2024 06:12:46 +0000
Received: by outflank-mailman (input) for mailman id 668242;
 Wed, 17 Jan 2024 06:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1SL=I3=gmail.com=simonpatp@srs-se1.protection.inumbo.net>)
 id 1rPzAK-0002oo-OQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 06:12:44 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c816309-b4ff-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 07:12:42 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cddf596321so16160161fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 22:12:42 -0800 (PST)
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
X-Inumbo-ID: 6c816309-b4ff-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705471962; x=1706076762; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Wzitacmlpqu4h9AJBfhSPZE45fuDpcnpe1j8XVCyFo=;
        b=jgMeVN6AWpPtlIRaeBBNhoY5oWEAEt6nweu/ILWfd2o5/aHp7ds5y3a6bp3ncDQytH
         15kWJ8qKI7XXuRDhJ3XQSyz4cKkQTgRRx3mZCXfCZu+TRxM8YRwyOiTIQ2JJ3NV3smPT
         A4KoeJp5cJYycVEaE27GCQgMyDJsfrZ4CYK6eNhXAI9gUL3jLZ9e6h/bw5efHDZYhJCf
         ZcjAeILzYmPRo59UhuQ+8gB59tWmcPTYAuHMh8d0tT8mVJ/I/JMv/3tthiGM2qBmqzmW
         IU280zvA+WlgtOGCjlcDmtJYjmQoiIwAlqzcVyBbSq8Vtk/Popqzx0tEVMgkM04rrUqL
         lwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705471962; x=1706076762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Wzitacmlpqu4h9AJBfhSPZE45fuDpcnpe1j8XVCyFo=;
        b=uNwuIPtfxxAySGz3M4DErzVaz2S51sWtXS4DEdWIPPuqi2pNCDmtnYcNMZQU4h42g6
         Oy65YNOBw1X8dK3D2gpEzd8aj+CrrOuEZxEcnd7oAca+8oIVcVKk1Zj7WOfX+iIF9b03
         gaq0S4DfVXhbYa0lbXqHc145Zmgk/FQMTTxD6tk16TSg7BeH7IHSKuk/9Ce86ffPQRv2
         l+PHxRwjnBTyha/wKRlcYRKpj9mBIFyFL7Pa4g+jwuwpDlpD1QcTpvnqzgIg++UNbuM2
         ALpQy5ST/Q//XncECq+QbIWecPjiaGcAOSD35mUP+SAIXeuzRzRuENy8CKrwxRRHBwC1
         tZyg==
X-Gm-Message-State: AOJu0Yzgg92itzRO4bw7isQUgKUlNhryNHWxx5K0WxoYDa47Eq+1PCsA
	sYM9ulo6S9Gq4zx1Uxwdr32mIxlZac3IhThiWQfdxFyJs38=
X-Google-Smtp-Source: AGHT+IE0IFA1zuHsS9YbZTjlRK5sFdelCEHC6XxLohH5nZ7WhM2kwdJUTom/+i5OeCk/FaNBVj6IF7oUPbbPSRo/3FM=
X-Received: by 2002:a2e:9b51:0:b0:2cc:ddb9:e458 with SMTP id
 o17-20020a2e9b51000000b002ccddb9e458mr3719336ljj.28.1705471961727; Tue, 16
 Jan 2024 22:12:41 -0800 (PST)
MIME-Version: 1.0
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com> <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com> <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
In-Reply-To: <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Wed, 17 Jan 2024 01:12:30 -0500
Message-ID: <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="0000000000007407da060f1e2218"

--0000000000007407da060f1e2218
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 4:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 16.01.2024 01:22, Patrick Plenefisch wrote:
> > I managed to set up serial access and saved the output with the request=
ed
> > flags as the attached logs
>
> Thanks. While you didn't ...
>
>
> ... fiddle with the Linux message,  ...
>

I last built the kernel over a decade ago, and so was hoping to not have to
look up how to do that again, but I can research how to go about that again
if it would help?


>
> ... as per
>
> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4a00000
>
> there's an overlap with not exactly a hole, but with an
> EfiACPIMemoryNVS region:
>
> (XEN)  0000000100000-0000003159fff type=3D2 attr=3D000000000000000f
> (XEN)  000000315a000-0000003ffffff type=3D7 attr=3D000000000000000f
> (XEN)  0000004000000-0000004045fff type=3D10 attr=3D000000000000000f
> (XEN)  0000004046000-0000009afefff type=3D7 attr=3D000000000000000f
>
> (the 3rd of the 4 lines). Considering there's another region higher
> up:
>
> (XEN)  00000a747f000-00000a947efff type=3D10 attr=3D000000000000000f
>
> I'm inclined to say it is poor firmware (or, far less likely, boot
> loader) behavior to clobber a rather low and entirely arbitrary RAM
>

Bootloader is Grub 2.06 EFI platform as packaged by Debian 12



> range, rather than consolidating all such regions near the top of
> RAM below 4Gb. There are further such odd regions, btw:
>
> (XEN)  0000009aff000-0000009ffffff type=3D0 attr=3D000000000000000f
> ...
> (XEN)  000000b000000-000000b020fff type=3D0 attr=3D000000000000000f
>
> If the kernel image was sufficiently much larger, these could become
> a problem as well. Otoh if the kernel wasn't built with
> CONFIG_PHYSICAL_START=3D0x1000000, i.e. to start at 16Mb, but at, say,
> 2Mb, things should apparently work even with this unusual memory
> layout (until the kernel would grow enough to again run into that
> very region).
>

I'm currently talking to the vendor's support team and testing a beta BIOS
for unrelated reasons, is there something specific I should forward to
them, either as a question or as a request for a fix?

As someone who hasn't built a kernel in over a decade, should I figure out
how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000000 and report
back?


> It remains to be seen in how far it is reasonably possible to work
> around this in the kernel. While (sadly) still unsupported, in the
> meantime you may want to consider running Dom0 in PVH mode.
>

I tried this by adding dom0=3Dpvh, and instead got this boot error:

(XEN) xenoprof: Initialization failed. AMD processor family 25 is not
supported
(XEN) NX (Execute Disable) protection active
(XEN) Dom0 has maximum 1400 PIRQs
(XEN) *** Building a PVH Dom0 ***
(XEN) Failed to load kernel: -1
(XEN) Xen dom0 kernel broken ELF: <NULL>
(XEN) Failed to load Dom0 kernel
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not construct domain 0
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...




>
> Jan
>

--0000000000007407da060f1e2218
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 16, 2024 at 4:33=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 16.01.2024 01:22, Patrick Plenefisch wrote:<br>
&gt; I managed to set up serial access and saved the output with the reques=
ted<br>
&gt; flags as the attached logs<br>
<br>
Thanks. While you didn&#39;t ...<br>
<br>
<br>
... fiddle with the Linux message,=C2=A0 ... <br></blockquote><div><br></di=
v><div>I last built the kernel over a decade ago, and so was hoping to not =
have to look up how to do that again, but I can research how to go about th=
at again if it would help?<br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
... as per<br>
<br>
(XEN)=C2=A0 Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -&gt; 0x4a00000<=
br>
<br>
there&#39;s an overlap with not exactly a hole, but with an<br>
EfiACPIMemoryNVS region:<br>
<br>
(XEN)=C2=A0 0000000100000-0000003159fff type=3D2 attr=3D000000000000000f<br=
>
(XEN)=C2=A0 000000315a000-0000003ffffff type=3D7 attr=3D000000000000000f<br=
>
(XEN)=C2=A0 0000004000000-0000004045fff type=3D10 attr=3D000000000000000f<b=
r>
(XEN)=C2=A0 0000004046000-0000009afefff type=3D7 attr=3D000000000000000f<br=
>
<br>
(the 3rd of the 4 lines). Considering there&#39;s another region higher<br>
up:<br>
<br>
(XEN)=C2=A0 00000a747f000-00000a947efff type=3D10 attr=3D000000000000000f<b=
r>
<br>
I&#39;m inclined to say it is poor firmware (or, far less likely, boot<br>
loader) behavior to clobber a rather low and entirely arbitrary RAM<br></bl=
ockquote><div>=C2=A0</div><div>Bootloader is Grub 2.06 EFI platform as pack=
aged by Debian 12<br></div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
range, rather than consolidating all such regions near the top of<br>
RAM below 4Gb. There are further such odd regions, btw:<br>
<br>
(XEN)=C2=A0 0000009aff000-0000009ffffff type=3D0 attr=3D000000000000000f<br=
>
...<br>
(XEN)=C2=A0 000000b000000-000000b020fff type=3D0 attr=3D000000000000000f<br=
>
<br>
If the kernel image was sufficiently much larger, these could become<br>
a problem as well. Otoh if the kernel wasn&#39;t built with<br>
CONFIG_PHYSICAL_START=3D0x1000000, i.e. to start at 16Mb, but at, say,<br>
2Mb, things should apparently work even with this unusual memory<br>
layout (until the kernel would grow enough to again run into that<br>
very region).<br></blockquote><div><br></div><div>I&#39;m currently talking=
 to the vendor&#39;s support team and testing a beta BIOS for unrelated rea=
sons, is there something specific I should forward to them, either as a que=
stion or as a request for a fix?</div><div><br></div><div>As someone who ha=
sn&#39;t built a kernel in over a decade, should I figure out how to do a k=
ernel build with CONFIG_PHYSICAL_START=3D0x2000000 and report back?<br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
It remains to be seen in how far it is reasonably possible to work<br>
around this in the kernel. While (sadly) still unsupported, in the<br>
meantime you may want to consider running Dom0 in PVH mode.<br></blockquote=
><div><br></div><div>I tried this by adding dom0=3Dpvh, and instead got thi=
s boot error:<br></div><div><br></div><div>(XEN) xenoprof: Initialization f=
ailed. AMD processor family 25 is not supported<br>(XEN) NX (Execute Disabl=
e) protection active<br>(XEN) Dom0 has maximum 1400 PIRQs<br>(XEN) *** Buil=
ding a PVH Dom0 ***<br>(XEN) Failed to load kernel: -1<br>(XEN) Xen dom0 ke=
rnel broken ELF: &lt;NULL&gt;<br>(XEN) Failed to load Dom0 kernel<br>(XEN) =
<br>(XEN) ****************************************<br>(XEN) Panic on CPU 0:=
<br>(XEN) Could not construct domain 0<br>(XEN) ***************************=
*************<br>(XEN) <br>(XEN) Reboot in five seconds...</div><div><br></=
div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Jan<br>
</blockquote></div></div>

--0000000000007407da060f1e2218--

