Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6741718E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 14:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195351.348014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTk3y-0004ua-Hk; Fri, 24 Sep 2021 12:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195351.348014; Fri, 24 Sep 2021 12:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTk3y-0004sm-Eg; Fri, 24 Sep 2021 12:12:22 +0000
Received: by outflank-mailman (input) for mailman id 195351;
 Fri, 24 Sep 2021 12:12:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mTk3w-0004sg-Se
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 12:12:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mTk3w-0000ZA-Pz
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 12:12:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mTk3w-0008Se-PA
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 12:12:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mTk3m-0000dH-Tv; Fri, 24 Sep 2021 13:12:11 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=2S9JgcJNkwk46B8y3Gw1osQ9Eb/Yh4Ozw+h2VWPDH2g=; b=ezcFIq8qdkj7EbR3r1rrfSMD4/
	UlIZZfU2Mzeb+kjUSDW/6HsovYWvZerPSdTMXUfcYx5qbuDl4xYKgSFEkN+5aiwTN2gzaAF42ApsO
	wDnaKsU9E2Wj/UlOTRBKTedLwfLkGrzKV/jwM0EaZoZvPlAQ0R76OuSIrJwgFEQv21IE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24909.49306.649660.76404@mariner.uk.xensource.com>
Date: Fri, 24 Sep 2021 13:12:10 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Stefanov <kevin.stefanov@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/libxl: Remove page_size and page_shift from struct
 libxl_acpi_ctxt
In-Reply-To: <e3d86499-3c1e-6cac-9225-f64b101c5478@suse.com>
References: <20210924110500.25412-1-kevin.stefanov@citrix.com>
	<e3d86499-3c1e-6cac-9225-f64b101c5478@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] tools/libxl: Remove page_size and page_shift from struct libxl_acpi_ctxt"):
> On 24.09.2021 13:05, Kevin Stefanov wrote:
> > As a result of recent work, two members of struct libxl_acpi_ctxt were
> > left with only one user. Thus, it becomes illogical for them to be
> > members of the struct at all.
> > 
> > Drop the two struct members and instead let the only function using
> > them have them as local variables.
> > 
> > Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

> I would like to suggest though to consider ...
> 
> > @@ -176,20 +174,19 @@ int libxl__dom_load_acpi(libxl__gc *gc,
> >          goto out;
> >      }
> >  
> > -    config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
> > -    config.infop = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
> > +    config.rsdp = (unsigned long)libxl__malloc(gc, page_size);
> > +    config.infop = (unsigned long)libxl__malloc(gc, page_size);
> >      /* Pages to hold ACPI tables */
> > -    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES *
> > -                                   libxl_ctxt.page_size);
> > +    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES * page_size);
> 
> ... using page_shift to replace all multiplications like the one here
> at this occasion.

I don't have an opinion about this; my tools ack can stand if this
change is made and reviewed.

Ian.

