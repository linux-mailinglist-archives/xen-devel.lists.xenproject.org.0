Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8465402817
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 13:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180876.327736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZh4-0000jl-5U; Tue, 07 Sep 2021 11:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180876.327736; Tue, 07 Sep 2021 11:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZh4-0000hM-2R; Tue, 07 Sep 2021 11:55:14 +0000
Received: by outflank-mailman (input) for mailman id 180876;
 Tue, 07 Sep 2021 11:55:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKkb=N5=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mNZh3-0000hG-6G
 for xen-devel@lists.xen.org; Tue, 07 Sep 2021 11:55:13 +0000
Received: from mail-pg1-x52e.google.com (unknown [2607:f8b0:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f96934d6-4c9f-4cf9-8d9a-8c1e3d079d13;
 Tue, 07 Sep 2021 11:55:11 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 17so9680300pgp.4
 for <xen-devel@lists.xen.org>; Tue, 07 Sep 2021 04:55:11 -0700 (PDT)
Received: from laputa (p784a2304.tkyea130.ap.so-net.ne.jp. [120.74.35.4])
 by smtp.gmail.com with ESMTPSA id 73sm11108630pfu.92.2021.09.07.04.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:55:10 -0700 (PDT)
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
X-Inumbo-ID: f96934d6-4c9f-4cf9-8d9a-8c1e3d079d13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YGmEUWYy+3Y27wr4j+eiPDJQoM70U3zAZRfNASz1Nxs=;
        b=sixtt0LE5+rubYhgxQ3gxIafb8BStveV0zCkKP/TTVFMc+wR2FvKIgcx5BMnbVcgkF
         +kYmg5CpMon18Fyk1Uvz6jjVf0ydAFlhf12YPdTboaCmTCE84wSga+8TcQkeXAxPfBPB
         xgKEo0Dr5MSNm82QIbNhq6RVWIn7iSjrc46L6pkxQN22Qsu8GSaDDK5Tfl8v4LoOHOiL
         3UQZqfxnLQl9KaqXvwt5IF8QBycWnyMBVOmTEOC9sFa55uxxUXvjPFmiP2UYqrGaZ7ZV
         iTMwctPVRveEqOsMcSJVcZZNt4wJlzqkes0Nkzub72NOv+qqRhyJdjw9mNb4/TbP26LH
         SkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGmEUWYy+3Y27wr4j+eiPDJQoM70U3zAZRfNASz1Nxs=;
        b=bMJ16mmDMPBBRs+ZpQiqVuYszyw04l6vpdMi32n/AOOI+nSgOHeZezbzRoHrVAbXsY
         R6Ms1nZKemnk2Jqr3R72ngo7o4N68jJGhehjsTW6wmor2vtiPPYEq9NQNQHXI9tRqD9F
         W9Ee5qdLQCdGT2Pu/gspOLPcnJjek2sYuMfJJAa2jYs+5AFuI+r1OFhy3Q+fQ+xQyHyo
         ilYXE7sLiszgU51k2uYMSKwjFF7WSnWUK8PdJue/EDY/PwKVijo+PsAp7AG0AnqPNEmP
         K0RZQaDEluvhGYDXQXR9VycZg1ctbZ+63Nah8/wVe9pyRWbST87/12vyihw/poJdyKjQ
         npJQ==
X-Gm-Message-State: AOAM531KtKE6zefo3NfgsCnXtxXsbLouxXUtr1unbibErXd/cgm/IeId
	wazeozlj79t3RkEhT1crV/lQsQ==
X-Google-Smtp-Source: ABdhPJz84h7MB9crcdLnGhrW7TXCZ3clzq/fXzbX64JcR9tazl28nxPVp/iHoLXGuJYQsyneDaM4pg==
X-Received: by 2002:a63:36c4:: with SMTP id d187mr12368353pga.205.1631015710887;
        Tue, 07 Sep 2021 04:55:10 -0700 (PDT)
Date: Tue, 7 Sep 2021 20:55:01 +0900
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
Message-ID: <20210907115501.GC49004@laputa>
References: <DB9PR08MB6857C656472153A42FB438C49EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210818053840.GE39588@laputa>
 <DB9PR08MB6857D1BE810B1D1DAF7B12AE9EFF9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <20210820064150.GC13452@laputa>
 <20210826094047.GA55218@laputa>
 <DB9PR08MB68578198FF352EDC473D619E9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CACMJ4GbmNgbB5ponYt3NGEk3j6YCksot+kDy2qs8HMdFXWnQbw@mail.gmail.com>
 <CACMJ4GbqPc29n+CAknY4kCjrQnkCSR=W+rymuY7Xa1EZb0MW5w@mail.gmail.com>
 <20210902071902.GC71098@laputa>
 <CACMJ4GYY0wkm0vOzJfq8M9dCxPq1ZFwWT8Q73rMjqtrP7if-Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJ4GYY0wkm0vOzJfq8M9dCxPq1ZFwWT8Q73rMjqtrP7if-Zw@mail.gmail.com>

Hi,

I have not covered all your comments below yet.
So just one comment:

On Mon, Sep 06, 2021 at 05:57:43PM -0700, Christopher Clark wrote:
> On Thu, Sep 2, 2021 at 12:19 AM AKASHI Takahiro <takahiro.akashi@linaro.org>
> wrote:

(snip)

> >    It appears that, on FE side, at least three hypervisor calls (and data
> >    copying) need to be invoked at every request, right?
> >
> 
> For a write, counting FE sendv ops:
> 1: the write data payload is sent via the "Argo ring for writes"
> 2: the descriptor is sent via a sync of the available/descriptor ring
>   -- is there a third one that I am missing?

In the picture, I can see
a) Data transmitted by Argo sendv
b) Descriptor written after data sendv
c) VirtIO ring sync'd to back-end via separate sendv

Oops, (b) is not a hypervisor call, is it?
(But I guess that you will have to have yet another call for notification
since there is no config register of QueueNotify?)

Thanks,
-Takahiro Akashi


> Christopher
> 
> 
> >
> > Thanks,
> > -Takahiro Akashi
> >
> >
> > > * Here are the design documents for building VirtIO-over-Argo, to
> > support a
> > >   hypervisor-agnostic frontend VirtIO transport driver using Argo.
> > >
> > > The Development Plan to build VirtIO virtual device support over Argo
> > > transport:
> > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Development+Phase+1
> > >
> > > A design for using VirtIO over Argo, describing how VirtIO data
> > structures
> > > and communication is handled over the Argo transport:
> > > https://openxt.atlassian.net/wiki/spaces/DC/pages/1348763698/VirtIO+Argo
> > >
> > > Diagram (from the above document) showing how VirtIO rings are
> > synchronized
> > > between domains without using shared memory:
> > >
> > https://openxt.atlassian.net/46e1c93b-2b87-4cb2-951e-abd4377a1194#media-blob-url=true&id=01f7d0e1-7686-4f0b-88e1-457c1d30df40&collection=contentId-1348763698&contextId=1348763698&mimeType=image%2Fpng&name=device-buffer-access-virtio-argo.png&size=243175&width=1106&height=1241
> > >
> > > Please note that the above design documents show that the existing VirtIO
> > > device drivers, and both vring and virtqueue data structures can be
> > > preserved
> > > while interdomain communication can be performed with no shared memory
> > > required
> > > for most drivers; (the exceptions where further design is required are
> > those
> > > such as virtual framebuffer devices where shared memory regions are
> > > intentionally
> > > added to the communication structure beyond the vrings and virtqueues).
> > >
> > > An analysis of VirtIO and Argo, informing the design:
> > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1333428225/Analysis+of+Argo+as+a+transport+medium+for+VirtIO
> > >
> > > * Argo can be used for a communication path for configuration between the
> > > backend
> > >   and the toolstack, avoiding the need for a dependency on XenStore,
> > which
> > > is an
> > >   advantage for any hypervisor-agnostic design. It is also amenable to a
> > > notification
> > >   mechanism that is not based on Xen event channels.
> > >
> > > * Argo does not use or require shared memory between VMs and provides an
> > > alternative
> > >   to the use of foreign shared memory mappings. It avoids some of the
> > > complexities
> > >   involved with using grants (eg. XSA-300).
> > >
> > > * Argo supports Mandatory Access Control by the hypervisor, satisfying a
> > > common
> > >   certification requirement.
> > >
> > > * The Argo headers are BSD-licensed and the Xen hypervisor implementation
> > > is GPLv2 but
> > >   accessible via the hypercall interface. The licensing should not
> > present
> > > an obstacle
> > >   to adoption of Argo in guest software or implementation by other
> > > hypervisors.
> > >
> > > * Since the interface that Argo presents to a guest VM is similar to
> > DMA, a
> > > VirtIO-Argo
> > >   frontend transport driver should be able to operate with a physical
> > > VirtIO-enabled
> > >   smart-NIC if the toolstack and an Argo-aware backend provide support.
> > >
> > > The next Xen Community Call is next week and I would be happy to answer
> > > questions
> > > about Argo and on this topic. I will also be following this thread.
> > >
> > > Christopher
> > > (Argo maintainer, Xen Community)
> > >
> > >
> > --------------------------------------------------------------------------------
> > > [1]
> > > An introduction to Argo:
> > >
> > https://static.sched.com/hosted_files/xensummit19/92/Argo%20and%20HMX%20-%20OpenXT%20-%20Christopher%20Clark%20-%20Xen%20Summit%202019.pdf
> > > https://www.youtube.com/watch?v=cnC0Tg3jqJQ
> > > Xen Wiki page for Argo:
> > >
> > https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen
> > >
> > > [2]
> > > OpenXT Linux Argo driver and userspace library:
> > > https://github.com/openxt/linux-xen-argo
> > >
> > > Windows V4V at OpenXT wiki:
> > > https://openxt.atlassian.net/wiki/spaces/DC/pages/14844007/V4V
> > > Windows v4v driver source:
> > > https://github.com/OpenXT/xc-windows/tree/master/xenv4v
> > >
> > > HP/Bromium uXen V4V driver:
> > > https://github.com/uxen-virt/uxen/tree/ascara/windows/uxenv4vlib
> > >
> > > [3]
> > > v2 of the Argo test unikernel for XTF:
> > >
> > https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg02234.html
> > >
> > > [4]
> > > Argo HMX Transport for VirtIO meeting minutes:
> > >
> > https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01422.html
> > >
> > > VirtIO-Argo Development wiki page:
> > >
> > https://openxt.atlassian.net/wiki/spaces/DC/pages/1696169985/VirtIO-Argo+Development+Phase+1
> > >
> >
> >

