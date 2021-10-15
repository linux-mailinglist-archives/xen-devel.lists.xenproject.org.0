Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEC42F821
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210891.367912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQ61-0000qs-OF; Fri, 15 Oct 2021 16:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210891.367912; Fri, 15 Oct 2021 16:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQ61-0000oJ-KT; Fri, 15 Oct 2021 16:30:13 +0000
Received: by outflank-mailman (input) for mailman id 210891;
 Fri, 15 Oct 2021 16:30:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHjW=PD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mbQ60-0000oD-5U
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:30:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8eb0273a-94c9-4b42-8284-1a586b747e45;
 Fri, 15 Oct 2021 16:30:11 +0000 (UTC)
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
X-Inumbo-ID: 8eb0273a-94c9-4b42-8284-1a586b747e45
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634315411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGSDXXQE4WBg3zOQ11gfgUZFblK5mM4fhPPFUp02v/o=;
  b=Iu7NUf5fNTVTSa5SXzzfy3BlLcnYZegpJsRFxBzUb7T6fNBa3AmV1ERs
   WU1gmCQG8lIEr53z8WR3jDMfPJKMh30kwFG/rGm84nLVXC7O9ERnucFr7
   Ne6u4cnd3ZorZ852/CrzFkKq2eHzQHQIunW8W4FV+88MwxpUBn/RmU15Z
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PjFuDB8HcK49fvC+aa6iaXLinSJyBB530Fv39ALzOtaxxyaSCJwGlePfXTnC1tAIEWAR6+RGK4
 McXgJUM8Z/o03f/DFqUgsMbfWIGPq2ivAqKKmoaHIIBUgRWBYyvnSKkTvardOlBtw759y9G0Aq
 IQb7zSVzwqZot6PiQ0qvgN73+rFDKTEm+Ahn77d7dlBfpWnmfwSQtRa/QabsJujZY4ACdTNET6
 GEQsHQQa0GtiKVXG9c3sf6e8ypNUjBsSeQR62nKNJPkyZAVjvGTrdpmTsqfruWLcyAZaaxNBi+
 qJ34IQoe9BTIntABKqJcaI45
X-SBRS: 5.1
X-MesageID: 55334737
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JjlNWa2QdP4PG/7XePbD5XJ2kn2cJEfYwER7XKvMYLTBsI5bpzQCm
 GscXW/QOaveY2KnfdhzPImz/U8BscLWmNdlQAJlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wrNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhoOpj7
 /Rii7GMeA41OOqLvKcvDDxKHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t25sVQamFO
 KL1bxJ1NA/sf0V1GGsdGYxnu+qkp0Hyc35x/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 lzB+2P1ExQLLuu1wDCO8m+vruLXlCa9U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwAOHx7fQ4g2ZLnMZVTMHY9sj3Oc3Wj4Cx
 lKPh8nuBzFkrPuSU3313rWJqTK/PwAFIGlEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 Ri1ljoZppotoPI63rm9uhfjwADzg4rGG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxJDAtLFm4YWl0XXXGr1UTe7BC+OtaWWE2TZS848dGyNBEpJJVbtb5y1iPw9XO8IAdC6Bj
 KT76F4JusE70JdHa8ZKj2ON5yYCkfeI+TfNDKm8gj9yjn5ZL1LvEMZGPx/44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2IGcqglU/6iOrEOhZ5rIvp1nPVM4jVC4vf+G3oH
 yt3bZPWm32zrsWvCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF8qrE9l6cvE
 aRcEyhCa9wWIgn6F/0mRcGVhORfmN6D2Wpi5gKpP2oyeYBOXQvM9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aYcMNOfEjM8ZRxL3CjhPEAPMxRew7IwSGX1
 ljKDE5A9/XNuYI87PLAmbuA89WyC+J7E0cDRzvb4L+6ODP05G2mxYMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpRSyZYU6qB7VsJmi98fNO7qAdlKVEvQaWW
 16U/oUIM7u+J864QkUaIxAob7rf2KhMyCXS9/k8PG7z+DRzoOicSUxXMhSB1H5dIb9yPN93y
 OstopdLuQm2ix5sOdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cHdcchIP2krP
 iSQ1fjLiLlrz0bfd2Y+SCrW1u1HiJVS4B1HwTfu/bhSdgYpUhPv4CBszA==
IronPort-HdrOrdr: A9a23:YXQvPahUmyzUooo6TBZ6jOctg3BQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.85,376,1624334400"; 
   d="scan'208";a="55334737"
Date: Fri, 15 Oct 2021 17:29:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 42/51] build: grab common EFI source files in arch
 specific dir
Message-ID: <YWmse5Sv2SFyRMdj@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
 <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com>

On Thu, Oct 14, 2021 at 10:51:44AM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > --- a/xen/arch/arm/efi/Makefile
> > +++ b/xen/arch/arm/efi/Makefile
> > @@ -1,4 +1,10 @@
> >  CFLAGS-y += -fshort-wchar
> > +CFLAGS-y += -I$(srctree)/common/efi
> 
> Perhaps another opportunity for -iquote?

Yes.

> >  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
> >  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> > +
> > +$(obj)/%.c: common/efi/%.c
> > +	$(Q)cp -f $< $@
> 
> In case both trees are on the same file system, trying to hardlink first
> would seem desirable. When copying, I think you should also pass -p.

I don't know if doing an hardlink is a good thing to do, I'm not sure of
the kind of issue this could bring. As for -p, I don't think it's a good
idea to copy the mode, ownership, and timestamps of the source file, I'd
rather have the timestamps that Make expect, e.i. "now".

> > --- a/xen/arch/x86/efi/Makefile
> > +++ b/xen/arch/x86/efi/Makefile
> > @@ -1,4 +1,5 @@
> >  CFLAGS-y += -fshort-wchar
> > +CFLAGS-y += -I$(srctree)/common/efi
> >  
> >  quiet_cmd_objcopy_o_ihex = OBJCOPY $@
> >  cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
> > @@ -19,3 +20,8 @@ obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
> >  obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
> >  extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
> >  nocov-$(XEN_BUILD_EFI) += stub.o
> > +
> > +$(obj)/%.c: common/efi/%.c
> > +	$(Q)cp -f $< $@
> > +
> > +.PRECIOUS: $(obj)/%.c
> 
> Seeing you repeat everything here, despite it not being all this much I
> wonder if there wouldn't better be a makefile fragment in common/efi/
> which all interested architectures' arch/<arch>/efi/Makefile would then
> include. This could then also subsume -fshort-wchar.

That sounds good, I'll look into that.

Thanks,

-- 
Anthony PERARD

