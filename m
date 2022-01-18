Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839049241F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258440.445073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9m4j-0001Vv-Mt; Tue, 18 Jan 2022 10:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258440.445073; Tue, 18 Jan 2022 10:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9m4j-0001SW-Iy; Tue, 18 Jan 2022 10:50:53 +0000
Received: by outflank-mailman (input) for mailman id 258440;
 Tue, 18 Jan 2022 10:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BW1=SC=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n9m4i-0001Rc-DC
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:50:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f916900-784c-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 11:50:51 +0100 (CET)
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
X-Inumbo-ID: 7f916900-784c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642503050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PrW11ZQqHwXAoWym8+utnWzmgPtCkPoTIZxVSj4yQN0=;
  b=DOhgNknHrmERIJPNXqFA4JOrZdZLcFF9iVlZAwYzC9t5vF4CfazfxDmB
   Or9areHoXf6TUTpb31VSLDzt7ai5FS54RUs9eAt3YxyDBbElAVP33XGct
   MkCQEmI2JdZb1Kf+XoOUAYyt+EPd/GxCBQFiwfYrffshnRLhjvgnzDqg+
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FgI9JUDwQA8yZL3NL4Of1gR0+TkMe+Ij9TlxF5LeLQVQdKem03+YrNfMfXOp3qJel0WwUSWMc9
 2oLv2vrMbt6xtuiEZQdPxHOJ9Rfv/e1gjcajD5h860bvXmAakSVhMlIvpPh3uga9qRCspoHoIT
 GijxHxW64UbsSQfMzNnNWvmps8SEss4DPt84K21oJKaObXZbQxcO6EkPmzpiUxqnD2zogghbRF
 yvHJM4gfhB7uMDkPHCi8F8dxoTUvzUGL/7/v2jUXpcYgjlHNLZSYG4Od8fdOpnDDioTvgZGjo1
 06sHGLhLdmieHX2+lsQPLi+Y
X-SBRS: 5.2
X-MesageID: 62209229
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:exDtb6NpYe8Gy/7vrR0ukMFynXyQoLVcMsEvi/4bfWQNrUol0DAFm
 2IbUWyEbqrcNzT0fIp+aYS/oEMEuZfWmNVqGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eszw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoz61settk
 cgRiZq1Wz0lL5fQl+8nSxYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm1q3pEUR6e2i
 8wxWHlqMk3pWDN1PVZQM7I0lb35vnrxfGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFaFoRw0S9dWC/c96gyG1uzT+QnxLmoZSj9MbvQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0cJWQE/UVIYv+XlpZMJggP1UtloKra624id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodd7BFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gNuFmSx28za67onAMFh
 meJ5mu9A7cJbROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTy3zBRwwP9jY
 s3GGSpJMZr8If44pNZRb71MuYLHOwhknT+DLXwF50nPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pILHsbefFsOMDxxWpf5nOJ6E6Q4zvs9qws91
 iznMqOu4ACh1SSvxMTjQi0LVY4Dqr4k/C1rZnJ9bA/4s5XhCK72hJoim1IMVeFP3IReITRcF
 JHpou2MXaZCTCrp4TMYYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6LE4AeQwlCDdrNbK79xV2GonVAyvl5WFHFI4cPdRy0opRqMSH4ktQ+P9oIdUfY3jKf2
 gvPWUUYqODBrpUb6t7MgazY/Y6lH/EnRhhRHnXB7KbwPi7fpzLxzYhFWeeOXDbcSGKrp/nyO
 bQLl6nxaaRVkkxLvoxwF6dQ4Zg/v9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+mOiaMUlz3V4ahnKUn2/nYqrr+OUEEUNBiQki1NarByNdp9k
 +smvccX7S25iwYrbYna3nwFqTzUIyxSSbgju7EbHJTv21gixVx1aJDBDjP7vcOUYNJWP0h2e
 jKZicIuXViHKpYup5brKUXw4A==
IronPort-HdrOrdr: A9a23:51/wvq4Sd1s5A9UGHAPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62209229"
Date: Tue, 18 Jan 2022 10:50:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 26/47] build,x86: remove the need for build32.mk
Message-ID: <YeabhMhQe/+Pfll4@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-27-anthony.perard@citrix.com>
 <8d7694a4-d7aa-200e-d29a-f055909a13ea@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8d7694a4-d7aa-200e-d29a-f055909a13ea@suse.com>

On Tue, Dec 21, 2021 at 02:33:18PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -171,6 +171,10 @@ export LEX = $(if $(FLEX),$(FLEX),flex)
> >  # Default file for 'make defconfig'.
> >  export KBUILD_DEFCONFIG := $(ARCH)_defconfig
> >  
> > +# Copy CFLAGS generated by "Config.mk" so they can be reused later without
> > +# reparsing Config.mk by e.g. arch/x86/boot/.
> > +export XEN_COMMON_CFLAGS := $(CFLAGS)
> 
> For my own understanding (it's hard to check being half way through the
> series): At this point there are no further adjustments expected to
> CFLAGS?

I'm not sure what you mean. The comment should be explicit.

CFLAGS is going to be adjusted after the copy, for the benefit of all
the 64bit code (when building x86_64). The "renamed" to XEN_CFLAGS to be
useable by the rest of the tree.

The name "XEN_COMMON_CFLAGS" might not be the right one, it is only
common to everything in xen.git, so same flags that the toolstack would
work with.

> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > @@ -1,25 +1,45 @@
> >  obj-bin-y += head.o
> > +head-objs := cmdline.S reloc.S
> 
> Is "-objs" really a suitable part of the name for a list of *.S?

Maybe not. I think this "x-objs" naming is used in Linux to build
modules with more than one object. But I guess here we have an object
with more than one source. Maybe "head-srcs" is better, even if it's
compiled code made ready to include into a .S source file.

> > -DEFS_H_DEPS = $(abs_srctree)/$(src)/defs.h $(abs_srctree)/include/xen/stdbool.h
> > +nocov-y += $(head-objs:.S=.o)
> > +noubsan-y += $(head-objs:.S=.o)
> > +targets += $(head-objs:.S=.o)
> >  
> > -CMDLINE_DEPS = $(DEFS_H_DEPS) $(abs_srctree)/$(src)/video.h \
> > -	       $(BASEDIR)/include/xen/kconfig.h \
> > -	       $(BASEDIR)/include/generated/autoconf.h
> > +head-objs := $(addprefix $(obj)/, $(head-objs))
> >  
> > -RELOC_DEPS = $(DEFS_H_DEPS) \
> > -	     $(BASEDIR)/include/generated/autoconf.h \
> > -	     $(BASEDIR)/include/xen/kconfig.h \
> > -	     $(BASEDIR)/include/xen/multiboot.h \
> > -	     $(BASEDIR)/include/xen/multiboot2.h \
> > -	     $(BASEDIR)/include/xen/const.h \
> > -	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
> > +$(obj)/head.o: $(head-objs)
> >  
> > -$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
> > +$(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))
> 
> Considering there's just a single use of LDFLAGS_DIRECT below, wouldn't
> it make sense to avoid overriding the variable and doing the $(subst ...)
> right at the use site instead?

Yes, that might be ok to do.

> > -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
> > -	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
> > +CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_COMMON_CFLAGS))
> 
> I can't seem to be able to spot -march=i686 in the old code. Or wait -
> Is this duplicating what config/x86_32.mk has?

Yes.

> > +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> 
> You did inherit -Werror and -fno-builtin from $(XEN_COMMON_CFLAGS)
> already, so I don't think you need to specify these again?

No, because I didn't want to change the CFLAGS used to build the 32bits
binaries in this patch. So XEN_COMMON_CFLAGS just hold the CFLAGS
produced by "Config.mk" for the x86_32 arch. So XEN_COMMON_CFLAGS is
different from XEN_CFLAGS.

If we want to use the same CFLAGS to build head.o, then I think it would
be better to do in it's own patch. I can probably do it before or after
this patch as XEN_CFLAGS is already available.

Thanks,

-- 
Anthony PERARD

