Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFsBE3JSD2pEJAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:44:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD065AB34B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 20:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315795.1585497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Ml-0003Hn-6R; Thu, 21 May 2026 18:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315795.1585497; Thu, 21 May 2026 18:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ8Ml-0003DH-1F; Thu, 21 May 2026 18:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1315795;
 Thu, 21 May 2026 18:43:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ8Mj-000334-LX
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:43:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ8Mj-00EkKx-1m
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:43:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f5228-5cb7-0a2a0a5109dd-0a2a4508df64-48
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:43:28 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f5250-63b5-0a2a45080019-d1558032e55e-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 20:43:28 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so42393085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 11:43:28 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c6766fsm42558855e9.2.2026.05.21.11.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 11:43:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779389008; x=1779993808; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de30ilZc1Pk5ATstxlEw7kAS0ReXrVMylgNlp1/IE6M=;
        b=aJPXv+tP/CNHQJe4rAx+OcaMg1unpfB9hsXCf81wXnc9xUbMCHBvz28pqh+t3zv2cl
         dPyIVjjjF7LnVJl6/Hzat7Orr75xBFm++dONdxmoIbUJhRRaHu5Y5+nSvvnzbUudZkV9
         2SUfSJmEtbb28GbGROzUA5pBW1omQVdJSAi3zp9FmgtyXiuNzR5f4OUlQM7bnc/qXKas
         AEluoINNpWu1uRxjvvwfk/jB5sBEi8qdYMMCIXqrPhiCNHiWh9JZviiSmgyAhdNOGPLf
         jCbA2bDkQWrKd5/lNSY+zoBvtR2qoz7QGPyVZcBCFnvtIGj4yrQY7F7HhpMm1De1+XgC
         MhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779389008; x=1779993808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=de30ilZc1Pk5ATstxlEw7kAS0ReXrVMylgNlp1/IE6M=;
        b=X+/xj//cYcBjk4lKUjhrpfLg9Zg3s3i/u/hT0VFb2uR7DxKI8WfzNw6RZRLIaxoBYv
         Z5gjTN/uQRau8tqYAHYgLOuqyvNncotRJeN3HRiX4rWiUxf7phEzbaHPphITMh+6ucEm
         PHjhVhbTk5E44pKgrkDeXnheNiKDu4AnIV2LBZpE/a//zrL3SudBjZzIKF+vTKbcSMxq
         1MFRPinqD5QVHdHunVSoSIenKLjfxDanGSCFwgacUBUohFYggUm4jfxAbtvBWUr1TMql
         uBtXqNi8So0Jj6FHSPbb+cepylBdiehBFlFryBdE3AsV0fJIAh6QfA9oSIYUJ9ilQhus
         ij7w==
X-Gm-Message-State: AOJu0YzqgGyhBlOUuh2bQm07BMTAGIEwApp8VXhMF+53xfPPLfg7fRqK
	S9zywd9xeuiXs4gPMNEq9bXVfgGZhjY+9DtAFd+K+9oHus7nSj41ZmXpFAJCHo1w
X-Gm-Gg: Acq92OGs6aL++l7N4rvuPjAr901PLYHJYIOQAl9+WjjCwkYTZZ5MMfqzlI1ZGOxoHmX
	wKHt2+8gsc1KNGNH6z09jOx5D7DCieb5s7eMIWLGenFdqKcEVXhdCfIYdwD483VPXQejr9gOfZY
	SRzy4Whzd8fLpu3RDBkFUFP/gnQNgaCLgjfJojgGzthhjDdsmExi3ZCYg7Nk9lEKjMHjvQLmopl
	OTxn3v+8P4x5BjWxUtbdLTedUGL8+E3huaTK/PCSx7LpP1HS9339cuk3PyRPMUUlg4nWmpx8LrL
	hqbCLKABA/DcVsJcdfzSHeiBhHqBljV4nqLNxq8PqNyUQdGVdYmO5W0z3DIyIl5N36e575G2NpG
	bNv7yKcjBFNDbYB1KViCtDRZ8KKxdF/nRbnEM3D5557TmelajVJBwVmDE99VK/XO11Kkcl+QSkl
	9T0Q6CsZtMkTrumW0fHYOp9263Ww==
X-Received: by 2002:a05:600c:4649:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-490360b366cmr37723645e9.28.1779389008391;
        Thu, 21 May 2026 11:43:28 -0700 (PDT)
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
Subject: [PATCH v2 2/2] xen/common: llc-coloring: reject empty color tokens
Date: Thu, 21 May 2026 21:41:22 +0300
Message-ID: <94d7290edbda36c652579b625acaa4d7cdf1aa68.1779388510.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779388510.git.mykola_kvach@epam.com>
References: <cover.1779388510.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779389008-BFD7BDB1-6B4CC5E8/0/0
X-purgate-type: clean
X-purgate-size: 2155
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:mid,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: DCD065AB34B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

parse_color_config() currently accepts delimiters where a color value
is expected because simple_strtoul() returns zero without advancing the
input pointer. This makes strings such as ",2-6", "-10,19-20" or
"1,,2" look as if an empty value was color 0.

Also fix the DT color parsing error message by adding the missing
newline and including the domain ID, matching the style of the color
validation error below.

Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- Include the domain ID in the LLC color parsing error message.
- Add Reviewed-by tag.
---
 xen/common/llc-coloring.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 2606cb0977..b5de5787c1 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -64,14 +64,21 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
 
     while ( *s != '\0' )
     {
+        const char *endp;
         unsigned int color, start, end;
 
-        start = simple_strtoul(s, &s, 0);
+        start = simple_strtoul(s, &endp, 0);
+        if ( endp == s )
+            goto fail;
+        s = endp;
 
         if ( *s == '-' )    /* Range */
         {
             s++;
-            end = simple_strtoul(s, &s, 0);
+            end = simple_strtoul(s, &endp, 0);
+            if ( endp == s )
+                goto fail;
+            s = endp;
         }
         else                /* Single value */
             end = start;
@@ -334,7 +341,7 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
     err = parse_color_config(str, colors, max_nr_colors, &num_colors);
     if ( err )
     {
-        printk(XENLOG_ERR "Error parsing LLC color configuration");
+        printk(XENLOG_ERR "%pd: error parsing LLC color configuration\n", d);
         xfree(colors);
         return err;
     }
-- 
2.43.0


