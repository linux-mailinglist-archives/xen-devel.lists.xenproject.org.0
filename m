Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83B32ACC5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92641.174614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGao-00084O-EM; Wed, 03 Mar 2021 01:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92641.174614; Wed, 03 Mar 2021 01:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGao-000846-8v; Wed, 03 Mar 2021 01:46:26 +0000
Received: by outflank-mailman (input) for mailman id 92641;
 Wed, 03 Mar 2021 01:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGan-000841-4w
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:25 +0000
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e0d693a-253b-49b0-820b-4568eb680827;
 Wed, 03 Mar 2021 01:46:24 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id s15so16415257qtq.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:23 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:22 -0800 (PST)
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
X-Inumbo-ID: 2e0d693a-253b-49b0-820b-4568eb680827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FrLDylkw+U8rfdSCi7ScgTakUdJYNvinWBx5qALy/yI=;
        b=dB5bKhSmNpMUyQ1wVssPjTeTd1YoULzawIvCCGK23kfO7fMaZSz6I/Ani/7B9cVGqM
         zXsNtpENIwU3o1cP0HFwJqZS9XI6dpaYZgdVYF7HzqPgFO1Jo20M8ZpKEVavipG0zU7r
         VeAPnvoSYk6mD0aLPeDok+u3HF963rQ3LHGCr7cboJVRX2x7Kjg/T4Q8JqlI1K5DiQ35
         VSrjhQErcMzUO13IKlO/L9vUncRoZYO1DIeM9uMnXFs+C+ClGCMLQty3KkGeNmypdfpn
         vSOVhsMbSMiLeQUNj1YibUSoND+ny79Xj9A7mV2UxfcHESaquidOf6raHxIlb6Bn+9/E
         yv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FrLDylkw+U8rfdSCi7ScgTakUdJYNvinWBx5qALy/yI=;
        b=DUmW9yhZQlmObgrBEhO7IBbdg4XoCS4ovHsuzbLU8yU4WaKbAZ49xGM+3gkMad13zr
         tEaPnuTNT+3hksGQyHPfx+OMhuRZohecDZ2VK2jZ1RvzUmDuzGz6RgY2OO4oPfYf1c15
         zaEaxfj0+ydbcqaxYOZ/g4j+eCeVDp+/w5Kj0F/KhCiSkv2CHq5O71DGTDm1S3Ec8bkD
         dUNU9rTGZBiiTBUMfwUNVhXKliDZaZkedNiuD25ikp66qcgBCLIcp7F2nnO7/aUcNyeH
         55QzC/0B59Pft2gOFzFFoMnhtWGYzt0dd55NtdhBIP+kekWzHAxIKPnaCz5+klRcwZ64
         QyqA==
X-Gm-Message-State: AOAM5329b/LYxiAfp15W4WGMkUuvkxp5uhZZYYIAXojFroY0fPClaZLZ
	NapYpQ8O2vT4GfdQZV37DPEnVBJukkGIQA==
X-Google-Smtp-Source: ABdhPJwUKEo6w7UoiiGFZp5YcggoA9/QEP7Ai3Xfp1O4MXEwEodzmyYUWMjg7qg1nZYyYbLoDCO9tw==
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr20998988qtr.369.1614735983341;
        Tue, 02 Mar 2021 17:46:23 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 0/7] add function support to IDL
Date: Tue,  2 Mar 2021 20:46:12 -0500
Message-Id: <cover.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1

At a Xen Summit design session for the golang bindings (see [1]), we
agreed that it would be beneficial to expand the libxl IDL with function
support. In addition to benefiting libxl itself, this would allow other
language bindings to easily generate function wrappers.

The first version of this RFC is quite old [1]. I did address comments
on the original RFC, but also expanded the scope a bit. As a way to
evaluate function support, I worked on using this addition to the IDL to
generate device add/remove/destroy functions, and removing the
corresponding macros in libxl_internal.h. However, I stopped short of
actually completing a build with this in place, as I thought it made
sense to get feedback on the idea before working on the next step.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00964.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01352.html

Nick Rosbrook (7):
  libxl: remove extra whitespace from gentypes.py
  libxl: add Function class to IDL
  libxl: add PASS_BY_CONST_REFERENCE to idl
  libxl: add DeviceFunction classes to IDL
  libxl: add device function definitions to libxl_types.idl
  libxl: implement device add/remove/destroy functions generation
  libxl: replace LIBXL_DEFINE_DEVICE* macro usage with generated code

 tools/golang/xenlight/gengotypes.py |   2 +-
 tools/libs/light/gentypes.py        | 107 +++++++++++++--
 tools/libs/light/idl.py             |  69 +++++++++-
 tools/libs/light/libxl_9pfs.c       |   2 -
 tools/libs/light/libxl_console.c    |   2 -
 tools/libs/light/libxl_disk.c       |   2 -
 tools/libs/light/libxl_nic.c        |   2 -
 tools/libs/light/libxl_pvcalls.c    |   2 -
 tools/libs/light/libxl_types.idl    | 202 ++++++++++++++++++++++++++++
 tools/libs/light/libxl_usb.c        |   3 -
 tools/libs/light/libxl_vdispl.c     |   2 -
 tools/libs/light/libxl_vkb.c        |   1 -
 tools/libs/light/libxl_vsnd.c       |   2 -
 tools/libs/light/libxl_vtpm.c       |   2 -
 14 files changed, 367 insertions(+), 33 deletions(-)

-- 
2.17.1


