Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541204021BA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 02:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180302.326895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNPR5-0002hY-Ib; Tue, 07 Sep 2021 00:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180302.326895; Tue, 07 Sep 2021 00:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNPR5-0002fl-FR; Tue, 07 Sep 2021 00:58:03 +0000
Received: by outflank-mailman (input) for mailman id 180302;
 Tue, 07 Sep 2021 00:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3oQ=N5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mNPR4-0002ff-1t
 for xen-devel@lists.xen.org; Tue, 07 Sep 2021 00:58:02 +0000
Received: from mail-oo1-xc2d.google.com (unknown [2607:f8b0:4864:20::c2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ad94e00-1f18-4281-9f6d-40b1bf59f82f;
 Tue, 07 Sep 2021 00:57:59 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 y3-20020a4ab403000000b00290e2a52c71so2439885oon.2
 for <xen-devel@lists.xen.org>; Mon, 06 Sep 2021 17:57:58 -0700 (PDT)
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
X-Inumbo-ID: 6ad94e00-1f18-4281-9f6d-40b1bf59f82f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUq8hhhVF+UOcOQr157X5bZtPmm1X78HQGLXPKMFzuI=;
        b=GEJPVWizDy1/cHuxqsGCcbg4TXZyPYnuD2g4BhcY8nN+MtooHN44X6f+M15WWQeELk
         ZHxS6OcsHF8b1HPdRfPrF0lUe8C581xHWFOWapCJIP8aHnoh2ey9vULULhfumbo7LXAT
         GDviqgNRWwGILs8ON3yjB8FPK4bq4Hi+rBj1qjbLgkk61ZhZRn1NnD6Nd/KiOCIm5ZTC
         9QWRj/+vjWiOpxsKLgEDePZkeYbpkjTc6l36kXMd9zHsHuh1j4C2f5lCraLKARu9LJ1k
         D1F/za65wIi/G7aKw3Hss9BiMcAXuyaWlgCm51v4c9Oa/kRqeJDe+S0cQ893K3/ePIKq
         PTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUq8hhhVF+UOcOQr157X5bZtPmm1X78HQGLXPKMFzuI=;
        b=YgIOaxgppSIFvy/s4gT6nXj1X2pb52KckWwceEN1plRGQCyigxEnkySZunRF/brX9O
         HV9oybniTOv9xgdadVkKUuCx8w9MSpC2DdpW/tp6RouPSG6lZROf1qkycF7A23DtEeOZ
         JCZvSYCYX7ZoLTY5HqrWHyK8tWJUW9f6bGV+4m8DziF8VVO3y42sQYD0hrEHJW0YDQNm
         CXvgsXissc7bPQ/QSoiFe++m+k56zTNWcOhYCDZwwcRYVcgcY1xIkG2vHqi46b0JWxxm
         HlCxaw5EYgyBPgTgMNnfxAM6iWgnq+4dite4koUDnqT6zd53sSVxyhxD9yD0Xcp01aMd
         zoLg==
X-Gm-Message-State: AOAM531PQAwSMAwFkoa6NyaCl+f6ZlBIEU4AYr7Fyhd/ryOwK8vVwobd
	yw+d7RrRZnz0CnZshXMWcakddqcNM0UGjq9OQmQ=
X-Google-Smtp-Source: ABdhPJzkmVgMjlkimhOnxYqmnzjr8MYlQDbviubm9j0fp6M02lYE+H2P8fCiYO93E0jJO8KWexrxbJ0mIeTaa254QNk=
X-Received: by 2002:a4a:e297:: with SMTP id k23mr9231450oot.4.1630976278325;
 Mon, 06 Sep 2021 17:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <DB9PR08MB685767CFAA4A8BCE7D2225A89EFD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210817080757.GC43203@laputa> <DB9PR08MB6857C656472153A42FB438C49EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210818053840.GE39588@laputa> <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa> <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CACMJ4GbmNgbB5ponYt3NGEk3j6YCksot+kDy2qs8HMdFXWnQbw@mail.gmail.com>
 <CACMJ4GbqPc29n+CAknY4kCjrQnkCSR=W+rymuY7Xa1EZb0MW5w@mail.gmail.com> <20210902071902.GC71098@laputa>
In-Reply-To: <20210902071902.GC71098@laputa>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 6 Sep 2021 17:57:43 -0700
Message-ID: <CACMJ4GYY0wkm0vOzJfq8M9dCxPq1ZFwWT8Q73rMjqtrP7if-Zw@mail.gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Alex Benn??e" <alex.bennee@linaro.org>, 
	Kaly Xin <Kaly.Xin@arm.com>, Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, "stefanha@redhat.com" <stefanha@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>, 
	"pratikp@quicinc.com" <pratikp@quicinc.com>, Srivatsa Vaddagiri <vatsa@codeaurora.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <paul@xen.org>, Xen Devel <xen-devel@lists.xen.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, James McKenzie <james@bromium.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000b501cf05cb5d41dd"

--000000000000b501cf05cb5d41dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 12:19 AM AKASHI Takahiro <takahiro.akashi@linaro.org=
>
wrote:

> Hi Christopher,
>
> Thank you for your feedback.
>
> On Mon, Aug 30, 2021 at 12:53:00PM -0700, Christopher Clark wrote:
> > [ resending message to ensure delivery to the CCd mailing lists
> > post-subscription ]
> >
> > Apologies for being late to this thread, but I hope to be able to
> > contribute to
> > this discussion in a meaningful way. I am grateful for the level of
> > interest in
> > this topic. I would like to draw your attention to Argo as a suitable
> > technology for development of VirtIO's hypervisor-agnostic interfaces.
> >
> > * Argo is an interdomain communication mechanism in Xen (on x86 and Arm=
)
> > that
> >   can send and receive hypervisor-mediated notifications and messages
> > between
> >   domains (VMs). [1] The hypervisor can enforce Mandatory Access Contro=
l
> > over
> >   all communication between domains. It is derived from the earlier v4v=
,
> > which
> >   has been deployed on millions of machines with the HP/Bromium uXen
> > hypervisor
> >   and with OpenXT.
> >
> > * Argo has a simple interface with a small number of operations that wa=
s
> >   designed for ease of integration into OS primitives on both Linux
> > (sockets)
> >   and Windows (ReadFile/WriteFile) [2].
> >     - A unikernel example of using it has also been developed for XTF.
> [3]
> >
> > * There has been recent discussion and support in the Xen community for
> > making
> >   revisions to the Argo interface to make it hypervisor-agnostic, and
> > support
> >   implementations of Argo on other hypervisors. This will enable a sing=
le
> >   interface for an OS kernel binary to use for inter-VM communication
> that
> > will
> >   work on multiple hypervisors -- this applies equally to both backends
> and
> >   frontend implementations. [4]
>
> Regarding virtio-over-Argo, let me ask a few questions:
> (In figure "Virtual device buffer access:Virtio+Argo" in [4])
>

(for ref, this diagram is from this document:
 https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698 )

Takahiro, thanks for reading the Virtio-Argo materials.

Some relevant context before answering your questions below: the Argo
request
interface from the hypervisor to a guest, which is currently exposed only
via a
dedicated hypercall op, has been discussed within the Xen community and is
open
to being changed in order to better enable support for guest VM access to
Argo
functions in a hypervisor-agnostic way.

The proposal is to allow hypervisors the option to implement and expose any
of
multiple access mechanisms for Argo, and then enable a guest device driver
to
probe the hypervisor for methods that it is aware of and able to use. The
hypercall op is likely to be retained (in some form), and complemented at
least
on x86 with another interface via MSRs presented to the guests.



> 1) How the configuration is managed?
>    On either virtio-mmio or virtio-pci, there always takes place
>    some negotiation between the FE and BE through the "configuration"
>    space. How can this be done in virtio-over-Argo?
>

Just to be clear about my understanding: your question, in the context of a
Linux kernel virtio device driver implementation, is about how a virtio-arg=
o
transport driver would implement the get_features function of the
virtio_config_ops, as a parallel to the work that vp_get_features does for
virtio-pci, and vm_get_features does for virtio-mmio.

The design is still open on this and options have been discussed, including=
:

* an extension to Argo to allow the system toolstack (which is responsible
for
  managing guest VMs and enabling connections from front-to-backends)
  to manage a table of "implicit destinations", so a guest can transmit Arg=
o
  messages to eg. "my storage service" port and the hypervisor will deliver
it
  based on a destination table pre-programmed by the toolstack for the VM.
  [1]
     - ref: Notes from the December 2019 Xen F2F meeting in Cambridge, UK:
       [1] https://lists.archive.carbon60.com/xen/devel/577800#577800

  So within that feature negotiation function, communication with the
backend
  via that Argo channel will occur.

* IOREQ
The Xen IOREQ implementation is not currently appropriate for virtio-argo
since
it requires the use of foreign memory mappings of frontend memory in the
backend
guest. However, a new HMX interface from the hypervisor could support a new
DMA
Device Model Op to allow the backend to request the hypervisor to retrieve
specified
bytes from the frontend guest, which would enable plumbing for device
configuration
between an IOREQ server (device model backend implementation) and the guest
driver.
[2]

Feature negotiation in the front end in this case would look very similar t=
o
the virtio-mmio implementation.

ref: Argo HMX Transport for VirtIO meeting minutes, from January 2021:
[2]
https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.html

* guest ACPI tables that surface the address of a remote Argo endpoint
  on behalf of the toolstack, and Argo communication can then negotiate
features

* emulation of a basic PCI device by the hypervisor (though details not
determined)



> 2) Do there physically exist virtio's available/used vrings as well as
>    descriptors, or are they virtually emulated over Argo (rings)?
>

In short: the latter.

In the analysis that I did when looking at this, my observation was that
each
side (front and backend) should be able to accurately maintain their own
local
copy of the available/used vrings as well as descriptors, and both be kept
synchronized by ensuring that updates are transmitted to the other side whe=
n
they are written to. eg. As part of this, in the Linux front end
implementation
the virtqueue_notify function uses a function pointer in the virtqueue that
is
populated by the transport driver, ie. the virtio-argo driver in this case,
which can implement the necessary logic to coordinate with the backend.


> 3) The payload in a request will be copied into the receiver's Argo ring.
>    What does the address in a descriptor mean?
>    Address/offset in a ring buffer?
>

Effectively yes. I would treat it as a handle that is used to identify and
retrieve data from messages exchanged between frontend transport driver and
the backend via Argo rings established for moving data for the data path.
In the diagram, those are "Argo ring for reads" and "Argo ring for writes".


> 4) Estimate of performance or latency?
>

Different access methods to Argo (ie. related to my answer to your question
'1)'
above --) will have different performance characteristics.

Data copying will necessarily involved for any Hypervisor-Mediated data
eXchange
(HMX) mechanism[1], such as Argo, where there is no shared memory between
guest
VMs, but the performance profile on modern CPUs with sizable caches has bee=
n
demonstrated to be acceptable for the guest virtual device drivers use case
in
the HP/Bromium vSentry uXen product. The VirtIO structure is somewhat
different
though.

Further performance profiling and measurement will be valuable for enabling
tuning of the implementation and development of additional interfaces (eg.
such
as an asynchronous send primitive) - some of this has been discussed and
described on the VirtIO-Argo-Development-Phase-1 wiki page[2].

[1]
https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_f=
or_Xen

[2]
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+De=
velopment%3A+Phase+1


>    It appears that, on FE side, at least three hypervisor calls (and data
>    copying) need to be invoked at every request, right?
>

For a write, counting FE sendv ops:
1: the write data payload is sent via the "Argo ring for writes"
2: the descriptor is sent via a sync of the available/descriptor ring
  -- is there a third one that I am missing?

Christopher


>
> Thanks,
> -Takahiro Akashi
>
>
> > * Here are the design documents for building VirtIO-over-Argo, to
> support a
> >   hypervisor-agnostic frontend VirtIO transport driver using Argo.
> >
> > The Development Plan to build VirtIO virtual device support over Argo
> > transport:
> >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development+Phase+1
> >
> > A design for using VirtIO over Argo, describing how VirtIO data
> structures
> > and communication is handled over the Argo transport:
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO+Arg=
o
> >
> > Diagram (from the above document) showing how VirtIO rings are
> synchronized
> > between domains without using shared memory:
> >
> https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#media-b=
lob-url=3Dtrue&id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&collection=3Dconte=
ntId-1348763698&contextId=3D1348763698&mimeType=3Dimage%2Fpng&name=3Ddevice=
-buffer-access-virtio-argo.png&size=3D243175&width=3D1106&height=3D1241
> >
> > Please note that the above design documents show that the existing Virt=
IO
> > device drivers, and both vring and virtqueue data structures can be
> > preserved
> > while interdomain communication can be performed with no shared memory
> > required
> > for most drivers; (the exceptions where further design is required are
> those
> > such as virtual framebuffer devices where shared memory regions are
> > intentionally
> > added to the communication structure beyond the vrings and virtqueues).
> >
> > An analysis of VirtIO and Argo, informing the design:
> >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+=
Argo+as+a+transport+medium+for+VirtIO
> >
> > * Argo can be used for a communication path for configuration between t=
he
> > backend
> >   and the toolstack, avoiding the need for a dependency on XenStore,
> which
> > is an
> >   advantage for any hypervisor-agnostic design. It is also amenable to =
a
> > notification
> >   mechanism that is not based on Xen event channels.
> >
> > * Argo does not use or require shared memory between VMs and provides a=
n
> > alternative
> >   to the use of foreign shared memory mappings. It avoids some of the
> > complexities
> >   involved with using grants (eg. XSA-300).
> >
> > * Argo supports Mandatory Access Control by the hypervisor, satisfying =
a
> > common
> >   certification requirement.
> >
> > * The Argo headers are BSD-licensed and the Xen hypervisor implementati=
on
> > is GPLv2 but
> >   accessible via the hypercall interface. The licensing should not
> present
> > an obstacle
> >   to adoption of Argo in guest software or implementation by other
> > hypervisors.
> >
> > * Since the interface that Argo presents to a guest VM is similar to
> DMA, a
> > VirtIO-Argo
> >   frontend transport driver should be able to operate with a physical
> > VirtIO-enabled
> >   smart-NIC if the toolstack and an Argo-aware backend provide support.
> >
> > The next Xen Community Call is next week and I would be happy to answer
> > questions
> > about Argo and on this topic. I will also be following this thread.
> >
> > Christopher
> > (Argo maintainer, Xen Community)
> >
> >
> -------------------------------------------------------------------------=
-------
> > [1]
> > An introduction to Argo:
> >
> https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-=
%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
> > https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ
> > Xen Wiki page for Argo:
> >
> https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)=
_for_Xen
> >
> > [2]
> > OpenXT Linux Argo driver and userspace library:
> > https://github.com/openxt/linux-xen-argo
> >
> > Windows V4V at OpenXT wiki:
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/V4V
> > Windows v4v driver source:
> > https://github.com/OpenXT/xc-windows/tree/master/xenv4v
> >
> > HP/Bromium uXen V4V driver:
> > https://github.com/uxen-virt/uxen/tree/ascara/windows/uxenv4vlib
> >
> > [3]
> > v2 of the Argo test unikernel for XTF:
> >
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02234.htm=
l
> >
> > [4]
> > Argo HMX Transport for VirtIO meeting minutes:
> >
> https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.htm=
l
> >
> > VirtIO-Argo Development wiki page:
> >
> https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development+Phase+1
> >
>
>

--000000000000b501cf05cb5d41dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 12:19 AM AKASH=
I Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">takahiro.akash=
i@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Christopher,<br>
<br>
Thank you for your feedback.<br>
<br>
On Mon, Aug 30, 2021 at 12:53:00PM -0700, Christopher Clark wrote:<br>
&gt; [ resending message to ensure delivery to the CCd mailing lists<br>
&gt; post-subscription ]<br>
&gt; <br>
&gt; Apologies for being late to this thread, but I hope to be able to<br>
&gt; contribute to<br>
&gt; this discussion in a meaningful way. I am grateful for the level of<br=
>
&gt; interest in<br>
&gt; this topic. I would like to draw your attention to Argo as a suitable<=
br>
&gt; technology for development of VirtIO&#39;s hypervisor-agnostic interfa=
ces.<br>
&gt; <br>
&gt; * Argo is an interdomain communication mechanism in Xen (on x86 and Ar=
m)<br>
&gt; that<br>
&gt;=C2=A0 =C2=A0can send and receive hypervisor-mediated notifications and=
 messages<br>
&gt; between<br>
&gt;=C2=A0 =C2=A0domains (VMs). [1] The hypervisor can enforce Mandatory Ac=
cess Control<br>
&gt; over<br>
&gt;=C2=A0 =C2=A0all communication between domains. It is derived from the =
earlier v4v,<br>
&gt; which<br>
&gt;=C2=A0 =C2=A0has been deployed on millions of machines with the HP/Brom=
ium uXen<br>
&gt; hypervisor<br>
&gt;=C2=A0 =C2=A0and with OpenXT.<br>
&gt; <br>
&gt; * Argo has a simple interface with a small number of operations that w=
as<br>
&gt;=C2=A0 =C2=A0designed for ease of integration into OS primitives on bot=
h Linux<br>
&gt; (sockets)<br>
&gt;=C2=A0 =C2=A0and Windows (ReadFile/WriteFile) [2].<br>
&gt;=C2=A0 =C2=A0 =C2=A0- A unikernel example of using it has also been dev=
eloped for XTF. [3]<br>
&gt; <br>
&gt; * There has been recent discussion and support in the Xen community fo=
r<br>
&gt; making<br>
&gt;=C2=A0 =C2=A0revisions to the Argo interface to make it hypervisor-agno=
stic, and<br>
&gt; support<br>
&gt;=C2=A0 =C2=A0implementations of Argo on other hypervisors. This will en=
able a single<br>
&gt;=C2=A0 =C2=A0interface for an OS kernel binary to use for inter-VM comm=
unication that<br>
&gt; will<br>
&gt;=C2=A0 =C2=A0work on multiple hypervisors -- this applies equally to bo=
th backends and<br>
&gt;=C2=A0 =C2=A0frontend implementations. [4]<br>
<br>
Regarding virtio-over-Argo, let me ask a few questions:<br>
(In figure &quot;Virtual device buffer access:Virtio+Argo&quot; in [4])<br>=
</blockquote><div><br></div><div>(for ref, this diagram is from this docume=
nt:<br>=C2=A0<a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/1=
348763698">https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698</a>=
 )<br><br>Takahiro, thanks for reading the Virtio-Argo materials.<br><br>So=
me relevant context before answering your questions below: the Argo request=
<br>interface from the hypervisor to a guest, which is currently exposed on=
ly via a<br>dedicated hypercall op, has been discussed within the Xen commu=
nity and is open<br>to being changed in order to better enable support for =
guest VM access to Argo<br>functions in a hypervisor-agnostic way.<br><br>T=
he proposal is to allow hypervisors the option to implement and expose any =
of<br>multiple access mechanisms for Argo, and then enable a guest device d=
river to<br>probe the hypervisor for methods that it is aware of and able t=
o use. The<br>hypercall op is likely to be retained (in some form), and com=
plemented at least<br>on x86 with another interface via MSRs presented to t=
he guests.<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
1) How the configuration is managed?<br>
=C2=A0 =C2=A0On either virtio-mmio or virtio-pci, there always takes place<=
br>
=C2=A0 =C2=A0some negotiation between the FE and BE through the &quot;confi=
guration&quot;<br>
=C2=A0 =C2=A0space. How can this be done in virtio-over-Argo?<br></blockquo=
te><div><br></div><div>Just to be clear about my understanding: your questi=
on, in the context of a<br>Linux kernel virtio device driver implementation=
, is about how a virtio-argo<br>transport driver would implement the get_fe=
atures function of the<br>virtio_config_ops, as a parallel to the work that=
 vp_get_features does for<br>virtio-pci, and vm_get_features does for virti=
o-mmio.<br><br>The design is still open on this and options have been discu=
ssed, including:<br><br>* an extension to Argo to allow the system toolstac=
k (which is responsible for<br>=C2=A0 managing guest VMs and enabling conne=
ctions from front-to-backends)<br>=C2=A0 to manage a table of &quot;implici=
t destinations&quot;, so a guest can transmit Argo<br>=C2=A0 messages to eg=
. &quot;my storage service&quot; port and the hypervisor will deliver it<br=
>=C2=A0 based on a destination table pre-programmed by the toolstack for th=
e VM.<br>=C2=A0 [1]<br>=C2=A0 =C2=A0 =C2=A0- ref: Notes from the December 2=
019 Xen F2F meeting in Cambridge, UK:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0[1] <a =
href=3D"https://lists.archive.carbon60.com/xen/devel/577800#577800">https:/=
/lists.archive.carbon60.com/xen/devel/577800#577800</a><br><br>=C2=A0 So wi=
thin that feature negotiation function, communication with the backend<br>=
=C2=A0 via that Argo channel will occur.<br><br>* IOREQ<br>The Xen IOREQ im=
plementation is not currently appropriate for virtio-argo since<br>it requi=
res the use of foreign memory mappings of frontend memory in the backend<br=
>guest. However, a new HMX interface from the hypervisor could support a ne=
w DMA<br>Device Model Op to allow the backend to request the hypervisor to =
retrieve specified<br>bytes from the frontend guest, which would enable plu=
mbing for device configuration<br>between an IOREQ server (device model bac=
kend implementation) and the guest driver.<br>[2]<br><br>Feature negotiatio=
n in the front end in this case would look very similar to<br>the virtio-mm=
io implementation.<br><br>ref: Argo HMX Transport for VirtIO meeting minute=
s, from January 2021:<br>[2] <a href=3D"https://lists.xenproject.org/archiv=
es/html/xen-devel/2021-02/msg01422.html">https://lists.xenproject.org/archi=
ves/html/xen-devel/2021-02/msg01422.html</a><br><br>* guest ACPI tables tha=
t surface the address of a remote Argo endpoint<br>=C2=A0 on behalf of the =
toolstack, and Argo communication can then negotiate features<br><br>* emul=
ation of a basic PCI device by the hypervisor (though details not determine=
d)<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
2) Do there physically exist virtio&#39;s available/used vrings as well as<=
br>
=C2=A0 =C2=A0descriptors, or are they virtually emulated over Argo (rings)?=
<br></blockquote><div><br></div><div>In short: the latter.<br><br>In the an=
alysis that I did when looking at this, my observation was that each<br>sid=
e (front and backend) should be able to accurately maintain their own local=
<br>copy of the available/used vrings as well as descriptors, and both be k=
ept<br>synchronized by ensuring that updates are transmitted to the other s=
ide when<br>they are written to. eg. As part of this, in the Linux front en=
d implementation<br>the virtqueue_notify function uses a function pointer i=
n the virtqueue that is<br>populated by the transport driver, ie. the virti=
o-argo driver in this case,<br>which can implement the necessary logic to c=
oordinate with the backend.<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
3) The payload in a request will be copied into the receiver&#39;s Argo rin=
g.<br>
=C2=A0 =C2=A0What does the address in a descriptor mean?<br>
=C2=A0 =C2=A0Address/offset in a ring buffer?<br></blockquote><div><br></di=
v><div>Effectively yes. I would treat it as a handle that is used to identi=
fy and<br>retrieve data from messages exchanged between frontend transport =
driver and<br>the backend via Argo rings established for moving data for th=
e data path.<br>In the diagram, those are &quot;Argo ring for reads&quot; a=
nd &quot;Argo ring for writes&quot;.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
4) Estimate of performance or latency?<br></blockquote><div><br></div><div>=
Different access methods to Argo (ie. related to my answer to your question=
 &#39;1)&#39;<br>above --) will have different performance characteristics.=
<br><br>Data copying will necessarily involved for any Hypervisor-Mediated =
data eXchange<br>(HMX) mechanism[1], such as Argo, where there is no shared=
 memory between guest<br>VMs, but the performance profile on modern CPUs wi=
th sizable caches has been<br>demonstrated to be acceptable for the guest v=
irtual device drivers use case in<br>the HP/Bromium vSentry uXen product. T=
he VirtIO structure is somewhat different<br>though.<br><br>Further perform=
ance profiling and measurement will be valuable for enabling<br>tuning of t=
he implementation and development of additional interfaces (eg. such<br>as =
an asynchronous send primitive) - some of this has been discussed and<br>de=
scribed on the VirtIO-Argo-Development-Phase-1 wiki page[2].<br><br>[1]<br>=
<a href=3D"https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Excha=
nge_(HMX)_for_Xen">https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediat=
ed_Exchange_(HMX)_for_Xen</a><br><br>[2]<br><a href=3D"https://openxt.atlas=
sian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Development%3A+Phase+1=
">https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+=
Development%3A+Phase+1</a><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
=C2=A0 =C2=A0It appears that, on FE side, at least three hypervisor calls (=
and data<br>
=C2=A0 =C2=A0copying) need to be invoked at every request, right?<br></bloc=
kquote><div><br></div><div>For a write, counting FE sendv ops:<br>1: the wr=
ite data payload is sent via the &quot;Argo ring for writes&quot;<br>2: the=
 descriptor is sent via a sync of the available/descriptor ring<br>=C2=A0 -=
- is there a third one that I am missing?<br><br>Christopher<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
-Takahiro Akashi<br>
<br>
<br>
&gt; * Here are the design documents for building VirtIO-over-Argo, to supp=
ort a<br>
&gt;=C2=A0 =C2=A0hypervisor-agnostic frontend VirtIO transport driver using=
 Argo.<br>
&gt; <br>
&gt; The Development Plan to build VirtIO virtual device support over Argo<=
br>
&gt; transport:<br>
&gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/169616998=
5/VirtIO-Argo+Development+Phase+1" rel=3D"noreferrer" target=3D"_blank">htt=
ps://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Devel=
opment+Phase+1</a><br>
&gt; <br>
&gt; A design for using VirtIO over Argo, describing how VirtIO data struct=
ures<br>
&gt; and communication is handled over the Argo transport:<br>
&gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/134876369=
8/VirtIO+Argo" rel=3D"noreferrer" target=3D"_blank">https://openxt.atlassia=
n.net/wiki/spaces/DC/pages/1348763698/VirtIO+Argo</a><br>
&gt; <br>
&gt; Diagram (from the above document) showing how VirtIO rings are synchro=
nized<br>
&gt; between domains without using shared memory:<br>
&gt; <a href=3D"https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd437=
7a1194#media-blob-url=3Dtrue&amp;id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&=
amp;collection=3DcontentId-1348763698&amp;contextId=3D1348763698&amp;mimeTy=
pe=3Dimage%2Fpng&amp;name=3Ddevice-buffer-access-virtio-argo.png&amp;size=
=3D243175&amp;width=3D1106&amp;height=3D1241" rel=3D"noreferrer" target=3D"=
_blank">https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#m=
edia-blob-url=3Dtrue&amp;id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&amp;coll=
ection=3DcontentId-1348763698&amp;contextId=3D1348763698&amp;mimeType=3Dima=
ge%2Fpng&amp;name=3Ddevice-buffer-access-virtio-argo.png&amp;size=3D243175&=
amp;width=3D1106&amp;height=3D1241</a><br>
&gt; <br>
&gt; Please note that the above design documents show that the existing Vir=
tIO<br>
&gt; device drivers, and both vring and virtqueue data structures can be<br=
>
&gt; preserved<br>
&gt; while interdomain communication can be performed with no shared memory=
<br>
&gt; required<br>
&gt; for most drivers; (the exceptions where further design is required are=
 those<br>
&gt; such as virtual framebuffer devices where shared memory regions are<br=
>
&gt; intentionally<br>
&gt; added to the communication structure beyond the vrings and virtqueues)=
.<br>
&gt; <br>
&gt; An analysis of VirtIO and Argo, informing the design:<br>
&gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/133342822=
5/Analysis+of+Argo+as+a+transport+medium+for+VirtIO" rel=3D"noreferrer" tar=
get=3D"_blank">https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225=
/Analysis+of+Argo+as+a+transport+medium+for+VirtIO</a><br>
&gt; <br>
&gt; * Argo can be used for a communication path for configuration between =
the<br>
&gt; backend<br>
&gt;=C2=A0 =C2=A0and the toolstack, avoiding the need for a dependency on X=
enStore, which<br>
&gt; is an<br>
&gt;=C2=A0 =C2=A0advantage for any hypervisor-agnostic design. It is also a=
menable to a<br>
&gt; notification<br>
&gt;=C2=A0 =C2=A0mechanism that is not based on Xen event channels.<br>
&gt; <br>
&gt; * Argo does not use or require shared memory between VMs and provides =
an<br>
&gt; alternative<br>
&gt;=C2=A0 =C2=A0to the use of foreign shared memory mappings. It avoids so=
me of the<br>
&gt; complexities<br>
&gt;=C2=A0 =C2=A0involved with using grants (eg. XSA-300).<br>
&gt; <br>
&gt; * Argo supports Mandatory Access Control by the hypervisor, satisfying=
 a<br>
&gt; common<br>
&gt;=C2=A0 =C2=A0certification requirement.<br>
&gt; <br>
&gt; * The Argo headers are BSD-licensed and the Xen hypervisor implementat=
ion<br>
&gt; is GPLv2 but<br>
&gt;=C2=A0 =C2=A0accessible via the hypercall interface. The licensing shou=
ld not present<br>
&gt; an obstacle<br>
&gt;=C2=A0 =C2=A0to adoption of Argo in guest software or implementation by=
 other<br>
&gt; hypervisors.<br>
&gt; <br>
&gt; * Since the interface that Argo presents to a guest VM is similar to D=
MA, a<br>
&gt; VirtIO-Argo<br>
&gt;=C2=A0 =C2=A0frontend transport driver should be able to operate with a=
 physical<br>
&gt; VirtIO-enabled<br>
&gt;=C2=A0 =C2=A0smart-NIC if the toolstack and an Argo-aware backend provi=
de support.<br>
&gt; <br>
&gt; The next Xen Community Call is next week and I would be happy to answe=
r<br>
&gt; questions<br>
&gt; about Argo and on this topic. I will also be following this thread.<br=
>
&gt; <br>
&gt; Christopher<br>
&gt; (Argo maintainer, Xen Community)<br>
&gt; <br>
&gt; ----------------------------------------------------------------------=
----------<br>
&gt; [1]<br>
&gt; An introduction to Argo:<br>
&gt; <a href=3D"https://static.sched.com/hosted_files/xensummit19/92/Argo%2=
0and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019=
.pdf" rel=3D"noreferrer" target=3D"_blank">https://static.sched.com/hosted_=
files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clar=
k%20-%20Xen%20Summit%202019.pdf</a><br>
&gt; <a href=3D"https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ" rel=3D"noref=
errer" target=3D"_blank">https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ</a><=
br>
&gt; Xen Wiki page for Argo:<br>
&gt; <a href=3D"https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_=
Exchange_(HMX)_for_Xen" rel=3D"noreferrer" target=3D"_blank">https://wiki.x=
enproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen</a><br>
&gt; <br>
&gt; [2]<br>
&gt; OpenXT Linux Argo driver and userspace library:<br>
&gt; <a href=3D"https://github.com/openxt/linux-xen-argo" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openxt/linux-xen-argo</a><br>
&gt; <br>
&gt; Windows V4V at OpenXT wiki:<br>
&gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/=
V4V" rel=3D"noreferrer" target=3D"_blank">https://openxt.atlassian.net/wiki=
/spaces/DC/pages/14844007/V4V</a><br>
&gt; Windows v4v driver source:<br>
&gt; <a href=3D"https://github.com/OpenXT/xc-windows/tree/master/xenv4v" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/OpenXT/xc-windows/tre=
e/master/xenv4v</a><br>
&gt; <br>
&gt; HP/Bromium uXen V4V driver:<br>
&gt; <a href=3D"https://github.com/uxen-virt/uxen/tree/ascara/windows/uxenv=
4vlib" rel=3D"noreferrer" target=3D"_blank">https://github.com/uxen-virt/ux=
en/tree/ascara/windows/uxenv4vlib</a><br>
&gt; <br>
&gt; [3]<br>
&gt; v2 of the Argo test unikernel for XTF:<br>
&gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-0=
1/msg02234.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproj=
ect.org/archives/html/xen-devel/2021-01/msg02234.html</a><br>
&gt; <br>
&gt; [4]<br>
&gt; Argo HMX Transport for VirtIO meeting minutes:<br>
&gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-0=
2/msg01422.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproj=
ect.org/archives/html/xen-devel/2021-02/msg01422.html</a><br>
&gt; <br>
&gt; VirtIO-Argo Development wiki page:<br>
&gt; <a href=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/169616998=
5/VirtIO-Argo+Development+Phase+1" rel=3D"noreferrer" target=3D"_blank">htt=
ps://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Devel=
opment+Phase+1</a><br>
&gt; <br><br>
</blockquote></div></div>

--000000000000b501cf05cb5d41dd--

