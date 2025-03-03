Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E0A4CF3F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 00:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900668.1308528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpFGS-0001mv-6y; Mon, 03 Mar 2025 23:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900668.1308528; Mon, 03 Mar 2025 23:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpFGS-0001lL-2h; Mon, 03 Mar 2025 23:32:00 +0000
Received: by outflank-mailman (input) for mailman id 900668;
 Mon, 03 Mar 2025 23:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpFGQ-0001Ed-EF
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 23:31:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab319d59-f887-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 00:31:45 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso662075e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 15:31:45 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba58713bsm211574785e9.34.2025.03.03.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 15:31:43 -0800 (PST)
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
X-Inumbo-ID: ab319d59-f887-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741044704; x=1741649504; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pm6c6pe2VTDnq+QjL5p5/gcR/5MEa54tmq0jY5TTfI=;
        b=L4sb2x7dwnUwZpmkyVsmChsukanNfMaq5Pi+RzWckRogDn7rcrWPzmUsSXENjgFcio
         xSd0D6tj7EwC6kcn+cjw1AUBjE10ZTEiv0Ln7X0HafGjE4nbkIX/0olHRLvEcLsdqN0f
         SN0MCZLuYnpBdXutqA7VnTeIWUbg7fOPlmbmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741044704; x=1741649504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pm6c6pe2VTDnq+QjL5p5/gcR/5MEa54tmq0jY5TTfI=;
        b=wBad+WvHyXokiscv6JDh3QWWRp5pwTu+lVeyT3a6+jUSyKObeZQDtfh6VhpucIZhjW
         rTfIsFy0Ae8BN1LJp1YDkxte5McOpmf3+WlRTFGv3DyheLqSevJ4xkbjpLGsfn23RPRv
         TQfFXr7S0EoBiFeBa9FtfrstSSkzeofJZhhDpBF9/nKm5punOni3RiDQwAgPrmQw5a0k
         60LFN9cG4PEgsmkgP27i4tkP3687/4ik6OFhdVR9IwBRGj0Tl2Po2ESqh09oi82RJXX/
         0nnHM/2Ah5JHfOBK2LfgMemQhzFOkvM+RN+pPgWjrAscZkrEr+pBFxGuhQeLu+5WPBiu
         86/g==
X-Gm-Message-State: AOJu0YxiccocKlp8y77dmT4FXv3/NGajfQG5HIN1mpzVjM1MuJcIqExx
	+RsDHgrrnUJuXJUcssFzEBXDjPtJap9ev6l7KiTuawsUJIPPUUo/2TOvAoNd8UicHyAMGIfDZPH
	7
X-Gm-Gg: ASbGnctQ3zpyPIZ8o+ZFZkQU7AE0SlWkl4CkUVi6t8/U0/cYLONGJh2Cw012v15B0Qu
	iJ0E9W+jsPshdjrLXCsnPZ8tySZKyE9DB8ENv8ihUKH5kX3VCtiBbQmcKiojPeKi7sGIm2mhegw
	QBoouR63s2XQDGwVx5u9JWwck4ktQFqqA5nyXIAAsycQtwlDP16NFc6w+38UxNUS7iBmz3LptHE
	BI4PkqMwhLozihY8WYlgtPSezP1FLDPIXTRmhmsgIS2OuzDc5/GNps/z/YZ0RM0o2PpQsKO0AW6
	J0SBF8gEdiGoW+F0UbWE/JC/1DIIfEcJ5Y0BTPI7ukjD0xPgY7rTZzjgVs6vrGF5u5Ab2Rnt9jQ
	hqXwElDnZ2Ns21kKc+xCQXW8w
X-Google-Smtp-Source: AGHT+IFNVqJUl0an24mneSKabNLZUZOneCi0ExboAhwThv+I5u0FYGs0joj0xxhO3mTQISoEAUBlUA==
X-Received: by 2002:a05:600c:4685:b0:439:9a5b:87d4 with SMTP id 5b1f17b1804b1-43ba67047bemr124575005e9.13.1741044704120;
        Mon, 03 Mar 2025 15:31:44 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 0/2] xen/watchdog: Identify which domain watchdog fired
Date: Mon,  3 Mar 2025 23:29:39 +0000
Message-Id: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See patch 2 for rational.

Since v1, use struct domain's alignment as the safety check.

Andrew Cooper (2):
  xen/domain: Annotate struct domain as page aligned
  xen/watchdog: Identify which domain watchdog fired

 xen/common/sched/core.c | 23 ++++++++++++++++++++---
 xen/include/xen/sched.h |  2 +-
 2 files changed, 21 insertions(+), 4 deletions(-)


base-commit: e95dc03717b8ae00de2a0b41b88905af6170b210
-- 
2.39.5


