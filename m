Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643890FAD0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 03:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744075.1151082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6RE-0003dY-Ju; Thu, 20 Jun 2024 01:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744075.1151082; Thu, 20 Jun 2024 01:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6RE-0003bK-HG; Thu, 20 Jun 2024 01:18:08 +0000
Received: by outflank-mailman (input) for mailman id 744075;
 Thu, 20 Jun 2024 01:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sK6RD-0003bE-LM
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 01:18:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f03f2b0b-2ea2-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 03:18:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B3A14CE0C71;
 Thu, 20 Jun 2024 01:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15877C2BBFC;
 Thu, 20 Jun 2024 01:17:55 +0000 (UTC)
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
X-Inumbo-ID: f03f2b0b-2ea2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718846277;
	bh=0GIpkZY7aVbZFmVOo2ALtB7mwHup3p4Fzi8lCLKrJZ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ktk5ljKyzxkWooIJRKiYE25vTcn+a1lGZOFpRKZ+7qocpHcZcEfqbsQA0iuG7qVxt
	 e2rLtZX3h3PlC9u/O482N/bCVraJibdbX7rfCtkuRavBxX26vQPWSvEw4jJmF3j1RF
	 8T2T0WJ4ybMo4rff3PFYkctOaxq6li79tKk/eq38Mh+3vUIohuE7gAJAcQLZEl5r2e
	 96cpb2lytph1SCY1+15S1RSia1FE0NimPrd+pGrLDdaCZFRjgqcA0sGTIrj00SQnmD
	 akUJu9CSJGS5ntlaGpneHnI74H1xqUI9/lfAALEYht7SFcNBwDDHg+F3yZINfyxugL
	 hSc5vduc0N3Pw==
Date: Wed, 19 Jun 2024 18:17:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] automation/eclair_analysis: deviate common/unlzo.c for
 MISRA Rule 7.3
In-Reply-To: <63d11da5-4a5a-4354-ab57-67fbb7110f45@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406191817310.2572888@ubuntu-linux-20-04-desktop>
References: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com> <63d11da5-4a5a-4354-ab57-67fbb7110f45@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Jun 2024, Jan Beulich wrote:
> On 18.06.2024 11:54, Alessandro Zucchelli wrote:
> > The file contains violations of Rule 7.3 which states as following: The
> > lowercase character `l' shall not be used in a literal suffix.
> > 
> > This file defines a non-compliant constant used in a macro expanded in a
> > non-excluded file, so this deviation is needed in order to avoid
> > a spurious violation involving both files.
> 
> Imo it would be nice to be specific in such cases: Which constant? And
> which macro expanded in which file?

Hi Alessandro,
if you give me the details, I could add it to the commit message on commit

