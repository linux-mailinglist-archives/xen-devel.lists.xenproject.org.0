Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8E776979
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581304.909933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpRt-0000xl-6h; Wed, 09 Aug 2023 20:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581304.909933; Wed, 09 Aug 2023 20:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpRt-0000vW-3t; Wed, 09 Aug 2023 20:06:29 +0000
Received: by outflank-mailman (input) for mailman id 581304;
 Wed, 09 Aug 2023 20:06:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpRq-0000vJ-Vw
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:06:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 371a5271-36f0-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:06:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 918D7647ED;
 Wed,  9 Aug 2023 20:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C54C433C7;
 Wed,  9 Aug 2023 20:06:21 +0000 (UTC)
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
X-Inumbo-ID: 371a5271-36f0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691611583;
	bh=An2eScnbVLdGjB9nYSfhVdnbAk6Pvp4KnDnEvyDLZyc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tuk+Xz+OSmrlQe2cFnJuzR3JDey2MSTathw77vje9fYaAT+dqzBATvQkKltfHRgZj
	 JSl6DOyUebCnM1P7qhCrxVcG/Fum7GinpjdpnZxQXgcAOgK9v2BuBYoTeImzDMgW6A
	 TN6KJ2lyDEeCukqpEH1fK+SJfsjQgBTUKZva7Xp+peOxN7iRu897MGIxXXyaFdMR1J
	 uS6zqu1DFTF/ne+wh7OiaKG+EGkMYLitqY8RD+48Y0ZsoQbbZLp2Ti3OEfKkNvWvGj
	 bZ3NARxXVmItzWIjtnelsB3I2zvNJMjX3hYRKipOHHFA4YkN30tHz6sY/0z8fTcmk/
	 bIyovvv6y0mjg==
Date: Wed, 9 Aug 2023 13:06:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
In-Reply-To: <771C6AF9-8BB8-466C-B9A4-1745016BEB1E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308091306120.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com> <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com> <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com> <041f2137-8a90-79f6-3677-f764cb1b6656@suse.com>
 <771C6AF9-8BB8-466C-B9A4-1745016BEB1E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Luca Fancellu wrote:
> > On 9 Aug 2023, at 15:06, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 09.08.2023 15:50, Luca Fancellu wrote:
> >>> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> >>> 
> >>> The variable 'saved_cmdline' can be defined static,
> >>> as its only uses are within the same file. This in turn avoids
> >>> violating Rule 8.4 because no declaration is present.
> >>> 
> >>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>> ---
> >>> xen/common/kernel.c | 2 +-
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> 
> >>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> >>> index fb919f3d9c..52aa287627 100644
> >>> --- a/xen/common/kernel.c
> >>> +++ b/xen/common/kernel.c
> >>> @@ -28,7 +28,7 @@ CHECK_feature_info;
> >>> 
> >>> enum system_state system_state = SYS_STATE_early_boot;
> >>> 
> >>> -xen_commandline_t saved_cmdline;
> >>> +static xen_commandline_t saved_cmdline;
> >> 
> >> I see this line was touched by fa97833ae18e4a42c0e5ba4e781173457b5d3397,
> >> have you checked that making it static was not affecting anything else?
> > 
> > The code requiring the symbol to be non-static went away in e6ee01ad24b6
> > ("xen/version: Drop compat/kernel.c"). That's where the symbol would have
> > wanted to become static. But that was very easy to overlook.
> 
> Yes you are right Jan,
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Possibly with the Fixes tag

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

