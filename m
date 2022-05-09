Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA10B51FBD5
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324439.546482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no23c-0002XW-Bu; Mon, 09 May 2022 12:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324439.546482; Mon, 09 May 2022 12:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no23c-0002Uq-8L; Mon, 09 May 2022 12:00:08 +0000
Received: by outflank-mailman (input) for mailman id 324439;
 Mon, 09 May 2022 12:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l4I2=VR=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1no23b-0002Ub-3K
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:00:07 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90257bdc-cf8f-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 14:00:05 +0200 (CEST)
Received: from [127.0.0.1] (unknown [46.183.103.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 56BFE1EC0529;
 Mon,  9 May 2022 13:59:59 +0200 (CEST)
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
X-Inumbo-ID: 90257bdc-cf8f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1652097600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZ0FUxK106JbsF1xbRYLQqCEry+KRNYRswr1LpAp2pE=;
	b=VxzKXdJGegayDkmVXDvQFwrNls2RPi2YfuiEOm93VxrDV7gOSr5Sr6E2eqQXUDudljUWm2
	naM86eaoC/NmDPrzV3lyAs+o3FssqBbS9HxGYrGrmlxM95YCGfpfObKvrMb/fxKltUycds
	KZlVEiMd3cmC5Uyz/n2jiE3kMh2rc2M=
Date: Mon, 09 May 2022 11:59:49 +0000
From: Boris Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org,
 linux-s390@vger.kernel.org, virtualization@lists.linux-foundation.org
CC: Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/2=5D_virtio=3A_replace_arc?= =?US-ASCII?Q?h=5Fhas=5Frestricted=5Fvirtio=5Fmemory=5Faccess=28=29?=
In-Reply-To: <20220504155703.13336-3-jgross@suse.com>
References: <20220504155703.13336-1-jgross@suse.com> <20220504155703.13336-3-jgross@suse.com>
Message-ID: <1376936D-E067-430C-A02D-565959F83BE0@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 4, 2022 3:57:03 PM UTC, Juergen Gross <jgross@suse=2Ecom> wrote:
>Instead of using arch_has_restricted_virtio_memory_access() together
>with CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS, replace those
>with platform_has() and a new platform feature
>PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS=2E
>
>Signed-off-by: Juergen Gross <jgross@suse=2Ecom>
>---
>V2:
>- move setting of PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS in SEV case
>  to sev_setup_arch()=2E
>V3:
>- remove Hyper-V chunk (Michael Kelley)
>- remove include virtio_config=2Eh from mem_encrypt=2Ec (Oleksandr Tyshch=
enko)
>- add comment for PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS (Oleksandr Tyshch=
enko)
>---
> arch/s390/Kconfig                |  1 -
> arch/s390/mm/init=2Ec              | 13 +++----------
> arch/x86/Kconfig                 |  1 -
> arch/x86/mm/mem_encrypt=2Ec        |  7 -------
> arch/x86/mm/mem_encrypt_amd=2Ec    |  4 ++++
> drivers/virtio/Kconfig           |  6 ------
> drivers/virtio/virtio=2Ec          |  5 ++---
> include/linux/platform-feature=2Eh |  6 +++++-
> include/linux/virtio_config=2Eh    |  9 ---------
> 9 files changed, 14 insertions(+), 38 deletions(-)

Acked-by: Borislav Petkov <bp@suse=2Ede>
--=20
Sent from a device which is ok for reading mail but awful for writing=2E P=
lease excuse any shortcomings=2E

