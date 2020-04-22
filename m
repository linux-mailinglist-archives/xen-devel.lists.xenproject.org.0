Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD41B4920
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 17:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRHdo-000135-DS; Wed, 22 Apr 2020 15:50:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcMM=6G=gmail.com=jaromir.dolecek@srs-us1.protection.inumbo.net>)
 id 1jRHdn-00012s-5U
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 15:50:23 +0000
X-Inumbo-ID: f9a13860-84b0-11ea-83d8-bc764e2007e4
Received: from mail-ua1-x942.google.com (unknown [2607:f8b0:4864:20::942])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9a13860-84b0-11ea-83d8-bc764e2007e4;
 Wed, 22 Apr 2020 15:50:22 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id t8so2148248uap.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QFk2ifqjLHyPsKZvVEBsxNJMQtRHXXI1/TtMaXlRdEk=;
 b=igUk2GatzQjNtX9WrSaxy6Efi0j7gTyUAaV0zPpDpXfSjtWmk1lmfsgbNd6/L5AhFl
 JGjtTXGluFc9Jb8vR6jWT0Mo4LX0CL0MSv1WB/IS7CANi74GGNqLBD4zytVC/ybmXIiK
 9a8sJGSOU/1Q8cOipysM3OJIVMGrthMymKsCkRb7VxjQ/4pmwgfhB03OKH3gb0t+vOEe
 67JGtfthTqR3djkYAXWleXJ9JX51LLGIfztsVhAc2LU+tJomll3R6Bopi7MVfhh7biGr
 0yGF5ZjTkhKIT7/vC+sA9Gtg1ulfO3lF4PHEzR9hzDq7mYwyxgt9nasFRf/clI6FmnbY
 zQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QFk2ifqjLHyPsKZvVEBsxNJMQtRHXXI1/TtMaXlRdEk=;
 b=CCBEfkAhih/yeUaJ4wJnpkdt7nnujoG0CYWnwMNChy76vVJ5Y8MmXStGhSPdToYlww
 VpOkzf1t+FPnZLJCoeUPlGuqWejbiObpsfLLRJ2FxcI+kx5I+lUazDT53RnWi5ylk3bg
 XXBRJE73lC3p1BOCWyu5K1BwKcpYsc2AYFAt6cebtsznVicBpan8jxx2vilrclmY07kZ
 w1EcRdIi55dIdmr3s1xAbiEmXrUWS4lpcf4tnTyFe6rrrDkT+La9FVC6YIF0XRJ6fhOu
 ecUWGRBVWH2OBVtmdioCSeXKwmB64kUoGLMk36Sa5o0W6uX9rKZZk3L9HNjHMP42SvJ6
 f/nQ==
X-Gm-Message-State: AGi0PuYKvDThmdPj6B6uFsnWawht3AzWqAA/O353Ql3pzB6etPxWWs2g
 Wm/wljqkBtdBt/qtZZHRQXXytkfq3UJtArk8Jg0=
X-Google-Smtp-Source: APiQypIDHngdHx4llhSmDfU0ASqIe6gGP3hn4zaxN8GHQOaexMpuvavfn30wc+pGUDjiNBVz4EF0siZeQ9Yw8LmWW50=
X-Received: by 2002:a67:3343:: with SMTP id z64mr20120128vsz.108.1587570622254; 
 Wed, 22 Apr 2020 08:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAMnsW57Kn05TyDiVmZLaiYBdVZwy_7LazvLvR_AG0KHEYJ-z0Q@mail.gmail.com>
 <a8245dcc-cb91-f3d2-f0a2-135efd137370@citrix.com>
In-Reply-To: <a8245dcc-cb91-f3d2-f0a2-135efd137370@citrix.com>
From: =?UTF-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>
Date: Wed, 22 Apr 2020 17:50:11 +0200
Message-ID: <CAMnsW57SVfdLQSZaLWwdgYikQZuaSUSX2-YJZtv31bDJpemETA@mail.gmail.com>
Subject: Re: grant_table_op v2 support for HVM?
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Le lun. 20 avr. 2020 =C3=A0 22:56, Andrew Cooper
<andrew.cooper3@citrix.com> a =C3=A9crit :
> Really?  The status handling is certainly different, but v2 is much
> harder to use correctly.

In which sense?

From granter standpoint it seems to be just checking the status on
different place. Of course you can't atomically check the flags and
status any more, but with cooperating grantees that shouldn't be
problem - once grantee indicates it's done with the grant and unmaps
the pages, it doesn't map it again. Even e.g. Linux xbdback with
feature-persistent just keeps it mapped until it decides to g/c it.

Actually connected to this - am I correct to assume that for small
requests (say under 1500 bytes), it's faster to do just a memory copy
using the grant than it is to map+unmap the granted page into grantee
memory space, due to cost of TLB flushes on the grantee side?

> You want add_to_physmap(), requesting XENMAPSPACE_grant_table and or-ing
> XENMAPIDX_grant_table_status into the index.  (Because a new
> XENMAPSPACE_grant_status apparently wasn't the most logical way to
> extend the existing interface.)

This works indeed, so NetBSD can use v2 for both PV and HVM, thank you!

Interestingly, Linux kernel doesn't seem to use
XENMAPIDX_grant_table_status anywhere, I found only the standard setup
using the get_status_frames hypercall. How is HVM case handled in
Linux, is it just using v1?

I have another unrelated question, for MSI/MSI-X support in Dom0.

Is it necessary to do anything special to use properly the pirq/gsi
returned by physdev_op PHYSDEVOP_map_pirq?
After the map call for MSI interrupts (which succeeds), I execute only
the regular PHYSDEVOP_alloc_irq_vector for it, but interrupts don't
seem to be delivered right now under Dom0 (works native).

Of course this is likely to be a bugs in my code somewhere, I'd just
like to rule out that nothing else is necessary on Xen side.

Jaromir

