Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C53FD9C7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 14:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176344.320897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPMw-0003j5-W8; Wed, 01 Sep 2021 12:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176344.320897; Wed, 01 Sep 2021 12:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPMw-0003fr-Qa; Wed, 01 Sep 2021 12:29:30 +0000
Received: by outflank-mailman (input) for mailman id 176344;
 Wed, 01 Sep 2021 12:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymi3=NX=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mLPMv-0003fj-0W
 for xen-devel@lists.xen.org; Wed, 01 Sep 2021 12:29:29 +0000
Received: from mail-pg1-x52f.google.com (unknown [2607:f8b0:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19227e72-2afa-4c5a-983b-279d7332980d;
 Wed, 01 Sep 2021 12:29:20 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s11so2574023pgr.11
 for <xen-devel@lists.xen.org>; Wed, 01 Sep 2021 05:29:20 -0700 (PDT)
Received: from laputa (p784a44f4.tkyea130.ap.so-net.ne.jp. [120.74.68.244])
 by smtp.gmail.com with ESMTPSA id 11sm24800891pgh.52.2021.09.01.05.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:29:18 -0700 (PDT)
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
X-Inumbo-ID: 19227e72-2afa-4c5a-983b-279d7332980d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=07U2ss57vpxKYbvMqehbTSa/mQqWhg8J3EKt6sEzu1Q=;
        b=tGEGEJQN/y8wkh6wE9Tpje/mLcwS1Cpy3s5pLdntikNHnVh1IemOBAjnAl85CfDjFa
         vlDDXh8UrmfY3Yla0qa5wbTMrogk5Qz/GyWKc0Rs7GSer2zm7XPzP7SDEpKONpSqiIn4
         YNcsHJYcn73N59BmxcDuI+LK1SWBy4/F/5A9trw2x3zr5IYxbHP6vIv5KuSDw8gnUpmt
         C9ev6p1PS/WW3/B7WlqzFMgVn5tLXsJOpyc6Sdatl38qu8Gdzkc9pphWii6WARPgBkt3
         N+Wuy47sNSORxdFKe/H/AZ3wu2PCmxIGpozp0tB2kQJdprr9hEEkpSLgVTSdcKk06T0W
         Ps2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=07U2ss57vpxKYbvMqehbTSa/mQqWhg8J3EKt6sEzu1Q=;
        b=GJNahvGXOQaslOFZ/EaUdT3rEvxtJk8a1uw/GJ+0+qH3Doe0qOWAsJedSFMRwGE+h3
         m5keSVcPY125/m7kR0ubVrZts723q7irnFuSOZ1i7v7g0lGYPnxZpGczO/j8Pwl03e2I
         tPvNscI/50RDMbRdaCS9wJCoQYVS28UMSzYO0jbdYeeoiMM6XY1bNAJLZFjld13TICPJ
         1tBbGvmyzb8P8GHL9nMrV3ykEv2cSoEOsczmccqilosGi5H4+pZP7qJSYH1Zxcwmfgt6
         ELhzpvWqiU5wgi/oz/wvkcqJZ2pDSYRsbh1c8TsTg9zOQ6nh24JHssCH09tq9zrV61ox
         LZkw==
X-Gm-Message-State: AOAM533cBkfOaAc31PqFqiqrVYwpARliBtRKn/hWFXLL5+YN9sZJ0S92
	oPFKL/qUpYMq+lCjYgwrJTttlQ==
X-Google-Smtp-Source: ABdhPJx7LVfGA76Fa52njG3Bl8xTL8wryQTg0FB02cmdtaD+7SpKet6xkUpwxHIe7GgFKBfahnN+0g==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr32324146pgj.381.1630499359569;
        Wed, 01 Sep 2021 05:29:19 -0700 (PDT)
Date: Wed, 1 Sep 2021 21:29:10 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Wei Chen <Wei.Chen@arm.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
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
	Paul Durrant <paul@xen.org>, nd <nd@arm.com>,
	Xen Devel <xen-devel@lists.xen.org>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210901122910.GA100270@laputa>
References: <DB9PR08MB685767CFAA4A8BCE7D2225A89EFD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210817080757.GC43203@laputa>
 <DB9PR08MB6857C656472153A42FB438C49EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210818053840.GE39588@laputa>
 <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa>
 <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210831061805.GB69817@laputa>
 <DB9PR08MB6857A38DAF12053DCA502E039ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB9PR08MB6857A38DAF12053DCA502E039ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com>

Hi Wei,

On Wed, Sep 01, 2021 at 11:12:58AM +0000, Wei Chen wrote:
> Hi Akashi,
> 
> > -----Original Message-----
> > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> > Sent: 2021年8月31日 14:18
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano Stabellini
> > <sstabellini@kernel.org>; Alex Benn??e <alex.bennee@linaro.org>; Kaly Xin
> > <Kaly.Xin@arm.com>; Stratos Mailing List <stratos-dev@op-lists.linaro.org>;
> > virtio-dev@lists.oasis-open.org; Arnd Bergmann <arnd.bergmann@linaro.org>;
> > Viresh Kumar <viresh.kumar@linaro.org>; Stefano Stabellini
> > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan Kiszka
> > <jan.kiszka@siemens.com>; Carl van Schaik <cvanscha@qti.qualcomm.com>;
> > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.org>; Jean-
> > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
> > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; Artem Mygaiev <Artem_Mygaiev@epam.com>; Julien
> > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Paul Durrant
> > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
> > Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
> > 
> > Wei,
> > 
> > On Thu, Aug 26, 2021 at 12:10:19PM +0000, Wei Chen wrote:
> > > Hi Akashi,
> > >
> > > > -----Original Message-----
> > > > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> > > > Sent: 2021年8月26日 17:41
> > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano Stabellini
> > > > <sstabellini@kernel.org>; Alex Benn??e <alex.bennee@linaro.org>; Kaly
> > Xin
> > > > <Kaly.Xin@arm.com>; Stratos Mailing List <stratos-dev@op-
> > lists.linaro.org>;
> > > > virtio-dev@lists.oasis-open.org; Arnd Bergmann
> > <arnd.bergmann@linaro.org>;
> > > > Viresh Kumar <viresh.kumar@linaro.org>; Stefano Stabellini
> > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan Kiszka
> > > > <jan.kiszka@siemens.com>; Carl van Schaik <cvanscha@qti.qualcomm.com>;
> > > > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.org>; Jean-
> > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
> > > > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
> > > > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
> > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev <Artem_Mygaiev@epam.com>;
> > Julien
> > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Paul Durrant
> > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
> > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
> > > >
> > > > Hi Wei,
> > > >
> > > > On Fri, Aug 20, 2021 at 03:41:50PM +0900, AKASHI Takahiro wrote:
> > > > > On Wed, Aug 18, 2021 at 08:35:51AM +0000, Wei Chen wrote:
> > > > > > Hi Akashi，
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> > > > > > > Sent: 2021年8月18日 13:39
> > > > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > > > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano
> > Stabellini
> > > > > > > <sstabellini@kernel.org>; Alex Benn??e <alex.bennee@linaro.org>;
> > > > Stratos
> > > > > > > Mailing List <stratos-dev@op-lists.linaro.org>; virtio-
> > > > dev@lists.oasis-
> > > > > > > open.org; Arnd Bergmann <arnd.bergmann@linaro.org>; Viresh Kumar
> > > > > > > <viresh.kumar@linaro.org>; Stefano Stabellini
> > > > > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan Kiszka
> > > > > > > <jan.kiszka@siemens.com>; Carl van Schaik
> > > > <cvanscha@qti.qualcomm.com>;
> > > > > > > pratikp@quicinc.com; Srivatsa Vaddagiri <vatsa@codeaurora.org>;
> > > > Jean-
> > > > > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
> > > > > > > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
> > > > > > > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
> > > > > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev
> > <Artem_Mygaiev@epam.com>;
> > > > Julien
> > > > > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>; Paul
> > > > Durrant
> > > > > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
> > > > > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
> > > > > > >
> > > > > > > On Tue, Aug 17, 2021 at 08:39:09AM +0000, Wei Chen wrote:
> > > > > > > > Hi Akashi,
> > > > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> > > > > > > > > Sent: 2021年8月17日 16:08
> > > > > > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > > > > > Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>; Stefano
> > > > Stabellini
> > > > > > > > > <sstabellini@kernel.org>; Alex Benn??e
> > <alex.bennee@linaro.org>;
> > > > > > > Stratos
> > > > > > > > > Mailing List <stratos-dev@op-lists.linaro.org>; virtio-
> > > > > > > dev@lists.oasis-
> > > > > > > > > open.org; Arnd Bergmann <arnd.bergmann@linaro.org>; Viresh
> > Kumar
> > > > > > > > > <viresh.kumar@linaro.org>; Stefano Stabellini
> > > > > > > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan
> > Kiszka
> > > > > > > > > <jan.kiszka@siemens.com>; Carl van Schaik
> > > > <cvanscha@qti.qualcomm.com>;
> > > > > > > > > pratikp@quicinc.com; Srivatsa Vaddagiri
> > <vatsa@codeaurora.org>;
> > > > Jean-
> > > > > > > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
> > > > > > > > > <mathieu.poirier@linaro.org>; Oleksandr Tyshchenko
> > > > > > > > > <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
> > > > > > > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev
> > > > <Artem_Mygaiev@epam.com>;
> > > > > > > Julien
> > > > > > > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>;
> > Paul
> > > > Durrant
> > > > > > > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
> > > > > > > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO
> > backends
> > > > > > > > >
> > > > > > > > > Hi Wei, Oleksandr,
> > > > > > > > >
> > > > > > > > > On Mon, Aug 16, 2021 at 10:04:03AM +0000, Wei Chen wrote:
> > > > > > > > > > Hi All,
> > > > > > > > > >
> > > > > > > > > > Thanks for Stefano to link my kvmtool for Xen proposal
> > here.
> > > > > > > > > > This proposal is still discussing in Xen and KVM
> > communities.
> > > > > > > > > > The main work is to decouple the kvmtool from KVM and make
> > > > > > > > > > other hypervisors can reuse the virtual device
> > implementations.
> > > > > > > > > >
> > > > > > > > > > In this case, we need to introduce an intermediate
> > hypervisor
> > > > > > > > > > layer for VMM abstraction, Which is, I think it's very
> > close
> > > > > > > > > > to stratos' virtio hypervisor agnosticism work.
> > > > > > > > >
> > > > > > > > > # My proposal[1] comes from my own idea and doesn't always
> > > > represent
> > > > > > > > > # Linaro's view on this subject nor reflect Alex's concerns.
> > > > > > > Nevertheless,
> > > > > > > > >
> > > > > > > > > Your idea and my proposal seem to share the same background.
> > > > > > > > > Both have the similar goal and currently start with, at
> > first,
> > > > Xen
> > > > > > > > > and are based on kvm-tool. (Actually, my work is derived
> > from
> > > > > > > > > EPAM's virtio-disk, which is also based on kvm-tool.)
> > > > > > > > >
> > > > > > > > > In particular, the abstraction of hypervisor interfaces has
> > a
> > > > same
> > > > > > > > > set of interfaces (for your "struct vmm_impl" and my "RPC
> > > > interfaces").
> > > > > > > > > This is not co-incident as we both share the same origin as
> > I
> > > > said
> > > > > > > above.
> > > > > > > > > And so we will also share the same issues. One of them is a
> > way
> > > > of
> > > > > > > > > "sharing/mapping FE's memory". There is some trade-off
> > between
> > > > > > > > > the portability and the performance impact.
> > > > > > > > > So we can discuss the topic here in this ML, too.
> > > > > > > > > (See Alex's original email, too).
> > > > > > > > >
> > > > > > > > Yes, I agree.
> > > > > > > >
> > > > > > > > > On the other hand, my approach aims to create a "single-
> > binary"
> > > > > > > solution
> > > > > > > > > in which the same binary of BE vm could run on any
> > hypervisors.
> > > > > > > > > Somehow similar to your "proposal-#2" in [2], but in my
> > solution,
> > > > all
> > > > > > > > > the hypervisor-specific code would be put into another
> > entity
> > > > (VM),
> > > > > > > > > named "virtio-proxy" and the abstracted operations are
> > served
> > > > via RPC.
> > > > > > > > > (In this sense, BE is hypervisor-agnostic but might have OS
> > > > > > > dependency.)
> > > > > > > > > But I know that we need discuss if this is a requirement
> > even
> > > > > > > > > in Stratos project or not. (Maybe not)
> > > > > > > > >
> > > > > > > >
> > > > > > > > Sorry, I haven't had time to finish reading your virtio-proxy
> > > > completely
> > > > > > > > (I will do it ASAP). But from your description, it seems we
> > need a
> > > > > > > > 3rd VM between FE and BE? My concern is that, if my assumption
> > is
> > > > right,
> > > > > > > > will it increase the latency in data transport path? Even if
> > we're
> > > > > > > > using some lightweight guest like RTOS or Unikernel,
> > > > > > >
> > > > > > > Yes, you're right. But I'm afraid that it is a matter of degree.
> > > > > > > As far as we execute 'mapping' operations at every fetch of
> > payload,
> > > > > > > we will see latency issue (even in your case) and if we have
> > some
> > > > solution
> > > > > > > for it, we won't see it neither in my proposal :)
> > > > > > >
> > > > > >
> > > > > > Oleksandr has sent a proposal to Xen mailing list to reduce this
> > kind
> > > > > > of "mapping/unmapping" operations. So the latency caused by this
> > > > behavior
> > > > > > on Xen may eventually be eliminated, and Linux-KVM doesn't have
> > that
> > > > problem.
> > > > >
> > > > > Obviously, I have not yet caught up there in the discussion.
> > > > > Which patch specifically?
> > > >
> > > > Can you give me the link to the discussion or patch, please?
> > > >
> > >
> > > It's a RFC discussion. We have tested this RFC patch internally.
> > > https://lists.xenproject.org/archives/html/xen-devel/2021-
> > 07/msg01532.html
> > 
> > I'm afraid that I miss something here, but I don't know
> > why this proposed API will lead to eliminating 'mmap' in accessing
> > the queued payload at every request?
> > 
> 
> This API give Xen device model (QEMU or kvmtool) the ability to map
> whole guest RAM in device model's address space. In this case, device
> model doesn't need dynamic hypercall to map/unmap payload memory.
> It can use a flat offset to access payload memory in its address
> space directly. Just Like KVM device model does now.

Thank you. Quickly, let me make sure one thing:
This API itself doesn't do any mapping operations, right?
So I suppose that virtio BE guest is responsible to
1) fetch the information about all the memory regions in FE,
2) call this API to allocate a big chunk of unused space in BE,
3) create grant/foreign mappings for FE onto this region(S)
in the initialization/configuration of emulated virtio devices.

Is this the way this API is expected to be used?
Does Xen already has an interface for (1)?

-Takahiro Akashi

> Before this API, When device model to map whole guest memory, will
> severely consume the physical pages of Dom-0/Dom-D.
> 
> > -Takahiro Akashi
> > 
> > 
> > > > Thanks,
> > > > -Takahiro Akashi
> > > >
> > > > > -Takahiro Akashi
> > > > >
> > > > > > > > > Specifically speaking about kvm-tool, I have a concern about
> > its
> > > > > > > > > license term; Targeting different hypervisors and different
> > OSs
> > > > > > > > > (which I assume includes RTOS's), the resultant library
> > should
> > > > be
> > > > > > > > > license permissive and GPL for kvm-tool might be an issue.
> > > > > > > > > Any thoughts?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yes. If user want to implement a FreeBSD device model, but the
> > > > virtio
> > > > > > > > library is GPL. Then GPL would be a problem. If we have
> > another
> > > > good
> > > > > > > > candidate, I am open to it.
> > > > > > >
> > > > > > > I have some candidates, particularly for vq/vring, in my mind:
> > > > > > > * Open-AMP, or
> > > > > > > * corresponding Free-BSD code
> > > > > > >
> > > > > >
> > > > > > Interesting, I will look into them : )
> > > > > >
> > > > > > Cheers,
> > > > > > Wei Chen
> > > > > >
> > > > > > > -Takahiro Akashi
> > > > > > >
> > > > > > >
> > > > > > > > > -Takahiro Akashi
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > [1] https://op-lists.linaro.org/pipermail/stratos-dev/2021-
> > > > > > > > > August/000548.html
> > > > > > > > > [2] https://marc.info/?l=xen-devel&m=162373754705233&w=2
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> > > > > > > > > > > Sent: 2021年8月14日 23:38
> > > > > > > > > > > To: AKASHI Takahiro <takahiro.akashi@linaro.org>;
> > Stefano
> > > > > > > Stabellini
> > > > > > > > > <sstabellini@kernel.org>
> > > > > > > > > > > Cc: Alex Benn??e <alex.bennee@linaro.org>; Stratos
> > Mailing
> > > > List
> > > > > > > > > <stratos-dev@op-lists.linaro.org>; virtio-dev@lists.oasis-
> > > > open.org;
> > > > > > > Arnd
> > > > > > > > > Bergmann <arnd.bergmann@linaro.org>; Viresh Kumar
> > > > > > > > > <viresh.kumar@linaro.org>; Stefano Stabellini
> > > > > > > > > <stefano.stabellini@xilinx.com>; stefanha@redhat.com; Jan
> > Kiszka
> > > > > > > > > <jan.kiszka@siemens.com>; Carl van Schaik
> > > > <cvanscha@qti.qualcomm.com>;
> > > > > > > > > pratikp@quicinc.com; Srivatsa Vaddagiri
> > <vatsa@codeaurora.org>;
> > > > Jean-
> > > > > > > > > Philippe Brucker <jean-philippe@linaro.org>; Mathieu Poirier
> > > > > > > > > <mathieu.poirier@linaro.org>; Wei Chen <Wei.Chen@arm.com>;
> > > > Oleksandr
> > > > > > > > > Tyshchenko <Oleksandr_Tyshchenko@epam.com>; Bertrand Marquis
> > > > > > > > > <Bertrand.Marquis@arm.com>; Artem Mygaiev
> > > > <Artem_Mygaiev@epam.com>;
> > > > > > > Julien
> > > > > > > > > Grall <julien@xen.org>; Juergen Gross <jgross@suse.com>;
> > Paul
> > > > Durrant
> > > > > > > > > <paul@xen.org>; Xen Devel <xen-devel@lists.xen.org>
> > > > > > > > > > > Subject: Re: Enabling hypervisor agnosticism for VirtIO
> > > > backends
> > > > > > > > > > >
> > > > > > > > > > > Hello, all.
> > > > > > > > > > >
> > > > > > > > > > > Please see some comments below. And sorry for the
> > possible
> > > > format
> > > > > > > > > issues.
> > > > > > > > > > >
> > > > > > > > > > > > On Wed, Aug 11, 2021 at 9:27 AM AKASHI Takahiro
> > > > > > > > > <mailto:takahiro.akashi@linaro.org> wrote:
> > > > > > > > > > > > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano
> > > > Stabellini
> > > > > > > wrote:
> > > > > > > > > > > > > CCing people working on Xen+VirtIO and IOREQs. Not
> > > > trimming
> > > > > > > the
> > > > > > > > > original
> > > > > > > > > > > > > email to let them read the full context.
> > > > > > > > > > > > >
> > > > > > > > > > > > > My comments below are related to a potential Xen
> > > > > > > implementation,
> > > > > > > > > not
> > > > > > > > > > > > > because it is the only implementation that matters,
> > but
> > > > > > > because it
> > > > > > > > > is
> > > > > > > > > > > > > the one I know best.
> > > > > > > > > > > >
> > > > > > > > > > > > Please note that my proposal (and hence the working
> > > > prototype)[1]
> > > > > > > > > > > > is based on Xen's virtio implementation (i.e. IOREQ)
> > and
> > > > > > > > > particularly
> > > > > > > > > > > > EPAM's virtio-disk application (backend server).
> > > > > > > > > > > > It has been, I believe, well generalized but is still
> > a
> > > > bit
> > > > > > > biased
> > > > > > > > > > > > toward this original design.
> > > > > > > > > > > >
> > > > > > > > > > > > So I hope you like my approach :)
> > > > > > > > > > > >
> > > > > > > > > > > > [1] https://op-lists.linaro.org/pipermail/stratos-
> > > > dev/2021-
> > > > > > > > > August/000546.html
> > > > > > > > > > > >
> > > > > > > > > > > > Let me take this opportunity to explain a bit more
> > about
> > > > my
> > > > > > > approach
> > > > > > > > > below.
> > > > > > > > > > > >
> > > > > > > > > > > > > Also, please see this relevant email thread:
> > > > > > > > > > > > > https://marc.info/?l=xen-devel&m=162373754705233&w=2
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, 4 Aug 2021, Alex Bennée wrote:
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > One of the goals of Project Stratos is to enable
> > > > hypervisor
> > > > > > > > > agnostic
> > > > > > > > > > > > > > backends so we can enable as much re-use of code
> > as
> > > > possible
> > > > > > > and
> > > > > > > > > avoid
> > > > > > > > > > > > > > repeating ourselves. This is the flip side of the
> > > > front end
> > > > > > > > > where
> > > > > > > > > > > > > > multiple front-end implementations are required -
> > one
> > > > per OS,
> > > > > > > > > assuming
> > > > > > > > > > > > > > you don't just want Linux guests. The resultant
> > guests
> > > > are
> > > > > > > > > trivially
> > > > > > > > > > > > > > movable between hypervisors modulo any abstracted
> > > > paravirt
> > > > > > > type
> > > > > > > > > > > > > > interfaces.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > In my original thumb nail sketch of a solution I
> > > > envisioned
> > > > > > > > > vhost-user
> > > > > > > > > > > > > > daemons running in a broadly POSIX like
> > environment.
> > > > The
> > > > > > > > > interface to
> > > > > > > > > > > > > > the daemon is fairly simple requiring only some
> > mapped
> > > > > > > memory
> > > > > > > > > and some
> > > > > > > > > > > > > > sort of signalling for events (on Linux this is
> > > > eventfd).
> > > > > > > The
> > > > > > > > > idea was a
> > > > > > > > > > > > > > stub binary would be responsible for any
> > hypervisor
> > > > specific
> > > > > > > > > setup and
> > > > > > > > > > > > > > then launch a common binary to deal with the
> > actual
> > > > > > > virtqueue
> > > > > > > > > requests
> > > > > > > > > > > > > > themselves.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Since that original sketch we've seen an expansion
> > in
> > > > the
> > > > > > > sort
> > > > > > > > > of ways
> > > > > > > > > > > > > > backends could be created. There is interest in
> > > > > > > encapsulating
> > > > > > > > > backends
> > > > > > > > > > > > > > in RTOSes or unikernels for solutions like SCMI.
> > There
> > > > > > > interest
> > > > > > > > > in Rust
> > > > > > > > > > > > > > has prompted ideas of using the trait interface to
> > > > abstract
> > > > > > > > > differences
> > > > > > > > > > > > > > away as well as the idea of bare-metal Rust
> > backends.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > We have a card (STR-12) called "Hypercall
> > > > Standardisation"
> > > > > > > which
> > > > > > > > > > > > > > calls for a description of the APIs needed from
> > the
> > > > > > > hypervisor
> > > > > > > > > side to
> > > > > > > > > > > > > > support VirtIO guests and their backends. However
> > we
> > > > are
> > > > > > > some
> > > > > > > > > way off
> > > > > > > > > > > > > > from that at the moment as I think we need to at
> > least
> > > > > > > > > demonstrate one
> > > > > > > > > > > > > > portable backend before we start codifying
> > > > requirements. To
> > > > > > > that
> > > > > > > > > end I
> > > > > > > > > > > > > > want to think about what we need for a backend to
> > > > function.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Configuration
> > > > > > > > > > > > > > =============
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > In the type-2 setup this is typically fairly
> > simple
> > > > because
> > > > > > > the
> > > > > > > > > host
> > > > > > > > > > > > > > system can orchestrate the various modules that
> > make
> > > > up the
> > > > > > > > > complete
> > > > > > > > > > > > > > system. In the type-1 case (or even type-2 with
> > > > delegated
> > > > > > > > > service VMs)
> > > > > > > > > > > > > > we need some sort of mechanism to inform the
> > backend
> > > > VM
> > > > > > > about
> > > > > > > > > key
> > > > > > > > > > > > > > details about the system:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >   - where virt queue memory is in it's address
> > space
> > > > > > > > > > > > > >   - how it's going to receive (interrupt) and
> > trigger
> > > > (kick)
> > > > > > > > > events
> > > > > > > > > > > > > >   - what (if any) resources the backend needs to
> > > > connect to
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Obviously you can elide over configuration issues
> > by
> > > > having
> > > > > > > > > static
> > > > > > > > > > > > > > configurations and baking the assumptions into
> > your
> > > > guest
> > > > > > > images
> > > > > > > > > however
> > > > > > > > > > > > > > this isn't scalable in the long term. The obvious
> > > > solution
> > > > > > > seems
> > > > > > > > > to be
> > > > > > > > > > > > > > extending a subset of Device Tree data to user
> > space
> > > > but
> > > > > > > perhaps
> > > > > > > > > there
> > > > > > > > > > > > > > are other approaches?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Before any virtio transactions can take place the
> > > > > > > appropriate
> > > > > > > > > memory
> > > > > > > > > > > > > > mappings need to be made between the FE guest and
> > the
> > > > BE
> > > > > > > guest.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > Currently the whole of the FE guests address space
> > > > needs to
> > > > > > > be
> > > > > > > > > visible
> > > > > > > > > > > > > > to whatever is serving the virtio requests. I can
> > > > envision 3
> > > > > > > > > approaches:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  * BE guest boots with memory already mapped
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  This would entail the guest OS knowing where in
> > it's
> > > > Guest
> > > > > > > > > Physical
> > > > > > > > > > > > > >  Address space is already taken up and avoiding
> > > > clashing. I
> > > > > > > > > would assume
> > > > > > > > > > > > > >  in this case you would want a standard interface
> > to
> > > > > > > userspace
> > > > > > > > > to then
> > > > > > > > > > > > > >  make that address space visible to the backend
> > daemon.
> > > > > > > > > > > >
> > > > > > > > > > > > Yet another way here is that we would have well known
> > > > "shared
> > > > > > > > > memory" between
> > > > > > > > > > > > VMs. I think that Jailhouse's ivshmem gives us good
> > > > insights on
> > > > > > > this
> > > > > > > > > matter
> > > > > > > > > > > > and that it can even be an alternative for hypervisor-
> > > > agnostic
> > > > > > > > > solution.
> > > > > > > > > > > >
> > > > > > > > > > > > (Please note memory regions in ivshmem appear as a PCI
> > > > device
> > > > > > > and
> > > > > > > > > can be
> > > > > > > > > > > > mapped locally.)
> > > > > > > > > > > >
> > > > > > > > > > > > I want to add this shared memory aspect to my virtio-
> > proxy,
> > > > but
> > > > > > > > > > > > the resultant solution would eventually look similar
> > to
> > > > ivshmem.
> > > > > > > > > > > >
> > > > > > > > > > > > > >  * BE guests boots with a hypervisor handle to
> > memory
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  The BE guest is then free to map the FE's memory
> > to
> > > > where
> > > > > > > it
> > > > > > > > > wants in
> > > > > > > > > > > > > >  the BE's guest physical address space.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I cannot see how this could work for Xen. There is
> > no
> > > > "handle"
> > > > > > > to
> > > > > > > > > give
> > > > > > > > > > > > > to the backend if the backend is not running in dom0.
> > So
> > > > for
> > > > > > > Xen I
> > > > > > > > > think
> > > > > > > > > > > > > the memory has to be already mapped
> > > > > > > > > > > >
> > > > > > > > > > > > In Xen's IOREQ solution (virtio-blk), the following
> > > > information
> > > > > > > is
> > > > > > > > > expected
> > > > > > > > > > > > to be exposed to BE via Xenstore:
> > > > > > > > > > > > (I know that this is a tentative approach though.)
> > > > > > > > > > > >    - the start address of configuration space
> > > > > > > > > > > >    - interrupt number
> > > > > > > > > > > >    - file path for backing storage
> > > > > > > > > > > >    - read-only flag
> > > > > > > > > > > > And the BE server have to call a particular hypervisor
> > > > interface
> > > > > > > to
> > > > > > > > > > > > map the configuration space.
> > > > > > > > > > >
> > > > > > > > > > > Yes, Xenstore was chosen as a simple way to pass
> > > > configuration
> > > > > > > info to
> > > > > > > > > the backend running in a non-toolstack domain.
> > > > > > > > > > > I remember, there was a wish to avoid using Xenstore in
> > > > Virtio
> > > > > > > backend
> > > > > > > > > itself if possible, so for non-toolstack domain, this could
> > done
> > > > with
> > > > > > > > > adjusting devd (daemon that listens for devices and launches
> > > > backends)
> > > > > > > > > > > to read backend configuration from the Xenstore anyway
> > and
> > > > pass it
> > > > > > > to
> > > > > > > > > the backend via command line arguments.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Yes, in current PoC code we're using xenstore to pass
> > device
> > > > > > > > > configuration.
> > > > > > > > > > We also designed a static device configuration parse
> > method
> > > > for
> > > > > > > Dom0less
> > > > > > > > > or
> > > > > > > > > > other scenarios don't have xentool. yes, it's from device
> > > > model
> > > > > > > command
> > > > > > > > > line
> > > > > > > > > > or a config file.
> > > > > > > > > >
> > > > > > > > > > > But, if ...
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > In my approach (virtio-proxy), all those Xen (or
> > > > hypervisor)-
> > > > > > > > > specific
> > > > > > > > > > > > stuffs are contained in virtio-proxy, yet another VM,
> > to
> > > > hide
> > > > > > > all
> > > > > > > > > details.
> > > > > > > > > > >
> > > > > > > > > > > ... the solution how to overcome that is already found
> > and
> > > > proven
> > > > > > > to
> > > > > > > > > work then even better.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > # My point is that a "handle" is not mandatory for
> > > > executing
> > > > > > > mapping.
> > > > > > > > > > > >
> > > > > > > > > > > > > and the mapping probably done by the
> > > > > > > > > > > > > toolstack (also see below.) Or we would have to
> > invent a
> > > > new
> > > > > > > Xen
> > > > > > > > > > > > > hypervisor interface and Xen virtual machine
> > privileges
> > > > to
> > > > > > > allow
> > > > > > > > > this
> > > > > > > > > > > > > kind of mapping.
> > > > > > > > > > > >
> > > > > > > > > > > > > If we run the backend in Dom0 that we have no
> > problems
> > > > of
> > > > > > > course.
> > > > > > > > > > > >
> > > > > > > > > > > > One of difficulties on Xen that I found in my approach
> > is
> > > > that
> > > > > > > > > calling
> > > > > > > > > > > > such hypervisor intefaces (registering IOREQ, mapping
> > > > memory) is
> > > > > > > > > only
> > > > > > > > > > > > allowed on BE servers themselvies and so we will have
> > to
> > > > extend
> > > > > > > > > those
> > > > > > > > > > > > interfaces.
> > > > > > > > > > > > This, however, will raise some concern on security and
> > > > privilege
> > > > > > > > > distribution
> > > > > > > > > > > > as Stefan suggested.
> > > > > > > > > > >
> > > > > > > > > > > We also faced policy related issues with Virtio backend
> > > > running in
> > > > > > > > > other than Dom0 domain in a "dummy" xsm mode. In our target
> > > > system we
> > > > > > > run
> > > > > > > > > the backend in a driver
> > > > > > > > > > > domain (we call it DomD) where the underlying H/W
> > resides.
> > > > We
> > > > > > > trust it,
> > > > > > > > > so we wrote policy rules (to be used in "flask" xsm mode) to
> > > > provide
> > > > > > > it
> > > > > > > > > with a little bit more privileges than a simple DomU had.
> > > > > > > > > > > Now it is permitted to issue device-model, resource and
> > > > memory
> > > > > > > > > mappings, etc calls.
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > To activate the mapping will
> > > > > > > > > > > > > >  require some sort of hypercall to the hypervisor.
> > I
> > > > can see
> > > > > > > two
> > > > > > > > > options
> > > > > > > > > > > > > >  at this point:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >   - expose the handle to userspace for
> > daemon/helper
> > > > to
> > > > > > > trigger
> > > > > > > > > the
> > > > > > > > > > > > > >     mapping via existing hypercall interfaces. If
> > > > using a
> > > > > > > helper
> > > > > > > > > you
> > > > > > > > > > > > > >     would have a hypervisor specific one to avoid
> > the
> > > > daemon
> > > > > > > > > having to
> > > > > > > > > > > > > >     care too much about the details or push that
> > > > complexity
> > > > > > > into
> > > > > > > > > a
> > > > > > > > > > > > > >     compile time option for the daemon which would
> > > > result in
> > > > > > > > > different
> > > > > > > > > > > > > >     binaries although a common source base.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >   - expose a new kernel ABI to abstract the
> > hypercall
> > > > > > > > > differences away
> > > > > > > > > > > > > >     in the guest kernel. In this case the
> > userspace
> > > > would
> > > > > > > > > essentially
> > > > > > > > > > > > > >     ask for an abstract "map guest N memory to
> > > > userspace
> > > > > > > ptr"
> > > > > > > > > and let
> > > > > > > > > > > > > >     the kernel deal with the different hypercall
> > > > interfaces.
> > > > > > > > > This of
> > > > > > > > > > > > > >     course assumes the majority of BE guests would
> > be
> > > > Linux
> > > > > > > > > kernels and
> > > > > > > > > > > > > >     leaves the bare-metal/unikernel approaches to
> > > > their own
> > > > > > > > > devices.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Operation
> > > > > > > > > > > > > > =========
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The core of the operation of VirtIO is fairly
> > simple.
> > > > Once
> > > > > > > the
> > > > > > > > > > > > > > vhost-user feature negotiation is done it's a case
> > of
> > > > > > > receiving
> > > > > > > > > update
> > > > > > > > > > > > > > events and parsing the resultant virt queue for
> > data.
> > > > The
> > > > > > > vhost-
> > > > > > > > > user
> > > > > > > > > > > > > > specification handles a bunch of setup before that
> > > > point,
> > > > > > > mostly
> > > > > > > > > to
> > > > > > > > > > > > > > detail where the virt queues are set up FD's for
> > > > memory and
> > > > > > > > > event
> > > > > > > > > > > > > > communication. This is where the envisioned stub
> > > > process
> > > > > > > would
> > > > > > > > > be
> > > > > > > > > > > > > > responsible for getting the daemon up and ready to
> > run.
> > > > This
> > > > > > > is
> > > > > > > > > > > > > > currently done inside a big VMM like QEMU but I
> > > > suspect a
> > > > > > > modern
> > > > > > > > > > > > > > approach would be to use the rust-vmm vhost crate.
> > It
> > > > would
> > > > > > > then
> > > > > > > > > either
> > > > > > > > > > > > > > communicate with the kernel's abstracted ABI or be
> > re-
> > > > > > > targeted
> > > > > > > > > as a
> > > > > > > > > > > > > > build option for the various hypervisors.
> > > > > > > > > > > > >
> > > > > > > > > > > > > One thing I mentioned before to Alex is that Xen
> > doesn't
> > > > have
> > > > > > > VMMs
> > > > > > > > > the
> > > > > > > > > > > > > way they are typically envisioned and described in
> > other
> > > > > > > > > environments.
> > > > > > > > > > > > > Instead, Xen has IOREQ servers. Each of them
> > connects
> > > > > > > > > independently to
> > > > > > > > > > > > > Xen via the IOREQ interface. E.g. today multiple
> > QEMUs
> > > > could
> > > > > > > be
> > > > > > > > > used as
> > > > > > > > > > > > > emulators for a single Xen VM, each of them
> > connecting
> > > > to Xen
> > > > > > > > > > > > > independently via the IOREQ interface.
> > > > > > > > > > > > >
> > > > > > > > > > > > > The component responsible for starting a daemon
> > and/or
> > > > setting
> > > > > > > up
> > > > > > > > > shared
> > > > > > > > > > > > > interfaces is the toolstack: the xl command and the
> > > > > > > libxl/libxc
> > > > > > > > > > > > > libraries.
> > > > > > > > > > > >
> > > > > > > > > > > > I think that VM configuration management (or
> > orchestration
> > > > in
> > > > > > > > > Startos
> > > > > > > > > > > > jargon?) is a subject to debate in parallel.
> > > > > > > > > > > > Otherwise, is there any good assumption to avoid it
> > right
> > > > now?
> > > > > > > > > > > >
> > > > > > > > > > > > > Oleksandr and others I CCed have been working on
> > ways
> > > > for the
> > > > > > > > > toolstack
> > > > > > > > > > > > > to create virtio backends and setup memory mappings.
> > > > They
> > > > > > > might be
> > > > > > > > > able
> > > > > > > > > > > > > to provide more info on the subject. I do think we
> > miss
> > > > a way
> > > > > > > to
> > > > > > > > > provide
> > > > > > > > > > > > > the configuration to the backend and anything else
> > that
> > > > the
> > > > > > > > > backend
> > > > > > > > > > > > > might require to start doing its job.
> > > > > > > > > > >
> > > > > > > > > > > Yes, some work has been done for the toolstack to handle
> > > > Virtio
> > > > > > > MMIO
> > > > > > > > > devices in
> > > > > > > > > > > general and Virtio block devices in particular. However,
> > it
> > > > has
> > > > > > > not
> > > > > > > > > been upstreaned yet.
> > > > > > > > > > > Updated patches on review now:
> > > > > > > > > > > https://lore.kernel.org/xen-devel/1621626361-29076-1-
> > git-
> > > > send-
> > > > > > > email-
> > > > > > > > > olekstysh@gmail.com/
> > > > > > > > > > >
> > > > > > > > > > > There is an additional (also important) activity to
> > > > improve/fix
> > > > > > > > > foreign memory mapping on Arm which I am also involved in.
> > > > > > > > > > > The foreign memory mapping is proposed to be used for
> > Virtio
> > > > > > > backends
> > > > > > > > > (device emulators) if there is a need to run guest OS
> > completely
> > > > > > > > > unmodified.
> > > > > > > > > > > Of course, the more secure way would be to use grant
> > memory
> > > > > > > mapping.
> > > > > > > > > Brietly, the main difference between them is that with
> > foreign
> > > > mapping
> > > > > > > the
> > > > > > > > > backend
> > > > > > > > > > > can map any guest memory it wants to map, but with grant
> > > > mapping
> > > > > > > it is
> > > > > > > > > allowed to map only what was previously granted by the
> > frontend.
> > > > > > > > > > >
> > > > > > > > > > > So, there might be a problem if we want to pre-map some
> > > > guest
> > > > > > > memory
> > > > > > > > > in advance or to cache mappings in the backend in order to
> > > > improve
> > > > > > > > > performance (because the mapping/unmapping guest pages every
> > > > request
> > > > > > > > > requires a lot of back and forth to Xen + P2M updates). In a
> > > > nutshell,
> > > > > > > > > currently, in order to map a guest page into the backend
> > address
> > > > space
> > > > > > > we
> > > > > > > > > need to steal a real physical page from the backend domain.
> > So,
> > > > with
> > > > > > > the
> > > > > > > > > said optimizations we might end up with no free memory in
> > the
> > > > backend
> > > > > > > > > domain (see XSA-300). And what we try to achieve is to not
> > waste
> > > > a
> > > > > > > real
> > > > > > > > > domain memory at all by providing safe non-allocated-yet (so
> > > > unused)
> > > > > > > > > address space for the foreign (and grant) pages to be mapped
> > > > into,
> > > > > > > this
> > > > > > > > > enabling work implies Xen and Linux (and likely DTB bindings)
> > > > changes.
> > > > > > > > > However, as it turned out, for this to work in a proper and
> > safe
> > > > way
> > > > > > > some
> > > > > > > > > prereq work needs to be done.
> > > > > > > > > > > You can find the related Xen discussion at:
> > > > > > > > > > > https://lore.kernel.org/xen-devel/1627489110-25633-1-
> > git-
> > > > send-
> > > > > > > email-
> > > > > > > > > olekstysh@gmail.com/
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > One question is how to best handle notification
> > and
> > > > kicks.
> > > > > > > The
> > > > > > > > > existing
> > > > > > > > > > > > > > vhost-user framework uses eventfd to signal the
> > daemon
> > > > > > > (although
> > > > > > > > > QEMU
> > > > > > > > > > > > > > is quite capable of simulating them when you use
> > TCG).
> > > > Xen
> > > > > > > has
> > > > > > > > > it's own
> > > > > > > > > > > > > > IOREQ mechanism. However latency is an important
> > > > factor and
> > > > > > > > > having
> > > > > > > > > > > > > > events go through the stub would add quite a lot.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Yeah I think, regardless of anything else, we want
> > the
> > > > > > > backends to
> > > > > > > > > > > > > connect directly to the Xen hypervisor.
> > > > > > > > > > > >
> > > > > > > > > > > > In my approach,
> > > > > > > > > > > >  a) BE -> FE: interrupts triggered by BE calling a
> > > > hypervisor
> > > > > > > > > interface
> > > > > > > > > > > >               via virtio-proxy
> > > > > > > > > > > >  b) FE -> BE: MMIO to config raises events (in event
> > > > channels),
> > > > > > > > > which is
> > > > > > > > > > > >               converted to a callback to BE via
> > virtio-
> > > > proxy
> > > > > > > > > > > >               (Xen's event channel is internnally
> > > > implemented by
> > > > > > > > > interrupts.)
> > > > > > > > > > > >
> > > > > > > > > > > > I don't know what "connect directly" means here, but
> > > > sending
> > > > > > > > > interrupts
> > > > > > > > > > > > to the opposite side would be best efficient.
> > > > > > > > > > > > Ivshmem, I suppose, takes this approach by utilizing
> > PCI's
> > > > msi-x
> > > > > > > > > mechanism.
> > > > > > > > > > >
> > > > > > > > > > > Agree that MSI would be more efficient than SPI...
> > > > > > > > > > > At the moment, in order to notify the frontend, the
> > backend
> > > > issues
> > > > > > > a
> > > > > > > > > specific device-model call to query Xen to inject a
> > > > corresponding SPI
> > > > > > > to
> > > > > > > > > the guest.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > Could we consider the kernel internally converting
> > > > IOREQ
> > > > > > > > > messages from
> > > > > > > > > > > > > > the Xen hypervisor to eventfd events? Would this
> > scale
> > > > with
> > > > > > > > > other kernel
> > > > > > > > > > > > > > hypercall interfaces?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So any thoughts on what directions are worth
> > > > experimenting
> > > > > > > with?
> > > > > > > > > > > > >
> > > > > > > > > > > > > One option we should consider is for each backend to
> > > > connect
> > > > > > > to
> > > > > > > > > Xen via
> > > > > > > > > > > > > the IOREQ interface. We could generalize the IOREQ
> > > > interface
> > > > > > > and
> > > > > > > > > make it
> > > > > > > > > > > > > hypervisor agnostic. The interface is really trivial
> > and
> > > > easy
> > > > > > > to
> > > > > > > > > add.
> > > > > > > > > > > >
> > > > > > > > > > > > As I said above, my proposal does the same thing that
> > you
> > > > > > > mentioned
> > > > > > > > > here :)
> > > > > > > > > > > > The difference is that I do call hypervisor interfaces
> > via
> > > > > > > virtio-
> > > > > > > > > proxy.
> > > > > > > > > > > >
> > > > > > > > > > > > > The only Xen-specific part is the notification
> > mechanism,
> > > > > > > which is
> > > > > > > > > an
> > > > > > > > > > > > > event channel. If we replaced the event channel with
> > > > something
> > > > > > > > > else the
> > > > > > > > > > > > > interface would be generic. See:
> > > > > > > > > > > > > https://gitlab.com/xen-project/xen/-
> > > > > > > > > /blob/staging/xen/include/public/hvm/ioreq.h#L52
> > > > > > > > > > > > >
> > > > > > > > > > > > > I don't think that translating IOREQs to eventfd in
> > the
> > > > kernel
> > > > > > > is
> > > > > > > > > a
> > > > > > > > > > > > > good idea: if feels like it would be extra
> > complexity
> > > > and that
> > > > > > > the
> > > > > > > > > > > > > kernel shouldn't be involved as this is a backend-
> > > > hypervisor
> > > > > > > > > interface.
> > > > > > > > > > > >
> > > > > > > > > > > > Given that we may want to implement BE as a bare-metal
> > > > > > > application
> > > > > > > > > > > > as I did on Zephyr, I don't think that the translation
> > > > would not
> > > > > > > be
> > > > > > > > > > > > a big issue, especially on RTOS's.
> > > > > > > > > > > > It will be some kind of abstraction layer of interrupt
> > > > handling
> > > > > > > > > > > > (or nothing but a callback mechanism).
> > > > > > > > > > > >
> > > > > > > > > > > > > Also, eventfd is very Linux-centric and we are
> > trying to
> > > > > > > design an
> > > > > > > > > > > > > interface that could work well for RTOSes too. If we
> > > > want to
> > > > > > > do
> > > > > > > > > > > > > something different, both OS-agnostic and
> > hypervisor-
> > > > agnostic,
> > > > > > > > > perhaps
> > > > > > > > > > > > > we could design a new interface. One that could be
> > > > > > > implementable
> > > > > > > > > in the
> > > > > > > > > > > > > Xen hypervisor itself (like IOREQ) and of course any
> > > > other
> > > > > > > > > hypervisor
> > > > > > > > > > > > > too.
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > There is also another problem. IOREQ is probably not
> > be
> > > > the
> > > > > > > only
> > > > > > > > > > > > > interface needed. Have a look at
> > > > > > > > > > > > > https://marc.info/?l=xen-devel&m=162373754705233&w=2.
> > > > Don't we
> > > > > > > > > also need
> > > > > > > > > > > > > an interface for the backend to inject interrupts
> > into
> > > > the
> > > > > > > > > frontend? And
> > > > > > > > > > > > > if the backend requires dynamic memory mappings of
> > > > frontend
> > > > > > > pages,
> > > > > > > > > then
> > > > > > > > > > > > > we would also need an interface to map/unmap domU
> > pages.
> > > > > > > > > > > >
> > > > > > > > > > > > My proposal document might help here; All the
> > interfaces
> > > > > > > required
> > > > > > > > > for
> > > > > > > > > > > > virtio-proxy (or hypervisor-related interfaces) are
> > listed
> > > > as
> > > > > > > > > > > > RPC protocols :)
> > > > > > > > > > > >
> > > > > > > > > > > > > These interfaces are a lot more problematic than
> > IOREQ:
> > > > IOREQ
> > > > > > > is
> > > > > > > > > tiny
> > > > > > > > > > > > > and self-contained. It is easy to add anywhere. A
> > new
> > > > > > > interface to
> > > > > > > > > > > > > inject interrupts or map pages is more difficult to
> > > > manage
> > > > > > > because
> > > > > > > > > it
> > > > > > > > > > > > > would require changes scattered across the various
> > > > emulators.
> > > > > > > > > > > >
> > > > > > > > > > > > Exactly. I have no confident yet that my approach will
> > > > also
> > > > > > > apply
> > > > > > > > > > > > to other hypervisors than Xen.
> > > > > > > > > > > > Technically, yes, but whether people can accept it or
> > not
> > > > is a
> > > > > > > > > different
> > > > > > > > > > > > matter.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > -Takahiro Akashi
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > Regards,
> > > > > > > > > > >
> > > > > > > > > > > Oleksandr Tyshchenko
> > > > > > > > > > IMPORTANT NOTICE: The contents of this email and any
> > > > attachments are
> > > > > > > > > confidential and may also be privileged. If you are not the
> > > > intended
> > > > > > > > > recipient, please notify the sender immediately and do not
> > > > disclose
> > > > > > > the
> > > > > > > > > contents to any other person, use it for any purpose, or
> > store
> > > > or copy
> > > > > > > the
> > > > > > > > > information in any medium. Thank you.
> > > > > > > > IMPORTANT NOTICE: The contents of this email and any
> > attachments
> > > > are
> > > > > > > confidential and may also be privileged. If you are not the
> > intended
> > > > > > > recipient, please notify the sender immediately and do not
> > disclose
> > > > the
> > > > > > > contents to any other person, use it for any purpose, or store
> > or
> > > > copy the
> > > > > > > information in any medium. Thank you.
> > > > > > IMPORTANT NOTICE: The contents of this email and any attachments
> > are
> > > > confidential and may also be privileged. If you are not the intended
> > > > recipient, please notify the sender immediately and do not disclose
> > the
> > > > contents to any other person, use it for any purpose, or store or copy
> > the
> > > > information in any medium. Thank you.
> > > IMPORTANT NOTICE: The contents of this email and any attachments are
> > confidential and may also be privileged. If you are not the intended
> > recipient, please notify the sender immediately and do not disclose the
> > contents to any other person, use it for any purpose, or store or copy the
> > information in any medium. Thank you.

