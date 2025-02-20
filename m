Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F4A3CEEC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 02:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893476.1302354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvjl-0001H5-9H; Thu, 20 Feb 2025 01:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893476.1302354; Thu, 20 Feb 2025 01:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvjl-0001Ex-5k; Thu, 20 Feb 2025 01:52:25 +0000
Received: by outflank-mailman (input) for mailman id 893476;
 Thu, 20 Feb 2025 01:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkvjk-0001Er-15
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 01:52:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530a6794-ef2d-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 02:52:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3DF561267;
 Thu, 20 Feb 2025 01:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FF5C4CED1;
 Thu, 20 Feb 2025 01:52:19 +0000 (UTC)
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
X-Inumbo-ID: 530a6794-ef2d-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740016341;
	bh=+6oF7PEiwsgBWgBilxqkv2gJhiLYfNL5KPnqgDpLpyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GWAYUhFlle38er42bg8P5+j+ZwDluRV/d3dIoevA2RZEQ+Q48boHLgXDmM1kRrbQt
	 48NDrEIRigWMiMb2+EEl6MvkQTi2w1udqGyA/mAZfsNnkhG5RPbFAW2te/y8BWMBuI
	 65/lIUV+iqSD4wuDEg3OcLgHO32bhmbM0QZdAhXLY9pOQdG38MZyy2ajDd0F/lh1Hd
	 MkOmq3GSBQdUhmUSFSQnfx4zGloGhnte2XVCz+uIpW8vzoiUiroeWcXmD3333KqxJ8
	 6bHipWloqLNw2zdKaXctWf/dhi+NbahD4u3Wuf43EsH7Ib5yK3cIK/uSqlzyhd2QCy
	 c5qifQsQ53V6A==
Date: Wed, 19 Feb 2025 17:52:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com, 
    xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
In-Reply-To: <4e084d1c-93c0-4148-b12c-27f56f678a74@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502191751350.1791669@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop> <daaf4284-102c-4fc4-819c-2231705ab572@suse.com> <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop> <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
 <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop> <4e084d1c-93c0-4148-b12c-27f56f678a74@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Jan Beulich wrote:
> On 18.02.2025 22:42, Stefano Stabellini wrote:
> > On Tue, 18 Feb 2025, Jan Beulich wrote:
> >> On 18.02.2025 00:12, Stefano Stabellini wrote:
> >>> On Mon, 17 Feb 2025, Jan Beulich wrote:
> >>>> On 15.02.2025 03:16, Stefano Stabellini wrote:
> >>>>> --- a/xen/arch/x86/hvm/hvm.c
> >>>>> +++ b/xen/arch/x86/hvm/hvm.c
> >>>>> @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
> >>>>>  {
> >>>>>      ASSERT(v == current || !vcpu_runnable(v));
> >>>>>  
> >>>>> -    switch ( reg )
> >>>>> -    {
> >>>>> -    default:
> >>>>> -        return alternative_call(hvm_funcs.get_reg, v, reg);
> >>>>> -    }
> >>>>> +    return alternative_call(hvm_funcs.get_reg, v, reg);
> >>>>>  }
> >>>>>  
> >>>>>  void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> >>>>>  {
> >>>>>      ASSERT(v == current || !vcpu_runnable(v));
> >>>>>  
> >>>>> -    switch ( reg )
> >>>>> -    {
> >>>>> -    default:
> >>>>> -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> >>>>> -    }
> >>>>> +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> >>>>>  }
> >>>>
> >>>> Both of these were, iirc, deliberately written using switch(), to ease
> >>>> possible future changes.
> >>>
> >>> To be honest, I do not see any value in the way they are currently
> >>> written. However, if you prefer, I can add a deviation for this, with
> >>> one SAF comment for each of these two. The reason for the deviation
> >>> would be "deliberate to ease possible future change". Please let me know
> >>> how you would like to proceed.
> >>
> >> Well, best next thing you can do is seek input from the person who has
> >> written that code, i.e. Andrew.
> > 
> > Andrew wrote in chat that he is OK with a deviation and he can live with
> > a SAF deviation. Here is the patch.
> > 
> > 
> > ---
> > xen/x86: resolve the last 3 MISRA R16.6 violations
> > 
> > MISRA R16.6 states that "Every switch statement shall have at least two
> > switch-clauses". There are only 3 violations left on x86 (zero on ARM).
> > 
> > One of them is only a violation depending on the kconfig configuration.
> > So deviate it instead with a SAF comment.
> > 
> > Two of them are deliberate to enable future additions. Deviate them as
> > such.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks!

Oleksii, may I ask for a release-ack?

