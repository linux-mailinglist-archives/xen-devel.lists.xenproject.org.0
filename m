Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF193BDF0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764815.1175365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtpJ-0006hs-Oe; Thu, 25 Jul 2024 08:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764815.1175365; Thu, 25 Jul 2024 08:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtpJ-0006gA-Lk; Thu, 25 Jul 2024 08:27:53 +0000
Received: by outflank-mailman (input) for mailman id 764815;
 Thu, 25 Jul 2024 08:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+J6=OZ=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sWtpI-0006fy-CJ
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:27:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8363221-4a5f-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 10:27:51 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a3458bf858so775034a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:27:51 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590e7esm558590a12.36.2024.07.25.01.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:27:50 -0700 (PDT)
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
X-Inumbo-ID: c8363221-4a5f-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721896071; x=1722500871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6yyfqqYk1ygVqha37CcbDMngpYzNkFAOOOxh/xLphk=;
        b=jvr0QO3Cmtt1hCTiaacb1OUjSwZzUmN9YotPOMB0UTYnioU6XC+wI9Th/HWql1pnLI
         5Lfn9ZdD5JpGnXsH0AYUfU8Pfk/84plKWf0CiDyBhkFBoit7EZHT1MkYSzmIMLAfht6K
         ssAdPltFVJFmcm8er6E0bUoqOe0cwZL0NXXUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721896071; x=1722500871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6yyfqqYk1ygVqha37CcbDMngpYzNkFAOOOxh/xLphk=;
        b=jc7DuGcJkT6o93zGNDY59fI9oXmcck8bDkIvJSld8HN/STQzyspmOHUwo4pxObCgKm
         RLqU4wRoB4LaI8S/fCP/V75fjw1ocknwMF7VNx9YFBjz8PapmhZAW+qjVcHE1PbFmS1W
         aUqQwu4jJrWaD1hrbHuQIA4tyFQlT6LctjMQsBn0BfSvafSIYo1nzXBizFAILDlkA+bA
         XZsm4VxdHCGRj+Wu7iTucYI+F1QE2bFVjHdkxb0Jtl4cDls05Q97PZg304v5zh2waydM
         nep4lOyb1geZuW6Tc+mkJrma7p0Eh8AdwPwbTRqxAx7C6M6VElZ6RotuDPvsc+zeOrZk
         rK8g==
X-Gm-Message-State: AOJu0YzMMe7F3BMdQDM99V2yaqM/y68Ye+R+w1w27Q5wbKY8A9KEBC5/
	jwLTrVH3Eg/774THCPcc2B8J/URaQLblBpKRxZ7aGNiOCalJTKgg6IN/qbaFv7Fl1xZFbrhewtW
	0
X-Google-Smtp-Source: AGHT+IHfHOw5mOk911ZxLplhb78R5Ce2nVBf65Td+k4xwlpbNu4GixbxfGHhJEIKFl0THVvurwNKtA==
X-Received: by 2002:a50:d71e:0:b0:5a3:64dc:33a5 with SMTP id 4fb4d7f45d1cf-5ac62906bc6mr846243a12.17.1721896070436;
        Thu, 25 Jul 2024 01:27:50 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 0/4]  x86/xen-ucode: Introduce --force option
Date: Thu, 25 Jul 2024 09:27:21 +0100
Message-ID: <20240725082725.2685481-1-fouad.hilly@cloud.com>
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

Fouad Hilly (4):
  x86/ucode: Introduce XENPF_microcode_update2 with flags parameter
  x86/ucode: refactor xen-ucode to utilize getopt
  x86/ucode: Introduce --force option to xen-ucode
  x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same

 docs/misc/xen-command-line.pandoc    |  7 +-
 tools/include/xenctrl.h              |  3 +-
 tools/libs/ctrl/xc_misc.c            | 12 ++--
 tools/misc/xen-ucode.c               | 63 +++++++++++++++---
 xen/arch/x86/cpu/microcode/amd.c     |  8 ++-
 xen/arch/x86/cpu/microcode/core.c    | 99 +++++++++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c   |  9 ++-
 xen/arch/x86/cpu/microcode/private.h |  5 +-
 xen/arch/x86/include/asm/microcode.h |  3 +-
 xen/arch/x86/platform_hypercall.c    | 13 +++-
 xen/include/public/platform.h        | 14 ++++
 11 files changed, 167 insertions(+), 69 deletions(-)

-- 
2.42.0


