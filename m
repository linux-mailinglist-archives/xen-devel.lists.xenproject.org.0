Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2951FB92
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 13:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324433.546470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no1sp-00009n-5f; Mon, 09 May 2022 11:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324433.546470; Mon, 09 May 2022 11:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no1sp-00007s-2T; Mon, 09 May 2022 11:48:59 +0000
Received: by outflank-mailman (input) for mailman id 324433;
 Mon, 09 May 2022 11:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l4I2=VR=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1no1sl-00007m-00
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 11:48:58 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4ef892-cf8d-11ec-a406-831a346695d4;
 Mon, 09 May 2022 13:48:52 +0200 (CEST)
Received: from [127.0.0.1] (unknown [46.183.103.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 601E71EC0529;
 Mon,  9 May 2022 13:48:47 +0200 (CEST)
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
X-Inumbo-ID: ff4ef892-cf8d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1652096927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OBcNvdGojA+kgezS1jEjzLjyoytYIqi04DLdwTBilBk=;
	b=jS4tFDIHbr7C3Uu/RAAiy+WGqeZJHXRjw/EI6aNobbXRodJ0Tb4PfSNpoOHW+KbqVJeaHw
	cv0CqgBMT/MbupN4iHymfPvSKpYZkSx6O42ICf+XF0of+KIBHBQgjFpRjluZ0Nz7tlLUS1
	0hHrdCu2/GVq2VEhhdnUoA07R5Levug=
Date: Mon, 09 May 2022 13:48:44 +0200
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
Subject: Re: [PATCH v3 1/2] kernel: add platform_has() infrastructure
User-Agent: K-9 Mail for Android
In-Reply-To: <20220504155703.13336-2-jgross@suse.com>
References: <20220504155703.13336-1-jgross@suse.com> <20220504155703.13336-2-jgross@suse.com>
Message-ID: <FBBBF0AE-05CD-4DE2-B656-C09C976600DA@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 4, 2022 5:57:02 PM GMT+02:00, Juergen Gross <jgross@suse=2Ecom> wro=
te:
>Add a simple infrastructure for setting, resetting and querying
>platform feature flags=2E
>
>Flags can be either global or architecture specific=2E
>
>Signed-off-by: Juergen Gross <jgross@suse=2Ecom>
>---
>V2:
>- rename set/reset functions to platform_[set|clear]() (Boris Petkov,
>  Heiko Carstens)
>- move function implementations to c file (Boris Petkov)
>---
> MAINTAINERS                            |  8 ++++++++
> include/asm-generic/Kbuild             |  1 +
> include/asm-generic/platform-feature=2Eh |  8 ++++++++
> include/linux/platform-feature=2Eh       | 15 ++++++++++++++
> kernel/Makefile                        |  2 +-
> kernel/platform-feature=2Ec              | 27 ++++++++++++++++++++++++++
> 6 files changed, 60 insertions(+), 1 deletion(-)
> create mode 100644 include/asm-generic/platform-feature=2Eh
> create mode 100644 include/linux/platform-feature=2Eh
> create mode 100644 kernel/platform-feature=2Ec

Nice and simple, I like=2E

Acked-by: Borislav Petkov <bp@suse=2Ede>
--=20
Sent from a device which is good for reading mail but awful for writing=2E=
 Please excuse any shortcomings=2E

