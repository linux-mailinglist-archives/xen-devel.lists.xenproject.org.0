Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825A501A0A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 19:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304968.519745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf3HG-0005p3-74; Thu, 14 Apr 2022 17:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304968.519745; Thu, 14 Apr 2022 17:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf3HG-0005mZ-42; Thu, 14 Apr 2022 17:29:06 +0000
Received: by outflank-mailman (input) for mailman id 304968;
 Thu, 14 Apr 2022 17:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Reb+=UY=citrix.com=prvs=096d93bb6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nf3HD-0005mT-T8
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 17:29:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f3a0a61-bc18-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 19:29:02 +0200 (CEST)
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
X-Inumbo-ID: 5f3a0a61-bc18-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649957341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xVpSYr4e8iNaOQs1kfEPg/nRoZ26UvAcDAfO6+j29J4=;
  b=EqJC4IJn9wd1Si8zQx1Wxn42CKjJ11Uf6dzM55cewViogsbI1EgNwRdm
   oK5RGNxy/3DsiLfk1CHyFwZPVDGWy46A2d76ZQFAG867zJP2S4Md56nnM
   tXX+wDOns14pwovZRqnvd0KkToMVzzYqLSOv8jaXJU1BymL/6sSHIDNf7
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69392699
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Otas1qCn9DIzGxVW/yzjw5YqxClBgxIJ4kV8jS/XYbTApGkigTdWm
 jFLWWqHO6rbajGkKdtzYYu+9RlXuJHRxt4yQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgt+
 JZQmrr3FTwUN/eSmM0BSCNlSDpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4fRqeEO
 ZtIAdZpRDjAZU1GK0xGMaAVnr6s32LTYTwG+V3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0B+oTDsIcr12296OOvQawGnM+c2VaZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LAhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGAufh8wbJpfImKBj
 KrvVeV5vs470JyCN/EfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CbSgOXiGrdROdTjn7xETXPjLliCeTcbbSiIOJY3rI6a5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:LEXjaKCU+DPjvETlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="69392699"
Date: Thu, 14 Apr 2022 18:28:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1.1 2/3] x86/build: Don't convert
 boot/{cmdline,head}.bin back to .S
Message-ID: <YlhZ2H9hotfHaPLd@perard.uk.xensource.com>
References: <20220414114708.4788-3-andrew.cooper3@citrix.com>
 <20220414162739.7251-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220414162739.7251-1-andrew.cooper3@citrix.com>

On Thu, Apr 14, 2022 at 05:27:39PM +0100, Andrew Cooper wrote:
> There's no point wasting time converting binaries back to asm source.  Just
> use .incbin directly.  Explain in head.S what these binaries are.
> 
> Also, align the blobs.  While there's very little static data in the blobs,
> they should have at least 4 byte alignment.  There was previously no guarantee
> that cmdline_parse_early was aligned, and there is no longer an implicit
> 4-byte alignment between cmdline_parse_early and reloc caused by the use of
> .long.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index a5dd094836f6..0670e03b72e0 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -10,7 +10,10 @@ head-srcs := $(addprefix $(obj)/, $(head-srcs))
>  ifdef building_out_of_srctree
>  $(obj)/head.o: CFLAGS-y += -iquote $(obj)

With this patch, we don't the "-iquote" option above, it was only useful
for both "#include" been removed.

>  endif
> -$(obj)/head.o: $(head-srcs)
> +# For .incbin - add $(obj) to the include path and add the dependencies
> +# manually as they're not included in .d
> +$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
> +$(obj)/head.o: $(head-srcs:.S=.bin)

The manual dependencies are needed because `make` needs to know what
other target are needed before building "head.o". The .d files wouldn't
exist on a first build. I don't think a comment about that isn't really
necessary, but if there's one it should be about telling `make` to build
cmdline.bin and head.bin first.

Otherwise, the patch looks good.

Thanks,

-- 
Anthony PERARD

