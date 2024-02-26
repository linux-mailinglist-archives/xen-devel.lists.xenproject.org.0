Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972B8684C2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 00:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685832.1067192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rekib-0002UM-8S; Mon, 26 Feb 2024 23:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685832.1067192; Mon, 26 Feb 2024 23:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rekib-0002Rv-5l; Mon, 26 Feb 2024 23:49:09 +0000
Received: by outflank-mailman (input) for mailman id 685832;
 Mon, 26 Feb 2024 23:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV/7=KD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rekiY-0002Rl-Uh
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 23:49:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e006ce1-d501-11ee-98f5-efadbce2ee36;
 Tue, 27 Feb 2024 00:49:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC2E061241;
 Mon, 26 Feb 2024 23:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57138C433F1;
 Mon, 26 Feb 2024 23:48:59 +0000 (UTC)
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
X-Inumbo-ID: 9e006ce1-d501-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708991340;
	bh=PjO7PQQo3rEX1iWh2Ea74qiVJOGbFJIdkegOczGU+Ts=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JbuhtV30nPy3DGuY/NyGUWKIkDUTh2mymmgu9EpChSkfZEkit5MBphuM1ftmQkuAB
	 A2djkv9QnzgqV+bgnucNnCJjVcv/3pyuT3V8HJWd8y+ru8bsqcJBJSIG3kQ2jktoJV
	 Q+ZbvrM2vClEH3jHSyQr6+wPXK9PuH7s0ON5WSShexZCzDc5RRkkb2yZL+PSof/0As
	 78iH0yuNOwwAPLOOw42cRPHoIKG+K+Dvo3qiARPHQ8LhLtrlDqt5VZ/LtjUhDXEWsR
	 myu31qTL3ZOeuF3ZP0lMN2hQFq9hTsUgUuWVDmPCAkSWmMwujIiumMbXyJrBE6HRRN
	 SQOehvyCtEnVw==
Date: Mon, 26 Feb 2024 15:48:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
In-Reply-To: <cb463469-51e1-4639-bf56-36fe9051d1b3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402261511010.247676@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com> <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com> <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
 <e8bf9817-fd54-9bf4-4302-dcee682f9172@suse.com> <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop> <8f8141e2-c55c-2e58-a078-d5d8764a02df@suse.com> <alpine.DEB.2.22.394.2402221730270.754277@ubuntu-linux-20-04-desktop>
 <6eb4dc7c-c6a5-496a-a37f-125b00e9aaa3@suse.com> <alpine.DEB.2.22.394.2402231432090.754277@ubuntu-linux-20-04-desktop> <cb463469-51e1-4639-bf56-36fe9051d1b3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-329351275-1708989087=:247676"
Content-ID: <alpine.DEB.2.22.394.2402261533040.247676@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-329351275-1708989087=:247676
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2402261533041.247676@ubuntu-linux-20-04-desktop>

On Mon, 26 Feb 2024, Jan Beulich wrote:
> On 23.02.2024 23:36, Stefano Stabellini wrote:
> > On Fri, 23 Feb 2024, Jan Beulich wrote:
> >> On 23.02.2024 02:32, Stefano Stabellini wrote:
> >>> On Tue, 24 Oct 2023, Jan Beulich wrote:
> >>>> On 24.10.2023 00:05, Stefano Stabellini wrote:
> >>>>> On Mon, 23 Oct 2023, Jan Beulich wrote:
> >>>>>> On 23.10.2023 17:23, Simone Ballarin wrote:
> >>>>>>> On 23/10/23 15:34, Jan Beulich wrote:
> >>>>>>>> On 18.10.2023 16:18, Simone Ballarin wrote:
> >>>>>>>>> --- a/xen/include/xen/pdx.h
> >>>>>>>>> +++ b/xen/include/xen/pdx.h
> >>>>>>>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
> >>>>>>>>>    * @param pdx Page index
> >>>>>>>>>    * @return Obtained pfn after decompressing the pdx
> >>>>>>>>>    */
> >>>>>>>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
> >>>>>>>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
> >>>>>>>>>   {
> >>>>>>>>>       return (pdx & pfn_pdx_bottom_mask) |
> >>>>>>>>>              ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
> >>>>>>>>
> >>>>>>>> Taking this as an example for what I've said above: The compiler can't
> >>>>>>>> know that the globals used by the functions won't change value. Even
> >>>>>>>> within Xen it is only by convention that these variables are assigned
> >>>>>>>> their values during boot, and then aren't changed anymore. Which makes
> >>>>>>>> me wonder: Did you check carefully that around the time the variables
> >>>>>>>> have their values established, no calls to the functions exist (which
> >>>>>>>> might then be subject to folding)?
> >>>>>>>
> >>>>>>> There is no need to check that, the GCC documentation explicitly says:
> >>>>>>>
> >>>>>>> However, functions declared with the pure attribute *can safely read any 
> >>>>>>> non-volatile objects*, and modify the value of objects in a way that 
> >>>>>>> does not affect their return value or the observable state of the program.
> >>>>>>
> >>>>>> I did quote this same text in response to what Andrew has said, but I also
> >>>>>> did note there that this needs to be taken with a grain of salt: The
> >>>>>> compiler generally assumes a single-threaded environment, i.e. no changes
> >>>>>> to globals behind the back of the code it is processing.
> >>>>>
> >>>>> Let's start from the beginning. The reason for Simone to add
> >>>>> __attribute_pure__ to pdx_to_pfn and other functions is for
> >>>>> documentation purposes. It is OK if it doesn't serve any purpose other
> >>>>> than documentation.
> >>>>>
> >>>>> Andrew, for sure we do not want to lie to the compiler and introduce
> >>>>> undefined behavior. If we think there is a risk of it, we should not do
> >>>>> it.
> >>>>>
> >>>>> So, what do we want to document? We want to document that the function
> >>>>> does not have side effects according to MISRA's definition of it, which
> >>>>> might subtly differ from GCC's definition.
> >>>>>
> >>>>> Looking at GCC's definition of __attribute_pure__, with the
> >>>>> clarification statement copy/pasted above by both Simone and Jan, it
> >>>>> seems that __attribute_pure__ matches MISRA's definition of a function
> >>>>> without side effects. It also seems that pdx_to_pfn abides to that
> >>>>> definition.
> >>>>>
> >>>>> Jan has a point that GCC might be making other assumptions
> >>>>> (single-thread execution) that might not hold true in our case. Given
> >>>>> the way the GCC statement is written I think this is low risk. But maybe
> >>>>> not all GCC versions we want to support in the project might have the
> >>>>> same definition of __attribute_pure__. So we could end up using
> >>>>> __attribute_pure__ correctly for the GCC version used for safety (GCC
> >>>>> 12.1, see docs/misra/C-language-toolchain.rst) but it might actually
> >>>>> break an older GCC version.
> >>>>>
> >>>>>
> >>>>> So Option#1 is to use __attribute_pure__ taking the risk that a GCC or
> >>>>> Clang version might interpret __attribute_pure__ differently and
> >>>>> potentially misbehave.
> >>>>>
> >>>>> Option#2 is to avoid this risk, by not using __attribute_pure__.
> >>>>> Instead, we can use SAF-xx-safe or deviations.rst to document that
> >>>>> pdx_to_pfn and other functions like it are without side effects
> >>>>> according to MISRA's definition.
> >>>>>
> >>>>>
> >>>>> Both options have pros and cons. To me the most important factor is how
> >>>>> many GCC versions come with the statement "pure attribute can safely
> >>>>> read any non-volatile objects, and modify the value of objects in a way
> >>>>> that does not affect their return value or the observable state of the
> >>>>> program".
> >>>>>
> >>>>> I checked and these are the results:
> >>>>> - gcc 4.0.2: no statement
> >>>>> - gcc 5.1.0: no statement
> >>>>> - gcc 6.1.0: no statement
> >>>>> - gcc 7.1.0: no statement
> >>>>> - gcc 8.1.0: alternative statement "The pure attribute imposes similar
> >>>>>   but looser restrictions on a function’s definition than the const
> >>>>>   attribute: it allows the function to read global variables."
> >>>>> - gcc 9.1.0: yes statement
> >>>>>
> >>>>>
> >>>>> So based on the above, __attribute_pure__ comes with its current
> >>>>> definition only from gcc 9 onward. I don't know if as a Xen community we
> >>>>> clearly declare a range of supported compilers, but I would imagine we
> >>>>> would still want to support gcc versions older than 9? (Not to mention
> >>>>> clang, which I haven't checked.)
> >>>>>
> >>>>> It doesn't seem to me that __attribute_pure__ could be correctly used on
> >>>>> pdx_to_pfn with GCC 7.1.0 for example.
> >>>>
> >>>> The absence of documentation doesn't mean the attribute had different
> >>>> (or even undefined) meaning in earlier versions. Instead it means one
> >>>> would need to consult other places (source code?) to figure out whether
> >>>> there was any behavioral difference (I don't think there was).
> >>>>
> >>>> That said, ...
> >>>>
> >>>>> So in conclusion, I think it is better to avoid __attribute_pure__ and
> >>>>> use SAF-xx-safe or an alternative approach instead.
> >>>>
> >>>> ... I agree here. We just don't want to take chances.
> >>>
> >>> Let me resurrect this thread.
> >>>
> >>> Could we use something like "pure" that we #define as we want?
> >>>
> >>> Depending on the compiler version or other options we could #define pure
> >>> to __attribute_pure__ or to nothing.
> >>
> >> While we can do about anything, I don't think it's a good idea to overload
> >> a well known term with something having somewhat different meaning. If a
> >> differently named custom attribute helps, that might be a possible option.
> > 
> > It doesn't have a different meaning. If it had a different meaning I'd
> > agree with you.
> 
> Then we need to sort this aspect first: If there was no difference in
> meaning, we ought to be using the real attribute, not a pseudo
> surrogate. Yet the earlier discussion, according to my understanding,
> has led to the understanding that for the given example the real
> attribute cannot be applied entirely legitimately. Hence why the
> thinking of alternatives actually started. What am I missing?

There are two different questions:
1) using __attribute_pure__ in general when appropriate
2) using __attribute_pure__ in pdx_to_pfn as this patch does


I was talking about 1): as a general approach it looks like a good idea
to use __attribute_pure__ when possible and appropriate.

Now let's talk about 2). The latest definition of __attribute_pure__ is:

"""
The pure attribute prohibits a function from modifying the state of the program that is observable by means other than inspecting the function’s return value. However, functions declared with the pure attribute can safely read any non-volatile objects, and modify the value of objects in a way that does not affect their return value or the observable state of the program.
"""

So there are two interesting issues:

a) While this documentation explicitly allows for reading global vars,
older versions of the docs are less clear. What do we do about them?

b) Jan wrote that he interprets the statements above to be only valid in
a single-threaded environment


To be honest, I am not convinced by b). Jan, is there a statement in the
GCC docs that says that all the attributes (pure being one of them) only
apply to a single-thread environment? That would be extremely limiting
for something like __attribute_pure__. I think we should take the
documentation of attribute pure at face value. To me, it clearly applies
to pdx_to_pfn. Roberto and the team at Bugseng came to the same
conclusion.

On the other end, I think a) is important. Older version of GCC don't
clarify the behavior toward global variables. From the documentation, I
would use __attribute_pure__ only with GCC 9 or later. Which is why we
need the #define.


> > The goal is for the #define to have exactly the same meaning as the gcc
> > definition from gcc 9 onward. However, other versions of gcc or other
> > compilers could have different semantics. Also we might not want to
> > allow gcc to perform the optimizations that it might want to do if the
> > attribute is passed.
> > 
> > So the definition would be clear and 100% aligned with the modern gcc
> > definition. However we would be able to control the behavior better.
> 
> If we feared older gcc didn't implement "pure" suitably, we should
> simply make __attribute_pure__ expand to nothing there. (Still use of
> the attribute then would need limiting to cases where it can validly
> be applied.)

That's fine by me
--8323329-329351275-1708989087=:247676--

