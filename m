Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54271B286BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083822.1443269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0UN-0004oa-Cd; Fri, 15 Aug 2025 19:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083822.1443269; Fri, 15 Aug 2025 19:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0UN-0004n7-9r; Fri, 15 Aug 2025 19:53:23 +0000
Received: by outflank-mailman (input) for mailman id 1083822;
 Fri, 15 Aug 2025 19:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un0UL-0004n1-7k
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:53:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d26e86c-7a11-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 21:53:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3239F60007;
 Fri, 15 Aug 2025 19:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF23AC4CEEB;
 Fri, 15 Aug 2025 19:53:15 +0000 (UTC)
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
X-Inumbo-ID: 7d26e86c-7a11-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755287596;
	bh=iGNGs1jeOIT4gU8UtpJE11Yr+bLheb576dbnvjw5NCg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cIX/Z4gPF62zRCv2GyOSY/prYVquJp5kRvUpJeQRrdAQJKPBivHc5PI6vs6UpxclJ
	 vhTUfpCiYEUe+7oq/vDGPIZdhybNmZ+hrpdmDtKjzsYwC3JhDX5wwXDQB4jjbOQcn5
	 GYB0Q7+iXTb0zY0jqk3Ur6KoK4jUdS3eo8amobp2ZP9T4fwm6nr+yF14EPrDzIY2Pa
	 CFejcPVyys/Xrh5S3QLv+uX+HOCEBFzHCTGlxs9bOo8xX13KMrJsYasfEMr6w/qa54
	 BMWooxov9N2yINltf7JfWAJmZhIRAd4d+9VxB1zdAL63bvKiOzyAc9l69ZkK4fneh5
	 SMawhPmuVuyjQ==
Date: Fri, 15 Aug 2025 12:53:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] misra: add missing noreturn attribute for __div0()
In-Reply-To: <6aa50b8147d14e4d654f1291fc3b9cef@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2508151253010.923618@ubuntu-linux-20-04-desktop>
References: <1b5549a97db31c65edb769302deff73576cec41d.1755013482.git.dmytro_prokopchuk1@epam.com> <6aa50b8147d14e4d654f1291fc3b9cef@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Aug 2025, Nicola Vetrini wrote:
> On 2025-08-12 17:46, Dmytro Prokopchuk1 wrote:
> > The __div0() function never returns to its caller, causing a violation
> > of MISRA C Rule 2.1: "A project shall not contain unreachable code".
> > Add the `noreturn` attribute to fix this.
> > 
> 
> I was convinced that this was already upstream, as I made a patch a while ago,
> but evidently I forgot to send it.
> 
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


