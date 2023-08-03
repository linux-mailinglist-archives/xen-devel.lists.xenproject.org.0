Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A325E76F34E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 21:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576572.902848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRdoJ-00020d-9I; Thu, 03 Aug 2023 19:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576572.902848; Thu, 03 Aug 2023 19:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRdoJ-0001yy-6X; Thu, 03 Aug 2023 19:16:35 +0000
Received: by outflank-mailman (input) for mailman id 576572;
 Thu, 03 Aug 2023 19:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRdoG-0001ys-Um
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 19:16:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb27c51-3232-11ee-b269-6b7b168915f2;
 Thu, 03 Aug 2023 21:16:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2F9F61E4A;
 Thu,  3 Aug 2023 19:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882EAC433C8;
 Thu,  3 Aug 2023 19:16:26 +0000 (UTC)
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
X-Inumbo-ID: 3fb27c51-3232-11ee-b269-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691090188;
	bh=yOeJu+vJIGCaAC6WsK3aZAvgZavyItDahnlqQtMZVag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JLXv1feUrrRjs8Dkmk+6L+r7bQJc5z7VR1v5DoJns/1l2di7dmXXkp9QbF/9nArjU
	 olgRg8r9IjC8gBnQUvoGRz/unXZPI62sHObJyQyRAz5SLS6mJKM+VCfEU+im/+aELf
	 Jx4pIgU20LrHUs/i0WUtYsW6Mqgen3AqzyQnplA56t3GlGLfapqTDvbJtYq/0i8AsH
	 8J5P8EA/IZEha/J63JpN4u1XIkTogi2CLIoEW3xKlZqGnnfQ9I5P/I3ga3d+fYGacM
	 ucNOlOUhHZuo8L79a0vp3ZQnpA2012ML5IMuwdgFACy9OCp6tnIlmhJR9tfhmNePnB
	 LLqfvD+rYGfzg==
Date: Thu, 3 Aug 2023 12:16:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH 3/4] x86/irq: rename variable to address MISRA C:2012
 Rule 5.3
In-Reply-To: <9e89a09e-ed5e-5322-2b94-4547d930ac7f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308031216150.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com> <af52de5af977362330680707e0acf890e3cb0995.1690969271.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2308021900030.2127516@ubuntu-linux-20-04-desktop>
 <9e89a09e-ed5e-5322-2b94-4547d930ac7f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Jan Beulich wrote:
> On 03.08.2023 04:00, Stefano Stabellini wrote:
> > On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> >> The extern variable 'irq_desc' defined in 'irq.h' is shadowed by
> >> local variables in the changed file. To avoid this, the variable is
> >> renamed to 'irq_description'.
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Btw, Stefano, could you please trim context when you reply to patches,
> and when you add no other remarks besides offering a tag?
> 
> Thanks, Jan

Will do

