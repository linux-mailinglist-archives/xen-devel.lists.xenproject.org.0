Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85767BF011
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614539.955689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1FN-000600-QJ; Tue, 10 Oct 2023 01:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614539.955689; Tue, 10 Oct 2023 01:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1FN-0005xz-NF; Tue, 10 Oct 2023 01:09:17 +0000
Received: by outflank-mailman (input) for mailman id 614539;
 Tue, 10 Oct 2023 01:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq1FM-0005xt-4r
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:09:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a01e658e-6709-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 03:09:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1CBD61478;
 Tue, 10 Oct 2023 01:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57E1C433C8;
 Tue, 10 Oct 2023 01:09:10 +0000 (UTC)
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
X-Inumbo-ID: a01e658e-6709-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696900152;
	bh=MafH1u1Ps6DpY5z+PhoWulFmxJ4Pn3cjwdkjt/p0SEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ejR7q/vt2ig5Am/kJvxVowW0vhkK4hVVX5yzBGq/UEv9FrtdNkrrtvQdwSoWazfDy
	 fJNZ0VzRFXnMpY9dCsI1ri/YcOqS7iB+fVxJefC2sgc6/uMyFQ31faFfhlP9l7zSLb
	 YsSunt2xVVBTjD8cFn8QlOkk90fjPPEw3zuPc6n2qPUUKqoWncvnpuGxUH8uXqXGGg
	 t0UE4oAShTYXUgJYjIjTJ0IbEghLTXDmjkljIYnJkgg/wzl6BuNQ6UL85fF0WOe4Zs
	 QAC1544Y+d077jH1+oQl/wUf72RTUs/s7G5FSwuZWysok3MFbyhwChVnE5aVPTuUSi
	 5ijKFy1NGyxIg==
Date: Mon, 9 Oct 2023 18:09:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Paul Durrant <paul@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <d90524b8-70ee-457e-8d6a-9e69f135b81d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310091803060.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com> <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com> <80101145-1958-457a-8c80-cae816ae74aa@xen.org> <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org> <alpine.DEB.2.22.394.2310061746190.3431292@ubuntu-linux-20-04-desktop> <d90524b8-70ee-457e-8d6a-9e69f135b81d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-934372179-1696900100=:3431292"
Content-ID: <alpine.DEB.2.22.394.2310091808380.3431292@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-934372179-1696900100=:3431292
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310091808381.3431292@ubuntu-linux-20-04-desktop>

On Mon, 9 Oct 2023, Julien Grall wrote:
> On 07/10/2023 02:04, Stefano Stabellini wrote:
> > On Fri, 6 Oct 2023, Julien Grall wrote:
> > > Hi Nicola,
> > > 
> > > On 06/10/2023 11:10, Nicola Vetrini wrote:
> > > > On 06/10/2023 11:34, Julien Grall wrote:
> > > > > Hi Nicola,
> > > > > 
> > > > > On 06/10/2023 09:26, Nicola Vetrini wrote:
> > > > > > Given its use in the declaration
> > > > > > 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
> > > > > > 'bits' has essential type 'enum iommu_feature', which is not
> > > > > > allowed by the Rule as an operand to the addition operator
> > > > > > in macro 'BITS_TO_LONGS'.
> > > > > > 
> > > > > > A comment in BITS_TO_LONGS is added to make it clear that
> > > > > > values passed are meant to be positive.
> > > > > 
> > > > > I am confused. If the value is meant to be positive. Then...
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > > > ---
> > > > > >    xen/include/xen/iommu.h | 2 +-
> > > > > >    xen/include/xen/types.h | 1 +
> > > > > >    2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > > > > > index 0e747b0bbc1c..34aa0b9b5b81 100644
> > > > > > --- a/xen/include/xen/iommu.h
> > > > > > +++ b/xen/include/xen/iommu.h
> > > > > > @@ -360,7 +360,7 @@ struct domain_iommu {
> > > > > >    #endif
> > > > > >          /* Features supported by the IOMMU */
> > > > > > -    DECLARE_BITMAP(features, IOMMU_FEAT_count);
> > > > > > +    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);
> > > > > 
> > > > > ... why do we cast to (int) rather than (unsigned int)? Also, I think
> > > > > this cast deserve a comment on top because this is not a very obvious
> > > > > one.
> > > > > 
> > > > > >          /* Does the guest share HAP mapping with the IOMMU? */
> > > > > >        bool hap_pt_share;
> > > > > > diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> > > > > > index aea259db1ef2..936e83d333a0 100644
> > > > > > --- a/xen/include/xen/types.h
> > > > > > +++ b/xen/include/xen/types.h
> > > > > > @@ -22,6 +22,7 @@ typedef signed long ssize_t;
> > > > > >      typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > > > > >    +/* Users of this macro are expected to pass a positive value */
> > > > > >    #define BITS_TO_LONGS(bits) \
> > > > > >        (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
> > > > > >    #define DECLARE_BITMAP(name,bits) \
> > > > > 
> > > > > Cheers,
> > > > 
> > > > See [1] for the reason why I did so. I should have mentioned that in the
> > > > commit notes, sorry.
> > > > In short, making BITS_TO_LONGS essentially unsigned would cause a
> > > > cascade of
> > > > build errors and
> > > > possibly other essential type violations.
> > > Can you share some of the errors?
> > > 
> > > > If this is to be fixed that way, the effort required
> > > > is far greater. Either way, a comment on top of can be added, along the
> > > > lines of:
> > > > 
> > > > Leaving this as an enum would violate MISRA C:2012 Rule 10.1
> > > 
> > > I read this as you are simply trying to silence your tool. I think this
> > > the
> > > wrong approach as you are now making the code confusing for the reader
> > > (you
> > > pass a signed int to a function that is supposed to take a positive
> > > number).
> > > 
> > > I appreciate that this will result to more violations at the beginning.
> > > But
> > > the whole point of MISRA is to make the code better.
> > > 
> > > If this is too complex to solve now, then a possible option is to deviate
> > > for
> > > the time being.
> > 
> > I agree on everything Julien's wrote and I was about to suggest to use a
> > SAF comment to suppress the warning because it is clearer than a int
> > cast.
> > 
> > But then I realized that even if BITS_TO_LONGS was fixed, wouldn't still
> > we have a problem because IOMMU_FEAT_count is an enum?
> > 
> > Is it the case that IOMMU_FEAT_count would have to be cast regardless,
> > either to int or unsigned int or whatever to be used in DECLARE_BITMAP?
> > 
> > 
> > So we have 2 problems here: one problem is DECLARE_BITMAP taking int
> > instead of unsigned int, and another problem is IOMMU_FEAT_count being
> > an enum.
> > 
> > If I got it right, then I would go with the cast to int (like done in
> > this patch) with a decent comment on top of it.
> 
> I might be missing something here. But why should we use cast rather than /*
> SAF-X */ just above? I would have expected we wanted to highlight the
> violation rather than hiding it.

My understanding is that the cast is required when converting an enum
type to an integer type and vice versa. The idea is that we shouldn't do
implicit conversions as they are error prone, only explicit conversions
are allowed between enum and integers.

So we need either (int) or (unsigned int). The question is which one
between the two, and theoretically (unsigned int) is better but due to
the reasons above (int) is the simplest choice.

Yes, instead of the cast we can also add a SAF-x comment, which refers
to a deviation that says something along the lines "we could fix this
with a cast but we prefer a deviation because it makes the code easier
to read".

In general my personal preference would be to use a cast, because we
shouldn't implicitly convert enums to integers. However, in this
specific case where there is int vs. unsigned int discussion, I can see
that also SAF-x could be a way to go.
--8323329-934372179-1696900100=:3431292--

