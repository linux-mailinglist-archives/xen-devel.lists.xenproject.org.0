Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E1860843
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 02:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684601.1064558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdKQe-000281-41; Fri, 23 Feb 2024 01:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684601.1064558; Fri, 23 Feb 2024 01:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdKQe-00026g-07; Fri, 23 Feb 2024 01:32:44 +0000
Received: by outflank-mailman (input) for mailman id 684601;
 Fri, 23 Feb 2024 01:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdKQd-00026a-Ea
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 01:32:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e7a369a-d1eb-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 02:32:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B0EA632EE;
 Fri, 23 Feb 2024 01:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878DAC433C7;
 Fri, 23 Feb 2024 01:32:35 +0000 (UTC)
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
X-Inumbo-ID: 6e7a369a-d1eb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708651959;
	bh=nWVJG5spi+bRiLS0xJbmbmJBV5/WP5FVK+t19DwXej0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d/rzkEhFKB9rvzUoH1JhGpBvjrfSa1JmDj0RHz/a9wEpeiAiKgcOQkWx/K8/47fdE
	 25L7socT6E25oRPs0u79xSzKbNff/D43h9Irpi4l9ZfwazmCDDQu7/pyhY1rxvNRRI
	 TXYGVoLSWp14KQwBXjiPB78v3Eo3SpxvJ6YKZU860JM5DKDS/X1VzwuEgViaUni5iX
	 zvRpsnwsaJ0cE5zhHJpn/7wvgQrwZgEowDeUH19L2rTL0sdphpR8HALabH8ZJFGIv6
	 7o+FTlOr/4lRpl0F7HwwY4mhFcRUviBRf8VPXeaF/Pj0JeKnksRf5ZkoHnRzFgxCtY
	 pU/wHMHsEEQkw==
Date: Thu, 22 Feb 2024 17:32:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
In-Reply-To: <8f8141e2-c55c-2e58-a078-d5d8764a02df@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402221730270.754277@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com> <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com> <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
 <e8bf9817-fd54-9bf4-4302-dcee682f9172@suse.com> <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop> <8f8141e2-c55c-2e58-a078-d5d8764a02df@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-195102866-1708651958=:754277"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-195102866-1708651958=:754277
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 24 Oct 2023, Jan Beulich wrote:
> On 24.10.2023 00:05, Stefano Stabellini wrote:
> > On Mon, 23 Oct 2023, Jan Beulich wrote:
> >> On 23.10.2023 17:23, Simone Ballarin wrote:
> >>> On 23/10/23 15:34, Jan Beulich wrote:
> >>>> On 18.10.2023 16:18, Simone Ballarin wrote:
> >>>>> --- a/xen/include/xen/pdx.h
> >>>>> +++ b/xen/include/xen/pdx.h
> >>>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
> >>>>>    * @param pdx Page index
> >>>>>    * @return Obtained pfn after decompressing the pdx
> >>>>>    */
> >>>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
> >>>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
> >>>>>   {
> >>>>>       return (pdx & pfn_pdx_bottom_mask) |
> >>>>>              ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
> >>>>
> >>>> Taking this as an example for what I've said above: The compiler can't
> >>>> know that the globals used by the functions won't change value. Even
> >>>> within Xen it is only by convention that these variables are assigned
> >>>> their values during boot, and then aren't changed anymore. Which makes
> >>>> me wonder: Did you check carefully that around the time the variables
> >>>> have their values established, no calls to the functions exist (which
> >>>> might then be subject to folding)?
> >>>
> >>> There is no need to check that, the GCC documentation explicitly says:
> >>>
> >>> However, functions declared with the pure attribute *can safely read any 
> >>> non-volatile objects*, and modify the value of objects in a way that 
> >>> does not affect their return value or the observable state of the program.
> >>
> >> I did quote this same text in response to what Andrew has said, but I also
> >> did note there that this needs to be taken with a grain of salt: The
> >> compiler generally assumes a single-threaded environment, i.e. no changes
> >> to globals behind the back of the code it is processing.
> > 
> > Let's start from the beginning. The reason for Simone to add
> > __attribute_pure__ to pdx_to_pfn and other functions is for
> > documentation purposes. It is OK if it doesn't serve any purpose other
> > than documentation.
> > 
> > Andrew, for sure we do not want to lie to the compiler and introduce
> > undefined behavior. If we think there is a risk of it, we should not do
> > it.
> > 
> > So, what do we want to document? We want to document that the function
> > does not have side effects according to MISRA's definition of it, which
> > might subtly differ from GCC's definition.
> > 
> > Looking at GCC's definition of __attribute_pure__, with the
> > clarification statement copy/pasted above by both Simone and Jan, it
> > seems that __attribute_pure__ matches MISRA's definition of a function
> > without side effects. It also seems that pdx_to_pfn abides to that
> > definition.
> > 
> > Jan has a point that GCC might be making other assumptions
> > (single-thread execution) that might not hold true in our case. Given
> > the way the GCC statement is written I think this is low risk. But maybe
> > not all GCC versions we want to support in the project might have the
> > same definition of __attribute_pure__. So we could end up using
> > __attribute_pure__ correctly for the GCC version used for safety (GCC
> > 12.1, see docs/misra/C-language-toolchain.rst) but it might actually
> > break an older GCC version.
> > 
> > 
> > So Option#1 is to use __attribute_pure__ taking the risk that a GCC or
> > Clang version might interpret __attribute_pure__ differently and
> > potentially misbehave.
> > 
> > Option#2 is to avoid this risk, by not using __attribute_pure__.
> > Instead, we can use SAF-xx-safe or deviations.rst to document that
> > pdx_to_pfn and other functions like it are without side effects
> > according to MISRA's definition.
> > 
> > 
> > Both options have pros and cons. To me the most important factor is how
> > many GCC versions come with the statement "pure attribute can safely
> > read any non-volatile objects, and modify the value of objects in a way
> > that does not affect their return value or the observable state of the
> > program".
> > 
> > I checked and these are the results:
> > - gcc 4.0.2: no statement
> > - gcc 5.1.0: no statement
> > - gcc 6.1.0: no statement
> > - gcc 7.1.0: no statement
> > - gcc 8.1.0: alternative statement "The pure attribute imposes similar
> >   but looser restrictions on a function’s definition than the const
> >   attribute: it allows the function to read global variables."
> > - gcc 9.1.0: yes statement
> > 
> > 
> > So based on the above, __attribute_pure__ comes with its current
> > definition only from gcc 9 onward. I don't know if as a Xen community we
> > clearly declare a range of supported compilers, but I would imagine we
> > would still want to support gcc versions older than 9? (Not to mention
> > clang, which I haven't checked.)
> > 
> > It doesn't seem to me that __attribute_pure__ could be correctly used on
> > pdx_to_pfn with GCC 7.1.0 for example.
> 
> The absence of documentation doesn't mean the attribute had different
> (or even undefined) meaning in earlier versions. Instead it means one
> would need to consult other places (source code?) to figure out whether
> there was any behavioral difference (I don't think there was).
> 
> That said, ...
> 
> > So in conclusion, I think it is better to avoid __attribute_pure__ and
> > use SAF-xx-safe or an alternative approach instead.
> 
> ... I agree here. We just don't want to take chances.

Let me resurrect this thread.

Could we use something like "pure" that we #define as we want?

Depending on the compiler version or other options we could #define pure
to __attribute_pure__ or to nothing.

Opinions?
--8323329-195102866-1708651958=:754277--

