Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF67AA3AE2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 00:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973125.1361333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9t1x-0000la-LP; Tue, 29 Apr 2025 22:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973125.1361333; Tue, 29 Apr 2025 22:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9t1x-0000k7-HT; Tue, 29 Apr 2025 22:02:21 +0000
Received: by outflank-mailman (input) for mailman id 973125;
 Tue, 29 Apr 2025 22:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9t1w-0000jt-FQ
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 22:02:20 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d5efef8-2545-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 00:02:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 56F0E44D92;
 Tue, 29 Apr 2025 22:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6483C4CEE3;
 Tue, 29 Apr 2025 22:02:14 +0000 (UTC)
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
X-Inumbo-ID: 9d5efef8-2545-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745964136;
	bh=VUoDaZd4v0Iy7dkGxv9a7twIhTm0wla375sylnetC7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WZXu0GdlUWFxESqAHJAGWxH4dKT4HlIALdTzwT+SDFCvoQkl3N9LcTr6a0b1+EOGD
	 wyXSGz9iLS5YkKgKzI3pLDtX0Sh35spdr6K06nJU4NKNZpsVGnnSy6caZTJn0XljBx
	 fWRNGx/Pi9P9TknVcv7kw6Z/e0y1ijQzvmyi1+hE5pDfeaBfWaxvqebIzf0xx2BaNG
	 7yIpTxd7vDaVZxwPxTZXZ0G4xDP5fpeb//oC+nr5NU3WPfM0MvVCHVdyF8LfglE9QF
	 yU+/HTWJixpM8LexYgfsTSZxho3x8gQBMVjl6gJiJRoNn9cSZa6IHL3zeootebHAt6
	 NHiMY0BieWUZw==
Date: Tue, 29 Apr 2025 15:02:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/3] compat: address violations of MISRA C Rule 19.1
In-Reply-To: <dc55282f-f9a1-470b-8126-ca347d44efbc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504291501490.3879245@ubuntu-linux-20-04-desktop>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com> <74b0420ab20fc0204db14c0a1a4a68ed48b25a38.1745624090.git.victorm.lira@amd.com> <cb1f8a8f-8834-4610-baab-c53bf5928b0c@suse.com> <alpine.DEB.2.22.394.2504281614020.785180@ubuntu-linux-20-04-desktop>
 <dc55282f-f9a1-470b-8126-ca347d44efbc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Jan Beulich wrote:
> On 29.04.2025 01:21, Stefano Stabellini wrote:
> > On Mon, 28 Apr 2025, Jan Beulich wrote:
> >> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
> >>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>
> >>> Rule 19.1 states: "An object shall not be assigned or copied
> >>> to an overlapping object". Since the "call" and "compat_call" are
> >>> fields of the same union, reading from one member and writing to
> >>> the other violates the rule, while not causing Undefined Behavior
> >>> due to their relative sizes. However, a dummy variable is used to
> >>> address the violation and prevent the future possibility of
> >>> incurring in UB.
> >>
> >> If there is such a concern, ...
> >>
> >>> --- a/xen/common/compat/multicall.c
> >>> +++ b/xen/common/compat/multicall.c
> >>> @@ -15,8 +15,13 @@ typedef int ret_t;
> >>>  static inline void xlat_multicall_entry(struct mc_state *mcs)
> >>>  {
> >>>      int i;
> >>> +    xen_ulong_t arg;
> >>> +
> >>>      for (i=0; i<6; i++)
> >>> -        mcs->compat_call.args[i] = mcs->call.args[i];
> >>> +    {
> >>> +        arg = mcs->call.args[i];
> >>> +        mcs->compat_call.args[i] = arg;
> >>> +    }
> >>>  }
> >>
> >> ... wouldn't it be of concern as well that the alternating parts of
> >> the union are still accessed in a flip-flop manner? IOW we continue to
> >> rely on the relative placement properties of the individual array
> >> elements. To eliminate such a concern, I think the resulting code would
> >> also want to be correct if iteration was swapped to work downwards.
> >>
> >> Also the scope of the temporary could certainly be the loop body rather
> >> than the entire function.
> > 
> > Wouldn't be safer to do this then?
> > 
> > static inline void xlat_multicall_entry(struct mc_state *mcs)
> > {
> >     int i;
> >     xen_ulong_t args[6];
> > 
> >     for ( i = 0; i < 6; i++ )
> >     {
> >         args[i] = mcs->call.args[i];
> >     }
> >     for ( i = 0; i < 6; i++ )
> >     {
> >         mcs->compat_call.args[i] = args[i];
> >     }
> > }
> > 
> > If you have any specific suggestions I think C code would be easier to
> > understand than English.
> 
> Kind of the above, yes, with the further remark below also taken care of.
> So ...
> 
> >> I also don't think it needs to be xen_ulong_t,
> >> but maybe using unsigned int instead wouldn't make a difference in
> >> generated code.
> > 
> > Keeping the same type as mcs->call.args[i] would seem more obviously
> > correct? Not to mention that unsigned long is what we defined as
> > register type? If we really want to avoid xen_ulong_t, then it should
> > be uintptr_t?
> > 
> > We should stick to one type to be used as register type. On ARM, we
> > defined register_t.
> 
> ... with both taken into account e.g.:
> 
>     typeof(mcs->compat_call.args[0]) args[ARRAY_SIZE(mcs->call.args)];
> 
>     for ( i = 0; i < ARRAY_SIZE(args); i++ )
>         args[i] = mcs->call.args[i];
> 
>     memcpy(mcs->compat_call.args, args, sizeof(args));
> 
> Of course there are variations possible. There also may want to be a
> BUILD_BUG_ON() to "document" both array sizes match, even if the compat
> form is auto-generated from the native one.
> 
> Tangential: As of 2f531c122e95 ("x86: limit number of hypercall parameters
> to 5") it's kind of bogus that we process 6 array elements here. This even
> extends to an assertion in hypercall_xlat_continuation() and to some of
> the handling in hypercall_create_continuation(). I guess I will want to
> make a patch there, which of course I could make cover the Misra aspect
> here as well.

Please do, that would be much appreciated. Thank you! Also thanks for
2f531c122e95.

