Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SSXiCohyPmopGQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE776CD0EC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i21WghmR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346123.1604663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nw-0004aa-Qt; Fri, 26 Jun 2026 12:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346123.1604663; Fri, 26 Jun 2026 12:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nw-0004Z8-KC; Fri, 26 Jun 2026 12:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1346123;
 Fri, 26 Jun 2026 12:37:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd5nv-0004Lc-Dn
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:37:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5nu-008IO7-Qt
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:37:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7250-5cb7-0a2a0a5109dd-0a2a4505ac78-42
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:06 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7272-3cb2-0a2a45050019-d1558030bde0-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4923fb1f095so8876695e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:37:06 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm76578835e9.8.2026.06.26.05.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:37:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782477426; x=1783082226; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7zgfFDoBBPNpJ7qeY1DSNzH5DJ0mfqwAdGCYD7M6W0=;
        b=i21WghmRsF1Zdt+QIgbgX09tVJ2JUOMIfe9RziGcx2T+0EqgW0xt24vaUWjsRKHdM/
         ExtRgnbuIO6VNywmPxyN+c1OMH5drLVsQsKsJRvBSHXJRUR/MLjel3nzIvPlS6p267xn
         5zqUnClNFVH31NoF2wdnxwY1j4pz7nXJ4EbIsU9tmCmrZemY46l5gURc3UydJxdClXOx
         WQax7zXdx0PaTR2rjHSdfGjZ95/skU6lW8k+VpQumDfbCtbA3VIyuDLdETHhVoNx6zRJ
         dFRuGixn2tCSdj3UZpfkiBPiQKNSk2rEkTnwOCGrDk2JruKLAkggc437w6CGe8d6E9IG
         1I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477426; x=1783082226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7zgfFDoBBPNpJ7qeY1DSNzH5DJ0mfqwAdGCYD7M6W0=;
        b=iz/JOpqoemxgLJ+M9f2yRaLo9oUzWdYGMMoEXJhNtnwqdN0V0GUaU330+tdFbRoFre
         e57E7uUf6K4n3PDyzIDRSW2agc8hAAzu8fDM4HuwqgVHexDinOgpihIHlfWdDzLCrAv3
         MXfqTnhjK6nhrShhb/86sUggFh2exz0tQJB6uHOBkptmH8CQD+KuH3WgaiwFQUXhdNBZ
         92SV4zbdI0FXXeVY2N2ENorXRineYvMuxvLFaYfxLbpOcx80uEnDl/YjaDhyTf2K7oiU
         7D64APSje2avpUbB1z4TndcCorSdMi8HVQLKD9inOUPm93GFGyNqTf/y6JTmqZ0aVMru
         E3tw==
X-Gm-Message-State: AOJu0YyoLET/y9YXlDqkomKALLCZ+BlVCp5TGbl1qaFjvnF1n2IYUZOj
	0v+8fX3WctcqnJ9gpQmcjwjFA53PwizTFUvaTNwDM0t6qH+5i+7o1/fGofbP0K7XL6A=
X-Gm-Gg: AfdE7ckMqizLw5CksOLdQQpkRAoPyX0pri5lfe09I+20L8saYkBh7Hw0Wam3A/q0aCn
	m9M4WxTyY+UIJqfOz7aUTccKwe2XVrCtx2bwisRhNGCR1SY0gjBWZeGtSktqBzEN5LrqfIAUMv4
	NMwBPWnX7G0xX9a6pG8KOt/DAU8I01exhYIwAn5OpwpqyeTP7KyVTeW/fvGXOj+69m58Lok210j
	EtDtvhpJd7fgfuJbDBbhRp2cLBadzHVlsgt1orBZEmuLkQrUtSv0+O0Qx5skKC34hswH6kMv8Kn
	C501kUfx/Ca2giKdjXi1g65qkjk722BNwPDySW/nMTyIbaVLnEygNC7/ZyqcI8iV1o8QIT4lVGs
	Cgo7zHa96MqqYhm8xlE/w1MNC6hGKjMth6CMrPR+JRgpuIBkXt+ThygRRefKYjPW1gBipz1YvFC
	I4vvWHfYEfbszUg6JC2I+j6OCjBYraHPM5N5izTft9ADSinTZ3MmdH7OwLNFzIZ3W2eeU02uKvW
	SJS3a0g
X-Received: by 2002:a05:600c:8a1a:10b0:492:488c:f627 with SMTP id 5b1f17b1804b1-49266872ce4mr74157985e9.11.1782477425844;
        Fri, 26 Jun 2026 05:37:05 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v5 3/5] x86/efi: avoid a relocation in efi_arch_post_exit_boot()
Date: Fri, 26 Jun 2026 13:36:43 +0100
Message-ID: <20260626123645.229375-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626123645.229375-1-frediano.ziglio@citrix.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782477426-551E62B8-8D192688/0/0
X-purgate-type: clean
X-purgate-size: 1923
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BE776CD0EC

From: Roger Pau Monné <roger.pau@citrix.com>

Instead of using the absolute __start_xen address, calculate it as an
offset from the current instruction pointer.  The relocation would be
problematic if the generated PE binary had .init.text as a standalone
section with just read and execute permissions."

Removing this relocation is necessary to make it safe to split .init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
--
Changes since v1:
- Improve commit message.

Changes since v3:
- Added Acked-by.
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index d738b839ee..b983f054b5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -270,7 +270,9 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 
                    /* Jump to higher mappings. */
                    "mov    stack_start(%%rip), %%rsp\n\t"
-                   "movabs $__start_xen, %[rip]\n\t"
+                   "lea    __start_xen(%%rip), %[rip]\n\t"
+                   "add    %[offset], %[rip]\n\t"
+
                    "push   %[cs]\n\t"
                    "push   %[rip]\n\t"
                    "lretq"
@@ -278,7 +280,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
                      [cr4] "+&r" (cr4)
                    : [cr3] "r" (idle_pg_table),
                      [cs] "i" (__HYPERVISOR_CS),
-                     [ds] "r" (__HYPERVISOR_DS)
+                     [ds] "r" (__HYPERVISOR_DS),
+                     [offset] "r" (__XEN_VIRT_START - xen_phys_start)
                    : "memory" );
     unreachable();
 }
-- 
2.43.0


