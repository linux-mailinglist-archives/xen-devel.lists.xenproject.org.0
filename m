Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C067570771C
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 03:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536123.834295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzRzZ-0006yp-1o; Thu, 18 May 2023 00:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536123.834295; Thu, 18 May 2023 00:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzRzY-0006xs-VF; Thu, 18 May 2023 00:59:40 +0000
Received: by outflank-mailman (input) for mailman id 536123;
 Thu, 18 May 2023 00:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o87v=BH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzRzX-0006xm-EZ
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 00:59:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c74d91-f517-11ed-b22b-6b7b168915f2;
 Thu, 18 May 2023 02:59:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88F7C61990;
 Thu, 18 May 2023 00:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B264C433D2;
 Thu, 18 May 2023 00:59:33 +0000 (UTC)
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
X-Inumbo-ID: 41c74d91-f517-11ed-b22b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684371575;
	bh=NXvLc3Z1//DALPEDIkF8W+GldJEwq3S9o4P8wPwCX94=;
	h=Date:From:To:cc:Subject:From;
	b=n+teuAyrQ1fqs3mAAyb9exYm3e3X8si+CiEKueIlkSDAA4pZ9IHoHOtB5bfxa5Vao
	 xVb6AubRrRajE+ufB2Knmd7sZuNDuK29jZ9nLeyh4gL7QLXCv8ATKlFcniDWLl5/cC
	 EqSFkdxDazTsHY2Jl43Y7DZHtQmP3ubDBd35oufziWmfpx7560R2ikFazgloQL3DBZ
	 vVLgoLYzoHVwY5yGNV8yCbrLNcuuCVQ8OdZTxNgQOiiGWIPkfDmvUT4clHs4CE2wU6
	 BBN7sNw2ziTecpRu4D1pc24myys0KBN83fnVk/OcKPbtxgHL87yi/TVQYKrlVzk2vy
	 wKJJR9/VmZf/Q==
Date: Wed, 17 May 2023 17:59:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com, roger.pau@citrix.com
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com, 
    xenia.ragiadakou@amd.com
Subject: PVH Dom0 related UART failure
Message-ID: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
Zen3 system and we already have a few successful tests with it, see
automation/gitlab-ci/test.yaml.

We managed to narrow down the issue to a console problem. We are
currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
options, it works with PV Dom0 and it is using a PCI UART card.

In the case of Dom0 PVH:
- it works without console=com1
- it works with console=com1 and with the patch appended below
- it doesn't work otherwise and crashes with this error:
https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK

What is the right way to fix it?

Keep in mind that I don't have access to the system except via gitlab-ci
pipelines. Marek (CCed) might have more info on the system and the PCI
UART he is using in case it's needed.

Many thanks for any help you can provide.

Cheers,

Stefano


diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 212a9c49ae..57623bc091 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -429,17 +428,6 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
 #ifdef NS16550_PCI
     if ( uart->bar || uart->ps_bdf_enable )
     {
-        if ( uart->param && uart->param->mmio &&
-             rangeset_add_range(mmio_ro_ranges, PFN_DOWN(uart->io_base),
-                                PFN_UP(uart->io_base + uart->io_size) - 1) )
-            printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
-
-        if ( pci_ro_device(0, uart->ps_bdf[0],
-                           PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2])) )
-            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
-                   uart->ps_bdf[0], uart->ps_bdf[1],
-                   uart->ps_bdf[2]);
-
         if ( uart->msi )
         {
             struct msi_info msi = {

