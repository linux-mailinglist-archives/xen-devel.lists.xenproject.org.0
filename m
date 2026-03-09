Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN4zFhkTr2kiNgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF323EA7B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249618.1547074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfS9-0007Lb-29; Mon, 09 Mar 2026 18:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249618.1547074; Mon, 09 Mar 2026 18:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfS8-0007JM-VP; Mon, 09 Mar 2026 18:35:40 +0000
Received: by outflank-mailman (input) for mailman id 1249618;
 Mon, 09 Mar 2026 18:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9QdD=BJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vzfS8-0007JG-2d
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 18:35:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4ee7ce2-1be6-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 19:35:38 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-485410a0a8aso4452585e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 11:35:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541a8f610sm17524365e9.7.2026.03.09.11.35.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 11:35:37 -0700 (PDT)
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
X-Inumbo-ID: c4ee7ce2-1be6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773081338; x=1773686138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+n1XzLbQai9WbGm/ckfBsm2uzsateK7yt/Qy3zcLsM=;
        b=ltdYM5GRBPvcUWccVtgEdcxuwdM0MP21lQ2akTanFceyHcLeciBFPNM3K1wurjmAk2
         vSiijYb/Uo/W6IUhltZP+oScbMeblkZpBx4VJOu1miYrZToCoyMA+x2JtrpKp6NxWVlR
         +3N5mtbufR+DYv12Sd0ayHjPS3O/+obuDuXpHEjXalajJStnYkQXpD46ZDwnONJhcryP
         X3hvs+67hw8PYaGO2ZANOGfp8eQRa937iu5+SjtzLkx4HQ9HonnTQBxscel9JCGz2yav
         Ea/ng0y/ZSxri/AabUtkcNSD1dilzWHin/ypOgGpaIeOThjecss2Je8S6E08KgqzbEcW
         u/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081338; x=1773686138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+n1XzLbQai9WbGm/ckfBsm2uzsateK7yt/Qy3zcLsM=;
        b=pOzVbjKufq+q1s1HzLj5mc4COA4AXXuT/RrgbC9Ajng6SOyzdKUgAkI4vZZ3J9yxUL
         Mbmv9M5L+f0GWwiBPoV8JiYgrrCpNkhOrKGNikH0cT/ipUuK89T1+OfVPcgsv0bvqKDD
         5x+7HoE/fQFyQ363cfi0dfzthakFKiSq0oT6h+Xhccknobnh/RP421SWPK3Tvtx6KM4j
         UOs8y1uZnYFifrbEKVCPffB0EE3EnDOK+6uHiHfVcV4kGB7NwNI+bmf8E8XBKblfUjGz
         vkcu4YYrOYEAQ+fwH4GldmpoRpVpn/wDnlacI4hf/WyQ9nMt03aofs20hdtLAjHhXRg+
         Qm8g==
X-Forwarded-Encrypted: i=1; AJvYcCUWncaBfa1sOs8orkWo5Cl/e217jEDJCdUwed2D7qAekeaNCJgN22xnpMh6e0PZ5gW26g/r4pi6de8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyneprXKjErEdEOv1y5EaCHShremDm/e5rxBdZ477dAMlOavWPz
	jUGM2S0XwncDgasZLgWFg3S8IQvwkmXKH8DEGKLfx9NWLq0+fck99tTMqzmmiEHIehw=
X-Gm-Gg: ATEYQzyyst6rYvWwaz38Jotd5hkDYnA5itETyynBi7OZ5Fa2WXQc6/p44oR68wOfj8S
	hbX4gptpQjVzp/kiKgGF8heTOApHsReOZHn9TcGPD/Bw3yGULS3dBJkVuaMfyMqolx3+927RKyy
	GbbdHttJ/ba/ZTlXff7vOCoEmBvG0j8nCjbuGjwOWY8anx4in+eOZdNi7Jo2EnhBg9lRJClG7J4
	XtfVLCxyxtejJlh2dDfEwaHgzXlFTXG31JDushAHVzOgXyfJeM6tu+czWrswvYYR35TFeg/Oozp
	xLpeleBGCbq8ENm7hVYxutwLTvKfGejoLTahpBG1mGeSOWsOdXMRQxxyWQCnu3Es6QgdoYTxp6L
	m8PPA7lWo5FBcmIxnwQ19LKs1uO9x/tcrxKWgCwKGSR01CfQV02MzmYBfSpm5BU6CpZETEXZDBV
	18N+btARvt5YTh5C1JgeH9PbNgZOfUwJHsM8ETfM6pJ9UPgEU25FGknuVUdWpRyKC5xCFuBQ/+
X-Received: by 2002:a05:600c:a115:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-4853b5b108emr60211815e9.26.1773081338186;
        Mon, 09 Mar 2026 11:35:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v2 0/4] system/memory: Constify various RAMBlock/MemoryRegion arguments
Date: Mon,  9 Mar 2026 19:35:31 +0100
Message-ID: <20260309183536.88976-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EFEF323EA7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[unpredictable.fr,xenproject.org,lists.xenproject.org,nutanix.com,redhat.com,linaro.org,gmail.com,kernel.org,rsg.ci.i.u-tokyo.ac.jp];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mohamed@unpredictable.fr,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:mark.caveayland@nutanix.com,m:peterx@redhat.com,m:richard.henderson@linaro.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:edgar.iglesias@gmail.com,m:philmd@linaro.org,m:sstabellini@kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

v2:
- Dropped "stubs: Merge physmem.c within ram-block.c" (Zoltan)
- Dropped "info mtree" patches (no time to update doc for freeze)
- New Xen patch

Philippe Mathieu-Daudé (4):
  system/ramblock: Constify various RAMBlock arguments
  system/memory: Constify various MemoryRegion arguments
  system/xen: Constify various MemoryRegion arguments
  system/memory: Have memory_region_type() correctly describe containers

 include/system/memory.h       | 38 ++++++++++++++++-----------------
 include/system/ramblock.h     | 28 ++++++++++++------------
 include/system/xen-mapcache.h |  2 +-
 include/system/xen.h          |  6 +++---
 hw/xen/xen-hvm-common.c       |  8 +++----
 hw/xen/xen-mapcache.c         |  2 +-
 hw/xen/xen_stubs.c            |  6 +++---
 stubs/physmem.c               |  2 +-
 stubs/ram-block.c             |  6 +++---
 system/memory.c               | 40 +++++++++++++++++++----------------
 system/physmem.c              | 30 +++++++++++++-------------
 11 files changed, 86 insertions(+), 82 deletions(-)

-- 
2.53.0


