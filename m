Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25D4065E3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 05:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183920.332321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWxf-0003Fo-Lu; Fri, 10 Sep 2021 03:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183920.332321; Fri, 10 Sep 2021 03:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWxf-0003Dy-Ii; Fri, 10 Sep 2021 03:12:19 +0000
Received: by outflank-mailman (input) for mailman id 183920;
 Fri, 10 Sep 2021 03:12:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOxz=OA=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mOWxe-0003Dk-3l
 for xen-devel@lists.xen.org; Fri, 10 Sep 2021 03:12:18 +0000
Received: from mail-pg1-x530.google.com (unknown [2607:f8b0:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d57cb65-bec4-41f7-b946-12b3bc5dc6c5;
 Fri, 10 Sep 2021 03:12:15 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id e7so572353pgk.2
 for <xen-devel@lists.xen.org>; Thu, 09 Sep 2021 20:12:15 -0700 (PDT)
Received: from laputa (p784a2304.tkyea130.ap.so-net.ne.jp. [120.74.35.4])
 by smtp.gmail.com with ESMTPSA id q20sm4099969pgu.31.2021.09.09.20.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 20:12:14 -0700 (PDT)
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
X-Inumbo-ID: 4d57cb65-bec4-41f7-b946-12b3bc5dc6c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qYylmtiStGmWtWp49euWoU9YAeVO7de/oFQa51IHGW4=;
        b=KkVLB5TEqB3KRMw/FCvWsmuSOxEmwy8d+KtK0LOjbGHlOHAEU7OVzEQAhM6pfc1QEH
         KvIFV2XJNmeQbOSao9dlRcfvnF32to+MF3uwDH5IwlbwqLkEVqam97gVkVSTARHtbqvA
         foUk9Wvoi/DKISX9iB1vyRZ/TS/HqO/h/6WSEUmPQoQ0A5amlPkOMpXzKjESaB7zAszW
         mVOHprBKMX4JXDeD2MY0AfEPwyZsb4MUQ5ulK2aiQcwnvi7lsjsaDQbCYdNp/BcLfqk6
         M+VFSzbGDkMx/5Pk4ELJg0NVMET+MMZG2wHenO23PoSDt+/rCcAFZCZ8vIw6vOjj77Zq
         ZKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qYylmtiStGmWtWp49euWoU9YAeVO7de/oFQa51IHGW4=;
        b=ULQFPTohneujaO6W9hZIB3kZpBNFUGIkSxJRxLxL8WAB2PpIEgj+1YXvEQ2xE24iqw
         aaAlqva9XwpMdo3+cCfsbpf2oGYIdNOlLEGI/+hXhanKuZZcSlmvlf2q8Zcl/TjXeigG
         xMOJU5FHEbKvWpJKw2gk7KSgrwU8Tf0C9U0j6yTQK0XtMHYIE2KJmSMZBa6urMsG0fX0
         DrsOAVxnvECXX3wZXWq+cY79n+bavss7+5/R4kbGR8++IU+bWhmgI/OE5NbedMQqTzr7
         nFx+W7oTw+cHF41GV0GTJqmhFG3ybMJJaFIgysD8lTBHSLUoq5PFxOYEtTlk/jPhT7DT
         lJEQ==
X-Gm-Message-State: AOAM533YOm3phZdL5nZnE5ovI96XIHCDjLwAGbrCPbXm2okVWB8XLp2w
	WY9EQ7VQemmccDfqePkgG8KwqQ==
X-Google-Smtp-Source: ABdhPJxUFqx7oqVUFicGZ08ZdiIvX4OasIz44I5Efn0I5pK7zNiObpai0LAG5TzC7jangEodRtvZ4g==
X-Received: by 2002:aa7:8e81:0:b0:3fe:f212:f9dd with SMTP id a1-20020aa78e81000000b003fef212f9ddmr6217231pfr.46.1631243534646;
        Thu, 09 Sep 2021 20:12:14 -0700 (PDT)
Date: Fri, 10 Sep 2021 12:12:05 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Benn??e <alex.bennee@linaro.org>, Kaly Xin <Kaly.Xin@arm.com>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	"pratikp@quicinc.com" <pratikp@quicinc.com>,
	Srivatsa Vaddagiri <vatsa@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
	Paul Durrant <paul@xen.org>, Xen Devel <xen-devel@lists.xen.org>,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	James McKenzie <james@bromium.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210910031205.GD42777@laputa>
References: <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa>
 <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CACMJ4GbmNgbB5ponYt3NGEk3j6YCksot+kDy2qs8HMdFXWnQbw@mail.gmail.com>
 <CACMJ4GbqPc29n+CAknY4kCjrQnkCSR=W+rymuY7Xa1EZb0MW5w@mail.gmail.com>
 <20210902071902.GC71098@laputa>
 <CACMJ4GYY0wkm0vOzJfq8M9dCxPq1ZFwWT8Q73rMjqtrP7if-Zw@mail.gmail.com>
 <20210907115501.GC49004@laputa>
 <CACMJ4GYvndK6Cat-cZxM3rJ+6Ys2-hT=0_QivQ4md1MHAGbN3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJ4GYvndK6Cat-cZxM3rJ+6Ys2-hT=0_QivQ4md1MHAGbN3Q@mail.gmail.com>

Hi Christopher,

On Tue, Sep 07, 2021 at 11:09:34AM -0700, Christopher Clark wrote:
> On Tue, Sep 7, 2021 at 4:55 AM AKASHI Takahiro <takahiro.akashi@linaro.org>
> wrote:
> 
> > Hi,
> >
> > I have not covered all your comments below yet.
> > So just one comment:
> >
> > On Mon, Sep 06, 2021 at 05:57:43PM -0700, Christopher Clark wrote:
> > > On Thu, Sep 2, 2021 at 12:19 AM AKASHI Takahiro <
> > takahiro.akashi@linaro.org>
> > > wrote:
> >
> > (snip)
> >
> > > >    It appears that, on FE side, at least three hypervisor calls (and
> > data
> > > >    copying) need to be invoked at every request, right?
> > > >
> > >
> > > For a write, counting FE sendv ops:
> > > 1: the write data payload is sent via the "Argo ring for writes"
> > > 2: the descriptor is sent via a sync of the available/descriptor ring
> > >   -- is there a third one that I am missing?
> >
> > In the picture, I can see
> > a) Data transmitted by Argo sendv
> > b) Descriptor written after data sendv
> > c) VirtIO ring sync'd to back-end via separate sendv
> >
> > Oops, (b) is not a hypervisor call, is it?
> >
> 
> That's correct, it is not - the blue arrows in the diagram are not
> hypercalls, they are intended to show data movement or action in the flow
> of performing the operation, and (b) is a data write within the guest's
> address space into the descriptor ring.
> 
> 
> 
> > (But I guess that you will have to have yet another call for notification
> > since there is no config register of QueueNotify?)
> >
> 
> Reasoning about hypercalls necessary for data movement:
> 
> VirtIO transport drivers are responsible for instantiating virtqueues
> (setup_vq) and are able to populate the notify function pointer in the
> virtqueue that they supply. The virtio-argo transport driver can provide a
> suitable notify function implementation that will issue the Argo hypercall
> sendv hypercall(s) for sending data from the guest frontend to the backend.
> By issuing the sendv at the time of the queuenotify, rather than as each
> buffer is added to the virtqueue, the cost of the sendv hypercall can be
> amortized over multiple buffer additions to the virtqueue.
> 
> I also understand that there has been some recent work in the Linaro
> Project Stratos on "Fat Virtqueues", where the data to be transmitted is
> included within an expanded virtqueue, which could further reduce the
> number of hypercalls required, since the data can be transmitted inline
> with the descriptors.
> Reference here:
> https://linaro.atlassian.net/wiki/spaces/STR/pages/25626313982/2021-01-21+Project+Stratos+Sync+Meeting+notes
> https://linaro.atlassian.net/browse/STR-25

Ah, yes. Obviously, "fatvirtqueue" has pros and cons.
One of cons is that it won't be suitable for bigger payload
with limited space in descriptors.

> As a result of the above, I think that a single hypercall could be
> sufficient for communicating data for multiple requests, and that a
> two-hypercall-per-request (worst case) upper bound could also be
> established.

When it comes to the payload or data plane, "fatvirtqueue" as well as
Argo utilizes copying. You dub it "DMA operations".
A similar approach can be also seen in virtio-over-ivshmem, where
a limited amount of memory are shared and FE will allocate some space
in this buffer and copy the payload into there. Those allocation will
be done via dma_ops of virtio_ivshmem driver. BE, on the other hand,
fetches the data from the shared memory by using the "offset" described
in a descriptor.
Shared memory is divided into a couple of different groups;
one for read/write for all, others for one writer with many readers.
(I hope I'm right here :)

Looks close to Argo? What is different is who is responsible for
copying data, the kernel or the hypervisor.
(Yeah, I know that Argo has more crucial aspects like access controls.)

In this sense, ivshmem can also be a candidate for hypervisor-agnostic
framework. Jailhouse doesn't say so explicitly AFAIK.
Jan may have some more to say.

Thanks,
-Takahiro Akashi


> Christopher
> 
> 
> 
> >
> > Thanks,
> > -Takahiro Akashi
> >
> >
> > > Christopher
> > >
> > >
> > > >
> > > > Thanks,
> > > > -Takahiro Akashi
> > > >
> > > >
> > > > > * Here are the design documents for building VirtIO-over-Argo, to
> > > > support a
> > > > >   hypervisor-agnostic frontend VirtIO transport driver using Argo.
> > > > >
> > > > > The Development Plan to build VirtIO virtual device support over Argo
> > > > > transport:
> > > > >
> > > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Development+Phase+1
> > > > >
> > > > > A design for using VirtIO over Argo, describing how VirtIO data
> > > > structures
> > > > > and communication is handled over the Argo transport:
> > > > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO+Argo
> > > > >
> > > > > Diagram (from the above document) showing how VirtIO rings are
> > > > synchronized
> > > > > between domains without using shared memory:
> > > > >
> > > >
> > https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#media-blob-url=true&id=01f7d0e1-7686-4f0b-88e1-457c1d30df40&collection=contentId-1348763698&contextId=1348763698&mimeType=image%2Fpng&name=device-buffer-access-virtio-argo.png&size=243175&width=1106&height=1241
> > > > >
> > > > > Please note that the above design documents show that the existing
> > VirtIO
> > > > > device drivers, and both vring and virtqueue data structures can be
> > > > > preserved
> > > > > while interdomain communication can be performed with no shared
> > memory
> > > > > required
> > > > > for most drivers; (the exceptions where further design is required
> > are
> > > > those
> > > > > such as virtual framebuffer devices where shared memory regions are
> > > > > intentionally
> > > > > added to the communication structure beyond the vrings and
> > virtqueues).
> > > > >
> > > > > An analysis of VirtIO and Argo, informing the design:
> > > > >
> > > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO
> > > > >
> > > > > * Argo can be used for a communication path for configuration
> > between the
> > > > > backend
> > > > >   and the toolstack, avoiding the need for a dependency on XenStore,
> > > > which
> > > > > is an
> > > > >   advantage for any hypervisor-agnostic design. It is also amenable
> > to a
> > > > > notification
> > > > >   mechanism that is not based on Xen event channels.
> > > > >
> > > > > * Argo does not use or require shared memory between VMs and
> > provides an
> > > > > alternative
> > > > >   to the use of foreign shared memory mappings. It avoids some of the
> > > > > complexities
> > > > >   involved with using grants (eg. XSA-300).
> > > > >
> > > > > * Argo supports Mandatory Access Control by the hypervisor,
> > satisfying a
> > > > > common
> > > > >   certification requirement.
> > > > >
> > > > > * The Argo headers are BSD-licensed and the Xen hypervisor
> > implementation
> > > > > is GPLv2 but
> > > > >   accessible via the hypercall interface. The licensing should not
> > > > present
> > > > > an obstacle
> > > > >   to adoption of Argo in guest software or implementation by other
> > > > > hypervisors.
> > > > >
> > > > > * Since the interface that Argo presents to a guest VM is similar to
> > > > DMA, a
> > > > > VirtIO-Argo
> > > > >   frontend transport driver should be able to operate with a physical
> > > > > VirtIO-enabled
> > > > >   smart-NIC if the toolstack and an Argo-aware backend provide
> > support.
> > > > >
> > > > > The next Xen Community Call is next week and I would be happy to
> > answer
> > > > > questions
> > > > > about Argo and on this topic. I will also be following this thread.
> > > > >
> > > > > Christopher
> > > > > (Argo maintainer, Xen Community)
> > > > >
> > > > >
> > > >
> > --------------------------------------------------------------------------------
> > > > > [1]
> > > > > An introduction to Argo:
> > > > >
> > > >
> > https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
> > > > > https://www.youtube.com/watch?v=cnC0Tg3jqJQ
> > > > > Xen Wiki page for Argo:
> > > > >
> > > >
> > https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen
> > > > >
> > > > > [2]
> > > > > OpenXT Linux Argo driver and userspace library:
> > > > > https://github.com/openxt/linux-xen-argo
> > > > >
> > > > > Windows V4V at OpenXT wiki:
> > > > > https://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/V4V
> > > > > Windows v4v driver source:
> > > > > https://github.com/OpenXT/xc-windows/tree/master/xenv4v
> > > > >
> > > > > HP/Bromium uXen V4V driver:
> > > > > https://github.com/uxen-virt/uxen/tree/ascara/windows/uxenv4vlib
> > > > >
> > > > > [3]
> > > > > v2 of the Argo test unikernel for XTF:
> > > > >
> > > >
> > https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02234.html
> > > > >
> > > > > [4]
> > > > > Argo HMX Transport for VirtIO meeting minutes:
> > > > >
> > > >
> > https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.html
> > > > >
> > > > > VirtIO-Argo Development wiki page:
> > > > >
> > > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Development+Phase+1
> > > > >
> > > >
> > > >
> >

