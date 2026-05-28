Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOnMN1P1F2ofXggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 09:57:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F275EE1C4
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 09:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320982.1588029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSVbB-0008DZ-IZ; Thu, 28 May 2026 07:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320982.1588029; Thu, 28 May 2026 07:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSVbB-00088r-DR; Thu, 28 May 2026 07:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1320982;
 Thu, 28 May 2026 07:56:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSVbA-00087E-4v
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 07:56:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSVb9-00HB53-ER
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 09:56:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a17f50e-bab6-0a2a0a5309dd-0a2a4504892c-22
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 09:56:11 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a17f51b-1dec-0a2a45040019-d155802de510-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 09:56:11 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so78780755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:56:11 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b2ba9sm11540146f8f.31.2026.05.28.00.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 00:56:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779954971; x=1780559771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPYjBEaEb+IC2SvCGYrFHDkk4Q7GQvn/RowkjsSuslI=;
        b=LvekofBOZHG32Aq3Ixu3TQP2sFAYtR0qIt4sUyos5GgVseyBOLcQ1mgv3sSZ4yVwKw
         sLZT6VTerYQ+Hvr4RfzvUkm5LhDcSz95+1ctM/Pbw7/i5ZQ9ODJgF8KtkBfPCD2akdZF
         YVvTs5CvwYBZ7t/3Uw2R6hmVdBkmYZYdywaGa/QBTMXVQcFvlGg+tuRJ40hiQPoEsZ7T
         cYHNI7ddD7Z+D5IHAbr7/WA98W9RpLmhEiMdOvECKqSbfxd2qKU75TJdJVD6uCEShiAE
         QJ6XQfqvnfSjMdNt/gMXjGczQ5QfFIWZjPTvuqQLIyvUGPEa91x6UUOpHS9xXOmBoFTI
         cyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954971; x=1780559771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPYjBEaEb+IC2SvCGYrFHDkk4Q7GQvn/RowkjsSuslI=;
        b=M4WE8VH3zcdPd7yvDm1U4DsmjrKSFTkiN2wX84zOComgeI6uCQpwoKj+eMPzxPHwm1
         eYxe5Lq6BYzxJNoLu3VTJkJA+6cmpM394aKlj2SNCjRoUJKirV882CmO8c3cbIgs5i5W
         neEtkgiIO0F/F1sqAerPo3RiLfGrbamHCfUCbigH84YiYKfOvrkSCULSN59gQ9BOlD55
         OrJtRNgx8HCleoeCEFIDY2GW0u14wSayMFlabZ0uSuo97mJLbtZcOC8EAbyl0cqSecz0
         1fzOxZI3hginhCU48pOzU3sQ06papQq0yacttgHw/t48JbwC50ncmdljzKyqiQGsJ0Bf
         L2oA==
X-Gm-Message-State: AOJu0YxxqW8fynFB8hK9zmd+2e1bcE4Sv9NzwFIGRR7ncIsDFn3kugQ4
	y8VRQWa00WE2HPuuWggpvQjX5fIEQXRMg0c1kGfidxsWjHAQSfzf47OOZ752oOhu
X-Gm-Gg: Acq92OEr+PuLonIzCMsTIrAQm3v2m54MGyPgoVN0JnqqcOYmKJS2+t3w0KiNG2DIAVh
	a8SLJ92hnLEJ7aX2qfL7obWMjqiWoJq63v5lRwiHSvdX00Iqvhht0C2Ko7ewql+uXzhOcDqTu7z
	WddchnoldAVcfmf7LSD43610Uu4NY+OrTNjOjSJe5+DqwXfcJGK6mFw66KJnht9EUy2TmIOlBAl
	9XGHfzBBWeco61xOwoHXlE3K+DvubknGmlJE/Zvgnr9mFaDsjotvugf4G/rLXOZDGBvAZmJ9oU9
	npU7gY+u/P9D+q+LWZp/qSSzVkaQz4jWZORsfm7YkQ7DF7UHpi2VvfpgsRE5v0rYOhLaofXaYQ5
	iaS0ZOXWTRwxoHHea8dc/+a9ZolKQBgJ9huiTZT+TQfLGnrnA9RaLa6iCx2ChXn3Kn9Kgwwn9i4
	CTH9xUgP/s8Oo4hMOEPIkih9SSpHjeV4f4wvm+38UJlzxe/P3hhcYTbgDBS/7Hqv3Hq4hc0wwSF
	8p+mmXDMbP55am19lXuFg9rJ4uvTZzSvU5o
X-Received: by 2002:a05:600c:4ecc:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-490426cbba2mr434727415e9.22.1779954970446;
        Thu, 28 May 2026 00:56:10 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] public/xen.h: Update page table layout comments
Date: Thu, 28 May 2026 08:55:34 +0100
Message-ID: <20260528075539.10209-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528075539.10209-1-frediano.ziglio@cloud.com>
References: <20260528075539.10209-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779954971-42F653FF-BCC30779/0/0
X-purgate-type: clean
X-purgate-size: 846
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5F275EE1C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Bit 12 was always used for the MFN.
Extend range for MFN.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 xen/include/public/xen.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 2149b8dd38..d4f238c10b 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -283,8 +283,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * if this is a X86_64 machine and four page table layout is used, the layout
  * of val is:
  *  - 63 if set means No execute (NX)
- *  - 46-13 the machine frame number
- *  - 12 available for guest
+ *  - 51-12 the machine frame number
  *  - 11 available for guest
  *  - 10 available for guest
  *  - 9 available for guest
-- 
2.43.0


