Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F13EA67B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 16:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166456.303791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbR-0002Ry-Ks; Thu, 12 Aug 2021 14:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166456.303791; Thu, 12 Aug 2021 14:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEBbR-0002Q8-Hk; Thu, 12 Aug 2021 14:22:37 +0000
Received: by outflank-mailman (input) for mailman id 166456;
 Thu, 12 Aug 2021 14:22:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tERp=ND=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1mEBbQ-0002Q2-10
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 14:22:36 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9471ba9-25a8-4c68-b704-9c1c40272e21;
 Thu, 12 Aug 2021 14:22:34 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z20so13830068lfd.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 07:22:34 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-213-80.b024.la.net.ua.
 [176.36.213.80])
 by smtp.gmail.com with ESMTPSA id s16sm329678ljj.48.2021.08.12.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:22:31 -0700 (PDT)
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
X-Inumbo-ID: b9471ba9-25a8-4c68-b704-9c1c40272e21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nTkbFC6VPgkXI+Td1poqg1KtjwvUzhEe3OsoddMAzY=;
        b=BpIJkeUxQlTpymrA8Ji3pS5j71Be13pmrSvMSSoHnFjKAN9a/kMl06n2MusdQQ/Uuh
         ElpydyABMe8SxQRt8V2aAbAVxJSsZIfttngO7UVDflCQ4fNNWOgMfMsrUcvdXoeRI23z
         GqUzZ2vsbaZPuDNhjEN8VNokT82rgtTo9bpF/FdL9pAqOpCWDWfMPhedcGBsI+xufdPE
         ErMRrimhbXBDjh/dn/Ps6qpOFLQg22PGUZ2Lx9oAy+yzLSl8sB9DRt48Fy3z+f2GC2+3
         jZCzvklY+w9dVP8AZI7H3KAme4bmZdOLOsrx1MvhZciZLxHPaWllMG9onMzY7xaR5ydH
         ifkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nTkbFC6VPgkXI+Td1poqg1KtjwvUzhEe3OsoddMAzY=;
        b=IyNLdEKeI2KJblpSqjGmxtJq3DCa63SVPZHmda4347N5f/ukobIafNVawhH/ffIVeb
         +bdt5Ek0Qr1nK0hc1dr8PQ2r/vjNQEuOxP7TXlg+6d8uXsMXd+Mh3SC+aMl7bT3gFJBB
         dokEDwYXpehhPxJPREKkWuWrwQeF66fKYITaIpFnQYh3kOEm7WSl4IrlrCqQTufVZbk8
         kbmhPGQoFm35Aa6nnwRy6sraPtmK5fWkslixzE2oXPMfzLiWwgwe7VDnYK6qTN8YLA6v
         FB9xYC0wAlJUpsO+aOVZif1VvJlBax1G2xkasIN5X80QnOLVFyA/KhC9m/XXAN3DZFyg
         4Fgw==
X-Gm-Message-State: AOAM531B1W9PPtbItJi85FHDngQQu1LRrZlVUwIL+Ay0s3Bgvnd2mySB
	AHIyazNu+//X6GL7j+Z9FdvTR1KyrTGRbw==
X-Google-Smtp-Source: ABdhPJwbyQOtyTaf17yHanepFukJRlB84Q+/57rn4oN5onVZJyTm8Y0Ryy9EDW/+riLXgk1QfUO9fA==
X-Received: by 2002:a19:4349:: with SMTP id m9mr2730964lfj.404.1628778152116;
        Thu, 12 Aug 2021 07:22:32 -0700 (PDT)
From: Anastasiia Lukianenko <vicooodin@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com,
	artem_mygaiev@epam.com,
	rahul.singh@arm.com,
	bertrand.marquis@arm.com,
	oleksandr_andrushchenko@epam.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	andr2000@gmail.com,
	vicooodin@gmail.com,
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: [PATCH 0/9] Add xl PCI daemon (server for libxl PCI) 
Date: Thu, 12 Aug 2021 17:22:21 +0300
Message-Id: <20210812142230.19353-1-vicooodin@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

This work introduces xl PCI daemon that acts as a server for the client
in the libxl PCI. The toolstack in Dom0 accesses sysfs to get information
about PCI devices and in case of Hardware Domain that sysfs lives in
Hardware Domain, so Dom0 can't read that information directly anymore.
For that reason we introduce a "proxy" which directs requests from Dom0 to
the domain which owns PCI devices, being it Dom0 itself or any other domain,
e.g. Hardware Domain. xl PCI daemon is based on vchan-node2 tool and uses
the libxenvchan library for messaging transport.

It was verified that this model works both remotely (in different domains)
and locally (within one domain) as requested by Xen community [1]. The
server processes the requests that come from the client. For better
interoperability between guest OSes, e.g. Linux vs FreeBSD, the path in the
request is not a direct sysfs entry as seen in Dom0, but instead it is a
key-word defined in the protocol. For now libxl PCI refers to sysfs in the
following functions, therefore such a subset was implemented in xl PCI
daemon commands handling:
* ‘ls’ - the server receives "dir_id" as a parameter. Xl pcid server
  transmits information about devices assigned to the PCI driver by sending
  a reply with the remote directory listing. Client cannot pass the sysfs
  path, as it is not the same on different operating systems. Therefore,
  for example, we pass parameter "pciback_driver" and on the server side
  we refer to "/sys/bus/pci/drivers/pciback" if Linux is used);
* ‘write’- the server receives the file name and value as parameters where
  and what to write;
* ‘read_hex’ - xl PCI daemon returns hex value read from the given path;
* ‘exists’ - check if path exists;
* ‘read_resources’ - returns an array of PCI device resources (start, end,
   flags) read from given path;
* ‘unbind’ - unbinds PCI device;
* ‘reset’ - resets PCI device.

Requests and responses are formed in the form of a json which is already
used by libxenlight (xl). The commands are aimed at preventing the libxl
PCI from reading / writing from / to the local sysfs directly. To do this,
the libxl PCI itself was changed, vchan and pcid support was added to
libxl - instead of working with the read and write functions from / to the
sysfs, functionality was added to send requests to the server, then receive
and process the response.

Libxl vchan is used as transport between libxl and the server side. Libxl
vchan adds support for JSON messages processing. Libxl pcid functions allow
to process the received message from PCI server and to generate a reply in
JSON format for the client. The pcid functions in the libxl allow the use
of internal libxl structures and functions, so there is no code duplications
on server side.

The issue of simultaneous access of several processes to the channel is not
resolved as well. For example, the commands “xl pci-assignable-list” and
“xl pci-assignable-add” will be sent at the same time. Due to the fact that
there is only one channel, the processing of two requests will cause
undefined behavior on the server side. In the future, it is necessary to
take into account cases when from different domains there can be several
requests from a client at the same time or from the same but xl commands are
executed concurrently.

[1] - https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg84452.html

Regards,
Anastasiia

Anastasiia Lukianenko (9):
  tools/libs/light: Add vchan support to libxl
  tools/libs/light: Add functions for handling PCI messages in JSON
    format
  tools/xl: Add pcid daemon to xl
  tools/libs/light: Add "ls" command processing to xl pcid daemon and
    libxl PCI
  tools/libs/light: Add "write" command to xl pcid and libxl PCI
  tools/libs/light: Add "read" command to xl pcid and libxl PCI
  tools/libs/light: Make Libxl PCI get values from xl pcid instead of
    libxl side
  tools/libs/light: Add "unbind" and "read resources" commands to libxl
    PCI and xl pcid
  tools/libs/light: Add "reset" and "remove" PCI dev commands to xl pcid
    daemon and libxl PCI

 tools/configure                           |   5 +-
 tools/helpers/Makefile                    |   4 +-
 tools/hotplug/FreeBSD/rc.d/xlpcid.in      |  75 +++
 tools/hotplug/Linux/init.d/xlpcid.in      |  76 +++
 tools/hotplug/NetBSD/rc.d/xlpcid.in       |  75 +++
 tools/include/pcid.h                      |  73 +++
 tools/libs/light/Makefile                 |   8 +-
 tools/libs/light/libxl_pci.c              | 566 ++++++++++++++--------
 tools/libs/light/libxl_pcid.c             | 527 ++++++++++++++++++++
 tools/libs/light/libxl_types.idl          |   1 +
 tools/libs/light/libxl_types_internal.idl |   6 +
 tools/libs/light/libxl_vchan.c            | 359 ++++++++++++++
 tools/libs/light/libxl_vchan.h            |  81 ++++
 tools/xl/Makefile                         |   5 +-
 tools/xl/xl.h                             |   1 +
 tools/xl/xl_cmdtable.c                    |   7 +
 tools/xl/xl_pcid.c                        |  79 +++
 17 files changed, 1727 insertions(+), 221 deletions(-)
 create mode 100644 tools/hotplug/FreeBSD/rc.d/xlpcid.in
 create mode 100644 tools/hotplug/Linux/init.d/xlpcid.in
 create mode 100644 tools/hotplug/NetBSD/rc.d/xlpcid.in
 create mode 100644 tools/include/pcid.h
 create mode 100644 tools/libs/light/libxl_pcid.c
 create mode 100644 tools/libs/light/libxl_vchan.c
 create mode 100644 tools/libs/light/libxl_vchan.h
 create mode 100644 tools/xl/xl_pcid.c

-- 
2.17.1


