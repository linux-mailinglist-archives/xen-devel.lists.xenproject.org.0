Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D129618F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 17:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10534.27998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVcLX-0006FU-Fn; Thu, 22 Oct 2020 15:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10534.27998; Thu, 22 Oct 2020 15:17:43 +0000
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
	id 1kVcLX-0006F5-Cc; Thu, 22 Oct 2020 15:17:43 +0000
Received: by outflank-mailman (input) for mailman id 10534;
 Thu, 22 Oct 2020 15:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DPUU=D5=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kVcLV-0006F0-9t
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 15:17:41 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 028d8250-ae10-472c-9432-f31a0e5ddf58;
 Thu, 22 Oct 2020 15:17:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d24so2332163ljg.10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2020 08:17:40 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DPUU=D5=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kVcLV-0006F0-9t
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 15:17:41 +0000
X-Inumbo-ID: 028d8250-ae10-472c-9432-f31a0e5ddf58
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 028d8250-ae10-472c-9432-f31a0e5ddf58;
	Thu, 22 Oct 2020 15:17:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d24so2332163ljg.10
        for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2020 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aytwR5IL9OS0QKf9b+p2KT2CU6QbBd6febiqArxDsfs=;
        b=o1F6tn88p06VknvNMv7p3t1B7lxIT2SpksabxDLA6YW1NknghJFih4Q/8LRdLGsXvm
         +AAURNpxNyA9F4esCWet0LRP00jLElfOYszZ/BpslWrEEVmDmOLYcHgzXdVYpKo3Ukr7
         sUVVaUuUnwGoScwwr6QzaQU456Mvr743poQ29MzGeo8ydnPATQluWMPUagKC8mF7aXkR
         9ACVkixvjrdrEKQqGZ4CuKzvwy5Zlxw1pcpVIpXazrdM0/VP5hP3rIB1JmPO87m0fK19
         shrqu1JFDDnBINUxOqEIdDSKLHDr7D8li6HdA1wLpVGzwkbxsL9JENLAxI1WZuVc16G8
         HM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aytwR5IL9OS0QKf9b+p2KT2CU6QbBd6febiqArxDsfs=;
        b=EG+OaQgENyPzyxA9RbivLKF3y++hQNzbr7lC9jygNhKAad4akWqw5T6pwd+tMnhPWx
         ZYdoy8jb4v+JTMx+eRI3mtSWpCNxhXKUs76Xkp7/CbTAPYH3tmT3Rrh9NWjkSy2W/ZdB
         9iKYi24a4GuZZ2ZpcA+FLHl54ibCTobsjR+lofQ08BEUalCphBV8tOhy/5n6W4H3Udp7
         Ne+oE7rERXpPaCEMqLceSruXgHzkuzS5SdZxSr6TpS0v0Sj3ryul/M5PNIErpFYDszYH
         ojTSetEdHviUodomWNafqPUF1DQnuA9SX2U2hgcVLhdXlSQpyKxTEMyLaLunaOWgwseE
         erRA==
X-Gm-Message-State: AOAM533tJxu0HeELbGPThA40nlDXtwEvFs+FNzdYv6m11zPTdDyB+1aE
	lIMgk2jQN/QLHpD1z0ICQ9nEWbrXmQSSEOrOW28=
X-Google-Smtp-Source: ABdhPJw0h2w2fU5fufpA8MMTD61ePZqo/Hxao/L0FiX3RbIRviCcHhHIA/vc7KyVeYNssrZwXiP9KmHAaf52SkQ7Kaw=
X-Received: by 2002:a2e:b0c7:: with SMTP id g7mr1123806ljl.433.1603379859164;
 Thu, 22 Oct 2020 08:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201013140511.5681-1-jandryuk@gmail.com> <ddb5c9c2-c206-28d6-2d9d-7954e7022c23@redhat.com>
In-Reply-To: <ddb5c9c2-c206-28d6-2d9d-7954e7022c23@redhat.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 22 Oct 2020 11:17:26 -0400
Message-ID: <CAKf6xpvpuG1jVdf3+heXzHFd_kc5kVHYdJgC+8iazFLciqOMZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add Xen CpusAccel
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>, 
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 1:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/10/20 16:05, Jason Andryuk wrote:
> > Xen was left behind when CpusAccel became mandatory and fails the assert
> > in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
> > Move the qtest cpu functions to a common location and reuse them for
> > Xen.
> >
> > v2:
> >   New patch "accel: Remove _WIN32 ifdef from qtest-cpus.c"
> >   Use accel/dummy-cpus.c for filename
> >   Put prototype in include/sysemu/cpus.h
> >
> > Jason Andryuk (3):
> >   accel: Remove _WIN32 ifdef from qtest-cpus.c
> >   accel: move qtest CpusAccel functions to a common location
> >   accel: Add xen CpusAccel using dummy-cpus
> >
> >  accel/{qtest/qtest-cpus.c => dummy-cpus.c} | 27 ++++------------------
> >  accel/meson.build                          |  8 +++++++
> >  accel/qtest/meson.build                    |  1 -
> >  accel/qtest/qtest-cpus.h                   | 17 --------------
> >  accel/qtest/qtest.c                        |  5 +++-
> >  accel/xen/xen-all.c                        |  8 +++++++
> >  include/sysemu/cpus.h                      |  3 +++
> >  7 files changed, 27 insertions(+), 42 deletions(-)
> >  rename accel/{qtest/qtest-cpus.c => dummy-cpus.c} (71%)
> >  delete mode 100644 accel/qtest/qtest-cpus.h
> >
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thank you, Paolo.  Also Anthony Acked and Claudio Reviewed patch 3.
How can we get this into the tree?

Regards,
Jason

