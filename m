Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B607C7D1578
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619914.965772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttuX-0007Wm-NU; Fri, 20 Oct 2023 18:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619914.965772; Fri, 20 Oct 2023 18:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttuX-0007UV-Ko; Fri, 20 Oct 2023 18:07:49 +0000
Received: by outflank-mailman (input) for mailman id 619914;
 Fri, 20 Oct 2023 18:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnt2=GC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qttuV-0007UP-SL
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:07:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fbe707a-6f73-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 20:07:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 52DEDCE34CE;
 Fri, 20 Oct 2023 18:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D07DC433C9;
 Fri, 20 Oct 2023 18:07:35 +0000 (UTC)
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
X-Inumbo-ID: 8fbe707a-6f73-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697825257;
	bh=YbevhFPLdC9WXimJJiiBx15EKNKNElHJ8LzBpaPUr9s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V5FznSmG2vVENk3YnaYVSg/BznA8qQ5sf5zhjWSHgEwbScWkETlmqXE7sIQU+x836
	 zqwAN1CZ21CIvTlNfDwE1zDLLbxDpKnTVbp0L9w29upfv7w6JHTO8W3KefHFfdkyrB
	 sqWVywu4n4yY69AK2JSqe9utR8H7VCgCe9nUM/iSjRs3ZiQDsr7blO/mR9kY1c3CAk
	 vFV2ETfUrMXKvX4NmHpMgOvJ737obmf4G1pF947G1zJrA+uYp0uoXjqTxQXklSkx4F
	 bWuiNjAjd8IGAMYGDqp9ZzGrSVPhJqDcuz/Me6FPoeZKtJpZssliiTk7a+HrL8/TlR
	 73SN9TjuwNOHQ==
Date: Fri, 20 Oct 2023 11:07:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <93F0B739-367C-4DFA-9F53-0C2C58FCD756@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310201107140.2356865@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com> <93408661-721b-c4b3-d504-e65142bbdaea@suse.com> <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com> <9002a10f872fccc5217faab2f20ad5ba@bugseng.com> <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop> <93F0B739-367C-4DFA-9F53-0C2C58FCD756@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Oct 2023, Luca Fancellu wrote:
> > On 19 Oct 2023, at 20:58, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > +Luca
> > 
> >>>>>> --- a/xen/include/xen/macros.h
> >>>>>> +++ b/xen/include/xen/macros.h
> >>>>>> @@ -8,8 +8,10 @@
> >>>>>> #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> >>>>>> #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> >>>>>> 
> >>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> >>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> >>>>> 
> >>>>> a SAF-<n>-safe comment here?
> >>>>> 
> >>>> 
> >>>> One reason is that now that violations only belonging to tool
> >>>> configurations
> >>>> and similar are documented in docs/misra/deviations.rst (committed in
> >>>> Stefano's
> >>>> branch for-4.19 [1]).
> >>> 
> >>> But tool configuration means every analysis tool needs configuring
> >>> separately. That's why the comment tagging scheme was decided to be
> >>> preferred, iirc.
> >>> 
> >>>> Also, there were disagreements on the SAF naming
> >>>> scheme, and
> >>>> patches like those would not be accepted at the moment.
> >>> 
> >>> Well, that needs resolving. The naming there shouldn't lead to patches
> >>> being accepted that later may need redoing.
> >>> 
> >>> Jan
> >> 
> >> While this is true, in this case I'm not willing to deviate with a SAF, given
> >> that
> >> some ECLAIR-specific configuration would be needed anyways, given that I'm
> >> deviating a macro definition, rather than the line where it's actually used
> >> (and maybe other tools would need
> >> that as well).
> > 
> > Did I get it right that the problem with using SAF in this case is that
> > it wouldn't be sufficient to add a SAF comment on top of the MACRO
> > definition, but we would need a SAF comment on top of every MACRO
> > invocation?
> > 
> > If so, then not just for this MACRO but in general basically we have to
> > use deviations.rst.
> > 
> > Luca, do you know what would be the behavior for cppcheck and/or
> > Coverity? I imagine it will be the same and they would also need a
> > deviation at every MACRO invocation, not just the definition?
> 
> Seems that cppcheck reports at the macro definition, instead Coverity reports
> at the macro invocation.

Does that mean that a /* SAF-xx-safe */ comment would work at the MACRO
definition for cppcheck but not for Coverity?

If so, then I wonder if cppcheck's behavior is what we would like to
have, but from a code compliance point of view it is the least reliable,
so that's the reason why both Coverity and ECLAIR don't implement it. In
terms of correctness of the implementation we know cppcheck is lagging a
bit behind...

