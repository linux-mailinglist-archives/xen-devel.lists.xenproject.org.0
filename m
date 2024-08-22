Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC195B5EC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 15:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781827.1191332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7VL-0003rM-9W; Thu, 22 Aug 2024 13:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781827.1191332; Thu, 22 Aug 2024 13:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7VL-0003oK-3I; Thu, 22 Aug 2024 13:05:31 +0000
Received: by outflank-mailman (input) for mailman id 781827;
 Thu, 22 Aug 2024 13:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m19V=PV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sh7VJ-0003o9-WB
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 13:05:30 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340453b8-6087-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 15:05:28 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso1330600a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 06:05:28 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c4384sm897139a12.62.2024.08.22.06.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:05:25 -0700 (PDT)
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
X-Inumbo-ID: 340453b8-6087-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724331927; x=1724936727; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tXFpMVsEY5HDdG9iyqyw0NLnxrsTfAERPp6H4mRa/04=;
        b=R0oz3gTS+4Wjdvw8j2MlER93Lz1EtGf+B+WWkAxRn5+P4fLQK9SnnHrGzk5Ao4xqmh
         XfMOBlQuFn+f1uRVeu91k0iqxcsoKapDwbBfQyhYBjlIg0pArMKGW1VXlZOUDJHjrZYc
         OvKuxgfpAL//PJkerHSB7iMccGCZIsYz62lR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331927; x=1724936727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXFpMVsEY5HDdG9iyqyw0NLnxrsTfAERPp6H4mRa/04=;
        b=XsmuHTEYINUnh18tErkNxZ+wVlVRRA1SXcX5EFN4yJQ3rVlr3Z3ESISIzBvmENE/zH
         sWbkOJqvE4Quk2l0n/Ng9BESzX/cARmE/mpIil4+UcWBBzjrA1YrY+I48AEBIyGpGj+r
         rFSkbvkBkp4WPR2WQZoVKByy8HSHLsKKQLzG/ftBoybcSdAx+lV0ncfVZyZF35BLj3yE
         m5s7M6uZNiRXQJ9IXq1V/mBR5urkFxJU4ehOeiYfyakQeaBh26x58W84ri1yAYbNLj8b
         2beDSP34qSKL6oShfTxnKepewy4t3oD/295FnODmCEDEQoQbn6zSngdc/GIXyPyyRecw
         nXRA==
X-Gm-Message-State: AOJu0YyY9NB7wR3kU05N4vil9gjGgaGMYZGItkFcPxS7Et5z1Tc5Uzo6
	4MS6/gAenG8jIeYE5q7S40S5VdY8LhguJhn6HpDFYPQrLOYF3SXtjyTXK5cd4qDT9DsfBaGNU0s
	f
X-Google-Smtp-Source: AGHT+IH/ji6W4wgVAqXV6EI7AgkKhuFQ8u8shIxiUdiGxBQPJTCpPYVqz+HnWo1urm8ZCjVqnxxh1w==
X-Received: by 2002:a05:6402:354c:b0:5be:fff2:1062 with SMTP id 4fb4d7f45d1cf-5bf2bcafeb2mr2987494a12.0.1724331926400;
        Thu, 22 Aug 2024 06:05:26 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 0/3] x86/xen-ucode: Introduce --force option
Date: Thu, 22 Aug 2024 14:04:23 +0100
Message-ID: <20240822130426.492931-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor and introduce --force option to xen-ucode, which skips microcode
version check when updating x86 CPU micocode. A new hypercall introduced
with flags field to facilitate the new option and allow for future flags
as needed.
This change is required to enable developers to load ucode that is the same version as the
one already loaded or downgrade for testing.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Fouad Hilly (3):
  x86/ucode: refactor xen-ucode to utilize getopt
  x86/ucode: Introduce --force option to xen-ucode
  x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same

 CHANGELOG.md                         |  1 +
 docs/misc/xen-command-line.pandoc    |  7 +-
 tools/include/xenctrl.h              |  3 +-
 tools/libs/ctrl/xc_misc.c            | 12 ++--
 tools/misc/xen-ucode.c               | 66 ++++++++++++++++---
 xen/arch/x86/cpu/microcode/amd.c     |  8 ++-
 xen/arch/x86/cpu/microcode/core.c    | 95 ++++++++++++++++------------
 xen/arch/x86/cpu/microcode/intel.c   |  9 ++-
 xen/arch/x86/cpu/microcode/private.h |  5 +-
 9 files changed, 138 insertions(+), 68 deletions(-)

-- 
2.42.0


