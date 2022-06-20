Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD46551382
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 10:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352623.579441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3DCn-0007w0-ET; Mon, 20 Jun 2022 08:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352623.579441; Mon, 20 Jun 2022 08:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3DCn-0007u4-BL; Mon, 20 Jun 2022 08:56:21 +0000
Received: by outflank-mailman (input) for mailman id 352623;
 Mon, 20 Jun 2022 08:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l44P=W3=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1o3DCl-0007ty-CN
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 08:56:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d88a1e3a-f076-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 10:56:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id q9so13655331wrd.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jun 2022 01:56:17 -0700 (PDT)
Received: from horizon (lfbn-gre-1-214-221.w90-112.abo.wanadoo.fr.
 [90.112.175.221]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0039c747a1e8fsm19633449wmi.7.2022.06.20.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 01:56:16 -0700 (PDT)
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
X-Inumbo-ID: d88a1e3a-f076-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/CYGdhvh0JTTrmuuZw+EA2MlPBAr2UuAM4GaC7CWKq4=;
        b=OLS5nhf3UrAbhEEIJHfB0Gdoj7Tc47R89wHKqOPLqEDqeP25J7AVKI3+vzEMqjrsDH
         AgIPPoSgFfdBiKU0te1kErNx4wjjOew3aH/GOE7mxxf+zSCSsrn/FKwCtWYf6JVxSs9m
         gkre39OkCIzPO4JWbzuUn4YXhUPTywI6A45DjlNyJTF6nrvIaXjkmE3olHKpug7T3oBn
         tqVabirXbQQtO5N8SF4Zx8uuB9Wi/4hiPh1gF5tynXtIttqlIG2BuNJRbPijtEn0lVQ1
         nGaytsl+pDDPB7sI8kTOj8SKtDTztwZZWDVvixnY5TtKSilpgS80bXZuV5pczxSJzvxB
         /A3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/CYGdhvh0JTTrmuuZw+EA2MlPBAr2UuAM4GaC7CWKq4=;
        b=7DkU8VUN/sdW9eQLLemYnZ6ox65jMd1TLUzmsaaLy+ALoOCtxjaU0quW5BkUKYD4iE
         WEekfdFA9vNWbI/2C7w7B+lthI4e3IJHEA57LUIvQOwUFx87ERZy9x8p7PPjuJDPFQq0
         +VbUtJHpwEFHAl/L8S2OQB1kvr+OsCLucLhnaUtno4mJlZ3CIweUQeYeubWT5wSN9A9a
         /skFuTlyl7B2dFrPJz9aBPQSAKsHSxmYn0vz1Ulom+IXd+cHNBGHmn4vR5HRQQ3DcF4U
         3kqPmldMxdf5W9ClJq1Qm73EDgiIbDu+U3VF/CladuQW8Vxs1OOf5/AOsYj932SLmRii
         EIPg==
X-Gm-Message-State: AJIora9ivN97ePFRBmhax1d2pR2hb6kXYijDa7Fn+OFjMp8MEJvdQbUA
	l22FOtsgevYWk8fJJ5YWTRc=
X-Google-Smtp-Source: AGRyM1t0QCJGOHa7pghE1mG2q/DLffpIncDXltiFj2wl1li+rotuu0dFTPYyg3kFTQ/ZnP3j25hSkg==
X-Received: by 2002:a05:6000:1a88:b0:218:4e7f:279d with SMTP id f8-20020a0560001a8800b002184e7f279dmr22265148wry.670.1655715377277;
        Mon, 20 Jun 2022 01:56:17 -0700 (PDT)
Date: Mon, 20 Jun 2022 10:56:15 +0200
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 2/2] tools/misc: Add xen-stats tool
Message-ID: <20220620085615.GA2039596@horizon>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <e233c4f60c6fe97b93b3adf9affeb0404c554130.1652797713.git.matias.vara@vates.fr>
 <YpX48uwOGVqayb/x@perard.uk.xensource.com>
 <20220603110820.GA193297@horizon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603110820.GA193297@horizon>

Hello Anthony, 

On Fri, Jun 03, 2022 at 01:08:20PM +0200, Matias Ezequiel Vara Larsen wrote:
> Hello Anthony and thanks for your comments. I addressed them below:
> 
> On Tue, May 31, 2022 at 12:16:02PM +0100, Anthony PERARD wrote:
> > Hi Matias,
> > 
> > On Tue, May 17, 2022 at 04:33:15PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > Add a demostration tool that uses the stats_table resource to
> > > query vcpu time for a DomU.
> > > 
> > > Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> > > ---
> > > diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> > > index 2b683819d4..b510e3aceb 100644
> > > --- a/tools/misc/Makefile
> > > +++ b/tools/misc/Makefile
> > > @@ -135,4 +135,9 @@ xencov: xencov.o
> > >  xen-ucode: xen-ucode.o
> > >  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
> > >  
> > > +xen-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
> > > +
> > > +xen-stats: xen-stats.o
> > 
> > The tools seems to be only about vcpu, maybe `xen-stats` is a bit too
> > generic. Would `xen-vcpus-stats`, or maybe something with `time` would
> > be better?
> 
> Do you think `xen-vcpus-stats` would be good enough?
> 

I will pick up `xen-vcpus-stats` for v1 if you are not against it.

Thanks,

Matias

> > Also, is it a tools that could be useful enough to be installed by
> > default? Should we at least build it by default so it doesn't rot? (By
> > adding it to only $(TARGETS).)
> 
> I will add to build this tool by default in the next patches' version.
>  
> > > +	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> > > +
> > >  -include $(DEPS_INCLUDE)
> > > diff --git a/tools/misc/xen-stats.c b/tools/misc/xen-stats.c
> > > new file mode 100644
> > > index 0000000000..5d4a3239cc
> > > --- /dev/null
> > > +++ b/tools/misc/xen-stats.c
> > > @@ -0,0 +1,83 @@
> > > +#include <err.h>
> > > +#include <errno.h>
> > > +#include <error.h>
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > > +#include <sys/mman.h>
> > > +#include <signal.h>
> > > +
> > > +#include <xenctrl.h>
> > 
> > It seems overkill to use this header when the tool only use
> > xenforeignmemory interface. But I don't know how to replace
> > XC_PAGE_SHIFT, so I guess that's ok.
> > 
> > > +#include <xenforeignmemory.h>
> > > +#include <xen-tools/libs.h>
> > 
> > What do you use this headers for? Is it left over?
> 
> `xenforeignmemory.h` is used for `xenforeignmemory_*` functions.
> `xen-tools/libs.h` is left over so I will remove it in next version.
> 
> > > +static sig_atomic_t interrupted;
> > > +static void close_handler(int signum)
> > > +{
> > > +    interrupted = 1;
> > > +}
> > > +
> > > +int main(int argc, char **argv)
> > > +{
> > > +    xenforeignmemory_handle *fh;
> > > +    xenforeignmemory_resource_handle *res;
> > > +    size_t size;
> > > +    int rc, nr_frames, domid, frec, vcpu;
> > > +    uint64_t * info;
> > > +    struct sigaction act;
> > > +
> > > +    if (argc != 4 ) {
> > > +        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
> > > +        return 1;
> > > +    }
> > > +
> > > +    // TODO: this depends on the resource
> > > +    nr_frames = 1;
> > > +
> > > +    domid = atoi(argv[1]);
> > > +    frec = atoi(argv[3]);
> > > +    vcpu = atoi(argv[2]);
> > 
> > Can you swap the last two line? I think it is better if the order is the same
> > as on the command line.
> 
> Yes, I can.
> 
> > > +
> > > +    act.sa_handler = close_handler;
> > > +    act.sa_flags = 0;
> > > +    sigemptyset(&act.sa_mask);
> > > +    sigaction(SIGHUP,  &act, NULL);
> > > +    sigaction(SIGTERM, &act, NULL);
> > > +    sigaction(SIGINT,  &act, NULL);
> > > +    sigaction(SIGALRM, &act, NULL);
> > > +
> > > +    fh = xenforeignmemory_open(NULL, 0);
> > > +
> > > +    if ( !fh )
> > > +        err(1, "xenforeignmemory_open");
> > > +
> > > +    rc = xenforeignmemory_resource_size(
> > > +        fh, domid, XENMEM_resource_stats_table,
> > > +        vcpu, &size);
> > > +
> > > +    if ( rc )
> > > +        err(1, "    Fail: Get size: %d - %s\n", errno, strerror(errno));
> > 
> > It seems that err() already does print strerror(), and add a "\n", so
> > why print it again? Also, if we have strerror(), what the point of
> > printing "errno"?
> 
> I will remove errno, strerror(errno), and the extra "\n".
> 
> > Also, I'm not sure the extra indentation in the error message is really
> > useful, but that doesn't really matter.
> 
> I will remove the indentation.
> 
> > > +
> > > +    if ( (size >> XC_PAGE_SHIFT) != nr_frames )
> > > +        err(1, "    Fail: Get size: expected %u frames, got %zu\n",
> > > +                    nr_frames, size >> XC_PAGE_SHIFT);
> > 
> > err() prints strerror(errno), maybe errx() is better here. 
> 
> I will use errx().
> 
> Thanks,
>  
> > 
> > Thanks,
> > 
> > -- 
> > Anthony PERARD

