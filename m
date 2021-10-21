Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F7435FE6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 13:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214334.372840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdVrc-00029P-1M; Thu, 21 Oct 2021 11:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214334.372840; Thu, 21 Oct 2021 11:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdVrb-00027N-Tp; Thu, 21 Oct 2021 11:03:59 +0000
Received: by outflank-mailman (input) for mailman id 214334;
 Thu, 21 Oct 2021 11:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JnKy=PJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mdVrZ-00027H-Sk
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 11:03:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b0e7185-dc3e-4de0-8766-43499ee61745;
 Thu, 21 Oct 2021 11:03:56 +0000 (UTC)
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
X-Inumbo-ID: 8b0e7185-dc3e-4de0-8766-43499ee61745
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634814236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jAc6L/EmceP6wdkHmBmwI+pOrUmu0wm76d/xvVeAMCE=;
  b=Gr9Vw1iHwRKNVyvPdsTEC1uII1yBTxv/hO4x3jxYg4KKfkzNSvFfnyiw
   z8OytSacN5hB3UrfBwL6Xowt3QZnTCMn8O5V999g50oP1oyoVPAvGEweT
   U6ewmgfnz+Ys4rGMDOigQCjvcBaOg7z+VJ+q0QG8n0lEwgTGoTiGZGhNo
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Mfl9yBIUJhV7j8IEsSrifc2IGoA/OaJg+b3MbTi+psPFspdc/otsclVzIYdFfkYwQFOXZFvYQx
 4+80CwwmD8o101DASzfHJ7KArRR8jOm6ckbBvvkneeBm4Cm8YHCtIJT2TJdZbkv1aALLMfunQg
 Ykr3XavZaPwVfQuoDCINSUooSSp3TfWKZYE2r7UD5LHxXPkSKezlk1A1Ks2suOT8CpWUZyXvlE
 VlMW9a8Gg0JQLlX6NYUTgf55eI3rjTQM57h9XhiltFojW5JXxjk/dcA77+bi4tbcdWJ2foRNEY
 4uXH3wLjhJvKzZvNzv0er0q2
X-SBRS: 5.1
X-MesageID: 55711042
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dy1PKKABX0dcnBVW/4jkw5YqxClBgxIJ4kV8jS/XYbTApGkn3jMPz
 TAYWWqPM6mKZWP0fN13YI/k9koP68Ldmt9iQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500s7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hxnWk8pT8
 IV2r7OyYhpuZIHiluQGakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFgWhp35gSR54yY
 eISM2ZDZzeRMyZeGVMZDaoRjb6aoibgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tnifo
 mXK7mHoGCYwPdaUySeG2n+0j+qJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80jE1saE4+UivT9/8dx61uniJulgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQnq80eVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxn87
 2+GtgoG144JoswgyuLh0X7JgymV882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 yBaw5n2APQmSMjXznTUEbpl8KSBvq7daFXhbUhT847NHthH00WoepxM+3lALUNtP9dsldTBM
 RKL5105CHO+OhKXgU5Lj2CZV5tCIUvIT42NuhXogjxmOMUZmOivp3kGWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35lmTyOGMyjkEv4itJygUJ5r59fbTNiichitMu5TPj9q
 Y4DZ6NmNT0OOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNtIOJ9q7A6nKUqJ
 xTHEu3Zaslypv3802x1RfHAQEZKLnxHXCqCYHioZiYRZZllS1Cb89PoZFK3piIPEjC2pY01p
 Lj5jlHXRp8KRgJDCsfKaa3wkwPt7CZFwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuYnRhhaEmDX4KyYLy7f+mb/k4ZMXPzRJWLWVX/u+bXkb
 uJQlqmuPPoClVdMkox9D7c0kv5uu4qx/+dXl102Em/KYlKnDqJbDkOHhcQf5LdQwrJ5uBetX
 h7d8NdtJrjUatjuF0QcJVR5Y73bh+0UgDTb8d88PF7+uH1s5LOCXEhfY0uMhShaIOcnOY8p2
 7586ssf6gj5gRs2KNeWyCtT8j3UfHAHVqwmsLAcAZPq1VV3mg0TP8SEB3+k+oyLZvVNLlIuc
 22di6f1jrhBwlbPLigoHn/X0OsB3ZkDtXimFrPZy4hlTjYdusIK4Q==
IronPort-HdrOrdr: A9a23:cCFQfK5agXjdluVzrwPXwWKBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJU3Jmbi7Sc29qADnhOJICOgqTPmftWzd2VdAQ7sSlrcLXVXbalXDH4JmpM
 VdmstFeZzN5DpB/LzHCWCDer5KqrTmgcOVbI/lvixQpGpRGsZdBnJCe3+m+zpNNW977PQCZf
 +hz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYqILSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzR/Bky/JlaAkEuDzYILiJaIfy+wzdZ9vfrmrCpe
 O85ivI+f4Dsk85MFvF+ScFkDOQrwrGo0WSt2Nwx0GT+/ARDQhKe/aoie9iA2rkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DcfeEEo/ghiuKYlGfRsRLYkjQlo+VY7bVXHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7T9E5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZe06EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7zH4HSKyGGFfIyQZ0We9ihu3ekOhlSnfsuZDcSqciFar/ed
X-IronPort-AV: E=Sophos;i="5.87,169,1631592000"; 
   d="scan'208";a="55711042"
Date: Thu, 21 Oct 2021 12:03:43 +0100
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
Message-ID: <YXFJD3LlFfbivA6Z@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
 <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com>
 <YWmse5Sv2SFyRMdj@perard>
 <fd11108b-db66-3c0e-9a7e-a5e30b0b5b1f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fd11108b-db66-3c0e-9a7e-a5e30b0b5b1f@suse.com>

On Mon, Oct 18, 2021 at 10:48:26AM +0200, Jan Beulich wrote:
> On 15.10.2021 18:29, Anthony PERARD wrote:
> > On Thu, Oct 14, 2021 at 10:51:44AM +0200, Jan Beulich wrote:
> >> On 24.08.2021 12:50, Anthony PERARD wrote:
> >>> --- a/xen/arch/arm/efi/Makefile
> >>> +++ b/xen/arch/arm/efi/Makefile
> >>> @@ -1,4 +1,10 @@
> >>>  CFLAGS-y += -fshort-wchar
> >>> +CFLAGS-y += -I$(srctree)/common/efi
> >>
> >> Perhaps another opportunity for -iquote?
> > 
> > Yes.
> > 
> >>>  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
> >>>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> >>> +
> >>> +$(obj)/%.c: common/efi/%.c
> >>> +	$(Q)cp -f $< $@
> >>
> >> In case both trees are on the same file system, trying to hardlink first
> >> would seem desirable. When copying, I think you should also pass -p.
> > 
> > I don't know if doing an hardlink is a good thing to do, I'm not sure of
> > the kind of issue this could bring. As for -p, I don't think it's a good
> > idea to copy the mode, ownership, and timestamps of the source file, I'd
> > rather have the timestamps that Make expect, e.i. "now".
> 
> Why would "now" be correct (or expected) in any way? The cloned file is no
> different from the original. Nevertheless I agree that -p is not ideal;
> it's just that the more fine grained option to preserve just the timestamp
> is non-standard afaik. You could try that first and fall back to -p ...
> Otherwise, failing hard linking and using "cp -p", I'm afraid I'd prefer
> symlinking despite the arguments against it that you name in the
> description.

I guess I'm missing something, is there a reason to keep/copy the
timestamps of the original files?

> Might be good to have someone else's view here as well.

Indeed.

-- 
Anthony PERARD

