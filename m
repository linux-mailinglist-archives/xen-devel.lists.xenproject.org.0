Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5D4481F2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223389.386075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5kd-0000JL-Ku; Mon, 08 Nov 2021 14:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223389.386075; Mon, 08 Nov 2021 14:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5kd-0000G0-HM; Mon, 08 Nov 2021 14:35:59 +0000
Received: by outflank-mailman (input) for mailman id 223389;
 Mon, 08 Nov 2021 14:35:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk5kb-0000Fp-Oc
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:35:57 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f1b3b5b-40a1-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 15:35:56 +0100 (CET)
Received: from zn.tnic (p200300ec2f331100b486bab6e60d7aaf.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:b486:bab6:e60d:7aaf])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1A75E1EC01FC;
 Mon,  8 Nov 2021 15:35:56 +0100 (CET)
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
X-Inumbo-ID: 2f1b3b5b-40a1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636382156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=B6oOQ1q4gjLTOu5usgfET43xDRmf4tLazw1TZ6CRXFw=;
	b=Upd25HzfEqhrG5TAXmV4X7VLTXjG+2mbIZvAcNaA5XdFGwWxC22cjGdH367SqKuC2YI35V
	XePkT+plNO8Rcdx9qRLbflORPHDjzc4q/HfinrM2oVoUmKJ3f3FbXqZbeiIVI7zzNRafCc
	NDGlsVX5pxz7i7hCYlNzvvCrAxbHbAs=
Date: Mon, 8 Nov 2021 15:35:50 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alan Stern <stern@rowland.harvard.edu>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
	intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-remoteproc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <YYk1xi3eJdMJdjHC@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
 <YYkzJ3+faVga2Tl3@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YYkzJ3+faVga2Tl3@zn.tnic>

On Mon, Nov 08, 2021 at 03:24:39PM +0100, Borislav Petkov wrote:
> I guess I can add another indirection to notifier_chain_register() and
> avoid touching all the call sites.

IOW, something like this below.

This way I won't have to touch all the callsites and the registration
routines would still return a proper value instead of returning 0
unconditionally.

---
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..04f08b2ef17f 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -19,14 +19,12 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  *	are layered on top of these, with appropriate locking added.
  */
 
-static int notifier_chain_register(struct notifier_block **nl,
-		struct notifier_block *n)
+static int __notifier_chain_register(struct notifier_block **nl,
+				     struct notifier_block *n)
 {
 	while ((*nl) != NULL) {
-		if (unlikely((*nl) == n)) {
-			WARN(1, "double register detected");
-			return 0;
-		}
+		if (unlikely((*nl) == n))
+			return -EEXIST;
 		if (n->priority > (*nl)->priority)
 			break;
 		nl = &((*nl)->next);
@@ -36,6 +34,18 @@ static int notifier_chain_register(struct notifier_block **nl,
 	return 0;
 }
 
+static int notifier_chain_register(struct notifier_block **nl,
+				   struct notifier_block *n)
+{
+	int ret = __notifier_chain_register(nl, n);
+
+	if (ret == -EEXIST)
+		WARN(1, "double register of notifier callback %ps detected",
+			n->notifier_call);
+
+	return ret;
+}
+
 static int notifier_chain_unregister(struct notifier_block **nl,
 		struct notifier_block *n)
 {


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

