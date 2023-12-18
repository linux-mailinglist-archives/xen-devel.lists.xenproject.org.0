Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9E817817
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656286.1024382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH2W-0000q3-Da; Mon, 18 Dec 2023 17:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656286.1024382; Mon, 18 Dec 2023 17:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH2W-0000np-AH; Mon, 18 Dec 2023 17:04:24 +0000
Received: by outflank-mailman (input) for mailman id 656286;
 Mon, 18 Dec 2023 17:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=av2Q=H5=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rFH2U-0008KY-I3
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:04:22 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8f6a2d-9dc7-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 18:04:21 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ceb2501f1bso3092508b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:04:21 -0800 (PST)
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
X-Inumbo-ID: 7c8f6a2d-9dc7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702919060; x=1703523860; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o5J2BkPYCS9Tj3jNQgPrBfAfxlhHW2JowfCvo6TYts8=;
        b=YUjlcrwkHyGC2z3kzHP61wq/Jap2wVRFrqWhiY5fP4UauKBcW9VbW4C8Fv5nbLVhzT
         hKOcmkK4oYjXkaG3wzL2pWnpFvXJB3V7tkvA1bDO0/dFZ4y2OzNzIINhprWzLRPnLuBH
         16ra9hCz3jOztULVf8EntZ8gKTID98fQuRWO0mevx00VVEnMQc3rRmYl4pePOyvs8HPQ
         cXfiCqorQks5kLmlq/5IkTr7Vs50Ym1Zy3hHREJcPGJTIAJBFbsolaVtWdbJA8hJH2Je
         RcMoofsBejLVo9uxqHh0UfcRc98DgdZ5cMKOdfCJ6B8tnElAqGOzz6g+rEpqdg7d+x6j
         Qyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919060; x=1703523860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5J2BkPYCS9Tj3jNQgPrBfAfxlhHW2JowfCvo6TYts8=;
        b=N6pvByx/CxnIyLTJOjqPkgSN9PbeLq5cezQmdgl0MMJE5sVNYxHckERXdxZpc4V6BW
         dqZvjXRE33QN/z2Zkqp7R3ddWiGbdDibbpqHykbIFResRPWGERBW7VwQ7PP01rQ+cUt+
         mckCpDXzsHf0iw+UOISI/YyMIDrcJqNolwCpZuD3UnDubhdmgVPnPIxHkFkCkJH3wPuG
         zyWamWT+KNGwIV/YwUTEdSnExXStTF12YPHGaMdODn9zDvgHiGcoQ65Gy2smoxO794xj
         yeH52XP6Lvpir0Myy48Vs/XCAbupCCsICMf8iDOxkC/hAYV99f/16Xj3Xqz87EOU7lgc
         dRVA==
X-Gm-Message-State: AOJu0YzKBf7i7/A37XBDdMlQwzJYLrQo+CJarNR+PS4Ch4Hf/stklkyf
	B9gLRi2h8FeAuyUJP9/7xFaFa0X0zQTfUhp957l8SAFidHo=
X-Google-Smtp-Source: AGHT+IENd4LOCEde99KU5WQ2XtKhymjZnYZCk3gnbPBqnmQ6pjqs5R2rW9gpAsQqoI1+fmZOaiOuPSKipo13PmJxcf0=
X-Received: by 2002:a05:6a20:e117:b0:194:87fc:cd56 with SMTP id
 kr23-20020a056a20e11700b0019487fccd56mr749027pzb.105.1702919060145; Mon, 18
 Dec 2023 09:04:20 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
 <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
 <CAKm-UmbaHoXymP8CcBVBLSVG7T9zCE2fbFQB33SMnY8pwXOU1Q@mail.gmail.com>
 <435d159f-96d5-49af-82ec-bce6961e3391@suse.com> <CAKm-UmbEBOm525=f+OOL0P05tQVVQz9wegh7F8yhgV_=Z7rWug@mail.gmail.com>
 <CAKm-UmYejm8CW-Enc_Y-aefcLPsRhQO8w2P-fNdu1zXMMjUAoA@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com> <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <3aeb708d-a4fa-45b5-9d74-260ef2035b4a@suse.com>
In-Reply-To: <3aeb708d-a4fa-45b5-9d74-260ef2035b4a@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 18 Dec 2023 18:04:09 +0100
Message-ID: <CAKm-UmbFkO5RCDMTEgWBtEYtfO_LH=TKTh5TP=FyFFpdnbto4w@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a94910060ccbbd56"

--000000000000a94910060ccbbd56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 18 d=C3=A9c. 2023, 17:44, Jan Beulich <jbeulich@suse.com> a =C3=A9c=
rit :

> On 18.12.2023 17:21, S=C3=A9bastien Chaumat wrote:
> >>>>> On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:
> >>> This issue seems that IRQ 7 (the GPIO controller) is natively fasteoi
> >>> (so level type) while in xen it  is mapped to oapic-edge  instead of
> >>> oapic-level
> >>> as the SSDT indicates :
> >>>
> >>>  Device (GPIO)
> >>>
> >>>      {
> >>>          Name (_HID, "AMDI0030")  // _HID: Hardware ID
> >>>          Name (_CID, "AMDI0030")  // _CID: Compatible ID
> >>>          Name (_UID, Zero)  // _UID: Unique ID
> >>>          Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource
> Settings
> >>>          {
> >>>              Name (RBUF, ResourceTemplate ()
> >>>              {
> >>>                  Interrupt (ResourceConsumer, Level, ActiveLow,
> Shared, ,, )
> >>>                  {
> >>>                      0x00000007,
> >>>            }
> >>> Any idea why ?
> >>
> >> Information coming from AML is required to be handed down by Dom0 to
> Xen.
> >> May want checking that (a) Dom0 properly does so and (b) Xen doesn't
> screw
> >> up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if this i=
s
> >> specific to it being IRQ7 which GPIO uses, as at the (master) PIC IRQ7
> is
> >> also the spurious vector. You may want to retry with the tip of the 4.=
17
> >> branch (soon to become 4.17.3) - while it doesn't look very likely to =
me
> >> that recent backports there were related, it may still be that they ma=
ke
> >> a difference.
> >>
> >
> > testing with 4.17.3:
> >
> > Adding some printk in PHYSDEVOP_setup_gsi, I  see (in xl dmesg)  that
> > (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: 1
> >
> > but later on in dmesg I see :
> > [    1.747958] xen: registering gsi 7 triggering 0 polarity 1
> >
> > So triggering is flipped from 1 to 0 (cannot find the definition for
> > those values).
> > Could this be the culprit ?
>
> Possibly. Since it would be the kernel to invoke PHYSDEVOP_setup_gsi, it
> looks as if the kernel was confused about which trigger mode to use. Have
> you figured from where the kernel takes the two different values?
>

> Would you mind pointing me to the definition for those values first ? I
did not find what 0/1 means in this context.

Thanks

--000000000000a94910060ccbbd56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le lun. 18 d=C3=A9c. 2023, 17:44, Jan Beulich &lt;<a h=
ref=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On 18.12.2023 17:21, S=C3=A9ba=
stien Chaumat wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 05.12.2023 21:31, S=C3=A9bastien Chaumat wrote:<br>
&gt;&gt;&gt; This issue seems that IRQ 7 (the GPIO controller) is natively =
fasteoi<br>
&gt;&gt;&gt; (so level type) while in xen it=C2=A0 is mapped to oapic-edge=
=C2=A0 instead of<br>
&gt;&gt;&gt; oapic-level<br>
&gt;&gt;&gt; as the SSDT indicates :<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 Device (GPIO)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (_HID, &quot;AMDI0030&q=
uot;)=C2=A0 // _HID: Hardware ID<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (_CID, &quot;AMDI0030&q=
uot;)=C2=A0 // _CID: Compatible ID<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (_UID, Zero)=C2=A0 // _=
UID: Unique ID<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Method (_CRS, 0, NotSerializ=
ed)=C2=A0 // _CRS: Current Resource Settings<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Name (RBUF, Re=
sourceTemplate ()<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x00000007,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; Any idea why ?<br>
&gt;&gt;<br>
&gt;&gt; Information coming from AML is required to be handed down by Dom0 =
to Xen.<br>
&gt;&gt; May want checking that (a) Dom0 properly does so and (b) Xen doesn=
&#39;t screw<br>
&gt;&gt; up in consuming that data. See PHYSDEVOP_setup_gsi. I wonder if th=
is is<br>
&gt;&gt; specific to it being IRQ7 which GPIO uses, as at the (master) PIC =
IRQ7 is<br>
&gt;&gt; also the spurious vector. You may want to retry with the tip of th=
e 4.17<br>
&gt;&gt; branch (soon to become 4.17.3) - while it doesn&#39;t look very li=
kely to me<br>
&gt;&gt; that recent backports there were related, it may still be that the=
y make<br>
&gt;&gt; a difference.<br>
&gt;&gt;<br>
&gt; <br>
&gt; testing with 4.17.3:<br>
&gt; <br>
&gt; Adding some printk in PHYSDEVOP_setup_gsi, I=C2=A0 see (in xl dmesg)=
=C2=A0 that<br>
&gt; (XEN) PHYSDEVOP_setup_gsi setup_gsi : gsi: 7 triggering: 1 polarity: 1=
<br>
&gt; <br>
&gt; but later on in dmesg I see :<br>
&gt; [=C2=A0 =C2=A0 1.747958] xen: registering gsi 7 triggering 0 polarity =
1<br>
&gt; <br>
&gt; So triggering is flipped from 1 to 0 (cannot find the definition for<b=
r>
&gt; those values).<br>
&gt; Could this be the culprit ?<br>
<br>
Possibly. Since it would be the kernel to invoke PHYSDEVOP_setup_gsi, it<br=
>
looks as if the kernel was confused about which trigger mode to use. Have<b=
r>
you figured from where the kernel takes the two different values?<br></bloc=
kquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"></blockquote></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></di=
v><div dir=3D"auto">Would you mind pointing me to the definition for those =
values first ? I did not find what 0/1 means in this context.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"></blockquote></div></div><div dir=3D"auto">Thanks</div=
></div>

--000000000000a94910060ccbbd56--

