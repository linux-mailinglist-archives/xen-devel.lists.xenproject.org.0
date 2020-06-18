Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976D1FEE0D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 10:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlqCY-00040u-TM; Thu, 18 Jun 2020 08:47:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlqCX-00040p-Gb
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 08:47:13 +0000
X-Inumbo-ID: 4cc3b0ac-b140-11ea-ba55-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cc3b0ac-b140-11ea-ba55-12813bfff9fa;
 Thu, 18 Jun 2020 08:47:11 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PcQvqfoHE7Vw3F5SVbEBQSalkL2Rlin8QEAfeUiJnGk0dOGFgcRRB1TkGMgpjCADKHAao4NgPO
 u5SI9nUOytKNNDkSX9/p8kPOd+juGqH/ydQ0gheFchN7QD5SBvjZBeZssv3xLitn0ZKmllolZ6
 Ic0+PWUQ5yUgiaM9A0vU5XdYTSEvtgRJSrVIlgbWLV/KLl7ShFroxFHtYqOR7Y+Cry5JjHade2
 H7l0UVmyQdMNNquzLlXFZIYbJef4Dk4R5ichgipwBIWQAglp/Yg+Uf58MVT9QXa4jvPnD/6zv8
 QrU=
X-SBRS: 2.7
X-MesageID: 20575818
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20575818"
Date: Thu, 18 Jun 2020 10:46:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
Message-ID: <20200618084656.GF735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 09:13:05PM +0200, Michał Leszczyński wrote:
> ----- 16 cze 2020 o 19:23, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
> > On Tue, Jun 16, 2020 at 05:22:06PM +0200, Michał Leszczyński wrote:
> >> +        buf_order = get_order_from_bytes(a.size);
> >> +
> >> +        if ( (a.size >> PAGE_SHIFT) != (1 << buf_order) ) {
> > 
> > Oh here is the check. I think you can move this with the checks above
> > by doing a.size & ~PAGE_MASK.
> 
> 
> I belive it's more strict than a.size & ~PAGE_MASK. I think that CPU expects that the buffer size is a power of 2, so you can have 64 MB or 128 MB, but not 96 MB buffer.

Oh, sorry, didn't realize. I think it's clearer to check if a size is
not a power of two by doing (size & (size - 1)). This could be joined
with the previous checks.

> > There are a couple of options here, maybe the caller could provide
> > it's own buffer, then Xen would take an extra reference to those pages
> > and setup them to be used as buffers.
> > 
> > Another alternative would be to use domhep memory but not let the
> > caller map it directly, and instead introduce a hypercall to copy
> > from the internal Xen buffer into a user-provided one.
> > 
> > How much memory is used on average by those buffers? That would help
> > decide a model that would best fit the usage.
> 
> 
> From 4 kB to 4 GB. Right now I use 128 MB buffers and it takes just a few seconds to fill them up completely.
> 
> I think I've just copied the pattern which is already present in Xen's code, e.g. interfaces used by xenbaked/xentrace tools.

I think using XENMEM_acquire_resource will result in cleaner code
overall, it would also avoid having to share the pages with Xen
AFAICT. It's also more inline with how new interfaces deal with this
kind of memory sharing.

Roger.

