Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020762252A3
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jul 2020 17:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxBeE-0004o4-08; Sun, 19 Jul 2020 15:54:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9sL=A6=gmail.com=jaromir.dolecek@srs-us1.protection.inumbo.net>)
 id 1jxBeC-0004nz-1U
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2020 15:54:40 +0000
X-Inumbo-ID: 272e4856-c9d8-11ea-bca7-bc764e2007e4
Received: from mail-vs1-xe2d.google.com (unknown [2607:f8b0:4864:20::e2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 272e4856-c9d8-11ea-bca7-bc764e2007e4;
 Sun, 19 Jul 2020 15:54:39 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id b77so7264412vsd.8
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2020 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xILTcvzTtUapDEiFu/hLuAqy10TR7gKRIOs8YhGb9wY=;
 b=PXHa+Flb6n8e5VdOfxjv1gjhittsD4+xpa7MjqP2iD0fWUzRgxohsTmDJ+OmA250tJ
 7BUihXG1CMVGSouXBys3gz1ILOLcjCbwKRNQCI+oxCrRqT5/Boj5S/GXXNwnDNfGtK2y
 UZRdA6FQM3nEA7bKW+5RiQqK9hL+OKS6GTzGWWEn+8dhD5L9phktXVMXTrAeoMv/f9V1
 CTVJINVhElgxuQV9sm33GRset2RvGppdrqNkIqbJMUxfkCRz2w5LDgVxxB55ag0ofTHL
 qJfVC/ric3vREa6pFA+TLI6TZNWmi1Oyud4wQR8dCY2jCIqmdPqtYpjvermhPQC1SWRh
 Gjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xILTcvzTtUapDEiFu/hLuAqy10TR7gKRIOs8YhGb9wY=;
 b=kw+E+caL3bDxrJypOnq0wg1nWpA99JvuCnTBigqJH6RQH6Kh2SLP1cnkN5ueLxT1T3
 RzWZXFRbYuNtSHM9cRoc/B2mcJPeley7mCXJgH1/KEyKJrAi4yAZJOG1KKsPdY5uOz9N
 rJ5x1jky6huLHFziyXc0h7QB7AUh4/aR48ptfA1C+irmbt4WM3vlQ+cES4sQYxJOM18+
 DjOQpAyYMzs1fKfbU/hTVsH0EIDrK+zE3dqS4YLsJzeIP64f/Iore6VH0ZEL8O76/y0S
 SKUAivDuMEr6htgzrm+5aIc5QM2NO7u8mgmGo/uXwLc0BqZ0iZa5/P7rp2Hu/ZnZvRTu
 3h8g==
X-Gm-Message-State: AOAM5316J2mTKYr0h9raHuoRDet8h6epREFFucZOKVOqoxxQIeN6FUZZ
 /0NOhKbjGScseboTyLfot9Zer5qQPeOtg38FyOqH02b9100=
X-Google-Smtp-Source: ABdhPJwjfNUih4z2lYQE6CEtAT2OsJfX2eQgo73kubtaAbz5VI1WugeMoci3SVrYoZVRdGX9uhl0hBKHkzSdpXw1scI=
X-Received: by 2002:a67:b641:: with SMTP id e1mr12519961vsm.19.1595174079148; 
 Sun, 19 Jul 2020 08:54:39 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>
Date: Sun, 19 Jul 2020 17:54:28 +0200
Message-ID: <CAMnsW5542gmBLpKBsW5pnm=2VXmaDVHzg=OXXvBdu1BsYLdDvQ@mail.gmail.com>
Subject: Advice for implementing MSI-X support on NetBSD Xen 4.11?
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

I've implemented support for using MSI under NetBSD Dom0 with 4.11.
This works well.

I have some trouble now with getting MSI-X work under Xen.
PHYSDEVOP_map_pirq hypercall succeeds just as well as for MSI, but
interrupts don't seem to get delivered.

MSI-X interrupts work with NetBSD for the same devices when booted
natively, without Xen.

Can you give me some advice on where to start looking to get this
working? Is there perhaps something special to be done within the PCI
subsystem to allow Xen to take over?

Thank you.

Jaromir

