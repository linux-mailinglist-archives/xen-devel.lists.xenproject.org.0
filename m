Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gzoxNOeHCGpkuAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2026 17:06:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D255C3DC
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2026 17:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310869.1581436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOGZy-0007e1-Rt; Sat, 16 May 2026 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310869.1581436; Sat, 16 May 2026 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOGZy-0007bA-LK; Sat, 16 May 2026 15:05:26 +0000
Received: by outflank-mailman (input) for mailman id 1310869;
 Sat, 16 May 2026 15:05:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOGZx-0007b4-9O
 for xen-devel@lists.xenproject.org; Sat, 16 May 2026 15:05:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOGZw-000zny-Lw
 for xen-devel@lists.xenproject.org; Sat, 16 May 2026 17:05:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a08879f-bab6-0a2a0a5309dd-0a2a4502ed64-14
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 17:05:24 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0887b4-af86-0a2a45020019-d155d031dd14-3
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 17:05:24 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-67f7caa33easo1902124a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2026 08:05:24 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6830fc1a0b4sm3268676a12.0.2026.05.16.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 08:05:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778943924; x=1779548724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9FXWO3qS2q+ls6K0/ucjpFmbS82vXi0HetQupDqU9k=;
        b=qZOEoXdcB1QAlRAx8iKy+mLVWcVAGI7roWN3UUU3dwXlNSMElaNZAYcrOYEE0Km+xR
         LDHun3f2wj9e/W83mPtGKXPgcoY9DBvbgrC6sTRRUUfLgj8xTM/VerP37ltNy7wMpxWA
         gAWVmP0uHGYEEzVzcyLrOT3h6fUJyKdQhtSr3DiZpWG9WnZUrVVRjmXUcMIpyM6+qA6y
         5S4qxoSqh9Nb9ZSLsiIWhFe5b9UFetPZ+/DBx3GjwW/EFQnx5D16bFDbKbkzFN6Jvu8V
         Z0H8eol8H2u/xm/ST1lF0fMPk7khpPnvGZ8XtBWfOYNngBfjh400zarCb+tp48a1mPff
         oc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778943924; x=1779548724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9FXWO3qS2q+ls6K0/ucjpFmbS82vXi0HetQupDqU9k=;
        b=aluq5rglk7OV4F2d8Mi4Kn4UG+evvB/ou3ivuoYZkkz00jdNtQurGV2mzMnvXLbifc
         vKqu0a+0x3VnL4gMIlP2s8FV8Yby0/3a053ymX5WCN0guLfqYR83QcdaZwiZjxPMDpKW
         jLadC6BfIGpPJXxRyUS8NQPZiR7xNzs5x3GZSJ5Lc7C9aTN+uz+x2YWYEbcLEBIilieK
         TxAgRm/HOpVedbd5DBY0F3i93jcJx5jKvgLzRuyO09y3rSz1f5SeAHhvS+BZjCCRJWLg
         xm0WT7C2BG1A8qj8SDizOm8uje/P59vooX+UVhNPfLMEyx+nevtfzkkcxs4hWvikui3T
         0DiA==
X-Gm-Message-State: AOJu0YwqPdCk0DOfk3bDvDIxfDcqUImyy/SZLX7YNXoF7eAV9WZaRLg3
	74bn0up5mGe9vFI5z803kpmJ0dxjdAuqssmm9+Cj4PXFmMzsRa8ZbUvGFJYLAQ==
X-Gm-Gg: Acq92OHI1+sD1egRSkIYQ/mcSMzg3JjRX7VZl42XSHVPoEhdsg8pQzWqr6lXgnJyge8
	9vuIrwLtsq+guJWGq3B7/+xD01p+oQ/lTZTQDp+4xYLyKUBfy9I2w1MPExrhfhAkBSm/r3oZyle
	ee3MoxJP5grE/Wi3v6AEsAdy10q0rBIta1k76eR7+nOSo4HBtk5it2UinHMteYBg3e1iXgJjCK6
	TMtok5khcqIQvccO4bxUrWqfGmwxnsgQ/RmS+AHMZ57dNR/BeY6kraaAzRySg3M92dtHVVSe4Zi
	rUdWqx74IKyBQf5O62/uVXroplCQUbEKlurYI12R+2ccymjEhhc07Nm1nB0bk8r+HwYlc9nfEPV
	wTeT63VYlf0/P9lo8bHFJiduEZcLPKWTQ2RvSzRFPjPD5vfMereMhoNUtLBRN5BBvPxbKm7WpSX
	4DTyPSu9YEZApyuP/SmIc4lIJ9gw==
X-Received: by 2002:a05:6402:46d6:b0:678:b2c5:6915 with SMTP id 4fb4d7f45d1cf-683bd38be0dmr4218781a12.22.1778943923945;
        Sat, 16 May 2026 08:05:23 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen/common: llc-coloring parser fixes
Date: Sat, 16 May 2026 18:03:10 +0300
Message-ID: <cover.1778925998.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778943924-83D67161-F81A166F/0/0
X-purgate-type: clean
X-purgate-size: 967
X-Rspamd-Queue-Id: A42D255C3DC
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

Hi all,

This small series fixes two issues in parse_color_config().

The first patch makes parse failures leave the caller-visible color count
at zero.  This prevents a rejected command-line value from leaving a
partially parsed configuration behind for later init paths to consume.

The second patch rejects empty color tokens.  Previously, delimiters in
places where a color value was expected could be interpreted as color 0,
because simple_strtoul() returns zero without advancing the input pointer.
The patch checks that each parsed color value consumed input.  It also
adds the missing newline to the DT color parsing error message.

Mykola Kvach (2):
  xen/common: llc-coloring: clear color count on parse failure
  xen/common: llc-coloring: reject empty color tokens

 xen/common/llc-coloring.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.43.0


