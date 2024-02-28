Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2080D86BACB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 23:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686807.1069301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfSZ3-0005Ms-8p; Wed, 28 Feb 2024 22:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686807.1069301; Wed, 28 Feb 2024 22:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfSZ3-0005Kc-65; Wed, 28 Feb 2024 22:38:13 +0000
Received: by outflank-mailman (input) for mailman id 686807;
 Wed, 28 Feb 2024 22:38:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msSf=KF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfSZ1-0005KW-Kl
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 22:38:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b1ed263-d68a-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 23:38:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5BC63CE1FD6;
 Wed, 28 Feb 2024 22:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69594C433F1;
 Wed, 28 Feb 2024 22:38:02 +0000 (UTC)
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
X-Inumbo-ID: 0b1ed263-d68a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709159883;
	bh=5WaCi+6gVTyfUU0Op00ytWhMO9xw7BQScrZbELM1l1Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bg8Ho0ICp8cDupFShhOwIsLfSkS7QOhJ/uVHZnNKL8wA2xoiYLFTqYGSRy04es9Ux
	 1MvrpRmYQqMDvUhBbxN1rs6ZTbg8r2yw0IhLrk3JxV3hMDOEIGFHY7aJ1RmiJhjWNB
	 TXJgjtkbaUsRCP03JR2hMTTrC8qODPHdhgoKGqK0MuW34+9mc7OPR4YHe1+PsOVsAE
	 nIpmgY2h9UAamQsCWR3aRntrzWN/6Ak/e8rXzcxzG0GcJjAXjk3U/m9LZ9j5W2iFYr
	 Ov7NC8Jk8LCadrSiPP1k54I02S3NqmdciY1TWzlb5aiVUfNDKZmwnH6PDFMdKxEJ1s
	 ECaiLPzD27TQw==
Date: Wed, 28 Feb 2024 14:38:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
In-Reply-To: <bcae31fb-856d-4737-b780-f41b3e24cfa7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2402281437470.575685@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com> <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com> <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com> <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com> <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org> <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com> <alpine.DEB.2.22.394.2402271808410.575685@ubuntu-linux-20-04-desktop> <6af04933659178b3ccabc5caf646273c@bugseng.com>
 <bcae31fb-856d-4737-b780-f41b3e24cfa7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Feb 2024, Julien Grall wrote:
> Hi Nicola,
> 
> On 28/02/2024 11:09, Nicola Vetrini wrote:
> > > I asked Roberto if void casts are an option for compliance.
> > > 
> > 
> > void casts are an option for sure. The rationale for the rule explicitly
> > lists them as a compliance mechanism. An interesting aspect is what would be
> > the consensus around void casts on functions whose return value is always
> > ignored vs. functions whose return value is sometimes ignored.
> 
> If a return is always ignored, then the function should return void. For the
> second case, I think it will be on the case by case basis.

+1

 
> > > In any case, I don't think we should use void casts in the specific
> > > cases this patch is dealing with. Void casts (if anything) should be a
> > > last resort while this patch fixes the issue in a better way.
> 
> +1.


