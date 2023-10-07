Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FBA7BC383
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 03:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613893.954751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qovkc-0004M0-TG; Sat, 07 Oct 2023 01:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613893.954751; Sat, 07 Oct 2023 01:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qovkc-0004JJ-QM; Sat, 07 Oct 2023 01:05:02 +0000
Received: by outflank-mailman (input) for mailman id 613893;
 Sat, 07 Oct 2023 01:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qovkb-0004JB-SB
 for xen-devel@lists.xenproject.org; Sat, 07 Oct 2023 01:05:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887ff276-64ad-11ee-9b0d-b553b5be7939;
 Sat, 07 Oct 2023 03:04:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1D524B82AE9;
 Sat,  7 Oct 2023 01:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CFDC433C8;
 Sat,  7 Oct 2023 01:04:54 +0000 (UTC)
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
X-Inumbo-ID: 887ff276-64ad-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696640695;
	bh=xIlz0zXhbJUodbsFXZRvIB/D7BuzQKWTW2E12Mz7sy0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T5dyjAMi84GoKpkXX2ER7o6RbVVz2Z2vWv9jccPT2chAPeN1cJcgYzjqlARI3Hm/c
	 X6YbQJSOOcDAPxJkBCWJWip4NhO3Xff/kKx5kq5uSam9YaE/Wh2yRJ1qkL8CSU68FO
	 mG0gBrmZfFOedUTSCuoAMzZ3x1L24UPuOJCBd+gp+tPVLBro2xRKoQUYvi+S+x+Zck
	 aAxRPF1ubbGQA/k7+3CT4fK8her/666Me/eBXMxv+ZZghc2FQSKI/A2a2GycdCO0Sx
	 J7hz+p6NtkdgxZ7iTEJVr6iz31U0Z/3rvqiJq9fyOOqz5mwAsPNhDm+VRZDdeJQf/3
	 bXeyq07QPwydA==
Date: Fri, 6 Oct 2023 18:04:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Paul Durrant <paul@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310061746190.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com> <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com> <80101145-1958-457a-8c80-cae816ae74aa@xen.org> <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1793844254-1696639648=:3431292"
Content-ID: <alpine.DEB.2.22.394.2310061748330.3431292@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1793844254-1696639648=:3431292
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310061748331.3431292@ubuntu-linux-20-04-desktop>

On Fri, 6 Oct 2023, Julien Grall wrote:
> Hi Nicola,
> 
> On 06/10/2023 11:10, Nicola Vetrini wrote:
> > On 06/10/2023 11:34, Julien Grall wrote:
> > > Hi Nicola,
> > > 
> > > On 06/10/2023 09:26, Nicola Vetrini wrote:
> > > > Given its use in the declaration
> > > > 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
> > > > 'bits' has essential type 'enum iommu_feature', which is not
> > > > allowed by the Rule as an operand to the addition operator
> > > > in macro 'BITS_TO_LONGS'.
> > > > 
> > > > A comment in BITS_TO_LONGS is added to make it clear that
> > > > values passed are meant to be positive.
> > > 
> > > I am confused. If the value is meant to be positive. Then...
> > > 
> > > > 
> > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > ---
> > > >   xen/include/xen/iommu.h | 2 +-
> > > >   xen/include/xen/types.h | 1 +
> > > >   2 files changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > > > index 0e747b0bbc1c..34aa0b9b5b81 100644
> > > > --- a/xen/include/xen/iommu.h
> > > > +++ b/xen/include/xen/iommu.h
> > > > @@ -360,7 +360,7 @@ struct domain_iommu {
> > > >   #endif
> > > >         /* Features supported by the IOMMU */
> > > > -    DECLARE_BITMAP(features, IOMMU_FEAT_count);
> > > > +    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);
> > > 
> > > ... why do we cast to (int) rather than (unsigned int)? Also, I think
> > > this cast deserve a comment on top because this is not a very obvious
> > > one.
> > > 
> > > >         /* Does the guest share HAP mapping with the IOMMU? */
> > > >       bool hap_pt_share;
> > > > diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> > > > index aea259db1ef2..936e83d333a0 100644
> > > > --- a/xen/include/xen/types.h
> > > > +++ b/xen/include/xen/types.h
> > > > @@ -22,6 +22,7 @@ typedef signed long ssize_t;
> > > >     typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > > >   +/* Users of this macro are expected to pass a positive value */
> > > >   #define BITS_TO_LONGS(bits) \
> > > >       (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
> > > >   #define DECLARE_BITMAP(name,bits) \
> > > 
> > > Cheers,
> > 
> > See [1] for the reason why I did so. I should have mentioned that in the
> > commit notes, sorry.
> > In short, making BITS_TO_LONGS essentially unsigned would cause a cascade of
> > build errors and
> > possibly other essential type violations.
> Can you share some of the errors?
> 
> > If this is to be fixed that way, the effort required
> > is far greater. Either way, a comment on top of can be added, along the
> > lines of:
> > 
> > Leaving this as an enum would violate MISRA C:2012 Rule 10.1
> 
> I read this as you are simply trying to silence your tool. I think this the
> wrong approach as you are now making the code confusing for the reader (you
> pass a signed int to a function that is supposed to take a positive number).
> 
> I appreciate that this will result to more violations at the beginning. But
> the whole point of MISRA is to make the code better.
> 
> If this is too complex to solve now, then a possible option is to deviate for
> the time being.

I agree on everything Julien's wrote and I was about to suggest to use a
SAF comment to suppress the warning because it is clearer than a int
cast.

But then I realized that even if BITS_TO_LONGS was fixed, wouldn't still
we have a problem because IOMMU_FEAT_count is an enum?

Is it the case that IOMMU_FEAT_count would have to be cast regardless,
either to int or unsigned int or whatever to be used in DECLARE_BITMAP?


So we have 2 problems here: one problem is DECLARE_BITMAP taking int
instead of unsigned int, and another problem is IOMMU_FEAT_count being
an enum.

If I got it right, then I would go with the cast to int (like done in
this patch) with a decent comment on top of it.
--8323329-1793844254-1696639648=:3431292--

