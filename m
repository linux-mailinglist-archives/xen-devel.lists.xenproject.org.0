Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5D2FF997
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 01:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72501.130582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjU-0002j0-Ts; Fri, 22 Jan 2021 00:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72501.130582; Fri, 22 Jan 2021 00:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjU-0002ib-QP; Fri, 22 Jan 2021 00:55:24 +0000
Received: by outflank-mailman (input) for mailman id 72501;
 Fri, 22 Jan 2021 00:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l2kjT-0002iW-Hg
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 00:55:23 +0000
Received: from mail-pg1-x529.google.com (unknown [2607:f8b0:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 452d960e-c1f9-4e3c-9c2e-293067f9f203;
 Fri, 22 Jan 2021 00:55:22 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id c22so2506548pgg.13
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 16:55:22 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id j23sm6930632pgj.34.2021.01.21.16.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:55:20 -0800 (PST)
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
X-Inumbo-ID: 452d960e-c1f9-4e3c-9c2e-293067f9f203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIOKGHEaZfI6rvT9SVdqB5YuiixLFxsrRTXqgVKYpFY=;
        b=opo3i9qwHHPs7NSfXWSYlNwu9XA1+GYaUuidLeqlaoQkipH4qe75UTIN5JvfryfV9H
         WSt3OExA8ERcVCAvW7y0VRhJPF9KkXh35mcIPK3gcsiJOay9RK/AK+gLyB8+XZ1SqSbE
         oAD1SjEL9wNqgBvk3+to/YsNy0Ngdwaku0bORSTkUNiJLpc4/gc6BqrBko87QJUuUrpV
         +pZINbwXOIkmuN6w3B1QnlmIfLayZxlynRs7vev0HGwHPQzp/1Cz1/Qo1PQ3FdqOEZcA
         FbCaA6Vas2jSVlInulakqT7YMSiURmOqDnmIx4sbRH48J6hOFIwSQ7WO/Zfj7/Rsk0iK
         xjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIOKGHEaZfI6rvT9SVdqB5YuiixLFxsrRTXqgVKYpFY=;
        b=A9azmct+dpddhC8yE3Y81PMn9Wgp816sFKGgDN7q4Zu6JWRQUkwMfIAHTXS/Bl7NIW
         n4Eyb6Bek+OrWuKzTHEOmpTcGqGOYUTN+LgSX+e1tMXTzcHoUoGVAUr1TnzJ2X+n/bu0
         v2GNxYSqLbQiYurLdGYo8RSq8l+vjcjF9VdQzC22YOA8mwgdjfWgwJKyG02UlOq2bC3D
         fjEx/oD9u4Bw0diViYHo1wbHmf1GbMp3DFV0qCXzh8cf65+1UYvmYQUDcB1TtptNGsIr
         kprSqifsGnxdfdyjgPswtQwowhXodovga9nzIvbCDPcW/MdWbkgNirjyFw1qCRpwb2AZ
         HTtQ==
X-Gm-Message-State: AOAM530q1hycvUEeMasnXH9PqVdGlq2fyge6A1ugq1STG/zU7lp9xJ9F
	3j6g3Z8wt1kawflq4uIOpdE9NC5N4QJlyUNx
X-Google-Smtp-Source: ABdhPJxXk4Hknfu/PliLzQt2PC5CBl2DWL5AqmZU1vN/pKxbXtUGA2ySIMNzR/vsNViM+lSaY3yg7w==
X-Received: by 2002:aa7:9736:0:b029:1b9:c4f5:54d5 with SMTP id k22-20020aa797360000b02901b9c4f554d5mr2043978pfg.47.1611276921417;
        Thu, 21 Jan 2021 16:55:21 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Olivier Lambert <olivier.lambert@vates.fr>
Subject: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
Date: Thu, 21 Jan 2021 16:51:39 -0800
Message-Id: <cover.1611273359.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is version 3 for a patch set sent out to the ML in 2018 [1] to
support UEFI Secure Boot for Xen on multiboot2 platforms.

A new binary, xen.mb.efi, is built.  It contains the mb2 header as well
as a hand-crafted PE/COFF header.  The dom0 kernel is verified using the
shim lock protocol.

I followed with v2 feedback and attempted to convert the PE/COFF header
into C instead of ASM.  Unfortunately, this was only possible for the
first part (Legacy) of the PE/COFF header.  The other parts required
addresses only available at link time (such as __2M_rwdata_end,
__pe_SizeOfImage, efi_mb_start address, etc...), which effectively ruled
out C.

The biggest difference between v2 and v3 is that in v3 we do not attempt
to merge xen.mb.efi and xen.efi into a single binary.  Instead, this
will be left to a future patch set, unless requested otherwise.

[1]: https://lists.xen.org/archives/html/xen-devel/2018-06/msg01292.html

Changes in v3:

- add requested comment clarification
- remove unnecessary fake data from PE/COFF head (like linker versions)
- macro-ize and refactor Makefile according to Jan's feedback
- break PE/COFF header into its own file
- shrink the PE/COFF to start 0x40 instead of 0x80 (my tests showed
  this function with no problem, on a live nested vm or using
  objdump/objcopy)
- support SOURCE_EPOCH for posix time
- removed `date` invocation that would break on FreeBSD
- style changes
- And obviously, ported to current HEAD

Daniel Kiper (5):
  xen: add XEN_BUILD_POSIX_TIME
  xen/x86: manually build xen.mb.efi binary
  xen/x86: add some addresses to the Multiboot header
  xen/x86: add some addresses to the Multiboot2 header
  xen/x86/efi: Verify dom0 kernel with SHIM_LOCK protocol in
    efi_multiboot2()

 xen/Makefile                 |  22 ++++---
 xen/arch/x86/Makefile        |   7 +-
 xen/arch/x86/arch.mk         |   2 +
 xen/arch/x86/boot/Makefile   |   1 +
 xen/arch/x86/boot/head.S     |  53 +++++++++++++--
 xen/arch/x86/boot/pecoff.S   | 123 +++++++++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h  |  30 ++++++++-
 xen/arch/x86/efi/stub.c      |  17 ++++-
 xen/arch/x86/xen.lds.S       |  34 ++++++++++
 xen/common/efi/boot.c        |  19 ++++--
 xen/include/xen/compile.h.in |   1 +
 xen/include/xen/efi.h        |   1 +
 12 files changed, 283 insertions(+), 27 deletions(-)
 create mode 100644 xen/arch/x86/boot/pecoff.S

-- 
2.30.0


