Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F95ACCCAE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 20:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004763.1384461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMW8J-0000rv-Ay; Tue, 03 Jun 2025 18:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004763.1384461; Tue, 03 Jun 2025 18:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMW8J-0000px-7a; Tue, 03 Jun 2025 18:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1004763;
 Tue, 03 Jun 2025 18:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMW8H-0000pr-Ps
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 18:13:05 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6372a87c-40a6-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 20:13:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C828761129;
 Tue,  3 Jun 2025 18:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BFAC4CEED;
 Tue,  3 Jun 2025 18:13:00 +0000 (UTC)
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
X-Inumbo-ID: 6372a87c-40a6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748974381;
	bh=DXC2BSuZDs+yoKc1QDayEXdrA2LCvsuZkC40+vec9no=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VuQJ5qVVvpS1+hFl07Bpy6IOtuwexmWfGH0Jpq/vx+EoNfHkmpXDg9VT1q2uyAKKn
	 Hoxq5GlY/izqvoqr9vRFOHqivoKE3AYJrqXh9MStjku3TGeL0lXreFvTRCm+SB/7qS
	 1nEL3gIFyunmVDBSG3xqdG415aNM4QWkjurFzODF7L1vXqYs2pSWVvmTPjfY5kehwP
	 jxo7PspwnIsfUBFEUwS4rxbd4hJpfP3op69moaPhsYU4gtNeuEgnyS17W7iXfcl4HF
	 GWuSAYB4Z9bYPARbTmDiUe0Atm6XccEtCAy3Ofpnb/Tb+ceknaxZ7DRd+bHaQqlhjy
	 dYvbraoADKYlA==
Date: Tue, 3 Jun 2025 11:12:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 6/6] tools/arm: exclude iomem from domU extended
 regions
In-Reply-To: <3e8391b7-3b3e-4092-9689-ad0c94059571@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506031112550.1147082@ubuntu-linux-20-04-desktop>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com> <20250508132040.532898-7-stewart.hildebrand@amd.com> <alpine.DEB.2.22.394.2506021738380.1147082@ubuntu-linux-20-04-desktop> <3e8391b7-3b3e-4092-9689-ad0c94059571@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jun 2025, Orzel, Michal wrote:
> On 03/06/2025 02:38, Stefano Stabellini wrote:
> > I plan to commit this patch, unless someone objects
> AFAICT there is a new revision (v3) that has pending comments:
> https://lore.kernel.org/xen-devel/20250513195452.699600-1-stewart.hildebrand@amd.com/

Thanks Michal! Due to the change in CC and 0 email subject I didn't
notice the newer version

