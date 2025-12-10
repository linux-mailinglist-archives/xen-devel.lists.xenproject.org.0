Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D164CB18DF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182434.1505306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8TE-00047Y-4r; Wed, 10 Dec 2025 00:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182434.1505306; Wed, 10 Dec 2025 00:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8TE-00044r-1l; Wed, 10 Dec 2025 00:54:20 +0000
Received: by outflank-mailman (input) for mailman id 1182434;
 Wed, 10 Dec 2025 00:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8TC-00044l-SQ
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:54:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0829429-d562-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 01:54:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E9AF260129;
 Wed, 10 Dec 2025 00:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A36C4CEF5;
 Wed, 10 Dec 2025 00:54:14 +0000 (UTC)
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
X-Inumbo-ID: c0829429-d562-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765328055;
	bh=71BKg7+FcwHN8iimys1TGEarRu0WPuZ0Idz+FI6Keos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q53LVZFrIUc8Jjtb5/VLTq2HSsoWWEwfEDf3T68KPqA5cRnZeHF8OW1vrXsLQNIsz
	 +WZVF+nLm1pQhXSjFir7zWPdqndjTXAkvMpxkJ4dQJt9VyoQNsIWeSz5i4JPdar6mI
	 ChKXAtDJvQn9swuxOvni2WsxBza4FLQtvnYLFIasTSuTicoUHQrM4iuEnG87s3lV2T
	 vDxtfwArpJO2w2lAqJv64Z2byf1YWAUAdlfnD010VEIVV0E35lozbfvDgwnt5jJpkY
	 SEQpdUAzm+y/m45IO4Kr7tQMQsO7+9wrV14RuMk3M3g0YnlWuEWo5fz1yET3fn0kPB
	 2ynT1olTy2R2A==
Date: Tue, 9 Dec 2025 16:54:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor
 macro
In-Reply-To: <alpine.DEB.2.22.394.2512091651570.19429@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2512091653450.19429@ubuntu-linux-20-04-desktop>
References: <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com> <alpine.DEB.2.22.394.2512091651570.19429@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Dec 2025, Stefano Stabellini wrote:
> On Thu, 23 Oct 2025, Dmytro Prokopchuk1 wrote:
> > Given 'NextMemoryDescriptor()' macro is casting (UINT8 *) pointer to the
> > (EFI_MEMORY_DESCRIPTOR *) pointer, which is not allowed by the MISRA C
> > Rule 11.3 as they pointed to the different objects types.
> > 
> > This macro is a part of the EFI imported code ('xen/include/efi/') and
> > is deviated with a SAF comment.
> > 
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I saw Jan's comment but I think this is OK

I take it back I saw Dmytro managed to make a newer and better version
of this following Jan's comment. All good.

