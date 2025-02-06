Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD6A2B675
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 00:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883184.1293242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB3M-00061o-72; Thu, 06 Feb 2025 23:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883184.1293242; Thu, 06 Feb 2025 23:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB3M-0005zi-40; Thu, 06 Feb 2025 23:13:00 +0000
Received: by outflank-mailman (input) for mailman id 883184;
 Thu, 06 Feb 2025 23:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypua=U5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgB3L-0005zW-5l
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 23:12:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e62c84d0-e4df-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 00:12:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32FDD5C64E1;
 Thu,  6 Feb 2025 23:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC1EC4CEDD;
 Thu,  6 Feb 2025 23:12:54 +0000 (UTC)
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
X-Inumbo-ID: e62c84d0-e4df-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738883575;
	bh=ZKA3S8GwuOyPURb6YCP2CnlDLuTQWX9ZR9h31VyWplA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eGAMDukhqG8gmJR+P6A0xxrxhIJgVdkoF0Xi3V52LUQG/A++FGDAdpbhc5tnTVL/W
	 V1hGLjKSOwrT26p6zI//8ozwIGoI76YUws+D84513GMaimnKYxvsdjHgly4N6pphj5
	 +AySl76fWPDIhkFFLu5MRthbBJWw68m22tBoq+v/bzIz0nSS1lrvwVCM/YaSuR3kcC
	 zJGTBfXHBC7mfbOwuwGOAH69SRDzBggwuZOHHGUaw1DuLbY+QxhvKtf79nbnxnQjAD
	 VncEqScDT2w1XH27s1YsYhxUyGmVjtC3Q+PZf8dZrAda8OTvqIx1fFP8d+GjT8qR10
	 5S/DoGDlmbckg==
Date: Thu, 6 Feb 2025 15:12:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH v5 1/9] automation: upgrade Linux kernel for arm64 tests
 to 6.6.74
In-Reply-To: <98cc8f4d-660d-4bb4-8ac0-9ae2f6f26b24@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502061512300.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop> <20250206010843.618280-1-stefano.stabellini@amd.com> <98cc8f4d-660d-4bb4-8ac0-9ae2f6f26b24@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Orzel, Michal wrote:
> On 06/02/2025 02:08, Stefano Stabellini wrote:
> > 
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Any particular reason behind choosing 6.6.74 and not the latest longterm 6.6.75?

No, it was the latest when I developed this patch last week


> In any case:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thank you!

