Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIoPFVuTjmmFDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:58:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A8213280C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229976.1535715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjNt-00024U-BA; Fri, 13 Feb 2026 02:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229976.1535715; Fri, 13 Feb 2026 02:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjNt-000225-89; Fri, 13 Feb 2026 02:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1229976;
 Thu, 12 Feb 2026 22:40:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ImLz=AQ=u.northwestern.edu=n7l8m4@srs-se1.protection.inumbo.net>)
 id 1vqfMj-0002IR-Db
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 22:40:53 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd87a2ca-0863-11f1-b163-2bf370ae4941;
 Thu, 12 Feb 2026 23:40:45 +0100 (CET)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-8c713a6a6f8so37934285a.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 14:40:44 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50684bb9251sm46363411cf.30.2026.02.12.14.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 14:40:42 -0800 (PST)
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
X-Inumbo-ID: dd87a2ca-0863-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770936043; x=1771540843; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UWWGIVqElCdFKk2jvTyzzGQRjen7XYqCpsyceyHmbuY=;
        b=WLj47oF6Cu7h7GXR6fUxk1SfBEjH/BY8xPcxgaEwBD9O9Ll4DKmwWf9E9O1ndIedM+
         S5YOqG3/nPq6xiIchWC5nccdpVCibJ4JRTLFiab2oZDcCqalGmHRxXhAtBy9PONlUNv5
         EytIWxlBMGXc7Zm6nqNvIe3qSu6D8tCUIqJBuQki2U2NoJ3EmclPKm3Vn93j8WjftnTP
         Kdo37hJLsMnxOBSdjTxUZWj3sPKWcQR/kZA2cXQQcAWxeFWYfWXS5zy1z+0HcVPsrrUV
         9gRMSq4NXu3HIFxclfCwRqlgQYDhTKXY0UvfiCjfSX14YBgccUenGLdD9a2iNEahP9Cd
         xz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770936043; x=1771540843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWWGIVqElCdFKk2jvTyzzGQRjen7XYqCpsyceyHmbuY=;
        b=KPREjaUphkh7zUP/rh46ZggL1iZPM2Aitx91t74esJZoK/oBgREWG0EA8uZoTQMCd5
         Nq4pjv2cavweZ1QI4HQFduzTJjOTqbiSAaTxICjKNFif1mDnYTIjcFIi+GxNm+fERVs8
         +b7ChiA8YrIRvyiL8MDeaBW5WslxYPq/80FU7J1/cN9Tn/PsWG029vwS9bRbnMe8v2pB
         +CMqZYQj+NmZGDH2YMG77QhMRL+yZbzvVp4Sw5AIK6+cVy3TIm9s7oQ2Qg8Z3+SSJHM/
         6HcE8ltyELaVnu+mWVrt5c5imKjAs/kQ4MqCZQfweZHUzWYFE+hDs+zbsNShhRNmKYk5
         pFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqS7vyPTOQZVyRrwevsjH4RQ0XAd4vZfsSkcQCFJKFbMAlb8syVBWM2zZiCeXnCERsY5tOmvDj05g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW1F4ymQJ9MPXrqlJpXPU7FFN4TcMzM8V86FriCSPOTjDr6zBH
	ccBvEQfCUFC0Xzs6E+6LjXRoowqnld2fnaVIB4nznwBaDOwc6JfM0sNf83nKIAhsxGM=
X-Gm-Gg: AZuq6aIDogL+O1mauMHWSX5BG8tA2yOHUzsHR3FlrXvVnJNw7fA7M/OOA/eGu/pR+aF
	24h5rpxKjcueYQ/tAxooXH3+RZuJ90dDQ7HQzoZeEFIxsD7S1oKz1NMuOUs9j/MMtggamJM8eZU
	7cjmIul5a66tkP/dhglJ29kAxS+XOmPiIDOgEwfJZnS7EiLA8IGAkGKac9OkdbL3QUXjqJkAhR+
	yWJc8pWG4N35Tjr+9I7BY+hjwae7hN9zaQMmeeCEaqTxbQlQik6wceRnNLo/ukQq8SFrTmONX8F
	y0DSgurXt5U7Xm59dg4duY1q8qB49uI6hvCqO6b3qxz+V5Qll9iJZGvJzC8ocRVOUhThfVEePBb
	nv9IxijGP9iNA4GvX+QyIR0igHyumIw7L7LyfchT4h0mlvokglCdkY30nftXJkkeim5RLt4L6BT
	oqd/eJ1gkwYKzAulQ2YVvrfaHrBH+a7EUMVJgyUr7vbBJs0DfjoRbUIDeGm1Rp8VPSA5q1mDHDR
	CeyF8B0HGNw3XVTK2Aw2sUE1CIX6ghco/YFr/9LB7M=
X-Received: by 2002:a05:620a:1a2a:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cb33a58005mr507763185a.8.1770936043069;
        Thu, 12 Feb 2026 14:40:43 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: "Andrew J . Bennieston" <andrew.bennieston@citrix.com>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH net] xen-netback: reject zero-queue configuration from guest
Date: Thu, 12 Feb 2026 22:40:40 +0000
Message-Id: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:wei.liu@kernel.org,m:paul@xen.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:andrew.bennieston@citrix.com,m:xen-devel@lists.xenproject.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:andrew@lunn.ch,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[northwestern.edu:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D9A8213280C
X-Rspamd-Action: no action

A malicious or buggy Xen guest can write "0" to the xenbus key
"multi-queue-num-queues". The connect() function in the backend only
validates the upper bound (requested_num_queues > xenvif_max_queues)
but not zero, allowing requested_num_queues=0 to reach
vzalloc(array_size(0, sizeof(struct xenvif_queue))), which triggers
WARN_ON_ONCE(!size) in __vmalloc_node_range().

On systems with panic_on_warn=1, this allows a guest-to-host denial
of service.

The Xen network interface specification requires 
the queue count to be "greater than zero".

Add a zero check to match the validation already present 
in xen-blkback, which has included this
guard since its multi-queue support was added.

Fixes: 8d3d53b3e433 ("xen-netback: Add support for multiple queues")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/xen-netback/xenbus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index a78a25b87240..2ef59b08ae21 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -735,10 +735,11 @@ static void connect(struct backend_info *be)
 	 */
 	requested_num_queues = xenbus_read_unsigned(dev->otherend,
 					"multi-queue-num-queues", 1);
-	if (requested_num_queues > xenvif_max_queues) {
+	if (requested_num_queues > xenvif_max_queues ||
+	    requested_num_queues == 0) {
 		/* buggy or malicious guest */
 		xenbus_dev_fatal(dev, -EINVAL,
-				 "guest requested %u queues, exceeding the maximum of %u.",
+				 "guest requested %u queues, but valid range is 1 - %u.",
 				 requested_num_queues, xenvif_max_queues);
 		return;
 	}
-- 
2.34.1


