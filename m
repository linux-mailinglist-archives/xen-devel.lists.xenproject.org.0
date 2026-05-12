Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHq2Cp5NA2r63gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:56:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC28524285
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307092.1578822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpSc-0003WK-5d; Tue, 12 May 2026 15:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307092.1578822; Tue, 12 May 2026 15:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpSc-0003UW-0R; Tue, 12 May 2026 15:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1307092;
 Tue, 12 May 2026 15:55:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wMpSa-0003UE-Hc
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:55:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpSZ-00AP0L-HM
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:55:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a034d71-bab6-0a2a0a5309dd-0a2a4509d370-42
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:55:51 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a034d87-2497-0a2a45090019-d155802ae877-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:55:51 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so51665355e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:55:51 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm4361335e9.13.2026.05.12.08.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 08:55:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778601350; x=1779206150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdJbawsRx2NHWvGwQTSpYec3I5aB0xq42jCcL60C/1k=;
        b=csR8cvws7JNwxpCv2Xgx5H96fXdpChT72txAObea/RuiNp8zNYLH2q9eS2OHHHKlAG
         aBWi5a+dak/tTohKQNCjGoqt5fCDm6foPm993K3VMIL6HFAHRnEBcMDj8D9F0zzBAcXc
         GrJfZxUM+uAPm8187Joxw5GjYVH+kKbk4JaH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601350; x=1779206150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdJbawsRx2NHWvGwQTSpYec3I5aB0xq42jCcL60C/1k=;
        b=FyIXT+pu1dTuA2vJP5bY6/1j6AbSoAtj3OCDvHpoKvwQeKmGW352wBPJr5019s/XfH
         5+EWilIC9SKi/V6n9HA5ZXqcruFmd7Fi0buXY2wCXTR88SrxAz9YLSXqfIwVBsyUvGT2
         wlhe/CCAqICLrKvs7Ff/MJlozf8UVhqbudU4/I8f40UIOCiIlIMcVyH0GnUBbClhzkhd
         hNqGalWeL9m3zy4MA8vquCF6WrY6fGPoF8k2SES2mwxOsZfI9CA/2AyUCeKeW8st/Jsk
         cRaZ6ZHKqytt/q0vYSBdxmaDbZ8F3cxrIcDE8gIorqLF9f4VMiHvbaHkuKaJqO1n7huX
         r9lg==
X-Gm-Message-State: AOJu0Yy8QeXO5n7+CDJ11WjIlgKa1U7yt87zQ3EnGntJFZP4dP7kvfJ1
	kjOXgnRpkTxoRM8p5xwtYRhN4QGROy3BsjZ4DpbZ2YJT7YU8g9fDirMThfCy/MZbY+lh5ezwsm+
	UPhAqM0Y=
X-Gm-Gg: Acq92OEyOIe83uhV42wGABzoRdN25bX1JRvxcqnT8Vl5K2qwPbLGZg84xr4ThYE+JTk
	UAtBhE9yplzUbRpsVOGDJw8WI3Dd/SYZNXUe4rfK9ATnG8pD7KK9FnfxlRrrpNcIpTvX0La2jo1
	w86ogksBFwzLaegFo1cOlZ3GbAL0pg7a5P4IzC78t1ymzNbzcITSpcw7VH2znzaHki72A81QQ4Q
	vNo+bJzdLtluSr2O7yLb+XAe76P90aijX6E0mi1hkJERSiLAz6U62LBA189gJ22bwutW6sSn3I/
	r7vQNYJ0zrtmPHdALXwh1zxnWdDT2dCetwNLQNLtADrvNJIYHWehnw3li2+XgkvAPK6TmHzZlFk
	g7Z1sPW+5dGbY/x8T863V5wlzOy8wjq41INKcqcmvnlC0qPAV3YEmQqf8OEdsa0AznQ5ML8ipRl
	tBjwLaC7Z0hi0P0sF6knmPYr8yPXQ5OrUYi0/94nvpTR3vf8Rw1Ytj1zynt+EU9PxKEqW9jKQx9
	HPI
X-Received: by 2002:a05:600c:a08b:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48e51f4119bmr452561625e9.21.1778601350433;
        Tue, 12 May 2026 08:55:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] tests/paging-mempool: Testing for P2M relocation
Date: Tue, 12 May 2026 16:55:38 +0100
Message-Id: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: e3af387a-dd8b-4d58-8356-777319c7a2bf@suse.com
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778601351-4216DA53-B5ABC0E1/0/0
X-purgate-type: clean
X-purgate-size: 371
X-Rspamd-Queue-Id: CCC28524285
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Andrew Cooper (2):
  tests/paging-mempool: Misc cleanup
  tests/paging-mempool: Extend to test P2M relocation

 tools/tests/paging-mempool/Makefile           |   4 +
 .../paging-mempool/test-paging-mempool.c      | 222 +++++++++++++++++-
 xen/common/memory.c                           |   2 +-
 3 files changed, 223 insertions(+), 5 deletions(-)

-- 
2.39.5


