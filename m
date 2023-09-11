Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74779AC0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 00:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599799.935362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfpXv-0004FT-EI; Mon, 11 Sep 2023 22:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599799.935362; Mon, 11 Sep 2023 22:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfpXv-0004D4-Ao; Mon, 11 Sep 2023 22:38:19 +0000
Received: by outflank-mailman (input) for mailman id 599799;
 Mon, 11 Sep 2023 22:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01Lo=E3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qfpXt-0004Cy-Fc
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 22:38:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e479c7af-50f3-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 00:38:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1C27CCE178C;
 Mon, 11 Sep 2023 22:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5E4C116AF;
 Mon, 11 Sep 2023 22:38:07 +0000 (UTC)
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
X-Inumbo-ID: e479c7af-50f3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694471888;
	bh=wFZEt8xGyC/ds1ONEy7QyDUnyXveKEKpVQO0SZ3ZNPo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i4kBJ/oZqPlFPpBezTA6pc2bK7T8zrZunNT2YkbyT+3FJoIKx6yQFCHbzniGNWic9
	 pAYl80njHsr6uZEG5mupha0hB1yX9sjZfOKjfiWVIIz/qF8FR0t70zauMnFULDXFDE
	 p1zLJcCY+Mq+hlZhpSKRDcaV/LUYH0djEYD226voUB7vuGLEIeqr7LDZMPZmzJy5Ct
	 OzMkeWELlm/RT/w15pMnDEojAw07nGZieIro0Up2mNyQR5E0caiIAwfxZ+vQyGojAM
	 uC86pjDIWvJUK7y3xGteTVIdrGOzeTRiwOFtt2zlTvyg+bm9+880hh8NgjL3Tzy4OE
	 /0EQtItCJqlqg==
Date: Mon, 11 Sep 2023 15:38:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Simon Gaiser <simon@invisiblethingslab.com>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2309111534030.1847660@ubuntu-linux-20-04-desktop>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com> <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com> <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1063447677-1694471887=:1847660"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1063447677-1694471887=:1847660
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 11 Sep 2023, Andrew Cooper wrote:
> Physical CPU Hotplug does not pass the bar for being anything more than
> experimental.  It's absolutely not tech-preview level because the only
> demo it has had in an environment (admittedly virtual) which does
> implement the spec in a usable way demonstrates that it doesn't function.
> 
> The fact no-one has noticed until now shows that the feature isn't used,
> which comes back around full circle to the fact that Intel never made it
> work and never shipped it.

So we actually have agreement on how to move forward

---
SUPPORT: downgrade Physical CPU Hotplug to Experimental

The feature is not commonly used, and we don't have hardware to test it,
not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
members.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/SUPPORT.md b/SUPPORT.md
index 3461f5cf2f..02e2f6eaa8 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -48,7 +48,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 
 ### Physical CPU Hotplug
 
-    Status, x86: Supported
+    Status, x86: Experimental
 
 ### Physical Memory
 
--8323329-1063447677-1694471887=:1847660--

