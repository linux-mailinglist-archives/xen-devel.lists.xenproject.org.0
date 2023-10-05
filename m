Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C597BA617
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 18:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613074.953347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoR9v-00068o-9X; Thu, 05 Oct 2023 16:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613074.953347; Thu, 05 Oct 2023 16:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoR9v-00066E-6i; Thu, 05 Oct 2023 16:25:07 +0000
Received: by outflank-mailman (input) for mailman id 613074;
 Thu, 05 Oct 2023 16:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X9r3=FT=gmail.com=k.kahurani@srs-se1.protection.inumbo.net>)
 id 1qoR9t-000668-Q5
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 16:25:05 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc7b238c-639b-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 18:25:03 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3ae2f8bf865so727852b6e.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 09:25:03 -0700 (PDT)
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
X-Inumbo-ID: bc7b238c-639b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696523102; x=1697127902; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fj4Gd1fbatAsLSbuEz2dtHGL2Wq1DMvXOYfE8V925HQ=;
        b=auQnlcLg2XhxXAe9S8U/4promk6OTu2RkoF9e5At+81UNFHZmRmuNRpjK5dvmS0yBY
         7t066g29iyz8zuo/hv4o4LNwHYmsU9TybfWge9GrYfy0PxB3Ntm02XD8+vBMADfqJKff
         hIc5lQA7U3C1qKItSCuHrdw3iAmkqb2VX5RBDwNkilkGtsOtppMR9Zd4XQzjm0/i2sU5
         9k0gZ1WpKnjn+Ysoa2RwoKTOFMHft+hxIhqbuLcMnRyJQhamVAVmzbnu0kQXqLo97y1I
         K+m1ibT11xxFvNCY2Dd94NveRor8Mv+lA2pOoL8nrXxzw0vNdT3rxudjwc0kFd0Vg3Jk
         dWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696523102; x=1697127902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fj4Gd1fbatAsLSbuEz2dtHGL2Wq1DMvXOYfE8V925HQ=;
        b=G7la6yHOO314U5KgawTNBIamvMqGNWlJBF4O/HpOiJmWfYntjZHezMtr6qOgL/H3cx
         Mj/G4rSXbaiKnML+UeV/ZwhZd/loq+OJLJgXOQHgp85S1rF5d/KYIefY58W23Yk4zNyQ
         UUQUEz9d3cwwaQn63W2NCsnaQ6GgfVPaz2YGUuHQNA+wAULQcYhD7VkbFTN3DgKffzua
         5UYpiOlN6xTf0+DRkEAgfn/A7xFNgirmQFa0ertBuAVv4S+gpLZ3U2KBYllagHN+Ki9Y
         m+I68TbcHBF8RezIbHLNjfPWbxKqrUj4pnk8fEvotjzFWAWATHR1dR1RMUZC77xgyYoy
         TVDA==
X-Gm-Message-State: AOJu0Ywg+Tl19jZMYU5/AONMNe11k8lceiIYuhCuTak+bBG0SQKCxG3V
	QX/fz21tasMZBffd9W+UV2JdnmwpSztPy/rgbrI=
X-Google-Smtp-Source: AGHT+IHgJsAHmHdUK0ubd/llvOkkkApOjEVY5ii1EKAzSFHN2jfBPCwNCSl+RLIImJ6ELw9mS8LLw5tb9XcVIjzratQ=
X-Received: by 2002:a05:6358:2806:b0:14c:79ec:1b86 with SMTP id
 k6-20020a056358280600b0014c79ec1b86mr7101127rwb.24.1696523102214; Thu, 05 Oct
 2023 09:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230927082918.197030-1-k.kahurani@gmail.com> <20231004114758.44944e5d@kernel.org>
 <CAAZOf27_Cy8jaJBnjKV7YgyaKO2WohYrxcftV5BdOdm66g_Apw@mail.gmail.com> <20231005090328.73e87e71@kernel.org>
In-Reply-To: <20231005090328.73e87e71@kernel.org>
From: David Kahurani <k.kahurani@gmail.com>
Date: Thu, 5 Oct 2023 19:24:50 +0300
Message-ID: <CAAZOf25k-c_C3sYz_0zwnc4k5Yf66=LZUSmnwusomZx_CJt1rw@mail.gmail.com>
Subject: Re: [PATCH] net/xen-netback: Break build if netback slots > max_skbs
 + 1
To: Jakub Kicinski <kuba@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, 
	wei.liu@kernel.org, paul@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 7:03=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 5 Oct 2023 18:39:51 +0300 David Kahurani wrote:
> > > MAX_SKB_FRAGS can now be set via Kconfig, this allows us to create
> > > larger super-packets. Can XEN_NETBK_LEGACY_SLOTS_MAX be made relative
> > > to MAX_SKB_FRAGS, or does the number have to match between guest and
> > > host?
> >
> > Historically, netback driver allows for a maximum of 18 fragments.
> > With recent changes, it also relies on the assumption that the
> > difference between MAX_SKB_FRAGS and XEN_NETBK_LEGACY_SLOTS_MAX is one
> > and MAX_SKB_FRAGS is the lesser value.
> >
> > Now, look at Ubuntu kernel for instance( a change has been made and,
> > presumably, with good reason so we have reason to assume that the
> > change will persist in future releases).
> >
> > /* To allow 64K frame to be packed as single skb without frag_list we
> >  * require 64K/PAGE_SIZE pages plus 1 additional page to allow for
> >  * buffers which do not start on a page boundary.
> >  *
> >  * Since GRO uses frags we allocate at least 16 regardless of page
> >  * size.
> >  */
> > #if (65536/PAGE_SIZE + 1) < 16
> > #define MAX_SKB_FRAGS 16UL
> > #else
> > #define MAX_SKB_FRAGS (65536/PAGE_SIZE + 1)
> > #endif
> >
> > So, MAX_SKB_FRAGS can sometimes be 16. This is exactly what we're
> > trying to avoid with this patch. I host running with this change is
> > vulnerable to attack by the guest(though, this will only happen when
> > PAGE_SIZE > 4096).
>
> My bad, you're protecting from the inverse condition than I thought.
>
> But to be clear the code you're quoting (the defines for MAX_SKB_FRAGS)
> are what has been there upstream forever until 3948b059 was merged.
> Not 100% sure why 3948b059 switched the min from 16 to 17, I think it
> was just to keep consistency between builds.

Okay, now that might change everything because the patch was made with
the assumption that Ubuntu(and probably others) have code modifying
the default values for MAX_SKB_FRAGS. If this was upstream, then,
maybe when the time comes they will grab 3948b059. I consider this
solved at this point :-)

>
> If this change gets backported to 6.1 stable it will break ppc build
> of stable, right? Since ppc has 64k pages.

