Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF7C50FBD6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 13:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313818.531582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njJBu-0006Ii-U3; Tue, 26 Apr 2022 11:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313818.531582; Tue, 26 Apr 2022 11:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njJBu-0006GW-R6; Tue, 26 Apr 2022 11:17:10 +0000
Received: by outflank-mailman (input) for mailman id 313818;
 Tue, 26 Apr 2022 11:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c92l=VE=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1njJBs-0006GQ-NC
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 11:17:08 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6779b7c2-c552-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 13:17:06 +0200 (CEST)
Received: from zn.tnic (p5de8eeb4.dip0.t-ipconnect.de [93.232.238.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 333FA1EC0503;
 Tue, 26 Apr 2022 13:17:01 +0200 (CEST)
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
X-Inumbo-ID: 6779b7c2-c552-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1650971821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=0/pzm9e2iDycI7rO928zqJLiV9GuD5I4xPzZfSe633g=;
	b=QKn7p9c+Xx58HkrgfK0vaZ0Hq8RwnOhXDyfVc1uhejI5I0GIt/UsYcC87wFSHsiwlfBDip
	KIXZVbnVxB9vh/6WhJoc0woZlZd+mvo/f1R0qgbcG+6qGZNU8S4gmoJ+P8RlLJPQXSVns4
	hu2B8sKa65pKnilCIQ3ZuI1qd8xMtrw=
Date: Tue, 26 Apr 2022 13:16:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: Oleksandr <olekstysh@gmail.com>, Christoph Hellwig <hch@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
Message-ID: <YmfUqlKnk0Mbmvpk@zn.tnic>
References: <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
 <YmZUpua3hkCPdbfx@infradead.org>
 <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
 <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com>
 <YmcR5bfaYh1z7VUq@zn.tnic>
 <7d89848a-3a1c-415d-957a-564ffdd3712d@suse.com>
 <YmewJaxWS1KGVkTf@zn.tnic>
 <cbd4cd8a-0271-5a53-4688-59d6cc6ee3db@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cbd4cd8a-0271-5a53-4688-59d6cc6ee3db@suse.com>

On Tue, Apr 26, 2022 at 11:36:40AM +0200, Juergen Gross wrote:
> As the suggestion was to add another flag this wouldn't be a problem IMO.

We had a problem already with adding one flag would break the same flag
on the other guest type. That's why we added cc_vendor too. So it can be
tricky.

> platform_has() doesn't seem too bad IMO.
> 
> I will write a patch for starting the discussion.

Yeah, I guess such a proposal would need a wider audience - maybe CC
linux-arch...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

