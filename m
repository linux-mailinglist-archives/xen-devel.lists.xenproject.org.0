Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id usezBsb1D2rdRwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:20:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAF5AF763
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316309.1585699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJFO-0008TN-RY; Fri, 22 May 2026 06:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316309.1585699; Fri, 22 May 2026 06:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJFO-0008Qu-Ow; Fri, 22 May 2026 06:20:38 +0000
Received: by outflank-mailman (input) for mailman id 1316309;
 Fri, 22 May 2026 06:20:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQJFN-0008Qo-Pb
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:20:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJFN-00FxJO-1i
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:20:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ff5b3-e002-0a2a0a5209dd-0a2a4507c00c-6
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:20:36 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ff5b4-229c-0a2a45070019-d1558030d944-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:20:36 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so55592605e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:20:36 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm21875725e9.9.2026.05.21.23.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 23:20:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779430836; x=1780035636; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3goxrv/Y8kshOF/CZ2G/Qlx2qpoE+dQMyCjx1mFAtc=;
        b=ZrT2JnO2XoX1zxkX+NrzATyniYY9sCOT3AjLQRRWv3bRKf2YNckPH5NBw6sW1rrugo
         +XMDu2uXTcy81n3wFHqb9hZFLxOmhyhplw/FtQXP4dU2JndTGX1IN3g9mY+6qiuT0R+6
         7IYlcZrLmpRYJyBQljJzI6XRADGC6f9azFnLFvxoPsf+DnMzwuH4xa5SqV6S4i/MIC2Z
         sf2UZxIKI0ehAw00gXva5w+1PSq6B8I6Z4MjvIqZjJ7vTDsFPBXShtriazS3cuFE+OhF
         vGZdMqU10dPCws8+Mn/Zmsj2Ku3qL/3gp518lJs7OQEygurVkJrzyj05Q7Yw9hq9YiUS
         qb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430836; x=1780035636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3goxrv/Y8kshOF/CZ2G/Qlx2qpoE+dQMyCjx1mFAtc=;
        b=U1+L3a06wAZpi3CqRMwl00aw7OjsrkF3Y7itZYmFrOsjHX6EiEFgGr8Rb+XzYhdVzR
         amSVbAYv21SE/38NN4cp5E2r64MHxcgIIESNL/ku8/2OCKqVMyJMTadeR3fdZs0kuR1k
         WmIz9pNIZsck0N91dbbBzVpd1x/RCA5/9FyKx7fdZBAZh4OSyl9+Z8qZPHd9b1UoNdF1
         hwbfcQUaJ1+A5A8kAGA4hN+2YcGrqhHXruMLDzJ3XhwbFD0QP5k7u1xVQl1fkMZOZxXV
         kKm9HqR9T6HZ8hcQh+fLzdt+1fVJiM+EjsFeYa4WoCsEP95Dh55VUni3yeyMFAOqzzt8
         IiNA==
X-Gm-Message-State: AOJu0Yyq3Yp9hxCg4kK7ayP6GGWDEJMTf7OKFmYjytdFDaobMFnrJpto
	M5BsRJobtbrRz1fcOQu9yzIcZz/pnp6xxGzD3ykPjTbGtIg9uVmfjvHwASpvcwyn
X-Gm-Gg: Acq92OEAtJrB9wVN9QHE2hvFLWFvlFIh5U0MDWoMLYiiWSEjOMrq+MZBd3CJEetBCru
	mVKxxwjWm6lRe2ceP0nLpS4T4fBVfYxc0DK48wUvOcHOKqNm3wYepd+SWhiJUyBoB4ItXNnrUf7
	qLzYRoqYwNkvs5H63qF5sbny2h5Nb4Uy/2lMfzgntSi5Z6A2SCMgMqzZWKh+sS6nZ6cQd5igKLc
	n0hP2p8pwNuHJHSkb/ST949ZM9PB6ZaGHwKFAulcs5APE7bAHIpwYHG306pWFpkbqVSp8cgqbAp
	TnZFhIVnfSCZlc9MQq5HTMUBf2GvXw4ulSg0HkWBhKIpt9E9WOoS83SH9CO9JMMNJVZr2Fx892N
	oMtMIb1FMhhm1b8jSWhuouE55WEvoV6Dnu7iRMdzP9YkTB8/e2ZmUcmMhkonKFzSyNZNydEDJvF
	7kSM5+TUd/IQ0djiYSlkRNY+cLoN7AQ9hclOtJYbzEarEewsA=
X-Received: by 2002:a05:600c:3b02:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-490424b2cf1mr22975655e9.12.1779430836207;
        Thu, 21 May 2026 23:20:36 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] xen/arm: handle Dom0 vCPU limits from GICv3 redistributors
Date: Fri, 22 May 2026 09:18:25 +0300
Message-ID: <cover.1779430299.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779430836-09F6EC48-4923BBF8/0/0
X-purgate-type: clean
X-purgate-size: 1477
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0EEAF5AF763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

This series fixes and documents a Dom0 construction corner case on
Arm GICv3 systems where Dom0 uses the host redistributor layout.

When the requested Dom0 vCPU count exceeds the number of virtual
redistributor frames covered by the exposed host-layout GICR regions,
the vGICv3 per-vCPU init path rejects the first uncovered vCPU. However,
the generic vGIC init path ignored that error, so vcpu_create() could
succeed with an invalid per-vCPU vGIC state. Dom0 could then observe more
possible CPUs than Xen can back with emulated redistributors and hang
during secondary CPU bring-up.

The first patch propagates the per-vCPU vGIC init failure and fixes the
host-layout redistributor region count when all hardware regions have
been consumed. With the fix, Dom0 construction stops creating secondary
vCPUs at the first vCPU whose redistributor frame is not covered, while
preserving the existing best-effort Dom0 policy and allowing Dom0 to boot
with the vCPUs created before the failure.

The second patch documents the resulting Arm GICv3 constraint for
dom0_max_vcpus.

Mykola Kvach (2):
  xen/arm: propagate vGIC vCPU init failures
  docs: Document Arm GICv3 limit for dom0_max_vcpus

 docs/misc/xen-command-line.pandoc |  8 ++++++++
 xen/arch/arm/vgic-v3.c            |  3 ++-
 xen/arch/arm/vgic.c               | 10 +++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.43.0


