Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A7B1DCE35
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 15:34:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jblKO-0001Gd-8z; Thu, 21 May 2020 13:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzzg=7D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jblKN-0001GS-00
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 13:33:39 +0000
X-Inumbo-ID: ac620dae-9b67-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac620dae-9b67-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 13:33:37 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5gmKjkebEWCNOFvhOQXaQo4wL+J51hJQuVeY2/iYeTHSBCg77L82HAyYeNxrLhJeXIcIWCLoU1
 5R+k+iQjMla6m6+UO47x/hX6o+CFL4iyWxLkSSoMQDdr+WzsbcJ0Q+h3MNlE+ck956YVl8dn1B
 q1N8hC1Out+sqzoooUoZ8/9c4FFQ6khmMSqCbK0P3OFfqMoXPNP7bHwGdylTjN8/uoijqh85yV
 gYpceTcHpy4JiUgFIBBFniLY4IZWk/4zNNBOLWG3HdnN/Or7dDzXXe+ayvhYdEsL/PI+VXtefT
 Cr0=
X-SBRS: 2.7
X-MesageID: 18366171
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18366171"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24262.33569.802678.575518@mariner.uk.xensource.com>
Date: Thu, 21 May 2020 14:33:21 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 3/5] tools/misc: add xen-domctx to present domain
 context
In-Reply-To: <20200521085932.10508-4-paul@xen.org>
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-4-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v4 3/5] tools/misc: add xen-domctx to present domain context"):
> This tool is analogous to 'xen-hvmctx' which presents HVM context.
> Subsequent patches will add 'dump' functions when new records are
> introduced.

This looks plausible to me.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

However, I have CC'd Andrew in case he wants to have an opinion.
Andy's done a lot of work on the save/restore stuff and he should be
given a chance to objedt.  Please would committers not commit this
this week, or until Andy also acks it.

Thanks,
Ian.

> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> 
> v3:
>  - Re-worked to avoid copying onto stack
>  - Added optional typecode and instance arguments
> 
> v2:
>  - Change name from 'xen-ctx' to 'xen-domctx'
> ---
>  .gitignore              |   1 +
>  tools/misc/Makefile     |   4 +
>  tools/misc/xen-domctx.c | 200 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 205 insertions(+)
>  create mode 100644 tools/misc/xen-domctx.c
> 
> diff --git a/.gitignore b/.gitignore
> index 7418ce9829..6da3030f0d 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -209,6 +209,7 @@ tools/misc/xen_cpuperf
>  tools/misc/xen-cpuid
>  tools/misc/xen-detect
>  tools/misc/xen-diag
> +tools/misc/xen-domctx
>  tools/misc/xen-tmem-list-parse
>  tools/misc/xen-livepatch
>  tools/misc/xenperf
> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index 63947bfadc..ef25524354 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -30,6 +30,7 @@ INSTALL_SBIN                   += xenpm
>  INSTALL_SBIN                   += xenwatchdogd
>  INSTALL_SBIN                   += xen-livepatch
>  INSTALL_SBIN                   += xen-diag
> +INSTALL_SBIN                   += xen-domctx
>  INSTALL_SBIN += $(INSTALL_SBIN-y)
>  
>  # Everything to be installed in a private bin/
> @@ -108,6 +109,9 @@ xen-livepatch: xen-livepatch.o
>  xen-diag: xen-diag.o
>  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
>  
> +xen-domctx: xen-domctx.o
> +	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
> +
>  xen-lowmemd: xen-lowmemd.o
>  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
>  
> diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
> new file mode 100644
> index 0000000000..243325dfce
> --- /dev/null
> +++ b/tools/misc/xen-domctx.c
> @@ -0,0 +1,200 @@
> +/*
> + * xen-domctx.c
> + *
> + * Print out domain save records in a human-readable way.
> + *
> + * Copyright Amazon.com Inc. or its affiliates.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#include <xenctrl.h>
> +#include <xen/xen.h>
> +#include <xen/domctl.h>
> +#include <xen/save.h>
> +
> +static void *buf = NULL;
> +static size_t len, off;
> +
> +#define GET_PTR(_x)                                                        \
> +    do {                                                                   \
> +        if ( len - off < sizeof(*(_x)) )                                   \
> +        {                                                                  \
> +            fprintf(stderr,                                                \
> +                    "error: need another %lu bytes, only %lu available\n", \
> +                    sizeof(*(_x)), len - off);                             \
> +            exit(1);                                                       \
> +        }                                                                  \
> +        (_x) = buf + off;                                                  \
> +    } while (false);
> +
> +static void dump_header(void)
> +{
> +    DOMAIN_SAVE_TYPE(HEADER) *h;
> +
> +    GET_PTR(h);
> +
> +    printf("    HEADER: magic %#x, version %u\n",
> +           h->magic, h->version);
> +
> +}
> +
> +static void dump_end(void)
> +{
> +    DOMAIN_SAVE_TYPE(END) *e;
> +
> +    GET_PTR(e);
> +
> +    printf("    END\n");
> +}
> +
> +static void usage(const char *prog)
> +{
> +    fprintf(stderr, "usage: %s <domid> [ <typecode> [ <instance> ]]\n",
> +            prog);
> +    exit(1);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    char *s, *e;
> +    long domid;
> +    long typecode = -1;
> +    long instance = -1;
> +    unsigned int entry;
> +    xc_interface *xch;
> +    int rc;
> +
> +    if ( argc < 2 || argc > 4 )
> +        usage(argv[0]);
> +
> +    s = e = argv[1];
> +    domid = strtol(s, &e, 0);
> +
> +    if ( *s == '\0' || *e != '\0' ||
> +         domid < 0 || domid >= DOMID_FIRST_RESERVED )
> +    {
> +        fprintf(stderr, "invalid domid '%s'\n", s);
> +        exit(1);
> +    }
> +
> +    if ( argc >= 3 )
> +    {
> +        s = e = argv[2];
> +        typecode = strtol(s, &e, 0);
> +
> +        if ( *s == '\0' || *e != '\0' )
> +        {
> +            fprintf(stderr, "invalid typecode '%s'\n", s);
> +            exit(1);
> +        }
> +    }
> +
> +    if ( argc == 4 )
> +    {
> +        s = e = argv[3];
> +        instance = strtol(s, &e, 0);
> +
> +        if ( *s == '\0' || *e != '\0' )
> +        {
> +            fprintf(stderr, "invalid instance '%s'\n", s);
> +            exit(1);
> +        }
> +    }
> +
> +    xch = xc_interface_open(0, 0, 0);
> +    if ( !xch )
> +    {
> +        fprintf(stderr, "error: can't open libxc handle\n");
> +        exit(1);
> +    }
> +
> +    rc = xc_domain_getcontext(xch, domid, NULL, &len);
> +    if ( rc < 0 )
> +    {
> +        fprintf(stderr, "error: can't get record length for dom %lu: %s\n",
> +                domid, strerror(errno));
> +        exit(1);
> +    }
> +
> +    buf = malloc(len);
> +    if ( !buf )
> +    {
> +        fprintf(stderr, "error: can't allocate %lu bytes\n", len);
> +        exit(1);
> +    }
> +
> +    rc = xc_domain_getcontext(xch, domid, buf, &len);
> +    if ( rc < 0 )
> +    {
> +        fprintf(stderr, "error: can't get domain record for dom %lu: %s\n",
> +                domid, strerror(errno));
> +        exit(1);
> +    }
> +    off = 0;
> +
> +    entry = 0;
> +    for ( ; ; )
> +    {
> +        struct domain_save_descriptor *desc;
> +
> +        GET_PTR(desc);
> +
> +        off += sizeof(*desc);
> +
> +        if ( (typecode < 0 || typecode == desc->typecode) &&
> +             (instance < 0 || instance == desc->instance) )
> +        {
> +            printf("[%u] type: %u instance: %u length: %u\n", entry++,
> +                   desc->typecode, desc->instance, desc->length);
> +
> +            switch (desc->typecode)
> +            {
> +            case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
> +            case DOMAIN_SAVE_CODE(END): dump_end(); break;
> +            default:
> +                printf("Unknown type %u: skipping\n", desc->typecode);
> +                break;
> +            }
> +        }
> +
> +        if ( desc->typecode == DOMAIN_SAVE_CODE(END) )
> +            break;
> +
> +        off += desc->length;
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> -- 
> 2.20.1
> 

