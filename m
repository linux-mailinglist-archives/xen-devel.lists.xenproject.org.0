Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D814313D4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 11:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211898.369582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPIZ-0000Fx-PK; Mon, 18 Oct 2021 09:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211898.369582; Mon, 18 Oct 2021 09:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPIZ-0000E8-MB; Mon, 18 Oct 2021 09:51:15 +0000
Received: by outflank-mailman (input) for mailman id 211898;
 Mon, 18 Oct 2021 09:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MtCQ=PG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mcPIY-0000E2-RF
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 09:51:14 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed67dc1d-2ff8-11ec-82d1-12813bfff9fa;
 Mon, 18 Oct 2021 09:51:13 +0000 (UTC)
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
X-Inumbo-ID: ed67dc1d-2ff8-11ec-82d1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634550672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icSp3kkXvElRcEr7OU/i0al2/gtlmtJkYazfCeUEbYg=;
  b=U+VZbtHWoM6KWiRwSQmwHLvpkMl6/mKQjZQJFZu2GE2zH6jIaDYYWUAX
   YPK72XNRnveVwNlKAhAjp0Bc+0Ehs/0jerfCI7BOu0Zgvy+f1IlQUHdqW
   sbfKPlgWgRy5M4dZIWKULrOUUp+RZ3LBLfmQe4fJY27PzCgZRRtLFGzfu
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iZwXk77X7tVxmWmQa3b+epkYfrqoH1hSsv1JyWkxP/41SFCjXFzrs4+0g7maMVaYW/PAYYHDXp
 00t4HPfM4Z2AxmSjT+IS6/MjMdGaSs3YGmAEFxYqeKzzuMXdx7sS7F/sY5VR8ZccbwCkjL36Um
 EbB0iOppZfFpDsqKH1my+tQuDvSkatOgQfPrQ3eps2CJymPjIN0QfS7kVk3RgiFUWFBoiu3N7m
 8AVv8nu0DCW1kdWXpp2mtk60h44gpNgKs6ENO7LB8mdR1OK6kKKq1hpGuXczs3e08fq3MF4UVz
 wVSkx++ixVYLojtb9+V2NCUc
X-SBRS: 5.1
X-MesageID: 54980816
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7+WWYq7/F1hvHr6XRCGk8gxRtEzBchMFZxGqfqrLsTDasY5as4F+v
 jQdWWmEOPeDMTT0eNona4W/9RkBv5fdy9E2Gwtu+H8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 PdvnJCoFwkVP4KLxMUtTSl9F39mFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTQaeOP
 5pAN1KDajz9MixmJHlLJakbkdqvpnzETSJCt0ys8P9fD2/7k1UqjemF3MDuUt+NQ99ckgCHp
 2bF12PjCxoeOZqUzj/t2kyrgujDjCbqQrU4Hbez9uNpqFCLz2lVAxoTPXO3rvW0hVS3c85OI
 EwTvCw1pO4981LDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpZMQ9sc4qRRQjz
 lKTg87yHjtrraGUTnSGsLyTqFuaODcXBX8PYzceSgkI6MWlp5s85jrNRNt+FK++jvXuBCr9h
 TuNqUAWhagXjMMN/7W2+xbAmT3EjofNZh444EPQRG3NxhhieIevaois6F7axfVNNoCUSh+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqU5NPbAt72qjx3+MOtxx0C9OAUM3Ku9RLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquLNoQWM/CdYCfCpXs0PRfBgAgBhWB1yflnU
 ap3Z/pAGprz5U5P9zGxW/sGmYEiwiQz1As/rriqkkz5j9JyiJOTIIrp0WdijMhktMtoQy2Pq
 r6z0vdmLT0FAYUShQGMqeYuwagidyRTOHwPg5U/mhS/CgRnAno9LPTa3KksfYdo94wMyLyUo
 iDgCxUElACu7ZEiFelsQioyAF8Idc0nxU/XwAR2ZQr4s5TdSdfHAFgjm2sfIuB8qb0LIQ9cR
 PgZYcSQasmjuRyckwnxmaLV9dQ4HDzy3FrmF3P8PFAXIs4xLySUq4SMVla+q0Ez4t+f6JJWT
 0uIjViAH/Luhm1KUa7rVR5Y5wjt5CdAxL8rAhKgzxs6UByEzbWG4hfZ1pcfS/zg4z2frtdD/
 wrJUxoeu8fXpIo5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtFLuC
 EKC89VXI5uTP8bhHAJDLQYpdL3bh/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 ep44ZwY8Q2yjBYuI+2qtCEM+jTeNGEEXoUmqooeXN3hhD00xwwQepfbECL3vs2CMo0eLkkwL
 zaIr6PenLAAlFHaen8+GHWRj+pQgZMC5EJDwFMYfgnbn9PEgrk83QFL8CRxRQNQl00V3+V2M
 2ltFkt0OaTRoGs42JkdBzihS1NbGRmU2k3t0F9YxmTWQn6hWnHJMGBga/2G+1oU8j4EczVWl
 F1CJL0Jjdo+kBnN4xYP
IronPort-HdrOrdr: A9a23:anYqX6yHcPyvehbYQ4k4KrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="54980816"
Date: Mon, 18 Oct 2021 10:51:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the
 xen build
Message-ID: <YW1Dhn+oEwvKgj04@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com>
 <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com>

On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
> On 15.10.2021 18:58, Anthony PERARD wrote:
> > On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
> >> On 24.08.2021 12:50, Anthony PERARD wrote:
> >>> --- a/xen/Rules.mk
> >>> +++ b/xen/Rules.mk
> >>> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
> >>>                           $(foreach r,rel rel.ro,data.$(r).local)
> >>>  
> >>>  # The filename build.mk has precedence over Makefile
> >>> -mk-dir := $(src)
> >>> +mk-dir := $(srctree)/$(src)
> >>>  include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
> >>
> >> Perhaps already when it was changed to $(src) the name has become
> >> slightly misleading, at least imo: I would rather expect a variable
> >> with this name to refer to the build dir/tree. Maybe "srcdir" or
> >> even shorted "sd" right from the start? (Reaching here I can finally
> >> see why having a shorthand is helpful.)
> > 
> > I have to think about that. I've made some further progress in order to
> > be able to build the Xen pvhshim without a link farm and notice that
> > nearly every source file needs to use "$(srctree)/$(src)"
> 
> Oh, now I'm curious as to the why here. I thought use of $(srctree)
> ought to be the exception.

In Linux, the use of $(srctree) is indeed the exception. This is because
we have VPATH=$(srctree), so when `make` look for a prerequisite or a
target it will look first in the current directory and then in
$(srctree). That works fine as long as the source tree only have sources
and no built files.

But if we want to be able to build the pv-shim without the linkfarm and
thus using out-of-tree build, we are going to need the ability to build
from a non-clean source tree. I don't think another way is possible.

This can be done by teaching make to only look for source file in
$(srctree), and to look for generated/built file only in $(objtree).
That's mostly done by not using VPATH and making few other adjustments.

I hope my description of where I'm going isn't too convoluted.

> > and I'm not
> > sure "$(src)" could be use alone. So having a single variable which have
> > both would be useful.
> > 
> > "srcdir" might be to close to "srctree" and one might mistake it for the
> > other, so "sd" might be better.
> 
> While I did suggest "sd" as an option, already when writing this I
> wasn't convinced this would be descriptive enough. Personally I think
> "dir" and "tree" are sufficiently different names. I would suggest
> "srcroot" for what is now "srctree", but that would have the
> disadvantage of getting us out of sync with Linux.

Ok, I guess "srcdir" is good. Thanks.

-- 
Anthony PERARD

