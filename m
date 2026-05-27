Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBxJKPP5FmrUywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143045E5875
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320490.1587758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErl-0005zJ-7x; Wed, 27 May 2026 14:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320490.1587758; Wed, 27 May 2026 14:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErl-0005xN-4t; Wed, 27 May 2026 14:04:13 +0000
Received: by outflank-mailman (input) for mailman id 1320490;
 Wed, 27 May 2026 14:04:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErj-0005xA-8v
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSEri-00DMLi-KS
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9cf-bab6-0a2a0a5309dd-0a2a4503c63c-36
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:10 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9da-672d-0a2a45030019-d155da30d476-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:10 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bd9a71b565aso1401573966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:10 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890650; x=1780495450; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAYTp3YLYHc7rNj/43RIw8vpoUcMd82B06aT0BnHByQ=;
        b=M86DbGW256t5IwS71KbS65j53ydJgrmD8o4I003Ks7TbRhI4JHURrQ9RQURHQsNG9+
         P1S8kWDxRxug+lKz0er3+w05Wotw19h1Scu8MoPTb3G2OhKt4sfO1990CGePtd6b9lZj
         ows8zj7QfP35R+CbwC5qf9hCtaEZhw85Up8o2kOPU5NRt8fvzmGDcFZdENgiFth5zjD7
         rX6B8E6KUfJ8q0XIholctm3wHBi181IOhvvoco+YRTI845BxCuNgG8MmyK24NONy1Dmo
         tCIwDQR8G7WlTrBdFVY626/UoI4RU/30nVPjVsQmtCMFYUc0oc1+aA9IjibgSytNjzSD
         iRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890650; x=1780495450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAYTp3YLYHc7rNj/43RIw8vpoUcMd82B06aT0BnHByQ=;
        b=cqujUQ8oTeBBTxmjkqenf1I1FyDx81L6aL1YSNE/ox6b6cOWMmR1SDuokf/HvMZY0D
         WbS0/4a0lBB8GXOFy6UEcMKJnUpN82FZ3QpEXy0inuhW2kR1VKdzE0jBgnUnCrlqnmU7
         26acIxZPfgOHllIIbd8smXeBOOtjKv3gtoea8OSy9ssK0OmVdiPQ9+dCIOrhy5kMi2Lc
         MSNL/+w7SlQZRSe0XzIBzGHFKMhb5/WOHmLcXs8Yk2Xss9FV53j7kj1B/k4vWZYqFSaR
         YL4uUpYtjebN2Xws5otFpjTjvpT3q+ttMaNPg/ytg3Wo/cBk5h2kHxa9liBGeFi5+ZjS
         ptiA==
X-Forwarded-Encrypted: i=1; AFNElJ/UFTaKPIoZHzspZui5z31c/0MPvXHQdo9rn9nSwhY/NtdjSQnlGF4h53tmLI7H8QlqsXU6tj6TrF0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs20Ufjku4xS7QAQ7W+rVU6xfvH+2RMJ7phO5D7rTBH/k5Avh7
	LbyTKHG/kRNMDBgO9gaNSzZrvSFrpU4V8N9amDGBAnJ/jnqZ4HyPRi6imgrraNXK
X-Gm-Gg: Acq92OG8RuHTrBqiqesO3e1y4JeKsOdfrLDEUgNPFllNErdVmZbpmhpjK18E3WvBbg1
	N0TyUj8FjxJi1LTpf8iudrUxJJJHDjilpHXyP+IK6lvkhr+re56KUHQVyJdwI2msgNao4D+t/cP
	Pi0UnSWqaSgtZnG8zel2769C52RapKJ/D9ORZL3hKGscYXjNqDMFKjfdO+XWaN7bGDXfIUrrUCL
	JzcIoAbczNMBAt5tpBBq8bkiSUhLATNGYOTPleSs+bKn9BppZ54y/6nsKt95v/d/A5/nX0N4pHW
	Kl4W6uM7HCfUq5hiDu3s4GKAFRL2MD2aDmdrb8tycAi5NR8LzLWWA6zn051sGDdo22D4qGakV59
	BFIdHHxmWRiUkotD4ZcvSLmbrXG+E2pybXYHR6OLBcN4KYchmMG6pHpOz+M544e5t+yNxKUi6aP
	K4DXZFBuyNr2zRz6I82km2ctZ0cDlPahaGgO/F2vb5b42ngHePhly7zx/FWtM4E9UWPsiJPeCbV
	kq/DeBXuL5yWlJ+iTW45Z2VcjPUG3fqrg==
X-Received: by 2002:a17:907:b5a3:b0:ba4:f501:cb8b with SMTP id a640c23a62f3a-bdd22f294a3mr1037575166b.16.1779890649230;
        Wed, 27 May 2026 07:04:09 -0700 (PDT)
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Vishal Moola <vishal.moola@gmail.com>
Subject: [PATCH 0/9] Convert x86 pgd_lists to ptdescs
Date: Wed, 27 May 2026 15:03:07 +0100
Message-ID: <20260527140316.294621-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779890650-3977E938-12FA18A4/0/0
X-purgate-type: clean
X-purgate-size: 1840
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 143045E5875
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This continues the ptdesc conversions for x86[1]. This is a necessary step
in preparation for the separate allocation of ptdescs from struct page.
Once ptdescs are not wrappers, the pgd_list should be used to find our
ptdesc, not page.

In fact, after patch 4 we can successfully boot a 32-bit x86 kernel
that separately allocates ptdescs.

All of the patches are rather straightforward, I just kept them split up
for ease of review. There are no intended functional changes as ptdescs
are currently still wrappers around struct page.

[1] https://lore.kernel.org/linux-mm/20260211195233.368497-1-vishal.moola@gmail.com/

----------------

I've compiled and booted both 64 and 32 bit on a kernel with separately
allocated ptdescs. I ensured the codepaths were hit for all the changes
except Xen.

This applies cleanly to the tip bot. I'm thinking this can go through
Dave's mm.

Vishal Moola (9):
  x86/mm/pat: Use IS_ENABLED() instead of ifdef
  x86/mm/pat: Convert __set_pmd_pte() to ptdescs
  x86/mm/pat: Convert collapse_pmd_page() to ptdescs
  x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
  x86/mm: Convert sync_global_pgds_l5() to ptdescs
  x86/mm: Convert sync_global_pgds_l4() to ptdescs
  x86/mm: Convert pgd_page_get_mm() to ptdescs
  x86/xen: Convert xen_mm_pin_all() to ptdescs
  x86/xen: Convert xen_mm_unpin_all() to ptdescs

 arch/x86/include/asm/pgtable.h       |  2 +-
 arch/x86/include/asm/pgtable_types.h |  2 +-
 arch/x86/mm/fault.c                  |  8 ++++----
 arch/x86/mm/init_64.c                | 16 ++++++++--------
 arch/x86/mm/pat/set_memory.c         | 17 ++++++++---------
 arch/x86/mm/pgtable.c                |  4 ++--
 arch/x86/xen/mmu_pv.c                | 22 +++++++++++-----------
 7 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.54.0


