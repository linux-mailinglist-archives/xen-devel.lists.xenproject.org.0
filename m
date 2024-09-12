Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74B97749B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 00:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797851.1207920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sosl6-0002LY-0o; Thu, 12 Sep 2024 22:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797851.1207920; Thu, 12 Sep 2024 22:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sosl5-0002Id-Tx; Thu, 12 Sep 2024 22:57:51 +0000
Received: by outflank-mailman (input) for mailman id 797851;
 Thu, 12 Sep 2024 22:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sosl4-0002IX-Sb
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 22:57:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e2b9dc1-715a-11ef-99a1-01e77a169b0f;
 Fri, 13 Sep 2024 00:57:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1216A458A4;
 Thu, 12 Sep 2024 22:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5529C4CEC3;
 Thu, 12 Sep 2024 22:57:45 +0000 (UTC)
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
X-Inumbo-ID: 6e2b9dc1-715a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726181867;
	bh=S3ilyZAc5jOXr9ygFvI7BVbxqIeMH+Ca+pvY5fOgGUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h4aLHdE/YMn0b1IfReHK9r2CgddgOrh7g8GlBBqNfgwfz/4K8NI3AVh4isJieIBXD
	 1QzWmMgDDspJLtTWSLTJJfPhAXJJiQg/4Dy8+OJjhjPFRiqp7RPsCgpKqrn3ndmjHK
	 9I17uqSnY0FVSdnZctpPSiUPXLQhnmvmrDKYZMJUmv+q7MQrVgFoOHXDWYaix/JhQy
	 OKkAxWSBvOXj5iaqzaZuBbeyNqaXUE0i1SWZvvpMEFa8rMKRZSUM5I8Z1Tu/RczX7f
	 KS/4BaMQhQaBjDa3+LxdD9dfR4EQF4XwUEXFW/renyBPV7Gp1oXf3UlTY9UCyKZyYc
	 deoNqL355XlGw==
Date: Thu, 12 Sep 2024 15:57:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
In-Reply-To: <8f89be89-498f-4287-b4d5-dc519c23d84c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409121546380.611587@ubuntu-linux-20-04-desktop>
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com> <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com> <25b6a974b7c9aaec32b11930168148a5@bugseng.com> <4e54f8e0-43ce-4dd6-b1b4-cf72b59d96be@suse.com>
 <1a139b44effdeefab6b3e0ee7ae0c43d@bugseng.com> <38c34b50-56a5-498a-8ed6-d57a8f02a964@suse.com> <3f3f43e894a2b9e506dcfba38a578880@bugseng.com> <da7f6320-06e1-42f0-b507-cf1ec9415568@suse.com> <alpine.DEB.2.22.394.2409111757520.611587@ubuntu-linux-20-04-desktop>
 <8f89be89-498f-4287-b4d5-dc519c23d84c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Sep 2024, Jan Beulich wrote:
> On 12.09.2024 03:05, Stefano Stabellini wrote:
> > On Tue, 10 Sep 2024, Jan Beulich wrote:
> >> On 10.09.2024 12:17, Nicola Vetrini wrote:
> >>> On 2024-09-10 12:03, Jan Beulich wrote:
> >>>> On 10.09.2024 11:53, Nicola Vetrini wrote:
> >>>>> On 2024-09-10 11:08, Jan Beulich wrote:
> >>>>>> On 10.09.2024 10:56, Nicola Vetrini wrote:
> >>>>>>> On 2024-07-01 10:36, Jan Beulich wrote:
> >>>>>>>> On 28.06.2024 08:30, Nicola Vetrini wrote:
> >>>>>>>> This being about unreachable code, why are the domain_crash() not 
> >>>>>>>> the
> >>>>>>>> crucial points of "unreachability"? And even if they weren't there,
> >>>>>>>> why
> >>>>>>>> wouldn't it be the goto or ...
> >>>>>>>>
> >>>>>>>>> --- a/xen/arch/x86/mm/p2m-pod.c
> >>>>>>>>> +++ b/xen/arch/x86/mm/p2m-pod.c
> >>>>>>>>> @@ -1040,6 +1040,7 @@ out_unmap:
> >>>>>>>>>       * Something went wrong, probably crashing the domain.  Unmap
> >>>>>>>>>       * everything and return.
> >>>>>>>>>       */
> >>>>>>>>> +    /* SAF-8-safe Rule 2.1: defensive programming */
> >>>>>>>>>      for ( i = 0; i < count; i++ )
> >>>>>>>>>          if ( map[i] )
> >>>>>>>>>              unmap_domain_page(map[i]);
> >>>>>>>>
> >>>>>>>> ... the label (just out of context) where the comment needs to go?
> >>>>>>>
> >>>>>>> Because of the way this rule's configuration work, deviations are
> >>>>>>> placed
> >>>>>>> on the construct that ends up being the target of the 
> >>>>>>> unreachability,
> >>>>>>
> >>>>>> What's "target" here? What if this loop was removed from the 
> >>>>>> function?
> >>>>>> Then both the label and the domain_crash() invocations would still be
> >>>>>> unreachable in debug builds. Are you telling me that this then 
> >>>>>> wouldn't
> >>>>>> be diagnosed by Eclair? Or that it would then consider the closing
> >>>>>> figure brace of the function "the target of the unreachability"?
> >>>>>
> >>>>> Exactly, the end brace is a target to which the "function end" 
> >>>>> construct
> >>>>> is associated.
> >>>>> It would be kind of strange, though: why not just doing 
> >>>>> "domain_crash();
> >>>>> return;" in that case?
> >>>>
> >>>> Sure, the question was theoretical. Now if "return" was used directly
> >>>> there, what would then be the "target"? IOW - the more abstract 
> >>>> question
> >>>> of my earlier reply still wasn't answered.
> >>>>
> >>>
> >>> The return statement in
> >>>
> >>> ...
> >>> domain_crash();
> >>> return;
> >>> <~~~~~>
> >>>
> >>> Whichever statement is found to be unreachable in the current 
> >>> preprocessed code.
> >>
> >> Yet then again: Why is it the return statement and not the function call
> >> one (really, it being a macro invocation: the do/while one that the macro
> >> expands to)? That's the first thing that won't be reached.
> > 
> > Are you trying to get clarity on the specific locations where the SAF
> > deviations could be placed for the sake of understanding how the
> > deviation system work?
> > 
> > Or are you asking for the SAF comment to be moved elsewhere because you
> > don't like the SAF comment after the out_unmap macro?
> 
> The former, in order to make up my mind at all.

OK.

Nicola, I think I understand Jan's question and I'll try to clarify. The code in
p2m_pod_zero_check looks like this:

p2m_pod_zero_check(..
{
    [...]

    if ( something )
    {
        ASSERT_UNREACHABLE();
        /* potential SAF comment position#1 */
        domain_crash(d);
        /* potential SAF comment position#2 */
        goto out_unmap;
    }

    [...]

    return;

out_unmap:
    /* SAF comment added by patch */

    [...]
}

Jan is trying to understand why the SAF comment is placed after the
label "out_unmap" instead of position#1 or position#2 in my example.

The question arises from the following observations:
- anything after ASSERT_UNREACHABLE should be unreachable
- ignoring ASSERT_UNREACHABLE, anything after domain_crash should be
  unreachable
- "goto out_unmap" is a statement in itself, why is the SAF comment
  placed after the execution of "goto out_unmap" instead of before
  (position#2)?


In general, I agree it would be good for us to understand which
positions are allowed for the SAF comment. But at the same time in my
opinion among all these possible position, Nicola already picked the
best one and I wouldn't be in favor of moving the SAF comment in
position#1 or position#2.

