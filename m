Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FqJOW+yGWroyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23E604D96
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322626.1588927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFj-0004K4-BK; Fri, 29 May 2026 15:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322626.1588927; Fri, 29 May 2026 15:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFj-0004IF-7l; Fri, 29 May 2026 15:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1322626;
 Fri, 29 May 2026 15:36:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFh-00044h-TC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:36:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFh-005xlZ-9l
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:36:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b25d-e002-0a2a0a5209dd-0a2a450ceb80-14
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:01 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b260-62f1-0a2a450c0019-d155dd35e4fe-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:01 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso423330f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:36:01 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:35:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780068960; x=1780673760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg3HXLBO+yd+ORauW4PbC9LGDAXskiNfJy3pkzAKf9E=;
        b=q63tDZWp8SdzjKZ9vLupXnqhdYQmPNWFY4xittC1N7PP5AebdRyJAIObMdVm4AOEtA
         Izm6PU5xyQnZoO7So+CNAaONW8Um5SK4yikZ3A9PO97/CyMN2vyFzpXqXT8FsMkh16Au
         QxJtVv1u3xU5HMNse5ClqjmLFcmIIM6IEn+s3EAvHr0S16dvDUbEa8Rr/iC9YVCSDE/x
         y708hprYw8JeeLNAax48zN+u3UH8FMVMavK996qCzYaShK4wJtQ1ixN4GQfHXIEocKK2
         hWUCEaiT/TDlSPyAWpQIL/heL/Sg617cLdb7u96UMTOaemETZoVTOlJKw8FbNr7TWoOa
         mGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068960; x=1780673760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zg3HXLBO+yd+ORauW4PbC9LGDAXskiNfJy3pkzAKf9E=;
        b=YW9Q+xDwHlBW/EM52Ko8kV/i82ZAbdY1Q5xBosWbU+PYpXGCBWNMYi47R4/tem7bXr
         VBQ6CeubYSG0m7Lygv7njIB6C4eNHsvU3Zb2xLvF4SsvnOnWJF3ojvTl6fxwj3IzzfdT
         JrMmglNm4r2VeDi/FXg5SrqusB6z6uVVWZ7xFaqLR1z8cCaigqKq4a4RUplwBoy5k9nL
         8wInZgEV14D5mBfAh4ywx9Wvb4IQX7zv4MpgkcQmpCbu/VWZMU0CyiQ9Xs1sx4Ixqnpp
         BWyr/k2tnDng00DCb+NCPou1HqT1hc4m8uQ3XaK89as0z8NqZuIhEqtowpKLo1ecZ3PC
         2u6g==
X-Gm-Message-State: AOJu0Yzw73eI5pF9/PADeSZvuzxO3wBUEhkSMla5IlYI+gxtqGXwgx/2
	Az2o0PxhThpZpIi3UBCL8BVkDtbnibOpVGjwD1v0XGlieHatMLSh7/kyOTuKUImu
X-Gm-Gg: Acq92OFsq2KoQgjv31LpqjjiynIKokZpvjI7lHMFzstnVX3liATD/8tmqv9zq9SaRpI
	USsvkK/kBUABpAQAf9+2UNJNnMt7EfGglqwoN79YgTxFXnHwXig/YBj+cYkjpiLHO5rdvDZyWWW
	Sw5mySWxay60q0ea3h2GwIqN/AT7GRIxhDwbqi2W8ta36K8H2ckywWGahc2BQPnWoreLRQd12LR
	pwgE9p9/YsvAY9OM4vBvfzQvhO5f7JA6nwKv43TfTIrXdtaZ/NGqwnMGSs0d9ArdIPFl6ZfNPAk
	apPVFv7zy43TZ5bQM9qyPWxxo5oGkdafEDbcHHjN+YGJaRK8c2vMQZBaOYD6FmzAripyOJAY4+F
	fDH0Jx3SQa4GBx+ZkOshmHKaw19G3rPclAlslXC03jaUt0FNSlDueAk7aTFKmpBu09aqVy5WR+j
	DqqZaAbwR0c6LDbLv3IN/qeUOJk4C3bfL7WbK0R7TFesg82U+trqeuIylZQPonntLrhr2s+dTPp
	veIRfgPJ5u1zHjl69iw1uurKC6Y0bAx7ds8
X-Received: by 2002:adf:e510:0:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-45ef6b1f0d2mr578264f8f.14.1780068960367;
        Fri, 29 May 2026 08:36:00 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/6] Align all sections to 4KB
Date: Fri, 29 May 2026 16:35:27 +0100
Message-ID: <20260529153531.1341542-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780068961-F5386CF5-ED813B1B/0/0
X-purgate-type: clean
X-purgate-size: 1086
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid,cloud.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BF23E604D96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Required by UEFI CA memory mitigation.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/xen.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index c2b9b5a893..322c116a04 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -162,8 +162,8 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } PHDR(note) PHDR(text)
 #elif defined(BUILD_ID_EFI)
-  /* Workaround bug in binutils < 2.36 */
-  . = ALIGN(32);
+  /* align to satisfy UEFI CA memory mitigation */
+  . = ALIGN(PAGE_SIZE);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
@@ -330,6 +330,7 @@ SECTIONS
   __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
+  . = ALIGN(PAGE_SIZE);
   .reloc ALIGN(4) : {
     __base_relocs_start = .;
     *(.reloc)
@@ -355,6 +356,7 @@ SECTIONS
   VIRT_START &= 0;
   ALT_START &= 0;
 
+  . = ALIGN(PAGE_SIZE);
   .sbat (NOLOAD) : { *(.sbat) }
 #elif defined(XEN_BUILD_EFI)
   /*
-- 
2.43.0


