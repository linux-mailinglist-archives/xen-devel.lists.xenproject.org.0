Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B9486BAE9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 23:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686809.1069311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfSga-00076B-0I; Wed, 28 Feb 2024 22:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686809.1069311; Wed, 28 Feb 2024 22:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfSgZ-00073n-TW; Wed, 28 Feb 2024 22:45:59 +0000
Received: by outflank-mailman (input) for mailman id 686809;
 Wed, 28 Feb 2024 22:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msSf=KF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfSgY-00073h-Cw
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 22:45:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21ebd94a-d68b-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 23:45:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B76C7614CA;
 Wed, 28 Feb 2024 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F19C433C7;
 Wed, 28 Feb 2024 22:45:53 +0000 (UTC)
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
X-Inumbo-ID: 21ebd94a-d68b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709160354;
	bh=cjtlg/QVrYzErKBipwK6r+KHc9Hh6O43ER2xx5rOxfY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tdThU2SnCSD5Hl6IvVakztb48od9ZdR0amVvZDF14jKzbS73hPeryNCJnFnPPkXd6
	 QHa45DzbR+daS/Jpj1l4mk8Y+EzeRRpq7G+uUppRCnYWc4sb1l+OaDGrtJn7FWjSjL
	 zGDDjRAoQp5Gp1YD2nZzJ17FWf8z1WMYshPFSAMlF1o6vRFLYbk7D8Hz+uAQnwazjK
	 gD2X40kpp94zkoraEhJnQPVR1JyzXx4s6UghdZ8Ykxw9KRJFS9gw8Vgsc+DFv/LsD9
	 nAV9b+K9Tw0oVc5WdxbwZutsLRdDvW/gL4RtcU1N1IkeR4ONNdqqvvDcBnoVx9StX5
	 jpytTpV86ZKrw==
Date: Wed, 28 Feb 2024 14:45:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Kelly Choi <kelly.choi@cloud.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: preparations for 4.18.1
In-Reply-To: <521a4d3b-8ef1-4449-97bd-1a3d3e0e35ec@xen.org>
Message-ID: <alpine.DEB.2.22.394.2402281445450.575685@ubuntu-linux-20-04-desktop>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com> <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org> <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com> <521a4d3b-8ef1-4449-97bd-1a3d3e0e35ec@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Feb 2024, Julien Grall wrote:
> Hi Jan,
> 
> On 28/02/2024 12:58, Jan Beulich wrote:
> > On 28.02.2024 12:50, Julien Grall wrote:
> > > On 27/02/2024 13:19, Jan Beulich wrote:
> > > > All,
> > > > 
> > > > the release is due in two to three weeks. Please point out backports you
> > > > find
> > > > missing from the respective staging branch, but which you consider
> > > > relevant.
> > > 
> > > For Arm:
> > > 
> > > e11f576650 ("xen/arm: Fix UBSAN failure in start_xen()")
> > 
> > Which I assume you or Stefano will take care of?
> 
> I was expecting Stefano would do it as he did the backports in the past.

Done

