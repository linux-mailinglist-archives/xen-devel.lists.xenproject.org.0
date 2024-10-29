Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6509B51B3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827795.1242509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qm8-0007d5-HC; Tue, 29 Oct 2024 18:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827795.1242509; Tue, 29 Oct 2024 18:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qm8-0007ba-E8; Tue, 29 Oct 2024 18:17:04 +0000
Received: by outflank-mailman (input) for mailman id 827795;
 Tue, 29 Oct 2024 18:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qm7-0007Zv-48
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:03 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9d3b0f-9621-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 19:16:59 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso7531530a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:16:58 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:16:57 -0700 (PDT)
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
X-Inumbo-ID: fc9d3b0f-9621-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZjOWQzYjBmLTk2MjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjI1ODE5LjAwNjM0Nywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225818; x=1730830618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/T9kZhXn8LdWqYIydkfjKOCaQzwUJXZp/sc6bYGC0pQ=;
        b=LQjH8R7smF5U2Euth7CfAYlZewszKC3XXE37EPqqfV0V4W5HTkUsA/XpXOYDWAsOKC
         SUjBYu1mukASrd/jAscczGdd1cVms1F53GJikHvXLba7GBGI/DCj4V5kyCmaDvqey7DN
         NtB2N2milXaEKmwd9Yv7xQ5zq5BOwmWczsdI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225818; x=1730830618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/T9kZhXn8LdWqYIydkfjKOCaQzwUJXZp/sc6bYGC0pQ=;
        b=ev2tMpVeLFssaEhF+mRRKFhmtsPTsinlokb/2EW9y2kvI6uikw6ghCJL2otVioCGTQ
         KnAhQl88wFKV1qd0/2NUhbnDcf4JlzJ52G0arZgmB1KbAXgdwbROLGioP4WETN8rXJ4+
         ULc1Z/1gMVwK1r38OP7kvjW+G/KTmUwOC1UaCmqk7Q9UAGhwxxa4+Dht0znbluoPD8RJ
         xBgzx2LdFxH94Rspn9wfFmq92yEp5KPJaWYNtndL2OdnMxx/wZzKESjiP+5F6XyyTv2o
         bEjwzTby8LPM0drH1RgXgGhgbHp8FunvwMIf3nHJdwnSDnXIjf3mxMWv4763USj3PRke
         748g==
X-Gm-Message-State: AOJu0YwLKarumOmAm6jZod8cZK/E7oPZwT0bWrk5w1xjmjqdNdscjNNw
	VKW/fdxXIphGOQalG4Qu4XPLObfK2s6NNKA6jinPzPEejn/q2VGUyj3gyzExxT12Kuvno1+DME5
	Z
X-Google-Smtp-Source: AGHT+IGUR8IA9H8BwQzBGJm8HmczWrC/r7VBq3AXXpYpKG2TW/91JsUVBPCkzxzULOwpFy+xKy7OZw==
X-Received: by 2002:a05:6402:2710:b0:5c9:1d7f:4fd9 with SMTP id 4fb4d7f45d1cf-5cbbf8a41e0mr10892793a12.8.1730225818164;
        Tue, 29 Oct 2024 11:16:58 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive types
Date: Tue, 29 Oct 2024 18:16:26 +0000
Message-ID: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Non-boolean bitfields in the hypercall ABI make it fairly inconvenient to
create bindings for any language because (a) they are always ad-hoc and are
subject to restrictions regular fields are not (b) require boilerplate that
regular fields do not and (c) might not even be part of the core language,
forcing avoidable external libraries into any sort of generic library.

This patch (it's a series merely to split roughly by maintainer) is one such
case that I happened to spot while playing around. It's the grant_version
field, buried under an otherwise empty grant_opts.

The invariant I'd like to (slowly) introduce and discuss is that fields may
have bitflags (e.g: a packed array of booleans indexed by some enumerated
type), but not be mixed with wider fields in the same primitive type. This
ensures any field containing an integer of any kind can be referred by pointer
and treated the same way as any other with regards to sizeof() and the like.

I'd like to have a certain consensus about this general point before going
establishing this restriction in the IDL system I'm working on.

My preference would be to fold everything into a single patch if we decide to
follow through with this particular case. As I said before, the split is
artificial for review.

Alejandro Vallejo (6):
  xen/domctl: Refine grant_opts into grant_version
  tools: Rename grant_opts to grant_version
  tools/ocaml: Rename grant_opts to grant_version
  xen/arm: Rename grant_opts to grant_version
  xen/x86: Rename grant_opts to grant_version
  xen/common: Rename grant_opts to grant_version

 tools/helpers/init-xenstore-domain.c             |  2 +-
 tools/libs/light/libxl_create.c                  |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c              |  3 +--
 tools/python/xen/lowlevel/xc/xc.c                |  2 +-
 tools/tests/paging-mempool/test-paging-mempool.c |  2 +-
 tools/tests/resource/test-resource.c             |  6 +++---
 tools/tests/tsx/test-tsx.c                       |  4 ++--
 xen/arch/arm/dom0less-build.c                    |  4 ++--
 xen/arch/arm/domain_build.c                      |  2 +-
 xen/arch/x86/setup.c                             |  2 +-
 xen/common/domain.c                              |  6 +++---
 xen/common/grant_table.c                         |  3 +--
 xen/include/public/domctl.h                      | 15 +++++++++++----
 xen/include/xen/grant_table.h                    |  4 ++--
 14 files changed, 31 insertions(+), 26 deletions(-)

-- 
2.47.0


