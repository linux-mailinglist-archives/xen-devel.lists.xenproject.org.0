Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMSNOO4hDGrjWwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D6E57A4EB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312578.1582665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzL-00020u-H8; Tue, 19 May 2026 08:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312578.1582665; Tue, 19 May 2026 08:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzL-0001wD-Dz; Tue, 19 May 2026 08:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1312578;
 Tue, 19 May 2026 08:39:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPFzK-0001lU-Bl
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:39:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPFzJ-00CbtC-Nx
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:39:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21ca-bab6-0a2a0a5309dd-0a2a45018a9a-28
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:41 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21cd-c1f2-0a2a45010019-d155da2bc5c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:41 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bd85ebb368fso379873466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:39:41 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c2a0dasm689854066b.19.2026.05.19.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 01:39:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779179981; x=1779784781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpe2zS75TI9kaVvsRUyajjZY4M6ywZ8rkBfskJkU/50=;
        b=PPgnDByba1E0UaFrNzNEZxYBTQjTEUk6xGS68fddx/i8ORaAqBggiluLTiYi2O+U+2
         4N6Y8siJMBCCGdmDJBZtj6SJFxe23oNNntBAJ63lk4o7729VMZbUxwp9okJ7uAY7T1E3
         zsH+Z5D4iS1K/kgGi1thshryq1JbSBa8rmsb2uXWMpR2tKXGWBADpMw3NH3f6bmp7Vb4
         XVbXi0NpcsJuA53HqDYg6dr5TfzjlU4UAhY0Pt5choGLC3N0l3ZQEwiiMO0Q3Fhz23It
         /mB/lOwccQziS5Qo86MMRslwAIHisUp/Il5FT8BBEMi1Zy+08M2EepgZV6BS1xKu8mcc
         N3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179981; x=1779784781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tpe2zS75TI9kaVvsRUyajjZY4M6ywZ8rkBfskJkU/50=;
        b=A3Tyn/6i2ZHcXOUmTVg1is62FibCvDmRFu33RXUq+EGEUadpB3cVbZKGJNkI6Fli6B
         Uuu+PsRIL8zK5KMdC7GnJiHAng5VMoGiWqs85jjQIWK9q2HRtkTSwGaq5UoXXPd4nmkw
         C6O6xNim7gyUl4JrTtWgdPBwNjbnc+F/Ar5fOlu25B2fKLCfUR4ZJPBN1cw+Y2xowyL+
         xCEd8sd94dTSjE+KCwi1lA8Psddff41Q7STvj/eA/XQKDnxmEgdSsfpvp5Yrac+SLm5A
         6uHqbMTJy5yPwphE9M3Pa1dsQwYN/aXa4v8rwBKMyUQQOLX9bNUMXyUkMeZL26Kc3e2j
         tC0g==
X-Gm-Message-State: AOJu0YzTYyY2vS2QYtR/yGUdGIUZMJCyzZTjX7v9OTL+XB1jhX05HYBn
	t3IPzSAMu5J165vRNUWOSSRCLwZufQmAH6exwkHOUSeq3ledZdcl28uhy55MeQ==
X-Gm-Gg: Acq92OGhV5KfVSvfXMdYoSi6wNKJnNZqaweirrev/xBnC2bd5spQz3zkb2RGg8PM1YM
	Fbt9mEGur7XoocAWdRuyVgm1WMTvSmvxkMKGI8teKHuI23odneFIGpC0SaGhEe6j6VGH5Jl5bdG
	sOZoHbrML6QLv2xLR6owBC6Hvmh76eKDbTpuvrmxHPMf3/VXL1IawtD9pAdD0l0woAxjeU5NshH
	hepcYtAzfSmfnQyNhysPXsAldX+X6/hbfUgBqpN0jKvbW5lMbSMhpkfo+dMzj32/srzZlUt0cw/
	Z2jcClftYzuuyN2yPUm/1PGPS51ffd4Xu33uydGXivRLWC8LUkgBEeoQV9cGZY36yL5gkrWW3Wb
	D/39RsB/gEjkFJNXXWmQv0oENgKAOMQLGRcTwYlMJisea4gkXdmxvcHGEJP2avPhbM6i97wtaZY
	VvAjewb7v1gk/saw+rGfMlHzBGCAh/7NXdR3Qoghwig4Tp4Qsh7oMtKPjeW0ymljB+XA==
X-Received: by 2002:a17:907:8b98:b0:bd3:413d:c51a with SMTP id a640c23a62f3a-bd5178848demr1060331166b.17.1779179980677;
        Tue, 19 May 2026 01:39:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in vcpu_info_reset()
Date: Tue, 19 May 2026 10:39:27 +0200
Message-ID: <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779179301.git.oleksii.kurochko@gmail.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779179981-ADB46FF4-E3BB11CA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1849
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 65D6E57A4EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
and falls back to dummy_vcpu_info for vcpus beyond that limit.

However, it does not guard against d->shared_info being NULL.  The
shared_info() macro expands to a member access through d->shared_info,
so when an architecture does not allocate a shared_info page the
dereference triggers UBSAN:
  UBSAN: Undefined behaviour in common/domain.c:325:10
  member access within null pointer of type 'struct shared_info_t'

Extend the existing fallback condition to also cover the case where no
shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
instead. This is the correct behaviour: dummy_vcpu_info already serves
as the safe stand-in for vcpus that have no usable shared_info slot.

Fixes: 295514ff75506 ("common: convert vCPU info area registration")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
RISC-V does not allocate a shared_info page at the momemnt because its
guests run in dom0less mode and do not use the Xen PV ABI, so
d->shared_info remains NULL throughout domain lifetime.
---
---
 xen/common/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c2895..e64b7df9b704 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
     struct domain *d = v->domain;
 
     v->vcpu_info_area.map =
-        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
          ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
          : &dummy_vcpu_info);
 }
-- 
2.54.0


