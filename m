Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427EB975E56
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 03:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796948.1206677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYHX-0003u4-QJ; Thu, 12 Sep 2024 01:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796948.1206677; Thu, 12 Sep 2024 01:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soYHX-0003s1-Nj; Thu, 12 Sep 2024 01:05:59 +0000
Received: by outflank-mailman (input) for mailman id 796948;
 Thu, 12 Sep 2024 01:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soYHW-0003rv-So
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 01:05:58 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a92ed51-70a3-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 03:05:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BB888A41777;
 Thu, 12 Sep 2024 01:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6132C4CEC0;
 Thu, 12 Sep 2024 01:05:54 +0000 (UTC)
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
X-Inumbo-ID: 2a92ed51-70a3-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726103156;
	bh=Xm5sDnsdwIuU/hqIejRjSKLodf069s7jSZ/8sSwfS5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LA5XN+vty7L9U5DthZnsSuwI5LRJxY1s/euRFFTxKAuowE+YoQXnqIy5VBheUjmrJ
	 6x3MrUUJvOybZST7ejgRlHGL+pEQTO908kgNIL4NtrIegC1QbOL7zHsItX1IT0fFuu
	 kzKVzkmj0oMaq8PbIkWrigqtdPulwtWCfb9cySHxTm5cbEpMuuodXVHOUTdD1LZy9C
	 YasepaENaG5JVZ+4cK5s/jz5t88kGuIpxHQbD/2NrPmFhzMP3kNG40XQQ6QVqz6mmD
	 03H2DCW6ajwT3cKCG8biyWcjQCSCLQ/kLwGM2JOOs1z8VVlA5jKR3qUopArkL7x336
	 E52n2wGimuxVA==
Date: Wed, 11 Sep 2024 18:05:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
In-Reply-To: <da7f6320-06e1-42f0-b507-cf1ec9415568@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409111757520.611587@ubuntu-linux-20-04-desktop>
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com> <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com> <25b6a974b7c9aaec32b11930168148a5@bugseng.com> <4e54f8e0-43ce-4dd6-b1b4-cf72b59d96be@suse.com>
 <1a139b44effdeefab6b3e0ee7ae0c43d@bugseng.com> <38c34b50-56a5-498a-8ed6-d57a8f02a964@suse.com> <3f3f43e894a2b9e506dcfba38a578880@bugseng.com> <da7f6320-06e1-42f0-b507-cf1ec9415568@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Jan Beulich wrote:
> On 10.09.2024 12:17, Nicola Vetrini wrote:
> > On 2024-09-10 12:03, Jan Beulich wrote:
> >> On 10.09.2024 11:53, Nicola Vetrini wrote:
> >>> On 2024-09-10 11:08, Jan Beulich wrote:
> >>>> On 10.09.2024 10:56, Nicola Vetrini wrote:
> >>>>> On 2024-07-01 10:36, Jan Beulich wrote:
> >>>>>> On 28.06.2024 08:30, Nicola Vetrini wrote:
> >>>>>> This being about unreachable code, why are the domain_crash() not 
> >>>>>> the
> >>>>>> crucial points of "unreachability"? And even if they weren't there,
> >>>>>> why
> >>>>>> wouldn't it be the goto or ...
> >>>>>>
> >>>>>>> --- a/xen/arch/x86/mm/p2m-pod.c
> >>>>>>> +++ b/xen/arch/x86/mm/p2m-pod.c
> >>>>>>> @@ -1040,6 +1040,7 @@ out_unmap:
> >>>>>>>       * Something went wrong, probably crashing the domain.  Unmap
> >>>>>>>       * everything and return.
> >>>>>>>       */
> >>>>>>> +    /* SAF-8-safe Rule 2.1: defensive programming */
> >>>>>>>      for ( i = 0; i < count; i++ )
> >>>>>>>          if ( map[i] )
> >>>>>>>              unmap_domain_page(map[i]);
> >>>>>>
> >>>>>> ... the label (just out of context) where the comment needs to go?
> >>>>>
> >>>>> Because of the way this rule's configuration work, deviations are
> >>>>> placed
> >>>>> on the construct that ends up being the target of the 
> >>>>> unreachability,
> >>>>
> >>>> What's "target" here? What if this loop was removed from the 
> >>>> function?
> >>>> Then both the label and the domain_crash() invocations would still be
> >>>> unreachable in debug builds. Are you telling me that this then 
> >>>> wouldn't
> >>>> be diagnosed by Eclair? Or that it would then consider the closing
> >>>> figure brace of the function "the target of the unreachability"?
> >>>
> >>> Exactly, the end brace is a target to which the "function end" 
> >>> construct
> >>> is associated.
> >>> It would be kind of strange, though: why not just doing 
> >>> "domain_crash();
> >>> return;" in that case?
> >>
> >> Sure, the question was theoretical. Now if "return" was used directly
> >> there, what would then be the "target"? IOW - the more abstract 
> >> question
> >> of my earlier reply still wasn't answered.
> >>
> > 
> > The return statement in
> > 
> > ...
> > domain_crash();
> > return;
> > <~~~~~>
> > 
> > Whichever statement is found to be unreachable in the current 
> > preprocessed code.
> 
> Yet then again: Why is it the return statement and not the function call
> one (really, it being a macro invocation: the do/while one that the macro
> expands to)? That's the first thing that won't be reached.

Hi Jan,

Are you trying to get clarity on the specific locations where the SAF
deviations could be placed for the sake of understanding how the
deviation system work?

Or are you asking for the SAF comment to be moved elsewhere because you
don't like the SAF comment after the out_unmap macro?


I think that the position Nicola has used is better than any of the
alternatives. It is clear and immediately obvious when you read it in
context (I admit that looking at the patch alone, without applying it,
it is a bit puzzling).

But I guess you probably also prefer a single SAF comment after the
out_unmap label rather than multiple SAF comment after every single
domain_crash ?  I don't think this patch can be improved.

