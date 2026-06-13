Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1DW4BT/QLWrmkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9871567FD03
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HLgR1pOt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337564.1598937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDJ-0004Jg-RN; Sat, 13 Jun 2026 21:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337564.1598937; Sat, 13 Jun 2026 21:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDJ-0004Dd-5U; Sat, 13 Jun 2026 21:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1337564;
 Sat, 13 Jun 2026 21:48:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDG-0003js-E1
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDF-008PGn-RB
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd008-5cb7-0a2a0a5109dd-0a2a4503cafc-16
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:21 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd025-672d-0a2a45030019-d1558030bc9b-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:21 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so8258805e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:21 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387301; x=1781992101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xFs89+81xqcLpzv1mSuMxyfcArrfVpcycWVoWyDSCc=;
        b=HLgR1pOt5nxcJAg99jTP851Ax5l9qVPasjv+G0APOysmYnGOtaZXWZWc0kRzNWFG73
         Ta5tyIs7Neek8Jj/bCFDwEoIBjy676kF4E0GRR0s/klRGIeQAIk1V0PRjdfI+t8gDSg4
         vZqYjj9242+A7pLaMIm5tjFv5YzxMMj1I6cvYeLRV8YB8KfZOtOrdQrJtKjdRFk7lxRd
         3AkVqxUZlU7Z9qW8MYh6CGeDctL1Ofqgjb2e9Q83Ikx2BhF6+L5hAogTfAe5e59kdT8F
         n+ZpYrOslq+wlLYOJNGWneymtnrE+LSizZ95g2NFNZZ2oV3nmdv17Nz328+3+EMFQ+MM
         bY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387301; x=1781992101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xFs89+81xqcLpzv1mSuMxyfcArrfVpcycWVoWyDSCc=;
        b=f3qnXKt15hZF3rWHwci4+2aX15MNg9AR50avG/56vcO3wtuM5AlUhY95PWyolm8dy9
         VISMjO2zGcfzdCP2fEjtCUhpo+FNU5RZmU6eUN8sCZIrDTB9RgtWbFGW1KN8YvOYn8P6
         pg7WK7ugQdOczphpvDJJzOTYTmFUPEkhL+xZWPM0CPK6QUj3TkeIW3mZrZBt/hL3RxgQ
         fbwKXT8tko3Wy9DeJg4dzTQfyhjsf+936uZYmW14U4rdfT3gAzhwazc8oZCV/3cbwqp1
         y6aTQvsgUYV/viT5+/VDCthXSKrSIq3GhrZtQnaOKfhjxmcI4tOTVzVZUPxOsOACpv6f
         M87w==
X-Gm-Message-State: AOJu0YxaOpT4g2cejlKOVlWTLMAoHSyeMTPj6BnETjKFolJs82kkh6jV
	8DPIYE1TBRqjsiVcmrOPca7gjBDfvilN1hpiZODXk45TJyzxakout0Cg9D8bYrrG77c=
X-Gm-Gg: Acq92OF3k1/MT6dBHsNRAje70A5+6BJmNNmcvhNHZTJoDwJRJE9xzp6zDVmE84id51s
	CccCiOepHFI5SH7Xb9x4V8VObCIF7LQMDJe2DS++AURuboLVid2qbjKrAHJ38fExybKoxN3XUim
	EBZfVglwD7tRPFa0QY9gKqhpD8j3HjOlzXzaRkdI9YfCLT1+8HIXI9VPxwAVclE1ai2tnVUntHs
	7K34O/3cgCWz5j8+0QE06a/qvxomQzKe/JpTWrdLOZa5Nd6IqmoeGVSLyVCh+ouZR3XtFSxri8O
	14biUi3GiTOH80gvImVF+ey6VEGaU+CKAiW/frwb0oQq9+bDK7DJ2DKqx+pTTJcFM+YlsBA6N53
	ZnqNjSjnt/RhmxyrIHhIaKZoWzGDV4NIbZO5BpYoW9VynwN+ybVyv3SuIPiIonuc9CyqOoefuyt
	YN9bprmrSZrtkJ4wEcM5dc9EyLhGB2ixAbg5yJt9643Nh7wfopfWEzcsycbfGpjpbOTi+iTkOnB
	0JJXiHx9hTALwbjAfcGMrwDI5Pu4OhBIbvC
X-Received: by 2002:a05:600c:e556:20b0:490:b9c3:6c58 with SMTP id 5b1f17b1804b1-490ec4fe879mr74128225e9.16.1781387301227;
        Sat, 13 Jun 2026 14:48:21 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 13/16] privcmd: Add definition for new Linux privcmd to access new Xen hypercall
Date: Sat, 13 Jun 2026 22:47:46 +0100
Message-ID: <20260613214749.20620-14-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781387301-36746938-7B93632F/0/0
X-purgate-type: clean
X-purgate-size: 1454
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,cloud.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 9871567FD03

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Userspace should use new ioctl to access new hypercall.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v4:
- update comment.
---
 tools/include/xen-sys/Linux/privcmd.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index 607dfa2287..7a3c41308b 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -100,6 +100,14 @@ typedef struct privcmd_pcidev_get_gsi {
 	__u32 gsi;
 } privcmd_pcidev_get_gsi_t;
 
+typedef struct privcmd_foreigncopy {
+	domid_t dom;          /* Foreign domain. */
+	__u16 dir;            /* Direction,  0 from, 1 to. */
+	__u32 num;            /* Number of pages to copy. */
+	const xen_pfn_t __user *pfns; /* Array of pfns. */
+	void __user *buffer;  /* Buffer to copy to/from. */
+} privcmd_foreigncopy_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -121,6 +129,8 @@ typedef struct privcmd_pcidev_get_gsi {
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
+#define IOCTL_PRIVCMD_FOREIGNCOPY				\
+	_IOWR('P', 11, privcmd_foreigncopy_t)
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
-- 
2.43.0


