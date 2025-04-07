Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACDA7E417
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940410.1340206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oJq-000317-KV; Mon, 07 Apr 2025 15:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940410.1340206; Mon, 07 Apr 2025 15:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oJq-0002z3-Hs; Mon, 07 Apr 2025 15:23:26 +0000
Received: by outflank-mailman (input) for mailman id 940410;
 Mon, 07 Apr 2025 15:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lW7C=WZ=bounce.vates.tech=bounce-md_30504962.67f3ede9.v1-58732c32288a433ebd907414df01abc5@srs-se1.protection.inumbo.net>)
 id 1u1oJo-0002yx-Em
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:23:24 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3db1879a-13c4-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 17:23:22 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZWXzF23zpz705fLn
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 15:23:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 58732c32288a433ebd907414df01abc5; Mon, 07 Apr 2025 15:23:21 +0000
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
X-Inumbo-ID: 3db1879a-13c4-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744039401; x=1744309401;
	bh=dPlX+pXatbLy7fsNtby6lXZfl846Y44f7uBgpjEmKEo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Zqb9M7SlgmcBpMhPtRy932lOU+bofQra1TvI4CR56VS2++D0OzC92YGUxkisZUBsr
	 rdRrKtS4jPSu8eKz+cUVwz6ZJl5+KUbpRa2uDVApTgGQ33pAKCgJss4lerYdUZJcvf
	 h9GHRqMDaQmSPXzgWd49qIY+XPqnyBzAOiEsy2DTS4f3XEurWQltfs/7bNjcwT+FDa
	 ezIq8kpPtbPeS7JnnC61Djwn7SERtZPckqnyEBQXMsJF3uDI7OW1zA8Y4aSnqc1GEe
	 f48T954ue0ZpSCllfbciFM+zzdKEL0jCGAOJa0Sceu2GHkTDsoL/T+7oqJgGNFuy+P
	 nqRACocgRiUxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744039401; x=1744299901; i=anthony.perard@vates.tech;
	bh=dPlX+pXatbLy7fsNtby6lXZfl846Y44f7uBgpjEmKEo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sAk2ZZWhQR2JAVSm1zj5IfAu2k0AR/VWsD+t1kb+mxS6IFVY7JGsC51RS9Srx1gRR
	 QRcf0COtQAcnRSO4c6PBQw2IOVUnFgH4EsynBUox2F9cFVWYdRVEF5NXeP9tSPjax6
	 OLfq63BqtL0/Zf54dNhCw0V38P5HYi1aC2ALxV4XngeEUgXYgElNZswz6St8C30p6J
	 DEJrWScNn/xYtHiRZfemEyknuDhr6bmFFZB5qVxxpbaj/or5VuROTMWz3Dy3lIHuVG
	 uNFtxpoKCZGvd0Fq872rt01B4i1wTSMXZx3rsEtHLxooB67j0uiq4TUyfDM/IIhx7l
	 i+mkcB4NWmIbA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Ping:=20[PATCH]=20libxc/PM:=20correct=20(not=20just)=20error=20handling=20in=20xc=5Fget=5Fcpufreq=5Fpara()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744039400554
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Z_Pt6Pv8_RrV4J2U@l14>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com> <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com> <Z_PI2UNn2C4GKqYw@l14> <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com>
In-Reply-To: <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.58732c32288a433ebd907414df01abc5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 15:23:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Apr 07, 2025 at 03:23:48PM +0200, Jan Beulich wrote:
> On 07.04.2025 14:45, Anthony PERARD wrote:
> > On Mon, Apr 07, 2025 at 01:38:24PM +0200, Jan Beulich wrote:
> >> On 27.03.2025 14:32, Jan Beulich wrote:
> >>> From their introduction all xc_hypercall_bounce_pre() uses, when they
> >>> failed, would properly cause exit from the function including cleanup,
> >>> yet without informing the caller of the failure. Purge the unlock_1
> >>> label for being both pointless and mis-named.
> >>>
> >>> An earlier attempt to switch to the usual split between return value and
> >>> errno wasn't quite complete.
> >>>
> >>> HWP work made the cleanup of the "available governors" array
> >>> conditional, neglecting the fact that the condition used may not be the
> >>> condition that was used to allocate the buffer (as the structure field
> >>> is updated upon getting back EAGAIN). Throughout the function, use the
> >>> local variable being introduced to address that.
> >>>
> >>> Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
> >>> Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
> >>> Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> May I ask for an ack or comments towards what needs changing?
> > 
> > Calling xc_get_cpufreq_para with:
> > 
> >     user_para = {
> >         .cpu_num = 0,
> >         .freq_num = 0,
> >         .gov_num = 9,
> >     };
> > 
> > seems broken. It's looks like the `scaling_available_governors` bounce
> > buffer is going to be used without been allocated properly handled, with
> > this patch.
> 
> The local variable "in_gov_num" controls its allocation and use, together with
> has_num. "Use" as in passing to set_xen_guest_handle(). The only further use

When has_num == 0, `in_gov_num` is only used to set `sys_para->gov_num`.
It also make a conditional call to xc_hypercall_bounce_post() but
there's nothing to do.

Why user_para.gov_num seems to control the size of a buffer, but then
that buffer is just discarded under some condition with this patch?

Is the proposed parameter (where only gov_num is set) a valid input? If
not, why is it not rejected before making the hypercall? (with this
patch)

> of that bounce buffer is on the exit path, i.e. it being passed to
> xc_hypercall_bounce_post(). The backing function xc__hypercall_bounce_post()
> is dealing fine with the buffer being NULL. And that's what it would be left
> at from DECLARE_NAMED_HYPERCALL_BOUNCE() if buffer allocation is skipped.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



