Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255AB5BCE5B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 16:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408785.651647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHbA-0001gO-TK; Mon, 19 Sep 2022 14:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408785.651647; Mon, 19 Sep 2022 14:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHbA-0001ea-Q4; Mon, 19 Sep 2022 14:18:12 +0000
Received: by outflank-mailman (input) for mailman id 408785;
 Mon, 19 Sep 2022 14:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imKG=ZW=citrix.com=prvs=2545d700a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oaHb8-0001eS-Uf
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 14:18:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1cf6bc3-3825-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 16:18:09 +0200 (CEST)
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
X-Inumbo-ID: e1cf6bc3-3825-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663597088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkpfSMbNKG9R+2YO41Ijpv1tQpYikTfshHrCmhB9Peg=;
  b=O9lAoksmiz1r54lJFDF/Pd2Ab3O5lHJxoONiWi89zmIVxIzcQ+jGUDiv
   XV17xDPx+ZAy8EYpA/EFg72lM4c4xiunHO9gG89arORT8OrRYxKbXh6gP
   7VaATIMX5RQE/foLSADthaDQiXsWVGAHztcb8o3aJIwOZ5wyynXn4VCNA
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80826994
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ALB6noqse4Hfd0/kgdGhtqaqJ+efnOphVZltV8?=
 =?us-ascii?q?MifNqXetXmJ2xPK1anx4FJ00kkjnHarUPUpu5siBHQZlyfxrspDZzCHZc7qt?=
 =?us-ascii?q?vZeKG7bGsruekzRALxkPUs+UEpRX5tPcWw4MrWR7Z1jU+m5SDYjuwQRJk2sO?=
 =?us-ascii?q?o7jg/e0qpvFJGU6U+g91+TvQLqyea/gpW2GKdll19h8e3Jzs7ZaonkIV98nS?=
 =?us-ascii?q?Typaw3fPgBMi3Y+ioyYdX5s86sOmIL3ek1imlPPu3/QtoHWjAKpQeZ9mqm8b?=
 =?us-ascii?q?V1b+ryeFcCMhpDvcbBLHCpB74ve/rtrNh0kk9uvZGP7gdDCzYHwVAAEgj3oL?=
 =?us-ascii?q?zTaBuiJEk81CsLFSmOFJ3hf3GuLTiKh6WO3dJsXT6aBlA3PQS//6GRDSE0ZY?=
 =?us-ascii?q?be16ko6ODWyCS87HxisgHm5czo2P+BFP+YMKw6/MNWXbIy55QxV0g16O4oMC?=
 =?us-ascii?q?+aQMIjqg/Y3GscYRvL+u4sjN6WKB5mRqx8fIwjPKqf4GJoJHUm7sEqVMRhAL?=
 =?us-ascii?q?KyrRazKlkjT1g5wGR5c0QgT2bL0c28g8MiHGTp8zDGWlHmcVR+60w0b7OC34?=
 =?us-ascii?q?PuN2vvNUsDdEvOYpBSvsnHHr5Bj1hlVG6mNo6VsHlBqbreOtIJVdT3ngAxoF?=
 =?us-ascii?q?kcM6PhVf02o7OD9b8vpfIV60IDDmkxPmyZWUlIJ46W3FqhpS5Tmn4s5iVSns?=
 =?us-ascii?q?PUetO9uQ3H2RbGGv6MLguDzr5G6qHF5O0bmytbc5UJPHUSo9e8zV/e4B6lM/?=
 =?us-ascii?q?XPQXl6zQMxslFLgzNqPgd395dj/gu9kn9NUsK9l3ifoKti2e03TrbWvqgVdY?=
 =?us-ascii?q?CXZhPa66x5TUPzwsBv25lpozFqP33Xanv+t6HglEbpMFiVha80+AiQgQ5XGm?=
 =?us-ascii?q?ZF4cKdOZ32I3PlO5NZssxSB1LftNAUFJUy/tqNSOSVbmMPjjjoe8r0lAjGPY?=
 =?us-ascii?q?zTqFvkwbxB9b1lXYqUdXR3EjV9OVYuhKACeWZFDQ2F7bE6m2NI5Xwi8ekk6v?=
 =?us-ascii?q?rDNnrpcmHQpwuyHOwgOX/QOQ9jxxwwEjWLSQDknlf+5D0zBBorJ82J8K2+kt?=
 =?us-ascii?q?4RfKgRa7YuSekpi5Br4BH444Htpc4hX7knO0V3rj/ZtJP++4K7NCBjyCoO2g?=
 =?us-ascii?q?JI/P97Hg31Jzvl47DwMEI7iiELFAdjnzZxQeOmZIXZNFN2yxwQW9me4cKN1H?=
 =?us-ascii?q?KphpP1VKhwUATYq/xQa1laV43OVilpX5PviGZ/hbxIvNK5Q+Uhl+zQ/7DhCT?=
 =?us-ascii?q?+Ei9pMUF+C5l1lH+E+WtX6XvYJI11yGCbB3idfFHeE6I9hM/NwwryfmU1YNd?=
 =?us-ascii?q?bb0NFQMbaBqAoKjYwZQ799htQB6g5z6ZjuYGR4arqedYIJTMiwHAdHKEYipd?=
 =?us-ascii?q?xVc6XHK4HtFcp2JtAni1tqC9D3S3FNEAPol4SOYPWGuXwUvNmrOur99A46jp?=
 =?us-ascii?q?k01l+CtBI6jACKaVFX0gxzdXgDZV6kmFMIalGnP5dYiLxtcftnYHUGqNBdhP?=
 =?us-ascii?q?DiJowFq9Scybarwb2GFeDpOJ3XeqPIvpj8badnx7KiByH9ry7VPl2LLVdWt6?=
 =?us-ascii?q?CzEizLIDNx0Mb3yk4A6GFgqGoVGanA4rxfBY1/Zi7ZeMFN5/oOmMR3bRAusb?=
 =?us-ascii?q?iQtsAufZZl74b0KMZdJm6/Iy+6Bfj5vkvWeAyN9MD3hEywVLaKvwZRrZX0yh?=
 =?us-ascii?q?/v3pp1MeCQ5zlQdUYXMaWO6rTTT3w/IObS94fRG3EFPqc2YQ9pE/sc1QP6Cr?=
 =?us-ascii?q?c6FzPDMOsuStPWkiKDN23NvV879WeT/24ZmFNoLEIszzBp2r1KF56gmfVu+z?=
 =?us-ascii?q?hfrX0MpXj5zO43d4TZ0Z0zECBn8Muj19v+kDTbMC9eqhzFFSk6ULqDSJqp5X?=
 =?us-ascii?q?4G3OfiCdtDaw9BJTx/5fw5mVuNsKSWWzDEEF0/FRZ+FhUoRxfob1Qd565Mfr?=
 =?us-ascii?q?LM37ZMGrlc9nNearGv+V+g05vz/nVvHGanrCeKtclkN/rPVcrf74wvfnWh5o?=
 =?us-ascii?q?5A1iiUOQmBRaCo7Y/vOIYYJRJgVk2qttBG0BU9pNS1GpuQ/a/lB2WtwfvhJ6?=
 =?us-ascii?q?8tgrWkgbUhqE4UYpWQa4b+WaICFQ6eWcT9m72QhCupYPIhsZDh2NkrBS333F?=
 =?us-ascii?q?/Ovv/viuZhqJYX7UtGpUE3tM0NXpVuslgENmwSAFiBvLZCgdVLmuX3K4yzar?=
 =?us-ascii?q?XejR8E3N0WoxBp9ma+HlK/GRNoOGtLqCvLt0n1kvId6h4JBMXgYtTd0LZwhY?=
 =?us-ascii?q?Lw3lUicr4riXtL1t+cQX33TQgvh3fCef1iKeWtMwefWVatAfvD+WYM7pnEL0?=
 =?us-ascii?q?ZrMQQNLDmcs+F0fjqU5gvyl+bwfTbQzaJy711pe3ZJw13cHEmP2jvzniwHkE?=
 =?us-ascii?q?VG/bdMlMAuq1VCFMYSQc3zjpuufl3NCQr5jxLBzjH9/7s+92ouGjoIBn4Tzw?=
 =?us-ascii?q?57p28++fA4pc8sa1nw2KCvNz3cpuTOp9uYoFN0tpvHOXLpBR83sxyGKQV0UI?=
 =?us-ascii?q?mvnHkoMAgjTu5KqOKoC4DNTxXmoELn2SYNmdHeI6RnyZyu/d5U3ghNDUaIBY?=
 =?us-ascii?q?sHQx0x5FwZlIfHqo6JaKEf5PnQ5Qt0ifZdAe3KBdq5EdVsYvXq6w8yM2PaYt?=
 =?us-ascii?q?PkcaxznLxhO5fLj/DvT3S7C7K4/1WUwWdt3SK9PLabq7GXz6I6yWVfSojd+X?=
 =?us-ascii?q?iG2aJrCfJr7WVHmZ2BoDTP9Kqb1fjIlDgua2/VxNgMvUsWpPTSLRs02HIxbq?=
 =?us-ascii?q?GzWgItMUtN1WhObK+0MP26dYROEm0+X0dOMwMHg35KYOybw2dXnYV5aL+RPF?=
 =?us-ascii?q?u2POiQQCPxkPvLZSwUvSQM14Emko09rw4ro/rdujQomJkjoLt357BpP5OFRc?=
 =?us-ascii?q?ZdIVWCMYEViQ4CzzwqG0SAvisTxyV2Ti2ncYG24dXYB+kX21Q2zLBeI3smFJ?=
 =?us-ascii?q?4Zt5zgmAB3mY8GVr+TanHyBlKtM5PWwpI3RRPoMRS1PRhAD7hrxJBLVGvkI5?=
 =?us-ascii?q?/IxjwFFjresyrsAzyG6APIB5NXFA0XeOXEZpE+r5NWKe84p0hmrOvY6UHF8h?=
 =?us-ascii?q?gy/+bFSyFchhrRsscyJQjhVOh/9DbdMij/Am03Z/nVhYrm2FDvT9v1RcYQGn?=
 =?us-ascii?q?g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,328,1654574400"; 
   d="scan'208";a="80826994"
Date: Mon, 19 Sep 2022 15:18:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v3] build: Fix x86 out-of-tree build without EFI
Message-ID: <Yyh6GmWVTLYh0ZDB@perard.uk.xensource.com>
References: <20220919102831.17438-1-anthony.perard@citrix.com>
 <c6fc8cf1-c8d5-fd5a-f70f-42756db074fe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c6fc8cf1-c8d5-fd5a-f70f-42756db074fe@suse.com>

On Mon, Sep 19, 2022 at 01:02:52PM +0200, Jan Beulich wrote:
> On 19.09.2022 12:28, Anthony PERARD wrote:
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with a remark and one more adjustment:
> 
> > ---
> > 
> > Notes:
> >     v3:
> >     - back to using common-stub.c
> 
> As said in person, I'm a little puzzled by this, as the v2 discussion
> had no hint in that direction.

I think it's because the discussion continued on V1, and I mostly follow
that:
    https://lore.kernel.org/xen-devel/5d926715-b6af-234f-9798-622cdb53f181@xen.org/

> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -280,6 +280,7 @@ xen/arch/*/efi/ebmalloc.c
> >  xen/arch/*/efi/efi.h
> >  xen/arch/*/efi/pe.c
> >  xen/arch/*/efi/runtime.c
> > +xen/arch/*/efi/common-stub.c
> >  xen/arch/*/include/asm/asm-offsets.h
> >  xen/common/config_data.S
> >  xen/common/config.gz
> 
> The new line wants inserting a few lines further up, to retain sorting.

Oops, forgot to re-sort after renaming from "stub" to "common-stub".

> Can perhaps be done while committing.

Thanks,

-- 
Anthony PERARD

