Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F62899C7A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701225.1095493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPu-0007Dz-A2; Fri, 05 Apr 2024 12:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701225.1095493; Fri, 05 Apr 2024 12:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPu-0007CS-7S; Fri, 05 Apr 2024 12:11:34 +0000
Received: by outflank-mailman (input) for mailman id 701225;
 Fri, 05 Apr 2024 12:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im47=LK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rsiPt-0007C9-3F
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:11:33 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3f514f5-f345-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 14:11:32 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56e030624d1so3456491a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:11:32 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020a50ed0d000000b0056c4372c161sm729425eds.55.2024.04.05.05.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:11:30 -0700 (PDT)
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
X-Inumbo-ID: a3f514f5-f345-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712319091; x=1712923891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jpwg+PdQE6kjWOjE4HG9MYfqeMVei57yw/CIeP+FZVs=;
        b=D4R01Pr6zuV+gfRvWD6slcurh32eng0MFK+OkrXGW/XdLgxakB9UTNiji2sGu7JtWz
         oOJFgOgJukU5RuibJbMkTktu/w+669TlnZsKkz49v50RoSE3TfwHdORkkdoDNpauLeVl
         BtuI1I9z2PF6WpscTn94RrZD3o7OS503+c+zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319091; x=1712923891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jpwg+PdQE6kjWOjE4HG9MYfqeMVei57yw/CIeP+FZVs=;
        b=lm5dt8NAGZzLzwpDFHaStNVVhBFyhcO4dy7Mws4+cn3RoHeN0eKVRtXnRFWQxmMDNG
         UnEEyBn271xfanfQwbqGaljTI6O1L+TUHPyNZvco4Kq8Stge5xU3rf/xhVvvgT+HwBoJ
         QWSaBNGWMH5q0eyLKMjMdRVQtpJYBCkOo13umdq/Ulmj5ykIUNQwQyVcCtf62HhrOXcs
         OC1+EkdcoWMAj56WSNeF1lyOlo1mpBQ716SitPCasDhdi9Q51dqFG8X483Y3v6AmRhcX
         +xxSqjONwxPl6juwCBGVTGJt8MyW3NDkkDpUW4ut4kCaFLdlXquAfPcavIKVqKmHMhdx
         qXQQ==
X-Gm-Message-State: AOJu0Yx0t7TJXMpHIDkS0D8tdlN56xdIL2Iqrdq0wckKZoyk7LE2ENet
	1Z/8nNAempGEgR5hP6oPpZeMn2pwk8wrSNYoCuhFUFvipYnVH+jKfhFfgEg6aHxwaRGM5EH5WE0
	mkJ0=
X-Google-Smtp-Source: AGHT+IHqcOz8Y/1I4pQJL/nzE9EUBuwoqjHHjbP6sjgGRQSDDiRoUJUXjMEUumuKR8p/9EAvHn0bug==
X-Received: by 2002:a50:9552:0:b0:568:b95f:5398 with SMTP id v18-20020a509552000000b00568b95f5398mr1204557eda.38.1712319090947;
        Fri, 05 Apr 2024 05:11:30 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/5] x86/xen-ucode: Introduce --force option
Date: Fri,  5 Apr 2024 13:11:23 +0100
Message-ID: <20240405121128.260493-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor and introduce --force option to xen-ucode, which skips microcode
version check when updating x86 CPU micocode. A new hypercall introduced
with flags field to facilitate the new option and allow for future flags
as needed.

Fouad Hilly (5):
  x86: Remove x86 low level version check of microcode
  x86: Refactor microcode_update() hypercall with flags field
  x86: Add usage() to print out usage message
  x86: Use getopt to handle command line args
  x86: Add --force option to xen-ucode to override microcode version
    check

 tools/include/xenctrl.h              |  2 +-
 tools/libs/ctrl/xc_misc.c            | 12 ++++-
 tools/misc/xen-ucode.c               | 69 +++++++++++++++++++++++-----
 xen/arch/x86/cpu/microcode/amd.c     |  8 +---
 xen/arch/x86/cpu/microcode/core.c    | 12 +++--
 xen/arch/x86/cpu/microcode/intel.c   | 11 ++---
 xen/arch/x86/include/asm/microcode.h |  2 +-
 xen/arch/x86/platform_hypercall.c    | 12 ++++-
 xen/include/public/platform.h        |  8 ++++
 9 files changed, 102 insertions(+), 34 deletions(-)

-- 
2.42.0


