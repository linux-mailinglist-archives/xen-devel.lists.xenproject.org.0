Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC85B3CBC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 18:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404478.646965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWgc3-0002Mo-Lw; Fri, 09 Sep 2022 16:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404478.646965; Fri, 09 Sep 2022 16:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWgc3-0002Ka-JO; Fri, 09 Sep 2022 16:12:15 +0000
Received: by outflank-mailman (input) for mailman id 404478;
 Fri, 09 Sep 2022 16:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bvbb=ZM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oWgc1-0002KU-KP
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 16:12:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2964e486-305a-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 18:12:12 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id lz22so5140782ejb.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Sep 2022 09:12:12 -0700 (PDT)
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
X-Inumbo-ID: 2964e486-305a-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=inLoVTMssB90QGkHyUI1/5M5trM6CuJ62qAp4R+UoAE=;
        b=gkVdNEgU9IvgnIaAbBukptVTVEpbQWYKTCon4II4JtO8TPfLLBVMYXlW5y2Jem76ts
         7KY8YoQwTt1Y2wawuTmyvlTxz8+6+07tx7br89VXHKylxkJRSMWhFic7gxnEMderjCpa
         8CQfHEqfODRNQReIZAT0plDHXOxWgO86ixeq/jXJd/xzOfCl/fJPsQsDAa0yKEcNWGNy
         0bDRZYyH8+iDiqEIgQr0ezQXTInTYTq6FGMglhqtq3hDzFsxfeYwv3xdAr07t1NKtHBM
         5Y1y5VD8ADbEHK+U1n/51PvFX445VfjDzQ6zI9KCWKZiycN9aT0a4lCCk84TD+HtUFgd
         gz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=inLoVTMssB90QGkHyUI1/5M5trM6CuJ62qAp4R+UoAE=;
        b=PHPOLd4UEW63h+Z4kQWgPLJj6RB1CF8Qs77I8Ehf7dRHReHNQIX0yh+lQbzF6l7b0i
         lqY0PwvJ2gCYwh5Q7BNAkPOBJpiAdJN+N86bFT982q2QnKwt6+pG1WTeBaV1O/R52QL0
         OiUw/vTy8GkYX42vdbiOThiNFfNttX1MaFInz6O7QW3EzlU08UZ3X+LugyoD2lAYs4oM
         NRM8HgIMF19W78OzEMjQfKCnSLl5L5IEVIkJMduJ+2OxJftQxebypP8yB++2UqCZi2yt
         HVDJU9TM0OcgS3eFGFgafLJFd/XumpvS4xAr2joSFzdcQffxIHWcSmuMlyk+nZtYXGX2
         Rkow==
X-Gm-Message-State: ACgBeo1TGCKNqmdhQ0I5Jlu/SCYp07AP3zV3baCriFQrxBMGLhm2Rh7k
	VmE90zmTaLwPneLY8UB94D9XNn5qmMaXBak5ZJ8jOO1b
X-Google-Smtp-Source: AA6agR7XG2Qi9H6tVfnbOSGsaPIrxoxKLOxrcmTLAQBzoVC0APjazAzaOkXYRpnFUKVHnGO01mZBnOqwYojLP5gRUWI=
X-Received: by 2002:a17:907:94c2:b0:73d:c534:1ac0 with SMTP id
 dn2-20020a17090794c200b0073dc5341ac0mr10421418ejc.461.1662739931362; Fri, 09
 Sep 2022 09:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220909012546.21807-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220909012546.21807-1-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 9 Sep 2022 12:11:59 -0400
Message-ID: <CAKf6xpsXBOMDZ-2as48AfExN61RD3RkqhOm2ebK=LPr5nCY23Q@mail.gmail.com>
Subject: Re: [PATCH v13] xsm/flask: correcting initial sid assignment on
 context allocation
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 9:26 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> The current flow for initial SID assignment is that the function
> flask_domain_alloc_security() allocates the security context and assigns an
> initial SID based on the limited state information it can access. Specifically
> the initial SID is determined by the domid of the domain, where it would assign
> the label for one of the domains the hypervisor constructed with the exception
> of initial domain (dom0). In the case of the initial domain and all other
> domains it would use the unlabeled_t SID.
>
> When it came to the SID for the initial domain, its assignment was managed by
> flask_domain_create() where it would be switched from unlabeled_t to dom0_t.
> This logic worked under the assumption that the first call to
> flask_domain_create() would be the hypervisor constructing the initial domain.
> After which it would be the toolstack constructing the domain, for which it is
> expected to provide an appropriate SID or else unlabeled_t would be used.
>
> The issue is that the assumptions upon which the current flow is built were
> weak and are invalid for PV shim and dom0less. Under the current flow even
> though the initial domain for PV shim is not set as privileged, flask would
> label the domain as dom0_t. For dom0less, the situation is two-fold. First is
> that every domain after the first domain creation will fail as they will be
> labeled as unlabeled_t. The second is that if the dom0less configuration does
> not include a "dom0", the first domain created would be labeled as dom0_t.
>
> This commit only seeks to address the situation for PV shim, by including a
> check for xenboot_t context in flask_domain_alloc_security() to determine if
> the domain is being constructed at system boot. Then a check for is_privilged
> and pv_shim is added to differentiate between a "dom0" initial domain and a PV
> shim initial domain.
>
> The logic for flask_domain_create() was altered to allow the incoming SID to
> override the initial label. This allows a domain builder, whether it is a
> toolstack, dom0less, or hyperlaunch, to provide the correct label for the
> domain at construction.
>
> The base policy was adjusted to allow the idle domain under the xenboot_t
> context the ability to construct domains of both types, dom0_t and domu_t.
> This will enable a hypervisor resident domain builder to construct domains
> beyond the initial domain,
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

