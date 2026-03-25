Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJrNLNC7w2kKtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14503232AC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261932.1554676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfh-0005wS-DT; Wed, 25 Mar 2026 10:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261932.1554676; Wed, 25 Mar 2026 10:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfh-0005th-8E; Wed, 25 Mar 2026 10:41:09 +0000
Received: by outflank-mailman (input) for mailman id 1261932;
 Wed, 25 Mar 2026 10:41:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5Lff-0005f1-Vc
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:41:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lfd-00CE42-Q5
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:41:07 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbbf-5cb7-0a2a0a5109dd-0a2a4504cc78-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:07 +0100
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbc3-c823-0a2a45040019-d155da32e8ff-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:07 +0100
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so385276566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 03:41:07 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm798491866b.17.2026.03.25.03.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:41:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774435266; x=1775040066; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rT8SR9SDzTxBQqKsvJCI0AzqlhVbVITm6mf7ezqebE=;
        b=j8uoYdFrUM1GvMC6l6T8lF5CrziORcBStp6HpiG4uvPPUYbwrAVKzup3nWP5xiDp8/
         iR82VW1vkkyUlwxi2DCXTu7AtTGcyggzWV+g/H/jTEHj1UinS8BOwCAMLV9dUFDmvNHq
         7lpnkQ8XnvH/JSlPz1Qb1r38CCQpvGhg1UFRpbgk/0CkltJiw9LFT5gSuZGfk6yaM08W
         U2b19y6mXW5zl2NSzbuAMAGeBgCjy0AvGGCb43oobzL1U+Fn3NQboooGLz49qi0XBLsW
         0f2JQKYj+SbwP4+iXK97GQy2TDO17GdNFxR1icuuCQeOyFShHGLfq9ci1B6BBB9SLvzn
         kizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435266; x=1775040066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rT8SR9SDzTxBQqKsvJCI0AzqlhVbVITm6mf7ezqebE=;
        b=FySeze+Zz1nQF/Jxoxy2oitlgSyY/3GmX7nYBf8M9SFnx8hqC8vQqcRS3fVX4Az7vD
         a5sXDBojq6HDbn7eBKwr7JgZWz2XalcIQpqZFPlEPv2lLsEwCe5dDyBB+PRKUAK5fmmB
         dKv8XgDIdEplo9cMSjML+bmeuO/KY/d/YVUYs6t9GmR7RTKBoeipdf8txqZYL5oGhhzM
         n9wOPX9VbuO2Ri8I49nuQ789n2MB2xrdi418f0a3cO1PDJJVtX1k4YbNWhcvYGap/cON
         hCaT5/gI4syh337MVL/mkmoZ1muy04PR+7FWY0SoMhuoKXLGFsEzyuEDVkKW2bTR3VxW
         DJiw==
X-Gm-Message-State: AOJu0Yx0o1Pjy46iE7AnXHfEqrBEMU0j9lcH5TZyjlWcJ9wZz6XV8VNA
	EXKZyRYaNP5HC6a4c3E6FDfYSJVw8AOYGq1eeCo20PqQ4OfUd5RGV3fGyREYXA==
X-Gm-Gg: ATEYQzyLZC4dZU7Q1TZUyEhlnU40iSPaP8Va6SKUs6mjxWUWieaZu7c0EConlhVVi+I
	8n5TKvcreSACPMcIQZk4WwOVjq19a3EQLId3K89SS/3xKBCUg81hePLQL9gEY/dHiY5DL5PDkkn
	jSJYyhubZJW0RgNNc6BR5xmQxQoxR1pXI+XvNEzURMnGknrOIPZASofOZwJB5KBrWkSGbckR9Zb
	G5kf3MLjjEv6pjQrlKmIpUUIfHmj9IpYY41T0XoTQaScvVDdokHtWynOXN0Dc+q4/g61ogiCeqP
	1e0KaYTJft+dPlglQyWOwZEyX1rmpufN5vDMB2ycsbrVUF38TvWuGaEoSMsseoZDVTvwkZMRI6L
	ZaFdJGxLnJ95nKVkKfMbVWajoN3DuPLjMkCkbX40JeqsYuHGA+L2xZX00JAL5R4tLKlD++H8kvA
	FmGotv9ZGNygRp+25lDt4H8qwrhQ==
X-Received: by 2002:a17:906:af50:b0:b98:6926:13a5 with SMTP id a640c23a62f3a-b9a54241c2cmr156309266b.46.1774435266342;
        Wed, 25 Mar 2026 03:41:06 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] xen/arm: its: add Orange Pi 5 ITS quirk
Date: Wed, 25 Mar 2026 12:38:32 +0200
Message-ID: <d2493972f7ba346c0921a4c7ad67220e5e85c89f.1774431311.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774431310.git.mykola_kvach@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774435267-B38979D1-2A4B2AD9/0/0
X-purgate-type: clean
X-purgate-size: 1450
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A14503232AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Add an ITS quirk entry for Orange Pi 5 boards based on Rockchip
RK3588/RK3588S and match it via the platform compatible string.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index c40629731f..ee432088cd 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -77,6 +77,18 @@ static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
     return true;
 }
 
+static bool gicv3_its_match_quirk_opi5(const struct host_its *hw_its)
+{
+    if ( !hw_its->dt_node )
+        return false;
+
+    if ( !dt_machine_is_compatible("rockchip,rk3588") &&
+         !dt_machine_is_compatible("rockchip,rk3588s") )
+        return false;
+
+    return true;
+}
+
 static const struct its_quirk its_quirks[] = {
     {
         .desc  = "R-Car Gen4",
@@ -86,6 +98,13 @@ static const struct its_quirk its_quirks[] = {
         .flags = HOST_ITS_WORKAROUND_NC_NS |
                  HOST_ITS_WORKAROUND_32BIT_ADDR,
     },
+    {
+        .desc  = "Orange Pi 5",
+        .iidr  = 0x0201743b,
+        .mask  = 0xffffffffU,
+        .match = gicv3_its_match_quirk_opi5,
+        .flags = HOST_ITS_WORKAROUND_32BIT_ADDR,
+    },
     {
         /* Sentinel. */
     }
-- 
2.43.0


