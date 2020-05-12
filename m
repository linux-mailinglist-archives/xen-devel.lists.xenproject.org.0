Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877EC1CFE5C
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 21:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYad9-0004Cl-BK; Tue, 12 May 2020 19:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfNj=62=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYad8-0004Cg-7F
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 19:31:54 +0000
X-Inumbo-ID: 3b740962-9487-11ea-9887-bc764e2007e4
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b740962-9487-11ea-9887-bc764e2007e4;
 Tue, 12 May 2020 19:31:53 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a21so15007323ljj.11
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7EpZ3W6+R10EcvysXCT5zhaMgB5ltwhnG0M6maYRBm8=;
 b=J3/AN0Xenf3hEXhDrPeakJgk+xIJCgMd1MjC4P2YFJ8ZoYZ2HQUC6RIdn3uxXlNJe0
 JEOQk42o7EAukz/Enp8pg6ZhSzUM+IST3AKrKy6bFDHokKDsWyXQoMB2hgibM+cZIxvG
 fp3wqzrWfP/c3Q0qx4E25I+j9HeyKLOL3/z/em8pzLCJbDHh/1eiMu/4rEsNMM2z8g3y
 d2bvd8WUDnkEfa6GCMpjFSpQvawaDcwIUb7nnpyPhWcatzmIGixUl/dzkNOeeBc65ptl
 Fl+53pVt3Ph23MTduT5CLJ/Gr/ceG0c/sHbyE1c2k/j11akrKVMXlDSRBifcZ6Pw9/aY
 P7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7EpZ3W6+R10EcvysXCT5zhaMgB5ltwhnG0M6maYRBm8=;
 b=UTfYEZ56q8dZVaou66aW1YE9u5m3C0n4kCQRND0FNF9JNNZAeoyneYbSrIRnwT3iaz
 dmBys18FlViXfJAzomUf/JNFHY5uLlTekO5Km9Ga5Aj0/yeMVLUILH+4iEg5fZmqa2R4
 dFJZCITiiHQWg9XCsLjA2z1leS54ic2Lle2EKQD+p0VjEHk9gRYOnak32svDPyCzHQYo
 0pDYEu2yuOKszXBaTaTaTLdky3XSdMKjuH8HBmLJ9Qeyu8W2TlSmluFxi/KYYlnjVCRH
 piQtzHMGraJxUCsjKhPYw5bS6l8+JUU8Ep4d52jnxmJ3CAQIqngtsUKyC9KxGGVseU+x
 V8Ow==
X-Gm-Message-State: AOAM533OPLx2MhyN2RndunCtgTj7HC/wxWTR8mcTWoUFDF257Kw3FaPm
 vgHbMJPGS0dYR+WgM8dj71C4yX4CZtZO4MsuR10=
X-Google-Smtp-Source: ABdhPJwXKliJUQcenUT1P94I9xPO+d+gfY9ydpGuiMS5jPbn4C52wkeDpwQ2SSyqMdabEVTUxJ7KgxFtJlo4hi6cqxQ=
X-Received: by 2002:a2e:8108:: with SMTP id d8mr14083989ljg.184.1589311912162; 
 Tue, 12 May 2020 12:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <3ed7eb87-070c-28ea-4f8a-aa4421cea93a@citrix.com>
 <5ea8173d.1c69fb81.915ba.8400@mx.google.com>
 <c242b963-ae80-1ca0-9b4d-fe2c8f66b6a2@citrix.com>
 <34cc563f-9e05-b55c-54f4-55104d2d42b5@citrix.com>
In-Reply-To: <34cc563f-9e05-b55c-54f4-55104d2d42b5@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 May 2020 15:31:40 -0400
Message-ID: <CAKf6xpuf83H6PQXORX9A-S2d5Zzsvc_S6gQsQgKPZLJFoXw-9g@mail.gmail.com>
Subject: rombios triple fault with -fcf-protection
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
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

This is the output from a failed rombios boot:

(d11) Invoking ROMBIOS ...
(XEN) stdvga.c:173:d11v0 entering stdvga mode
(d11) VGABios $Id: vgabios.c,v 1.67 2008/01/27 09:44:12 vruppert Exp $
(d11) Bochs BIOS - build: 06/23/99
(d11) $Revision: 1.221 $ $Date: 2008/12/07 17:32:29 $
(d11) Options: apmbios pcibios eltorito PMM
(d11)
(d11) ata0 master: QEMU HARDDISK ATA-7 Hard-Disk ( 112 MBytes)
(d11)
(XEN) MMIO emulation failed (1): d11v0 32bit @ 0008:ffffffff ->
(XEN) d11v0 Triple fault - invoking HVM shutdown action 1
(XEN) *** Dumping Dom11 vcpu#0 state: ***
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    0008:[<00000000ffffffff>]
(XEN) RFLAGS: 0000000000010086   CONTEXT: hvm guest (d11v0)
(XEN) rax: 0000000043001000   rbx: 000000000009c30e   rcx: 0000000000000000
(XEN) rdx: 0000000000000000   rsi: 000000000000031e   rdi: 0000000000000020
(XEN) rbp: 00000000000002de   rsp: 000000000009ef48   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
(XEN) cr3: 0000000000400000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 00000000000c9000   gss: 0000000000000002
(XEN) ds: 0018   es: 0018   fs: 0000   gs: c900   ss: 0018   cs: 0008

For a traditional stubdom with sdl enabled, I also see the init_message of iPXE
iPXE (http://ipxe.org) 00:04.0 C900 PCI2.10 PMM_

The underscore might be the cursor?

The VM reboots.  If I set on_reboot="preserve" and use gdbsx:

(gdb) target remote :1234
Remote debugging using :1234
0xdeadf00d in ?? ()
(gdb) bt
#0  0xdeadf00d in ?? ()
(gdb) i r
eax            0x0                 0
ecx            0x0                 0
edx            0xe5a08016          -442466282
ebx            0x87                135
esp            0x23aa              0x23aa <memset+22>
ebp            0x0                 0x0
esi            0x0                 0
edi            0x0                 0
eip            0xdeadf00d          0xdeadf00d
eflags         0xdeadbeef          [ CF PF ZF SF IF DF OF RF AC VIF ID ]
cs             0xdeadf00d          -559026163
ss             0xdeadbeef          -559038737
ds             0x5ef890            6224016
es             0x0                 0
fs             0x5ef868            6223976
gs             0x0                 0

