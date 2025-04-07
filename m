Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E1A7DE05
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940053.1339938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lqp-0008Bk-Uk; Mon, 07 Apr 2025 12:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940053.1339938; Mon, 07 Apr 2025 12:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1lqp-0008A4-S3; Mon, 07 Apr 2025 12:45:19 +0000
Received: by outflank-mailman (input) for mailman id 940053;
 Mon, 07 Apr 2025 12:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+me=WZ=bounce.vates.tech=bounce-md_30504962.67f3c8da.v1-bb4178fe5553441b82bd7ecf1dfbf6a3@srs-se1.protection.inumbo.net>)
 id 1u1lqo-00089y-Gn
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:45:18 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 276e9eec-13ae-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 14:45:16 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZWTSq03z1zS62H97
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 12:45:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bb4178fe5553441b82bd7ecf1dfbf6a3; Mon, 07 Apr 2025 12:45:14 +0000
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
X-Inumbo-ID: 276e9eec-13ae-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744029915; x=1744299915;
	bh=xl0p93gFDyv4jF0UdvNAEBv/3oOUUM+v4jusW7PLYlU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jGOQCRTzc0EjOTZW00Lp/P2LURf9I9ra5HBQlNuFew/Rzs/y1iwjVgUMuvhk+nydq
	 PHCDM+lFs+YOcT7sm91myHWfHHLF7Oiu3pEpSYOR7G5nKBuuq4367GOPyZoVXwY/Bk
	 3OOU5TE/cCnbrLe/3349fqxj4W5tvxa8rxjwHe2bhKYTF80xV4qXPmUiY1o8YnjtN4
	 qIqzVqtwlDNZGM/BgQ1t+ge1K/0FULzlKYk9rJkiNGdTUvncZXb3HZLY6Ag5XneiLi
	 QaJxI6mjBLNfgXIsoaN9cY1DVkTk//y51JNBLF7rV9x439mtYpFpxnDmqDoYlHu4OJ
	 2P9yAKO+RI+3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744029915; x=1744290415; i=anthony.perard@vates.tech;
	bh=xl0p93gFDyv4jF0UdvNAEBv/3oOUUM+v4jusW7PLYlU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m5MO8W/mFHZ8Mn2iYSpNZtcXXgw6BRkgKxBhVfwHETGsq+aafyAizf0QTsCTM6mn9
	 FN7bqwUStbu4P6D3cqRO6Q/VTdSeh4foQmTuJ07KnJFepuD9jlFSdQF3VNruqU5ChF
	 gumlUn9aupSYcmCN1qQa+fp/ryfkWSJIyIWyBnkh2RzSqTM3dVKip4qfGVQV/ophgs
	 ct8lN7mRnuoW9Ry3bpwu5uV+r1QkKirTBkKbJ8DjyigjVEgkzahjpVJNMPabTtQrqF
	 NBJlISz2h8m7og0IhmaoX2wYAl7jic+IW/fNZm+7PQ1p6BtkgjXVJSl5k+O78a5mF9
	 hKpi1qjs/UlmQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Ping:=20[PATCH]=20libxc/PM:=20correct=20(not=20just)=20error=20handling=20in=20xc=5Fget=5Fcpufreq=5Fpara()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744029913861
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Z_PI2UNn2C4GKqYw@l14>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com> <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com>
In-Reply-To: <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bb4178fe5553441b82bd7ecf1dfbf6a3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 12:45:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Apr 07, 2025 at 01:38:24PM +0200, Jan Beulich wrote:
> On 27.03.2025 14:32, Jan Beulich wrote:
> > From their introduction all xc_hypercall_bounce_pre() uses, when they
> > failed, would properly cause exit from the function including cleanup,
> > yet without informing the caller of the failure. Purge the unlock_1
> > label for being both pointless and mis-named.
> > 
> > An earlier attempt to switch to the usual split between return value and
> > errno wasn't quite complete.
> > 
> > HWP work made the cleanup of the "available governors" array
> > conditional, neglecting the fact that the condition used may not be the
> > condition that was used to allocate the buffer (as the structure field
> > is updated upon getting back EAGAIN). Throughout the function, use the
> > local variable being introduced to address that.
> > 
> > Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
> > Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
> > Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> May I ask for an ack or comments towards what needs changing?

Calling xc_get_cpufreq_para with:

    user_para = {
        .cpu_num = 0,
        .freq_num = 0,
        .gov_num = 9,
    };

seems broken. It's looks like the `scaling_available_governors` bounce
buffer is going to be used without been allocated properly handled, with
this patch.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



