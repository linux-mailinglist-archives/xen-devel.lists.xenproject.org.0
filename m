Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A3293D52
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 15:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9621.25244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUrg7-0004Xo-NT; Tue, 20 Oct 2020 13:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9621.25244; Tue, 20 Oct 2020 13:27:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUrg7-0004XP-KS; Tue, 20 Oct 2020 13:27:51 +0000
Received: by outflank-mailman (input) for mailman id 9621;
 Tue, 20 Oct 2020 13:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGPc=D3=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kUrg7-0004XK-4B
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:27:51 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b7ca60b-e471-4536-b1ad-14e0fdbc4209;
 Tue, 20 Oct 2020 13:27:50 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a28so1997542ljn.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 06:27:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eGPc=D3=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kUrg7-0004XK-4B
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:27:51 +0000
X-Inumbo-ID: 0b7ca60b-e471-4536-b1ad-14e0fdbc4209
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0b7ca60b-e471-4536-b1ad-14e0fdbc4209;
	Tue, 20 Oct 2020 13:27:50 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a28so1997542ljn.3
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MVMEMru1q0EklwVF80mRcema72Gntri3WkELhwCXdrw=;
        b=TvEiGXj8b3VZh2T831h/P3cov6WviKazZKIaNzZeTGfr3b1gK4RbYNl4CmEQe7RXdA
         /QoWLo/XzlZ3kmBmSYHZVlnIhcC2suqqPrZC/7zhlg9Optjxincujl9Jyu8Hnz6oZufG
         FNVoVq2smATOilvfsJHs5WkUSGfeKeX7WNukeZRCQK4QgVui49h3D5NdcTg4wGfFqKEU
         BINE5w24tgDH/+hsObg/6n6jUeGyR38j1ZXz8nzZYiEC5MJRfYb4XDhrAuWvBq1Q/Q4R
         CUDfAXA47nWeKqrYcjgNrSgDm1Ts0JwzehhLIuL0uLE88lKofW+x3ErvWhojwzYi+GlS
         K8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVMEMru1q0EklwVF80mRcema72Gntri3WkELhwCXdrw=;
        b=TSHD+SVOa+whYK8G77r1N2DxqDWaWRgN5/bXZpaxhN2Ez7uMaekoMG/2g8GAxeWJLl
         9yMV9rIkcQzfA12hmlHIqMQ47FbYR4DjBCr8iuPTrR0cTaDUebVojkURaKlydvRn3npa
         r2gU3DPnE9KV7mRy4GELSlabOuUjElOHCn9IVrmCxFxdchjqFeuoAv/vrrbpd3SDhGD8
         F4Bl1a1iWpaytsHAhaPYGVHYOwj9KJVotNPEgLzeqz2ovxQBPXPVKflJ1seuRYHdMnFX
         PyffHtb9wXkqErXyzZ0RaX3ld9ZPL6S2I9YyGTBGXIsGdPokj2f5zhLQmZ+0iyziogvP
         AGgA==
X-Gm-Message-State: AOAM530ff5nbAihYUqZjGjNWs71hzSl7KG0GXLJotNI4QzTjJMAr2l5w
	NPmrQUenNgxuqmajuMjI6kpdMJCZfQEz1csWZzk=
X-Google-Smtp-Source: ABdhPJzfXcQtq0+uZSasJjPZLRzaeLpS+AdAhSMuNN7eN2MPXJ/JNiQcxbHTvaaXZhBxKGdfOSG4SG6euJbx3FiFXKg=
X-Received: by 2002:a2e:c49:: with SMTP id o9mr1141731ljd.296.1603200469168;
 Tue, 20 Oct 2020 06:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200525025506.225959-1-jandryuk@gmail.com> <24269.8360.504075.118119@mariner.uk.xensource.com>
In-Reply-To: <24269.8360.504075.118119@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 20 Oct 2020 09:27:36 -0400
Message-ID: <CAKf6xpuqTdSc-qnfHu=yyEo6V45QLiSP6j=XsgEudoO4ojFaJw@mail.gmail.com>
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 10:13 AM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Jason Andryuk writes ("[PATCH] SUPPORT: Add linux device model stubdom to Toolstack"):
> > Add qemu-xen linux device model stubdomain to the Toolstack section as a
> > Tech Preview.
>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Hi, this never got applied.  It should go to staging and 4.14.

Regards,
Jason

