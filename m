Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tsWtL7I+NWqJpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED996A5F38
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l8objaQX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342208.1602493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuT-0002hp-VJ; Fri, 19 Jun 2026 13:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342208.1602493; Fri, 19 Jun 2026 13:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuT-0002c9-Lx; Fri, 19 Jun 2026 13:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1342208;
 Fri, 19 Jun 2026 13:05:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuR-0002OB-Jc
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuQ-00D4eo-WD
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8d-2eae-0a2a0a5409dd-0a2a4505a48c-30
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:22 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e92-ef3d-0a2a45050019-d155d02fa493-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:22 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6870ad8072eso2168987a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:22 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874322; x=1782479122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmIH1fxngC6S436VPRvPDb1Farbh0pJpGks2ZI7BB0I=;
        b=l8objaQXtlIcc4shebAIzaTriizRuahQ1gWsPhAsBZVNYILVJx1Q+ctp6lTtc/trh0
         FwnbT9ksV32ZoC74BcbkQ6mjjElKewN6w4hYb9mO3Jtpt2C3owxHcS25uDlNgtyQO8Ok
         cvsPgQY3/oet6dgXUya8TKSlCsea+LKL6+8UfJnd3lTcFTyi3xPX025BsZA9UB8UTFUR
         NCvMsNqVQH1x57be/Yet+WaBbymvBp5dGj+oIdjb1qsiufGONykNO6RbO2aBVeVBoqQw
         wJGkMkQlCicIoEZPzb2lUFdIXqU5uioSg+waIaHTgfSD3UOSXB00LPkKDGKCSr9MTiKO
         KItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874322; x=1782479122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LmIH1fxngC6S436VPRvPDb1Farbh0pJpGks2ZI7BB0I=;
        b=SmmSUPNBg3Uo4c3q8TusbeVXCDo2i7U6hFPIDnV5KyFoz4GfsnfujJrGsJsv3EY4TT
         GCYGRNBCPszywDlMT1RnQ+qPWQqDX9bYWtYFi+x+QyvXVB4DZQplmv2kD5RjkM4iRk+Q
         zjtVImndo6lNyNTAYyyCYSHaDVrP26SIZTC8VIRMV7vFxnGCsalsLb3p1gN7cRaNe7tw
         xwGoN+IOr1tZu4DrBp4ROT/+co4xaCDzgE/76MjtNrVfrOXS021+tL2jq9WDzUX0DG7E
         4bs3KOJPFPnqkN7BW852lhSM33QwrnK/3S2v9nncvP3G9uwyzX1uvhYn5pKAmK99/YyY
         Nf4A==
X-Gm-Message-State: AOJu0YxYlMxsBYK923Ark+oYdqD0SRW4UD7Cc99AR/AeopdzKGHhB7GA
	GDXDPJ1/r53SBJ4l+KxEIAWB4zT3UdgI1ZfK/sGuHF/4u+SLCkzM1ciC44LVhsDoSgs=
X-Gm-Gg: AfdE7cmxQo/7Lu8GkCC+SGIv21vUWF4zgcUfujRRG2jG5zfDAW4taUrYak1BoI5GQXC
	2NNHGshTghRmy7If4qegFjl9Mg4StMsyirjMhVmye4CI8Tm2eowNQ3wLyOUoj4QNzAQMnPW3hl1
	g4oB7E2xi6+F6RvED7xz6jGsQF7hI+nJtnbJa0yOqDzH+o4WKBhge623K2InJmXlvv/AF9jHwqi
	hmcvoan11ewTEoIDpIYePWxAFHpXyCJD9vyRDLo871XYp9Md3jfVnqj1BMi2+YKP/p9bANvOlmo
	JCoEU6zXvK8kjjL8jDlcMjoS+rbL4NT7xzOjCov4RFBscCZfTkcXYBgtixr66d1f7gi5BDN0YWI
	bYz8N+9a/Og+RzZi4Mb9hIwH/iUMYZMp4Y9HlTNPFWRM5sJFNypNd6de7aguzpqfnEZnBJhAm/x
	LVtaS4NNUFj2ya/ymTYG5IRw0Rcc05/QwNTMPblnv0F+r7hbX40oOjZ3GND/0uqSXaXXMiOLJlB
	2NXUxLv
X-Received: by 2002:aa7:c58b:0:b0:697:641b:11fc with SMTP id 4fb4d7f45d1cf-697641b13a4mr615235a12.16.1781874322377;
        Fri, 19 Jun 2026 06:05:22 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 10/16] libs/guest: add xg_foreignmemory_copy_{from,to}
Date: Fri, 19 Jun 2026 14:04:55 +0100
Message-ID: <20260619130501.272832-11-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781874322-9C1F1127-70E27644/0/0
X-purgate-type: clean
X-purgate-size: 3469
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ED996A5F38

This change prepare code to use a new "foreign copy" hypercall.
The new hypercall will copy memory from/to a foreign domain.
The new hypercall can be emulated with a sequence of:
- map foreign memory;
- copy memory;
- unmap foreign memory.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v5:
- Do not overwrite errno if xenforeignmemory_map fails.
---
 tools/libs/guest/xg_sr_common.c | 57 +++++++++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_common.h |  8 +++++
 2 files changed, 65 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 9b2782b5cf..90da21c35f 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -156,6 +156,63 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
+enum {
+    foreigncopy_from,
+    foreigncopy_to
+};
+
+static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
+                                 int dir, size_t nr_pages, void *buffer,
+                                 const xen_pfn_t foreign_pfns[nr_pages])
+{
+    if ( nr_pages == 0 )
+        return 0;
+
+    if ( !buffer || !foreign_pfns )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    int err[nr_pages];
+    const int prot = (dir == foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
+
+    void *p = xenforeignmemory_map(xch->fmem, domid, prot, nr_pages, foreign_pfns, err);
+    if ( !p )
+        return -1;
+
+    for ( size_t n = 0; n < nr_pages; ++n )
+        if ( err[n] )
+        {
+            xenforeignmemory_unmap(xch->fmem, p, nr_pages);
+            errno = -err[n];
+            return -1;
+        }
+
+    if ( dir == foreigncopy_from )
+        memcpy(buffer, p, nr_pages * XC_PAGE_SIZE);
+    else
+        memcpy(p, buffer, nr_pages * XC_PAGE_SIZE);
+
+    return xenforeignmemory_unmap(xch->fmem, p, nr_pages);
+}
+
+int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
+                               size_t nr_pages, void *dest,
+                               const xen_pfn_t source[nr_pages])
+{
+    return xg_foreignmemory_copy(xch, dom, foreigncopy_from,
+                                 nr_pages, dest, source);
+}
+
+int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
+                             size_t nr_pages, const xen_pfn_t dest[nr_pages],
+                             const void *source)
+{
+    return xg_foreignmemory_copy(xch, dom, foreigncopy_to,
+                                 nr_pages, (void *) source, dest);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index b2c441b644..e37f805240 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -553,6 +553,14 @@ static inline bool page_type_has_stream_data(uint32_t type)
     }
 }
 
+int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
+                               size_t nr_pages, void *dest,
+                               const xen_pfn_t source[nr_pages]);
+
+int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
+                             size_t nr_pages, const xen_pfn_t dest[nr_pages],
+                             const void *source);
+
 #endif
 /*
  * Local variables:
-- 
2.43.0


