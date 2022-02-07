Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8B4AB927
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 11:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266713.460416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1hb-0001uy-DZ; Mon, 07 Feb 2022 10:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266713.460416; Mon, 07 Feb 2022 10:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1hb-0001t1-9x; Mon, 07 Feb 2022 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 266713;
 Mon, 07 Feb 2022 10:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H0qh=SW=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nH1hZ-0001sl-1m
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 10:56:57 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ff72c3-8804-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 11:56:55 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id w14so29120157edd.10
 for <xen-devel@lists.xenproject.org>; Mon, 07 Feb 2022 02:56:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e10sm1298608ejx.53.2022.02.07.02.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 02:56:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DE631FFB7;
 Mon,  7 Feb 2022 10:56:53 +0000 (GMT)
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
X-Inumbo-ID: a9ff72c3-8804-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DYQAeF5GF08SrkAlmINB1uRvHTmAMikhM34e6HF23rU=;
        b=j+a4GsF1L5bMH9MhCVgPtvDz//jf68ODPuhV+N3oSsFIR2maaZouWsPgO3Ag8he94s
         2Q2khjCkLe9rrZwcng5+sMORzsg9HkNkS/H/fr3S4NfKQj3+/VuhAgdTpeGoDtNwX5jC
         1C1nTw/Azv9gXb8GdH5vlmb7fgVovmwoQK/N3SFDKSJ1fJzEuJ/tEdnQSVARPFyp+nuf
         mgJ6cPoXKNTke7xcA7fEB6tTbd60VeqpUQ2+uzmO1isJb1TI0kxGwhyQnuu4siRuD5L6
         x/iuToRqvGQ1pd3ZpGGUdy8AbmknkTLYPi8OXRw6TGL4qW2mmi451We/9IagJtAE2Akk
         AylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=DYQAeF5GF08SrkAlmINB1uRvHTmAMikhM34e6HF23rU=;
        b=zz7rrOk+00UvNk6tQGnGFWFuimm7fLoZlZqzRnGG/cAXOGBIOXYpwZoj6VBpqsUBmZ
         3xXh0hyKw/QOu5ZZJsJi8qPI2qn5P5ZrU7CG5yZ62LsRFr6lOJZVKvq6ZGl00algARig
         ozOu63EU+GPaMi+0uEDvaJ1XOydyLXsJwcS93xe+/kTjhN1DlzsgLSfU63xj3ksCK/1Y
         +m8I7V0fZ6Fmy7w96JQVuU3b+406Q385JHsxyR8y2L8J5pf+zDgHm0KEgfMH2sHDe1Bs
         5Y2mCqleaEnruzLLqgWTmx5GoDRqK6RoW3zfD16VzChaKKyeDGPREPFsWiKJXhI25qtt
         Stdw==
X-Gm-Message-State: AOAM533BcXQlghrY7QLfnY/jDA9tS60ACrDanWTy7Cv/ymqhJU72IPHz
	OPDKMP829S+7Jzg2Njw6Bqm2yw==
X-Google-Smtp-Source: ABdhPJwcmRzFt4vbaC5A6qq6GvCXeou2Trroty8hockxfYbDxVusmIg9JoKbVn/d5PvLy9ofuC60WA==
X-Received: by 2002:a05:6402:1d8b:: with SMTP id dk11mr7576789edb.246.1644231414809;
        Mon, 07 Feb 2022 02:56:54 -0800 (PST)
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>, Vincent Guittot
 <vincent.guittot@linaro.org>
Cc: stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Arnd Bergmann
 <arnd.bergmann@linaro.org>, Christopher Clark
 <christopher.w.clark@gmail.com>, Dmytro Firsov <dmytro_firsov@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Metadata and signalling channels for Zephyr virtio-backends on Xen
Date: Mon, 07 Feb 2022 10:20:49 +0000
Message-ID: <87h79bgd1m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Stefano,

Vincent gave an update on his virtio-scmi work at the last Stratos sync
call and the discussion moved onto next steps. Currently the demo setup
is intermediated by a double-ended vhost-user daemon running on the
devbox acting as a go between a number of QEMU instances representing
the front and back-ends. You can view the architecture with Vincents
diagram here:

  https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6hhcHK=
KhmYHs/edit?usp=3Dsharing

The key virtq handling is done over the special carve outs of shared
memory between the front end and guest. However the signalling is
currently over a virtio device on the backend. This is useful for the
PoC but obviously in a real system we don't have a hidden POSIX system
acting as a go between not to mention the additional latency it causes
with all those context switches.

I was hoping we could get some more of the Xen experts to the next
Stratos sync (17th Feb) to go over approaches for a properly hosted on
Xen approach. From my recollection (Vincent please correct me if I'm
wrong) of last week the issues that need solving are:

 * How to handle configuration steps as FE guests come up

The SCMI server will be a long running persistent backend because it is
managing real HW resources. However the guests may be ephemeral (or just
restarted) so we can't just hard-code everything in a DTB. While the
virtio-negotiation in the config space covers most things we still need
information like where in the guests address space the shared memory
lives and at what offset into that the queues are created. As far as I'm
aware the canonical source of domain information is XenStore
(https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
type approach. Is there an alternative for dom0less systems or do we
need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
run cleanly as a Dom0 guest) providing just enough services for FE's to
register metadata and BE's to read it?

 * How to handle mapping of memory

AIUI the Xen model is the FE guest explicitly makes grant table requests
to expose portions of it's memory to other domains. Can the BE query the
hypervisor itself to discover the available grants or does it require
coordination with Dom0/XenStore for that information to be available to
the BE domain?

 * How to handle signalling

I guess this requires a minimal implementation of the IOREQ calls for
Zephyr so we can register the handler in the backend? Does the IOREQ API
allow for a IPI style notifications using the global GIC IRQs?

Forgive the incomplete notes from the Stratos sync, I was trying to type
while participating in the discussion so hopefully this email captures
what was missed:

  https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/2022-02-03=
+Project+Stratos+Sync+Meeting+Notes

Vincent, anything to add?

--=20
Alex Benn=C3=A9e

