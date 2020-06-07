Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F21F1207
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 06:18:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ji9EC-0007Lb-3d; Mon, 08 Jun 2020 04:17:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kurx=7U=kota.moe=nospam@srs-us1.protection.inumbo.net>)
 id 1ji3e7-0007UL-C4
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2020 22:20:03 +0000
X-Inumbo-ID: 03dfadb8-a90d-11ea-9ad7-bc764e2007e4
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03dfadb8-a90d-11ea-9ad7-bc764e2007e4;
 Sun, 07 Jun 2020 22:19:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h5so15399800wrc.7
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jun 2020 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kota.moe; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=hHTcj8gSt6bxo+wzkFqQn+lRFDX6IJOKi1kquEIyOXg=;
 b=ZQoEra6W7sClkWwJgTCdiRPvR7xafHFijYaK8YZIrEoiA1MKKJhAVmMEF1bRfB6NdK
 es2dI/jnuzSFWuGHlccnJMHJxC9vwZYw4KS+eXKnNHQR656ujHqVCT8sIdJW/5R105bl
 O2+ZOMjAVEI2+82yMVmeUCjb0gav34oW9Rf8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hHTcj8gSt6bxo+wzkFqQn+lRFDX6IJOKi1kquEIyOXg=;
 b=MlZ6VTfxoyiSLHpgxZ4vXKknMp7WJaD8+hiLQ2WAdtxkohzzD+bhsV2GJRkWRCL/t5
 N0dWOclTRt2GquJoEMrPqGgjrewcY64xVXpt5b2rqcMn66hgTGeB8yQF6vGtO1cRtCoJ
 /f/gCH+jFitevMwDbo3CP7Ff6OcVVy3tkO1Q812ImoLs82k7YLqwbS52AfgGhapmEh2R
 jtsYwl6mYpl4vILmNSLdToQez87qf4XHz2L68692gSjUH/fof9zE7AHbC15fXA83zcT0
 RWD0QK5vhtoirEtLyfgEbHNGGUN6dOKiUyoSX0O5dNLTDq069VqLsy0QkbCwoFp26s/1
 B05g==
X-Gm-Message-State: AOAM531TIknbQIsqhLz2UTmmx1Z9eG/QSa8jy2LaXjEy19rmWDf6GolN
 g1NhGwfIUpVUKNrKbtYayc+QkD4J2qIm9e8/eGX9kUOexr8evg==
X-Google-Smtp-Source: ABdhPJwkxN2jO1yq14hOBGp80GZBc8UHJepFI0SRm9rQ15NZAFnGvKy/wRqdSIwVRyjwDfFJf4wIs9yXZdygUqRBuB8=
X-Received: by 2002:adf:ef83:: with SMTP id d3mr19306229wro.145.1591568394428; 
 Sun, 07 Jun 2020 15:19:54 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?4oCN5bCP5aSq?= <nospam@kota.moe>
Date: Mon, 8 Jun 2020 08:19:18 +1000
Message-ID: <CACsxjPY6Zhau786kB8N0f+ejgT7VQ+MFFZOcayjmqt_ecOjuVg@mail.gmail.com>
Subject: xenforeignmemory fails to map PCI device memory with "Invalid
 Argument" error
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 08 Jun 2020 04:17:37 +0000
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

Hi xen-devel,

I'm trying to read HVM guest PCI memory from Dom0 using the xenforeignmemory
library, but it's consistently failing with "Invalid Argument", no matter
which PCI device I try.
However, if I try to map in regular (non-device) memory, it seems to work fine.

Do you know why I can't seem to map in guest PCI memory? Am I meant to be
mapping in the memory in some other way instead?

(Background: I'm trying to port Looking Glass to Xen:
https://forum.level1techs.com/t/looking-glass-on-xen/158089)

Some example code to demonstrate the problem:

    #include <stdint.h>
    #include <stdio.h>
    #include <sys/mman.h>
    #include <unistd.h>
    #include <xenforeignmemory.h>

    void map(xenforeignmemory_handle* xfm, uint32_t dom, uintptr_t addr) {
        xen_pfn_t frame = addr / sysconf(_SC_PAGESIZE);
        void* out = xenforeignmemory_map(xfm, dom, PROT_READ |
PROT_WRITE, 1, &frame, NULL);
        if (!out) {
            printf("Failed to map Dom%u's 0x%08lx: %m\n", dom, addr);
            return;
        }

        printf("Dom%u 0x%08lx: 0x%08lx 0x%08lx 0x%08lx 0x%08lx\n",
            dom, addr,
            ((unsigned long*)out)[0],
            ((unsigned long*)out)[1],
            ((unsigned long*)out)[2],
            ((unsigned long*)out)[3]
        );
        xenforeignmemory_unmap(xfm, out, 1);
    }

    int main(void) {
        xenforeignmemory_handle* xfm = xenforeignmemory_open(NULL, 0);
        if (!xfm) {
            perror("xenforeignmemory_open");
            return 1;
        }

        // Regular memory - works fine
        map(xfm, 3, 0x10000000);

        // PCI device memory - errors with "Invalid Argument"
        map(xfm, 3, 0xf2311000);

        xenforeignmemory_close(xfm);
        return 0;
    }

In this case, Dom 3's 0xf2311000 belongs to the emulated SATA device:

    $ sudo xl qemu-monitor-command 3 'info pci'
    ...snip...
      Bus  0, device   5, function 0:
        SATA controller: PCI device 8086:2922
          PCI subsystem 1af4:1100
          IRQ 0.
          BAR4: I/O at 0xc260 [0xc27f].
          BAR5: 32 bit memory at 0xf2311000 [0xf2311fff].
          id "ahci0"
    ...snip...

