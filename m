Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CB12B43B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 12:31:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iknmu-0000BG-4x; Fri, 27 Dec 2019 11:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pcAO=2R=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iknms-0000BB-Bn
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 11:28:10 +0000
X-Inumbo-ID: f58a958a-289b-11ea-a914-bc764e2007e4
Received: from mail-vk1-xa42.google.com (unknown [2607:f8b0:4864:20::a42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f58a958a-289b-11ea-a914-bc764e2007e4;
 Fri, 27 Dec 2019 11:28:09 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id o187so6734014vka.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2019 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V67AKSk1qV7zjrYnny6ze80114ygAXWr1qZIe2ci2Ek=;
 b=FIo8ENow6CWMiazVVfcvEH1bwFFOG2ceSVxuWszOIoev6GSsFB8bflDFIPlRp51mrq
 IrwLew/RzYQlUlQpJzYdBexBGjWvZ50kXq6wQDUgw9RI6KnI59bjmIoGi06/Iqm25GkB
 ZWdLUbzWj79n7X9vyNIBm9QvViGfAGNUPYlF+L0UC8h8Lf4k/zscVfsjAKwEkpppl07n
 e40rTwOcDqqcCxsp4b3EB4wx+0tIqKGQRKYN4CRog5H2RUPrYVfsIRHh4bwdrNPEm8Fn
 FvL97W8+zR6sbHfHpVyMgv4Vi1+a8KqeZT3Q6/VsLPI+a+zkbrcQaW7MDpBwvgqLKxPJ
 PP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V67AKSk1qV7zjrYnny6ze80114ygAXWr1qZIe2ci2Ek=;
 b=W1Eh8ouCaxGl8zZuGbyCWLFZfuo5p1+cDOC7WvgJjayzo9LOcl7hb57KEv7tblCtN7
 VOtUCgCUCoVWo8whazYk21DIgjjBDjCmhmGOcfpmH7Hz4+TPkAfKugnSADsusLqg7F6F
 uym75EOVZS/FyTPdn83ewRt9lBNyzkDbmv8xZJ7S89rVm79eeXXAWcdWcm/qY8bbG2pQ
 uXAyZZV8PwIIahpfC//wIHoUS59+sJKJsmsCS+YpT5Z+p9ObjspgFc10JaGrsvyV/tnq
 dtvYhXdWR8ea66zsRFQOmldcrkF/bGTLA8uItrf0KzWmhnmF3iw9tsfgoJqdrClILrBW
 aRzA==
X-Gm-Message-State: APjAAAWgzHlhgxExGp2IKgajxc89znTZNzjTCxr+S/Ib6XPtEA9mVLoz
 65aHBAFKSjUh4OsDxH9jbm9YLpn7Lt7PTgYtL5g=
X-Google-Smtp-Source: APXvYqzW50E1EyxD0XoE4KPxN3fSKyypVz2me9Wp2A1oK0/CuxVV1hDHz9JuBxkNlYwKY6eUOfVYQuokkcSFx4m+3rk=
X-Received: by 2002:a1f:8d57:: with SMTP id p84mr24980963vkd.65.1577446089009; 
 Fri, 27 Dec 2019 03:28:09 -0800 (PST)
MIME-Version: 1.0
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
In-Reply-To: <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 27 Dec 2019 12:27:57 +0100
Message-ID: <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0867775914773812914=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0867775914773812914==
Content-Type: multipart/alternative; boundary="000000000000c9b0e3059aadc9c3"

--000000000000c9b0e3059aadc9c3
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Fri, 27 Dec 2019, 09:22 Jan Beulich, <JBeulich@suse.com> wrote:

> On 23.12.2019 18:33, Julien Grall wrote:
> > Hi Jan,
> >
> > On 20/12/2019 14:55, Jan Beulich wrote:
> >> There's been effectively no use of the field for HVM.
> >>
> >> Also shrink the field to unsigned int, even if this doesn't immediately
> >> yield any space benefit for the structure itself. The resulting 32-bit
> >> padding slot can eventually be used for some other field. The change in
> >> size makes accesses slightly more efficient though, as no REX.W prefix
> >> is going to be needed anymore on the respective insns.
> >>
> >> Mirror the HVM side change here (dropping of setting the field to
> >> VGCF_online) also to Arm, on the assumption that it was cloned like
> >> this originally. VGCF_online really should simply and consistently be
> >> the guest view of the inverse of VPF_down, and hence needs representing
> >> only in the get/set vCPU context interfaces.
> >
> > But vPSCI is just a wrapper to get/set vCPU context interfaces. Your
> > changes below will clearly break bring-up of secondary vCPUs on Arm.
> >
> > This is because arch_set_guest_info() will rely on this flag to
> > clear/set VPF_down in the pause flags.
> >
> > So I think the line in arm/vpsci.c should be left alone.
>
> Oh, I see - I didn't notice this (ab)use despite ...
>

Out of Interest, why do you think it is an abuse here and not in the
toolstack?

How do you suggest to improve it? I can add it in my improvement list for
Arm.

Cheers,

-- 
Julien Grall

--000000000000c9b0e3059aadc9c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Jan,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 27 Dec 2019, 09:22 Jan Beulich, &lt;<=
a href=3D"mailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 23.12.2019 18:33, Julien Grall wrote:<=
br>
&gt; Hi Jan,<br>
&gt; <br>
&gt; On 20/12/2019 14:55, Jan Beulich wrote:<br>
&gt;&gt; There&#39;s been effectively no use of the field for HVM.<br>
&gt;&gt;<br>
&gt;&gt; Also shrink the field to unsigned int, even if this doesn&#39;t im=
mediately<br>
&gt;&gt; yield any space benefit for the structure itself. The resulting 32=
-bit<br>
&gt;&gt; padding slot can eventually be used for some other field. The chan=
ge in<br>
&gt;&gt; size makes accesses slightly more efficient though, as no REX.W pr=
efix<br>
&gt;&gt; is going to be needed anymore on the respective insns.<br>
&gt;&gt;<br>
&gt;&gt; Mirror the HVM side change here (dropping of setting the field to<=
br>
&gt;&gt; VGCF_online) also to Arm, on the assumption that it was cloned lik=
e<br>
&gt;&gt; this originally. VGCF_online really should simply and consistently=
 be<br>
&gt;&gt; the guest view of the inverse of VPF_down, and hence needs represe=
nting<br>
&gt;&gt; only in the get/set vCPU context interfaces.<br>
&gt; <br>
&gt; But vPSCI is just a wrapper to get/set vCPU context interfaces. Your <=
br>
&gt; changes below will clearly break bring-up of secondary vCPUs on Arm.<b=
r>
&gt; <br>
&gt; This is because arch_set_guest_info() will rely on this flag to <br>
&gt; clear/set VPF_down in the pause flags.<br>
&gt; <br>
&gt; So I think the line in arm/vpsci.c should be left alone.<br>
<br>
Oh, I see - I didn&#39;t notice this (ab)use despite ...<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Out of Interest, wh=
y do you think it is an abuse here and not in the toolstack?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">How do you suggest to improve it? I c=
an add it in my improvement list for Arm.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">--=C2=A0</div><div dir=3D"auto">Julien Grall</div></div>

--000000000000c9b0e3059aadc9c3--


--===============0867775914773812914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0867775914773812914==--

