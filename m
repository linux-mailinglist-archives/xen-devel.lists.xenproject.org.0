Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2479117CA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 02:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744957.1152081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSTd-0001vD-Jh; Fri, 21 Jun 2024 00:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744957.1152081; Fri, 21 Jun 2024 00:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSTd-0001sO-Gy; Fri, 21 Jun 2024 00:50:05 +0000
Received: by outflank-mailman (input) for mailman id 744957;
 Fri, 21 Jun 2024 00:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKSTc-0001c8-56
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 00:50:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f041a59-2f68-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 02:50:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58740CE2345;
 Fri, 21 Jun 2024 00:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E8DC2BD10;
 Fri, 21 Jun 2024 00:49:53 +0000 (UTC)
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
X-Inumbo-ID: 2f041a59-2f68-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718930994;
	bh=uXJaFNeEv2qJH37zXRCpN8maT264MuP1N06mzvDgZko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PNNfFP58Ahs12BFLzcy0N73EtrV6be+MG21opFBB56seWL86yZp9FY5ZIxTwF+cDv
	 emEo55fFddbzbDZVt3iBWCmYJfuZtoe6FpAsIO/fEeX3JU4SivTSoS4mF6Gbm43lnV
	 WFMXdIVAzZfUK9j6Jhd02AwIZjjPIA9bkwepKOdM00KN9qVfiF6Zqgbgfw+DIpN+Bv
	 t8sEOhVMilvKkePeFEBIRkfZYPJu9ptEZHekHHgvnTxxBeI4uXmvzweE99//fo65kh
	 WKK8aSPoev/nmxTeEkPWg6TfIxatHCw30677r4+q+eQU73f05XC6KoTU0dKyBTChi9
	 b0Uvrrzneytsg==
Date: Thu, 20 Jun 2024 17:49:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] automation/eclair_analysis: deviate and|or|xor for MISRA
 C Rule 21.2
In-Reply-To: <5f486b5a-aba1-41f6-9e24-16ad3acd67bd@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406201746540.2572888@ubuntu-linux-20-04-desktop>
References: <b89e106649e3d0ecb41baadb49dc09c54b7563ec.1718873635.git.alessandro.zucchelli@bugseng.com> <5f486b5a-aba1-41f6-9e24-16ad3acd67bd@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jun 2024, Jan Beulich wrote:
> On 20.06.2024 11:07, Alessandro Zucchelli wrote:
> > Rule 21.2 reports identifiers reserved for the C and POSIX standard
> > libraries: or, and and xor are reserved identifiers because they constitute
> > alternate spellings for the corresponding operators; however Xen doesn't
> > use standard library headers, so there is no risk of overlap.
> 
> This is iso646.h aiui, which imo would be good to mention here, just
> to avoid people needing to go hunt for where this is coming from.
> 
> > This addresses violations arising from x86_emulate/x86_emulate.c, where
> > label statements named as or, and and xor appear.
> 
> So a deviation purely by present uses, even ...
> 
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -498,6 +498,12 @@ still remain available."
> >  -config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}
> >  -doc_end
> >  
> > +-doc_begin="or, and and xor are reserved identifiers because they constitute alternate
> > +spellings for the corresponding operators.
> > +However, Xen doesn't use standard library headers, so there is no risk of overlap."
> > +-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor)$)))"}
> > +-doc_end
> 
> ... constrained to just labels. Why would we do that? Why can't we deviate
> them all (or at least all that are plausible to potentially use somewhere,
> which imo would include at least "not" as well), and no matter what
> syntactical element they would be used as?
> 
> Besides, just as a remark: Specifically when used as label names, there's
> no risk at all, I'm inclined to say. If iso646.h existed in Xen and was
> included in such a source file, the compiler would choke on the result.

I agree with Jan with adding "not" and deviate everywhere, but I would
only deviate for label names. That's because I agree with Jan that when
used as label names there is no risk. However, in other uses it is less
clear and I'd prefer to avoid.

Looking at this patch, it is already applying not just to x86_emulate but
everywhere. So the only improvement would be to add "not" to the list:
or|and|xor|not

I consider it nice-to-have rather than must-have, so:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

