Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5E43C721
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216854.376620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffiK-0005OV-TJ; Wed, 27 Oct 2021 09:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216854.376620; Wed, 27 Oct 2021 09:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffiK-0005MU-Pp; Wed, 27 Oct 2021 09:59:20 +0000
Received: by outflank-mailman (input) for mailman id 216854;
 Wed, 27 Oct 2021 09:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAIZ=PP=casper.srs.infradead.org=BATV+733d164bc6d8c7ae176c+6639+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1mffiI-0005MO-Fc
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:59:19 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 093f47d1-09a4-433a-a7b4-2b2c755d0fae;
 Wed, 27 Oct 2021 09:59:15 +0000 (UTC)
Received: from [2a01:4c8:1042:994a:f240:791a:356:222b] (helo=[IPv6:::1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffgA-00HYMy-VW; Wed, 27 Oct 2021 09:57:21 +0000
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
X-Inumbo-ID: 093f47d1-09a4-433a-a7b4-2b2c755d0fae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=IB3vKlP4on8GCe7l1kqRxw29zumVr5j1/nr3g3ShAqE=; b=TFIclONAtSjKcxHyXMw0hxIXQg
	i4qFpmRUnP0XhR8jx0r1ZLqVzGWnv9mIVHcPsi9zG9WQ2J/E0svgPJHZ/LvBhs7TAq7J9zJ43i77v
	LxpF4ceCthZEDDUxkwZeU0LU9nwkCIg7c7VZx7VXJosiC5OXg/yfwCSg/ZRN+kI9OQYOD0QpZo1Li
	/uafDQmCFr5fdEYZ455y1c71uWucC4UVAeOkl2BanY32VDjOW6CfbndZeTchTqLA3A/QlZV+Ti+j5
	P2KEFwiccphpVCEFqctNvOIpWJMxcn4NyiHbNyakPWd6p10E2q7SCSUWB1TZs0ea7MUef/E18ySzd
	JGx5THPg==;
Date: Wed, 27 Oct 2021 10:57:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Andryuk <jandryuk@gmail.com>,
 josef@oderland.se
CC: boris.ostrovsky@oracle.com, helgaas@kernel.org, jandryuk@gmail.com,
 jgross@suse.com, linux-pci@vger.kernel.org, maz@kernel.org,
 xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_PCI/MSI=3A_Move_non-mask_?= =?US-ASCII?Q?check_back_into_low_level_accessors?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87cznqg5k8.ffs@tglx>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se> <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx> <87cznqg5k8.ffs@tglx>
Message-ID: <0A9FDABA-9067-4811-9B3D-DAFE5589D1A4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html



On 27 October 2021 10:50:15 BST, Thomas Gleixner <tglx@linutronix=2Ede> wr=
ote:
>The recent rework of PCI/MSI[X] masking moved the non-mask checks from th=
e
>low level accessors into the higher level mask/unmask functions=2E
>
>This missed the fact that these accessors can be invoked from other place=
s
>as well=2E The missing checks break XEN-PV which sets pci_msi_ignore_mask=
 and
>also violates the virtual MSIX and the msi_attrib=2Emaskbit protections=
=2E

Not just PV=2E It's Xen HVM guests too=2E

I'll also give it a spin on both Xen and not-Xen=2E Thanks=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

