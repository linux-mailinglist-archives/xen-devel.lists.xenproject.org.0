Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D330601145
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 16:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424459.671888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okRGx-0001c4-I9; Mon, 17 Oct 2022 14:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424459.671888; Mon, 17 Oct 2022 14:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okRGx-0001Zp-FQ; Mon, 17 Oct 2022 14:39:19 +0000
Received: by outflank-mailman (input) for mailman id 424459;
 Mon, 17 Oct 2022 14:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD8j=2S=citrix.com=prvs=282fc9ee0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1okRGv-0001Zj-TD
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 14:39:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73e87f16-4e29-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 16:39:07 +0200 (CEST)
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
X-Inumbo-ID: 73e87f16-4e29-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666017556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Udr5xcBpuMhUREWroW8bbC3VlmW0ewDShnmLc5/hScQ=;
  b=J/NsQrPGPP8NV+TeKPebA0pvj74dpKxgMszZyF4sTzE7lWuuMBv3rQOe
   DitMUp5bN2zOOFR/bHL/WTiR3ASRpG2tbCSvJdbJrHdXAy5+hJ8093TeF
   ph3vT66i9ZOJMDCqgTmJ1wyXSOFRddQe5WHIVZCk/f3uFbMDDBVrcMuG/
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 85434405
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Oc6VNavGiIBJghUiMDrHEZn06+fnVFheMUV32f8akzHdYApBsoF/q
 tZmKWrUO62CazekKt4iO4uy8xwOup/UzdNjQANo/ng1QSsa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPakU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklI+
 8QpdXMObCveoLOL5aOndNhgofQKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUIwh3E+
 jqbl4j/KiEzJv6D42ClyG29uM3IhRnjRN5PKoTto5aGh3XMnzdOWXX6T2CTo/ajjVWlc8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sES4bFV5fJiwGdlYisuTGsZ0Nvx7ofv82RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3pxZPnqgKulmSwXuF1e5dIFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMYsJVPaoX8yORPMt4wIrKTLufhlU
 ap3jO72VSpKYUiZ5GDeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALWNIgRtfrcyC2Mq
 oY3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQOKbfdclc7RDp8YxITqJt4E7FYc21uvr+g1
 hmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:F7tK7qBcPv6Xg8PlHemU55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG+85rsyMc6QxhPE3I9urtBEDtexzhHNtOkPAs1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaXN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.95,191,1661832000"; 
   d="scan'208";a="85434405"
Date: Mon, 17 Oct 2022 15:39:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH for-4.17 v5 14/17] libs/light: Rework targets
 prerequisites
Message-ID: <Y01pCiLyPPEXVtVp@perard.uk.xensource.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-15-anthony.perard@citrix.com>
 <d6e4825f-6fd3-b48b-7a7b-e4f62acadd38@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6e4825f-6fd3-b48b-7a7b-e4f62acadd38@citrix.com>

On Fri, Oct 14, 2022 at 07:35:20PM +0000, Andrew Cooper wrote:
> On 13/10/2022 14:05, Anthony Perard wrote:
> > No need for $(AUTOSRCS), GNU make can generate them as needed when
> > trying to build them as needed when trying to build the object. Also,
> > those two AUTOSRCS don't need to be a prerequisite of "all". As for
> > the "clean" target, those two files are already removed via "_*.c".
> >
> > We don't need $(AUTOINCS) either:
> > - As for both _libxl_savm_msgs*.h headers, we are adding more
> >   selective dependencies so the headers will still be generated as
> >   needed.
> > - "clean" rule already delete the _*.h files, so AUTOINCS aren't needed
> >   there.
> >
> > "libxl_internal_json.h" doesn't seems to have ever existed, so the
> > dependency is removed.
> >
> > Add few prerequisite for "libxl_internal.h" so all headers that it
> > depends on should be generated. And have $(SAVE_HELPER_OBJS) depends
> > on "libxl_internal.h".
> >
> > Rework objects prerequisites, to have them dependents on either
> > "libxl.h" or "libxl_internal.h". "libxl.h" is not normally included
> > directly in the source code as "libxl_internal.h" is used instead. But
> > we are adding "libxl.h" as prerequisite of "libxl_internal.h", so
> > generated headers will still be generated as needed.
> >
> > "testidl.c" doesn't depends on "libxl.h" but "testidl.o" does.
> 
> I'm afraid I don't follow here.  How can this be true?

From make point-of-view, in order to generate "testidl.c", we only need
to execute "gentest.py" which takes "libxl_types.idl" as input. It
doesn't even matter if "libxl.h" exist when generating "testidl.c" via
`make testidl.c`.

"libxl.h" is only used later when compiling "testidl.c" into
"testidl.o".

I can probably expand the commit message to better explain this.

Thanks,

-- 
Anthony PERARD

