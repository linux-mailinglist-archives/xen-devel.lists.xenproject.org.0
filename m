Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82639538F8B
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 13:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339535.564404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzrA-0000Ea-Ed; Tue, 31 May 2022 11:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339535.564404; Tue, 31 May 2022 11:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzrA-0000C8-Am; Tue, 31 May 2022 11:16:12 +0000
Received: by outflank-mailman (input) for mailman id 339535;
 Tue, 31 May 2022 11:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bi/=WH=citrix.com=prvs=1435b4b80=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nvzr8-0000C2-Bq
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 11:16:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a91562-e0d3-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 13:16:08 +0200 (CEST)
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
X-Inumbo-ID: 10a91562-e0d3-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653995768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZdOpUvFK8lDyOMY93Nxgv6haNdCdSCdZwnYbBpkxaCc=;
  b=UBNwHOjvpZOYXz24d27PTfN4zqQ+Dokt9bLQ8c1co3VXT/8lK+u+ARC1
   Q1L7PCUkGlsqVG3Uyv3CmmrO69lFJezCSyGYGJVvQD+Nwp5RaXnmhr86w
   KJ4/XDRN0kfdu/bI6hSoqkvnSa9l9T4UXXTsWE80Uv/wABA3sxaC6tIB0
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72518022
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mRTXVKDIRjVXnhVW/1jjw5YqxClBgxIJ4kV8jS/XYbTApG4j0j0Hy
 jRNC22GOa2KY2v0c9AiOYvl8UoP75/WzYJiQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ni29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh7y
 /JXtYeoGTs0M6Ps38MkDUhjMBhxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8UQK+OP
 5BDAdZpRD/tUk10PUYnMooRxeqG2GunVAJ2ol3A8MLb5ECMlVcsgdABKuH9f9WWRMxO2FiRv
 Gvu4W3lDwpcOsb34SWB2mKhgKnIhyyTcIcbCLyx7fN0iUea7mMWARwSE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMVjtlvLkPCNpV/EWC5UFVatdeDKquc8Rhsw1
 kSRz+/0CDJP95qsFyOm1Y6b+Gba1TcuEYMSWcMVZVJbvoK9+dxu0EKnosVLS/Ds0ICscd3k6
 3XT9XVl2e1O5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTns5LHhAz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Nu2AleRk3bJ1cKFcFh
 XM/XisIv/du0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFySARfVUEE
 c7DK66EVC9CYYw+lWbeb7pMitcDm3FhrV4/sLimlnxLJ5LFPC7LIVrEWXPTBt0EAFSs+16Nq
 owDbJfQln2ykoTWO0HqzGLaFnhSRVBTOHw8g5A/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:e9CFgqDfedu5SRDlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="72518022"
Date: Tue, 31 May 2022 12:16:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Matias Ezequiel Vara Larsen
	<matias.vara@vates.fr>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 2/2] tools/misc: Add xen-stats tool
Message-ID: <YpX48uwOGVqayb/x@perard.uk.xensource.com>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <e233c4f60c6fe97b93b3adf9affeb0404c554130.1652797713.git.matias.vara@vates.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e233c4f60c6fe97b93b3adf9affeb0404c554130.1652797713.git.matias.vara@vates.fr>

Hi Matias,

On Tue, May 17, 2022 at 04:33:15PM +0200, Matias Ezequiel Vara Larsen wrote:
> Add a demostration tool that uses the stats_table resource to
> query vcpu time for a DomU.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> ---
> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index 2b683819d4..b510e3aceb 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -135,4 +135,9 @@ xencov: xencov.o
>  xen-ucode: xen-ucode.o
>  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
>  
> +xen-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
> +
> +xen-stats: xen-stats.o

The tools seems to be only about vcpu, maybe `xen-stats` is a bit too
generic. Would `xen-vcpus-stats`, or maybe something with `time` would
be better?

Also, is it a tools that could be useful enough to be installed by
default? Should we at least build it by default so it doesn't rot? (By
adding it to only $(TARGETS).)

> +	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> +
>  -include $(DEPS_INCLUDE)
> diff --git a/tools/misc/xen-stats.c b/tools/misc/xen-stats.c
> new file mode 100644
> index 0000000000..5d4a3239cc
> --- /dev/null
> +++ b/tools/misc/xen-stats.c
> @@ -0,0 +1,83 @@
> +#include <err.h>
> +#include <errno.h>
> +#include <error.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +
> +#include <xenctrl.h>

It seems overkill to use this header when the tool only use
xenforeignmemory interface. But I don't know how to replace
XC_PAGE_SHIFT, so I guess that's ok.

> +#include <xenforeignmemory.h>
> +#include <xen-tools/libs.h>

What do you use this headers for? Is it left over?

> +static sig_atomic_t interrupted;
> +static void close_handler(int signum)
> +{
> +    interrupted = 1;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    xenforeignmemory_handle *fh;
> +    xenforeignmemory_resource_handle *res;
> +    size_t size;
> +    int rc, nr_frames, domid, frec, vcpu;
> +    uint64_t * info;
> +    struct sigaction act;
> +
> +    if (argc != 4 ) {
> +        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
> +        return 1;
> +    }
> +
> +    // TODO: this depends on the resource
> +    nr_frames = 1;
> +
> +    domid = atoi(argv[1]);
> +    frec = atoi(argv[3]);
> +    vcpu = atoi(argv[2]);

Can you swap the last two line? I think it is better if the order is the same
as on the command line.

> +
> +    act.sa_handler = close_handler;
> +    act.sa_flags = 0;
> +    sigemptyset(&act.sa_mask);
> +    sigaction(SIGHUP,  &act, NULL);
> +    sigaction(SIGTERM, &act, NULL);
> +    sigaction(SIGINT,  &act, NULL);
> +    sigaction(SIGALRM, &act, NULL);
> +
> +    fh = xenforeignmemory_open(NULL, 0);
> +
> +    if ( !fh )
> +        err(1, "xenforeignmemory_open");
> +
> +    rc = xenforeignmemory_resource_size(
> +        fh, domid, XENMEM_resource_stats_table,
> +        vcpu, &size);
> +
> +    if ( rc )
> +        err(1, "    Fail: Get size: %d - %s\n", errno, strerror(errno));

It seems that err() already does print strerror(), and add a "\n", so
why print it again? Also, if we have strerror(), what the point of
printing "errno"?

Also, I'm not sure the extra indentation in the error message is really
useful, but that doesn't really matter.

> +
> +    if ( (size >> XC_PAGE_SHIFT) != nr_frames )
> +        err(1, "    Fail: Get size: expected %u frames, got %zu\n",
> +                    nr_frames, size >> XC_PAGE_SHIFT);

err() prints strerror(errno), maybe errx() is better here.


Thanks,

-- 
Anthony PERARD

