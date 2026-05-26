Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAI0LFdrFWrxUwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950E5D390F
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319665.1587125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoK6-0007Bn-PA; Tue, 26 May 2026 09:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319665.1587125; Tue, 26 May 2026 09:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoK6-0007AC-M2; Tue, 26 May 2026 09:43:42 +0000
Received: by outflank-mailman (input) for mailman id 1319665;
 Tue, 26 May 2026 09:43:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoK6-0007A6-5f
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoK5-00C7fR-Hn
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b37-e002-0a2a0a5209dd-0a2a45049844-48
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:41 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b4d-1dec-0a2a45040019-d155802de0ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:41 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso27525345e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:41 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788621; x=1780393421; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8y+d132LDfDZPbn8fBN0QhoTD5vF+0K1wLV8S0R4KmY=;
        b=TRsiv4An/MO4+SAkGaqfAS758tDvQjKhQUGDdQVATU6qMih5Xn/vZ402Ip3urfDnKk
         QoCybAHY0BchM/v91nIVnL3udxXR7iTW5Eu44/GDS0AnGtoeiELSjy9fMxPOpivgffoQ
         kuloQiftckgqc0nvpads57n2gnLJo3JWQPojJ1HaF61GUH4xpBQ0GcwJVf93nlVjVL4k
         p78Yki9YqAtOf1YK+MBldVuLifw/2xhkj/DYKb+VVCr0yt5RKhLCSeCFA7vpwzemTaQ9
         ey6ZQ4M+m76YNejeFhEbUh6ktg3igVCqkmtev8kGJY+8xd/l9BmQoJqJTn+mMYaYlvfZ
         Ud1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788621; x=1780393421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y+d132LDfDZPbn8fBN0QhoTD5vF+0K1wLV8S0R4KmY=;
        b=MzK0VAvz9KMOBKSwpfI4IUmveuwMRAQusPvU6DpP/U5razNNn11CvUIyzJ1i1IrbJ5
         kLUWaDw979adbr5MAeBf+2h5SVT3bjnetMYb/F+WVwbzHVeubSbibK0xAskjdPPo8Dq1
         HixRDeVdSOnGZn3KlJZTxADUz9FL5x7/F4/PuTZz4t0oSD0ihpSIimfLx1T8zQ89Tub8
         9T8Ji7T4kVR0mwbQ+8kX31Q5QalIQ8EKRpOEJ7CRjcSWi3r5xXnQh90pI/AejRuOxBmJ
         q+QL7OP41yrHo8qWekHn1ZgfqOFogkNzubSUXg76qQSuDqBBj60KousTcFSeBg54hDRx
         hd4g==
X-Gm-Message-State: AOJu0YyR3JLugXLPazFmFZH+I8nTATZykyvrUp2SAxyEF5+YXTuMNiUe
	xNCVssSqNIK8XULi8mxfj1g32P4sPiIkUXj0IyTlhK6JexwU5Y5lnA8DeUAWaLym
X-Gm-Gg: Acq92OFksFiu+3X7f4ajXWDNGgv/epC13P2SExxTxpgsKk4cRe5SC/497j4Ur3ktidc
	HLWkWPX3RYxDGPP9Y4o5UBX6A5rhdTMgHFkHf2Llvpnv/7hsuphiiazKMTsvo8+ObReMukta32P
	YB6Ui7TvHVQDZhrTmh2IqPezgGvpFFCpad1ThRRJRkuJ+1HDp++VfUu4eX2/Ztw30Jnaqj3EfCQ
	yDJOwJrL0pIJM2qBSNbLmCCIX5HMHpVvc36zi9v8RbhJZZ4aEfeUemskeQmVmAHOFDuWikHFIP4
	RSSpzB4L41wjWUQlOALyU1WPA6D/QmSucs5uhXEEapXdTqA7kjCAUgWBNPt/Rz4bLcv97RM1pAE
	1odNL93kyReOQ8Zn9+GSlhK94+2ySYs2IIqMAYovF5ZVMPH9fMYXKQ8m4PqHGIOSCyXnIzTDKsE
	kxv2cOJZmrq8bPjxw0HO2VTGrXd+V1ulH29OjlpSpHYyl9stCb2oAablzuLMj+PF314hP76Wfbx
	Qn35AaknVBzCmAg2YhM2VDjzg==
X-Received: by 2002:a05:600c:4510:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490428ddf15mr277061195e9.28.1779788620685;
        Tue, 26 May 2026 02:43:40 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/9] Minor xenguest optimisations
Date: Tue, 26 May 2026 10:43:11 +0100
Message-ID: <20260526094324.12286-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779788621-285703FF-44400F57/0/0
X-purgate-type: clean
X-purgate-size: 1471
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,cloud.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7950E5D390F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce some number of parts passed to writev.
Avoid possible allocation sending data with writev.
Reduce number of allocations sending memory state.

Changes since v1:
- add commit to cache up to 4 pages in hypercall;
- add other 2 commits reducing chunks passed to write/writev.

Changes since v2:
- update patches commit prefixes;
- add other 2 optisations.

Edwin Török (2):
  libs/guest: allocate various migration arrays just once
  libs/call: cache up to 4 pages in hypercall bounce buffers

Frediano Ziglio (7):
  libs/guest: Reduce number of parts in write_split_record
  libs/guest: Reduce number of I/O vectors in write_batch
  libs/guest: Reduce number of I/O vectors in write_batch
  libs/guest: Use a single write_exact in write_headers
  libs/guest: avoids using 2 indexes
  libs/guest: fill directly iov structure
  libs/ctrl: Allows writev_exact to change iov array

 tools/libs/call/buffer.c         |  28 +++--
 tools/libs/call/core.c           |   3 +-
 tools/libs/call/private.h        |   8 +-
 tools/libs/ctrl/xc_private.c     |  26 +----
 tools/libs/ctrl/xc_private.h     |   2 +-
 tools/libs/guest/xg_sr_common.c  |   6 +-
 tools/libs/guest/xg_sr_common.h  |  12 +++
 tools/libs/guest/xg_sr_restore.c |  26 ++---
 tools/libs/guest/xg_sr_save.c    | 169 +++++++++++++------------------
 9 files changed, 128 insertions(+), 152 deletions(-)

-- 
2.54.0


