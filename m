Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE2124C620
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 21:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8psf-0001N3-1n; Thu, 20 Aug 2020 19:05:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ewgh=B6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k8psd-0001My-Ru
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 19:05:43 +0000
X-Inumbo-ID: 958985c3-ef7c-4763-b840-b9f2d79a718a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 958985c3-ef7c-4763-b840-b9f2d79a718a;
 Thu, 20 Aug 2020 19:05:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2819F2075E;
 Thu, 20 Aug 2020 19:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597950342;
 bh=2v4Mnxlh57Qnx/NifdW8X409lUetGRUdGrkuT0Gdd1k=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=c+yoP2YU4/8ih+Ql8Uyji7ikZTKegUImXKto30QGsBQoHBkNy4AmfOV9FinFitQCm
 QozUSt8XbYitzZgQ5sOgWkPa0RyuOHj5YLciH/pF0vdG8kqzfcUXnEhihAIbaOscTp
 mNg1mhixJiU1jhKFl694tOS/+IHMThko32AeyKGg=
Date: Thu, 20 Aug 2020 12:05:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <Andrew.Cooper3@citrix.com>, 
 George Dunlap <George.Dunlap@citrix.com>, 
 "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>, 
 "wl@xen.org" <wl@xen.org>, 
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 01/14] kernel-doc: public/arch-arm.h
In-Reply-To: <24379.52418.438897.155721@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2008201157520.6005@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-1-sstabellini@kernel.org>
 <24379.52418.438897.155721@mariner.uk.xensource.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 18 Aug 2020, Ian Jackson wrote:
> Stefano Stabellini writes ("[PATCH 01/14] kernel-doc: public/arch-arm.h"):
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Convert in-code comments to kernel-doc format wherever possible.
> 
> Thanks.  But, err, I think there is not yet any in-tree machinery for
> actually building and publishing these kernel-doc comments ?

No, there isn't. But you can call kernel-doc on the headers manually and
it will produce fully readable docs in RST format. (Then you can covert
RST docs to HTML with Sphinx.) Like:

  kernel-doc xen/include/public/features.h > readme-features.rst

I also gave a few more details on the plan I had in my other email
reply.


> As I said I think replacing our ad-hoc in-tree system with kernel-doc
> is a good idea, but...
> 
> > -/*
> > - * `incontents 50 arm_abi Hypercall Calling Convention
> > +/**
> > + * DOC: Hypercall Calling Convention
> 
> ... let us not replace the in-tree markup for that system until we
> have its replacement.

Ah! I didn't know what 

  `incontents 50 arm_abi

was for. I assumed it was a relic of another era and removed it.

Is it actually used (and the other markups like that)? Is there
a script somewhere that parses it in xen.git or on xenbits already?

If they are in-use, then I can try to retain them for now until we have
the kernel-doc infrastructure on xenbits -- they should be compatible
with the kernel-doc syntax.

