Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24D6C8A50
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 03:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514518.796858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftyf-0000ts-0R; Sat, 25 Mar 2023 02:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514518.796858; Sat, 25 Mar 2023 02:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftye-0000rD-T5; Sat, 25 Mar 2023 02:49:56 +0000
Received: by outflank-mailman (input) for mailman id 514518;
 Sat, 25 Mar 2023 02:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pftyd-0000qg-Jj
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 02:49:55 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a6e6dd-cab7-11ed-85db-49a42c6b2330;
 Sat, 25 Mar 2023 03:49:53 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 39B34320095F;
 Fri, 24 Mar 2023 22:49:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 Mar 2023 22:49:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 22:49:48 -0400 (EDT)
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
X-Inumbo-ID: b6a6e6dd-cab7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1679712589; x=1679798989; bh=8o
	ti41qbePZhuAMpffOpGT2bFix/gpX6jTEVpChiMLk=; b=kth/QkpBw1MqpUUOey
	wldlZVgNVNOwPD+5x7ykdLM47i1Aa3Bowg1oAXgdffGU3aVmQl/rKp+Xjgxp5U50
	ypIqdmAJs5+UFlm+vCfMGMp0JFFSqvnatCYsIGlGVF6AQV5mtJDyPGBRPefIzJ5h
	VviJIpdpP+7DJiQVYl2eku43P5aCbNPS/eIVWnjidQZV/+6woNYnqqkEahRAfJZZ
	2IweeDnoiGX1LUS5Xr2fuRifro8OHpr3CutJ0yTGuETmmkyAimb0/4Yx08GAx7NZ
	m388F2DQBzxKkbmckmMVsVXtiw98rtmEcwxXqQ9txE3URzgTq3H8poh9Lm7s1+ZD
	qo+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679712589; x=1679798989; bh=8oti41qbePZhuAMpffOpGT2bFix/gpX6jTE
	VpChiMLk=; b=GZcwEOc2Pe2SXnPnXmHWBwbsGsURgMzlae6em4O/MLXT+KSkq9C
	u0csQZEySVt76c7v8a6cpc37xNVhR1rV9kFHJVAoMlCsD6sAdYOY7M6NERV9hpsr
	PQHib5Q5a9lkz+kSRV0fGXAO4aSs8Q5xiWlXKRjbwqgsXVRmM5Vt3HNf1p5WqAkg
	qDqn8fTh8I1xfoxkmHPWaCe+YccfEvhb9WQwOG0tD1yvwsjXk9iNN5vCJ+v2Po9f
	D+IebUwlsK4tszYiO/iPnHP6C6IVQyinVnoCtdXcIKE7zFVjcs2AlioO7q57xVH5
	l4h8IhWpejB6ehlnMoq94lMCe2hblp//BIA==
X-ME-Sender: <xms:TWEeZAWQfdbWymhi0PDaIria3IwMU1TdxQJ6GnxLCGwQGWgbD2u-uA>
    <xme:TWEeZEnsbIVk4v_C7KdozhFkmDjZf9mHL9Sk7neEh92Cc-uJSxCN9heHYQVvwkGYV
    D3k81x_ZmpL8A>
X-ME-Received: <xmr:TWEeZEaJVsSaI7MsNKXCMMc6r2-7n_U3fMDzLaS86B6weg-c-LDdHSKjikiREZqzgIyy71mF8VWuwhYUvzK8cinVFP0Lpv9UhpIq9hXWvwVo2C9WW7au>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegjedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:TWEeZPXCmN0WXg37_97KA_MrfICs3QOyusrSlZQzo2QjHZxMkSfTtw>
    <xmx:TWEeZKnkUgW3z8_4wq3WudMkSrbAFPgat4UfCFQs1eQVSrbvcLpp8Q>
    <xmx:TWEeZEfObZhXz1kK4Am8EPlENfMfCHnRt_-EGHvhS0uT4njPnMVL8Q>
    <xmx:TWEeZMgVMagkO9wws1tUGA3zWWoibE9EdLvhjc09EC32ml2V_74I-w>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Date: Sat, 25 Mar 2023 03:49:24 +0100
Message-Id: <20230325024924.882883-3-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some firmware/devices are found to not reset MSI-X properly, leaving
MASKALL set. Xen relies on initial state being both disabled.
Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
setting it due to msix->host_maskall or msix->guest_maskall. Clearing
just MASKALL might be unsafe if ENABLE is set, so clear them both.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - new patch
---
 xen/drivers/passthrough/msi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index ce1a450f6f4a..60adad47e379 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -48,6 +48,13 @@ int pdev_msi_init(struct pci_dev *pdev)
         ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
         msix->nr_entries = msix_table_size(ctrl);
 
+        /*
+         * Clear both ENABLE and MASKALL, pci_reset_msix_state() relies on this
+         * initial state.
+         */
+        ctrl &= ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
+        pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);
+
         pdev->msix = msix;
     }
 
-- 
2.39.2


