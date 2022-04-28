Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC85513DE3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 23:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316793.535847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkC0j-00060L-Qi; Thu, 28 Apr 2022 21:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316793.535847; Thu, 28 Apr 2022 21:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkC0j-0005xq-Nm; Thu, 28 Apr 2022 21:49:17 +0000
Received: by outflank-mailman (input) for mailman id 316793;
 Thu, 28 Apr 2022 21:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkC0i-0005xk-Dh
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 21:49:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b864178-c73d-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 23:49:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0C6E61F8C;
 Thu, 28 Apr 2022 21:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A082EC385AD;
 Thu, 28 Apr 2022 21:49:11 +0000 (UTC)
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
X-Inumbo-ID: 0b864178-c73d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651182552;
	bh=N7ZQRSxaxRoMXrt1DERfRx93WB3JcFzn7TVVB0S9qmw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aNKDR2lwKqqTjZzHIfPg3iPMrs4H0KuqbdLlT/nvVSOTZ7MivpG44bUt6Czd5lkJU
	 1rGVYKsyXEY+5EvR9fdWwk14DhvVPsqJ57IhUp7KLUL8p+1SYGiBwsMckVcQ6865FL
	 VnJ3PKysn2MJwr3sURNXf1JCJc7Dt/yBD7oMjH0VncXglu7gWWixMJpgXZGaukPc/J
	 aLvu6wiQI7SLTpiJNsBE68CHAJOMV/3bhZAIQmLyS1nvEWL2MsIxSaK8nuYPvwMFTR
	 1AF7toPAqGQneikfdGm54reUsJLy4w0ZccgDiGAaTc/FtSjXMVsmlx9w3IhvcPxkt2
	 +OkWezDq+J65Q==
Date: Thu, 28 Apr 2022 14:49:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>, 
    boris.ostrovsky@oracle.com
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
In-Reply-To: <20220428132737.GA13999@lst.de>
Message-ID: <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop>
References: <20220423171422.1831676-1-hch@lst.de> <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop> <20220428132737.GA13999@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Apr 2022, Christoph Hellwig wrote:
> On Tue, Apr 26, 2022 at 04:07:45PM -0700, Stefano Stabellini wrote:
> > > Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Do you want to take this through the Xen tree or should I pick it up?
> Either way I'd love to see some testing on x86 as well.

I agree on the x86 testing. Juergen, Boris?

I'd say to take this patch via the Xen tree but Juergen has just sent a
Xen pull request to Linux last Saturday. Juergen do you plan to send
another one? Do you have something else lined up? If not, it might be
better to let Christoph pick it up.

