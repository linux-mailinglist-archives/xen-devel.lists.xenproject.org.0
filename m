Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NLPsIBUXH2p4fQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:47:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6DF630D07
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=nnrGo4Cv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325329.1590827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUTCE-0003u1-Om; Tue, 02 Jun 2026 17:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325329.1590827; Tue, 02 Jun 2026 17:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUTCE-0003sN-J4; Tue, 02 Jun 2026 17:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1325329;
 Tue, 02 Jun 2026 17:46:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wUTCD-0003sB-Lw
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:46:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUTCD-000Wkd-1I
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:46:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f16e4-e002-0a2a0a5209dd-0a2a4505893a-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:46:33 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f16f8-aaa8-0a2a45050019-d1558032b5db-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:46:32 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso110976635e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:46:32 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e19b0bsm88089975e9.6.2026.06.02.10.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 10:46:31 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780422392; x=1781027192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHASvQZs+zF2C1SU8gUqZSMwu6r/GwtcIhf6JxzqkdA=;
        b=nnrGo4CvCVufqq5XPfvb0xn9dN6pfXGn1/dhFwPsUTXddfICPHRM8HoHJp58Cp4VMD
         wUYwvUmComH69LJRhchZAW69WBE0rELSlm2rjT8wlSjVHSqV0neDYU14CMgGKqFrtw0C
         REkJYOQ083lBxBydKqH/n9o0kI5zV2gC/vo34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422392; x=1781027192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHASvQZs+zF2C1SU8gUqZSMwu6r/GwtcIhf6JxzqkdA=;
        b=skNVOd+gjRLbUA0+frKmC7o0jNadcijGy1C5YjxL5fKJ6Mt+WkzWwQFP2LbCBg4AWl
         jWTjPQMShzPvbff9S5jZTZnfNUCXqD9hB5A5wo2vPsO2exdKrJOpEbx160bUC0UGi/DN
         rE1Mh30YIzIh0ZFFOYhz+vYDBCXFyaC5/rRb9AGJHzbaG3uwZATs9W+SwmP21Rw4uTC1
         D2+YPqZW8fKsmRagm7cXb8LqSmL9ZzfRVOcJ1B0p5f61Cab1wbKUtYdlAGoKnKAzsI20
         qsu6zrvFhkakk5B2EP0V/Vjpss91cMitaAplyDN29Gu0pimWnc8LyWe8vxQcKpc+SFP2
         pAmQ==
X-Gm-Message-State: AOJu0YxJYtGuXdVO9xxx3OOLhX2ReljxkGL9iSKzsdhmEdwqXC8W198p
	3XlWr+VHiKNkWsG4x49lgifF3mhewWzwXH1GvzuyG5Soh2Vhmd9vJSfel0xuoKtrGLzemPMJcV2
	KXn0G
X-Gm-Gg: Acq92OFLmLB0nDxfh7lxUX45+fgJq9rfQhk2RzkbP+7NSy677y9nuge7VacPapM3vzN
	EBn1CvOgMvs2S2/J2t1td4lATmJgpYWqOPa09+iRgOiSQtIUWWDvGicv7rry71SfmUr1A0YE/ic
	mycNvPPfsA+XtTnLqn/JfJYuGzWX+uEDxgQp2oLQWT8YnWFX4WdA+xvtnuTSBISd0IzSArSOlOZ
	uY83TIdp4p6dDhNTk+gNsF+GjfEMcSnecX8SkkhAZzO9MkmzD6zM3jhtf9PZ2mOHeoTTwd3tiBS
	c7Skjq4NgJwXOAErR+epaTQrwYWUyBe37fbIcM3DGafQtjvB7GFdmXnrpXQSNQmyVRh33xpYG6M
	UBEqldCBiVlPlfV+MODqZvNPC6e5e47QkJPbOr9KKyhBoHbLBE+EPuvHygeAlTLxlyFNMKW/ncL
	T+2o5gHD/TL8knHpCukZmBIInZHu1og4OENzq3TOxcq769izNIWmVdgbHsDuG5FJclffbKp80Zx
	k/aoXC82O0YKeU=
X-Received: by 2002:a05:600c:3593:b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490b5072a72mr13299655e9.12.1780422392129;
        Tue, 02 Jun 2026 10:46:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 1/2] x86/shadow: Deviate multi.h as being included multiple times
Date: Tue,  2 Jun 2026 18:46:28 +0100
Message-Id: <20260602174629.2649448-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
References: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780422392-D857B443-6F64AA09/0/0
X-purgate-type: clean
X-purgate-size: 1109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,bugseng.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F6DF630D07

Introduce a range to search for the devation marker.

This resolves a MISRA D4.10 violation.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * Use a range to search for the devation marker.

I can't for the life of me get adjusting the deviation config to work.
---
 xen/arch/x86/mm/shadow/multi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mm/shadow/multi.h b/xen/arch/x86/mm/shadow/multi.h
index fc86d7a8d9cd..3f2562d25e9b 100644
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -8,6 +8,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+/* SAF-8-safe inclusion procedure left to caller */
 extern int
 SHADOW_INTERNAL_NAME(sh_map_and_validate_gl1e, GUEST_LEVELS)(
     struct vcpu *v, mfn_t gl1mfn, void *new_gl1p, u32 size);
-- 
2.39.5


