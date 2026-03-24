Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPMmK5+DwmlneQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:29:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582E930838E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260574.1553858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sV-0001FF-5Z; Tue, 24 Mar 2026 12:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260574.1553858; Tue, 24 Mar 2026 12:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sV-0001Ce-02; Tue, 24 Mar 2026 12:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1260574;
 Tue, 24 Mar 2026 12:28:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w50sT-0000xN-V2
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:28:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50sR-008sjJ-PK
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:28:57 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2837d-2eae-0a2a0a5409dd-0a2a450b9bd6-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:57 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c28389-ef63-0a2a450b0019-d155da32ac4f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:57 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b976536806cso806493566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:28:57 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.190])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f43ae8sm638180966b.6.2026.03.24.05.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:28:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774355336; x=1774960136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/JxxBDY+KhwZWz0jMdNpGTqDW+EDXqjFu4woHI4vHE=;
        b=WpyGNX4KmwLvpTw2licwsjp6bF/zcULaIuOXeJU+Hb3NsW/H9GTZu8xC5oWXG89jU9
         zBqFsQsJ+9BZ06S9bE8DFoiEvPQkK69tDqAXhHHF8ksQa5WJQtWR5gKD69x0ssM3Jedd
         HrDL7aGxLVNARHHk4eyd5ia7/tIVpFNjVmDNFZvGOQy5bLWewj10l78T76Y9yp2vkgHD
         HzcXfiSZVLx+V3J1o0RNg6aZTYfO1rc2cZzMrU2GjZbisTYoyfgEY8h/yZP1udNS6MxT
         wdWgY32RvNjv3HJ5AGbBnDUVE7GoqU0zWI/QOUXUGHxpsx3gJGxDh97taB3TCRFhr4cQ
         FdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355336; x=1774960136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/JxxBDY+KhwZWz0jMdNpGTqDW+EDXqjFu4woHI4vHE=;
        b=g+zYilR7LtPKkr7Vnj0M7NFl1DeUKaTrVFikArz4oZBE8A5OpjSXay6Q+03Mp0zO+C
         fZHYJFZFvq/RdkgGcINjrvQVTVHkaYWWB59qtBPlvNx6J3VTqTy8PpzrU2v/kZQIa0Mg
         22p6oAtvX9la40TGbn8eJ+McEy5LCQgqmtRpWEnXPc7R9kyfSIDanfLhBaykhd80xSqK
         ge9GGGf7ewUmaVuZJIn4xvJFif7GfclhZDfsQT7CATJD8jioVIYxOdaD8KoNgAUq4LPx
         PUVJ1SkgAluWWVsqjg7fVH2kwOsQEvLRdLGnvugfsCmM/xq0hqrp2vpxvSz/pfXQAYEE
         c3Dg==
X-Gm-Message-State: AOJu0YxtNbvLwW5eFMWc//BYD08x7eLHUBwuIPYlN/nYPRnTPNjn8DQt
	7q+dsx9r8oFi58+Sh4Dp1DTR+Qs0UCPxWS7W+q7jKxbMJsAhXhxeafMMXlUL9w==
X-Gm-Gg: ATEYQzwuI5p0JWJm7Xi1vMixdnVCV66Hq+Lp+GGso9X7Q9l7VOdfRNBsdI8RWao26BO
	sn/oV4xgcEhQsqMSlq2viuF+pOAw+2fFI7piMmLnArPEiubVHwktmAX87HyQIkpIlsDbEO/jqLH
	st+bXQPGe+JF0Z4Ytad8gef9FfZ2AGIU21zlaowWKBFMEl8IKyMIjtyWOQ/WLDpHlQCGEnZdDez
	UIZVywfYCwAVa70uQ3//nhYQLncCq8R3MSPtQzvqQJYHQLmehFwhRPCyk5gYNFLvQXulx2uHoNy
	DRrRUq8Uf3ydesrBZ9kQGF4a+xo+Edjej7jC9eEqroeyZE40B2B3Es2jy9cjovqpEdNnVsR44pR
	ZDcl8dVwXn5PVdk1RU5l/j+zPdlSyt130Opvg5RGeYYtitACrvSNMpsAxe7ctG3k7hOnXBgHQcn
	cPrBCP65dnhr+VhO+1BO5dA7D7tTVBjSdXnpcoIg==
X-Received: by 2002:a17:906:6d0:b0:b98:da3:5132 with SMTP id a640c23a62f3a-b982f39a06emr859844766b.37.1774355336254;
        Tue, 24 Mar 2026 05:28:56 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v17 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Tue, 24 Mar 2026 14:26:36 +0200
Message-ID: <0ae34dacecf7268f76750f2d07982a461375f3f7.1774353053.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774353053.git.mykola_kvach@epam.com>
References: <cover.1774353053.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774355337-9B8A5112-3FAB27CF/0/0
X-purgate-type: clean
X-purgate-size: 1154
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgrall@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 582E930838E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, Hypervisor" section
documenting support for the optional PSCI SYSTEM_SUSPEND function
exposed to guests.

This function is available via the virtual PSCI interface and allows
guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as "Tech Preview".

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V16:
- no changes.
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..8e7ab7cb3e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Tech Preview
 
 ## Virtual Hardware, QEMU
 
-- 
2.43.0


