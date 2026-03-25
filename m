Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHdbKMq7w2kKtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE4323293
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261929.1554649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfd-0005GF-Gw; Wed, 25 Mar 2026 10:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261929.1554649; Wed, 25 Mar 2026 10:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfd-0005DP-Dg; Wed, 25 Mar 2026 10:41:05 +0000
Received: by outflank-mailman (input) for mailman id 1261929;
 Wed, 25 Mar 2026 10:41:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5Lfc-0005DI-6P
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:41:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lfa-00CE42-0i
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:41:03 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbbf-5cb7-0a2a0a5109dd-0a2a4504cc78-0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:03 +0100
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbbf-c823-0a2a45040019-d155da35e92f-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:03 +0100
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b982d56dac4so371595666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 03:41:03 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm798491866b.17.2026.03.25.03.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:41:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435263; x=1775040063; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9IUgVkMnSvSpiMpIQOwgKjrrKDZg8TzP8a6gJHM7DE=;
        b=H8ie4G8IP6S4hm1pm/ZJWOQezPUlzTtMk8GaObQOWP9otttXTHq1BnD9xhmvRNCdVT
         W1Z0ylP+1jO8QU4lrqEjW4uwSiRhklx4gSsJJMb/w1iN3wYJkMIaHnenSMBHzZJ6XLl2
         IhHjSNfV9efwlW4OmoJK3Q4asoZGiJjZNFmwIxD0nJyMn9TvR+PqPltasnf2N7Izx22x
         D4QoaYbjMEV9KpSadcrmfSuFgMb65oDnQdrJS0pKiQSafCZ5/CoRHF8jjnV72gu5wV8S
         o5tqzpZLeH4MmKk/L5Rw+TgPymYQs2bRHdo9r4rmG/2FWSHkOPekFw4kf6qXdU1Ks272
         ttIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435263; x=1775040063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9IUgVkMnSvSpiMpIQOwgKjrrKDZg8TzP8a6gJHM7DE=;
        b=e8lVpZrwhQh36xjRcNoqreLDz8CAYxVc9ervBmjeXXuC0781cJeu8FezV183Xi8uY1
         RzxgH6Ph2Cp2CpShd/XF3rvIWgl5WL83WWQOmzJEzx+OpEreKvVvCdEsTTs9CHi27H/e
         H9xjEfe8DpBXeFgVB2lSvfvgu3H2FpUYC+QQaeHiDjzoim0max7MmSY4TUVhafIGlc7q
         paz0cdKEjWyaRjMxC8dZHxNGnH3xcWZCCo6zA8IlbLn7r5XiVODTgCUPQ/6fF1l7IBUU
         hFffICfq5oZF2Wwmb0d8BJQwX61gtQ2s6nGhfgdlpeObqB0LcuJQysI1NAjIQL76A3YU
         JObQ==
X-Gm-Message-State: AOJu0YzytxEQ8jVQquwVCaOrgyw2bXTwoI30Qb+1zDXcSqLu7pLk/H8N
	Aopd2nPeWvqEaEz+i+qXMymRxY9SNVCCLWWkSNcAGrjhRCfODS6FfbZfoEYfNA==
X-Gm-Gg: ATEYQzy9wTPHlXgILRFe8tFsvzynrp7a4U+ntIRhGRgcQG5jY5Jl3nkka9fy5vRU+uJ
	sDSWm5g2N+hEdiDjMlQKssrTpp4DqSH6c9A2DqGtlskYPZHx4WfLJugalFEXg9C50RaVjl6OznC
	WVVTzlFGFKyFbCQ7ktNKSgX4rwAKfNF1tS65FTOjKM/N0ycITSvJ6WYPQFWrRkgjgAa9eVflaWu
	4FIcc7MFJ3GbpypJs457V7Cv34m4dzbrs+yx+nn99Td761KPw5LIetwT1oStD3L9LZ3IGH/KM8b
	7vsT8/pntgmQNi/1tuou75CA2X4yRmjtEUrGyVPsAnpI4CZYvoMFa4MP8Scd4TxsKTiOSKi7Lbd
	ltj0lwtzoSsPXWVPCJ+EYmndHwg/ZvCALKOYS74JItQw5qGo+UV/BueiiL+R0DjIu9eEHAP9oGt
	4IAC93ATjo58/HUuGVGdsQV+6/M3czwbniv6Fn
X-Received: by 2002:a17:907:7b9c:b0:b98:47a3:b41 with SMTP id a640c23a62f3a-b9a5420da89mr250828866b.29.1774435262349;
        Wed, 25 Mar 2026 03:41:02 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/4] xen/arm: ITS quirk handling fixes and board-specific matches
Date: Wed, 25 Mar 2026 12:38:29 +0200
Message-ID: <cover.1774431310.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774435263-B9A869D1-A6E38444/0/0
X-purgate-type: clean
X-purgate-size: 1399
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50EE4323293
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

This series cleans up ARM GICv3 ITS quirk handling and fixes the point at
which quirk-derived memory attributes become visible to the LPI setup path.

The first patch switches the quirk handling from per-entry init callbacks to
declarative flags and folds in the DT dma-noncoherent property when deriving
the effective ITS attributes.

The second patch extends quirk matching with an optional platform callback so
that boards sharing the same IIDR can still be distinguished reliably. This
is then used by the third patch to add the Orange Pi 5 ITS quirk for
RK3588/RK3588S boards.

Finally, the last patch moves ITS quirk discovery and validation earlier in
the boot flow, before host LPI tables are initialized, so the boot CPU does
not allocate and program LPI data structures with default attributes when the
platform requires different ones.

Mykola Kvach (4):
  xen/arm: its: collect quirk flags and honor dma-noncoherent
  xen/arm: its: add platform match callback for ITS quirks
  xen/arm: its: add Orange Pi 5 ITS quirk
  xen/arm: its: pre-initialize ITS quirks before LPI setup

 xen/arch/arm/gic-v3-its.c             | 129 +++++++++++++++++++-------
 xen/arch/arm/gic-v3.c                 |   7 ++
 xen/arch/arm/include/asm/gic_v3_its.h |   5 +
 3 files changed, 107 insertions(+), 34 deletions(-)

-- 
2.43.0


