Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7797A24ED3
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 16:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880394.1290468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tebxD-0008Vy-Ac; Sun, 02 Feb 2025 15:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880394.1290468; Sun, 02 Feb 2025 15:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tebxD-0008TM-7E; Sun, 02 Feb 2025 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 880394;
 Sun, 02 Feb 2025 15:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tebxC-0008TG-2L
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 15:32:10 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe101e7-e17a-11ef-99a4-01e77a169b0f;
 Sun, 02 Feb 2025 16:32:07 +0100 (CET)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6dd43b08674so29010596d6.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 07:32:06 -0800 (PST)
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
X-Inumbo-ID: dbe101e7-e17a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738510326; x=1739115126; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/v6eEeK689UNzpaNfNa0t5jJKZcGabg9xdake4VlJWk=;
        b=K7h/ZIwPxBx2LgWgQqz/bcf/GlgBXjBB2GKvcwFjYOcA/Ncs57jTqXtVsShQ+zaToW
         Kr+XsxtOTQobl7DLczftZj4jXRV6nU8KQlhPuvyMuENp5JXxSGnvpECDMZvbXK9GfMUE
         bd16pul8AJIA13YPJjU8DK2aXxwU7WH9XIJy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738510326; x=1739115126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v6eEeK689UNzpaNfNa0t5jJKZcGabg9xdake4VlJWk=;
        b=XOh2iRV6+UXcvqv5vjKsEIIv2o0hIQkGZMKCr1gJsRQ+jPvh9KpIPeO3/h6xrtSmoo
         jtRz4P/LbDlfG8ZWXtTwUP+p3i/MFNyrJbEva+f2Si/DfzZSt2aS4kkB4SDKuYWGDLFd
         C6LYGrVnT/RucMNuGZuUUsCZM/XXA3Md6c4cxD5W3m2sENttAczlokxwMbzzqL5kZjgQ
         AocOl5Dhjo/thHWMf12Y1QSYQaNaLoBk/CCZN2I7plwEcbc10d8tP+764D0HltQnRvjQ
         3LRbIGdgRKgPI/8UrlAHhcWMEcj0/itH8U+syplwu0xCX0Cze7KmxtTjTP9+4xWZH3m/
         f82w==
X-Gm-Message-State: AOJu0Yzsl3bjgEp0SFBRZnf6ZZtQ72ZhWwiC6Tm215+9btDoqWnn6jcl
	/IIWIyVriglFIiIlxvHKFSfQXi8vAtP7XiM2crBmtSfCTc0ex50jlhk5Z4eHC24mnt/pZgwGyLw
	Q3gZmxDI/lm/RYWY3GfwlvbHUzC9qIULveZHtaog6zAKd8/gzr+I=
X-Gm-Gg: ASbGncuB+VawOTmbjX46GFea77gjUR+LTbGxDnBNmgEZjz/n6BfKnbdxO7vjOAPutcP
	0XtxD+gBEyLq2pZMDisWdsk86TNhqcGwewPB5Nw3pLKHr9IkJ92cpJNvBC53x5xYwTEtq3r8T
X-Google-Smtp-Source: AGHT+IEER8sV53m604i1+QziGjaGejXRAfEaWbPdbPjlruEiiZmGtXfKMIa3pHs1oLfDjByv7t2W8tQdBmhPQKdFV/0=
X-Received: by 2002:a05:6214:4011:b0:6e1:fe0c:8ce9 with SMTP id
 6a1803df08f44-6e243bef8e1mr271144876d6.3.1738510325556; Sun, 02 Feb 2025
 07:32:05 -0800 (PST)
MIME-Version: 1.0
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
In-Reply-To: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Sun, 2 Feb 2025 16:31:57 +0100
X-Gm-Features: AWEUYZmDxtWsBVdd6TTHvsVuGze5RwUI1gHPCEMPa5J1XWN3S1IZv5vM0Ba-F64
Message-ID: <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
Subject: Re: Xen panic due to xstate mismatch
To: Guillaume <thouveng@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000064c12e062d2a7a02"

--00000000000064c12e062d2a7a02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a sanity check that an algorithm in Xen matches hardware.  It is
only compiled into debug builds by default.

Given that you're running under virtualbox, i have a suspicion as to what's
wrong.

Can you collect the full `xen-cpuid -p` output from within your
environment?  I don't believe you're suggested code change is correct, but
it will good enough to get these diagnostics.

~Andrew

On Sun, 2 Feb 2025, 15:32 Guillaume, <thouveng@gmail.com> wrote:

> Hello,
>
>  I'd like to report an issue I encountered when building Xen from source.
> To give you some context, During the Xen winter meetup in Grenoble few da=
ys
> ago, there was a discussion about strengthening collaboration between Xen
> and academia. One issue raised by a professor was that Xen is harder for
> students to install and experiment compared to KVM. In response it was
> mentionned that Debian packages are quite decent. This motivated me to tr=
y
> installing and playing with Xen myself. While I am familiar with Xen (I
> work on the XAPI toolstack at Vates) I'm not deeply familiar with its
> internals, so this seemed like a good learning opportunity and maybe some
> contents for some blog posts :).
>
>  I set up a Debian testing VM on Virtualbox and installed Xen from
> packages. Everything worked fine: Grub was updated, I rebooted, and I had=
 a
> functional Xen setup with xl running in Dom0.
>  Next I download the last version of Xen from xenbits.org, and built only
> the hypervisor (no tools, no stubdom) , using the same configuration as
> the Debian package (which is for Xen 4.19). After updating GRUB and
> rebooting, Xen failed to boot. Fortunately, I was able to capture the
> following error via `ttyS0`:
> ```
> (XEN) [0000000d2c23739a] xstate: size: 0x340 and states: 0x7
> (XEN) [0000000d2c509c1d]
> (XEN) [0000000d2c641ffa] ****************************************
> (XEN) [0000000d2c948e3b] Panic on CPU 0:
> (XEN) [0000000d2cb349bb] XSTATE 0x0000000000000003, uncompressed hw size
> 0x340 !=3D xen size 0x240
> (XEN) [0000000d2cfc5786] ****************************************
> (XEN) [0000000d2d308c24]
> ```
> From my understanding, the hardware xstate size (`hw_size`) represents
> the maximum memory required for the `XSAVE/XRSTOR` save area, while
> `xen_size` is computed by summing the space required for the enabled
> features. In `xen/arch/x86/xstate.c`, if these sizes do not match, Xen
> panics. However, wouldn=E2=80=99t it be correct for `xen_size` to be **le=
ss than
> or equal to** `hw_size` instead of exactly matching?
>
> I tested the following change:
> ```
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -710,7 +710,7 @@ static void __init check_new_xstate(struct
> xcheck_state *s, uint64_t new)
>       */
>      xen_size =3D xstate_uncompressed_size(s->states & X86_XCR0_STATES);
>
> -    if ( xen_size !=3D hw_size )
> +    if ( xen_size > hw_size )
>          panic("XSTATE 0x%016"PRIx64", uncompressed hw size %#x !=3D xen
> size %#x\n",
>                s->states, hw_size, xen_size);
> ```
> With this change, Xen boots correctly, but I may be missing some side
> effects...
> Additionally, I am confused as to why this issue does *not* occur with
> the default Debian Xen package. Even when I rebuild Xen *4.19.1* from
> source (the same version as the package), I still encounter the issue.
> So I have two questions:
> - Is my understanding correct that xen_size <=3D hw_size should be allowe=
d?
> - Are there any potential side effects of this change?
> - Bonus: Have some of you any explanations about why does the issue not
> occur with the packaged version of Xen but does with a self-built version=
?
>
> Hope I wasn't too long and thanks for taking the time to read this,
> Best regards,
>
> Guillaume
>

--00000000000064c12e062d2a7a02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is a sanity check that an algorithm in Xen matches h=
ardware.=C2=A0 It is only compiled into debug builds by default.=C2=A0<div =
dir=3D"auto"><br></div><div dir=3D"auto">Given that you&#39;re running unde=
r virtualbox, i have a suspicion as to what&#39;s wrong.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Can you collect the full `xen-cpuid -p` ou=
tput from within your environment?=C2=A0 I don&#39;t believe you&#39;re sug=
gested code change is correct, but it will good enough to get these diagnos=
tics.</div><div dir=3D"auto"><br></div><div dir=3D"auto">~Andrew</div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, 2 Feb 2025, 15:32 Guillaume, &lt;<a href=3D"mailto=
:thouveng@gmail.com">thouveng@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><div><=
div><div><div><div><div><div><div>Hello,<br><br></div>=C2=A0I&#39;d like to=
 report an issue I encountered when building Xen from source. To give you s=
ome context, During the Xen winter meetup in Grenoble few days ago, there w=
as a discussion about strengthening collaboration between Xen and academia.=
 One issue raised by a professor was that Xen is harder for students to ins=
tall and experiment compared to KVM. In response it was mentionned that Deb=
ian packages are quite decent. This motivated me to try installing and play=
ing with Xen myself. While I am familiar with Xen (I work on the XAPI tools=
tack at Vates) I&#39;m not deeply familiar with its internals, so this seem=
ed like a good learning opportunity and maybe some contents for some blog p=
osts :).<br><br></div>=C2=A0I set up a Debian testing VM on Virtualbox and =
installed Xen from packages. Everything worked fine: Grub was updated, I re=
booted, and I had a functional Xen setup with xl running in Dom0.<br></div>=
=C2=A0Next I download the last version of Xen from <a href=3D"http://xenbit=
s.org" target=3D"_blank" rel=3D"noreferrer">xenbits.org</a>,<span> and</spa=
n> built <span>only</span> the hypervisor (no tools, no stubdom) , <span>us=
ing</span> the same <span>configuration</span> <span>as</span> the Debian p=
ackage (which <span>is</span> <span>for</span> Xen <span>4.19</span>). <spa=
n>After</span> updating GRUB <span>and</span> rebooting, Xen failed <span>t=
o</span> boot. Fortunately, I was able <span>to</span> capture the <span>fo=
llowing</span> error via `ttyS0`:</div>```<br>(XEN) [0000000d2c23739a] xsta=
te: size: 0x340 and states: 0x7<br>(XEN) [0000000d2c509c1d]<br>(XEN) [00000=
00d2c641ffa] ****************************************<br>(XEN) [0000000d2c9=
48e3b] Panic on CPU 0:<br>(XEN) [0000000d2cb349bb] XSTATE 0x000000000000000=
3, uncompressed hw size 0x340 !=3D xen size 0x240<br>(XEN) [0000000d2cfc578=
6] ****************************************<br>(XEN) [0000000d2d308c24]<br>=
```<br><span>From</span> my understanding, the hardware xstate size (`hw_si=
ze`) represents the maximum memory <span>required</span> <span>for</span> t=
he `<span>XSAVE</span><span>/XRSTOR` save area, while `xen_size` is compute=
d by summing the space required for the enabled features. In `xen/</span>ar=
ch<span>/x86/</span>xstate.c`, <span>if</span> these sizes <span>do</span> =
not match, <span>Xen</span> panics. <span>However</span>, wouldn=E2=80=99t =
it be correct <span>for</span> `xen_size` to be <span>**</span>less than or=
 equal to<span>**</span> `hw_size` instead of exactly matching<span>?<br><b=
r></span></div>I tested the following change:</div>```<br>--- a/xen/arch/x8=
6/xstate.c<br>+++ b/xen/arch/x86/xstate.c<br>@@ -710,7 +710,7 @@ static voi=
d __init check_new_xstate(struct xcheck_state *s, uint64_t new)<br>=C2=A0 =
=C2=A0 =C2=A0 */<br>=C2=A0 =C2=A0 =C2=A0xen_size =3D xstate_uncompressed_si=
ze(s-&gt;states &amp; X86_XCR0_STATES);<br><br>- =C2=A0 =C2=A0if ( xen_size=
 !=3D hw_size )<br>+ =C2=A0 =C2=A0if ( xen_size &gt; hw_size )<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0panic(&quot;XSTATE 0x%016&quot;PRIx64&quot;, unc=
ompressed hw size %#x !=3D xen size %#x\n&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;states, hw_size, xen_size);<br>```<=
br></div>With this change, Xen boots correctly, but I may be missing some s=
ide effects...<br> Additionally, I am confused as to why this issue does <s=
trong>not</strong> occur with the default Debian Xen package. Even when I r=
ebuild Xen <strong>4.19.1</strong> from source (the same version as the pac=
kage), I still encounter the issue.<br></div><div>So I have two questions:<=
br>- Is my understanding correct that <code>xen_size &lt;=3D hw_size</code>=
 should be allowed?<br>- Are there any potential side effects of this chang=
e?<br></div><div>- Bonus: Have some of you any explanations about why does =
the issue not occur with the packaged version of Xen but does with a self-b=
uilt version?</div><br></div>Hope I wasn&#39;t too long and thanks for taki=
ng the time to read this,<br></div>Best regards,<br></div><br>Guillaume<br>=
</div>
</div>
</blockquote></div>

--00000000000064c12e062d2a7a02--

