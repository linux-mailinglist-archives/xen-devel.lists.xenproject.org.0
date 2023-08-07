Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D3377224D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578273.905704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSySj-0007nx-8p; Mon, 07 Aug 2023 11:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578273.905704; Mon, 07 Aug 2023 11:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSySj-0007lW-58; Mon, 07 Aug 2023 11:31:49 +0000
Received: by outflank-mailman (input) for mailman id 578273;
 Mon, 07 Aug 2023 11:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSySh-0007lO-Pd
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:31:47 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc634c14-3515-11ee-b27e-6b7b168915f2;
 Mon, 07 Aug 2023 13:31:45 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EF6EB3200805;
 Mon,  7 Aug 2023 07:31:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Aug 2023 07:31:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 07:31:39 -0400 (EDT)
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
X-Inumbo-ID: fc634c14-3515-11ee-b27e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691407902; x=1691494302; bh=EQktl1UmnPQWszn8MIvvHFMFVHPf0iSLyrT
	r85I0YoQ=; b=gJA1d9lmVVFeiMPgC3M3B5lphOg/DRKSgYnM//6j3gqxPH39PIv
	2tznLZm1Q10X5OiPgWKslNMQONwpcaBR0KriMTPyWAQHtxQl2qt0SnBQ5nEv4YVn
	Y5rR0OMpK0cnMWtg1dGH/8i3nVpSNqIjApVYPvsPj4sLqGu0QDd5+H1UsFxLrUlL
	sMmd283ZlCL9SS4cYeNmtQSwq+vyelIhmWN1zcO43BamgXcs+HgC7PvZsltwmi6Y
	xIVGNBk/KGZde20rxjnPMGHKLuTlrCkAnbV6tk2BCMmMIuhUPy0cGltSSdPR5wd8
	vCA3pXfNWCALJ2SzEqc1teVb0AAvMODZxJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691407902; x=1691494302; bh=EQktl1UmnPQWs
	zn8MIvvHFMFVHPf0iSLyrTr85I0YoQ=; b=Sn7IUvYWJ1YpoVCYY7jMHDcq/RqMv
	Ea/hvsvLBD+5aXhNz8KvpvkcTo2LdOHIUEsnGeIwlWuOHg7ysJM14wFIe2muZL4K
	5v4hyM3RZMoQPr73izqEt1RTt6febNtPWhojBPAr4E7huv32Oi4mGj4tdRQPe+tI
	hwCMV6mI9QZF7+SaLi9yOIpQSjlNLAG+8MxCwQhku9YpuDl8+Q/om3DyEHGoel6t
	4jhg3Je79Kx8wo0AqTh5O1vw6GJ2fyKnxa3d1BCTf6AzGtuTPRmC7qo9VdtGU3ld
	avhxtsqtBbATo8IUhySMHCJ84Ga6cRDix3YzJT4QnqWOs66/CgRUHWigA==
X-ME-Sender: <xms:HtbQZLsmp9TBOc3Pfn6L8IT6i8o8_4_TDIFLAUKyDXHplJSnSxxetw>
    <xme:HtbQZMebUd4ctFhv6U2LkFc4ScydZn_m1C1LSEUyEMg509p2Qoiy5eutyBatdJWx2
    xjpOrSS6MZm1es>
X-ME-Received: <xmr:HtbQZOx1iB_0VAHM7RfZYxbN9rI53sR55TnCbSi1B0GqqxRhpMpsxvEt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepueevheegtdefgeefuddvfeduueduffffffejveeugeef
    udefiedugedugeevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:HtbQZKOpf6lAijKpW9_Pr5yh4mpl_iCTzBgrhcpAOyqca533SltT9g>
    <xmx:HtbQZL9wS9Z9002ex4WucQCmSHmAxdvTCQlirII3AaFzjwWEAITBwg>
    <xmx:HtbQZKU3ZRgTDM9Ai7kUHsVfzYsJYzLE3p_7jTh8PzzSy1Ble7Bv8Q>
    <xmx:HtbQZHbBkCxW26ZBhFU0s_ZnRoDekvMn0n6XNXlI1C3mGO1-ChrD4g>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH v3] x86/hpet: Disable legacy replacement mode after IRQ test
Date: Mon,  7 Aug 2023 13:31:17 +0200
Message-Id: <20230807113117.1277-1-simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As far as I understand the HPET legacy mode is not required after the
timer IRQ test. For previous discussion see [1] and [2]. Keeping it
enabled prevents reaching deeper C-states on some systems and thereby
also S0ix residency. So disable it after the timer IRQ test worked. Note
that this code path is only reached when opt_hpet_legacy_replacement < 0,
so explicit user choice is still honored.

Link: https://lore.kernel.org/xen-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/ # [1]
Link: https://lore.kernel.org/xen-devel/20230718122603.2002-1-simon@invisiblethingslab.com/ # [2]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---

[ Resending v3, now with a unique Message-ID, sorry. ]

Changes in v3:

 - Edit log message and downgrade it to XENLOG_DEBUG.

Changes in v2:

 - Always disable legacy mode after test, not only when ARAT is
   available. See [3] for reasoning.

[3]: https://lore.kernel.org/xen-devel/ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com/

---
 xen/arch/x86/io_apic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 041233b9b7..b4b4cd5939 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1967,6 +1967,8 @@ static void __init check_timer(void)
 
             if ( timer_irq_works() )
             {
+                printk(XENLOG_DEBUG "IRQ test with HPET Legacy Replacement Mode worked - disabling it again\n");
+                hpet_disable_legacy_replacement_mode();
                 local_irq_restore(flags);
                 return;
             }
-- 
2.40.1


