Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIT4D3JSD2pEJAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:44:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90355AB349
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315793.1585484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Mk-000366-HQ; Thu, 21 May 2026 18:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315793.1585484; Thu, 21 May 2026 18:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Mk-00033B-EK; Thu, 21 May 2026 18:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1315793;
 Thu, 21 May 2026 18:43:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ8Mi-00032s-8a
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:43:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ8Mh-00CAW4-Dp
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:43:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f5238-bab6-0a2a0a5309dd-0a2a4507b2dc-20
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:43:27 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f524f-229c-0a2a45070019-d155802fe110-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:43:27 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso63483655e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:43:27 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c6766fsm42558855e9.2.2026.05.21.11.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 11:43:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779389007; x=1779993807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbY493eMuX/mj74qMbU9C0aqtJWPKXDVVYRF7iw68Hc=;
        b=ZlMCUH+7A811Vs4j54SkrULrCjhw0zs1YzthLaLg78v00B0XdSA7NKuI2sY7g3HC9/
         anXt3BXmPv1tATKXUFPeukeJsm5Soc4LctmZaIB1d3WQPYfBOc+Yip5iD69Zczcy6pV6
         UxPFfKZg29WgndnQWLI3ev0eEGPn2GgFwUaU+mKsfzdT0j8xU8CS3B6vLssyshXUxbfx
         OiQCtdVJtYO9sY4UNDwB0Rqt0dkmW6IeXscgVOo4+S/GBXrH0YyJehRBgTXd7Ujp7HyF
         i5uBP+SsSDzpj6VeEG0iM2Tzg658XqscKo3bSEIvkc8Obr9W0UhYGi8GDrm4E32e/hzR
         7oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779389007; x=1779993807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbY493eMuX/mj74qMbU9C0aqtJWPKXDVVYRF7iw68Hc=;
        b=Fy68SVJ9FDP+X37UDz+y8wTrINmP7gBxSxv/Rp2BbxVvpOTSMp85iWo0w5YrWq6uFB
         Udb+1vsD7TVmq/P2vBY+nP6r5/1LnMLcRERz7xaYPQ/Eyc3n4/MmDaYqCcM7Bu+soIsA
         cw+NINCX1zH0rRgyt4xfnc2CXCd5feYk8oLWHB3wQ/LP3XOBoLJ9yE6WvRH/865//yIZ
         0rXPyOzWUWf7fjic0Jcwn18raDspBsf/HsmiEbfah8a9w08dBWxhgWMsNUKsFn2E6Hva
         VA618kUAyoX+FjXxGHkt8qzucwO3+GQEDvJXnIBgbxdwnjI9wNUOzo0Kus5VjwQXEs23
         4uYQ==
X-Gm-Message-State: AOJu0Yx+suZjybVXmNnMAi4o2Zfx6dO7HBdU36NlVYAPslVrgTyKPAN3
	6MQdgrbo6FRynSGjtYIQB93v8Bjd4G5xZRKV29T8v/RhY6MbSCiQ0JraXl4C9p7r
X-Gm-Gg: Acq92OE6/d31n6MCaxXiW7qBMbnC+yKh5kSejvHSo3KpIMJG5zFqlop622wRDKQooME
	VYb8OFOI4NGeWmz8ocZQLON5KbEhzXgteDyFd0P7o6UZ5LhGnEdmemvPtwdPdf1U4Abhr8IZYYr
	WZeeMm5Jl328CywdC/7ff/2gP6DpHoumKVRZrZBMA7ZZNEb7yzTFFaFpIJiCYOYjvsZIjEOAt7C
	gFIxoad1wYbuAvB1nRDRXxP6nJqCpKie/UUH7BIByH3RnyYDCUDpXvu3RtTaFDCirMrg+S1DMfP
	Rzt8sd+2qIuqcWRKOPBCVml27FT7I+2W1jzCq2aVnyZ9v7k1bPUz7YV1vl4k5flusOh8VBN3h8P
	q8uH65DZXJqatJs+xJ5fTPbKDIapdKoE8y2V1Ys71NFt0cybKdlqHQIAuO6ezsAkW/nnqjYqB2R
	08enuvNAuJY1aqrFCN9y5s47Xh/Q==
X-Received: by 2002:a05:600c:a15:b0:490:3cef:bd90 with SMTP id 5b1f17b1804b1-4903cefbe6emr44243195e9.26.1779389006562;
        Thu, 21 May 2026 11:43:26 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>,
	Luca Miccio <luca.miccio@amd.com>,
	Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] xen/common: llc-coloring parser fixes
Date: Thu, 21 May 2026 21:41:20 +0300
Message-ID: <cover.1779388510.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779389007-28C7DC48-EDA8C3E4/0/0
X-purgate-type: clean
X-purgate-size: 1145
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.miccio@amd.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D90355AB349
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Hi all,

This small series fixes two issues in parse_color_config().

The first patch makes parse failures leave the caller-visible color count
at zero. This prevents a rejected command-line value from leaving a
partially parsed configuration behind for later init paths to consume.

The second patch rejects empty color tokens. Previously, delimiters in
places where a color value was expected could be interpreted as color 0,
because simple_strtoul() returns zero without advancing the input pointer.
The patch checks that each parsed color value consumed input. It also
fixes the DT color parsing error message by adding the missing newline
and including the domain ID.

Changes in v2:
- Clarify the first commit message.
- Include the domain ID in the DT color parsing error message.
- Add Reviewed-by tags.

Mykola Kvach (2):
  xen/common: llc-coloring: clear color count on parse failure
  xen/common: llc-coloring: reject empty color tokens

 xen/common/llc-coloring.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.43.0


