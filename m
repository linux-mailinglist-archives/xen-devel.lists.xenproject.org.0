Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655357CB7B0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 02:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617955.961109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYOW-0003s1-7p; Tue, 17 Oct 2023 00:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617955.961109; Tue, 17 Oct 2023 00:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYOW-0003of-5A; Tue, 17 Oct 2023 00:57:12 +0000
Received: by outflank-mailman (input) for mailman id 617955;
 Tue, 17 Oct 2023 00:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFgi=F7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsYOU-0003oZ-Gw
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 00:57:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 180f337d-6c88-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 02:57:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 908A1611FD;
 Tue, 17 Oct 2023 00:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B466C433C7;
 Tue, 17 Oct 2023 00:57:04 +0000 (UTC)
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
X-Inumbo-ID: 180f337d-6c88-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697504226;
	bh=nid6MtGSPECxGK+RVaCZzNB4TR0ROMCq52YSdmxDxM8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PagYFAPdS7caP4ww21pRb7DWeCFlnoxTgLAfkIgvzvNHSExunQFrN3tdVo2f+doux
	 BfdP8Lv+uS/TSbozI8FiDhXjCBm5tJPHGnc96RIypcb82yUg9NUY6QagRYcxKRLEY3
	 Mur8PI7IVPpMhVsn9GwJpzrcxx88INxD/GNRDEYCyEWbknSHvGqbTBvDxwlPfAZyF2
	 hM16W4RCIDb5FMAKgD9pEMyH67yn2aj1qIhhepTG6n+dlkSyfAQhDRxejOmclww2hs
	 pIfhHVTbEqkGIF+JZsJ+ihBDCVxEPp0uZ8nckP+Zi8Mw6ztwAhZc62Dl1eoLwfMpNa
	 tH0JutNNpUU4A==
Date: Mon, 16 Oct 2023 17:57:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <08286993-6a83-b928-6398-e129397927a0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310161756560.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com> <93408661-721b-c4b3-d504-e65142bbdaea@suse.com> <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Jan Beulich wrote:
> On 16.10.2023 18:17, Nicola Vetrini wrote:
> > On 16/10/2023 17:33, Jan Beulich wrote:
> >> On 12.10.2023 17:28, Nicola Vetrini wrote:
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> @@ -274,6 +274,12 @@ still non-negative."
> >>>  -config=MC3R1.R10.1,etypes+={safe, 
> >>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", 
> >>> "dst_type(ebool||boolean)"}
> >>>  -doc_end
> >>>
> >>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to 
> >>> obtain the value
> >>> +2^ffs(x) for unsigned integers on two's complement architectures
> >>> +(all the architectures supported by Xen satisfy this requirement)."
> >>> +-config=MC3R1.R10.1,reports+={safe, 
> >>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
> >>> +-doc_end
> >>
> >> Why is this added here rather than by ...
> >>
> >>> --- a/xen/include/xen/macros.h
> >>> +++ b/xen/include/xen/macros.h
> >>> @@ -8,8 +8,10 @@
> >>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> >>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> >>>
> >>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> >>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> >>
> >> a SAF-<n>-safe comment here?
> >>
> > 
> > One reason is that now that violations only belonging to tool 
> > configurations
> > and similar are documented in docs/misra/deviations.rst (committed in 
> > Stefano's
> > branch for-4.19 [1]).
> 
> But tool configuration means every analysis tool needs configuring
> separately. That's why the comment tagging scheme was decided to be
> preferred, iirc.
> 
> > Also, there were disagreements on the SAF naming 
> > scheme, and
> > patches like those would not be accepted at the moment.
> 
> Well, that needs resolving. The naming there shouldn't lead to patches
> being accepted that later may need redoing.

I agree

