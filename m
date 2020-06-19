Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178C2201BF3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 22:04:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmNDv-00034j-2W; Fri, 19 Jun 2020 20:02:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXJh=AA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jmNDt-00034e-9Q
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 20:02:49 +0000
X-Inumbo-ID: d918a652-b267-11ea-bca7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d918a652-b267-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 20:02:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8457320C09;
 Fri, 19 Jun 2020 20:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592596967;
 bh=xe6f8xVE2c7sP+o0l9LR95vqUYc1YGec51+cHjGjrho=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eG/b0fibL/aORRg7B6B7jEHbsopAzR4FkjYympc4U9jM2OMTAnnGVMJJAdtIaabwp
 Ljd7mQRFNTWQullN1Sk0SXc5HfPuPaJ2b7ATBhMTa+90uLZwv4OkFDRUhqZiss8dJ6
 yoocFlb6Lmom3lQil+It5gj8BA/ufz8CRvmXe91Y=
Date: Fri, 19 Jun 2020 13:02:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 18 Jun 2020, Julien Grall wrote:
> > Copy/pasting here from my comment on the pull request plus additional
> > thoughts.
> >
> > Uboot is one of those embedded projects that typically assumes that all
> > the information about the platform is available at *build time*. It is
> > meant to be built tailored for a specific version of a specific board. A
> > Uboot binary is not expected to be "portable" across different versions
> > of the platform or different platforms. In other words, it is not
> > expected to be portable across Xen versions.
> 
> Can you define "version" here? Do you refer to the difference in terms
> of memory?
 
Yes, I meant any meaningful differences in any of the external
interfaces that end up impacting the UBoot implementation. A primary
example would be the memory addresses for instance.


> > This is a different model meant for different use-cases. I don't think
> > it is a problem "philosophically" to let Uboot know about Xen details at
> > build time. Yes, that is not what we did historically but it is very
> > much in the spirit of Uboot.
> 
> TBH, I don't particularly mind that U-boot is built against a specific
> version of Xen. I am more concerned about the long term implication if
> we endorse it
> and then try to change the memory layout in depth.

I'll provide more information below.


> > But of course the least Uboot depends on these details the better
> > because it will be more flexible, but it could very well be that we
> > won't be able to reach the point where the binary works on any version
> > like we did with Tianocore. The two projects work differently.
> 
> Can we have a list of things U-boot require to know at compile time?
> 
> In particular, I would like to understand if it would be sufficient to
> only be aware of the first bank. If it is, then my preference would be
> to standardize that bit of the layout.

That would be my preference too, and it was great to read that it looks
like it can be done. Yay!


> > That said, I think Julien is right that we need to be careful on how we
> > expose these information to Uboot, i.e. defining __XEN__ to build Uboot
> > doesn't seem like a good idea because we enable definitions that were
> > never meant to be used outside of a Xen build. Also, it wouldn't be easy
> > to know exactly which definitions are actively used by Uboot and which
> > ones aren't.
> >
> > If we are going to make Uboot dependent on version-specific information
> > of the Xen interface, it would be better to be very clear about which
> > definitions we are using. So that one day if we need to change them, we
> > can find them easily.
> >
> > So I think it would be better to introduce a set of defines with the
> > minimum amount of information required by Uboot statically. That way,
> > at least we have a single place where to find all the version-specific
> > definitions that Uboot is using.
> 
> I am not sure what you are suggesting. Can you expand a bit more?
> 
> > We can also manage versioning of the
> > Xen interface (like we do in QEMU) if we have to.
> 
> Can you provide more details about the compatibility? I am quite
> interested in the part where you would have to deal with an older QEMU
> version built against a new Xen?

Sure let me expand a bit more. I'll switch "hat" to "QEMU (or UBoot)
contributor" for the sake of this discussion.

Xen Project offers certain stability guarantees on some interfaces and
not others. Let's say that for any reason you have to or want to use one
of the unstable interfaces in QEMU/UBoot/Whatever. Then it becomes your
responsibility as QEMU developer to maintain compatibility in QEMU
itself.

First I'd add code to detect the version of the interface. The detection
is based on the Xen headers/libraries provided. In QEMU it is done in
the "configure" script. It sets a preprocessor #define to the version
of the interface (e.g. CONFIG_XEN_CTRL_INTERFACE_VERSION == 41100).

Then you can have preprocessors checks in one of the headers such as:

#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
    #define xenevtchn_open(l, f) xc_evtchn_open(l, f);
#else
    XXX
#endif


And also like:

#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40600

#ifndef HVM_IOREQSRV_BUFIOREQ_ATOMIC
#define HVM_IOREQSRV_BUFIOREQ_ATOMIC 2
#endif

#endif


This works OK to handle differences in the interface between past
versions of Xen. What about building an older QEMU against a new version
of Xen? That is not going to work if something changes again on the Xen
side. However, it becomes much easier to add support for the new Xen
interface in QEMU, because you can go and look at that compatibility
header and just add the right #else XXX. It also makes it clear what
interfaces and definitions have been used that are unstable.

Of course it is better to use the stable interfaces when possible :-)

