Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8453FBD30
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 21:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175257.319360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKnLZ-0007QV-TF; Mon, 30 Aug 2021 19:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175257.319360; Mon, 30 Aug 2021 19:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKnLZ-0007Oh-Pm; Mon, 30 Aug 2021 19:53:33 +0000
Received: by outflank-mailman (input) for mailman id 175257;
 Mon, 30 Aug 2021 19:53:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTCi=NV=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mKnLY-0007Ob-Me
 for xen-devel@lists.xen.org; Mon, 30 Aug 2021 19:53:32 +0000
Received: from mail-oi1-x22a.google.com (unknown [2607:f8b0:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7406a6c3-0438-4267-8546-e62c5fabf0fe;
 Mon, 30 Aug 2021 19:53:25 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r26so21663664oij.2
 for <xen-devel@lists.xen.org>; Mon, 30 Aug 2021 12:53:25 -0700 (PDT)
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
X-Inumbo-ID: 7406a6c3-0438-4267-8546-e62c5fabf0fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nRhDwLSy1qySxzUmm/5OTlUq10lpG/9wUZjHFdxCTvs=;
        b=Uh6qKHon9CHxUzu+oFKy1XFLO46tkz/nh9MSd+aYC7uxvncqzHaQYnMJ+ToZytiGj1
         hkZYmnVnz8UcT2+IaQUU9gj1KCGzFLLe3zalQyHoJei2uSDDtZ//dxwJfeoPT2maRq8D
         vduKSyUwOKb6mA9zcOx97UoIpHeKDjJOUQcPlzpHl5/naqc5UFUcEGVVDMQZmU3LmIBB
         O07hkvBsZIj7kUbyzMiGC7TKNFZsYUJgZD4ErCqWZ/ZuLTRwigpVsom8QY1aNbtRcUoB
         JJNcYyueKaYJWgzKtrJYnM6YUJpisAqdAIFnEL4LOWXqdr5KixBZqQqazp+nE2gxbIRs
         gO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nRhDwLSy1qySxzUmm/5OTlUq10lpG/9wUZjHFdxCTvs=;
        b=RLndp++TAYXVk5J+hPHvXOGyYGa7zBuCJrT4YfPzGPP4WWdchas8mJc+vzjmvZYEL+
         fSacDBTqqVUv7Qi/Qk2Kk50ZeTFOH1zNtZPykvpFmXwBNbq9G5+FDxzRTRJxidQMkCRx
         hKoQ6PSiA6qHsFw9ackQDxuaU2Ae8d38+71rzWJz4fcxfBZWn52Cxuvn+5trNWlXP51d
         bJvazFAtE/eZxq6VGVreUwbxzeizAfz5ZiAYjCvaUj1ggMxWXnHfHH1Ey3KWvb7EMIeV
         96zUekLcLHNPMgT9yKqfSQYOO20/k4/SUsyOTBFZsarwrNbS6ivwW0486z72iiEqduxN
         71Sw==
X-Gm-Message-State: AOAM530K6sAwOC7FqYsV0c5jEvEMGcFtJscADJ5nGf8r5TFXr04/mXQn
	kDBGvolKCbTE0aKQK9C7NMRKk9HNIVmAN3VeKsU=
X-Google-Smtp-Source: ABdhPJyNwK42HXnxDbuv/i75RQIcLTiVRll2NVcKx3RFWJKNVCNqafwmFTymAV70+Sku9LsFbJ5gA5mo+tj5mYgbS54=
X-Received: by 2002:a54:4197:: with SMTP id 23mr639595oiy.122.1630353204435;
 Mon, 30 Aug 2021 12:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <20210811062748.GB54169@laputa> <CAPD2p-mMeY=MDbAdLGrmmioSkJo147aMDrK=Qzr=PCa4jztGGg@mail.gmail.com>
 <DB9PR08MB685767CFAA4A8BCE7D2225A89EFD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210817080757.GC43203@laputa> <DB9PR08MB6857C656472153A42FB438C49EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210818053840.GE39588@laputa> <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa> <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CACMJ4GbmNgbB5ponYt3NGEk3j6YCksot+kDy2qs8HMdFXWnQbw@mail.gmail.com>
In-Reply-To: <CACMJ4GbmNgbB5ponYt3NGEk3j6YCksot+kDy2qs8HMdFXWnQbw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 30 Aug 2021 12:53:00 -0700
Message-ID: <CACMJ4GbqPc29n+CAknY4kCjrQnkCSR=W+rymuY7Xa1EZb0MW5w@mail.gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
To: Wei Chen <Wei.Chen@arm.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
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
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: multipart/alternative; boundary="0000000000009be10505cacc2ff7"

--0000000000009be10505cacc2ff7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ resending message to ensure delivery to the CCd mailing lists
post-subscription ]

Apologies for being late to this thread, but I hope to be able to
contribute to
this discussion in a meaningful way. I am grateful for the level of
interest in
this topic. I would like to draw your attention to Argo as a suitable
technology for development of VirtIO's hypervisor-agnostic interfaces.

* Argo is an interdomain communication mechanism in Xen (on x86 and Arm)
that
  can send and receive hypervisor-mediated notifications and messages
between
  domains (VMs). [1] The hypervisor can enforce Mandatory Access Control
over
  all communication between domains. It is derived from the earlier v4v,
which
  has been deployed on millions of machines with the HP/Bromium uXen
hypervisor
  and with OpenXT.

* Argo has a simple interface with a small number of operations that was
  designed for ease of integration into OS primitives on both Linux
(sockets)
  and Windows (ReadFile/WriteFile) [2].
    - A unikernel example of using it has also been developed for XTF. [3]

* There has been recent discussion and support in the Xen community for
making
  revisions to the Argo interface to make it hypervisor-agnostic, and
support
  implementations of Argo on other hypervisors. This will enable a single
  interface for an OS kernel binary to use for inter-VM communication that
will
  work on multiple hypervisors -- this applies equally to both backends and
  frontend implementations. [4]

* Here are the design documents for building VirtIO-over-Argo, to support a
  hypervisor-agnostic frontend VirtIO transport driver using Argo.

The Development Plan to build VirtIO virtual device support over Argo
transport:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+De=
velopment+Phase+1

A design for using VirtIO over Argo, describing how VirtIO data structures
and communication is handled over the Argo transport:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO+Argo

Diagram (from the above document) showing how VirtIO rings are synchronized
between domains without using shared memory:
https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#media-blo=
b-url=3Dtrue&id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&collection=3Dcontent=
Id-1348763698&contextId=3D1348763698&mimeType=3Dimage%2Fpng&name=3Ddevice-b=
uffer-access-virtio-argo.png&size=3D243175&width=3D1106&height=3D1241

Please note that the above design documents show that the existing VirtIO
device drivers, and both vring and virtqueue data structures can be
preserved
while interdomain communication can be performed with no shared memory
required
for most drivers; (the exceptions where further design is required are thos=
e
such as virtual framebuffer devices where shared memory regions are
intentionally
added to the communication structure beyond the vrings and virtqueues).

An analysis of VirtIO and Argo, informing the design:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Ar=
go+as+a+transport+medium+for+VirtIO

* Argo can be used for a communication path for configuration between the
backend
  and the toolstack, avoiding the need for a dependency on XenStore, which
is an
  advantage for any hypervisor-agnostic design. It is also amenable to a
notification
  mechanism that is not based on Xen event channels.

* Argo does not use or require shared memory between VMs and provides an
alternative
  to the use of foreign shared memory mappings. It avoids some of the
complexities
  involved with using grants (eg. XSA-300).

* Argo supports Mandatory Access Control by the hypervisor, satisfying a
common
  certification requirement.

* The Argo headers are BSD-licensed and the Xen hypervisor implementation
is GPLv2 but
  accessible via the hypercall interface. The licensing should not present
an obstacle
  to adoption of Argo in guest software or implementation by other
hypervisors.

* Since the interface that Argo presents to a guest VM is similar to DMA, a
VirtIO-Argo
  frontend transport driver should be able to operate with a physical
VirtIO-enabled
  smart-NIC if the toolstack and an Argo-aware backend provide support.

The next Xen Community Call is next week and I would be happy to answer
questions
about Argo and on this topic. I will also be following this thread.

Christopher
(Argo maintainer, Xen Community)

---------------------------------------------------------------------------=
-----
[1]
An introduction to Argo:
https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-%2=
0OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ
Xen Wiki page for Argo:
https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_f=
or_Xen

[2]
OpenXT Linux Argo driver and userspace library:
https://github.com/openxt/linux-xen-argo

Windows V4V at OpenXT wiki:
https://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/V4V
Windows v4v driver source:
https://github.com/OpenXT/xc-windows/tree/master/xenv4v

HP/Bromium uXen V4V driver:
https://github.com/uxen-virt/uxen/tree/ascara/windows/uxenv4vlib

[3]
v2 of the Argo test unikernel for XTF:
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02234.html

[4]
Argo HMX Transport for VirtIO meeting minutes:
https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.html

VirtIO-Argo Development wiki page:
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+De=
velopment+Phase+1


> On Thu, Aug 26, 2021 at 5:11 AM Wei Chen <Wei.Chen@arm.com> wrote:
>
>> Hi Akashi,
>>
>> > -----Original Message-----
>> > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>> > Sent: 2021=E5=B9=B48=E6=9C=8826=E6=97=A5 17:41
>> > To: Wei Chen <Wei.Chen@arm.com>
>> > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano Stabellini
>> > <sstabellini@kernel.org>; Alex Benn??e <alex.bennee@linaro.org>; Kaly
>> Xin
>> > <Kaly.Xin@arm.com>; Stratos Mailing List <
>> stratos-dev@op-lists.linaro.org>;
>> > virtio-dev@lists.oasis-open.org; Arnd Bergmann <
>> arnd.bergmann@linaro.org>;
>> > Viresh Kumar <viresh.kumar@linaro.org>; Stefano Stabellini
>> > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan Kiszka
>> > <jan.kiszka@siemens.com>; Carl van Schaik <cvanscha@qti.qualcomm.com>;
>> > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.org>; Jean-
>> > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
>> > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
>> > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
>> > <Bertrand.Marquis@arm.com>; Artem Mygaiev <Artem_Mygaiev@epam.com>;
>> Julien
>> > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Paul Durrant
>> > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
>> > Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
>> >
>> > Hi Wei,
>> >
>> > On Fri, Aug 20, 2021 at 03:41:50PM +0900, AKASHI Takahiro wrote:
>> > > On Wed, Aug 18, 2021 at 08:35:51AM +0000, Wei Chen wrote:
>> > > > Hi Akashi=EF=BC=8C
>> > > >
>> > > > > -----Original Message-----
>> > > > > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>> > > > > Sent: 2021=E5=B9=B48=E6=9C=8818=E6=97=A5 13:39
>> > > > > To: Wei Chen <Wei.Chen@arm.com>
>> > > > > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano
>> Stabellini
>> > > > > <sstabellini@kernel.org>; Alex Benn??e <alex.bennee@linaro.org>;
>> > Stratos
>> > > > > Mailing List <stratos-dev@op-lists.linaro.org>; virtio-
>> > dev@lists.oasis-
>> > > > > open.org; Arnd Bergmann <arnd.bergmann@linaro.org>; Viresh Kumar
>> > > > > <viresh.kumar@linaro.org>; Stefano Stabellini
>> > > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan Kiszka
>> > > > > <jan.kiszka@siemens.com>; Carl van Schaik
>> > <cvanscha@qti.qualcomm.com>;
>> > > > > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.org>;
>> > Jean-
>> > > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
>> > > > > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
>> > > > > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
>> > > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev <Artem_Mygaiev@epam.co=
m
>> >;
>> > Julien
>> > > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Paul
>> > Durrant
>> > > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
>> > > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
>> > > > >
>> > > > > On Tue, Aug 17, 2021 at 08:39:09AM +0000, Wei Chen wrote:
>> > > > > > Hi Akashi,
>> > > > > >
>> > > > > > > -----Original Message-----
>> > > > > > > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>> > > > > > > Sent: 2021=E5=B9=B48=E6=9C=8817=E6=97=A5 16:08
>> > > > > > > To: Wei Chen <Wei.Chen@arm.com>
>> > > > > > > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano
>> > Stabellini
>> > > > > > > <sstabellini@kernel.org>; Alex Benn??e <
>> alex.bennee@linaro.org>;
>> > > > > Stratos
>> > > > > > > Mailing List <stratos-dev@op-lists.linaro.org>; virtio-
>> > > > > dev@lists.oasis-
>> > > > > > > open.org; Arnd Bergmann <arnd.bergmann@linaro.org>; Viresh
>> Kumar
>> > > > > > > <viresh.kumar@linaro.org>; Stefano Stabellini
>> > > > > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan
>> Kiszka
>> > > > > > > <jan.kiszka@siemens.com>; Carl van Schaik
>> > <cvanscha@qti.qualcomm.com>;
>> > > > > > > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.or=
g
>> >;
>> > Jean-
>> > > > > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
>> > > > > > > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
>> > > > > > > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
>> > > > > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev
>> > <Artem_Mygaiev@epam.com>;
>> > > > > Julien
>> > > > > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Pau=
l
>> > Durrant
>> > > > > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
>> > > > > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO
>> backends
>> > > > > > >
>> > > > > > > Hi Wei, Oleksandr,
>> > > > > > >
>> > > > > > > On Mon, Aug 16, 2021 at 10:04:03AM +0000, Wei Chen wrote:
>> > > > > > > > Hi All,
>> > > > > > > >
>> > > > > > > > Thanks for Stefano to link my kvmtool for Xen proposal her=
e.
>> > > > > > > > This proposal is still discussing in Xen and KVM
>> communities.
>> > > > > > > > The main work is to decouple the kvmtool from KVM and make
>> > > > > > > > other hypervisors can reuse the virtual device
>> implementations.
>> > > > > > > >
>> > > > > > > > In this case, we need to introduce an intermediate
>> hypervisor
>> > > > > > > > layer for VMM abstraction, Which is, I think it's very clo=
se
>> > > > > > > > to stratos' virtio hypervisor agnosticism work.
>> > > > > > >
>> > > > > > > # My proposal[1] comes from my own idea and doesn't always
>> > represent
>> > > > > > > # Linaro's view on this subject nor reflect Alex's concerns.
>> > > > > Nevertheless,
>> > > > > > >
>> > > > > > > Your idea and my proposal seem to share the same background.
>> > > > > > > Both have the similar goal and currently start with, at firs=
t,
>> > Xen
>> > > > > > > and are based on kvm-tool. (Actually, my work is derived fro=
m
>> > > > > > > EPAM's virtio-disk, which is also based on kvm-tool.)
>> > > > > > >
>> > > > > > > In particular, the abstraction of hypervisor interfaces has =
a
>> > same
>> > > > > > > set of interfaces (for your "struct vmm_impl" and my "RPC
>> > interfaces").
>> > > > > > > This is not co-incident as we both share the same origin as =
I
>> > said
>> > > > > above.
>> > > > > > > And so we will also share the same issues. One of them is a
>> way
>> > of
>> > > > > > > "sharing/mapping FE's memory". There is some trade-off betwe=
en
>> > > > > > > the portability and the performance impact.
>> > > > > > > So we can discuss the topic here in this ML, too.
>> > > > > > > (See Alex's original email, too).
>> > > > > > >
>> > > > > > Yes, I agree.
>> > > > > >
>> > > > > > > On the other hand, my approach aims to create a
>> "single-binary"
>> > > > > solution
>> > > > > > > in which the same binary of BE vm could run on any
>> hypervisors.
>> > > > > > > Somehow similar to your "proposal-#2" in [2], but in my
>> solution,
>> > all
>> > > > > > > the hypervisor-specific code would be put into another entit=
y
>> > (VM),
>> > > > > > > named "virtio-proxy" and the abstracted operations are serve=
d
>> > via RPC.
>> > > > > > > (In this sense, BE is hypervisor-agnostic but might have OS
>> > > > > dependency.)
>> > > > > > > But I know that we need discuss if this is a requirement eve=
n
>> > > > > > > in Stratos project or not. (Maybe not)
>> > > > > > >
>> > > > > >
>> > > > > > Sorry, I haven't had time to finish reading your virtio-proxy
>> > completely
>> > > > > > (I will do it ASAP). But from your description, it seems we
>> need a
>> > > > > > 3rd VM between FE and BE? My concern is that, if my assumption
>> is
>> > right,
>> > > > > > will it increase the latency in data transport path? Even if
>> we're
>> > > > > > using some lightweight guest like RTOS or Unikernel,
>> > > > >
>> > > > > Yes, you're right. But I'm afraid that it is a matter of degree.
>> > > > > As far as we execute 'mapping' operations at every fetch of
>> payload,
>> > > > > we will see latency issue (even in your case) and if we have som=
e
>> > solution
>> > > > > for it, we won't see it neither in my proposal :)
>> > > > >
>> > > >
>> > > > Oleksandr has sent a proposal to Xen mailing list to reduce this
>> kind
>> > > > of "mapping/unmapping" operations. So the latency caused by this
>> > behavior
>> > > > on Xen may eventually be eliminated, and Linux-KVM doesn't have th=
at
>> > problem.
>> > >
>> > > Obviously, I have not yet caught up there in the discussion.
>> > > Which patch specifically?
>> >
>> > Can you give me the link to the discussion or patch, please?
>> >
>>
>> It's a RFC discussion. We have tested this RFC patch internally.
>> https://lists.xenproject.org/archives/html/xen-devel/2021-07/msg01532.ht=
ml
>>
>> > Thanks,
>> > -Takahiro Akashi
>> >
>> > > -Takahiro Akashi
>> > >
>> > > > > > > Specifically speaking about kvm-tool, I have a concern about
>> its
>> > > > > > > license term; Targeting different hypervisors and different
>> OSs
>> > > > > > > (which I assume includes RTOS's), the resultant library shou=
ld
>> > be
>> > > > > > > license permissive and GPL for kvm-tool might be an issue.
>> > > > > > > Any thoughts?
>> > > > > > >
>> > > > > >
>> > > > > > Yes. If user want to implement a FreeBSD device model, but the
>> > virtio
>> > > > > > library is GPL. Then GPL would be a problem. If we have anothe=
r
>> > good
>> > > > > > candidate, I am open to it.
>> > > > >
>> > > > > I have some candidates, particularly for vq/vring, in my mind:
>> > > > > * Open-AMP, or
>> > > > > * corresponding Free-BSD code
>> > > > >
>> > > >
>> > > > Interesting, I will look into them : )
>> > > >
>> > > > Cheers,
>> > > > Wei Chen
>> > > >
>> > > > > -Takahiro Akashi
>> > > > >
>> > > > >
>> > > > > > > -Takahiro Akashi
>> > > > > > >
>> > > > > > >
>> > > > > > > [1] https://op-lists.linaro.org/pipermail/stratos-dev/2021-
>> > > > > > > August/000548.html
>> > > > > > > [2] https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=
=3D2
>> > > > > > >
>> > > > > > > >
>> > > > > > > > > From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> > > > > > > > > Sent: 2021=E5=B9=B48=E6=9C=8814=E6=97=A5 23:38
>> > > > > > > > > To: AKASHI Takahiro <takahiro.akashi@linaro.org>; Stefan=
o
>> > > > > Stabellini
>> > > > > > > <sstabellini@kernel.org>
>> > > > > > > > > Cc: Alex Benn??e <alex.bennee@linaro.org>; Stratos
>> Mailing
>> > List
>> > > > > > > <stratos-dev@op-lists.linaro.org>; virtio-dev@lists.oasis-
>> > open.org;
>> > > > > Arnd
>> > > > > > > Bergmann <arnd.bergmann@linaro.org>; Viresh Kumar
>> > > > > > > <viresh.kumar@linaro.org>; Stefano Stabellini
>> > > > > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan
>> Kiszka
>> > > > > > > <jan.kiszka@siemens.com>; Carl van Schaik
>> > <cvanscha@qti.qualcomm.com>;
>> > > > > > > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.or=
g
>> >;
>> > Jean-
>> > > > > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
>> > > > > > > <mathieu.poirier@linaro.org>; Wei Chen <Wei.Chen@arm.com>;
>> > Oleksandr
>> > > > > > > Tyshchenko <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
>> > > > > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev
>> > <Artem_Mygaiev@epam.com>;
>> > > > > Julien
>> > > > > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Pau=
l
>> > Durrant
>> > > > > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
>> > > > > > > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO
>> > backends
>> > > > > > > > >
>> > > > > > > > > Hello, all.
>> > > > > > > > >
>> > > > > > > > > Please see some comments below. And sorry for the possib=
le
>> > format
>> > > > > > > issues.
>> > > > > > > > >
>> > > > > > > > > > On Wed, Aug 11, 2021 at 9:27 AM AKASHI Takahiro
>> > > > > > > <mailto:takahiro.akashi@linaro.org> wrote:
>> > > > > > > > > > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano
>> > Stabellini
>> > > > > wrote:
>> > > > > > > > > > > CCing people working on Xen+VirtIO and IOREQs. Not
>> > trimming
>> > > > > the
>> > > > > > > original
>> > > > > > > > > > > email to let them read the full context.
>> > > > > > > > > > >
>> > > > > > > > > > > My comments below are related to a potential Xen
>> > > > > implementation,
>> > > > > > > not
>> > > > > > > > > > > because it is the only implementation that matters,
>> but
>> > > > > because it
>> > > > > > > is
>> > > > > > > > > > > the one I know best.
>> > > > > > > > > >
>> > > > > > > > > > Please note that my proposal (and hence the working
>> > prototype)[1]
>> > > > > > > > > > is based on Xen's virtio implementation (i.e. IOREQ) a=
nd
>> > > > > > > particularly
>> > > > > > > > > > EPAM's virtio-disk application (backend server).
>> > > > > > > > > > It has been, I believe, well generalized but is still =
a
>> > bit
>> > > > > biased
>> > > > > > > > > > toward this original design.
>> > > > > > > > > >
>> > > > > > > > > > So I hope you like my approach :)
>> > > > > > > > > >
>> > > > > > > > > > [1] https://op-lists.linaro.org/pipermail/stratos-
>> > dev/2021-
>> > > > > > > August/000546.html
>> > > > > > > > > >
>> > > > > > > > > > Let me take this opportunity to explain a bit more abo=
ut
>> > my
>> > > > > approach
>> > > > > > > below.
>> > > > > > > > > >
>> > > > > > > > > > > Also, please see this relevant email thread:
>> > > > > > > > > > > https://marc.info/?l=3Dxen-devel&m=3D162373754705233=
&w=3D2
>> > > > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > > On Wed, 4 Aug 2021, Alex Benn=C3=A9e wrote:
>> > > > > > > > > > > > Hi,
>> > > > > > > > > > > >
>> > > > > > > > > > > > One of the goals of Project Stratos is to enable
>> > hypervisor
>> > > > > > > agnostic
>> > > > > > > > > > > > backends so we can enable as much re-use of code a=
s
>> > possible
>> > > > > and
>> > > > > > > avoid
>> > > > > > > > > > > > repeating ourselves. This is the flip side of the
>> > front end
>> > > > > > > where
>> > > > > > > > > > > > multiple front-end implementations are required -
>> one
>> > per OS,
>> > > > > > > assuming
>> > > > > > > > > > > > you don't just want Linux guests. The resultant
>> guests
>> > are
>> > > > > > > trivially
>> > > > > > > > > > > > movable between hypervisors modulo any abstracted
>> > paravirt
>> > > > > type
>> > > > > > > > > > > > interfaces.
>> > > > > > > > > > > >
>> > > > > > > > > > > > In my original thumb nail sketch of a solution I
>> > envisioned
>> > > > > > > vhost-user
>> > > > > > > > > > > > daemons running in a broadly POSIX like environmen=
t.
>> > The
>> > > > > > > interface to
>> > > > > > > > > > > > the daemon is fairly simple requiring only some
>> mapped
>> > > > > memory
>> > > > > > > and some
>> > > > > > > > > > > > sort of signalling for events (on Linux this is
>> > eventfd).
>> > > > > The
>> > > > > > > idea was a
>> > > > > > > > > > > > stub binary would be responsible for any hyperviso=
r
>> > specific
>> > > > > > > setup and
>> > > > > > > > > > > > then launch a common binary to deal with the actua=
l
>> > > > > virtqueue
>> > > > > > > requests
>> > > > > > > > > > > > themselves.
>> > > > > > > > > > > >
>> > > > > > > > > > > > Since that original sketch we've seen an expansion
>> in
>> > the
>> > > > > sort
>> > > > > > > of ways
>> > > > > > > > > > > > backends could be created. There is interest in
>> > > > > encapsulating
>> > > > > > > backends
>> > > > > > > > > > > > in RTOSes or unikernels for solutions like SCMI.
>> There
>> > > > > interest
>> > > > > > > in Rust
>> > > > > > > > > > > > has prompted ideas of using the trait interface to
>> > abstract
>> > > > > > > differences
>> > > > > > > > > > > > away as well as the idea of bare-metal Rust
>> backends.
>> > > > > > > > > > > >
>> > > > > > > > > > > > We have a card (STR-12) called "Hypercall
>> > Standardisation"
>> > > > > which
>> > > > > > > > > > > > calls for a description of the APIs needed from th=
e
>> > > > > hypervisor
>> > > > > > > side to
>> > > > > > > > > > > > support VirtIO guests and their backends. However =
we
>> > are
>> > > > > some
>> > > > > > > way off
>> > > > > > > > > > > > from that at the moment as I think we need to at
>> least
>> > > > > > > demonstrate one
>> > > > > > > > > > > > portable backend before we start codifying
>> > requirements. To
>> > > > > that
>> > > > > > > end I
>> > > > > > > > > > > > want to think about what we need for a backend to
>> > function.
>> > > > > > > > > > > >
>> > > > > > > > > > > > Configuration
>> > > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > > > > > > > > > >
>> > > > > > > > > > > > In the type-2 setup this is typically fairly simpl=
e
>> > because
>> > > > > the
>> > > > > > > host
>> > > > > > > > > > > > system can orchestrate the various modules that ma=
ke
>> > up the
>> > > > > > > complete
>> > > > > > > > > > > > system. In the type-1 case (or even type-2 with
>> > delegated
>> > > > > > > service VMs)
>> > > > > > > > > > > > we need some sort of mechanism to inform the backe=
nd
>> > VM
>> > > > > about
>> > > > > > > key
>> > > > > > > > > > > > details about the system:
>> > > > > > > > > > > >
>> > > > > > > > > > > >   - where virt queue memory is in it's address spa=
ce
>> > > > > > > > > > > >   - how it's going to receive (interrupt) and
>> trigger
>> > (kick)
>> > > > > > > events
>> > > > > > > > > > > >   - what (if any) resources the backend needs to
>> > connect to
>> > > > > > > > > > > >
>> > > > > > > > > > > > Obviously you can elide over configuration issues =
by
>> > having
>> > > > > > > static
>> > > > > > > > > > > > configurations and baking the assumptions into you=
r
>> > guest
>> > > > > images
>> > > > > > > however
>> > > > > > > > > > > > this isn't scalable in the long term. The obvious
>> > solution
>> > > > > seems
>> > > > > > > to be
>> > > > > > > > > > > > extending a subset of Device Tree data to user spa=
ce
>> > but
>> > > > > perhaps
>> > > > > > > there
>> > > > > > > > > > > > are other approaches?
>> > > > > > > > > > > >
>> > > > > > > > > > > > Before any virtio transactions can take place the
>> > > > > appropriate
>> > > > > > > memory
>> > > > > > > > > > > > mappings need to be made between the FE guest and
>> the
>> > BE
>> > > > > guest.
>> > > > > > > > > > >
>> > > > > > > > > > > > Currently the whole of the FE guests address space
>> > needs to
>> > > > > be
>> > > > > > > visible
>> > > > > > > > > > > > to whatever is serving the virtio requests. I can
>> > envision 3
>> > > > > > > approaches:
>> > > > > > > > > > > >
>> > > > > > > > > > > >  * BE guest boots with memory already mapped
>> > > > > > > > > > > >
>> > > > > > > > > > > >  This would entail the guest OS knowing where in
>> it's
>> > Guest
>> > > > > > > Physical
>> > > > > > > > > > > >  Address space is already taken up and avoiding
>> > clashing. I
>> > > > > > > would assume
>> > > > > > > > > > > >  in this case you would want a standard interface =
to
>> > > > > userspace
>> > > > > > > to then
>> > > > > > > > > > > >  make that address space visible to the backend
>> daemon.
>> > > > > > > > > >
>> > > > > > > > > > Yet another way here is that we would have well known
>> > "shared
>> > > > > > > memory" between
>> > > > > > > > > > VMs. I think that Jailhouse's ivshmem gives us good
>> > insights on
>> > > > > this
>> > > > > > > matter
>> > > > > > > > > > and that it can even be an alternative for hypervisor-
>> > agnostic
>> > > > > > > solution.
>> > > > > > > > > >
>> > > > > > > > > > (Please note memory regions in ivshmem appear as a PCI
>> > device
>> > > > > and
>> > > > > > > can be
>> > > > > > > > > > mapped locally.)
>> > > > > > > > > >
>> > > > > > > > > > I want to add this shared memory aspect to my
>> virtio-proxy,
>> > but
>> > > > > > > > > > the resultant solution would eventually look similar t=
o
>> > ivshmem.
>> > > > > > > > > >
>> > > > > > > > > > > >  * BE guests boots with a hypervisor handle to
>> memory
>> > > > > > > > > > > >
>> > > > > > > > > > > >  The BE guest is then free to map the FE's memory =
to
>> > where
>> > > > > it
>> > > > > > > wants in
>> > > > > > > > > > > >  the BE's guest physical address space.
>> > > > > > > > > > >
>> > > > > > > > > > > I cannot see how this could work for Xen. There is n=
o
>> > "handle"
>> > > > > to
>> > > > > > > give
>> > > > > > > > > > > to the backend if the backend is not running in dom0=
.
>> So
>> > for
>> > > > > Xen I
>> > > > > > > think
>> > > > > > > > > > > the memory has to be already mapped
>> > > > > > > > > >
>> > > > > > > > > > In Xen's IOREQ solution (virtio-blk), the following
>> > information
>> > > > > is
>> > > > > > > expected
>> > > > > > > > > > to be exposed to BE via Xenstore:
>> > > > > > > > > > (I know that this is a tentative approach though.)
>> > > > > > > > > >    - the start address of configuration space
>> > > > > > > > > >    - interrupt number
>> > > > > > > > > >    - file path for backing storage
>> > > > > > > > > >    - read-only flag
>> > > > > > > > > > And the BE server have to call a particular hypervisor
>> > interface
>> > > > > to
>> > > > > > > > > > map the configuration space.
>> > > > > > > > >
>> > > > > > > > > Yes, Xenstore was chosen as a simple way to pass
>> > configuration
>> > > > > info to
>> > > > > > > the backend running in a non-toolstack domain.
>> > > > > > > > > I remember, there was a wish to avoid using Xenstore in
>> > Virtio
>> > > > > backend
>> > > > > > > itself if possible, so for non-toolstack domain, this could
>> done
>> > with
>> > > > > > > adjusting devd (daemon that listens for devices and launches
>> > backends)
>> > > > > > > > > to read backend configuration from the Xenstore anyway a=
nd
>> > pass it
>> > > > > to
>> > > > > > > the backend via command line arguments.
>> > > > > > > > >
>> > > > > > > >
>> > > > > > > > Yes, in current PoC code we're using xenstore to pass devi=
ce
>> > > > > > > configuration.
>> > > > > > > > We also designed a static device configuration parse metho=
d
>> > for
>> > > > > Dom0less
>> > > > > > > or
>> > > > > > > > other scenarios don't have xentool. yes, it's from device
>> > model
>> > > > > command
>> > > > > > > line
>> > > > > > > > or a config file.
>> > > > > > > >
>> > > > > > > > > But, if ...
>> > > > > > > > >
>> > > > > > > > > >
>> > > > > > > > > > In my approach (virtio-proxy), all those Xen (or
>> > hypervisor)-
>> > > > > > > specific
>> > > > > > > > > > stuffs are contained in virtio-proxy, yet another VM, =
to
>> > hide
>> > > > > all
>> > > > > > > details.
>> > > > > > > > >
>> > > > > > > > > ... the solution how to overcome that is already found a=
nd
>> > proven
>> > > > > to
>> > > > > > > work then even better.
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > > > # My point is that a "handle" is not mandatory for
>> > executing
>> > > > > mapping.
>> > > > > > > > > >
>> > > > > > > > > > > and the mapping probably done by the
>> > > > > > > > > > > toolstack (also see below.) Or we would have to
>> invent a
>> > new
>> > > > > Xen
>> > > > > > > > > > > hypervisor interface and Xen virtual machine
>> privileges
>> > to
>> > > > > allow
>> > > > > > > this
>> > > > > > > > > > > kind of mapping.
>> > > > > > > > > >
>> > > > > > > > > > > If we run the backend in Dom0 that we have no proble=
ms
>> > of
>> > > > > course.
>> > > > > > > > > >
>> > > > > > > > > > One of difficulties on Xen that I found in my approach
>> is
>> > that
>> > > > > > > calling
>> > > > > > > > > > such hypervisor intefaces (registering IOREQ, mapping
>> > memory) is
>> > > > > > > only
>> > > > > > > > > > allowed on BE servers themselvies and so we will have =
to
>> > extend
>> > > > > > > those
>> > > > > > > > > > interfaces.
>> > > > > > > > > > This, however, will raise some concern on security and
>> > privilege
>> > > > > > > distribution
>> > > > > > > > > > as Stefan suggested.
>> > > > > > > > >
>> > > > > > > > > We also faced policy related issues with Virtio backend
>> > running in
>> > > > > > > other than Dom0 domain in a "dummy" xsm mode. In our target
>> > system we
>> > > > > run
>> > > > > > > the backend in a driver
>> > > > > > > > > domain (we call it DomD) where the underlying H/W reside=
s.
>> > We
>> > > > > trust it,
>> > > > > > > so we wrote policy rules (to be used in "flask" xsm mode) to
>> > provide
>> > > > > it
>> > > > > > > with a little bit more privileges than a simple DomU had.
>> > > > > > > > > Now it is permitted to issue device-model, resource and
>> > memory
>> > > > > > > mappings, etc calls.
>> > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > > > To activate the mapping will
>> > > > > > > > > > > >  require some sort of hypercall to the hypervisor.=
 I
>> > can see
>> > > > > two
>> > > > > > > options
>> > > > > > > > > > > >  at this point:
>> > > > > > > > > > > >
>> > > > > > > > > > > >   - expose the handle to userspace for daemon/help=
er
>> > to
>> > > > > trigger
>> > > > > > > the
>> > > > > > > > > > > >     mapping via existing hypercall interfaces. If
>> > using a
>> > > > > helper
>> > > > > > > you
>> > > > > > > > > > > >     would have a hypervisor specific one to avoid
>> the
>> > daemon
>> > > > > > > having to
>> > > > > > > > > > > >     care too much about the details or push that
>> > complexity
>> > > > > into
>> > > > > > > a
>> > > > > > > > > > > >     compile time option for the daemon which would
>> > result in
>> > > > > > > different
>> > > > > > > > > > > >     binaries although a common source base.
>> > > > > > > > > > > >
>> > > > > > > > > > > >   - expose a new kernel ABI to abstract the
>> hypercall
>> > > > > > > differences away
>> > > > > > > > > > > >     in the guest kernel. In this case the userspac=
e
>> > would
>> > > > > > > essentially
>> > > > > > > > > > > >     ask for an abstract "map guest N memory to
>> > userspace
>> > > > > ptr"
>> > > > > > > and let
>> > > > > > > > > > > >     the kernel deal with the different hypercall
>> > interfaces.
>> > > > > > > This of
>> > > > > > > > > > > >     course assumes the majority of BE guests would
>> be
>> > Linux
>> > > > > > > kernels and
>> > > > > > > > > > > >     leaves the bare-metal/unikernel approaches to
>> > their own
>> > > > > > > devices.
>> > > > > > > > > > > >
>> > > > > > > > > > > > Operation
>> > > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > > > > > > > > > >
>> > > > > > > > > > > > The core of the operation of VirtIO is fairly
>> simple.
>> > Once
>> > > > > the
>> > > > > > > > > > > > vhost-user feature negotiation is done it's a case
>> of
>> > > > > receiving
>> > > > > > > update
>> > > > > > > > > > > > events and parsing the resultant virt queue for
>> data.
>> > The
>> > > > > vhost-
>> > > > > > > user
>> > > > > > > > > > > > specification handles a bunch of setup before that
>> > point,
>> > > > > mostly
>> > > > > > > to
>> > > > > > > > > > > > detail where the virt queues are set up FD's for
>> > memory and
>> > > > > > > event
>> > > > > > > > > > > > communication. This is where the envisioned stub
>> > process
>> > > > > would
>> > > > > > > be
>> > > > > > > > > > > > responsible for getting the daemon up and ready to
>> run.
>> > This
>> > > > > is
>> > > > > > > > > > > > currently done inside a big VMM like QEMU but I
>> > suspect a
>> > > > > modern
>> > > > > > > > > > > > approach would be to use the rust-vmm vhost crate.
>> It
>> > would
>> > > > > then
>> > > > > > > either
>> > > > > > > > > > > > communicate with the kernel's abstracted ABI or be
>> re-
>> > > > > targeted
>> > > > > > > as a
>> > > > > > > > > > > > build option for the various hypervisors.
>> > > > > > > > > > >
>> > > > > > > > > > > One thing I mentioned before to Alex is that Xen
>> doesn't
>> > have
>> > > > > VMMs
>> > > > > > > the
>> > > > > > > > > > > way they are typically envisioned and described in
>> other
>> > > > > > > environments.
>> > > > > > > > > > > Instead, Xen has IOREQ servers. Each of them connect=
s
>> > > > > > > independently to
>> > > > > > > > > > > Xen via the IOREQ interface. E.g. today multiple QEM=
Us
>> > could
>> > > > > be
>> > > > > > > used as
>> > > > > > > > > > > emulators for a single Xen VM, each of them connecti=
ng
>> > to Xen
>> > > > > > > > > > > independently via the IOREQ interface.
>> > > > > > > > > > >
>> > > > > > > > > > > The component responsible for starting a daemon and/=
or
>> > setting
>> > > > > up
>> > > > > > > shared
>> > > > > > > > > > > interfaces is the toolstack: the xl command and the
>> > > > > libxl/libxc
>> > > > > > > > > > > libraries.
>> > > > > > > > > >
>> > > > > > > > > > I think that VM configuration management (or
>> orchestration
>> > in
>> > > > > > > Startos
>> > > > > > > > > > jargon?) is a subject to debate in parallel.
>> > > > > > > > > > Otherwise, is there any good assumption to avoid it
>> right
>> > now?
>> > > > > > > > > >
>> > > > > > > > > > > Oleksandr and others I CCed have been working on way=
s
>> > for the
>> > > > > > > toolstack
>> > > > > > > > > > > to create virtio backends and setup memory mappings.
>> > They
>> > > > > might be
>> > > > > > > able
>> > > > > > > > > > > to provide more info on the subject. I do think we
>> miss
>> > a way
>> > > > > to
>> > > > > > > provide
>> > > > > > > > > > > the configuration to the backend and anything else
>> that
>> > the
>> > > > > > > backend
>> > > > > > > > > > > might require to start doing its job.
>> > > > > > > > >
>> > > > > > > > > Yes, some work has been done for the toolstack to handle
>> > Virtio
>> > > > > MMIO
>> > > > > > > devices in
>> > > > > > > > > general and Virtio block devices in particular. However,
>> it
>> > has
>> > > > > not
>> > > > > > > been upstreaned yet.
>> > > > > > > > > Updated patches on review now:
>> > > > > > > > > https://lore.kernel.org/xen-devel/1621626361-29076-1-git=
-
>> > send-
>> > > > > email-
>> > > > > > > olekstysh@gmail.com/
>> > > > > > > > >
>> > > > > > > > > There is an additional (also important) activity to
>> > improve/fix
>> > > > > > > foreign memory mapping on Arm which I am also involved in.
>> > > > > > > > > The foreign memory mapping is proposed to be used for
>> Virtio
>> > > > > backends
>> > > > > > > (device emulators) if there is a need to run guest OS
>> completely
>> > > > > > > unmodified.
>> > > > > > > > > Of course, the more secure way would be to use grant
>> memory
>> > > > > mapping.
>> > > > > > > Brietly, the main difference between them is that with forei=
gn
>> > mapping
>> > > > > the
>> > > > > > > backend
>> > > > > > > > > can map any guest memory it wants to map, but with grant
>> > mapping
>> > > > > it is
>> > > > > > > allowed to map only what was previously granted by the
>> frontend.
>> > > > > > > > >
>> > > > > > > > > So, there might be a problem if we want to pre-map some
>> > guest
>> > > > > memory
>> > > > > > > in advance or to cache mappings in the backend in order to
>> > improve
>> > > > > > > performance (because the mapping/unmapping guest pages every
>> > request
>> > > > > > > requires a lot of back and forth to Xen + P2M updates). In a
>> > nutshell,
>> > > > > > > currently, in order to map a guest page into the backend
>> address
>> > space
>> > > > > we
>> > > > > > > need to steal a real physical page from the backend domain.
>> So,
>> > with
>> > > > > the
>> > > > > > > said optimizations we might end up with no free memory in th=
e
>> > backend
>> > > > > > > domain (see XSA-300). And what we try to achieve is to not
>> waste
>> > a
>> > > > > real
>> > > > > > > domain memory at all by providing safe non-allocated-yet (so
>> > unused)
>> > > > > > > address space for the foreign (and grant) pages to be mapped
>> > into,
>> > > > > this
>> > > > > > > enabling work implies Xen and Linux (and likely DTB bindings=
)
>> > changes.
>> > > > > > > However, as it turned out, for this to work in a proper and
>> safe
>> > way
>> > > > > some
>> > > > > > > prereq work needs to be done.
>> > > > > > > > > You can find the related Xen discussion at:
>> > > > > > > > > https://lore.kernel.org/xen-devel/1627489110-25633-1-git=
-
>> > send-
>> > > > > email-
>> > > > > > > olekstysh@gmail.com/
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > > > One question is how to best handle notification an=
d
>> > kicks.
>> > > > > The
>> > > > > > > existing
>> > > > > > > > > > > > vhost-user framework uses eventfd to signal the
>> daemon
>> > > > > (although
>> > > > > > > QEMU
>> > > > > > > > > > > > is quite capable of simulating them when you use
>> TCG).
>> > Xen
>> > > > > has
>> > > > > > > it's own
>> > > > > > > > > > > > IOREQ mechanism. However latency is an important
>> > factor and
>> > > > > > > having
>> > > > > > > > > > > > events go through the stub would add quite a lot.
>> > > > > > > > > > >
>> > > > > > > > > > > Yeah I think, regardless of anything else, we want t=
he
>> > > > > backends to
>> > > > > > > > > > > connect directly to the Xen hypervisor.
>> > > > > > > > > >
>> > > > > > > > > > In my approach,
>> > > > > > > > > >  a) BE -> FE: interrupts triggered by BE calling a
>> > hypervisor
>> > > > > > > interface
>> > > > > > > > > >               via virtio-proxy
>> > > > > > > > > >  b) FE -> BE: MMIO to config raises events (in event
>> > channels),
>> > > > > > > which is
>> > > > > > > > > >               converted to a callback to BE via virtio=
-
>> > proxy
>> > > > > > > > > >               (Xen's event channel is internnally
>> > implemented by
>> > > > > > > interrupts.)
>> > > > > > > > > >
>> > > > > > > > > > I don't know what "connect directly" means here, but
>> > sending
>> > > > > > > interrupts
>> > > > > > > > > > to the opposite side would be best efficient.
>> > > > > > > > > > Ivshmem, I suppose, takes this approach by utilizing
>> PCI's
>> > msi-x
>> > > > > > > mechanism.
>> > > > > > > > >
>> > > > > > > > > Agree that MSI would be more efficient than SPI...
>> > > > > > > > > At the moment, in order to notify the frontend, the
>> backend
>> > issues
>> > > > > a
>> > > > > > > specific device-model call to query Xen to inject a
>> > corresponding SPI
>> > > > > to
>> > > > > > > the guest.
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > > > Could we consider the kernel internally converting
>> > IOREQ
>> > > > > > > messages from
>> > > > > > > > > > > > the Xen hypervisor to eventfd events? Would this
>> scale
>> > with
>> > > > > > > other kernel
>> > > > > > > > > > > > hypercall interfaces?
>> > > > > > > > > > > >
>> > > > > > > > > > > > So any thoughts on what directions are worth
>> > experimenting
>> > > > > with?
>> > > > > > > > > > >
>> > > > > > > > > > > One option we should consider is for each backend to
>> > connect
>> > > > > to
>> > > > > > > Xen via
>> > > > > > > > > > > the IOREQ interface. We could generalize the IOREQ
>> > interface
>> > > > > and
>> > > > > > > make it
>> > > > > > > > > > > hypervisor agnostic. The interface is really trivial
>> and
>> > easy
>> > > > > to
>> > > > > > > add.
>> > > > > > > > > >
>> > > > > > > > > > As I said above, my proposal does the same thing that
>> you
>> > > > > mentioned
>> > > > > > > here :)
>> > > > > > > > > > The difference is that I do call hypervisor interfaces
>> via
>> > > > > virtio-
>> > > > > > > proxy.
>> > > > > > > > > >
>> > > > > > > > > > > The only Xen-specific part is the notification
>> mechanism,
>> > > > > which is
>> > > > > > > an
>> > > > > > > > > > > event channel. If we replaced the event channel with
>> > something
>> > > > > > > else the
>> > > > > > > > > > > interface would be generic. See:
>> > > > > > > > > > > https://gitlab.com/xen-project/xen/-
>> > > > > > > /blob/staging/xen/include/public/hvm/ioreq.h#L52
>> > > > > > > > > > >
>> > > > > > > > > > > I don't think that translating IOREQs to eventfd in
>> the
>> > kernel
>> > > > > is
>> > > > > > > a
>> > > > > > > > > > > good idea: if feels like it would be extra complexit=
y
>> > and that
>> > > > > the
>> > > > > > > > > > > kernel shouldn't be involved as this is a backend-
>> > hypervisor
>> > > > > > > interface.
>> > > > > > > > > >
>> > > > > > > > > > Given that we may want to implement BE as a bare-metal
>> > > > > application
>> > > > > > > > > > as I did on Zephyr, I don't think that the translation
>> > would not
>> > > > > be
>> > > > > > > > > > a big issue, especially on RTOS's.
>> > > > > > > > > > It will be some kind of abstraction layer of interrupt
>> > handling
>> > > > > > > > > > (or nothing but a callback mechanism).
>> > > > > > > > > >
>> > > > > > > > > > > Also, eventfd is very Linux-centric and we are tryin=
g
>> to
>> > > > > design an
>> > > > > > > > > > > interface that could work well for RTOSes too. If we
>> > want to
>> > > > > do
>> > > > > > > > > > > something different, both OS-agnostic and hypervisor=
-
>> > agnostic,
>> > > > > > > perhaps
>> > > > > > > > > > > we could design a new interface. One that could be
>> > > > > implementable
>> > > > > > > in the
>> > > > > > > > > > > Xen hypervisor itself (like IOREQ) and of course any
>> > other
>> > > > > > > hypervisor
>> > > > > > > > > > > too.
>> > > > > > > > > > >
>> > > > > > > > > > >
>> > > > > > > > > > > There is also another problem. IOREQ is probably not
>> be
>> > the
>> > > > > only
>> > > > > > > > > > > interface needed. Have a look at
>> > > > > > > > > > > https://marc.info/?l=3Dxen-devel&m=3D162373754705233=
&w=3D2.
>> > Don't we
>> > > > > > > also need
>> > > > > > > > > > > an interface for the backend to inject interrupts in=
to
>> > the
>> > > > > > > frontend? And
>> > > > > > > > > > > if the backend requires dynamic memory mappings of
>> > frontend
>> > > > > pages,
>> > > > > > > then
>> > > > > > > > > > > we would also need an interface to map/unmap domU
>> pages.
>> > > > > > > > > >
>> > > > > > > > > > My proposal document might help here; All the interfac=
es
>> > > > > required
>> > > > > > > for
>> > > > > > > > > > virtio-proxy (or hypervisor-related interfaces) are
>> listed
>> > as
>> > > > > > > > > > RPC protocols :)
>> > > > > > > > > >
>> > > > > > > > > > > These interfaces are a lot more problematic than
>> IOREQ:
>> > IOREQ
>> > > > > is
>> > > > > > > tiny
>> > > > > > > > > > > and self-contained. It is easy to add anywhere. A ne=
w
>> > > > > interface to
>> > > > > > > > > > > inject interrupts or map pages is more difficult to
>> > manage
>> > > > > because
>> > > > > > > it
>> > > > > > > > > > > would require changes scattered across the various
>> > emulators.
>> > > > > > > > > >
>> > > > > > > > > > Exactly. I have no confident yet that my approach will
>> > also
>> > > > > apply
>> > > > > > > > > > to other hypervisors than Xen.
>> > > > > > > > > > Technically, yes, but whether people can accept it or
>> not
>> > is a
>> > > > > > > different
>> > > > > > > > > > matter.
>> > > > > > > > > >
>> > > > > > > > > > Thanks,
>> > > > > > > > > > -Takahiro Akashi
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > >
>> > > > > > > > > --
>> > > > > > > > > Regards,
>> > > > > > > > >
>> > > > > > > > > Oleksandr Tyshchenko
>> > > > > > > > IMPORTANT NOTICE: The contents of this email and any
>> > attachments are
>> > > > > > > confidential and may also be privileged. If you are not the
>> > intended
>> > > > > > > recipient, please notify the sender immediately and do not
>> > disclose
>> > > > > the
>> > > > > > > contents to any other person, use it for any purpose, or sto=
re
>> > or copy
>> > > > > the
>> > > > > > > information in any medium. Thank you.
>> > > > > > IMPORTANT NOTICE: The contents of this email and any attachmen=
ts
>> > are
>> > > > > confidential and may also be privileged. If you are not the
>> intended
>> > > > > recipient, please notify the sender immediately and do not
>> disclose
>> > the
>> > > > > contents to any other person, use it for any purpose, or store o=
r
>> > copy the
>> > > > > information in any medium. Thank you.
>> > > > IMPORTANT NOTICE: The contents of this email and any attachments a=
re
>> > confidential and may also be privileged. If you are not the intended
>> > recipient, please notify the sender immediately and do not disclose th=
e
>> > contents to any other person, use it for any purpose, or store or copy
>> the
>> > information in any medium. Thank you.
>> IMPORTANT NOTICE: The contents of this email and any attachments are
>> confidential and may also be privileged. If you are not the intended
>> recipient, please notify the sender immediately and do not disclose the
>> contents to any other person, use it for any purpose, or store or copy t=
he
>> information in any medium. Thank you.
>>
>

--0000000000009be10505cacc2ff7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>[ resending message to ensure delivery to the CCd mai=
ling lists post-subscription ]</div><div><br></div><div dir=3D"ltr">Apologi=
es for being late to this thread, but I hope to be able to contribute to<br=
>this discussion in a meaningful way. I am grateful for the level of intere=
st in<br>this topic. I would like to draw your attention to Argo as a suita=
ble<br>technology for development of VirtIO&#39;s hypervisor-agnostic inter=
faces.<br><br>* Argo is an interdomain communication mechanism in Xen (on x=
86 and Arm) that<br>=C2=A0 can send and receive hypervisor-mediated notific=
ations and messages between<br>=C2=A0 domains (VMs). [1] The hypervisor can=
 enforce Mandatory Access Control over<br>=C2=A0 all communication between =
domains. It is derived from the earlier v4v, which<br>=C2=A0 has been deplo=
yed on millions of machines with the HP/Bromium uXen hypervisor<br>=C2=A0 a=
nd with OpenXT.<br>=C2=A0<br>* Argo has a simple interface with a small num=
ber of operations that was<br>=C2=A0 designed for ease of integration into =
OS primitives on both Linux (sockets)<br>=C2=A0 and Windows (ReadFile/Write=
File) [2].<br>=C2=A0 =C2=A0 - A unikernel example of using it has also been=
 developed for XTF. [3]<br><br>* There has been recent discussion and suppo=
rt in the Xen community for making<br>=C2=A0 revisions to the Argo interfac=
e to make it hypervisor-agnostic, and support<br>=C2=A0 implementations of =
Argo on other hypervisors. This will enable a single<br>=C2=A0 interface fo=
r an OS kernel binary to use for inter-VM communication that will<br>=C2=A0=
 work on multiple hypervisors -- this applies equally to both backends and<=
br>=C2=A0 frontend implementations. [4]<br><br>* Here are the design docume=
nts for building VirtIO-over-Argo, to support a<br>=C2=A0 hypervisor-agnost=
ic frontend VirtIO transport driver using Argo.<br><br>The Development Plan=
 to build VirtIO virtual device support over Argo transport:<br><a href=3D"=
https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+De=
velopment+Phase+1">https://openxt.atlassian.net/wiki/spaces/DC/pages/169616=
9985/VirtIO-Argo+Development+Phase+1</a><br><br>A design for using VirtIO o=
ver Argo, describing how VirtIO data structures<br>and communication is han=
dled over the Argo transport:<br><a href=3D"https://openxt.atlassian.net/wi=
ki/spaces/DC/pages/1348763698/VirtIO+Argo">https://openxt.atlassian.net/wik=
i/spaces/DC/pages/1348763698/VirtIO+Argo</a><br><br>Diagram (from the above=
 document) showing how VirtIO rings are synchronized<br>between domains wit=
hout using shared memory:<br><a href=3D"https://openxt.atlassian.net/46e1c9=
3b-2b87-4cb2-951e-abd4377a1194#media-blob-url=3Dtrue&amp;id=3D01f7d0e1-7686=
-4f0b-88e1-457c1d30df40&amp;collection=3DcontentId-1348763698&amp;contextId=
=3D1348763698&amp;mimeType=3Dimage%2Fpng&amp;name=3Ddevice-buffer-access-vi=
rtio-argo.png&amp;size=3D243175&amp;width=3D1106&amp;height=3D1241">https:/=
/openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#media-blob-url=
=3Dtrue&amp;id=3D01f7d0e1-7686-4f0b-88e1-457c1d30df40&amp;collection=3Dcont=
entId-1348763698&amp;contextId=3D1348763698&amp;mimeType=3Dimage%2Fpng&amp;=
name=3Ddevice-buffer-access-virtio-argo.png&amp;size=3D243175&amp;width=3D1=
106&amp;height=3D1241</a><br><br>Please note that the above design document=
s show that the existing VirtIO<br>device drivers, and both vring and virtq=
ueue data structures can be preserved<br>while interdomain communication ca=
n be performed with no shared memory required<br>for most drivers; (the exc=
eptions where further design is required are those<br>such as virtual frame=
buffer devices where shared memory regions are intentionally<br>added to th=
e communication structure beyond the vrings and virtqueues).<br><br>An anal=
ysis of VirtIO and Argo, informing the design:<br><a href=3D"https://openxt=
.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Argo+as+a+transp=
ort+medium+for+VirtIO">https://openxt.atlassian.net/wiki/spaces/DC/pages/13=
33428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO</a><br><br>* Arg=
o can be used for a communication path for configuration between the backen=
d<br>=C2=A0 and the toolstack, avoiding the need for a dependency on XenSto=
re, which is an<br>=C2=A0 advantage for any hypervisor-agnostic design. It =
is also amenable to a notification<br>=C2=A0 mechanism that is not based on=
 Xen event channels.<br><br>* Argo does not use or require shared memory be=
tween VMs and provides an alternative<br>=C2=A0 to the use of foreign share=
d memory mappings. It avoids some of the complexities<br>=C2=A0 involved wi=
th using grants (eg. XSA-300).<br><br>* Argo supports Mandatory Access Cont=
rol by the hypervisor, satisfying a common<br>=C2=A0 certification requirem=
ent.<br><br>* The Argo headers are BSD-licensed and the Xen hypervisor impl=
ementation is GPLv2 but<br>=C2=A0 accessible via the hypercall interface. T=
he licensing should not present an obstacle<br>=C2=A0 to adoption of Argo i=
n guest software or implementation by other hypervisors.<br><br>* Since the=
 interface that Argo presents to a guest VM is similar to DMA, a VirtIO-Arg=
o<br>=C2=A0 frontend transport driver should be able to operate with a phys=
ical VirtIO-enabled<br>=C2=A0 smart-NIC if the toolstack and an Argo-aware =
backend provide support.<br><br>The next Xen Community Call is next week an=
d I would be happy to answer questions<br>about Argo and on this topic. I w=
ill also be following this thread.<br><br>Christopher<br>(Argo maintainer, =
Xen Community)<br><br>-----------------------------------------------------=
---------------------------<br>[1]<br>An introduction to Argo:<br><a href=
=3D"https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%2=
0-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf">https:=
//static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenX=
T%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf</a><br><a href=3D=
"https://www.youtube.com/watch?v=3DcnC0Tg3jqJQ">https://www.youtube.com/wat=
ch?v=3DcnC0Tg3jqJQ</a><br>Xen Wiki page for Argo:<br><a href=3D"https://wik=
i.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen">htt=
ps://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_=
Xen</a><br><br>[2]<br>OpenXT Linux Argo driver and userspace library:<br><a=
 href=3D"https://github.com/openxt/linux-xen-argo">https://github.com/openx=
t/linux-xen-argo</a><br><br>Windows V4V at OpenXT wiki:<br><a href=3D"https=
://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/V4V">https://openxt.a=
tlassian.net/wiki/spaces/DC/pages/14844007/V4V</a><br>Windows v4v driver so=
urce:<br><a href=3D"https://github.com/OpenXT/xc-windows/tree/master/xenv4v=
">https://github.com/OpenXT/xc-windows/tree/master/xenv4v</a><br><br>HP/Bro=
mium uXen V4V driver:<br><a href=3D"https://github.com/uxen-virt/uxen/tree/=
ascara/windows/uxenv4vlib">https://github.com/uxen-virt/uxen/tree/ascara/wi=
ndows/uxenv4vlib</a><br><br>[3]<br>v2 of the Argo test unikernel for XTF:<b=
r><a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-01/m=
sg02234.html">https://lists.xenproject.org/archives/html/xen-devel/2021-01/=
msg02234.html</a><br><br>[4]<br>Argo HMX Transport for VirtIO meeting minut=
es:<br><a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021=
-02/msg01422.html">https://lists.xenproject.org/archives/html/xen-devel/202=
1-02/msg01422.html</a><br><br>VirtIO-Argo Development wiki page:<br><a href=
=3D"https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Arg=
o+Development+Phase+1">https://openxt.atlassian.net/wiki/spaces/DC/pages/16=
96169985/VirtIO-Argo+Development+Phase+1</a><br></div><div dir=3D"ltr"><br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Aug 26, 2021 at 5:11 AM Wei Chen &lt;<a href=3D"mailto:Wei.Chen@a=
rm.com" target=3D"_blank">Wei.Chen@arm.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Akashi,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org=
" target=3D"_blank">takahiro.akashi@linaro.org</a>&gt;<br>
&gt; Sent: 2021=E5=B9=B48=E6=9C=8826=E6=97=A5 17:41<br>
&gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@arm.com" target=3D"_blank"=
>Wei.Chen@arm.com</a>&gt;<br>
&gt; Cc: Oleksandr Tyshchenko &lt;<a href=3D"mailto:olekstysh@gmail.com" ta=
rget=3D"_blank">olekstysh@gmail.com</a>&gt;; Stefano Stabellini<br>
&gt; &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt;; Alex Benn??e &lt;<a href=3D"mailto:alex.bennee@li=
naro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;; Kaly Xin<br>
&gt; &lt;<a href=3D"mailto:Kaly.Xin@arm.com" target=3D"_blank">Kaly.Xin@arm=
.com</a>&gt;; Stratos Mailing List &lt;<a href=3D"mailto:stratos-dev@op-lis=
ts.linaro.org" target=3D"_blank">stratos-dev@op-lists.linaro.org</a>&gt;;<b=
r>
&gt; <a href=3D"mailto:virtio-dev@lists.oasis-open.org" target=3D"_blank">v=
irtio-dev@lists.oasis-open.org</a>; Arnd Bergmann &lt;<a href=3D"mailto:arn=
d.bergmann@linaro.org" target=3D"_blank">arnd.bergmann@linaro.org</a>&gt;;<=
br>
&gt; Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=3D"=
_blank">viresh.kumar@linaro.org</a>&gt;; Stefano Stabellini<br>
&gt; &lt;<a href=3D"mailto:stefano.stabellini@xilinx.com" target=3D"_blank"=
>stefano.stabellini@xilinx.com</a>&gt;; <a href=3D"mailto:stefanha@redhat.c=
om" target=3D"_blank">stefanha@redhat.com</a>; Jan Kiszka<br>
&gt; &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.ki=
szka@siemens.com</a>&gt;; Carl van Schaik &lt;<a href=3D"mailto:cvanscha@qt=
i.qualcomm.com" target=3D"_blank">cvanscha@qti.qualcomm.com</a>&gt;;<br>
&gt; <a href=3D"mailto:pratikp@quicinc.com" target=3D"_blank">pratikp@quici=
nc.com</a>; Srivatsa Vaddagiri &lt;<a href=3D"mailto:vatsa@codeaurora.org" =
target=3D"_blank">vatsa@codeaurora.org</a>&gt;; Jean-<br>
&gt; Philippe Brucker &lt;<a href=3D"mailto:jean-philippe@linaro.org" targe=
t=3D"_blank">jean-philippe@linaro.org</a>&gt;; Mathieu Poirier<br>
&gt; &lt;<a href=3D"mailto:mathieu.poirier@linaro.org" target=3D"_blank">ma=
thieu.poirier@linaro.org</a>&gt;; Oleksandr Tyshchenko<br>
&gt; &lt;<a href=3D"mailto:Oleksandr_Tyshchenko@epam.com" target=3D"_blank"=
>Oleksandr_Tyshchenko@epam.com</a>&gt;; Bertrand Marquis<br>
&gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank">Bert=
rand.Marquis@arm.com</a>&gt;; Artem Mygaiev &lt;<a href=3D"mailto:Artem_Myg=
aiev@epam.com" target=3D"_blank">Artem_Mygaiev@epam.com</a>&gt;; Julien<br>
&gt; Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@x=
en.org</a>&gt;; Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=
=3D"_blank">jgross@suse.com</a>&gt;; Paul Durrant<br>
&gt; &lt;<a href=3D"mailto:paul@xen.org" target=3D"_blank">paul@xen.org</a>=
&gt;; Xen Devel &lt;<a href=3D"mailto:xen-devel@lists.xen.org" target=3D"_b=
lank">xen-devel@lists.xen.org</a>&gt;<br>
&gt; Subject: Re: Enabling hypervisor agnosticism for VirtIO backends<br>
&gt;<br>
&gt; Hi Wei,<br>
&gt;<br>
&gt; On Fri, Aug 20, 2021 at 03:41:50PM +0900, AKASHI Takahiro wrote:<br>
&gt; &gt; On Wed, Aug 18, 2021 at 08:35:51AM +0000, Wei Chen wrote:<br>
&gt; &gt; &gt; Hi Akashi=EF=BC=8C<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.ak=
ashi@linaro.org" target=3D"_blank">takahiro.akashi@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: 2021=E5=B9=B48=E6=9C=8818=E6=97=A5 13:39<br>
&gt; &gt; &gt; &gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@arm.com" ta=
rget=3D"_blank">Wei.Chen@arm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: Oleksandr Tyshchenko &lt;<a href=3D"mailto:olekstys=
h@gmail.com" target=3D"_blank">olekstysh@gmail.com</a>&gt;; Stefano Stabell=
ini<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a>&gt;; Alex Benn??e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;;<=
br>
&gt; Stratos<br>
&gt; &gt; &gt; &gt; Mailing List &lt;<a href=3D"mailto:stratos-dev@op-lists=
.linaro.org" target=3D"_blank">stratos-dev@op-lists.linaro.org</a>&gt;; vir=
tio-<br>
&gt; dev@lists.oasis-<br>
&gt; &gt; &gt; &gt; <a href=3D"http://open.org" rel=3D"noreferrer" target=
=3D"_blank">open.org</a>; Arnd Bergmann &lt;<a href=3D"mailto:arnd.bergmann=
@linaro.org" target=3D"_blank">arnd.bergmann@linaro.org</a>&gt;; Viresh Kum=
ar<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=
=3D"_blank">viresh.kumar@linaro.org</a>&gt;; Stefano Stabellini<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:stefano.stabellini@xilinx.com" ta=
rget=3D"_blank">stefano.stabellini@xilinx.com</a>&gt;; <a href=3D"mailto:st=
efanha@redhat.com" target=3D"_blank">stefanha@redhat.com</a>; Jan Kiszka<br=
>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D=
"_blank">jan.kiszka@siemens.com</a>&gt;; Carl van Schaik<br>
&gt; &lt;<a href=3D"mailto:cvanscha@qti.qualcomm.com" target=3D"_blank">cva=
nscha@qti.qualcomm.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:pratikp@quicinc.com" target=3D"_blank=
">pratikp@quicinc.com</a>; Srivatsa Vaddagiri &lt;<a href=3D"mailto:vatsa@c=
odeaurora.org" target=3D"_blank">vatsa@codeaurora.org</a>&gt;;<br>
&gt; Jean-<br>
&gt; &gt; &gt; &gt; Philippe Brucker &lt;<a href=3D"mailto:jean-philippe@li=
naro.org" target=3D"_blank">jean-philippe@linaro.org</a>&gt;; Mathieu Poiri=
er<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:mathieu.poirier@linaro.org" targe=
t=3D"_blank">mathieu.poirier@linaro.org</a>&gt;; Oleksandr Tyshchenko<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Oleksandr_Tyshchenko@epam.com" ta=
rget=3D"_blank">Oleksandr_Tyshchenko@epam.com</a>&gt;; Bertrand Marquis<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=
=3D"_blank">Bertrand.Marquis@arm.com</a>&gt;; Artem Mygaiev &lt;<a href=3D"=
mailto:Artem_Mygaiev@epam.com" target=3D"_blank">Artem_Mygaiev@epam.com</a>=
&gt;;<br>
&gt; Julien<br>
&gt; &gt; &gt; &gt; Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_=
blank">julien@xen.org</a>&gt;; Juergen Gross &lt;<a href=3D"mailto:jgross@s=
use.com" target=3D"_blank">jgross@suse.com</a>&gt;; Paul<br>
&gt; Durrant<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:paul@xen.org" target=3D"_blank">p=
aul@xen.org</a>&gt;; Xen Devel &lt;<a href=3D"mailto:xen-devel@lists.xen.or=
g" target=3D"_blank">xen-devel@lists.xen.org</a>&gt;<br>
&gt; &gt; &gt; &gt; Subject: Re: Enabling hypervisor agnosticism for VirtIO=
 backends<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Tue, Aug 17, 2021 at 08:39:09AM +0000, Wei Chen wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; Hi Akashi,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; &gt; &gt; From: AKASHI Takahiro &lt;<a href=3D"mailto:t=
akahiro.akashi@linaro.org" target=3D"_blank">takahiro.akashi@linaro.org</a>=
&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sent: 2021=E5=B9=B48=E6=9C=8817=E6=97=A5 16:0=
8<br>
&gt; &gt; &gt; &gt; &gt; &gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@a=
rm.com" target=3D"_blank">Wei.Chen@arm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cc: Oleksandr Tyshchenko &lt;<a href=3D"mailt=
o:olekstysh@gmail.com" target=3D"_blank">olekstysh@gmail.com</a>&gt;; Stefa=
no<br>
&gt; Stabellini<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:sstabellini@kernel.org"=
 target=3D"_blank">sstabellini@kernel.org</a>&gt;; Alex Benn??e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org=
</a>&gt;;<br>
&gt; &gt; &gt; &gt; Stratos<br>
&gt; &gt; &gt; &gt; &gt; &gt; Mailing List &lt;<a href=3D"mailto:stratos-de=
v@op-lists.linaro.org" target=3D"_blank">stratos-dev@op-lists.linaro.org</a=
>&gt;; virtio-<br>
&gt; &gt; &gt; &gt; dev@lists.oasis-<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://open.org" rel=3D"noreferrer=
" target=3D"_blank">open.org</a>; Arnd Bergmann &lt;<a href=3D"mailto:arnd.=
bergmann@linaro.org" target=3D"_blank">arnd.bergmann@linaro.org</a>&gt;; Vi=
resh Kumar<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:viresh.kumar@linaro.org=
" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;; Stefano Stabellini<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:stefano.stabellini@xili=
nx.com" target=3D"_blank">stefano.stabellini@xilinx.com</a>&gt;; <a href=3D=
"mailto:stefanha@redhat.com" target=3D"_blank">stefanha@redhat.com</a>; Jan=
 Kiszka<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:jan.kiszka@siemens.com"=
 target=3D"_blank">jan.kiszka@siemens.com</a>&gt;; Carl van Schaik<br>
&gt; &lt;<a href=3D"mailto:cvanscha@qti.qualcomm.com" target=3D"_blank">cva=
nscha@qti.qualcomm.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:pratikp@quicinc.com" target=
=3D"_blank">pratikp@quicinc.com</a>; Srivatsa Vaddagiri &lt;<a href=3D"mail=
to:vatsa@codeaurora.org" target=3D"_blank">vatsa@codeaurora.org</a>&gt;;<br=
>
&gt; Jean-<br>
&gt; &gt; &gt; &gt; &gt; &gt; Philippe Brucker &lt;<a href=3D"mailto:jean-p=
hilippe@linaro.org" target=3D"_blank">jean-philippe@linaro.org</a>&gt;; Mat=
hieu Poirier<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:mathieu.poirier@linaro.=
org" target=3D"_blank">mathieu.poirier@linaro.org</a>&gt;; Oleksandr Tyshch=
enko<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Oleksandr_Tyshchenko@ep=
am.com" target=3D"_blank">Oleksandr_Tyshchenko@epam.com</a>&gt;; Bertrand M=
arquis<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.co=
m" target=3D"_blank">Bertrand.Marquis@arm.com</a>&gt;; Artem Mygaiev<br>
&gt; &lt;<a href=3D"mailto:Artem_Mygaiev@epam.com" target=3D"_blank">Artem_=
Mygaiev@epam.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; Julien<br>
&gt; &gt; &gt; &gt; &gt; &gt; Grall &lt;<a href=3D"mailto:julien@xen.org" t=
arget=3D"_blank">julien@xen.org</a>&gt;; Juergen Gross &lt;<a href=3D"mailt=
o:jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt;; Paul<br>
&gt; Durrant<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:paul@xen.org" target=3D=
"_blank">paul@xen.org</a>&gt;; Xen Devel &lt;<a href=3D"mailto:xen-devel@li=
sts.xen.org" target=3D"_blank">xen-devel@lists.xen.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Subject: Re: Enabling hypervisor agnosticism =
for VirtIO backends<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Wei, Oleksandr,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Aug 16, 2021 at 10:04:03AM +0000, Wei=
 Chen wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi All,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks for Stefano to link my kvmtool fo=
r Xen proposal here.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; This proposal is still discussing in Xen=
 and KVM communities.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; The main work is to decouple the kvmtool=
 from KVM and make<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; other hypervisors can reuse the virtual =
device implementations.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; In this case, we need to introduce an in=
termediate hypervisor<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; layer for VMM abstraction, Which is, I t=
hink it&#39;s very close<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; to stratos&#39; virtio hypervisor agnost=
icism work.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; # My proposal[1] comes from my own idea and d=
oesn&#39;t always<br>
&gt; represent<br>
&gt; &gt; &gt; &gt; &gt; &gt; # Linaro&#39;s view on this subject nor refle=
ct Alex&#39;s concerns.<br>
&gt; &gt; &gt; &gt; Nevertheless,<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Your idea and my proposal seem to share the s=
ame background.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Both have the similar goal and currently star=
t with, at first,<br>
&gt; Xen<br>
&gt; &gt; &gt; &gt; &gt; &gt; and are based on kvm-tool. (Actually, my work=
 is derived from<br>
&gt; &gt; &gt; &gt; &gt; &gt; EPAM&#39;s virtio-disk, which is also based o=
n kvm-tool.)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; In particular, the abstraction of hypervisor =
interfaces has a<br>
&gt; same<br>
&gt; &gt; &gt; &gt; &gt; &gt; set of interfaces (for your &quot;struct vmm_=
impl&quot; and my &quot;RPC<br>
&gt; interfaces&quot;).<br>
&gt; &gt; &gt; &gt; &gt; &gt; This is not co-incident as we both share the =
same origin as I<br>
&gt; said<br>
&gt; &gt; &gt; &gt; above.<br>
&gt; &gt; &gt; &gt; &gt; &gt; And so we will also share the same issues. On=
e of them is a way<br>
&gt; of<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;sharing/mapping FE&#39;s memory&quot;. =
There is some trade-off between<br>
&gt; &gt; &gt; &gt; &gt; &gt; the portability and the performance impact.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; So we can discuss the topic here in this ML, =
too.<br>
&gt; &gt; &gt; &gt; &gt; &gt; (See Alex&#39;s original email, too).<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Yes, I agree.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On the other hand, my approach aims to create=
 a &quot;single-binary&quot;<br>
&gt; &gt; &gt; &gt; solution<br>
&gt; &gt; &gt; &gt; &gt; &gt; in which the same binary of BE vm could run o=
n any hypervisors.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Somehow similar to your &quot;proposal-#2&quo=
t; in [2], but in my solution,<br>
&gt; all<br>
&gt; &gt; &gt; &gt; &gt; &gt; the hypervisor-specific code would be put int=
o another entity<br>
&gt; (VM),<br>
&gt; &gt; &gt; &gt; &gt; &gt; named &quot;virtio-proxy&quot; and the abstra=
cted operations are served<br>
&gt; via RPC.<br>
&gt; &gt; &gt; &gt; &gt; &gt; (In this sense, BE is hypervisor-agnostic but=
 might have OS<br>
&gt; &gt; &gt; &gt; dependency.)<br>
&gt; &gt; &gt; &gt; &gt; &gt; But I know that we need discuss if this is a =
requirement even<br>
&gt; &gt; &gt; &gt; &gt; &gt; in Stratos project or not. (Maybe not)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Sorry, I haven&#39;t had time to finish reading yo=
ur virtio-proxy<br>
&gt; completely<br>
&gt; &gt; &gt; &gt; &gt; (I will do it ASAP). But from your description, it=
 seems we need a<br>
&gt; &gt; &gt; &gt; &gt; 3rd VM between FE and BE? My concern is that, if m=
y assumption is<br>
&gt; right,<br>
&gt; &gt; &gt; &gt; &gt; will it increase the latency in data transport pat=
h? Even if we&#39;re<br>
&gt; &gt; &gt; &gt; &gt; using some lightweight guest like RTOS or Unikerne=
l,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Yes, you&#39;re right. But I&#39;m afraid that it is a =
matter of degree.<br>
&gt; &gt; &gt; &gt; As far as we execute &#39;mapping&#39; operations at ev=
ery fetch of payload,<br>
&gt; &gt; &gt; &gt; we will see latency issue (even in your case) and if we=
 have some<br>
&gt; solution<br>
&gt; &gt; &gt; &gt; for it, we won&#39;t see it neither in my proposal :)<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Oleksandr has sent a proposal to Xen mailing list to reduce =
this kind<br>
&gt; &gt; &gt; of &quot;mapping/unmapping&quot; operations. So the latency =
caused by this<br>
&gt; behavior<br>
&gt; &gt; &gt; on Xen may eventually be eliminated, and Linux-KVM doesn&#39=
;t have that<br>
&gt; problem.<br>
&gt; &gt;<br>
&gt; &gt; Obviously, I have not yet caught up there in the discussion.<br>
&gt; &gt; Which patch specifically?<br>
&gt;<br>
&gt; Can you give me the link to the discussion or patch, please?<br>
&gt;<br>
<br>
It&#39;s a RFC discussion. We have tested this RFC patch internally.<br>
<a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2021-07/msg=
01532.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.o=
rg/archives/html/xen-devel/2021-07/msg01532.html</a><br>
<br>
&gt; Thanks,<br>
&gt; -Takahiro Akashi<br>
&gt;<br>
&gt; &gt; -Takahiro Akashi<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Specifically speaking about kvm-tool, I have =
a concern about its<br>
&gt; &gt; &gt; &gt; &gt; &gt; license term; Targeting different hypervisors=
 and different OSs<br>
&gt; &gt; &gt; &gt; &gt; &gt; (which I assume includes RTOS&#39;s), the res=
ultant library should<br>
&gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; license permissive and GPL for kvm-tool might=
 be an issue.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Any thoughts?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Yes. If user want to implement a FreeBSD device mo=
del, but the<br>
&gt; virtio<br>
&gt; &gt; &gt; &gt; &gt; library is GPL. Then GPL would be a problem. If we=
 have another<br>
&gt; good<br>
&gt; &gt; &gt; &gt; &gt; candidate, I am open to it.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I have some candidates, particularly for vq/vring, in m=
y mind:<br>
&gt; &gt; &gt; &gt; * Open-AMP, or<br>
&gt; &gt; &gt; &gt; * corresponding Free-BSD code<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Interesting, I will look into them : )<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; Wei Chen<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -Takahiro Akashi<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -Takahiro Akashi<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; [1] <a href=3D"https://op-lists.linaro.org/pi=
permail/stratos-dev/2021-" rel=3D"noreferrer" target=3D"_blank">https://op-=
lists.linaro.org/pipermail/stratos-dev/2021-</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; August/000548.html<br>
&gt; &gt; &gt; &gt; &gt; &gt; [2] <a href=3D"https://marc.info/?l=3Dxen-dev=
el&amp;m=3D162373754705233&amp;w=3D2" rel=3D"noreferrer" target=3D"_blank">=
https://marc.info/?l=3Dxen-devel&amp;m=3D162373754705233&amp;w=3D2</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; From: Oleksandr Tyshchenko &lt;<a h=
ref=3D"mailto:olekstysh@gmail.com" target=3D"_blank">olekstysh@gmail.com</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Sent: 2021=E5=B9=B48=E6=9C=8814=E6=
=97=A5 23:38<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; To: AKASHI Takahiro &lt;<a href=3D"=
mailto:takahiro.akashi@linaro.org" target=3D"_blank">takahiro.akashi@linaro=
.org</a>&gt;; Stefano<br>
&gt; &gt; &gt; &gt; Stabellini<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:sstabellini@kernel.org"=
 target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Cc: Alex Benn??e &lt;<a href=3D"mai=
lto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt=
;; Stratos Mailing<br>
&gt; List<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:stratos-dev@op-lists.li=
naro.org" target=3D"_blank">stratos-dev@op-lists.linaro.org</a>&gt;; virtio=
-dev@lists.oasis-<br>
&gt; <a href=3D"http://open.org" rel=3D"noreferrer" target=3D"_blank">open.=
org</a>;<br>
&gt; &gt; &gt; &gt; Arnd<br>
&gt; &gt; &gt; &gt; &gt; &gt; Bergmann &lt;<a href=3D"mailto:arnd.bergmann@=
linaro.org" target=3D"_blank">arnd.bergmann@linaro.org</a>&gt;; Viresh Kuma=
r<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:viresh.kumar@linaro.org=
" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;; Stefano Stabellini<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:stefano.stabellini@xili=
nx.com" target=3D"_blank">stefano.stabellini@xilinx.com</a>&gt;; <a href=3D=
"mailto:stefanha@redhat.com" target=3D"_blank">stefanha@redhat.com</a>; Jan=
 Kiszka<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:jan.kiszka@siemens.com"=
 target=3D"_blank">jan.kiszka@siemens.com</a>&gt;; Carl van Schaik<br>
&gt; &lt;<a href=3D"mailto:cvanscha@qti.qualcomm.com" target=3D"_blank">cva=
nscha@qti.qualcomm.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:pratikp@quicinc.com" target=
=3D"_blank">pratikp@quicinc.com</a>; Srivatsa Vaddagiri &lt;<a href=3D"mail=
to:vatsa@codeaurora.org" target=3D"_blank">vatsa@codeaurora.org</a>&gt;;<br=
>
&gt; Jean-<br>
&gt; &gt; &gt; &gt; &gt; &gt; Philippe Brucker &lt;<a href=3D"mailto:jean-p=
hilippe@linaro.org" target=3D"_blank">jean-philippe@linaro.org</a>&gt;; Mat=
hieu Poirier<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:mathieu.poirier@linaro.=
org" target=3D"_blank">mathieu.poirier@linaro.org</a>&gt;; Wei Chen &lt;<a =
href=3D"mailto:Wei.Chen@arm.com" target=3D"_blank">Wei.Chen@arm.com</a>&gt;=
;<br>
&gt; Oleksandr<br>
&gt; &gt; &gt; &gt; &gt; &gt; Tyshchenko &lt;<a href=3D"mailto:Oleksandr_Ty=
shchenko@epam.com" target=3D"_blank">Oleksandr_Tyshchenko@epam.com</a>&gt;;=
 Bertrand Marquis<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.co=
m" target=3D"_blank">Bertrand.Marquis@arm.com</a>&gt;; Artem Mygaiev<br>
&gt; &lt;<a href=3D"mailto:Artem_Mygaiev@epam.com" target=3D"_blank">Artem_=
Mygaiev@epam.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; Julien<br>
&gt; &gt; &gt; &gt; &gt; &gt; Grall &lt;<a href=3D"mailto:julien@xen.org" t=
arget=3D"_blank">julien@xen.org</a>&gt;; Juergen Gross &lt;<a href=3D"mailt=
o:jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt;; Paul<br>
&gt; Durrant<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:paul@xen.org" target=3D=
"_blank">paul@xen.org</a>&gt;; Xen Devel &lt;<a href=3D"mailto:xen-devel@li=
sts.xen.org" target=3D"_blank">xen-devel@lists.xen.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Subject: Re: Enabling hypervisor ag=
nosticism for VirtIO<br>
&gt; backends<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hello, all.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Please see some comments below. And=
 sorry for the possible<br>
&gt; format<br>
&gt; &gt; &gt; &gt; &gt; &gt; issues.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, Aug 11, 2021 at 9:27 A=
M AKASHI Takahiro<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;mailto:<a href=3D"mailto:takahiro.akashi@=
linaro.org" target=3D"_blank">takahiro.akashi@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, Aug 04, 2021 at 12:20:=
01PM -0700, Stefano<br>
&gt; Stabellini<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; CCing people working on X=
en+VirtIO and IOREQs. Not<br>
&gt; trimming<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; original<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; email to let them read th=
e full context.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; My comments below are rel=
ated to a potential Xen<br>
&gt; &gt; &gt; &gt; implementation,<br>
&gt; &gt; &gt; &gt; &gt; &gt; not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; because it is the only im=
plementation that matters, but<br>
&gt; &gt; &gt; &gt; because it<br>
&gt; &gt; &gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the one I know best.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Please note that my proposal (=
and hence the working<br>
&gt; prototype)[1]<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; is based on Xen&#39;s virtio i=
mplementation (i.e. IOREQ) and<br>
&gt; &gt; &gt; &gt; &gt; &gt; particularly<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; EPAM&#39;s virtio-disk applica=
tion (backend server).<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; It has been, I believe, well g=
eneralized but is still a<br>
&gt; bit<br>
&gt; &gt; &gt; &gt; biased<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; toward this original design.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; So I hope you like my approach=
 :)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; [1] <a href=3D"https://op-list=
s.linaro.org/pipermail/stratos-" rel=3D"noreferrer" target=3D"_blank">https=
://op-lists.linaro.org/pipermail/stratos-</a><br>
&gt; dev/2021-<br>
&gt; &gt; &gt; &gt; &gt; &gt; August/000546.html<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Let me take this opportunity t=
o explain a bit more about<br>
&gt; my<br>
&gt; &gt; &gt; &gt; approach<br>
&gt; &gt; &gt; &gt; &gt; &gt; below.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Also, please see this rel=
evant email thread:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://marc.i=
nfo/?l=3Dxen-devel&amp;m=3D162373754705233&amp;w=3D2" rel=3D"noreferrer" ta=
rget=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=3D162373754705233&am=
p;w=3D2</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, 4 Aug 2021, Alex =
Benn=C3=A9e wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; One of the goals of =
Project Stratos is to enable<br>
&gt; hypervisor<br>
&gt; &gt; &gt; &gt; &gt; &gt; agnostic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; backends so we can e=
nable as much re-use of code as<br>
&gt; possible<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; avoid<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; repeating ourselves.=
 This is the flip side of the<br>
&gt; front end<br>
&gt; &gt; &gt; &gt; &gt; &gt; where<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; multiple front-end i=
mplementations are required - one<br>
&gt; per OS,<br>
&gt; &gt; &gt; &gt; &gt; &gt; assuming<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; you don&#39;t just w=
ant Linux guests. The resultant guests<br>
&gt; are<br>
&gt; &gt; &gt; &gt; &gt; &gt; trivially<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; movable between hype=
rvisors modulo any abstracted<br>
&gt; paravirt<br>
&gt; &gt; &gt; &gt; type<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interfaces.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In my original thumb=
 nail sketch of a solution I<br>
&gt; envisioned<br>
&gt; &gt; &gt; &gt; &gt; &gt; vhost-user<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; daemons running in a=
 broadly POSIX like environment.<br>
&gt; The<br>
&gt; &gt; &gt; &gt; &gt; &gt; interface to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the daemon is fairly=
 simple requiring only some mapped<br>
&gt; &gt; &gt; &gt; memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; and some<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; sort of signalling f=
or events (on Linux this is<br>
&gt; eventfd).<br>
&gt; &gt; &gt; &gt; The<br>
&gt; &gt; &gt; &gt; &gt; &gt; idea was a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; stub binary would be=
 responsible for any hypervisor<br>
&gt; specific<br>
&gt; &gt; &gt; &gt; &gt; &gt; setup and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; then launch a common=
 binary to deal with the actual<br>
&gt; &gt; &gt; &gt; virtqueue<br>
&gt; &gt; &gt; &gt; &gt; &gt; requests<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; themselves.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Since that original =
sketch we&#39;ve seen an expansion in<br>
&gt; the<br>
&gt; &gt; &gt; &gt; sort<br>
&gt; &gt; &gt; &gt; &gt; &gt; of ways<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; backends could be cr=
eated. There is interest in<br>
&gt; &gt; &gt; &gt; encapsulating<br>
&gt; &gt; &gt; &gt; &gt; &gt; backends<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; in RTOSes or unikern=
els for solutions like SCMI. There<br>
&gt; &gt; &gt; &gt; interest<br>
&gt; &gt; &gt; &gt; &gt; &gt; in Rust<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; has prompted ideas o=
f using the trait interface to<br>
&gt; abstract<br>
&gt; &gt; &gt; &gt; &gt; &gt; differences<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; away as well as the =
idea of bare-metal Rust backends.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; We have a card (STR-=
12) called &quot;Hypercall<br>
&gt; Standardisation&quot;<br>
&gt; &gt; &gt; &gt; which<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; calls for a descript=
ion of the APIs needed from the<br>
&gt; &gt; &gt; &gt; hypervisor<br>
&gt; &gt; &gt; &gt; &gt; &gt; side to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; support VirtIO guest=
s and their backends. However we<br>
&gt; are<br>
&gt; &gt; &gt; &gt; some<br>
&gt; &gt; &gt; &gt; &gt; &gt; way off<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; from that at the mom=
ent as I think we need to at least<br>
&gt; &gt; &gt; &gt; &gt; &gt; demonstrate one<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; portable backend bef=
ore we start codifying<br>
&gt; requirements. To<br>
&gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; &gt; end I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; want to think about =
what we need for a backend to<br>
&gt; function.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Configuration<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In the type-2 setup =
this is typically fairly simple<br>
&gt; because<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; host<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; system can orchestra=
te the various modules that make<br>
&gt; up the<br>
&gt; &gt; &gt; &gt; &gt; &gt; complete<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; system. In the type-=
1 case (or even type-2 with<br>
&gt; delegated<br>
&gt; &gt; &gt; &gt; &gt; &gt; service VMs)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; we need some sort of=
 mechanism to inform the backend<br>
&gt; VM<br>
&gt; &gt; &gt; &gt; about<br>
&gt; &gt; &gt; &gt; &gt; &gt; key<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; details about the sy=
stem:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- where =
virt queue memory is in it&#39;s address space<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- how it=
&#39;s going to receive (interrupt) and trigger<br>
&gt; (kick)<br>
&gt; &gt; &gt; &gt; &gt; &gt; events<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- what (=
if any) resources the backend needs to<br>
&gt; connect to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Obviously you can el=
ide over configuration issues by<br>
&gt; having<br>
&gt; &gt; &gt; &gt; &gt; &gt; static<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; configurations and b=
aking the assumptions into your<br>
&gt; guest<br>
&gt; &gt; &gt; &gt; images<br>
&gt; &gt; &gt; &gt; &gt; &gt; however<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; this isn&#39;t scala=
ble in the long term. The obvious<br>
&gt; solution<br>
&gt; &gt; &gt; &gt; seems<br>
&gt; &gt; &gt; &gt; &gt; &gt; to be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; extending a subset o=
f Device Tree data to user space<br>
&gt; but<br>
&gt; &gt; &gt; &gt; perhaps<br>
&gt; &gt; &gt; &gt; &gt; &gt; there<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; are other approaches=
?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Before any virtio tr=
ansactions can take place the<br>
&gt; &gt; &gt; &gt; appropriate<br>
&gt; &gt; &gt; &gt; &gt; &gt; memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; mappings need to be =
made between the FE guest and the<br>
&gt; BE<br>
&gt; &gt; &gt; &gt; guest.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Currently the whole =
of the FE guests address space<br>
&gt; needs to<br>
&gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; visible<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to whatever is servi=
ng the virtio requests. I can<br>
&gt; envision 3<br>
&gt; &gt; &gt; &gt; &gt; &gt; approaches:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 * BE guest boo=
ts with memory already mapped<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 This would ent=
ail the guest OS knowing where in it&#39;s<br>
&gt; Guest<br>
&gt; &gt; &gt; &gt; &gt; &gt; Physical<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 Address space =
is already taken up and avoiding<br>
&gt; clashing. I<br>
&gt; &gt; &gt; &gt; &gt; &gt; would assume<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 in this case y=
ou would want a standard interface to<br>
&gt; &gt; &gt; &gt; userspace<br>
&gt; &gt; &gt; &gt; &gt; &gt; to then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 make that addr=
ess space visible to the backend daemon.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Yet another way here is that w=
e would have well known<br>
&gt; &quot;shared<br>
&gt; &gt; &gt; &gt; &gt; &gt; memory&quot; between<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; VMs. I think that Jailhouse&#3=
9;s ivshmem gives us good<br>
&gt; insights on<br>
&gt; &gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; &gt; matter<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and that it can even be an alt=
ernative for hypervisor-<br>
&gt; agnostic<br>
&gt; &gt; &gt; &gt; &gt; &gt; solution.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; (Please note memory regions in=
 ivshmem appear as a PCI<br>
&gt; device<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; can be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; mapped locally.)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I want to add this shared memo=
ry aspect to my virtio-proxy,<br>
&gt; but<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the resultant solution would e=
ventually look similar to<br>
&gt; ivshmem.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 * BE guests bo=
ots with a hypervisor handle to memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 The BE guest i=
s then free to map the FE&#39;s memory to<br>
&gt; where<br>
&gt; &gt; &gt; &gt; it<br>
&gt; &gt; &gt; &gt; &gt; &gt; wants in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 the BE&#39;s g=
uest physical address space.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I cannot see how this cou=
ld work for Xen. There is no<br>
&gt; &quot;handle&quot;<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; give<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to the backend if the bac=
kend is not running in dom0. So<br>
&gt; for<br>
&gt; &gt; &gt; &gt; Xen I<br>
&gt; &gt; &gt; &gt; &gt; &gt; think<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the memory has to be alre=
ady mapped<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In Xen&#39;s IOREQ solution (v=
irtio-blk), the following<br>
&gt; information<br>
&gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; expected<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to be exposed to BE via Xensto=
re:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; (I know that this is a tentati=
ve approach though.)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - the start addre=
ss of configuration space<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - interrupt numbe=
r<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - file path for b=
acking storage<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - read-only flag<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; And the BE server have to call=
 a particular hypervisor<br>
&gt; interface<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; map the configuration space.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Yes, Xenstore was chosen as a simpl=
e way to pass<br>
&gt; configuration<br>
&gt; &gt; &gt; &gt; info to<br>
&gt; &gt; &gt; &gt; &gt; &gt; the backend running in a non-toolstack domain=
.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I remember, there was a wish to avo=
id using Xenstore in<br>
&gt; Virtio<br>
&gt; &gt; &gt; &gt; backend<br>
&gt; &gt; &gt; &gt; &gt; &gt; itself if possible, so for non-toolstack doma=
in, this could done<br>
&gt; with<br>
&gt; &gt; &gt; &gt; &gt; &gt; adjusting devd (daemon that listens for devic=
es and launches<br>
&gt; backends)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to read backend configuration from =
the Xenstore anyway and<br>
&gt; pass it<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; the backend via command line arguments.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Yes, in current PoC code we&#39;re using=
 xenstore to pass device<br>
&gt; &gt; &gt; &gt; &gt; &gt; configuration.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; We also designed a static device configu=
ration parse method<br>
&gt; for<br>
&gt; &gt; &gt; &gt; Dom0less<br>
&gt; &gt; &gt; &gt; &gt; &gt; or<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; other scenarios don&#39;t have xentool. =
yes, it&#39;s from device<br>
&gt; model<br>
&gt; &gt; &gt; &gt; command<br>
&gt; &gt; &gt; &gt; &gt; &gt; line<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; or a config file.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; But, if ...<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In my approach (virtio-proxy),=
 all those Xen (or<br>
&gt; hypervisor)-<br>
&gt; &gt; &gt; &gt; &gt; &gt; specific<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; stuffs are contained in virtio=
-proxy, yet another VM, to<br>
&gt; hide<br>
&gt; &gt; &gt; &gt; all<br>
&gt; &gt; &gt; &gt; &gt; &gt; details.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ... the solution how to overcome th=
at is already found and<br>
&gt; proven<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; work then even better.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; # My point is that a &quot;han=
dle&quot; is not mandatory for<br>
&gt; executing<br>
&gt; &gt; &gt; &gt; mapping.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and the mapping probably =
done by the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; toolstack (also see below=
.) Or we would have to invent a<br>
&gt; new<br>
&gt; &gt; &gt; &gt; Xen<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; hypervisor interface and =
Xen virtual machine privileges<br>
&gt; to<br>
&gt; &gt; &gt; &gt; allow<br>
&gt; &gt; &gt; &gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; kind of mapping.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; If we run the backend in =
Dom0 that we have no problems<br>
&gt; of<br>
&gt; &gt; &gt; &gt; course.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; One of difficulties on Xen tha=
t I found in my approach is<br>
&gt; that<br>
&gt; &gt; &gt; &gt; &gt; &gt; calling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; such hypervisor intefaces (reg=
istering IOREQ, mapping<br>
&gt; memory) is<br>
&gt; &gt; &gt; &gt; &gt; &gt; only<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; allowed on BE servers themselv=
ies and so we will have to<br>
&gt; extend<br>
&gt; &gt; &gt; &gt; &gt; &gt; those<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interfaces.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; This, however, will raise some=
 concern on security and<br>
&gt; privilege<br>
&gt; &gt; &gt; &gt; &gt; &gt; distribution<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; as Stefan suggested.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; We also faced policy related issues=
 with Virtio backend<br>
&gt; running in<br>
&gt; &gt; &gt; &gt; &gt; &gt; other than Dom0 domain in a &quot;dummy&quot;=
 xsm mode. In our target<br>
&gt; system we<br>
&gt; &gt; &gt; &gt; run<br>
&gt; &gt; &gt; &gt; &gt; &gt; the backend in a driver<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; domain (we call it DomD) where the =
underlying H/W resides.<br>
&gt; We<br>
&gt; &gt; &gt; &gt; trust it,<br>
&gt; &gt; &gt; &gt; &gt; &gt; so we wrote policy rules (to be used in &quot=
;flask&quot; xsm mode) to<br>
&gt; provide<br>
&gt; &gt; &gt; &gt; it<br>
&gt; &gt; &gt; &gt; &gt; &gt; with a little bit more privileges than a simp=
le DomU had.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Now it is permitted to issue device=
-model, resource and<br>
&gt; memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; mappings, etc calls.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; To activate the mapp=
ing will<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 require some s=
ort of hypercall to the hypervisor. I<br>
&gt; can see<br>
&gt; &gt; &gt; &gt; two<br>
&gt; &gt; &gt; &gt; &gt; &gt; options<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 at this point:=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- expose=
 the handle to userspace for daemon/helper<br>
&gt; to<br>
&gt; &gt; &gt; &gt; trigger<br>
&gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0m=
apping via existing hypercall interfaces. If<br>
&gt; using a<br>
&gt; &gt; &gt; &gt; helper<br>
&gt; &gt; &gt; &gt; &gt; &gt; you<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0w=
ould have a hypervisor specific one to avoid the<br>
&gt; daemon<br>
&gt; &gt; &gt; &gt; &gt; &gt; having to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c=
are too much about the details or push that<br>
&gt; complexity<br>
&gt; &gt; &gt; &gt; into<br>
&gt; &gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c=
ompile time option for the daemon which would<br>
&gt; result in<br>
&gt; &gt; &gt; &gt; &gt; &gt; different<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b=
inaries although a common source base.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0- expose=
 a new kernel ABI to abstract the hypercall<br>
&gt; &gt; &gt; &gt; &gt; &gt; differences away<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0i=
n the guest kernel. In this case the userspace<br>
&gt; would<br>
&gt; &gt; &gt; &gt; &gt; &gt; essentially<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a=
sk for an abstract &quot;map guest N memory to<br>
&gt; userspace<br>
&gt; &gt; &gt; &gt; ptr&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; and let<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0t=
he kernel deal with the different hypercall<br>
&gt; interfaces.<br>
&gt; &gt; &gt; &gt; &gt; &gt; This of<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c=
ourse assumes the majority of BE guests would be<br>
&gt; Linux<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernels and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0l=
eaves the bare-metal/unikernel approaches to<br>
&gt; their own<br>
&gt; &gt; &gt; &gt; &gt; &gt; devices.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Operation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; =3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The core of the oper=
ation of VirtIO is fairly simple.<br>
&gt; Once<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; vhost-user feature n=
egotiation is done it&#39;s a case of<br>
&gt; &gt; &gt; &gt; receiving<br>
&gt; &gt; &gt; &gt; &gt; &gt; update<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; events and parsing t=
he resultant virt queue for data.<br>
&gt; The<br>
&gt; &gt; &gt; &gt; vhost-<br>
&gt; &gt; &gt; &gt; &gt; &gt; user<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; specification handle=
s a bunch of setup before that<br>
&gt; point,<br>
&gt; &gt; &gt; &gt; mostly<br>
&gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; detail where the vir=
t queues are set up FD&#39;s for<br>
&gt; memory and<br>
&gt; &gt; &gt; &gt; &gt; &gt; event<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; communication. This =
is where the envisioned stub<br>
&gt; process<br>
&gt; &gt; &gt; &gt; would<br>
&gt; &gt; &gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; responsible for gett=
ing the daemon up and ready to run.<br>
&gt; This<br>
&gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; currently done insid=
e a big VMM like QEMU but I<br>
&gt; suspect a<br>
&gt; &gt; &gt; &gt; modern<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; approach would be to=
 use the rust-vmm vhost crate. It<br>
&gt; would<br>
&gt; &gt; &gt; &gt; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; either<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; communicate with the=
 kernel&#39;s abstracted ABI or be re-<br>
&gt; &gt; &gt; &gt; targeted<br>
&gt; &gt; &gt; &gt; &gt; &gt; as a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; build option for the=
 various hypervisors.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; One thing I mentioned bef=
ore to Alex is that Xen doesn&#39;t<br>
&gt; have<br>
&gt; &gt; &gt; &gt; VMMs<br>
&gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; way they are typically en=
visioned and described in other<br>
&gt; &gt; &gt; &gt; &gt; &gt; environments.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Instead, Xen has IOREQ se=
rvers. Each of them connects<br>
&gt; &gt; &gt; &gt; &gt; &gt; independently to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Xen via the IOREQ interfa=
ce. E.g. today multiple QEMUs<br>
&gt; could<br>
&gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; used as<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; emulators for a single Xe=
n VM, each of them connecting<br>
&gt; to Xen<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; independently via the IOR=
EQ interface.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The component responsible=
 for starting a daemon and/or<br>
&gt; setting<br>
&gt; &gt; &gt; &gt; up<br>
&gt; &gt; &gt; &gt; &gt; &gt; shared<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interfaces is the toolsta=
ck: the xl command and the<br>
&gt; &gt; &gt; &gt; libxl/libxc<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; libraries.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I think that VM configuration =
management (or orchestration<br>
&gt; in<br>
&gt; &gt; &gt; &gt; &gt; &gt; Startos<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; jargon?) is a subject to debat=
e in parallel.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Otherwise, is there any good a=
ssumption to avoid it right<br>
&gt; now?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Oleksandr and others I CC=
ed have been working on ways<br>
&gt; for the<br>
&gt; &gt; &gt; &gt; &gt; &gt; toolstack<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to create virtio backends=
 and setup memory mappings.<br>
&gt; They<br>
&gt; &gt; &gt; &gt; might be<br>
&gt; &gt; &gt; &gt; &gt; &gt; able<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to provide more info on t=
he subject. I do think we miss<br>
&gt; a way<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; provide<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the configuration to the =
backend and anything else that<br>
&gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; backend<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; might require to start do=
ing its job.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Yes, some work has been done for th=
e toolstack to handle<br>
&gt; Virtio<br>
&gt; &gt; &gt; &gt; MMIO<br>
&gt; &gt; &gt; &gt; &gt; &gt; devices in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; general and Virtio block devices in=
 particular. However, it<br>
&gt; has<br>
&gt; &gt; &gt; &gt; not<br>
&gt; &gt; &gt; &gt; &gt; &gt; been upstreaned yet.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Updated patches on review now:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lore.kernel.org/=
xen-devel/1621626361-29076-1-git-" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lore.kernel.org/xen-devel/1621626361-29076-1-git-</a><br>
&gt; send-<br>
&gt; &gt; &gt; &gt; email-<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://olekstysh@gmail.com/" rel=
=3D"noreferrer" target=3D"_blank">olekstysh@gmail.com/</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; There is an additional (also import=
ant) activity to<br>
&gt; improve/fix<br>
&gt; &gt; &gt; &gt; &gt; &gt; foreign memory mapping on Arm which I am also=
 involved in.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The foreign memory mapping is propo=
sed to be used for Virtio<br>
&gt; &gt; &gt; &gt; backends<br>
&gt; &gt; &gt; &gt; &gt; &gt; (device emulators) if there is a need to run =
guest OS completely<br>
&gt; &gt; &gt; &gt; &gt; &gt; unmodified.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Of course, the more secure way woul=
d be to use grant memory<br>
&gt; &gt; &gt; &gt; mapping.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Brietly, the main difference between them is =
that with foreign<br>
&gt; mapping<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; backend<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; can map any guest memory it wants t=
o map, but with grant<br>
&gt; mapping<br>
&gt; &gt; &gt; &gt; it is<br>
&gt; &gt; &gt; &gt; &gt; &gt; allowed to map only what was previously grant=
ed by the frontend.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; So, there might be a problem if we =
want to pre-map some<br>
&gt; guest<br>
&gt; &gt; &gt; &gt; memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; in advance or to cache mappings in the backen=
d in order to<br>
&gt; improve<br>
&gt; &gt; &gt; &gt; &gt; &gt; performance (because the mapping/unmapping gu=
est pages every<br>
&gt; request<br>
&gt; &gt; &gt; &gt; &gt; &gt; requires a lot of back and forth to Xen + P2M=
 updates). In a<br>
&gt; nutshell,<br>
&gt; &gt; &gt; &gt; &gt; &gt; currently, in order to map a guest page into =
the backend address<br>
&gt; space<br>
&gt; &gt; &gt; &gt; we<br>
&gt; &gt; &gt; &gt; &gt; &gt; need to steal a real physical page from the b=
ackend domain. So,<br>
&gt; with<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; said optimizations we might end up with no fr=
ee memory in the<br>
&gt; backend<br>
&gt; &gt; &gt; &gt; &gt; &gt; domain (see XSA-300). And what we try to achi=
eve is to not waste<br>
&gt; a<br>
&gt; &gt; &gt; &gt; real<br>
&gt; &gt; &gt; &gt; &gt; &gt; domain memory at all by providing safe non-al=
located-yet (so<br>
&gt; unused)<br>
&gt; &gt; &gt; &gt; &gt; &gt; address space for the foreign (and grant) pag=
es to be mapped<br>
&gt; into,<br>
&gt; &gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; &gt; enabling work implies Xen and Linux (and like=
ly DTB bindings)<br>
&gt; changes.<br>
&gt; &gt; &gt; &gt; &gt; &gt; However, as it turned out, for this to work i=
n a proper and safe<br>
&gt; way<br>
&gt; &gt; &gt; &gt; some<br>
&gt; &gt; &gt; &gt; &gt; &gt; prereq work needs to be done.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; You can find the related Xen discus=
sion at:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lore.kernel.org/=
xen-devel/1627489110-25633-1-git-" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lore.kernel.org/xen-devel/1627489110-25633-1-git-</a><br>
&gt; send-<br>
&gt; &gt; &gt; &gt; email-<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://olekstysh@gmail.com/" rel=
=3D"noreferrer" target=3D"_blank">olekstysh@gmail.com/</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; One question is how =
to best handle notification and<br>
&gt; kicks.<br>
&gt; &gt; &gt; &gt; The<br>
&gt; &gt; &gt; &gt; &gt; &gt; existing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; vhost-user framework=
 uses eventfd to signal the daemon<br>
&gt; &gt; &gt; &gt; (although<br>
&gt; &gt; &gt; &gt; &gt; &gt; QEMU<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; is quite capable of =
simulating them when you use TCG).<br>
&gt; Xen<br>
&gt; &gt; &gt; &gt; has<br>
&gt; &gt; &gt; &gt; &gt; &gt; it&#39;s own<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; IOREQ mechanism. How=
ever latency is an important<br>
&gt; factor and<br>
&gt; &gt; &gt; &gt; &gt; &gt; having<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; events go through th=
e stub would add quite a lot.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Yeah I think, regardless =
of anything else, we want the<br>
&gt; &gt; &gt; &gt; backends to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; connect directly to the X=
en hypervisor.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; In my approach,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 a) BE -&gt; FE: interrup=
ts triggered by BE calling a<br>
&gt; hypervisor<br>
&gt; &gt; &gt; &gt; &gt; &gt; interface<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0via virtio-proxy<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 b) FE -&gt; BE: MMIO to =
config raises events (in event<br>
&gt; channels),<br>
&gt; &gt; &gt; &gt; &gt; &gt; which is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0converted to a callback to BE via virtio-<br>
&gt; proxy<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(Xen&#39;s event channel is internnally<br>
&gt; implemented by<br>
&gt; &gt; &gt; &gt; &gt; &gt; interrupts.)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I don&#39;t know what &quot;co=
nnect directly&quot; means here, but<br>
&gt; sending<br>
&gt; &gt; &gt; &gt; &gt; &gt; interrupts<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to the opposite side would be =
best efficient.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Ivshmem, I suppose, takes this=
 approach by utilizing PCI&#39;s<br>
&gt; msi-x<br>
&gt; &gt; &gt; &gt; &gt; &gt; mechanism.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Agree that MSI would be more effici=
ent than SPI...<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; At the moment, in order to notify t=
he frontend, the backend<br>
&gt; issues<br>
&gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; specific device-model call to query Xen to in=
ject a<br>
&gt; corresponding SPI<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; the guest.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Could we consider th=
e kernel internally converting<br>
&gt; IOREQ<br>
&gt; &gt; &gt; &gt; &gt; &gt; messages from<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the Xen hypervisor t=
o eventfd events? Would this scale<br>
&gt; with<br>
&gt; &gt; &gt; &gt; &gt; &gt; other kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; hypercall interfaces=
?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; So any thoughts on w=
hat directions are worth<br>
&gt; experimenting<br>
&gt; &gt; &gt; &gt; with?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; One option we should cons=
ider is for each backend to<br>
&gt; connect<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; Xen via<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the IOREQ interface. We c=
ould generalize the IOREQ<br>
&gt; interface<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; make it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; hypervisor agnostic. The =
interface is really trivial and<br>
&gt; easy<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; add.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; As I said above, my proposal d=
oes the same thing that you<br>
&gt; &gt; &gt; &gt; mentioned<br>
&gt; &gt; &gt; &gt; &gt; &gt; here :)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The difference is that I do ca=
ll hypervisor interfaces via<br>
&gt; &gt; &gt; &gt; virtio-<br>
&gt; &gt; &gt; &gt; &gt; &gt; proxy.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The only Xen-specific par=
t is the notification mechanism,<br>
&gt; &gt; &gt; &gt; which is<br>
&gt; &gt; &gt; &gt; &gt; &gt; an<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; event channel. If we repl=
aced the event channel with<br>
&gt; something<br>
&gt; &gt; &gt; &gt; &gt; &gt; else the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interface would be generi=
c. See:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://gitlab=
.com/xen-project/xen/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/xen-project/xen/-</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; /blob/staging/xen/include/public/hvm/ioreq.h#=
L52<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I don&#39;t think that tr=
anslating IOREQs to eventfd in the<br>
&gt; kernel<br>
&gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; good idea: if feels like =
it would be extra complexity<br>
&gt; and that<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel shouldn&#39;t be i=
nvolved as this is a backend-<br>
&gt; hypervisor<br>
&gt; &gt; &gt; &gt; &gt; &gt; interface.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Given that we may want to impl=
ement BE as a bare-metal<br>
&gt; &gt; &gt; &gt; application<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; as I did on Zephyr, I don&#39;=
t think that the translation<br>
&gt; would not<br>
&gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; a big issue, especially on RTO=
S&#39;s.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; It will be some kind of abstra=
ction layer of interrupt<br>
&gt; handling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; (or nothing but a callback mec=
hanism).<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Also, eventfd is very Lin=
ux-centric and we are trying to<br>
&gt; &gt; &gt; &gt; design an<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interface that could work=
 well for RTOSes too. If we<br>
&gt; want to<br>
&gt; &gt; &gt; &gt; do<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; something different, both=
 OS-agnostic and hypervisor-<br>
&gt; agnostic,<br>
&gt; &gt; &gt; &gt; &gt; &gt; perhaps<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; we could design a new int=
erface. One that could be<br>
&gt; &gt; &gt; &gt; implementable<br>
&gt; &gt; &gt; &gt; &gt; &gt; in the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Xen hypervisor itself (li=
ke IOREQ) and of course any<br>
&gt; other<br>
&gt; &gt; &gt; &gt; &gt; &gt; hypervisor<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; too.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; There is also another pro=
blem. IOREQ is probably not be<br>
&gt; the<br>
&gt; &gt; &gt; &gt; only<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; interface needed. Have a =
look at<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://marc.i=
nfo/?l=3Dxen-devel&amp;m=3D162373754705233&amp;w=3D2" rel=3D"noreferrer" ta=
rget=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=3D162373754705233&am=
p;w=3D2</a>.<br>
&gt; Don&#39;t we<br>
&gt; &gt; &gt; &gt; &gt; &gt; also need<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; an interface for the back=
end to inject interrupts into<br>
&gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; frontend? And<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; if the backend requires d=
ynamic memory mappings of<br>
&gt; frontend<br>
&gt; &gt; &gt; &gt; pages,<br>
&gt; &gt; &gt; &gt; &gt; &gt; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; we would also need an int=
erface to map/unmap domU pages.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; My proposal document might hel=
p here; All the interfaces<br>
&gt; &gt; &gt; &gt; required<br>
&gt; &gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; virtio-proxy (or hypervisor-re=
lated interfaces) are listed<br>
&gt; as<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; RPC protocols :)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; These interfaces are a lo=
t more problematic than IOREQ:<br>
&gt; IOREQ<br>
&gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; tiny<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and self-contained. It is=
 easy to add anywhere. A new<br>
&gt; &gt; &gt; &gt; interface to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; inject interrupts or map =
pages is more difficult to<br>
&gt; manage<br>
&gt; &gt; &gt; &gt; because<br>
&gt; &gt; &gt; &gt; &gt; &gt; it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; would require changes sca=
ttered across the various<br>
&gt; emulators.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Exactly. I have no confident y=
et that my approach will<br>
&gt; also<br>
&gt; &gt; &gt; &gt; apply<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to other hypervisors than Xen.=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Technically, yes, but whether =
people can accept it or not<br>
&gt; is a<br>
&gt; &gt; &gt; &gt; &gt; &gt; different<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; matter.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -Takahiro Akashi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Oleksandr Tyshchenko<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; IMPORTANT NOTICE: The contents of this e=
mail and any<br>
&gt; attachments are<br>
&gt; &gt; &gt; &gt; &gt; &gt; confidential and may also be privileged. If y=
ou are not the<br>
&gt; intended<br>
&gt; &gt; &gt; &gt; &gt; &gt; recipient, please notify the sender immediate=
ly and do not<br>
&gt; disclose<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; contents to any other person, use it for any =
purpose, or store<br>
&gt; or copy<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; information in any medium. Thank you.<br>
&gt; &gt; &gt; &gt; &gt; IMPORTANT NOTICE: The contents of this email and a=
ny attachments<br>
&gt; are<br>
&gt; &gt; &gt; &gt; confidential and may also be privileged. If you are not=
 the intended<br>
&gt; &gt; &gt; &gt; recipient, please notify the sender immediately and do =
not disclose<br>
&gt; the<br>
&gt; &gt; &gt; &gt; contents to any other person, use it for any purpose, o=
r store or<br>
&gt; copy the<br>
&gt; &gt; &gt; &gt; information in any medium. Thank you.<br>
&gt; &gt; &gt; IMPORTANT NOTICE: The contents of this email and any attachm=
ents are<br>
&gt; confidential and may also be privileged. If you are not the intended<b=
r>
&gt; recipient, please notify the sender immediately and do not disclose th=
e<br>
&gt; contents to any other person, use it for any purpose, or store or copy=
 the<br>
&gt; information in any medium. Thank you.<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div>
</blockquote></div></div>

--0000000000009be10505cacc2ff7--

