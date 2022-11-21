Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63626328B6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446742.702519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox97u-00058a-HI; Mon, 21 Nov 2022 15:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446742.702519; Mon, 21 Nov 2022 15:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox97u-00055Y-E3; Mon, 21 Nov 2022 15:54:30 +0000
Received: by outflank-mailman (input) for mailman id 446742;
 Mon, 21 Nov 2022 15:54:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+Qx=3V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ox97t-00055S-02
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:54:29 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7488192-69b4-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 16:54:27 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id f7so16859879edc.6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 07:54:27 -0800 (PST)
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
X-Inumbo-ID: c7488192-69b4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7wrvF8cv/7DZCsp8TsTkcEqJGvPXPVcgkDNtN7ewYo=;
        b=VPMv7JC8sFo8zAlwnSCHzJ3CcI1Eo+wWgxbtNvfHVbNmrNMqCcpoYWmEW8g0iG2uZY
         g4ik1nRenO1XcwVpzQ9kbJgoQv/qeyqQH27HHQL/huhJu048n2hFvbrUnBdoTWui/5vT
         C0LOme7/QGYE8tqa2r7TFwe50kecT4F+r1mA/6lqfnMDRx4fICs6acNtm0gaCY0TUJR8
         zkuiE9gO+D1tOEnu8YlPfQyYgxKyODq/SN9ReKd+2EARQluWHbczRMrWNw2TJMTHPp4X
         XXc9LxZhx9n8nao4MmIiJQnM63EHlmkjf2uE5F7ys3f/yIZ01tCI8R7tqn/n8CsROlW+
         52Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7wrvF8cv/7DZCsp8TsTkcEqJGvPXPVcgkDNtN7ewYo=;
        b=YR6WGsilpOZv4cXF3XELRuTw8NrFD69uadOQDLFylX86NUsembGLzgDfCMEcXzuPVR
         XOKT6RDwpeOstEnsg0L0Vk5duSuZJa466pARcMT1iMPuXKuL6XktY6OkCuEnrVKMeVH6
         jnUX7jC62/VqfxpKz/eqSVHgmt422jZ8y6cTk6N36c7+HlsEndRAuyHYmJu17rUxaK7m
         ygOGhx2RhnYyPq+O4MyT4rUwEj+pmJAS5yG0B4T01K3OAVWprFvmjWlXfmJ/6yQP6M3d
         9jCyLZ6ZPI3vcfTTreyfN0mR0xqkeAoJJAHLt4p8Q7sl74indr8n5H//Kjt4FGyvxw0F
         Y/hQ==
X-Gm-Message-State: ANoB5pkg4sEOutOmOf3Laq1oVjyK4QGxHFVCBGrucRPUtXMCLVU5D3VD
	hzm+KCygTAqgTbIdC1tiPhHdrn9p0LqHwDrDXEY=
X-Google-Smtp-Source: AA0mqf64cW9xzT3urlLFxEWbS8cABzz7J2Iy727RookjhUCc7jGUlI9NdHl1QdlBl/3jZEvwMgWtIwrAqdLgqOFlcJk=
X-Received: by 2002:aa7:d551:0:b0:468:fb2c:6c8c with SMTP id
 u17-20020aa7d551000000b00468fb2c6c8cmr15306118edr.340.1669046067451; Mon, 21
 Nov 2022 07:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
 <20221121143731.27545-3-andrew.cooper3@citrix.com> <CAKf6xpto_4KPH5K=vXorAK0_e483qE6RRu1ioF7pRwh8TBGjaw@mail.gmail.com>
 <9a302c19-4f07-77a5-5e41-310498c7cf23@citrix.com>
In-Reply-To: <9a302c19-4f07-77a5-5e41-310498c7cf23@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 21 Nov 2022 10:54:15 -0500
Message-ID: <CAKf6xps3OQsuFMNOnJ1hoMvk5tnkNpUhPdNRqdPeht9dTvS+jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/flask: Wire up XEN_DOMCTL_{get,set}_paging_mempool_size
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 10:46 AM Andrew Cooper
<Andrew.Cooper3@citrix.com> wrote:
>
> On 21/11/2022 15:39, Jason Andryuk wrote:
> > On Mon, Nov 21, 2022 at 9:37 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> These were overlooked in the original patch, and noticed by OSSTest which does
> >> run some Flask tests.
> >>
> >> Fixes: 22b20bd98c02 ("xen: Introduce non-broken hypercalls for the paging mempool size")
> >> Suggested-by: Daniel Smith <dpsmith@apertussolutions.com>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> >> CC: Daniel Smith <dpsmith@apertussolutions.com>
> >> CC: Jason Andryuk <jandryuk@gmail.com>
> >> CC: Henry Wang <Henry.Wang@arm.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Thanks, Andrew.  Though we might want a small tweak - possibly as a follow up?
> >
> >> diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
> >> index 424daab6a022..6b7b7d403ab4 100644
> >> --- a/tools/flask/policy/modules/xen.if
> >> +++ b/tools/flask/policy/modules/xen.if
> >> @@ -92,7 +92,7 @@ define(`manage_domain', `
> >>         allow $1 $2:domain { getdomaininfo getvcpuinfo getaffinity
> >>                         getaddrsize pause unpause trigger shutdown destroy
> >>                         setaffinity setdomainmaxmem getscheduler resume
> >> -                       setpodtarget getpodtarget };
> >> +                       setpodtarget getpodtarget getpagingmempool setpagingmempool };
> > There is also create_domain_common which is for a dedicated "domain
> > builder" that creates but does not manage domains.  I think that
> > should gain setpagingmempool permission?
>
> Sounds like it should.  Something like this?
>
> diff --git a/tools/flask/policy/modules/xen.if
> b/tools/flask/policy/modules/xen.if
> index 6b7b7d403ab4..11c1562aa5da 100644
> --- a/tools/flask/policy/modules/xen.if
> +++ b/tools/flask/policy/modules/xen.if
> @@ -49,7 +49,8 @@ define(`create_domain_common', `
>         allow $1 $2:domain { create max_vcpus setdomainmaxmem setaddrsize
>                         getdomaininfo hypercall setvcpucontext getscheduler
>                         getvcpuinfo getaddrsize getaffinity setaffinity
> -                       settime setdomainhandle getvcpucontext
> set_misc_info };
> +                       settime setdomainhandle getvcpucontext set_misc_info
> +                       getpagingmempool setpagingmempool };
>         allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
>                         set_vnumainfo get_vnumainfo cacheflush
>                         psr_cmt_op psr_alloc soft_reset
>
> I can fold this in on commit.

Yes, though strictly speaking it may only need setpagingmempool and
not getpagingmempool.  These are all calls that would execute before
the domain is run.  But adding both is probably fine since the builder
is setting these itself.  i.e. allowing it to read what it set is
fine.

So, yes, I'd just fold this in.

Thanks,
Jason

