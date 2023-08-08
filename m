Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12F1774F43
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 01:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580576.908900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTW1g-0000QJ-O6; Tue, 08 Aug 2023 23:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580576.908900; Tue, 08 Aug 2023 23:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTW1g-0000O2-LZ; Tue, 08 Aug 2023 23:22:08 +0000
Received: by outflank-mailman (input) for mailman id 580576;
 Tue, 08 Aug 2023 23:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTW1f-0000Nw-LS
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 23:22:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b838b3-3642-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 01:22:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E29F762DEE;
 Tue,  8 Aug 2023 23:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C84C433C7;
 Tue,  8 Aug 2023 23:22:02 +0000 (UTC)
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
X-Inumbo-ID: 62b838b3-3642-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691536923;
	bh=wkz4QDdS6EOodgWlT5pB8X3kXd5cGOfsF6oFMIZTu7g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JXwyk83Fmf7HArs2ZHTXy+zLOn8eCzpOpXYsX1YVRzYowkcy0+ZQA59aWIlgtZQ+h
	 RyJ/k5ORouWq4WwsEB18DkEsqNfaXXu6s7wCpem2PrLN4lVDkhF3sjfJT7+paltzYt
	 c00Kom/qEta3wjLJIHCaAah5zKJAw+TGXW5pnqyyUfdVleLq8Fh+jssjrbtfg95ikR
	 I+JgUTDGVWgTvm5PbXxn/moFJ9kLnm0g6hyCChqjiawNB4zuQw0posAmQiLtLVLDki
	 GsVUkpUN/nY6fa7lFGeL5csE3IbOAFDCkdmBnox2au8KOTAGp97bLNdU/iaQomYnGo
	 ehEjoejLC3JGQ==
Date: Tue, 8 Aug 2023 16:22:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, jgross@suse.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MISRA violations in hypercall-defs
In-Reply-To: <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop>
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com> <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Jan Beulich wrote:
> On 08.08.2023 10:47, Federico Serafini wrote:
> > Hello everyone.
> > 
> > I would like to to ask your opinion about the auto-generated file
> > xen/include/xen/hypercall-defs.h which contains some violations of
> > MISRA C:2012 Rule 8.3:
> > "All declarations of an object or function shall use the same names and
> > type qualifiers".
> > 
> > Such violations can be seen at the following links
> > (copy and paste the link on you browser, including also the characters
> > after the '#'):
> > 
> > - arm
> > https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
> > 
> > - x86
> > https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/218/PROJECT.ecd;/by_service/MC3R1.R8.3.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":2,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"file","inputs":[{"enabled":true,"text":"xen/include/xen/hypercall-defs.h"}]}]}}}
> > 
> > Some of the violations are due to mismatches on the return types
> > and the use of `ret_t`.
> 
> We already said that ret_t will need deviating. For parameter names
> it ought to be possible to suitably rename, like done elsewhere. Whether
> that means renaming in the generator script or in the definitions likely
> again needs judging on a case-by-case basis.

Is it the case that ret_t is purposedly defined as 'long' for 64-bit x86
guests and 'int' for 32-bit x86 guests?

I am asking because it looks like we don't use ret_t at all on ARM and
on the public interfaces.

