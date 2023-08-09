Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB67769AB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581321.909964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpb0-0003cC-HV; Wed, 09 Aug 2023 20:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581321.909964; Wed, 09 Aug 2023 20:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpb0-0003Ze-Dr; Wed, 09 Aug 2023 20:15:54 +0000
Received: by outflank-mailman (input) for mailman id 581321;
 Wed, 09 Aug 2023 20:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpaz-0003ZY-2E
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:15:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f89ec7-36f1-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 22:15:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6363C64313;
 Wed,  9 Aug 2023 20:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E8BC433C7;
 Wed,  9 Aug 2023 20:15:48 +0000 (UTC)
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
X-Inumbo-ID: 88f89ec7-36f1-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691612149;
	bh=X5BrOmy90ngq8WhBQ+nu64KlO6VYmdkoqXU0BuO/2AU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dX2XSnhJVCUF94ijuIPAKu30vOYR3wYeJZ6kRKyymW7/T3W8zVM2seW6Tmb6pD8C8
	 DHAQYMNyAQ7jv9cnF95ikfK70ZMizQtho8tKp1sMDvOqtyKBEpj2pJ0LR4svrXor5q
	 d3XE2GQdcHGSHZugATGubfN4F7Y5m+wL6rtsftnLACnU1xKRxz435SGmWngPjRMjfF
	 luxFjUwvbDJO81+x6ALAekQOo1pt+TpwkK1jwMxhgpnd12naWsqWCxjefOU/OEarca
	 j6Z+lJh4UW8NFlWpFCoi/q47oALJtch14N7c+qQd2+jq1VJSW2FcQT88bkYWDRQpUn
	 2Z55CTirqBXsA==
Date: Wed, 9 Aug 2023 13:15:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 7/8] x86/i8259: address MISRA C:2012 Rule 8.4
In-Reply-To: <30cd1bdb-be77-a192-eca7-6fcd60eca610@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308091313270.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com> <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com> <d752a7b5-4b8b-8394-8e72-bcdffce1fb82@suse.com> <1cfa92d52d89b2013218cef1c518ab4d@bugseng.com>
 <30cd1bdb-be77-a192-eca7-6fcd60eca610@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Jan Beulich wrote:
> On 09.08.2023 16:17, Nicola Vetrini wrote:
> > On 09/08/2023 14:52, Jan Beulich wrote:
> >> On 09.08.2023 13:02, Nicola Vetrini wrote:
> >>> The additional header file makes the declaration for the function
> >>> 'init_IRQ', defined in this file visible, thereby resolving the
> >>> violation of Rule 8.4.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>> ---
> >>>  xen/arch/x86/i8259.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
> >>> index 6b35be10f0..9b02a3a0ae 100644
> >>> --- a/xen/arch/x86/i8259.c
> >>> +++ b/xen/arch/x86/i8259.c
> >>> @@ -19,6 +19,7 @@
> >>>  #include <xen/delay.h>
> >>>  #include <asm/apic.h>
> >>>  #include <asm/asm_defns.h>
> >>> +#include <asm/setup.h>
> >>>  #include <io_ports.h>
> >>>  #include <irq_vectors.h>
> >>
> >> A patch adding this #include has been pending for almost 3 months:
> >> https://lists.xen.org/archives/html/xen-devel/2023-05/msg00896.html
> > 
> > So do you prefer going forward with that patch or this one (mentioning 
> > it
> > in the additional commit context of course)?
> 
> I would prefer using the much older patch, but of course this requires
> someone providing R-b or A-b.

Hi Jan, normally I'd be happy to do that but that patch makes other
changes that I don't feel confident enough to Ack.

For instance:

+    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
+          offs <= pic_alias_mask; offs += i )

pic_alias_mask is declared as unsigned int.

