Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFBCF56dnWnwQgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D231872AF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240002.1541466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurni-0003hu-A4; Tue, 24 Feb 2026 12:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240002.1541466; Tue, 24 Feb 2026 12:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vurni-0003g0-77; Tue, 24 Feb 2026 12:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1240002;
 Tue, 24 Feb 2026 12:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9vI=A4=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vurng-0003fu-6N
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 12:46:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c71f52c4-117e-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 13:46:03 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so3409206f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 04:46:03 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43987f3ed03sm4803236f8f.16.2026.02.24.04.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:46:01 -0800 (PST)
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
X-Inumbo-ID: c71f52c4-117e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771937162; x=1772541962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+JSST3SfePXF4/ny/1upM9uPTqBG61Zto5cE0YSFpM=;
        b=b5u4HGsw6uVOykG+EMykHTV3z4llh9r+cIezmrdWigJXhqHlq1h+Fka4t8M9t0dlGH
         fkp1NCW+uMJRzZTdlpvgw+0F1wET0UWedWxi+Y8TfhJuEvFW16P07CiQKva1C9ubP6z5
         jBsrvzK/EjUYVGYFKo4I7mSiWjMhoX2tkDBII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771937162; x=1772541962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+JSST3SfePXF4/ny/1upM9uPTqBG61Zto5cE0YSFpM=;
        b=pMHlbDe+lW0kdHbwEFIO9hta8IeEZZaTi3Ogxc94oWaUhja34ILfFDlUUnqSRxxeXa
         QKQyJt+EnFABIJX9Fxk3LgKT4Rh19zNn9F4Ce/tTMZT+o8Pin5OuNo7fAkfzyGr0+S2k
         GcK6bLuZdp1R2UKl1PE/a94lBzmUyVcdtCtD1efwGRm9xcXuRtJKOYujWMaJEdBfXKtw
         RABxf9F38a7l6MV/AMEvhfV061ZL0gjYBvSoede6tcwH1i4ujXGW+9Pms778GOWC2Dev
         fXtiCv48+s6N+61UGI24Aj0ys/iiyAMW93f1QmJNsGgD4YZLFWvfupEndOP1zpTDSjQ0
         Ru9Q==
X-Gm-Message-State: AOJu0YySuKfGb975TN55f2Cj2O4bRnQypxJIqlylxdWVFCmJP461MA47
	UEgwZ7csBC1i6YOCuBzc0ueN3rV5QzFwgY1rY08MJyTpTuoYJ8jGVxHzG/RxljE/wP20FDz6zmq
	t/vQvSfpzaQ==
X-Gm-Gg: ATEYQzyUS5q3oZqFVKNFmdKgJ7uE2Gy/dmTjNgpj9hjs0TYg61eRPTqCQP/6VwbBZxi
	FVsy5uTRf+iunWlnSEQ1ctlKgFxmaXCOXtjzQvseo12QqmPDkb9C10lReKDIERB8+94PXk7lDTr
	0JoVhVcR07MrWOS5X0tthwPsmgociPd7gpz6L77Zlya4EV/ydnHvJC5uHdfJz6Sj7RssomFwdlV
	ayHYtsuojgVkqcuf/fEDt+hTZX/dc965IlqEItKp/TpsMyguxNQ23UTBmx94xaj7lciJ6N03Oy+
	oVuFD/imVcdI0UGbBSYjETMKWBqC/Y6dpb+3U3T4lbb7YtrYVgKN86uoC0Q7U4eET4msAl7E+6e
	in0atVduZO947kO3hcn2hVwtgVnPErmoMvwUdZmg0tLft/kggJ+w2QjqxzWgjgMuaC8kwk1747g
	4T/IPsl9FJJXm+0DNnYmG1wJs9qpPw99KdxkSMj7E8Ao/dzkisJMBLgY4v4GFvkIsToDr2RKs=
X-Received: by 2002:a05:6000:4201:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-4396f15d10cmr21102313f8f.7.1771937162112;
        Tue, 24 Feb 2026 04:46:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/2] xen/arm: Further SMCCC cleanup
Date: Tue, 24 Feb 2026 12:45:56 +0000
Message-Id: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F1D231872AF
X-Rspamd-Action: no action

... in order to make them elliglble for auto-converstion.

Andrew Cooper (2):
  xen/arm: Simplify SMCCC handling by reusing __declare_arg_$()
  xen/arm: Simplify type handling for SMCCC declarations

 xen/arch/arm/include/asm/smccc.h | 36 +++++++++-----------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

-- 
2.39.5


