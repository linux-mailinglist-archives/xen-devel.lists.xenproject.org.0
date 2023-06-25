Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B073D12A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 15:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554834.866237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDPkU-0007Sg-4t; Sun, 25 Jun 2023 13:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554834.866237; Sun, 25 Jun 2023 13:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDPkU-0007Qi-0b; Sun, 25 Jun 2023 13:25:50 +0000
Received: by outflank-mailman (input) for mailman id 554834;
 Sun, 25 Jun 2023 13:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ac69=CN=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1qDPkS-0007Qc-6q
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 13:25:48 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2f48e5-135b-11ee-b237-6b7b168915f2;
 Sun, 25 Jun 2023 15:25:46 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f90a7325f6so30074465e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Jun 2023 06:25:46 -0700 (PDT)
Received: from smtpclient.apple ([193.85.242.128])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a1ccc0b000000b003fa8158135esm5480713wmb.11.2023.06.25.06.25.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:25:45 -0700 (PDT)
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
X-Inumbo-ID: cb2f48e5-135b-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687699546; x=1690291546;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WRVe1ZuXDJDma+c1wN3BCcBeF/ACwRJp14TJTkXOHM=;
        b=ixOFdi/tuFQ3sEAZySaKxx6POieBP3MABXu2kT0nSsUuSM1OkqSS0rWqbN5xO9X7LT
         mPM0k3IPn9DXhAPS9uZrCs3y/pZQ1Q2ZNTbsRZFu9Rpi2DrT87A/CbzClVDaL3JgL5Td
         as0f5iQGy3UNZJdSYfIgrFBH4ONsDF4+E3Nzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687699546; x=1690291546;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WRVe1ZuXDJDma+c1wN3BCcBeF/ACwRJp14TJTkXOHM=;
        b=LIVTZ6KK/1BKzENeySjLP3PQhjbGNss3nDybqjmWCMszUAlUca1QVL+ACGCWvdMV/M
         NoNRUTfj0lKd0fYrAyaG07jTHvql079HvElh0zjsCba79U4xEWB9yzq/rIba3nJoFb/Y
         VpKZaI8NwhhN8m9O2EKAhYNI5DIL3j+yKsZ8jU5mHXUNk3OwKP2WZHvyrNmgm6JWFyj1
         R4TQ0gO2af4YRCy6oiSD6lbsIm0/JJL3+CONG67MbBnVLEiR/q0kuR4+FFeJZVoDDo6+
         f1U+fFbog+5rUpd+Lc3m/ioNsLArzMgQLXFERUAJrH3sAoML+4ia760jI5fGvFA5KvjV
         Fsmw==
X-Gm-Message-State: AC+VfDyPFxI9KGfxc40XIBh8XWuYjRnufxE46FdwUyl1WutEEeT/3FLy
	BdghQJCCS66htkm8r1hnR7DT71v7Sv6tHFpPh8KiR7AA
X-Google-Smtp-Source: ACHHUZ67sFs3n3mDiSbku1DMr47v9VQ37DmxBgrwPrY4kdULixvCMaxm9mN/yUozvjnuSLiNmW1wpg==
X-Received: by 2002:a1c:7415:0:b0:3fa:77c8:6724 with SMTP id p21-20020a1c7415000000b003fa77c86724mr7067005wmc.10.1687699545986;
        Sun, 25 Jun 2023 06:25:45 -0700 (PDT)
From: Edwin Torok <edwin.torok@cloud.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: xen summit 2023 design session: distributed tracing
Message-Id: <A00BDEE0-214B-4E63-910C-F2B40EAF1FD9@cloud.com>
Date: Sun, 25 Jun 2023 15:25:34 +0200
Cc: Marcus Granado <marcus.granado@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: Apple Mail (2.3731.600.7)

design session: distributed tracing

Marcusg: proof of concept
* where to start, simplest parts
* how to attempt to collect the context (unique/random id),begin/end =
events
* e.g. domain create

George: pass in id to hypervisor
Andy: maybe userspace first, libraries/xenguest
 more difficult in calls like add_to_physmap
 continuable hypercall indistinguishable from userspace calling it N =
times
 e.g. new event becomes pending

george: dom0 jumps into Xen, long running hypercall finishes, if it =
wasn't done it stores how far it got,
and pushes the IP back one instruction so when VM runs again it will =
reexecute same hypercall

mark: you called first one with a context, that continuation might've =
been stashed
andy: you'll need large trace buffers
george: write to disk might be limit, might be minutes worth of events
optimization
edwin: could filter on dump if needed, also hypercall could store a bit =
saying we started so we don't emit repeated traces
andy: we guarantee forward progress in hypercalls, but limited room to =
store continuation info

edwin: current context?
andy: hypervisor can't tell which process is current, continuation might =
be on different cpu,
  stashing domain-related hypercalls we can stash state in struct  =
domain/cpu, except for first hypercall
george: multicall like wrapper for tracing, Xen is not preemptable, =
store start/end
other ops inbetween may get tagged incorrectly when interrupted
andy: xentrace doesn't distinguish sync and async events, to ignore =
interrupts
andy: how big, what format?
marcusg/edwin: unique ids, 128-bit for context ,span 64-bit, but has =
parent/child and if child is unique it has a link to full parent

edwin: spanid passed in, hypervisor
george: postprocess and generate opentracing format there, hypervisor is =
not preemptible, can infer parents

andy/george: how to gen id? random? host unique: vcpu index + per-cpu =
counter. rdtsc? not reliable

pcpu bits + rdtsc bits --> unique
pcpu + incrementing counter
andy: tracing interrupts? not associated with anything
george: sometimes you can tie it back to a high-level task, e.g. global =
tlb flush
andy: properties of timestamps?
marcusg: begin/end event, translatable back
george: xentrace has (optional) time information, correlates across =
pcpus, uses scheduling as a lamport clock.
TSC drift not really a problem anymore
andy: invariant TSC, assume
andy: host mode tsc: no scaling/offset so timestamps in guest can be =
compared to Dom0
timestamps: convert to ns
andy: clocks change frequency with temp, etc.
Dom0 clocksource: tsc as clocksource doesn't quite work, but kernel =
could have NTP adjustment info

andy: what information would we want?
marcusg: who/what features are being used?
george: add tracing as needed
marcusg: tracing what happens with nested virt
andy: that would trap too often
edwin: pick one op as  PoC, but more than one optimization
george: get ready for tracing "in anger", do a proof of concept on a =
particular op to figure out the mechanism
domain create, get xenalyze ready to translate=

