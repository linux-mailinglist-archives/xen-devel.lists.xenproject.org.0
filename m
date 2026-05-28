Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGLLLkOMF2o5IwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7335EB3CF
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320863.1587970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObd-0007KZ-7o; Thu, 28 May 2026 00:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320863.1587970; Thu, 28 May 2026 00:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObd-0007Hr-1F; Thu, 28 May 2026 00:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1320863;
 Thu, 28 May 2026 00:28:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSOba-0007He-GT
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:28:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSObZ-00CjPB-St
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 02:28:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178c07-bab6-0a2a0a5309dd-0a2a450194b6-10
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:09 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178c19-c1f2-0a2a45010019-d155da36b835-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:09 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-bd3d7c29b4dso1773747866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 17:28:09 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm655205266b.40.2026.05.27.17.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 17:28:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779928089; x=1780532889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=havkcPvmIjUNQ6L52uTakTmu7Gyt5Yv9I1018A5p+IM=;
        b=C9ikIMdfABwzNxPOqQ4rS/w9HoG1NQPormVueq0HeLWejvEjdFhjbhc5TZwBd8cJno
         QQW+Fm/DMeUu9w5Ho1cDZFjjRgHu7/G2YfT8ASYYY/F9h8Et0fMeqb6bi/sazo7TZT9l
         P6dXaNBfSzastNbZNv694YCLMooE82YDv3GKgevOo0DdbM9ALLOkhHgro66k49oUswLM
         oXGlDU6FQHqKmWUexmyUxmrwp0UQqlDs8O9UDSxaEzSK3vW+ZmJd7241rnPyQg1y4tdE
         gTwnnKPjIZgcSxXFZHxBJyIv0gytKLhrSSKEno4A6gjG3VTXqrJCLw35s6AK9rjBwg10
         O78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779928089; x=1780532889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=havkcPvmIjUNQ6L52uTakTmu7Gyt5Yv9I1018A5p+IM=;
        b=oODYo5lhoIYhVUVjYaZyBUiLfHGfYvEeDwlPnxkGcXX0jqhTKFn4pu1QmR5OdlzBeF
         60BAvYsCvUc5Qq8cUD3t+zLRvTWWZwCWVsAwAPaOC7RePi11Jel/zVcaG+R5noWODQQc
         awwefykv2OBco0EM9VLXa2iaqnOhnLUyzHazKzhpbrnEnsDaevlt01ivY+QRu27veW4j
         QE+tCfas8CnPAB0o1FAmwKob8TC0adG8DYrnzKzHR5tcjzRESsXseI2bNopAWyUVrf1l
         83enrAF57JCVABrFgHmyWQJl7dWL1Fb+07htKu64DNMAwqKFcQTM6CLhLM6FsZJtgnbE
         crOw==
X-Gm-Message-State: AOJu0YzC0IUjDkREO1nS0ROjmIxd+ER9npCrothguvoLuf5SjX4O5UB3
	Q6cTAIiMYVRVvuAXPnxqhrunAklTNiKFkpYSdnBvbqTbGDa/Y+BdyTDcHOA3ag==
X-Gm-Gg: Acq92OFJHVoP/M7nJkieq+TzKa6rYQU63dpMcOJZfIiaRxqZhGyxuuV2eCWpNaSs5gZ
	sKPlnpu8U6uR3tCw4fCFQx6GqaLGPM974D/T4vnIjA/ssVLb+o8z9r3Jg0DVPdsC4IiX16/XgfJ
	poGOiKo4gR7jnPouTLJPxTiAwXtl0cAD8KcDDI/Dbq/ULVlE3ToviOAXMx5YuCET4bnIEy9IRIK
	VFZCI1HdBZnUksdbta/pIx+xw40JlvfTigcmgDT3h6L/IyDhHXebw+Ld2epWQgUtrcfyVLP1ejA
	PywDBSmorPXodTKV75RAxSRp0c2yc0TkXCsEVWduQGKSnOUzyBN0NCPoKLBWM4J2a1s3hMHS9Ee
	F99iq2F9MuviqESAECyS1UkO3rzkns/OytuZkAQvI1kWqV+NsufjyIwxLZfG7fbI84HuqsO7NFQ
	rtk4pT0Ut1gTVlzoWAEQ/McwP+bxgRioczXvSBMyk+9GDcaQE=
X-Received: by 2002:a17:907:9729:b0:bd4:8b66:c374 with SMTP id a640c23a62f3a-bdd22944971mr1442622166b.9.1779928089236;
        Wed, 27 May 2026 17:28:09 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 0/4] xen/arm: gicv3: defer host LPI init and split ITS/LPI quirk scopes
Date: Thu, 28 May 2026 03:25:48 +0300
Message-ID: <cover.1779922874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779928089-B6342FF4-CCBC408E/0/0
X-purgate-type: clean
X-purgate-size: 4421
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3C7335EB3CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Hi all,

This series fixes the ordering of host LPI state initialization relative to
ITS quirk discovery, and then cleans up how ITS-private and host
LPI/Redistributor quirk effects are represented.

Patch 1 is the release-critical fix. It moves host LPI initialization after
gicv3_its_init(), so that the host LPI allocation path observes the ITS
quirks discovered during ITS initialization. This patch is intended for
4.22.

Patches 2-4 are follow-up cleanup and DT attribute handling. They are included
to show the intended direction and to avoid carrying the old global ITS quirk
model forward, but they are not required for taking the 4.22 fix if the
release freeze makes that preferable.

The main change from v1 is that this version no longer tries to pre-initialize
ITS quirks before host LPI setup. Instead, the minimal fix is to defer the
existing host LPI initialization until after ITS initialization. The follow-up
patches then split the quirk state by scope:

  * per-ITS flags are used for memory/state accessed by a particular ITS, such
    as GITS_CBASER, GITS_BASER<n> and ITT memory;

  * host LPI flags are used for shared Redistributor/LPI state, such as
    GICR_PROPBASER and GICR_PENDBASER.

This avoids relying on an implicit global aggregation of per-ITS quirk state.
If an ITS-discovered quirk also affects the host LPI/Redistributor path, that
effect is now expressed explicitly through the quirk entry's lpi_flags.

The series also handles the DT dma-noncoherent property according to the node
where it appears. An ITS subnode property affects only the corresponding ITS.
A top-level GIC node property affects only the host LPI/Redistributor policy.
The property is not inherited implicitly between the parent GIC node and ITS
subnodes.

The Orange Pi 5 / RK3588-specific quirk patch from v1 has been dropped. The
previous version modelled the issue as a 32-bit ITS addressing restriction.
This version handles the relevant non-coherent/non-shareable GIC integration
through the standard DT dma-noncoherent property on the GIC and ITS nodes
instead.
---

Changes since v1

* Reordered the series so that the minimal host LPI initialization ordering fix
  is first. Patch 1 is intended for 4.22.

* Dropped the v1 ITS pre-initialization hook.

* Moved the existing gicv3_lpi_init_host_lpis() call after gicv3_its_init()
  instead, so host LPI state is allocated after ITS workaround discovery.

* Checked the return value from gicv3_lpi_init_host_lpis() and made failure
  fatal once the ITS/LPI path is enabled.

* Replaced the old single global ITS quirk state with separate per-ITS and
  host LPI quirk scopes.

* Removed the implicit aggregation of all per-ITS quirks into the host LPI
  policy. Host LPI effects are now expressed explicitly with lpi_flags.

* Kept per-ITS flags for ITS-private allocations:
  - GITS_CBASER;
  - GITS_BASER<n>;
  - ITT memory.

* Kept host LPI flags for Redistributor/LPI state:
  - GICR_PROPBASER;
  - GICR_PENDBASER.

* Refactored ITS quirk matching from fixed IIDR/mask fields to a generic
  match(hw_its, data) callback plus opaque data.

* Kept first-match semantics explicit. More specific entries must be listed
  before broader IIDR-only entries.

* Added a reusable IIDR matcher and used it after checking the Renesas
  machine compatibles for the R-Car Gen4 quirk.

* Split dma-noncoherent handling by DT node scope:
  - ITS subnode dma-noncoherent affects only the matching ITS;
  - top-level GIC dma-noncoherent affects only the host LPI/Redistributor
    policy.

* Dropped the Orange Pi 5 / RK3588-specific quirk patch from v1. The
  non-coherent GIC integration is now handled through DT dma-noncoherent
  properties instead of a Xen-side platform quirk.

Mykola Kvach (4):
  xen/arm: gic: defer host LPI allocation until after ITS init
  xen/arm: its: separate ITS and host LPI quirk scopes
  xen/arm: its: refactor ITS quirk matching
  xen/arm: its: handle dma-noncoherent on GIC and ITS nodes

 xen/arch/arm/gic-v3-its.c             | 171 ++++++++++++++++----------
 xen/arch/arm/gic-v3-lpi.c             |  66 ++++++++--
 xen/arch/arm/gic-v3.c                 |  14 ++-
 xen/arch/arm/include/asm/gic_v3_its.h |  19 ++-
 4 files changed, 190 insertions(+), 80 deletions(-)

-- 
2.43.0


