Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93E73D5C1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 04:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554950.866414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDbm7-0007UM-1F; Mon, 26 Jun 2023 02:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554950.866414; Mon, 26 Jun 2023 02:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDbm6-0007S3-U4; Mon, 26 Jun 2023 02:16:18 +0000
Received: by outflank-mailman (input) for mailman id 554950;
 Mon, 26 Jun 2023 02:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nV4m=CO=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qDbm5-0007Rx-IK
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 02:16:17 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d674358-13c7-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 04:16:15 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-987341238aeso326383666b.3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Jun 2023 19:16:15 -0700 (PDT)
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
X-Inumbo-ID: 6d674358-13c7-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687745774; x=1690337774;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hFcNjdxMTr73T7MjBCYxtsm9rGsRg46QQJOIWjTy5bY=;
        b=m2lRAw67V0q2HRzsKHTgA7P3wKjFd28eHLmzi+VoIvpptRUG6MfFkXYovQggmvLM9T
         40IElWJo7RoNevi3dR/J7DjKbbCawwIojTpmjYNz3v34nfV7MI5jw0LXIbqFqvQX1FC4
         puqJrzzBe51UgMlarIKlZ+NGF09vUpxCaf6Wch/6f0CFxb/aHdWiWfsAQpUmnpb9NOni
         FAPMg+gORH0PlYBBTVTPhb6EfZes5CD2btu7JqMd0ij660Usz0MtvOOGBF84acPmt1qy
         0HwBl9cB4T7ccXCDKAapzUgmp7YmdCMBD/gGVCX047C9pzwuyLaujivtRQb1p+WUCcV8
         Ly9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687745774; x=1690337774;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFcNjdxMTr73T7MjBCYxtsm9rGsRg46QQJOIWjTy5bY=;
        b=Cc06zyUwxV/6syuROCH6FIZNlZLX2OMN9s9AL2LJXG2arObbuIcNW1CcZrnA+MbKPX
         L1lcPjolGg1EIgr1NLK35KF2lUE3mf0CaeLW7ycNy1CoDSmDwXdvcieEu5xTlRJrwiET
         jBc8fb8hNHUFVeeJKVyNtB8QJZoVOCUn9/AQ3hdu5RZTfzdHPnZpwe2S9Ycp4kHO8sU6
         vGjfRVR/kMA8qt3RS0mOMloG+CsMtt9GwW6c+hxC1a46IJoercygTdY4rkSn5Q9nNbkU
         O01Hquclwj6fW4XbJoiqjkanq+CjOg6+OzaKp2uv1bjwNmPyyyP1snP9EIQWaoqD/OB3
         dafQ==
X-Gm-Message-State: AC+VfDwlB9OCMzDwIX8ahgZZIP8BpFLBYp2bTDqn/R6AvAJl2BvRIEM+
	VAuWVpjaNoCP0nfvKjSWACtvufqat21FkhVqN6r1yuhAKGM=
X-Google-Smtp-Source: ACHHUZ5Tsr3bt4G5xlfKepKnJRIP69+oc/vkTUbFuPzZLOwoBMvULc0+E+ksCXQOlHAXMm0Rj31QdzKE6mM6Z2PqTuM=
X-Received: by 2002:a17:907:9306:b0:978:7262:d125 with SMTP id
 bu6-20020a170907930600b009787262d125mr22902321ejc.76.1687745773732; Sun, 25
 Jun 2023 19:16:13 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 25 Jun 2023 19:16:01 -0700
Message-ID: <CACMJ4GYnxUkW=j9OVq2Qib90hxAjnmuxf48wSQpGW3AR6zGXag@mail.gmail.com>
Subject: Xen Summit 2023 Design Session slides + notes: Hyperlaunch
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>
Content-Type: multipart/alternative; boundary="00000000000050864905fefeef09"

--00000000000050864905fefeef09
Content-Type: text/plain; charset="UTF-8"

# Hyperlaunch: Design Session
## Xen Summit 2023


<center>Moderators: Christopher Clark, Daniel P. Smith</center>

---

# Hyperlaunch: Review of Goals

**Project goals:**
<br/><br/>

* HAT: Isolating Safety Critical VMs from non-Critical VMs
* Fast system start
* Static partitioning
* Dynamic partitioning via policy and configuration
* System architecture for boot domain
* A strategic advantage for the Xen hypervisor
<br/><br/>

**Development goal:** Merging incremental work


---
# Design Considerations

* Architecture-neutral:
 * Hello Arm dom0less! and RISC-V and PPC and ...
 * Common representions of boot materials
 * Common domain contruction code
 * Abiility for arch-specific extensions to representation and construction
 <br/><br/>
* Upstream maintained

---

# Upcoming: Summary View

**AMD** is now a sponsor in Hyperlaunch, enabling continued development by
Daniel and
Christopher to advance the work into Xen.<br/><br/>

Development is active:

* Series v1 being split and prepared for v2 upstream
* Rebase of whole series to 4.17.1
* Preliminary work to add PVH domain construction with mulitple domain
unpause

---

# Patch Series Status:

* v1 series: July 2022

 * Review feedback helpful, thanks!
   * eg. approach: add fields, structure when use is introduced
   * no major changes in design since posting v1

* **v2 series: imminent**, being prepared to post
  * Plan agreed with the Xen Community on the Community Calls:
    * **Smaller patches, a subset of v1 series functionality**
    * Enables incremental merge, reduces review effort
    * v2 goal: refactor Xen start logic away from multiboot

---

# Patch Series Status (cont'd):

* Forward port v1 series to 4.17 is undergoing test in parallel
    * ensures full multi-VM launch functionality still working
    * supports testing launch with PVH Dom0 or HWDom and 1 PVH guest

---

# v1 Series: x86-specific

* Kconfig for max number of boot modules across all of Xen
* Add all new boot structures, flag definitions, etc
* Change all boot logic after __start_xen:
  * both PV and PVH dom0 construction, XSM, microcode loading
* Change all entry points prior to __start_xen:
  * multiboot, PVH boot, EFI
* Change command line processing to new structures
* Move general flattened device tree code from Arm into common
* Update docs

---
# v1 Series (cont'd):

* Add a new Kconfig item for a Domain Builder using FDT
* New structure to introduce a Domain Builder, not yet used
* Implementation of a domain builder, parsing device tree to construct
domains
* Conversion of dom0 creation and construction to use of the new domain
builder
* Generalize dom0 logic:
  * Domain creation, physmap, VCPU init; page alloc; multi PV domain
* Populate hypfs to support boot domain and runtime system use cases
* Add a tool for assisting PV domains with xenstore entries

---

# v2 Series: Still x86-specific!

**Shorter v2 series:** subset of v1 work, addressing prior feedback,
for simpler review for initial upstream merging.
<br/><br/>
Port of full v1 series available separately for testing of
the full feature behaviour.

---

# v2 Series Outline (in progress):

* Introduce hyperlaunch structures: convert module count
* Introduce per-arch headers and data structures: convert headroom
* Enable bootstrap mapping with hyperlaunch structures
* Port PV and PVH dom0 construction from multiboot to hyperlaunch
* Switch XSM init to hyperlaunch structures from multiboot
* Switch microcode module loading to hyperlaunch structures
* Convert PVH boot entry point from multiboot
* ...

---

# Credit and Thanks

* AMD for sponsoring our current development
* Star Lab (now WindRiver) for prior sponsorship of Hyperlaunch development
* D. DeGraaf's development of late hardware domain and early domain builder
work

---

# At Summit: Discussion: #1

* There is a challenge with console I/O access as domU require Xenstore for
establishing connections
<br/><br/>

"DomUs can use console_io hypercall when Xen is in debug. Daniel is working
an approach that allows specifying whether domU console_io hypercall
messages are allowed to be printed to Xen's console."

---

# At Summit: Discussion: #2

* An ultimate goal for Safety Certified will be the ability to construct
domains and have a PCI device assigned at boot
<br/><br/>


"This is complicated situation and for these, the DomB concept was created.
It will allow for Linux, a Realtime OS, or a bare metal app to be ran
before the completion of Xen startup to handle complicated interfaces in a
lower privilege execution environment."


---

# At Summit: Chat questions: #1

Q: When will Hyperlaunch be able to run a toolstack VM?
<br/>*(by stacktrust)*
<br/><br/>

"It should be doable when the full feature is merged, ie all functionality
that is in the v1 series, plus the XSM roles series. v2 series will be a
subset of v1 series posted, so more work will be needed to upstream the
rest. Then there will be some debugging when control domain is separate
from hardware domain with testing toolstack functionality to see what
assumptions of dom0 structure are there."

---

# At Summit: Chat questions: #2

Can a guest determine whether a system was started with Hyperlaunch?
<br/>*(by stacktrust)*
<br/><br/>

"maybe. we could surface data in ACPI tables in PVH guests, for example.
It's a complicated one to answer; will consider for the design doc."

---

# At Summit: Chat questions: #3

What is the expected timeline for v2 series to be merged?
<br/>*(by stacktrust)*
<br/><br/>

"v2 series posting: not far out; v2 series merging: will depend on review
feedback"

---

# At Summit: Chat questions: #4

Q: How much work is expected for v3 series (where v3 = v1 subset that was
not part of v2)? Approx timeline?
<br/>*(by stacktrust)*
<br/><br/>

"v1 series was 18 patches; v2 series will be approx 6-8 patches derived
from 3 of the v1 series patches, to prepare them for full on-list review.

The remaining work (15 of the v1 patches to be revisited) is appreciable,
in addition to any necessary iteration on feedback on the v2 series.

..."

---

# At Summit: Chat questions: #4

*response continued:*

"This is why we're also forward-porting the full 18 patch series to Xen
4.17.1, so the full feature is testable and we're tracking updates to the
upstream code that it changes."

---

# Additional References

* Primary reference: [Hyperlaunch on the Xen Project Wiki](
https://wiki.xenproject.org/wiki/Hyperlaunch)
<br/>

* [Xen Summit 2020: Reliable Platform Security Xen And The Fidelis Platform
For Hardened Access Terminals - HAT](https://xen2020.sched.com/event/baXt)
<br/>

* [Xen Summit 2021: Protection Hypervisor: Atto-sized Hypervisor Design](
https://events.linuxfoundation.org/archive/2021/xen-summit/program/schedule/
)

--00000000000050864905fefeef09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"># Hyperlaunch: Design Session<br>## Xen Summit 2023<br><br=
><br>&lt;center&gt;Moderators: Christopher Clark, Daniel P. Smith&lt;/cente=
r&gt;<br><br>---<br><br># Hyperlaunch: Review of Goals<br><br>**Project goa=
ls:**<br>&lt;br/&gt;&lt;br/&gt;<br><br>* HAT: Isolating Safety Critical VMs=
 from non-Critical VMs<br>* Fast system start<br>* Static partitioning<br>*=
 Dynamic partitioning via policy and configuration<br>* System architecture=
 for boot domain<br>* A strategic advantage for the Xen hypervisor<br>&lt;b=
r/&gt;&lt;br/&gt;<br><br>**Development goal:** Merging incremental work<br>=
<br><br>---<br># Design Considerations<br><br>* Architecture-neutral:<br>=
=C2=A0* Hello Arm dom0less! and RISC-V and PPC and ...<br>=C2=A0* Common re=
presentions of boot materials<br>=C2=A0* Common domain contruction code<br>=
=C2=A0* Abiility for arch-specific extensions to representation and constru=
ction<br>=C2=A0&lt;br/&gt;&lt;br/&gt;<br>* Upstream maintained<br><br>---<b=
r><br># Upcoming: Summary View<br><br>**AMD** is now a sponsor in Hyperlaun=
ch, enabling continued development by Daniel and<br>Christopher to advance =
the work into Xen.&lt;br/&gt;&lt;br/&gt;<br><br>Development is active:<br><=
br>* Series v1 being split and prepared for v2 upstream<br>* Rebase of whol=
e series to 4.17.1<br>* Preliminary work to add PVH domain construction wit=
h mulitple domain unpause<br><br>---<br><br># Patch Series Status:<br><br>*=
 v1 series: July 2022<br><br>=C2=A0* Review feedback helpful, thanks!<br>=
=C2=A0 =C2=A0* eg. approach: add fields, structure when use is introduced<b=
r>=C2=A0 =C2=A0* no major changes in design since posting v1<br><br>* **v2 =
series: imminent**, being prepared to post<br>=C2=A0 * Plan agreed with the=
 Xen Community on the Community Calls:<br>=C2=A0 =C2=A0 * **Smaller patches=
, a subset of v1 series functionality**<br>=C2=A0 =C2=A0 * Enables incremen=
tal merge, reduces review effort<br>=C2=A0 =C2=A0 * v2 goal: refactor Xen s=
tart logic away from multiboot<br><br>---<br><br># Patch Series Status (con=
t&#39;d):<br><br>* Forward port v1 series to 4.17 is undergoing test in par=
allel<br>=C2=A0 =C2=A0 * ensures full multi-VM launch functionality still w=
orking<br>=C2=A0 =C2=A0 * supports testing launch with PVH Dom0 or HWDom an=
d 1 PVH guest<br><br>---<br><br># v1 Series: x86-specific<br><br>* Kconfig =
for max number of boot modules across all of Xen<br>* Add all new boot stru=
ctures, flag definitions, etc<br>* Change all boot logic after __start_xen:=
<br>=C2=A0 * both PV and PVH dom0 construction, XSM, microcode loading<br>*=
 Change all entry points prior to __start_xen:<br>=C2=A0 * multiboot, PVH b=
oot, EFI<br>* Change command line processing to new structures<br>* Move ge=
neral flattened device tree code from Arm into common<br>* Update docs<br><=
br>---<br># v1 Series (cont&#39;d):<br><br>* Add a new Kconfig item for a D=
omain Builder using FDT<br>* New structure to introduce a Domain Builder, n=
ot yet used<br>* Implementation of a domain builder, parsing device tree to=
 construct domains<br>* Conversion of dom0 creation and construction to use=
 of the new domain builder<br>* Generalize dom0 logic:<br>=C2=A0 * Domain c=
reation, physmap, VCPU init; page alloc; multi PV domain<br>* Populate hypf=
s to support boot domain and runtime system use cases<br>* Add a tool for a=
ssisting PV domains with xenstore entries<br><br>---<br><br># v2 Series: St=
ill x86-specific!<br><br>**Shorter v2 series:** subset of v1 work, addressi=
ng prior feedback,<br>for simpler review for initial upstream merging.<br>&=
lt;br/&gt;&lt;br/&gt;<br>Port of full v1 series available separately for te=
sting of<br>the full feature behaviour.<br><br>---<br><br># v2 Series Outli=
ne (in progress):<br><br>* Introduce hyperlaunch structures: convert module=
 count<br>* Introduce per-arch headers and data structures: convert headroo=
m<br>* Enable bootstrap mapping with hyperlaunch structures<br>* Port PV an=
d PVH dom0 construction from multiboot to hyperlaunch<br>* Switch XSM init =
to hyperlaunch structures from multiboot<br>* Switch microcode module loadi=
ng to hyperlaunch structures<br>* Convert PVH boot entry point from multibo=
ot<br>* ...<br><br>---<br><br># Credit and Thanks<br><br>* AMD for sponsori=
ng our current development<br>* Star Lab (now WindRiver) for prior sponsors=
hip of Hyperlaunch development<br>* D. DeGraaf&#39;s development of late ha=
rdware domain and early domain builder work<br><br>---<br><br># At Summit: =
Discussion: #1<br><br>* There is a challenge with console I/O access as dom=
U require Xenstore for establishing connections<br>&lt;br/&gt;&lt;br/&gt;<b=
r><br>&quot;DomUs can use console_io hypercall when Xen is in debug. Daniel=
 is working an approach that allows specifying whether domU console_io hype=
rcall messages are allowed to be printed to Xen&#39;s console.&quot;<br><br=
>---<br><br># At Summit: Discussion: #2<br><br>* An ultimate goal for Safet=
y Certified will be the ability to construct domains and have a PCI device =
assigned at boot<br>&lt;br/&gt;&lt;br/&gt;<br><br><br>&quot;This is complic=
ated situation and for these, the DomB concept was created. It will allow f=
or Linux, a Realtime OS, or a bare metal app to be ran before the completio=
n of Xen startup to handle complicated interfaces in a lower privilege exec=
ution environment.&quot;<br><br><br>---<br><br># At Summit: Chat questions:=
 #1<br><br>Q: When will Hyperlaunch be able to run a toolstack VM?<br>&lt;b=
r/&gt;*(by stacktrust)*<br>&lt;br/&gt;&lt;br/&gt;<br>=C2=A0<br>&quot;It sho=
uld be doable when the full feature is merged, ie all functionality that is=
 in the v1 series, plus the XSM roles series. v2 series will be a subset of=
 v1 series posted, so more work will be needed to upstream the rest. Then t=
here will be some debugging when control domain is separate from hardware d=
omain with testing toolstack functionality to see what assumptions of dom0 =
structure are there.&quot;<br><br>---<br><br># At Summit: Chat questions: #=
2<br><br>Can a guest determine whether a system was started with Hyperlaunc=
h?<br>&lt;br/&gt;*(by stacktrust)*<br>&lt;br/&gt;&lt;br/&gt;<br><br>&quot;m=
aybe. we could surface data in ACPI tables in PVH guests, for example.<br>I=
t&#39;s a complicated one to answer; will consider for the design doc.&quot=
;<br><br>---<br><br># At Summit: Chat questions: #3<br><br>What is the expe=
cted timeline for v2 series to be merged?<br>&lt;br/&gt;*(by stacktrust)*<b=
r>&lt;br/&gt;&lt;br/&gt;<br><br>&quot;v2 series posting: not far out; v2 se=
ries merging: will depend on review feedback&quot;<br><br>---<br><br># At S=
ummit: Chat questions: #4<br><br>Q: How much work is expected for v3 series=
 (where v3 =3D v1 subset that was not part of v2)? Approx timeline?<br>&lt;=
br/&gt;*(by stacktrust)*<br>&lt;br/&gt;&lt;br/&gt;<br><br>&quot;v1 series w=
as 18 patches; v2 series will be approx 6-8 patches derived from 3 of the v=
1 series patches, to prepare them for full on-list review.<br><br>The remai=
ning work (15 of the v1 patches to be revisited) is appreciable, in additio=
n to any necessary iteration on feedback on the v2 series.<br><br>...&quot;=
<br><br>---<br><br># At Summit: Chat questions: #4<br><br>*response continu=
ed:*<br><br>&quot;This is why we&#39;re also forward-porting the full 18 pa=
tch series to Xen 4.17.1, so the full feature is testable and we&#39;re tra=
cking updates to the upstream code that it changes.&quot;<br><br>---<br><br=
># Additional References<br><br>* Primary reference: [Hyperlaunch on the Xe=
n Project Wiki](<a href=3D"https://wiki.xenproject.org/wiki/Hyperlaunch">ht=
tps://wiki.xenproject.org/wiki/Hyperlaunch</a>)<br>&lt;br/&gt;<br><br>* [Xe=
n Summit 2020: Reliable Platform Security Xen And The Fidelis Platform For =
Hardened Access Terminals - HAT](<a href=3D"https://xen2020.sched.com/event=
/baXt">https://xen2020.sched.com/event/baXt</a>)<br>&lt;br/&gt;<br><br>* [X=
en Summit 2021: Protection Hypervisor: Atto-sized Hypervisor Design](<a hre=
f=3D"https://events.linuxfoundation.org/archive/2021/xen-summit/program/sch=
edule/">https://events.linuxfoundation.org/archive/2021/xen-summit/program/=
schedule/</a>)<br></div>

--00000000000050864905fefeef09--

