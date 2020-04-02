Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A119C166
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 14:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJzC8-00050W-9M; Thu, 02 Apr 2020 12:43:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6xHX=5S=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1jJzC7-00050R-4G
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 12:43:39 +0000
X-Inumbo-ID: 92d6f196-74df-11ea-9e09-bc764e2007e4
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92d6f196-74df-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 12:43:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t7so3979140wrw.12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Uuthd54xjku6K8Q2Q227K08pkabnP+VFCySgM4kEalQ=;
 b=Td9C5U/hACTCraH7iI7bHObT0Q0XdPVxUmpGRfoPWZDNo5smj0JsMbOfEhtNVrZuc7
 HF/E/pXtp2MAVA0F3rJ+NWWww4wbhCUOxwzM7c1rKuezzu4xcIjD0FBFoB9zcHtvQ6CR
 QhVo0IvaJabfT4uVK8g2uZr5FDaf1N4iNebO7+rUt67kZrODQaScyLkjXVyNA9ZEuD4O
 F2CKLVe85KIGy5N1RHr7bDfNs8WC+0bjWzRJ7eJ5voxFhqu4OAmwLKh+D9PScjamVw7Q
 YfeJiixq4OHw5r1i1Xqx10+z1G+g4w9mc4eoRloS9xAQ7g2W29dIlcr0Efj7JuKmq17b
 8ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Uuthd54xjku6K8Q2Q227K08pkabnP+VFCySgM4kEalQ=;
 b=mw9DDAgTeXCZ4vgRNqQkTqL1nXGl79Md0BQDGkNMYROEJgPeVgR0ffUSjX7GO+cLnb
 nz8wd5VS57G6yriFHNhP/mq4wtAoyap3cZCf4+4Wk1PlzIpTw9rrHmDKaF2JQTbLmek3
 +AVDmIy4geYjRrOm+qNWApLnEwkNsHZgs1TNMhkE0vhbqhxjqBT7n6mIwHQ3Imi2Z30b
 vSIFm12mh8a9STkQtMmvBbXt/msvjTofQpnrz2wmo8/sO+8ZGUXaCgkfRgK8p0NqBleF
 mSyKSgF4bDykML6wCDP2MByb5uPcEyBuzG02loq72GmTNJYTnSp3S6JVTkT/MLvnqD00
 Rphg==
X-Gm-Message-State: AGi0Pubw+lYAr+tYXc5g4ORNyf8gWe5tMdoAuw5D0v3S22/1hkZFWdMX
 bZb/VFYWr946poe4+JF+hicSMi5YuL81CC8FLuQVWGEKJ+Q=
X-Google-Smtp-Source: APiQypLv6jG95UiKFCi60x4POV7E6+Rc2abv5tHdXKjRaz1GVm80lX8RVPEu+A1evt5pVhx19MJnF4foUTTbdRrylsY=
X-Received: by 2002:adf:a2d8:: with SMTP id t24mr3334511wra.366.1585831417250; 
 Thu, 02 Apr 2020 05:43:37 -0700 (PDT)
MIME-Version: 1.0
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Thu, 2 Apr 2020 20:43:26 +0800
Message-ID: <CABwOO=doPdSR1PUPLU-X2R6akDGRgBoqMv_wK_sPpkh9jF6kCQ@mail.gmail.com>
Subject: 4.13: import xen.lowlevel.xc fails with SystemError: bad call flags
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Hello again,

despite having built a Xen 4.13 with just Python3 on a
Linux From Scratch system,

  http://youvegotbuckleys.org.nz/LFS/LFS-BOOK.html

specifically

 http://youvegotbuckleys.org.nz/LFS/LFS-BOOK.html#ch-xen


and booted into the Dom0 (Linux 5.5.3, GCC 9.2.0, Python 3.8.1)
without issue, in coming to boot up a DomU, I get the following
terse message


~ # cat /var/log/xen/bootloader.3.log
Traceback (most recent call last):
  File "/usr/lib/xen/bin/pygrub", line 21, in <module>
    import xen.lowlevel.xc
SystemError: bad call flags
~ #

in the wake of these messages during the xl cretate's  pygrub boot:


libxl: error: libxl_bootloader.c:648:bootloader_finished: Domain
3:bootloader failed - consult logfile /var/log/xen/bootloader.3.log
libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus:
bootloader [766] exited with error status 1
libxl: error: libxl_create.c:1420:domcreate_rebuild_done: Domain
3:cannot (re-)build domain: -3
libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain
3:Non-existant domain
libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain
3:Unable to destroy guest
libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain
3:Destruction of domain failed
libxl: error: libxl_dom.c:40:libxl__domain_type: unable to get domain
type for domid=3
xl: unable to exec console client: No such file or directory
libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus: console
child [767] exited with error status 1


There's a suggestion out on the interweb thing that these

  SystemError: bad call flags

are something to do with Python 3.8, as in this thread I found
when searching for the above:

-------
It's a bug in the Python binding of libcomps. I proposed a fix upstream:
https://github.com/rpm-software-management/libcomps/pull/50

Extract:

> In Python 3.7, import didn't check descriptor flags (METH_KEYWORDS):
> these flags were only checked when the methods were called.
>
> In Python 3.8, the flags are checked at soon as the module is imported,
> which prevents the module to be imported.
-------

Is that likely to be what i am seeing?

I had a gander at

tools/python/xen/lowlevel/xc/xc.c

tools/python/xen/lowlevel/xs/xc.c

but it's not obvious to me where, presumably in,

#if PY_MAJOR_VERSION >= 3
#define INITERROR return NULL
PyMODINIT_FUNC PyInit_xc(void)
#else
#define INITERROR return
PyMODINIT_FUNC initxc(void)
#endif
{

I could start to "play around" with any "descriptor flags"


Any pointers welcome, including "it's not a Python 3.8 thing,
you idiot" responses,
Kevin

