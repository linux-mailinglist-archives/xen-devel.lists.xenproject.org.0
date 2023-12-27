Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0181EB8D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Dec 2023 03:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660090.1029670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIJmP-0003Q4-NQ; Wed, 27 Dec 2023 02:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660090.1029670; Wed, 27 Dec 2023 02:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIJmP-0003Nr-Km; Wed, 27 Dec 2023 02:36:21 +0000
Received: by outflank-mailman (input) for mailman id 660090;
 Wed, 27 Dec 2023 02:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEAl=IG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rIJmO-0003Nl-GM
 for xen-devel@lists.xenproject.org; Wed, 27 Dec 2023 02:36:20 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b45e45ff-a460-11ee-98ed-6d05b1d4d9a1;
 Wed, 27 Dec 2023 03:36:17 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A1DC5C008E;
 Tue, 26 Dec 2023 21:36:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 26 Dec 2023 21:36:14 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Dec 2023 21:36:12 -0500 (EST)
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
X-Inumbo-ID: b45e45ff-a460-11ee-98ed-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1703644574; x=1703730974; bh=35P8KX6pV0F6+37gMXxj8OuTbafTci2u
	iY/DR0a7/AU=; b=zgnm3VQWEtCqsypVisx47USWWcn2eO5UpYGpTY/stM/v0ZKW
	1iDDGg9ODDJZmnxiPLb1co+Y6kxbeS9bhlmBbrb+dtLNEgzneP8stUjL5uqzGDYk
	sa4WUd8vokjXBNM3mQmVwJMVXxkDmE+WaSWGm48aTrkHReWrQ1iYFJ2TlKnkpR/7
	qdXa39drfv40WBKMNB2xx/ACq1RKdfXBhaCt8vNAN/1jzON16xakv31TLrnDVAdo
	4NgZElbGZvQfY8xn9hrClCVMxAXXP6c3Le4ubzQA7X71SYtqKzCmSXwrc3uZpEFS
	SQvVhNBRsuyi/xI1FW1XiWmWOROi/VSEStv7Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1703644574; x=1703730974; bh=35P8KX6pV0F6+
	37gMXxj8OuTbafTci2uiY/DR0a7/AU=; b=JEIJffjkf9gZETMxHsBJZyRiVs7P8
	Tr0JAIrwdzgLa6cUq87oCJJvVGUst8yVvU8tjqipyaH/yyoxmX9Rt2ci3FlVpjdD
	SG0zgngAGXBE9uxXrrODs5yKiszg8uIS5g3LtmoFVbhKJz8Afss4aSZAzQ5/m/dq
	Tu3nwIb7Z75cBnsKbl4RF+AvgtFj0mCK99OxmR350sp0T6jZEwBrK9LGUJ0obt2M
	TPj4M1eDeBSZ49+4kZdj/Ioojse7HWWp4eX9zmOnsG6Hixn+nUqXYsfgsZkg/lQs
	upMXu0XTZih0vLlqO1BthZs/4s/4E3/tgkJjvQF9DuPYVEjd66cGi5XSw==
X-ME-Sender: <xms:nY2LZbo2x3mfV7LpU58bblzxrlEDPMFZaIysK4ldkYB06uVF0-5yXA>
    <xme:nY2LZVqFa9w1LVqRsb9nAvogFF0hxYxKj0VBndB3Am-eY1nliRHITL4XPujirmtTS
    yj82GQnwHu9vg>
X-ME-Received: <xmr:nY2LZYP77mVaK2-SH3Kq_INbOjfR1owJ_GSeSxXD37HRnMRiLFz59xorTsJlDZ7HqF1sGl8qhDEyzzgXCcaatdf4iMMPCh1sUOb3eljluoDtjd5K2nk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddvkedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:nY2LZe40YNhl05BimoXcbZ-Y3WcYl5a4I40vKVYYF9ILOQT8dZ2DNA>
    <xmx:nY2LZa4hMPzHyVaIZpCpQxlGQ_8KjmTk_vGwZ-mwwm_iisQ8KFdsDA>
    <xmx:nY2LZWhHDxAngbOCXewNBfYi8gGMYzbHru9zXpu62d74tkCYMHhBLQ>
    <xmx:no2LZQkyAl-02iLqHDYKYVxZVM7nVFzW1aI0iAEtNou1HqlYfXVf0Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Neowutran <xen@neowutran.ovh>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Disable relocating memory for qemu-xen in stubdomain too
Date: Wed, 27 Dec 2023 03:35:19 +0100
Message-ID: <20231227023544.1253277-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to comments (and experiments) qemu-xen cannot handle memory
reolcation done by hvmloader. The code was already disabled when running
qemu-xen in dom0 (see libxl__spawn_local_dm()), but it was missed when
adding qemu-xen support to stubdomain. Adjust libxl__spawn_stub_dm() to
be consistent in this regard.

Reported-by: Neowutran <xen@neowutran.ovh>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 14b593110f7c..ed620a9d8e14 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2432,6 +2432,16 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
                         "%s",
                         libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
     }
+    /* Disable relocating memory to make the MMIO hole larger
+     * unless we're running qemu-traditional and vNUMA is not
+     * configured. */
+    libxl__xs_printf(gc, XBT_NULL,
+                     libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate",
+                                    libxl__xs_get_dompath(gc, guest_domid)),
+                     "%d",
+                     guest_config->b_info.device_model_version
+                        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
+                     !libxl__vnuma_configured(&guest_config->b_info));
     ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
     if (ret<0) {
         LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
-- 
2.41.0


