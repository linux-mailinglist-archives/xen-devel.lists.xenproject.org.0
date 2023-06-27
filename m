Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00AD7401FC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 19:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556205.868540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECKp-0005hJ-07; Tue, 27 Jun 2023 17:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556205.868540; Tue, 27 Jun 2023 17:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECKo-0005f4-TS; Tue, 27 Jun 2023 17:18:34 +0000
Received: by outflank-mailman (input) for mailman id 556205;
 Tue, 27 Jun 2023 17:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rRYj=CP=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qECKn-0005ey-7S
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 17:18:33 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a214372b-150e-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 19:18:29 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id CAE6D8C3F3;
 Tue, 27 Jun 2023 19:18:27 +0200 (CEST)
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
X-Inumbo-ID: a214372b-150e-11ee-8611-37d641c3527e
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1687886308; bh=6gFDNhhGJv90UdgxcbzryDH6ZG6dLvIYFXDAuTPtvSU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bySKOQZltr9ohomUzM2aa5V74hK2GS3Z0zDb44uDmzzs/QvDRuAyvfkpp/sqmUsbo
	 TYNOTc/GZ87znxp5/6S40uTgA1tFep572/XZFIr4a0dvnpFyyemllCPFmTL8ejWTBR
	 jtihWMAS44zGXF3GRLhcBphwoEtpIHavdX+JxLcjBcAgrze60nJp9hzy2wm/xMLv2W
	 f3DxfaFhc3IY3NIsJPaGj3Z1shXXSEaD9AOnCOuEnsKIDh9ZxDEfwP+mpg5g+evpr2
	 SvnstvX48os/E5D1n8oEawxiBdrFV1sIno0QU0c2fjDy6lmqnnEG5s2xs8if27cr6c
	 HuelAtwFx36+A==
Date: Tue, 27 Jun 2023 19:18:26 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: unexport swiotlb_active v2
Message-ID: <20230627191826.41aba02e@meshulam.tesarici.cz>
In-Reply-To: <20230619091941.GA17034@lst.de>
References: <20230612142542.111581-1-hch@lst.de>
	<20230619091941.GA17034@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jun 2023 11:19:41 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Any comments?  I'd really like to finish this off this merge window..

Let me second this request. My dynamic SWIOTLB patch series also has a
dependence on this.

Petr T

