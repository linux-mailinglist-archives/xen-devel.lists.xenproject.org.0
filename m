Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69769A12F7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 21:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820299.1233747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1A5y-00026a-ST; Wed, 16 Oct 2024 19:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820299.1233747; Wed, 16 Oct 2024 19:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1A5y-00024N-Pf; Wed, 16 Oct 2024 19:54:10 +0000
Received: by outflank-mailman (input) for mailman id 820299;
 Wed, 16 Oct 2024 19:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OxVE=RM=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1t1A5w-00024B-M3
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 19:54:08 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d8a6d2-8bf8-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 21:54:05 +0200 (CEST)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1t1A5q-00FqPA-ST
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 19:54:04 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 1AAB8AF1E94
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 20:54:04 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id 6VBz4ljSGv2m for <xen-devel@lists.xenproject.org>;
 Wed, 16 Oct 2024 20:54:03 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id DDBECAF1E91
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 20:54:03 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id C77CD2B8; Wed, 16 Oct 2024 20:54:03 +0100 (BST)
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
X-Inumbo-ID: 65d8a6d2-8bf8-11ef-99a3-01e77a169b0f
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Wed, 16 Oct 2024 20:54:03 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: dm_restrict=1 bios='ovmf' boot='d': can't boot from .iso image
Message-ID: <ZxAZ255dNHLjWwUE@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

We've encountered a problem booting an 'ovmf' hvm instance from a .iso
image when dm_restrict=1.  The deprivileged qemu process can't connect
the .iso and in the qemu-dm .log:

qemu-system-i386: failed to create 'qdisk' device '5632': realization of device xen-cdrom failed: failed xs_open: No such file or directory

The problem is the qemu process is unable to open /dev/xen/{xenbus,
evtchn,gntdev}.  If I make those 0666 then no problem but that isn't
a permanent solution so currently we do dm_restrict=0 when
necessary.  If bios='seabios' then there is no need for any workaround.
Are there any suggestions on alternative ways we could look at
working out a solution?

Xen version is 4.18.3 with qemu built from the associated tag.  We do have
some local patches but I don't think any would interfere with this.

Thanks,
James

