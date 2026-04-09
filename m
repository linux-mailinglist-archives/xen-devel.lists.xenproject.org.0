Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAvsBzdv12k5OAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 11:19:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AC3C85E9
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 11:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276886.1562179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAlXL-0005Gj-Sn; Thu, 09 Apr 2026 09:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276886.1562179; Thu, 09 Apr 2026 09:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAlXL-0005EK-PX; Thu, 09 Apr 2026 09:18:55 +0000
Received: by outflank-mailman (input) for mailman id 1276886;
 Thu, 09 Apr 2026 09:18:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wAlXK-0005EE-7R
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:18:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAlXJ-000xTX-Ea
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:18:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d76efb-bab6-0a2a0a5309dd-0a2a4507afc6-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:18:53 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d76efd-ba2d-0a2a45070019-d155dd30acd6-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:18:53 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43b983bb07eso368186f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 02:18:53 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2971sm64967102f8f.22.2026.04.09.02.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 02:18:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1775726332; x=1776331132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeW50FrCL89/SWSL+Q6lRGl8B2jbdOOHYY2YroAYS5w=;
        b=vX8t6hJ4U/kL/f9D0+fCyO5zyStyzoxXgNVRGhj98Bo3ankwEYco1ymjFKY4wr5b+a
         YMC5/h7qtd+kn10wQjeo0JnKmQhjiuv/cvL/7rfeIBuaYeYxae+ciyXC9P4Ajp8JGDZH
         NQcWVGsXwgbClv/qZ6+raD7ZxiZd9ZO165ejw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726332; x=1776331132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeW50FrCL89/SWSL+Q6lRGl8B2jbdOOHYY2YroAYS5w=;
        b=LvM20OnjEn+OFALECgiiQMl5LpCmBHTsqa1eBAGBh1/Q4VmA6qChEMJ9gytxymSBpR
         Tk4AMkSuXJBuNIr1UE0VqaFIyLy1arBpVwv7jw+BD1ODUcFnbbQ+OZl1B2AaXKEwO3vy
         ivu0cVc4bgEP88Pz8MNWBy6FcPseJf1d5jhLlao8DfO+Xa3tTmp2ZeuyaK+XtiyFRC6e
         rPJ+eVPYwj5URYVDcrmZ4tXy52Sd7TD1ujF5Wm+kmfBDMlLfBPAQmUDV7VvRUn8QTzpc
         qZ1qt/5BqjcDlXpqbSYTSb0diX1CgG1VQ5NvvhjW5QcidoPPD4rH9BtepjY8FkKdm1a/
         0q+w==
X-Gm-Message-State: AOJu0YyXcMcck1tYD+Qn2gJ6D4EZIHOrvdkNi1Lf6HoQGwMBdZFTvE1C
	KK5PQ+jmpGx/Bcr0RxSpf7s3egngFwY5uQ98zi/uMXHjodwoGymKCH0/HbLy593WzK5eZ0AfrCA
	ah/rl
X-Gm-Gg: AeBDiev7xsQlG4uZtI0uS0q57KHvLR5ykSaBE9Jq9Mk//n2qxvRNctD1kneY1fA5hgh
	iL7qcizoEzaro9UAHxIYFWL7O8bZtzdwQF7NmDBR9lE1Liv2FxOkAk/4sP/JIBCfXTCe1q32J+9
	F9AmZmwO8Y45E49PbqjLoSfH92Dp2nq18K9/0ro8lsxubTo5PRUcKtlZ64nAQb1nL7B92xANRiu
	1QoZPcchUYSHcu1sVfNJuOecmmqPezdJNwpPugfPyUWwpBVi0+lXkdUwcJdCNApEayJVNihc+8g
	6e5v5me+V1fJLg4YQi/ugCRIUbBZsJASoI5sKMThOi2Ut2lOpQADedckwRBbKKS3O0wpaPaZXiX
	4/z+Nz+05gkKMVwSw+Axrk0rNTqnK+ql0mpVen1qn8Bkrkf9D1XIpHglXHQT+K3wfnIN9f+pbKt
	osuwE3Cr8P3SH27rdzwjSENuwHdZYwwP2+CokuBxFqV201AreP9WkxTzN/6A4tR0flyjqY6tGnN
	HGN
X-Received: by 2002:a5d:5d0f:0:b0:43b:3d54:3154 with SMTP id ffacd0b85a97d-43d29277113mr34409087f8f.7.1775726331570;
        Thu, 09 Apr 2026 02:18:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/pv: Adjust the save_segments() comment regarding MSR_GS_SHADOW
Date: Thu,  9 Apr 2026 10:18:48 +0100
Message-Id: <20260409091848.139077-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775726333-8B34C41E-6AAA552B/0/0
X-purgate-type: clean
X-purgate-size: 1409
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B22AC3C85E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is slightly stale mentioning SWAPGS and not LKGS.  However, take the
opportunity to make the comment more general and less likely to bitrot.

It would be a serious vulnerability for operating systems generally if CPL3
could modify GS_SHADOW at all.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/domain.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1151997758c6..592530e53bcc 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1952,9 +1952,8 @@ static void load_segments(struct vcpu *n)
  * changes to bases can also be made with the WR{FS,GS}BASE instructions, when
  * enabled.
  *
- * Guests however cannot use SWAPGS, so there is no mechanism to modify the
- * inactive GS base behind Xen's back.  Therefore, Xen's copy of the inactive
- * GS base is still accurate, and doesn't need reading back from hardware.
+ * Guests cannot modify the inactive GS base behind Xen's back.  Therefore
+ * Xen's copy is still accurate and doesn't need reading back.
  *
  * Under FRED, hardware automatically swaps GS for us, so SHADOW_GS is the
  * active GS from the guest's point of view.
-- 
2.39.5


