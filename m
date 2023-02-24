Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A06A1E94
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501202.772849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVa2l-0007ez-2u; Fri, 24 Feb 2023 15:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501202.772849; Fri, 24 Feb 2023 15:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVa2k-0007bj-Vw; Fri, 24 Feb 2023 15:31:30 +0000
Received: by outflank-mailman (input) for mailman id 501202;
 Fri, 24 Feb 2023 15:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2EX=6U=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pVa2j-0007bd-Gb
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:31:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dad0dbd-b458-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 16:31:27 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id h14so5643107wru.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 07:31:27 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4c49000000b002c54536c662sm13066801wrt.34.2023.02.24.07.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:31:25 -0800 (PST)
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
X-Inumbo-ID: 4dad0dbd-b458-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZV5C0hVPYC0aBKYitXuskCf1e0ZV+iPaAkzufBrwV78=;
        b=bUs9rI57R7lETZvlexfoMYqFcthg+BP9KjLRVlfr8m9O4jPRkDWbpR6GrT1PHtyp4H
         SOuq72nNfwoJ75aVCnyG4tdLak4uaL9HLHVl+l+nyENG5snmRuRJlxAyT1xTQlajRoyS
         iv9ixqUlywGoy1HHsqoFNO/1jvVW4ZxWqM/eWGxrAGqD21HuJ10ItwmdaOMVPDjyD61z
         4qCPZei9hgzlYBw1xWaI2j0N+jXaL38aUc3l3yP5XyjhxP2CScQsMAJvuQxhNN4oUpQf
         lvWtw23iisvpE6QXkdo0bX+06h2Us2lV5Saf6WnsTaHjCl69QymH/yz2mS4aUxOX83QW
         f3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV5C0hVPYC0aBKYitXuskCf1e0ZV+iPaAkzufBrwV78=;
        b=HF7xvNPq4r7BDCfcRc9kkRwGzjNRBrLk9K79lWJB2u4YZ5r6fHsysHrMX6zCb773UR
         u+N6h/f5pDBM5+nn9FDJ/NgYx0uConzR3eMJdyuxxyY3OA24Gv744sUKUFJleD60+uoN
         R9VJp+VHmUX16isUfCjKoUKAmEzFJUFKo4wwBjsR7p9aAS4CTVf/7MSQwKuYqkdnVGEU
         m5HoJEkHLWcOyWqNudnRORPDjUfZ9myKY8U52UkH/X8fdwwQOw2KApLSTM1C9EVSq2M2
         a5ZrjrORg+hPPTTfuiyYZWf7KC/J3BdNqnlxI41nXTkNL4sVEssFQAMYgRWFcFjNv6H+
         Ztpw==
X-Gm-Message-State: AO0yUKU0wgX2wGBJKiskEgdB+FVf4BUWZPHUKzX1ylpvp8U0HSGjT8OE
	3FOFasnQ2ic49+b74jDV8Mg=
X-Google-Smtp-Source: AK7set/Np1CirXs68TrXcIO5r9v7owhi/BkPczCCiv337bPpwNzV1c9xKda0dwqXrgIiYO3IFX1zGg==
X-Received: by 2002:a5d:4e47:0:b0:2c8:840:26ea with SMTP id r7-20020a5d4e47000000b002c8084026eamr824217wrt.12.1677252686447;
        Fri, 24 Feb 2023 07:31:26 -0800 (PST)
Date: Fri, 24 Feb 2023 16:31:23 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH v2 2/2] tools/misc: Add xen-vcpus-stats tool
Message-ID: <20230224153123.GA3764964@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
 <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>

Hello Andrew and thanks for the comments,

On Thu, Feb 23, 2023 at 04:01:09PM +0000, Andrew Cooper wrote:
> On 07/10/2022 1:39 pm, Matias Ezequiel Vara Larsen wrote:
> 
> A couple of observations, all unrelated to the stats themselves.
> 
> Although overall, I'm not entirely certain that a tool like this is
> going to be very helpful after initial development.  Something to
> consider would be to alter libxenstat to use this new interface?
> 

Yes. We discussed about this in a design sesion at the summit. I could not move
forward on that direction yet but it is the right way to go. I use this tool
only to play with the interface and I could just remove it from the RFC in next
versions.

> > diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> > index 2b683819d4..837e4b50da 100644
> > --- a/tools/misc/Makefile
> > +++ b/tools/misc/Makefile
> > @@ -49,6 +49,7 @@ TARGETS_COPY += xenpvnetboot
> >
> > # Everything which needs to be built
> > TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
> > +TARGETS_BUILD += xen-vcpus-stats
> 
> This patch is whitespace corrupted.  If at all possible, you need to see
> about getting `git send-email` working to send patches with, as it deals
> with most of the whitespace problems for you.
> 
> I'm afraid you can't simply copy the patch text into an email and send that.
> 

I am using `git send-email` to send patches. I may have missed some flag.
I'll double-check. 

> >
> > # ... including build-only targets
> > TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
> > @@ -135,4 +136,9 @@ xencov: xencov.o
> > xen-ucode: xen-ucode.o
> >     $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
> >
> > +xen-vcpus-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
> > +
> > +xen-vcpus-stats: xen-vcpus-stats.o
> > +    $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl)
> > $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> > +
> > -include $(DEPS_INCLUDE)
> > diff --git a/tools/misc/xen-vcpus-stats.c b/tools/misc/xen-vcpus-stats.c
> > new file mode 100644
> > index 0000000000..29d0efb124
> > --- /dev/null
> > +++ b/tools/misc/xen-vcpus-stats.c
> > @@ -0,0 +1,87 @@
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
> > +#include <xenforeignmemory.h>
> > +#include <xen/vcpu.h>
> > +
> > +#define rmb()   asm volatile("lfence":::"memory")
> 
> This is rmb(), but rmb() isn't what you want.
> 
> You want smp_rmb(), which is
> 
> #define smp_rmb() asm volatile ("" ::: "memory")
> 
> 
> I'm surprised we haven't got this in a common location, considering how
> often it goes wrong.  (Doesn't help that there's plenty of buggy
> examples to copy, even in xen.git)
> 

Got it. I'll rework on it in the next version. For inspiration, I used the code
at arch/x86/kernel/pvclock.c:pvclock_read_wallclock(). 

> > +
> > +static sig_atomic_t interrupted;
> > +static void close_handler(int signum)
> > +{
> > +    interrupted = 1;
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    xenforeignmemory_handle *fh;
> > +    xenforeignmemory_resource_handle *res;
> > +    size_t size;
> > +    int rc, domid, period, vcpu;
> > +    shared_vcpustatspage_t * info;
> 
> shared_vcpustatspage_t *info;
> 
> no space after the *.
> 
> But you also cannot have a single structure describing that.  I'll reply
> to the cover letter discussing ABIs.

I am reading it and I will comment on this soon. 

> 
> > +    struct sigaction act;
> > +    uint32_t version;
> > +    uint64_t value;
> > +
> > +    if (argc != 4 ) {
> 
> { on a new line.
> 
> > +        fprintf(stderr, "Usage: %s <domid> <vcpu> <period>\n", argv[0]);
> > +        return 1;
> > +    }
> > +
> > +    domid = atoi(argv[1]);
> > +    vcpu = atoi(argv[2]);
> > +    period = atoi(argv[3]);
> > +
> > +    act.sa_handler = close_handler;
> > +    act.sa_flags = 0;
> > +    sigemptyset(&act.sa_mask);
> > +    sigaction(SIGHUP,  &act, NULL);
> > +    sigaction(SIGTERM, &act, NULL);
> > +    sigaction(SIGINT,  &act, NULL);
> > +    sigaction(SIGALRM, &act, NULL);
> > +
> > +    fh = xenforeignmemory_open(NULL, 0);
> > +
> > +    if ( !fh )
> > +        err(1, "xenforeignmemory_open");
> > +
> > +    rc = xenforeignmemory_resource_size(
> > +        fh, domid, XENMEM_resource_stats_table,
> > +        0, &size);
> > +
> > +    if ( rc )
> > +        err(1, "Fail: Get size");
> > +
> > +    res = xenforeignmemory_map_resource(
> > +        fh, domid, XENMEM_resource_stats_table,
> > +        0, XENMEM_resource_stats_frame_vcpustats, size >> XC_PAGE_SHIFT,
> > +        (void **)&info, PROT_READ, 0);
> > +
> > +    if ( !res )
> > +        err(1, "Fail: Map");
> > +
> > +    while ( !interrupted ) {
> 
> { on newline again.
> 
> > +        sleep(period);
> > +        do {
> > +            version = info->vcpu_info[vcpu].version;
> > +            rmb();
> > +            value = info->vcpu_info[vcpu].runstate_running_time;
> > +            rmb();
> > +        } while ((info->vcpu_info[vcpu].version & 1) ||
> > +                (version != info->vcpu_info[vcpu].version));
> 
> So I think this will function correctly.
> 
> But I do recall seeing a rather nice way of wrapping a sequence lock in
> C99.  I'll see if I can find it.
> 
> > +        printf("running_vcpu_time[%d]: %ld\n", vcpu, value);
> > +    }
> > +
> > +    rc = xenforeignmemory_unmap_resource(fh, res);
> > +    if ( rc )
> > +        err(1, "Fail: Unmap");
> 
> Given that you unmap(), you ought to close the fh handle too.
> 

Thanks, I'll fix these issues in the next version. I think Jan's review have
already spotted some of them.

Matias

