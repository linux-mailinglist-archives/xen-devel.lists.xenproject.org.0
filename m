Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CF73FA12
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 12:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556017.868244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5pA-0007ho-50; Tue, 27 Jun 2023 10:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556017.868244; Tue, 27 Jun 2023 10:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5pA-0007g8-25; Tue, 27 Jun 2023 10:21:28 +0000
Received: by outflank-mailman (input) for mailman id 556017;
 Tue, 27 Jun 2023 10:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9WP=CP=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1qE5p8-0007g2-4Q
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 10:21:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d7d8bfd-14d4-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 12:21:23 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9923833737eso28796966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 03:21:23 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 qc5-20020a170906d8a500b00992076f4a01sm886503ejb.190.2023.06.27.03.21.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Jun 2023 03:21:22 -0700 (PDT)
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
X-Inumbo-ID: 5d7d8bfd-14d4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687861283; x=1690453283;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndZA4BPfU+FceQpEgeBH1Ewx7zzZ5krG3I7Wjsxllfs=;
        b=g7k2fbDb0Qe7mLPMaYfdyx/4szgF1sf6wzNvv7Xal4j0YksmAfezKFedM7m1tbpDeD
         cNZvD7UjnGvh+UlgBGaSm6sDQdawnqSszeIZMsBvywRr/6+neEse5/gKsGflI+G0jRx4
         NJSpOlBVTdGHi2JupINXFqcoVivw8tkyhGHkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687861283; x=1690453283;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndZA4BPfU+FceQpEgeBH1Ewx7zzZ5krG3I7Wjsxllfs=;
        b=iY/3o1EEpDmTLaK5q3OYxXFrSGkj/F4yXmy+7O8zQ9JK6ehHAPCIdibQ9P2mvjKlbu
         8fdsc6FHmVSGHlh6wD7Yg9px8xKDkDgHMZQYypWK8T2DONMBIH9gbDWeByeHcuMfiXUu
         u7hZRTxmgNTzUGz4bxsnQpkmvd7AZpt39OGnqTCAoA/Q2RW0bTDVv+EhGjjdirYrJEtu
         3a0cJprZo/ynqJEMILksKQV0lTHgA205afRbC1w+f/2VP9ahyBchS0bTGNQnajmYsx17
         FQ69LUA1x6aVkbqhzVxbEE4G8a5dRb4N24ML2NOV4r+rJTebN/9gR7eV9XX08v+1aRrM
         llMQ==
X-Gm-Message-State: AC+VfDzUF/G/sHNPElyXZi/AflpYQmB2Hc8ZpzKTRN0/CmK3+SFhvEDG
	BwOHwa0ZYrF1I30yCajjGE+ti37o+3UHPznAAp5zlg==
X-Google-Smtp-Source: ACHHUZ6ZO00rIEj4uMJZXoLntLDy/u8Yf6osfBxv70CGfniC3ETBOITyV0WWJx/ze2KNQql554BJIw==
X-Received: by 2002:a17:907:7884:b0:98e:23d3:bf47 with SMTP id ku4-20020a170907788400b0098e23d3bf47mr6028164ejc.36.1687861282927;
        Tue, 27 Jun 2023 03:21:22 -0700 (PDT)
From: Edwin Torok <edwin.torok@cloud.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: xen summit 2023 design session: Using only stable interfaces for
 (o)xenstored
Message-Id: <C94DAB91-C664-43CC-A84B-E0AEB3381FE4@cloud.com>
Date: Tue, 27 Jun 2023 11:21:12 +0100
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: Apple Mail (2.3731.600.7)

Background: =
https://design-sessions.xenproject.org/uid/discussion/disc_MEXyUIXV6clI8n1=
kgzQ9/view

Possible solutions:
Andrew Cooper: use get domain info list instead of querying domains =
one-by-one to reduce number of hypercalls, even though Alejandro's patch =
makes the get_domainfo lookups O(1).
To avoid a hypercall a shared read-only memory page between Xen and =
Dom0, containing a bitmap of domain existence and shutdown state.
We have 32k domains max and this fits into a small number of 4K pages.
Hypervisor can update it using atomic set/clear-bit, Dom0 will memcpy =
and then check for differences
Bernhardt/Andrew: discussion about efficiency and find first bit set, =
XOR. A *lot* more efficient than using hypercalls anyway
Edwin: do I have to implement that for various architectures?
Andrew Cooper: already implemented for all arches. Some architectures =
can only do atomic updates on natural register width (RISC-V), but that =
is already handled
Edwin: how would the stable interface look like? Memory layout =
definition in the header and ..?
Andrew Cooper: use acquire_resource with a new resource type, already =
have stable xen libs for resource mapping

Christopher Clarke/Daniel Smith (virtually from chatroom): alternatives =
to bitmap, how is it indexed?
Andrew Coooper: indexed by domid, we only have 32k
Marcus Granado: what if we want to increase that?
Andrew Coooper: 16-bit domid is baked into so many ABIs that if we want =
to increase that then this API won't be the blocker. No need to worry =
about more than 32k domids.
Christopher Clark: how about using an Argo ring
Andrew Cooper: Xen must NOT block when delivering the notification and =
notification delivery cannot be lossy, cannot afford to drop events: =
toolstacks/xenstored critically rely on this information.
Christopher Clark: bip buffers: =
https://www.codeproject.com/Articles/3479/The-Bip-Buffer-The-Circular-Buff=
er-with-a-Twist as possible solution to avoid running out of space
Andrew Cooper: bitmap also avoids having to take the domctl lock and =
reduce background idle CPU usage
Edwin: on that topic: we should also fix xcp-rrdd so it doesn't shell =
out to xenpm every 5s to collect statistics...
Andrew Cooper: should be possible to use libxenctrl directly for that
Edwin Torok: there are other interfacs that would need to be stabilized =
(see xenopsd), but lets start small and fix just this one for now, which =
will result in an immediate improvement for (o)xenstored since this was =
the final blocker to getting off stable interfaces (there is one other =
usage, but that already has a patch posted/solution)

Edwin Torok: how about release cadence? Doesn't necessarily have to go =
into immediately next Xen release, but don't know in which phase the =
release is in right now
Andrew Cooper: probably about 6 weeks time to get into next release



