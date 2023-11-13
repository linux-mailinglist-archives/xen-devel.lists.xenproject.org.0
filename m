Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35597EA731
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 00:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632075.986035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2gou-0004Qp-B2; Mon, 13 Nov 2023 23:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632075.986035; Mon, 13 Nov 2023 23:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2gou-0004PA-85; Mon, 13 Nov 2023 23:58:20 +0000
Received: by outflank-mailman (input) for mailman id 632075;
 Mon, 13 Nov 2023 23:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmv8=G2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r2gos-0004P4-Kf
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 23:58:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d283a8-8280-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 00:58:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2840DCE1711;
 Mon, 13 Nov 2023 23:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9FFC433C7;
 Mon, 13 Nov 2023 23:58:07 +0000 (UTC)
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
X-Inumbo-ID: 81d283a8-8280-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699919890;
	bh=M4llEswjDVGCYHIMRIajWiEaO6Xh1u2DF7lB6HO+sZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pqooYd3Tmx1NelkDBy/swjUiliRwWgBuNETSWxcKsbu9PREiz6m/C7nLHYlcQSzKc
	 IhjBWJCM3tcj6RcYMopYrWoV40SUC4fKQvpCMOMkOgLd0rNrd3ns9a899+zxJxkekH
	 724YTQrYfsr2b1DDANZstSuA02Sgx4r0TI5HL7LdlsvGdb55gAxrsixOFRevMkwjje
	 Cme9a0I0ccU9mlMXCfFDgssJHBY7DMu7imFJIIpswaKEDov2aURQIc7OHg3DyzfbjX
	 tCKNM5HHI4uA3Ttezpj4rCRqp1BsN9N3Z0cf4SNCUWsc+ZSPuWZMfa2b+WxyrYuK/2
	 7dM/9E5/x4u9g==
Date: Mon, 13 Nov 2023 15:58:06 -0800 (PST)
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
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
In-Reply-To: <b7df2987-ab46-bb09-4440-e743018561ad@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311131557210.160649@ubuntu-linux-20-04-desktop>
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com> <b7df2987-ab46-bb09-4440-e743018561ad@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Nov 2023, Jan Beulich wrote:
> On 19.10.2023 09:55, Nicola Vetrini wrote:
> > The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> > compile-time check to detect non-scalar types; its usage for this
> > purpose is deviated.
> > 
> > Furthermore, the 'typeof_field' macro is introduced as a general way
> > to access the type of a struct member without declaring a variable
> > of struct type. Both this macro and 'sizeof_field' are moved to
> > 'xen/macros.h'.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in v2:
> > - added entry in deviations.rst
> > Changes in v3:
> > - dropped access_field
> > - moved macro to macros.h
> > ---
> > Changes in v4:
> > - Amend deviation record.
> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++++++
> >  docs/misra/deviations.rst                        |  6 ++++++
> >  xen/include/xen/compiler.h                       |  8 --------
> >  xen/include/xen/kernel.h                         |  2 +-
> >  xen/include/xen/macros.h                         | 16 ++++++++++++++++
> >  5 files changed, 32 insertions(+), 9 deletions(-)
> 
> I tried to commit this patch, but ...
> 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index fa56e5c00a27..28d9c37bedb2 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -246,6 +246,15 @@ constant expressions are required.\""
> >    "any()"}
> >  -doc_end
> > 
> > +#
> > +# Series 11
> > +#
> > +
> > +-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
> > +-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> > +}
> > +-doc_end
> > +
> >  #
> >  # Series 13
> >  #
> 
> ... this change doesn't apply, and I also can't see how it would. There were
> no dependencies specified, so it's also not clear on top of which other
> (ready to be committed) patch(es) this might have been meant to apply. Please
> resubmit in a shape applicable to the staging branch.

The order doesn't matter in that file, you can place # Series 11 just
after # Series 10


diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..14c5134575 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -274,6 +274,15 @@ still non-negative."
 -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
 -doc_end
 
+#
+# Series 11
+#
+
+-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
+-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
+}
+-doc_end
+
 ### Set 3 ###
 
 #

