Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07755A99A9F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965448.1356003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hWv-0004W8-SV; Wed, 23 Apr 2025 21:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965448.1356003; Wed, 23 Apr 2025 21:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hWv-0004Tn-Pw; Wed, 23 Apr 2025 21:21:17 +0000
Received: by outflank-mailman (input) for mailman id 965448;
 Wed, 23 Apr 2025 21:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7hWu-0004Th-DC
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:21:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2afeff5-2088-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:21:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A5376844A;
 Wed, 23 Apr 2025 21:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F37BC4CEE2;
 Wed, 23 Apr 2025 21:21:11 +0000 (UTC)
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
X-Inumbo-ID: e2afeff5-2088-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745443273;
	bh=KfdtuBSmpl8CebcUyNB1kxOOjRi4U6iLpsWLS2Uj3t0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MsPdc+LEMdhky/0taPY3vO2Mqy119GWJgYsc7WjzOJaknos3UBbNRqblanrxKJo8g
	 pVqel1FT1DhObKCbgR1vHeIqRpLkXqU6i+oF3WbPQsesbqVeNfz1JPPl+VDq4FFpDd
	 J3xWZdWTRvsEb23ErpXLn9zJvWCQzHxea/MOlpnToQUW0kMGGlx47nPsO9p9uwNqOe
	 UrvWN4cmUkKgpLz9t2fGIhnqVhx0hDlmsEgCxNHwVJjqdhlK3cAtads5YA2lr0PJVC
	 V74hk3RoGut0Ru97aTo5YfO2/f5S3nOSYBBFMAmHbY9rK5j3yFX8UmvZdSS7tYLRuv
	 L56LWRTwkXFoA==
Date: Wed, 23 Apr 2025 14:21:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, victorm.lira@amd.com, 
    xen-devel@lists.xenproject.org, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation of Rule 10.1 for unary minus
In-Reply-To: <85bac6a2-db21-4756-99a2-e0543f9afec6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2504231414540.785180@ubuntu-linux-20-04-desktop>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com> <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com> <afdb0197-6f0f-47a7-88cb-83e014f09914@xen.org> <fa196b8dc5edd5cb76d49a38a6cf129c@bugseng.com>
 <85bac6a2-db21-4756-99a2-e0543f9afec6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-765711088-1745443208=:785180"
Content-ID: <alpine.DEB.2.22.394.2504231420160.785180@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-765711088-1745443208=:785180
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2504231420161.785180@ubuntu-linux-20-04-desktop>

On Wed, 23 Apr 2025, Julien Grall wrote:
> Hi Nicola,
> 
> On 23/04/2025 22:09, Nicola Vetrini wrote:
> > On 2025-04-23 22:48, Julien Grall wrote:
> > > Hi Victor,
> > > 
> > > On 23/04/2025 18:54, victorm.lira@amd.com wrote:
> > > > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > 
> > > > MISRA C Rule 10.1 states:
> > > > "Operands shall not be of an inappropriate essential type"
> > > > 
> > > > The unary minus operator applied to an unsigned quantity has
> > > > a semantics (wrap around) that is well-known to all Xen developers.
> > > > Thus, this operation is deemed safe.
> > > > 
> > > > No functional change.
> > > > 
> > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> > > > ---
> > > > Changes v1:
> > > > - add rule title to commit message
> > > > ---
> > > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > Cc: Anthony PERARD <anthony.perard@vates.tech>
> > > > Cc: Michal Orzel <michal.orzel@amd.com>
> > > > Cc: Jan Beulich <jbeulich@suse.com>
> > > > Cc: Julien Grall <julien@xen.org>
> > > > Cc: Roger Pau Monné <roger.pau@citrix.com>
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > > Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > Cc: Federico Serafini <federico.serafini@bugseng.com>
> > > > Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> > > > ---
> > > >   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
> > > >   docs/misra/deviations.rst                        | 6 ++++++
> > > >   2 files changed, 12 insertions(+)
> > > > 
> > > > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/
> > > > automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > index 303b06203a..2cfce850bd 100644
> > > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > @@ -347,6 +347,12 @@ constant expressions are required.\""
> > > >     "any()"}
> > > >   -doc_end
> > > > 
> > > > +-doc_begin="Unary minus operations on non-negative integers have a
> > > > semantics (wrap around) that is well-known to all Xen developers."
> > > > +-config=MC3A2.R10.1,etypes+={safe,
> > > > +  "stmt(node(unary_operator)&&operator(minus))",
> > > > +  "src_expr(definitely_in(0..))"}
> > > > +-doc_end
> > > > +
> > > >   #
> > > >   # Series 11
> > > >   #
> > > > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > > > index cfdd1a9838..c5897e31c5 100644
> > > > --- a/docs/misra/deviations.rst
> > > > +++ b/docs/misra/deviations.rst
> > > > @@ -321,6 +321,12 @@ Deviations related to MISRA C:2012 Rules:
> > > >          If no bits are set, 0 is returned.
> > > >        - Tagged as `safe` for ECLAIR.
> > > > 
> > > > +   * - R10.1
> > > > +     - Applying the unary minus operator to an unsigned quantity has a
> > > > +       semantics (wrap around) that is well-known to all Xen
> > > > developers.
> > > > +       For this reason, the operation is safe.
> > > 
> > > I have realized we use similar wording in the rest of the deviations, but
> > > this is rather fragile argument. "well-known" is very subjective and could
> > > change over time.
> > > 
> > > How many violations do we have? Could we deviate them one by one?
> > > 
> > 
> > Hi Julien,
> > 
> > around 10 on ARM, but more than 100 on x86 scattered around multiple
> > constructs (e.g. not only inside a handful of macros), so I don't think it's
> > feasible to deviate them one by one. 
> 
> Interesting. This seems to contradict what Stefano just wrote:
> 
> "
> We only have few instances of this pattern and the few we have are well
> understood and certainly deliberate.
> "

Hi Julien,

Sorry I was going by memory, I should have checked the numbers. There is
an additional issue that there was no overall agreement across all
maintainers to remove all the violations on x86, but now that I see
there are so many it is not really feasible anyway.


> > I do agree that the wording is subjective, but it is rather well-defined
> > which toolchains and architectures are used (C-language-toolchain.rst).
> > Perhaps a wording mentioning the specific assumptions implied here can
> > address your concerns?
> 
> If this is well-defined by the toolchains/architectures, then it is a better
> argument than "Xen community knows it".
 
I also think that "well-defined by the toolchains" is the most important
thing. That should be the real motivation for the deviation. The text
can be improved.
--8323329-765711088-1745443208=:785180--

