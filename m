Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAkVK8P1D2qXRwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:20:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF25AF755
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316311.1585715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJFR-0000Ls-Fr; Fri, 22 May 2026 06:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316311.1585715; Fri, 22 May 2026 06:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJFR-0000IU-CA; Fri, 22 May 2026 06:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1316311;
 Fri, 22 May 2026 06:20:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQJFQ-0000Cf-1R
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:20:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJFP-00FxMi-AB
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:20:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ff5b4-5cb7-0a2a0a5109dd-0a2a4506bd44-8
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:20:39 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ff5b7-7371-0a2a45060019-d155802ce0d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:20:39 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so95567515e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:20:39 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm21875725e9.9.2026.05.21.23.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 23:20:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779430839; x=1780035639; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URS8l+xtKjxWl9mLzqtuCFINDsdxzGnUqvmZmpuEXJI=;
        b=Xz5wPbVgBqp0rbkViHoiybbCP0hQM0ibkvYcVLyyWldMXZtzKOFnGkSO1f6lmYnVD9
         Sl7L69Odho8Dnl5XkJsond054vpAvExkxCCQZ2eEnt76GtOH151x2vPIPVWHzKrg8+UQ
         Ajrg35XqrRwEElukMSqNyh5jSmk20VUY9TLAqqk9huwBUHgpTQAx+VMb4no/4oraNMoy
         GCVEetgQ2X24X3nZA0U8B0bcePDK22xku9OWj5UCTOaq2xo2oNK4azqQ5yCw/0rYGbY8
         RYVvCRLlcZ3sxXONCh42xVIr2jfGUxlJsfCopNLM6KZbB9EFcC/t+U6Rvfb1AG+34Fcf
         VA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430839; x=1780035639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URS8l+xtKjxWl9mLzqtuCFINDsdxzGnUqvmZmpuEXJI=;
        b=AB4VjjvpCQjw/37rhc00me6I0ZKHfOmtBgtLitCM+P7Xv9uvHCqNm38Skb2f8RYQsC
         ok8jYaNSoFfL1G1nvpYQHRQPhLH+ymkG5s16wGP0IA/18FhtIIRh1digaxWx2ck6rals
         TQ93prOdemc6FfvGhh2/5+c+zI7UkkPaPzkyWIrNb3jovxZbco+MTIv9/grH6HZtmgnF
         JA36tKDMA/b3QynaVQIMCHFp7E/J8BJwfiVgV4BgHl3Q+dq0SkdPp4Oj07LrpgvrScma
         9LsECjg10MzUn+f8wP0ZRugjJdWHV4WkJG3oSqG21aDwet7h2ycPKdqqM4h6/3Sc4NJ6
         UZsg==
X-Gm-Message-State: AOJu0YwqP6SSyrapwb4Db8bN1ReEnAs0+xn8AUJZ92FClkE67BWW3LHg
	mzazWs0fhbn8HADrLIudRpLyTgNDegf3v6ST5Kk77Kfujh9/hxZW/DpwyACm39JC
X-Gm-Gg: Acq92OG+uJyATC8maxNAXhyN0Vc79tvntQX3Ll0lP9geXwhys3LEmZa1Dm3TLFQqzh0
	N+ftjy2axkqk5xFZnboFaqOaZiNS+9BGdLKyXHeCx764xpIUfntm880PhY/6iJtqULLOl5+4Gr+
	wMebpTF6SCbc4mwJHB04gm4PrVryOmA+7oXtfKq3qgiNsXT0M+lQt9BnTwbjwZiCEPfjIOamKp8
	kbhunIraligBTBtki9J8q4cOyHH5itv1tZiLO/Z3ROmiLR9yonJt3lcmYADfsZisUf/9lJGD3vK
	1In9UcvA+WIQvwE/yktj1IT6UcZoRexar1g8mhxJB0z3TMJppw0rvtClrnBOpQdikdcEVT+Nk72
	RQArKxX33mgiJ1F2zqYXpqV/DO1aihNraetMO+5q2Ak9vbBRREHtRNj2yokC4KxNCRSvMv2ahVd
	w9azb4aPJKZCB5yllnXauQhmc5Pw==
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr24091185e9.10.1779430838488;
        Thu, 21 May 2026 23:20:38 -0700 (PDT)
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
Subject: [PATCH 2/2] docs: Document Arm GICv3 limit for dom0_max_vcpus
Date: Fri, 22 May 2026 09:18:27 +0300
Message-ID: <88459940b410ceddc04bca7e2cadf7c16bd5c13b.1779430299.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779430299.git.mykola_kvach@epam.com>
References: <cover.1779430299.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1779430839-7F57ED75-9813E4FE/0/0
X-purgate-type: clean
X-purgate-size: 1686
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 53EF25AF755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

On Arm GICv3 systems, Dom0 may use the host GIC layout, for example
when it is the hardware domain. In that case the effective Dom0 vCPU
count is not only bounded by the requested dom0_max_vcpus value and
Xen's generic vCPU limits. It is also bounded by the redistributor MMIO
regions that can be exposed for the host layout.

Document that Xen can only create Dom0 vCPUs whose virtual redistributor
frame is covered by those regions, and that secondary vCPU creation stops
at the first vCPU whose virtual redistributor frame is not covered.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 docs/misc/xen-command-line.pandoc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index d46d5b2152..0a5589b24c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -981,6 +981,14 @@ The number of VCPUs to give to dom0.  This number of VCPUs can be more
 than the number of PCPUs on the host.  The default is the number of
 PCPUs.
 
+On Arm systems using GICv3, Dom0 may use the host GIC layout, for example
+when it is the hardware domain.  In this case, this value is also limited
+by the redistributor MMIO regions that can be exposed for that layout.
+Xen can only create Dom0 VCPUs whose virtual redistributor frame is
+covered by those regions.  If the requested number of VCPUs exceeds that
+limit, secondary VCPU creation stops at the first VCPU whose virtual
+redistributor frame is not covered.
+
 Or:
 
 > `= <min>-<max>` where `<min>` and `<max>` are integers.
-- 
2.43.0


