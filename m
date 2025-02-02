Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488CA24EA9
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 15:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880372.1290448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teb1g-0000VF-QJ; Sun, 02 Feb 2025 14:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880372.1290448; Sun, 02 Feb 2025 14:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teb1g-0000SY-Mt; Sun, 02 Feb 2025 14:32:44 +0000
Received: by outflank-mailman (input) for mailman id 880372;
 Sun, 02 Feb 2025 14:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TtP=UZ=gmail.com=thouveng@srs-se1.protection.inumbo.net>)
 id 1teb1f-0000SS-69
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 14:32:43 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e53ef9c-e172-11ef-99a4-01e77a169b0f;
 Sun, 02 Feb 2025 15:32:41 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-29f88004a92so2003516fac.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 06:32:40 -0800 (PST)
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
X-Inumbo-ID: 8e53ef9c-e172-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738506759; x=1739111559; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kcgYUxWIdN1YYjYkqm50dtEfNs0UeQl9JAGAYSSgupY=;
        b=W4+iIj5FiVzcXmMhJ4iQcY2y6mM9GG9US84TX75p5a2D1iEc6TMbO+xZ3Ysrjf6rMH
         1TwNNKkYDByn8oZHByqYmNmkgylQ+Qvkoe/Aw/4dt2QZdT8wr1A9GVcc5gVNcSDdW9Bz
         Xkw72nITnJJvI3fV4vJOftR9mADuPG5T1xlbnpOjb63203z8DOi8eqHUP9AmkQ+LJlC5
         0KGnKbAzoJhiMU8xr33cd7EzilM1bVPxxXRPsjMPu59Bl2AyBPTmf7soX+KvsUeRaa3c
         TYLrXiYHecx4j+WrkRMMfPDyLz63qZGXf9GLQpXZyZZujYe84fS41w/gmVJca3CFrY2R
         qBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738506759; x=1739111559;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcgYUxWIdN1YYjYkqm50dtEfNs0UeQl9JAGAYSSgupY=;
        b=qLxv1lcuD2svEcaVczmsyaEfwu/+IGbQ0pJWA0ia9+pUiNGk8Tu/VoYAoZD9UTY+84
         K24qYlH4+4WP8A3OM5krRPNz8mifnnAAxdQKJTp45NkhSYRtzKuffc/X7/A4yUug8sbT
         jgDlXzuJHu5JUoFyv1h2pA50KyiOcgdnuTUBEdbH2CB/I7u5cQ3vKUAFVACRPc6wrnKM
         yftKmXFdafA04u5v9mKoVk+uApC4iXgEQOQYt/kDB1zb4sATMAzfxGeunf64eNS56X0f
         T+qH2nrViB7xityef+lRuKkuTwG1mM0DmnkW2NypehPZMtz2TMHdJ6JpACqCnmWQ0GrL
         uNmQ==
X-Gm-Message-State: AOJu0Yw7m+UOAQEMBwaVlE1RKX70pQexluLkPH8sJsuvi+n13tD3r4mS
	VHz7w3yB8v+k73czsI3VibPMvlJlVqiM/IFkkLp3XmlitMEswdsJqp86Lz2tN4VRgdzH994HPgT
	tsGReamZp6+2QTNyHXhEFTQuCl8sq4srC
X-Gm-Gg: ASbGncvMiPTPfAFMBM2URfIfTq6fq75XkiMIZY7h1AkcLs1V2+kGsoPX104ywkp/FKf
	SdTETleAiDGk6AdYaX4Zk/RceAlvh9lqR/YF9E0VSy0poZAQTo6kbzSosj2Ms3T1zbITmKd1MyA
	==
X-Google-Smtp-Source: AGHT+IHPLXuHPkIlNF/nmnTLoHFMsKlG6R3ImESUBrJA6SaLCVxSTO/X5r9OxcYQgNjg6IfhwdZXHT7W0iqR0SWehhk=
X-Received: by 2002:a05:6870:ecac:b0:29e:5e83:150e with SMTP id
 586e51a60fabf-2b32f2926bfmr12053991fac.27.1738506759438; Sun, 02 Feb 2025
 06:32:39 -0800 (PST)
MIME-Version: 1.0
From: Guillaume <thouveng@gmail.com>
Date: Sun, 2 Feb 2025 15:32:03 +0100
X-Gm-Features: AWEUYZnGfc9bI9ljdSGnO_tzlBSMDceljRTElW2V_yzSwIREjY2X3_QCUekU6lo
Message-ID: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
Subject: Xen panic due to xstate mismatch
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d60ecd062d29a59c"

--000000000000d60ecd062d29a59c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

 I'd like to report an issue I encountered when building Xen from source.
To give you some context, During the Xen winter meetup in Grenoble few days
ago, there was a discussion about strengthening collaboration between Xen
and academia. One issue raised by a professor was that Xen is harder for
students to install and experiment compared to KVM. In response it was
mentionned that Debian packages are quite decent. This motivated me to try
installing and playing with Xen myself. While I am familiar with Xen (I
work on the XAPI toolstack at Vates) I'm not deeply familiar with its
internals, so this seemed like a good learning opportunity and maybe some
contents for some blog posts :).

 I set up a Debian testing VM on Virtualbox and installed Xen from
packages. Everything worked fine: Grub was updated, I rebooted, and I had a
functional Xen setup with xl running in Dom0.
 Next I download the last version of Xen from xenbits.org, and built only
the hypervisor (no tools, no stubdom) , using the same configuration as the
Debian package (which is for Xen 4.19). After updating GRUB and rebooting,
Xen failed to boot. Fortunately, I was able to capture the following error
via `ttyS0`:
```
(XEN) [0000000d2c23739a] xstate: size: 0x340 and states: 0x7
(XEN) [0000000d2c509c1d]
(XEN) [0000000d2c641ffa] ****************************************
(XEN) [0000000d2c948e3b] Panic on CPU 0:
(XEN) [0000000d2cb349bb] XSTATE 0x0000000000000003, uncompressed hw size
0x340 !=3D xen size 0x240
(XEN) [0000000d2cfc5786] ****************************************
(XEN) [0000000d2d308c24]
```
From my understanding, the hardware xstate size (`hw_size`) represents the
maximum memory required for the `XSAVE/XRSTOR` save area, while `xen_size`
is computed by summing the space required for the enabled features. In `xen=
/
arch/x86/xstate.c`, if these sizes do not match, Xen panics. However,
wouldn=E2=80=99t it be correct for `xen_size` to be **less than or equal to=
**
`hw_size` instead of exactly matching?

I tested the following change:
```
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -710,7 +710,7 @@ static void __init check_new_xstate(struct xcheck_state
*s, uint64_t new)
      */
     xen_size =3D xstate_uncompressed_size(s->states & X86_XCR0_STATES);

-    if ( xen_size !=3D hw_size )
+    if ( xen_size > hw_size )
         panic("XSTATE 0x%016"PRIx64", uncompressed hw size %#x !=3D xen si=
ze
%#x\n",
               s->states, hw_size, xen_size);
```
With this change, Xen boots correctly, but I may be missing some side
effects...
Additionally, I am confused as to why this issue does *not* occur with the
default Debian Xen package. Even when I rebuild Xen *4.19.1* from source
(the same version as the package), I still encounter the issue.
So I have two questions:
- Is my understanding correct that xen_size <=3D hw_size should be allowed?
- Are there any potential side effects of this change?
- Bonus: Have some of you any explanations about why does the issue not
occur with the packaged version of Xen but does with a self-built version?

Hope I wasn't too long and thanks for taking the time to read this,
Best regards,

Guillaume

--000000000000d60ecd062d29a59c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><div><div><div><div><div><=
div><div><div>Hello,<br><br></div>=C2=A0I&#39;d like to report an issue I e=
ncountered when building Xen from source. To give you some context, During =
the Xen winter meetup in Grenoble few days ago, there was a discussion abou=
t strengthening collaboration between Xen and academia. One issue raised by=
 a professor was that Xen is harder for students to install and experiment =
compared to KVM. In response it was mentionned that Debian packages are qui=
te decent. This motivated me to try installing and playing with Xen myself.=
 While I am familiar with Xen (I work on the XAPI toolstack at Vates) I&#39=
;m not deeply familiar with its internals, so this seemed like a good learn=
ing opportunity and maybe some contents for some blog posts :).<br><br></di=
v>=C2=A0I set up a Debian testing VM on Virtualbox and installed Xen from p=
ackages. Everything worked fine: Grub was updated, I rebooted, and I had a =
functional Xen setup with xl running in Dom0.<br></div>=C2=A0Next I downloa=
d the last version of Xen from <a href=3D"http://xenbits.org" target=3D"_bl=
ank">xenbits.org</a>,<span class=3D"gmail-hljs-keyword"> and</span> built <=
span class=3D"gmail-hljs-keyword">only</span> the hypervisor (no tools, no =
stubdom) , <span class=3D"gmail-hljs-keyword">using</span> the same <span c=
lass=3D"gmail-hljs-keyword">configuration</span> <span class=3D"gmail-hljs-=
keyword">as</span> the Debian package (which <span class=3D"gmail-hljs-keyw=
ord">is</span> <span class=3D"gmail-hljs-keyword">for</span> Xen <span clas=
s=3D"gmail-hljs-number">4.19</span>). <span class=3D"gmail-hljs-keyword">Af=
ter</span> updating GRUB <span class=3D"gmail-hljs-keyword">and</span> rebo=
oting, Xen failed <span class=3D"gmail-hljs-keyword">to</span> boot. Fortun=
ately, I was able <span class=3D"gmail-hljs-keyword">to</span> capture the =
<span class=3D"gmail-hljs-keyword">following</span> error via `ttyS0`:</div=
>```<br>(XEN) [0000000d2c23739a] xstate: size: 0x340 and states: 0x7<br>(XE=
N) [0000000d2c509c1d]<br>(XEN) [0000000d2c641ffa] *************************=
***************<br>(XEN) [0000000d2c948e3b] Panic on CPU 0:<br>(XEN) [00000=
00d2cb349bb] XSTATE 0x0000000000000003, uncompressed hw size 0x340 !=3D xen=
 size 0x240<br>(XEN) [0000000d2cfc5786] ***********************************=
*****<br>(XEN) [0000000d2d308c24]<br>```<br><span class=3D"gmail-hljs-type"=
>From</span> my understanding, the hardware xstate size (`hw_size`) represe=
nts the maximum memory <span class=3D"gmail-hljs-keyword">required</span> <=
span class=3D"gmail-hljs-keyword">for</span> the `<span class=3D"gmail-hljs=
-type">XSAVE</span><span class=3D"gmail-hljs-regexp">/XRSTOR` save area, wh=
ile `xen_size` is computed by summing the space required for the enabled fe=
atures. In `xen/</span>arch<span class=3D"gmail-hljs-regexp">/x86/</span>xs=
tate.c`, <span class=3D"gmail-hljs-keyword">if</span> these sizes <span cla=
ss=3D"gmail-hljs-keyword">do</span> not match, <span class=3D"gmail-hljs-ty=
pe">Xen</span> panics. <span class=3D"gmail-hljs-type">However</span>, woul=
dn=E2=80=99t it be correct <span class=3D"gmail-hljs-keyword">for</span> `x=
en_size` to be <span class=3D"gmail-hljs-operator">**</span>less than or eq=
ual to<span class=3D"gmail-hljs-operator">**</span> `hw_size` instead of ex=
actly matching<span class=3D"gmail-hljs-operator">?<br><br></span></div>I t=
ested the following change:</div>```<br>--- a/xen/arch/x86/xstate.c<br>+++ =
b/xen/arch/x86/xstate.c<br>@@ -710,7 +710,7 @@ static void __init check_new=
_xstate(struct xcheck_state *s, uint64_t new)<br>=C2=A0 =C2=A0 =C2=A0 */<br=
>=C2=A0 =C2=A0 =C2=A0xen_size =3D xstate_uncompressed_size(s-&gt;states &am=
p; X86_XCR0_STATES);<br><br>- =C2=A0 =C2=A0if ( xen_size !=3D hw_size )<br>=
+ =C2=A0 =C2=A0if ( xen_size &gt; hw_size )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0panic(&quot;XSTATE 0x%016&quot;PRIx64&quot;, uncompressed hw size %#x=
 !=3D xen size %#x\n&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0s-&gt;states, hw_size, xen_size);<br>```<br></div>With this ch=
ange, Xen boots correctly, but I may be missing some side effects...<br> Ad=
ditionally, I am confused as to why this issue does <strong>not</strong> oc=
cur with the default Debian Xen package. Even when I rebuild Xen <strong>4.=
19.1</strong> from source (the same version as the package), I still encoun=
ter the issue.<br></div><div>So I have two questions:<br>- Is my understand=
ing correct that <code>xen_size &lt;=3D hw_size</code> should be allowed?<b=
r>- Are there any potential side effects of this change?<br></div><div>- Bo=
nus: Have some of you any explanations about why does the issue not occur w=
ith the packaged version of Xen but does with a self-built version?</div><b=
r></div>Hope I wasn&#39;t too long and thanks for taking the time to read t=
his,<br></div>Best regards,<br></div><br>Guillaume<br></div>
</div>

--000000000000d60ecd062d29a59c--

