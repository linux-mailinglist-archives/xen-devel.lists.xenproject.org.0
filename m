Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76979F558
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 01:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601694.937799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZ25-0002b1-BQ; Wed, 13 Sep 2023 23:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601694.937799; Wed, 13 Sep 2023 23:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZ25-0002ZH-7Z; Wed, 13 Sep 2023 23:12:29 +0000
Received: by outflank-mailman (input) for mailman id 601694;
 Wed, 13 Sep 2023 23:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgZ23-0002ZB-DD
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 23:12:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff8cc2b9-528a-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 01:12:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA6E961B91;
 Wed, 13 Sep 2023 23:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD46FC433C7;
 Wed, 13 Sep 2023 23:12:21 +0000 (UTC)
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
X-Inumbo-ID: ff8cc2b9-528a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694646743;
	bh=hftAi5j6Ryc0LyGZl+orbq3UplZjPvr5XIhy54P/j0Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EZEoZor2g0XrFWSYcauqc5VuCvRQgjqvYkhv57oTAR1bmCi6f0LaWwp0ihFwdjl6D
	 WNzEdtJ4HhEM+ZR5qo/08kImBjm91Fr+4w3R9czxAkbOs/qJA6xRzYkOpCcykU/nDY
	 7XJcC1foQ9nVjm3is/1b6G7tKt3ekg2JkVsYhnqisbnrhWbHBiyv8ebQ0vAyWYpk+/
	 vW2z/MFI7CBUvJEMX1VEBUMsLRNQx5CC8zgC0iUkklfBvDH+ZvcqIpszgEc3D46J2m
	 18kUh/ChxD4MzzLwh01cDWyeBS5zifkgBUBxXherA8gJ4mN7ViPD5mi77Y555496AE
	 lWkiqlHVrPiQQ==
Date: Wed, 13 Sep 2023 16:12:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/libelf: address violations of MISRA C:2012 RUles
 8.2 and 8.3
In-Reply-To: <78e45fa1-7273-45f4-bac5-45c4e0772a0d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2309131611490.2295162@ubuntu-linux-20-04-desktop>
References: <e4d28b9b78e84260feea6bdbcb4ecdd815af5db3.1694591513.git.federico.serafini@bugseng.com> <9acf798a-9d08-4940-d8e0-20b423294d2e@bugseng.com> <78e45fa1-7273-45f4-bac5-45c4e0772a0d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Sep 2023, Julien Grall wrote:
> On 13/09/2023 13:41, Federico Serafini wrote:
> > On 13/09/23 14:29, Federico Serafini wrote:
> > > Add missing parameter names and make function declarations and
> > > definitions consistent. No functional change.
> > > 
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > 
> > There is a typo in the patch title (RUles), please correct on commit.
> 
> That can be done so long there are no other comments.
> 
> > 
> > Reviewed-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> I am bit confused. Why do you provide a reviewed-by on a patch you wrote?

Maybe a mistake?

In any case, I reviewed the patch and everything checks out

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

