Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC55F6184
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 09:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416625.661266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL63-00043y-Bn; Thu, 06 Oct 2022 07:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416625.661266; Thu, 06 Oct 2022 07:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogL63-00042B-8z; Thu, 06 Oct 2022 07:15:07 +0000
Received: by outflank-mailman (input) for mailman id 416625;
 Thu, 06 Oct 2022 07:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogL61-00041m-6C
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 07:15:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98ee0826-4546-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 09:15:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C3081F893;
 Thu,  6 Oct 2022 07:15:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A893A1376E;
 Thu,  6 Oct 2022 07:15:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jMLaJnaAPmMpEwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 07:15:02 +0000
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
X-Inumbo-ID: 98ee0826-4546-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665040503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F4Hi4dJTyEkg0FruOU9TNRrOsyiLA+8nKk3nWX9VhZE=;
	b=ZhV6kFBaLi5TbOhS0qhdtyfiCwBaPWE8FdyiFl7JZTsGqjUjwktFVVsm7MfLtRf6z1qMs7
	gNEidOcTQv3IXG00aNrtlX3Sg3vluSmR3qCFdeoHIUikCbD1jRqdAicy+D879PW4QVHlzp
	/e4Nlyj5Uc7/GCpAOPtzW+zlk+tZBvc=
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
Subject: [PATCH 0/3] xen/virtio: support grant based virtio on x86
Date: Thu,  6 Oct 2022 09:14:57 +0200
Message-Id: <20221006071500.15689-1-jgross@suse.com>
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
 drivers/xen/grant-dma-ops.c  | 81 +++++++++++++++++++++++++-----------
 include/xen/xen-ops.h        |  1 +
 4 files changed, 59 insertions(+), 27 deletions(-)

-- 
2.35.3


