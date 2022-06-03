Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0353C927
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 13:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341449.566671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx5AK-00055p-CH; Fri, 03 Jun 2022 11:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341449.566671; Fri, 03 Jun 2022 11:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx5AK-00053e-8E; Fri, 03 Jun 2022 11:08:28 +0000
Received: by outflank-mailman (input) for mailman id 341449;
 Fri, 03 Jun 2022 11:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWPM=WK=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1nx5AI-00053S-HK
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 11:08:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c05acbb-e32d-11ec-bd2c-47488cf2e6aa;
 Fri, 03 Jun 2022 13:08:25 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id q1so15234280ejz.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jun 2022 04:08:23 -0700 (PDT)
Received: from horizon ([84.46.98.218]) by smtp.gmail.com with ESMTPSA id
 y17-20020a170906525100b006ff9e36cfeesm2671699ejm.196.2022.06.03.04.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 04:08:22 -0700 (PDT)
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
X-Inumbo-ID: 7c05acbb-e32d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RdFgsCSI0eA/Z30ftBEehauVIqGaKLRNGF/w6vlYHys=;
        b=PD7gsyb9INieFJ5VE3CQFRjLF8ZbjmnTJbKYDsPFT4oM9HofDN1xnXVAfavHYCAkj+
         EzbmKX15pXDYObRH8Om5n3VJDQc1kTetu1hhdkWUs23w2+Nqbk9k5E0lgH3EAgh4ZNI8
         L62aRPEIzHQDZOcS6+/tazeXbJ3mIrVs4oDUmXUsWqMve/yckIxyH7K5dGyJ+qBu1HS+
         GnFb0/b9TH28XgPeiuu7p5dmVcd1lrLJ/DfrpBYcS4pUxsgncPXeN+jByMbWw7+orJ3r
         Yr7G68SF6LsYbDNh6VY+R04BFIUffVGcoqQgp8VDgGuvLLboczeWrTsW+FkNW9fu8kKw
         11qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RdFgsCSI0eA/Z30ftBEehauVIqGaKLRNGF/w6vlYHys=;
        b=TpiDngVo0g8Jm36j1ZSejBZsv967UGKF71HUW2SKAIhUmZzcWc+OcbgOw0FZ5yUbh7
         la8yNPvBXY+GeH4qwayBDvOtMOcMDKIt24iLpMY8ypo03fpEWhdWotRKJ0/ZEA+jGREh
         Zo8Mkz/DjGKLxELZOK58ijaIBATv9rVTPQaEQLP1vSsA20Q+wJlUx7CAZRrRsRU4yywG
         h6NwwzWbypBXmy0cEHqmFkrUZPM9Xl3KSuHe3zudmU+veITq2If24u2SAd8iHG//or/j
         aD/fO9V6MMNC8Wm3vvyY0+Fm22x/cXIpIoQrF0btJiK3wO/vEyC8BI3HZYgDDlPdV+j8
         F3Pw==
X-Gm-Message-State: AOAM530BblGnTv2hkzmRlLSp1oa5A0gfDE9etnqKQ9raViusGZXkaYLa
	z7Kaxw7RExZftHT+Cy56/tBDIguEG8ewaVRB
X-Google-Smtp-Source: ABdhPJxBqYmWDocy8Kkk6TeaVF4YDLO1mnsNm0Fg0hAAPUgUmVE96OVROxaH7eqoHIhmlVSQkdfdMw==
X-Received: by 2002:a17:907:6d05:b0:6fe:c506:9239 with SMTP id sa5-20020a1709076d0500b006fec5069239mr8125822ejc.539.1654254502991;
        Fri, 03 Jun 2022 04:08:22 -0700 (PDT)
Date: Fri, 3 Jun 2022 13:08:20 +0200
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 2/2] tools/misc: Add xen-stats tool
Message-ID: <20220603110820.GA193297@horizon>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <e233c4f60c6fe97b93b3adf9affeb0404c554130.1652797713.git.matias.vara@vates.fr>
 <YpX48uwOGVqayb/x@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpX48uwOGVqayb/x@perard.uk.xensource.com>

Hello Anthony and thanks for your comments. I addressed them below:

On Tue, May 31, 2022 at 12:16:02PM +0100, Anthony PERARD wrote:
> Hi Matias,
> 
> On Tue, May 17, 2022 at 04:33:15PM +0200, Matias Ezequiel Vara Larsen wrote:
> > Add a demostration tool that uses the stats_table resource to
> > query vcpu time for a DomU.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> > ---
> > diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> > index 2b683819d4..b510e3aceb 100644
> > --- a/tools/misc/Makefile
> > +++ b/tools/misc/Makefile
> > @@ -135,4 +135,9 @@ xencov: xencov.o
> >  xen-ucode: xen-ucode.o
> >  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
> >  
> > +xen-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
> > +
> > +xen-stats: xen-stats.o
> 
> The tools seems to be only about vcpu, maybe `xen-stats` is a bit too
> generic. Would `xen-vcpus-stats`, or maybe something with `time` would
> be better?

Do you think `xen-vcpus-stats` would be good enough?

> Also, is it a tools that could be useful enough to be installed by
> default? Should we at least build it by default so it doesn't rot? (By
> adding it to only $(TARGETS).)

I will add to build this tool by default in the next patches' version.
 
> > +	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> > +
> >  -include $(DEPS_INCLUDE)
> > diff --git a/tools/misc/xen-stats.c b/tools/misc/xen-stats.c
> > new file mode 100644
> > index 0000000000..5d4a3239cc
> > --- /dev/null
> > +++ b/tools/misc/xen-stats.c
> > @@ -0,0 +1,83 @@
> > +#include <err.h>
> > +#include <errno.h>
> > +#include <error.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/mman.h>
> > +#include <signal.h>
> > +
> > +#include <xenctrl.h>
> 
> It seems overkill to use this header when the tool only use
> xenforeignmemory interface. But I don't know how to replace
> XC_PAGE_SHIFT, so I guess that's ok.
> 
> > +#include <xenforeignmemory.h>
> > +#include <xen-tools/libs.h>
> 
> What do you use this headers for? Is it left over?

`xenforeignmemory.h` is used for `xenforeignmemory_*` functions.
`xen-tools/libs.h` is left over so I will remove it in next version.

> > +static sig_atomic_t interrupted;
> > +static void close_handler(int signum)
> > +{
> > +    interrupted = 1;
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    xenforeignmemory_handle *fh;
> > +    xenforeignmemory_resource_handle *res;
> > +    size_t size;
> > +    int rc, nr_frames, domid, frec, vcpu;
> > +    uint64_t * info;
> > +    struct sigaction act;
> > +
> > +    if (argc != 4 ) {
> > +        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
> > +        return 1;
> > +    }
> > +
> > +    // TODO: this depends on the resource
> > +    nr_frames = 1;
> > +
> > +    domid = atoi(argv[1]);
> > +    frec = atoi(argv[3]);
> > +    vcpu = atoi(argv[2]);
> 
> Can you swap the last two line? I think it is better if the order is the same
> as on the command line.

Yes, I can.

> > +
> > +    act.sa_handler = close_handler;
> > +    act.sa_flags = 0;
> > +    sigemptyset(&act.sa_mask);
> > +    sigaction(SIGHUP,  &act, NULL);
> > +    sigaction(SIGTERM, &act, NULL);
> > +    sigaction(SIGINT,  &act, NULL);
> > +    sigaction(SIGALRM, &act, NULL);
> > +
> > +    fh = xenforeignmemory_open(NULL, 0);
> > +
> > +    if ( !fh )
> > +        err(1, "xenforeignmemory_open");
> > +
> > +    rc = xenforeignmemory_resource_size(
> > +        fh, domid, XENMEM_resource_stats_table,
> > +        vcpu, &size);
> > +
> > +    if ( rc )
> > +        err(1, "    Fail: Get size: %d - %s\n", errno, strerror(errno));
> 
> It seems that err() already does print strerror(), and add a "\n", so
> why print it again? Also, if we have strerror(), what the point of
> printing "errno"?

I will remove errno, strerror(errno), and the extra "\n".

> Also, I'm not sure the extra indentation in the error message is really
> useful, but that doesn't really matter.

I will remove the indentation.

> > +
> > +    if ( (size >> XC_PAGE_SHIFT) != nr_frames )
> > +        err(1, "    Fail: Get size: expected %u frames, got %zu\n",
> > +                    nr_frames, size >> XC_PAGE_SHIFT);
> 
> err() prints strerror(errno), maybe errx() is better here. 

I will use errx().

Thanks,
 
> 
> Thanks,
> 
> -- 
> Anthony PERARD

