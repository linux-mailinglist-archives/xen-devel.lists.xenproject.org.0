Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9C36E26C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119614.226174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKH-00072k-6R; Thu, 29 Apr 2021 00:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119614.226174; Thu, 29 Apr 2021 00:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKH-00072L-36; Thu, 29 Apr 2021 00:14:41 +0000
Received: by outflank-mailman (input) for mailman id 119614;
 Thu, 29 Apr 2021 00:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKE-00072A-VM
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:14:39 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26db95de-88d3-4037-9cca-b69fde44230c;
 Thu, 29 Apr 2021 00:14:38 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id u20so33409107qku.10
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:37 -0700 (PDT)
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
X-Inumbo-ID: 26db95de-88d3-4037-9cca-b69fde44230c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JgWNZYdWbxhv4Vwgh6STOe2vmJwSi9uDZw25xJ4C5u0=;
        b=NZJwCNiz2Y3t20rRF9tiRZD4hJZeP4/XZ8GU+/jaUIDw2q7cbxaF1d72TEbEgbofmV
         ABB6gE18HdBVOw04MMxnYHfdx3qWiSz2cMYNwfnQy50MhqxbRy9TVYs65GgFtiG8K1OI
         WwkF/M20459aCVchnq9blTawaUSCcVwVq3DlCZxen1dBUINwkdUhemqD4tVc86lFmOJ3
         inmQ/dhqW9K7Yvox0IZyAuxGVGZYml/3xLPWVlKFNUYWiDAgWOgbJHbqv9LBMcTN0CO+
         2kAvGHRX9ZUe1PZs4O7arhQdtTJGVJQYceosvc8+WIBGD0w7apj4EZI15ommwSZ6f2vy
         38mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JgWNZYdWbxhv4Vwgh6STOe2vmJwSi9uDZw25xJ4C5u0=;
        b=Z3BUEttelbo/8umz6/CV0B3GwPM3+H+MvnvoykYBlkFBismmUPmuVhvcNezUzYTg8q
         +MoE98LjdBiaWK5p9LKCSq2y1npF9e6eJrzLuJujenRwxtGZt0+5CYbgAswuJiY8wRMT
         qH7zlzVVBascjkeHq/LE2UEizRN/grFcAQ1y/7f+16yFPm+Oeq+REAZAHDww7h+bfVby
         N/nRuCy4jGEA+UwO/T8o8NWgPd54hnRsSV8SsC6hQza4u+p7MZPE79c2TIv+TzeMKilY
         QCntypUVAiGZwne3D6x4BqKetgqxVSqnmFSmZtEiKID9skMuPzrEiew2GjdBvMuZ3lug
         J2zA==
X-Gm-Message-State: AOAM530Sylq9WTPniGlrUA4RgpoSBSWuGRmv3mV6fpbAGOeO7mT3K2aD
	Odx5ZilOjElDQLLc+/Jd0lLR7qrl0bY=
X-Google-Smtp-Source: ABdhPJzhvrGgmwZ9/SbsyzA7VyJs2aFfFrFK9G+0nBKx8C0jibnMbVZi9Nb9ku7q0SjemOErk8tQlw==
X-Received: by 2002:a05:620a:4553:: with SMTP id u19mr21009894qkp.485.1619655277468;
        Wed, 28 Apr 2021 17:14:37 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 00/12] golang/xenlight: domain life cycle support
Date: Wed, 28 Apr 2021 20:14:22 -0400
Message-Id: <cover.1619650820.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1

The primary goal of this patch series is to allow users of the xenlight
package to manage a full domain life cycle. In particular, it provides
support for receiving domain death events so that domain shutdown,
reboot, destroy, etc. can be handled. And, it addresses issues found
when using the package to boot domains with various configurations.

These patches address several things (e.g. bug fixes, code style,
conveniences, new wrapper functions), but are all work towards the final
goal of allowing a package user to manage a full domain life cycle.

Nick Rosbrook (12):
  golang/xenlight: update generated code
  golang/xenlight: fix StringList toC conversion
  golang/xenlight: fix string conversion in generated toC functions
  golang/xenlight: export keyed union interface types
  golang/xenlight: use struct pointers in keyed union fields
  golang/xenlight: rename Ctx receivers to ctx
  golang/xenlight: add logging conveniences for within xenlight
  golang/xenlight: add functional options to configure Context
  golang/xenlight: add DomainDestroy wrapper
  golang/xenlight: add SendTrigger wrapper
  golang/xenlight: do not negate ret when converting to Error
  golang/xenlight: add NotifyDomainDeath method to Context

 tools/golang/xenlight/gengotypes.py  |  11 +-
 tools/golang/xenlight/helpers.gen.go | 210 ++++++++++++--
 tools/golang/xenlight/types.gen.go   |  63 +++--
 tools/golang/xenlight/xenlight.go    | 395 ++++++++++++++++++++-------
 4 files changed, 518 insertions(+), 161 deletions(-)

-- 
2.17.1


