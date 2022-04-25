Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10350DABA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 09:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312432.529675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitcJ-0005SR-4k; Mon, 25 Apr 2022 07:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312432.529675; Mon, 25 Apr 2022 07:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitcJ-0005Qe-1L; Mon, 25 Apr 2022 07:58:43 +0000
Received: by outflank-mailman (input) for mailman id 312432;
 Mon, 25 Apr 2022 07:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Knhg=VD=bombadil.srs.infradead.org=BATV+0e76985a1041d5454cb7+6819+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nitcG-0005QU-Bn
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 07:58:41 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81e9e2c8-c46d-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 09:58:37 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nitc6-008hbI-PT; Mon, 25 Apr 2022 07:58:30 +0000
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
X-Inumbo-ID: 81e9e2c8-c46d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bk7N8VtSWAvLQd3yMexQM6sFuFonXwjn/dFWlACLuw4=; b=KrNUg6E9jRh6S9p23phIwDD+A9
	2yjbvoiMW3hXguiVED3XGeLI5RAp9z3c3rmBxo0F++ml3YQ8tcOKSZOhMELY6kv+Bo4zE7qjAcWtU
	4e1Lurbi4qCxDhsiGkas5y6uhLAsCknOpNVtA8OPhC29Rp4ibbQQWk7Dx2gUkzdJLCazkHqGz7Izp
	3JA0+CRtthmVp/yKRShz0BN0MuqCJ6vXAbzrTgeGDRw/XkPuzBc6ZO2k7jO4uF8Mglc5aF6PsTyYT
	WrTKukboCsRrzIBFPXxbH/jQ1NFzu8tuncjK13ASp0sXfOTrrMx8nRWkxEyq52l9iDKiiOEFi2QRD
	o9WfNkjA==;
Date: Mon, 25 Apr 2022 00:58:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: Oleksandr <olekstysh@gmail.com>, Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
Message-ID: <YmZUpua3hkCPdbfx@infradead.org>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Apr 25, 2022 at 09:47:49AM +0200, Juergen Gross wrote:
> > Would the Xen specific bits fit into Confidential Computing Platform
> > checks? I will let Juergen/Boris comment on this.
> 
> I don't think cc_platform_has would be correct here. Xen certainly
> provides more isolation between guests and dom0, but "Confidential
> Computing" is basically orthogonal to that feature.

The point of cc_platform_has is to remove all these open code checks.
If a Xen hypervisor / dom0 can't access arbitrary guest memory for
virtual I/O and we need special APIs for that it certainly false
into the scope of cc_platform_has, even if the confientiality is
rather limited.

