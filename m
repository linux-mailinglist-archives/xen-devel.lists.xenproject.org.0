Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBF7D02E2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 21:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619569.964862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtZ9n-00022W-4j; Thu, 19 Oct 2023 19:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619569.964862; Thu, 19 Oct 2023 19:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtZ9n-000205-28; Thu, 19 Oct 2023 19:58:11 +0000
Received: by outflank-mailman (input) for mailman id 619569;
 Thu, 19 Oct 2023 19:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtZ9l-0001zz-Qk
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 19:58:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d27449c0-6eb9-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 21:58:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0A100B82C9F;
 Thu, 19 Oct 2023 19:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F739C433C8;
 Thu, 19 Oct 2023 19:58:04 +0000 (UTC)
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
X-Inumbo-ID: d27449c0-6eb9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697745486;
	bh=PQ+ucJRigwDJrObGww9Bgd1anpKfj7mDpV8dpxS2ty0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hy97AwR667WJo5svuB/auxfUygBMRhB+sTNoq2PODjE48vcGr9nf5JYn4rWXlQbYl
	 ZojUA97K96M8dnIRdEpzOZ+VklECi+uwWkKclQvlLyACzjeHeEDf9ETapreicWEUem
	 Ck7jDxQZM4Kn8OJR/J3Ya46VtHlPvcXpjamdoCW4qdQYmLtsNeebWu9VSSCWWBmp8D
	 Tj9Banx8PPIgcRG9yutISFQOR95vVnp+mbyPKBR0Mu2tE3yNFpwfz+rFbyscbR5bvv
	 EAyeJULI5z3gWFd7jAPWC5ldlpIpmYwM1QWNwlmoPQ75MASuu9gpScMnL77OlhP4iI
	 J5a4+g1dLQ3tA==
Date: Thu, 19 Oct 2023 12:58:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, 
    Luca.Fancellu@arm.com
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com> <93408661-721b-c4b3-d504-e65142bbdaea@suse.com> <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com> <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Luca

> > > > > --- a/xen/include/xen/macros.h
> > > > > +++ b/xen/include/xen/macros.h
> > > > > @@ -8,8 +8,10 @@
> > > > >  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> > > > >  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> > > > > 
> > > > > -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> > > > > -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> > > > 
> > > > a SAF-<n>-safe comment here?
> > > > 
> > > 
> > > One reason is that now that violations only belonging to tool
> > > configurations
> > > and similar are documented in docs/misra/deviations.rst (committed in
> > > Stefano's
> > > branch for-4.19 [1]).
> > 
> > But tool configuration means every analysis tool needs configuring
> > separately. That's why the comment tagging scheme was decided to be
> > preferred, iirc.
> > 
> > > Also, there were disagreements on the SAF naming
> > > scheme, and
> > > patches like those would not be accepted at the moment.
> > 
> > Well, that needs resolving. The naming there shouldn't lead to patches
> > being accepted that later may need redoing.
> > 
> > Jan
> 
> While this is true, in this case I'm not willing to deviate with a SAF, given
> that
> some ECLAIR-specific configuration would be needed anyways, given that I'm
> deviating a macro definition, rather than the line where it's actually used
> (and maybe other tools would need
> that as well).

Did I get it right that the problem with using SAF in this case is that
it wouldn't be sufficient to add a SAF comment on top of the MACRO
definition, but we would need a SAF comment on top of every MACRO
invocation?

If so, then not just for this MACRO but in general basically we have to
use deviations.rst.

Luca, do you know what would be the behavior for cppcheck and/or
Coverity? I imagine it will be the same and they would also need a
deviation at every MACRO invocation, not just the definition?

