Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9615A9FDAC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 01:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971267.1359730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Xms-0002hV-M4; Mon, 28 Apr 2025 23:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971267.1359730; Mon, 28 Apr 2025 23:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Xms-0002er-J1; Mon, 28 Apr 2025 23:21:22 +0000
Received: by outflank-mailman (input) for mailman id 971267;
 Mon, 28 Apr 2025 23:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9Xms-0002el-4e
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 23:21:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ceece68-2487-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 01:21:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 887CA4346A;
 Mon, 28 Apr 2025 23:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCEC4CEE4;
 Mon, 28 Apr 2025 23:21:15 +0000 (UTC)
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
X-Inumbo-ID: 7ceece68-2487-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745882477;
	bh=5uJgr/+NgwFzpTwPQ6nSbDSxu2IgRBYLztjHzOFx9r8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JSWqSoZFGA9nyUY9s0VBgZP6r1CRD+ykglyC29sRIcFWLNPUguiGCkzR63GRGqv5l
	 pvn4vhR9McErK+D2PGSdI4vfqLvx78EEKW7mshKtF8KZZwkjBP/9tFUgp3oPeNxSjk
	 6g5l6xh8BxNB4ZErao5NfbGgrjPXWEvCNwuBK3ZhBlEp8+yFhoqxf7DH9FrBH9rLmr
	 20cDVYZ3NufLtqV+hnRaVEqbEaGpdQkSaW0iOSbRrTvrHl5AJGJqZuMUGHjHn2HV5D
	 gp5hhVuMvGzGvDw5FDGH54FByBfvahlWrpkLN+IjM+iXBt7nGb56USKCUq6G6GJDUW
	 bjRZnG/ohdlcw==
Date: Mon, 28 Apr 2025 16:21:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/3] compat: address violations of MISRA C Rule 19.1
In-Reply-To: <cb1f8a8f-8834-4610-baab-c53bf5928b0c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504281614020.785180@ubuntu-linux-20-04-desktop>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com> <74b0420ab20fc0204db14c0a1a4a68ed48b25a38.1745624090.git.victorm.lira@amd.com> <cb1f8a8f-8834-4610-baab-c53bf5928b0c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Jan Beulich wrote:
> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Rule 19.1 states: "An object shall not be assigned or copied
> > to an overlapping object". Since the "call" and "compat_call" are
> > fields of the same union, reading from one member and writing to
> > the other violates the rule, while not causing Undefined Behavior
> > due to their relative sizes. However, a dummy variable is used to
> > address the violation and prevent the future possibility of
> > incurring in UB.
> 
> If there is such a concern, ...
> 
> > --- a/xen/common/compat/multicall.c
> > +++ b/xen/common/compat/multicall.c
> > @@ -15,8 +15,13 @@ typedef int ret_t;
> >  static inline void xlat_multicall_entry(struct mc_state *mcs)
> >  {
> >      int i;
> > +    xen_ulong_t arg;
> > +
> >      for (i=0; i<6; i++)
> > -        mcs->compat_call.args[i] = mcs->call.args[i];
> > +    {
> > +        arg = mcs->call.args[i];
> > +        mcs->compat_call.args[i] = arg;
> > +    }
> >  }
> 
> ... wouldn't it be of concern as well that the alternating parts of
> the union are still accessed in a flip-flop manner? IOW we continue to
> rely on the relative placement properties of the individual array
> elements. To eliminate such a concern, I think the resulting code would
> also want to be correct if iteration was swapped to work downwards.
> 
> Also the scope of the temporary could certainly be the loop body rather
> than the entire function.

Wouldn't be safer to do this then?

static inline void xlat_multicall_entry(struct mc_state *mcs)
{
    int i;
    xen_ulong_t args[6];

    for ( i = 0; i < 6; i++ )
    {
        args[i] = mcs->call.args[i];
    }
    for ( i = 0; i < 6; i++ )
    {
        mcs->compat_call.args[i] = args[i];
    }
}

If you have any specific suggestions I think C code would be easier to
understand than English.


> I also don't think it needs to be xen_ulong_t,
> but maybe using unsigned int instead wouldn't make a difference in
> generated code.

Keeping the same type as mcs->call.args[i] would seem more obviously
correct? Not to mention that unsigned long is what we defined as
register type? If we really want to avoid xen_ulong_t, then it should
be uintptr_t?

We should stick to one type to be used as register type. On ARM, we
defined register_t.

