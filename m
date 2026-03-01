Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKdrJAP7o2kaTgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 09:38:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269131CEDC7
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 09:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243637.1543306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwcJ9-0000th-Qk; Sun, 01 Mar 2026 08:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243637.1543306; Sun, 01 Mar 2026 08:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwcJ9-0000qd-Lc; Sun, 01 Mar 2026 08:37:47 +0000
Received: by outflank-mailman (input) for mailman id 1243637;
 Sun, 01 Mar 2026 00:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Re=BB=gmail.com=hlcj1234567@srs-se1.protection.inumbo.net>)
 id 1vwUpl-0005e6-4G
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 00:38:57 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06e01d70-1507-11f1-b164-2bf370ae4941;
 Sun, 01 Mar 2026 01:38:55 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-5069ad750b7so28839321cf.2
 for <xen-devel@lists.xenproject.org>; Sat, 28 Feb 2026 16:38:55 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com
 ([150.136.248.187]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-507451cda23sm82758741cf.18.2026.02.28.16.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 16:38:54 -0800 (PST)
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
X-Inumbo-ID: 06e01d70-1507-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325534; x=1772930334; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GnZ6scY9RatwDOdF0bnkSG216StlRqp+YcA3P3cM/E=;
        b=cud8h2MIiL85D3gkQgS4kA0uBidWAwcpccqfgZwBMPzUW9OGUZpOMTSP5sxSY7Vn8f
         mL0ROhtCqWE3vrFOlzHIRgSCO0gU5fWx6WFdmPvlcZGvRe9l3Jk3hG1ymv0Mpk/xYLM6
         jE1u9z/27PS8vXQB5wcztcI1GzCzIqI6T8EcGOo9Ym9f3hi9XPmpN5eJTpJI9q0UNApa
         3tRN1rG6SU911YT+rCN1BsISyBYqpc0L5c807xTq/3TwrSvhk7vdWUbvpaqkXr/rah9B
         M+ta+lUQa3XCbqzr1vRCwOxDJXNFCqFQG3cFp+F67y4+MYnUWBipMfinEzTGea7GoZfV
         Wnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325534; x=1772930334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GnZ6scY9RatwDOdF0bnkSG216StlRqp+YcA3P3cM/E=;
        b=QT+akXLquTiJ2wAWhmQLh7HzANemW0WMkIuv89GvCNZ5OmpmO7WM1Uist8fg9vEL8+
         iZooAalETdz4G+fhV4r3oW7OkT4cPGJt3HSjeV2wzNcCa/IDCsSAw5YmisyqYkx3kIK0
         ZiKFsAQcSnPWUogk3GldVchDr1YYiE4oMgn0zwWXQWQ5KbSsaKhOBhBf8vClMlCnCuPF
         wfcYFaShTRU9MGOlixLSgArjJVoaVkqeO812d6kdPtGEfGStLfA6nNH+DyN/n1O17+jG
         lglH1GV34PJHh0vPMAP+5dLH5528guB0aC+IwkOVzodZSHL5vHRHnE4qDpq1o6Ae00Tr
         OHaA==
X-Gm-Message-State: AOJu0Yw4884BXrbp/e7lWZAM2bAHrukWARmatYgVR+XHO9bxRcrP0hWE
	ajVz7hlSfqKebgO47rR2/i5kMi+RjatafypwoBDMwo/cEFOtIlTGHAZ2
X-Gm-Gg: ATEYQzwxT/X+e8EaHcqK6DZ0kCSnnOckxZRrc4aS69j5QBtX/DzH0B/60UCai9TyCyj
	hAsmC+N3tFsFrVux5UUEW1jMVwZbcSUNxC8L1+YW3xKlX0vhIhuw27gGgzkya2SyV2QFibTACC/
	FLGpjEd8j8mzYRbUC82qBcKtKESydqyk2gqT9eaA5GKpX9oVxwtUuno4+8yVYlhfuut8AskXssr
	MUdLvX6P2dozEB6JnnXtKCbbDsrfhm4XA5S3+ln+NWYW0qWzKsUquIeaXzMzzWpRybcDIyN+jWP
	PZHjJGV8Oaf9C3CcIXzqtygQJ59/OFN/dnQ3RETyToaxnn1IFaOh/7obhojw0Qa/g6tD6Nskvdf
	Fe7ZcKbJALdqEgeheX+bg1vCO38G20Htr0DOboC/AKOooV1YAJuu7j4bNki9C2cHzJMWZyqjf3n
	zj+58z+ewZYOmCyMn6BiEeBh5gcGJgCz53RdwF4sNQBndmlOQRHG203H+xQ/kWFNSsdHAQEnRhP
	qvvh9iJgcs/Zww=
X-Received: by 2002:ac8:7d41:0:b0:4ee:5fc:43e5 with SMTP id d75a77b69052e-50752714416mr109988071cf.12.1772325534323;
        Sat, 28 Feb 2026 16:38:54 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 1/4] arm64: xen: add missing SPDX-License-Identifier
Date: Sun,  1 Mar 2026 00:38:53 +0000
Message-ID: <20260301003853.2504449-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:objecting@objecting.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hlcj1234567@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[objecting.org:mid,objecting.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[hlcj1234567@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 269131CEDC7
X-Rspamd-Action: no action

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/xen/hypercall.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/xen/hypercall.S b/arch/arm64/xen/hypercall.S
index ae551b857137..19c99e6bab7a 100644
--- a/arch/arm64/xen/hypercall.S
+++ b/arch/arm64/xen/hypercall.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * hypercall.S
  *
-- 
2.43.0


