Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF25F744B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 08:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417406.662101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogh3M-0001QL-S9; Fri, 07 Oct 2022 06:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417406.662101; Fri, 07 Oct 2022 06:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogh3M-0001OD-Pd; Fri, 07 Oct 2022 06:41:48 +0000
Received: by outflank-mailman (input) for mailman id 417406;
 Fri, 07 Oct 2022 06:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogh3L-0001O7-M5
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 06:41:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d094e18-460b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 08:41:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DB8C218FC;
 Fri,  7 Oct 2022 06:41:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A588B13A3D;
 Fri,  7 Oct 2022 06:41:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cy/WJinKP2PjSQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Oct 2022 06:41:45 +0000
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
X-Inumbo-ID: 1d094e18-460b-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665124906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fjnPZrMU8HQlRaEL1NbINikk37iX63+Ug6moJ46OZmk=;
	b=hYTSewCYiI+AB2wh7D9K8770bh/oZfm6y1fNcNhyF18xnoHpjxv9vyOEKHo/JgmjOEUkSr
	ejlzKkTwdN78gU9FbLy5mRYt+ERVN2a8+E9cpQeoTYHfRD2iIUWanZ7JciAtrBVkEUYRfZ
	t7xafpoAia1OgwgajW+TLytKRgpk9x0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 0/3] xen/virtio: support grant based virtio on x86
Date: Fri,  7 Oct 2022 08:41:40 +0200
Message-Id: <20221007064143.10049-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic support for virtio with grants on x86 by defaulting the
backend to be in dom0 in the case the guest kernel was built with
CONFIG_XEN_VIRTIO_FORCE_GRANT.

Juergen Gross (3):
  xen/virtio: restructure xen grant dma setup
  xen/virtio: use dom0 as default backend for
    CONFIG_XEN_VIRTIO_FORCE_GRANT
  xen/virtio: enable grant based virtio on x86

 arch/x86/xen/enlighten_hvm.c |  2 +-
 arch/x86/xen/enlighten_pv.c  |  2 +-
 drivers/xen/grant-dma-ops.c  | 83 +++++++++++++++++++++++++-----------
 include/xen/xen-ops.h        |  6 +++
 4 files changed, 65 insertions(+), 28 deletions(-)

-- 
2.35.3


