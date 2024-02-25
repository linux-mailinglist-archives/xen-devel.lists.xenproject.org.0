Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C582862A49
	for <lists+xen-devel@lfdr.de>; Sun, 25 Feb 2024 13:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685194.1065584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reDU3-0003UG-1H; Sun, 25 Feb 2024 12:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685194.1065584; Sun, 25 Feb 2024 12:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reDU2-0003RK-Sb; Sun, 25 Feb 2024 12:19:54 +0000
Received: by outflank-mailman (input) for mailman id 685194;
 Sun, 25 Feb 2024 12:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/ns=KC=gmail.com=rob.townley@srs-se1.protection.inumbo.net>)
 id 1reDU1-0003RE-BF
 for xen-devel@lists.xenproject.org; Sun, 25 Feb 2024 12:19:53 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b212630-d3d8-11ee-98f5-efadbce2ee36;
 Sun, 25 Feb 2024 13:19:49 +0100 (CET)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so2294958276.3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Feb 2024 04:19:49 -0800 (PST)
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
X-Inumbo-ID: 2b212630-d3d8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708863588; x=1709468388; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W2E0Tttmj/DoPM7LRU51gbJvIjSSBzxFpbiR1OJL1cw=;
        b=aUdruPgnUd1JQuTeD5R3yKKoao6k4dMN/ke8+SvUgsl/cjYjq6gl9jkqBImSd31o4t
         uRE8MHIwpLYbNuwa4dN251BjzkOo6OoxLzDahEugDbGhdSKjGA+u0mzilgqnb0em5mUZ
         axya7Pm2s2Lig0cKnV7XQnklMDQlwLdFHfuN1mY9exGPNvIlCABCesA1nxfaJYlWjbAV
         sMzkTRBOMDybm3VBrhw6HqDY86f0zJ8gJ+tbqChMAGyANwpD9smrE2xCtqmI/kquWJva
         9vNGyq8dp/Z3/wrNIPam9DTsYIYkkuCqmuWVJOW4dSKVT9ZrVPHN5f/PqEZCzfECef4h
         I8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708863588; x=1709468388;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2E0Tttmj/DoPM7LRU51gbJvIjSSBzxFpbiR1OJL1cw=;
        b=O1hz3rxbC7IKC25GM63f4+YFfDufoFljcPVlQUy7MpuluN/4vQyL6VkysqkyIqJKTR
         SagJ1XKZZwNpBy3EQZxHcIdbnRRpnEev84gRuxPMvnopwndUvKLSh2EzkV3IUw7RZvFP
         eKp6ir5WLkylA/GYXa9/4D73kT9rYwIGv5N0qB2/Yg7KrUD4TWwNiPZxxAmSapp8l2HR
         dd7GQInIRICp43ztMaljAxEdp/SjAchQIJ9WMi25Tnqvb4uQe1Xatgo6vQPRpQF7dp3X
         umvYJw5KiN7PlHx2mrUdCRNBncG6ppAyk6LndVO1xrSDCYNxm5NK2Jjtjm9qd/vRHOKS
         CV0g==
X-Forwarded-Encrypted: i=1; AJvYcCUHM1vyZtlxohCN/am2GjtPiX2VnkPhhNN9szNXJNQNrfqiQP7K8GF/QMUxUd6anchkiBXIb5RBR0mUF2J2k2VZkVKAOJ6H52nd8dvY1yw=
X-Gm-Message-State: AOJu0YxrWCKpgaUv/ucSsF3akEWrpx1ytQo3TRPoXfmvVCl2F5uUK1A3
	HqW6hyiJErbKDLspwIBSsgSFlQhucDKLRyk+nIGYHILNcX4Nzw3YJDg0QBbRpjuS8hfNO0U8sZd
	Aa3ob9RY8xdPu24RRa5jlKL4Wi+8=
X-Google-Smtp-Source: AGHT+IHBpdMueIx32lg1q5sCYr6wtPcOb4aIxsc4Qzt1tdi1kX6fWxBdf8TuGsBcYwQFcJP8bJtT0Nhj9RZhFAmQoVI=
X-Received: by 2002:a25:26c5:0:b0:dc6:18d0:95b0 with SMTP id
 m188-20020a2526c5000000b00dc618d095b0mr2306857ybm.8.1708863587972; Sun, 25
 Feb 2024 04:19:47 -0800 (PST)
MIME-Version: 1.0
References: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com> <bb2485e5-7818-435b-8d9c-dda88100979f@xen.org>
In-Reply-To: <bb2485e5-7818-435b-8d9c-dda88100979f@xen.org>
Reply-To: Rob.Townley@gmail.com
From: Rob Townley <rob.townley@gmail.com>
Date: Sun, 25 Feb 2024 06:19:37 -0600
Message-ID: <CA+VdTb8razTDCZdAssAf=HHbDhV+w8+k-XO+n6msv31izUfQEw@mail.gmail.com>
Subject: Re: IMPORTANT - : Need help on USB port virtualization with Xen hypervisor
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	GOURLOT Francois <francois.gourlot@thalesgroup.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Kelly Choi <kelly.choi@cloud.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000217d27061233cfe1"

--000000000000217d27061233cfe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In short, purchase an addon PCIe USB card to isolate traffic.  USB is a
shared medium and is rooted in the cheapest electronics.   It was never
considered enterprise grade hardware for most all of history.    The letter
B in  USB  stands for BUS which actually means a shared roadway that other
USB devices can and do impede traffic.   We experienced interfering traffic
on inexpensive laptops running  XEN based Qubes-OS.  Turned out the WiFi
card was actually wired onto the USB bus.   Unplugging all external USB
electronics reduced inexplicable WiFi disconnects and reliably improved
throughput.    However, there was no way to remove the keyboard, touchpad,
and touchscreen which all used the USB roadway.

Those were cheap laptops, but even enterprise class hardware such as HPE
 and Dell Servers running XCP-NG did not have great speeds.   But in this
scenario, we could simplify the problem and  isolate the issue by purchasin=
g
a  new add-on PCIe card with USB ports and then assign the entire PCIe card
to the VM.   The VM would then have entire control of the PCIe card and
isolate traffic to devices plugged into that card.

I did not know until later that Wireshark has plugins for sniffing USB
traffic, but my name is  not Heisenberg and not sure if that traffic
monitoring does not also slow down other devices.

On Sat, Feb 24, 2024 at 8:39 AM Julien Grall <julien@xen.org> wrote:

> Hi Dominique and Francois,
>
> Thank you for the report. I am CCing some person who I think could help.
>
> I also have some questions (see below).
>
> On 23/02/2024 16:00, GOURLOT Francois wrote:
> > Dear All,
> >
> > We send you a message few days ago.
> >
> > We have major performance with XEN USB Drivers. We use your driver to
> > load data in a device and we need USB3 High Speed USB protocole
> >
> > Do you have a new issue of the HCI and NEC USB Xen Driver ?
> p
> [...]
>
> > *De :*LARRIEU Dominique <dominique.larrieu@thalesgroup.com>
> > *Envoy=C3=A9 :* jeudi 22 f=C3=A9vrier 2024 13:58
> > *=C3=80 :* xen-devel@lists.xenproject.org
> > *Cc :* WILLEMS Louis <louis.willems@thalesgroup.com>; GRUO Nicolas
> > <nicolas-n.gruo@thalesgroup.com>; GOURLOT Francois
> > <francois.gourlot@thalesgroup.com>; Kelly Choi <kelly.choi@cloud.com>
> > *Objet :* Need help on USB port virtualization with Xen hypervisor
> > *Crit=C3=A8re de diffusion :* Confidentiel
> >
> >     Dear all,
> >
> >     We are detectingseveral issues with USB port virtualization with th=
e
> >     Xen hypervisor.
>
> Just to clarify, you are assigning the PCI USB bus (rather than just the
> USB device) to the guest. Is that correct?
>
> If so...
>
>  >
>  > Do you have a new issue of the HCI and NEC USB Xen Driver ?
>
> ... I am not sure what Xen driver you are talking about. If the USB bus
> is assigned to the guest, then I would expect no specific Xen driver are
> required. Do you have any pointer to the existing one?
>
> >     - We cannot do PCI passthrough of the PCI usb bus on a Windows 10
> >     1607 64-bit virtual machine. The bad result is a Windows blue scree=
n.
> >
> >     - When we use the passthrough functionality on a Windows 21H2
> >     virtual machine, we notice thatthe speed of the USB port is not hig=
h
> >     speed but full speed on a USB 3.0 port
> >
> >     - We notice instabilities when using the nec-usb-xhci driver,  USB
> >     2.0 keys are not recognized by the Windows virtual machine
> >     (incorrect descriptor)
>
> Do you have any logs you could share from the guest OS? Also, would you
> be able to share more details on how you configure the guest? (e.g. xl
> configuration, libvirt...)?
>
> >
> >     We needyour helpto find a solution for these problems.
> >
> >     The Software used are :
>
> Can you share some details of the HW you are using?
>
> >
> >     -Debian 11 version5.10.0-20
> >
> >     -Xen version4.14
>
> Are minor version of Xen 4.14 are you using? Any patches on top?
>
> Xen 4.14 has also been out of support for a few months now. If that's
> possible, I would recommend to try a new Xen version (the last stable is
> 4.18) just in case your issue as been fixed in newer release.
>
> >
> >     -Windows 10 1607 and 21H2 for virtual machines. Virtual Machine HVM
>
> Cheers,
>
> --
> Julien Grall
>
>

--000000000000217d27061233cfe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto" style=3D"font-family:-apple-system=
,helveticaneue;font-size:18px;font-style:normal;font-weight:400;letter-spac=
ing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;text-decoration:none;background-color:rgba(0,0,0,0);border-color:rg=
b(0,0,0);color:rgb(0,0,0)"><span style=3D"font-family:-apple-system,helveti=
caneue;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0=
,0)"><div style=3D"font-family:-apple-system,helveticaneue" dir=3D"auto"><s=
pan style=3D"font-family:-apple-system,helveticaneue;font-size:18px;font-st=
yle:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;text-decoration:none;float:no=
ne;display:inline!important;background-color:rgba(0,0,0,0);border-color:rgb=
(0,0,0);color:rgb(0,0,0)">In short, purchase an addon PCIe USB card to isol=
ate traffic.=C2=A0 USB is a shared medium and is rooted in the cheapest ele=
ctronics. =C2=A0 It was never considered enterprise grade hardware for most=
 all of history. =C2=A0 =C2=A0</span><span style=3D"font-family:-apple-syst=
em,helveticaneue;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);col=
or:rgb(0,0,0)">The letter B in =C2=A0USB =C2=A0stands for BUS which actuall=
y means a shared roadway that other USB devices can and do impede traffic. =
=C2=A0 We experienced interfering traffic on inexpensive laptops running =
=C2=A0XEN based Qubes-OS.=C2=A0 Turned out the WiFi card was actually wired=
 onto the USB bus. =C2=A0 Unplugging all external USB electronics reduced i=
nexplicable WiFi disconnects and reliably improved throughput. =C2=A0 =C2=
=A0However, there was no way to remove the keyboard, touchpad, and touchscr=
een which all used the USB roadway. =C2=A0=C2=A0</span></div><div style=3D"=
font-family:-apple-system,helveticaneue" dir=3D"auto"><span style=3D"font-f=
amily:-apple-system,helveticaneue;background-color:rgba(0,0,0,0);border-col=
or:rgb(0,0,0);color:rgb(0,0,0)"><br></span></div><div style=3D"font-family:=
-apple-system,helveticaneue" dir=3D"auto"><span style=3D"font-family:-apple=
-system,helveticaneue;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0=
);color:rgb(0,0,0)">Those were cheap laptops, but even=C2=A0</span><span st=
yle=3D"font-family:-apple-system,helveticaneue;background-color:rgba(0,0,0,=
0);border-color:rgb(0,0,0);color:rgb(0,0,0)">enterprise class hardware such=
 as HPE =C2=A0and Dell Servers running XCP-NG did not have great speeds. =
=C2=A0 But in this scenario, we could simplify the problem and =C2=A0isolat=
e the issue by=C2=A0</span><span>purchasing a =C2=A0new add-on=C2=A0</span>=
<span style=3D"font-family:-apple-system,helveticaneue;background-color:rgb=
a(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">PCIe card with USB por=
ts and then assign the entire PCIe card to the VM. =C2=A0 The VM would then=
 have entire control of the PCIe card and isolate traffic to devices plugge=
d into that card. =C2=A0</span></div><div style=3D"font-family:-apple-syste=
m,helveticaneue" dir=3D"auto"><span style=3D"font-family:-apple-system,helv=
eticaneue;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(=
0,0,0)"><br></span></div><div style=3D"font-family:-apple-system,helvetican=
eue" dir=3D"auto"><span style=3D"font-family:-apple-system,helveticaneue;ba=
ckground-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">I di=
d not know until later that Wireshark has plugins for sniffing USB traffic,=
 but my name is =C2=A0not Heisenberg and not sure if that traffic monitorin=
g does not also slow down other devices. =C2=A0</span><br></div></span></di=
v></div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Feb 24, 2024 at 8:39 AM Julien Grall &lt;<a href=3D"ma=
ilto:julien@xen.org">julien@xen.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
" dir=3D"auto">Hi Dominique and Francois,<br>
<br>
Thank you for the report. I am CCing some person who I think could help.<br=
>
<br>
I also have some questions (see below).<br>
<br>
On 23/02/2024 16:00, GOURLOT Francois wrote:<br>
&gt; Dear All,<br>
&gt; <br>
&gt; We send you a message few days ago.<br>
&gt; <br>
&gt; We have major performance with XEN USB Drivers. We use your driver to =
<br>
&gt; load data in a device and we need USB3 High Speed USB protocole<br>
&gt; <br>
&gt; Do you have a new issue of the HCI and NEC USB Xen Driver ?<br>
p<br>
[...]<br>
<br>
&gt; *De=C2=A0:*LARRIEU Dominique &lt;<a href=3D"mailto:dominique.larrieu@t=
halesgroup.com" target=3D"_blank">dominique.larrieu@thalesgroup.com</a>&gt;=
<br>
&gt; *Envoy=C3=A9=C2=A0:* jeudi 22 f=C3=A9vrier 2024 13:58<br>
&gt; *=C3=80=C2=A0:* <a href=3D"mailto:xen-devel@lists.xenproject.org" targ=
et=3D"_blank">xen-devel@lists.xenproject.org</a><br>
&gt; *Cc=C2=A0:* WILLEMS Louis &lt;<a href=3D"mailto:louis.willems@thalesgr=
oup.com" target=3D"_blank">louis.willems@thalesgroup.com</a>&gt;; GRUO Nico=
las <br>
&gt; &lt;<a href=3D"mailto:nicolas-n.gruo@thalesgroup.com" target=3D"_blank=
">nicolas-n.gruo@thalesgroup.com</a>&gt;; GOURLOT Francois <br>
&gt; &lt;<a href=3D"mailto:francois.gourlot@thalesgroup.com" target=3D"_bla=
nk">francois.gourlot@thalesgroup.com</a>&gt;; Kelly Choi &lt;<a href=3D"mai=
lto:kelly.choi@cloud.com" target=3D"_blank">kelly.choi@cloud.com</a>&gt;<br=
>
&gt; *Objet=C2=A0:* Need help on USB port virtualization with Xen hyperviso=
r<br>
&gt; *Crit=C3=A8re de diffusion=C2=A0:* Confidentiel<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Dear all,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We are detectingseveral issues with USB port virtua=
lization with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Xen hypervisor.<br>
<br>
Just to clarify, you are assigning the PCI USB bus (rather than just the <b=
r>
USB device) to the guest. Is that correct?<br>
<br>
If so...<br>
<br>
=C2=A0&gt;<br>
=C2=A0&gt; Do you have a new issue of the HCI and NEC USB Xen Driver ?<br>
<br>
... I am not sure what Xen driver you are talking about. If the USB bus <br=
>
is assigned to the guest, then I would expect no specific Xen driver are <b=
r>
required. Do you have any pointer to the existing one?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0- We cannot do PCI passthrough of the PCI usb bus o=
n a Windows 10<br>
&gt;=C2=A0 =C2=A0 =C2=A01607 64-bit virtual machine. The bad result is a Wi=
ndows blue screen.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- When we use the passthrough functionality on a Wi=
ndows 21H2<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtual machine, we notice thatthe speed of the USB=
 port is not high<br>
&gt;=C2=A0 =C2=A0 =C2=A0speed but full speed on a USB 3.0 port<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- We notice instabilities when using the nec-usb-xh=
ci driver, =C2=A0USB<br>
&gt;=C2=A0 =C2=A0 =C2=A02.0 keys are not recognized by the Windows virtual =
machine<br>
&gt;=C2=A0 =C2=A0 =C2=A0(incorrect descriptor)<br>
<br>
Do you have any logs you could share from the guest OS? Also, would you <br=
>
be able to share more details on how you configure the guest? (e.g. xl <br>
configuration, libvirt...)?<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We needyour helpto find a solution for these proble=
ms.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The Software used are :<br>
<br>
Can you share some details of the HW you are using?<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Debian 11 version5.10.0-20<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Xen version4.14<br>
<br>
Are minor version of Xen 4.14 are you using? Any patches on top?<br>
<br>
Xen 4.14 has also been out of support for a few months now. If that&#39;s <=
br>
possible, I would recommend to try a new Xen version (the last stable is <b=
r>
4.18) just in case your issue as been fixed in newer release.<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Windows 10 1607 and 21H2 for virtual machines. Vir=
tual Machine HVM<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
</blockquote></div></div>

--000000000000217d27061233cfe1--

