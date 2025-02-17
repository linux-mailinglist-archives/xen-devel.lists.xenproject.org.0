Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7039A37D39
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889808.1298848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwXX-000163-8D; Mon, 17 Feb 2025 08:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889808.1298848; Mon, 17 Feb 2025 08:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwXX-00014b-5U; Mon, 17 Feb 2025 08:31:43 +0000
Received: by outflank-mailman (input) for mailman id 889808;
 Mon, 17 Feb 2025 08:31:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Nw3=VI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tjwXV-00014V-MT
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:31:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bea32b9-ed09-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 09:31:40 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3308A4EEF410;
 Mon, 17 Feb 2025 09:31:39 +0100 (CET)
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
X-Inumbo-ID: 9bea32b9-ed09-11ef-9aa6-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739781099;
	b=2C0LnPYmlWWTd/oWqUpMFCXL10WL9BgJv0zrhYrWgNfY50lKODNkrEFwO3+09zvFhRbB
	 2ly9mrAmUe0uGY50gUJyiPZtmvQdp/h8w0y+hQEdvIRblsHOzQ75xgks5ZL0H/KdfCAQf
	 TvYzanu+ihDJmQvbqmmxZXS5r9gik9lNYObDrnQhZX0Df8Hs4/tWVk7J1Gz6qLVB6ChT9
	 VP+FjZnijzSIUM75vLyi/VgGYs/eKM3d5UQpp2YJyl5GgF/Bas4nugh7hGlYYxMbyYwcg
	 WbL2UF2P8ojXFz280l0ct9YsvEaE5y8fNZkTf2up1IURBH8NzhoQ+XL5Uts8RPeCUN312
	 WYO0cgfkPwK4CkNpvjkKNYL8zolcc0IHvCMzJNcvp2CdPDuMcdMueSr0il44nDvsakRFb
	 hCoRRidPPqY4zqAYVBbWuKQNfyi81fV41RZ4Ar/99OkA45Uh0ubw1dMHboA37wKRrWw71
	 VfEHRnoU8XhkW4TcQfaQXDt56KCtzu7NxoQciTSXjJszjKjk6Wsy5m9fqfCh39ms2uIyQ
	 pbuJ+5etuwtlAboVyyL9TxYHqIy6hmnQXUP+CGlSClCzr9axkK1BgxoiL0d9cjYUAAosr
	 dCQsaUkex8bG+GawkGhO3FovyOB1UkJ7SNBH+4JYTNLc+UIwCTd6TGAp7ZMoWiE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739781099;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=bAnOnOpMg+6gRC1AvDxQLE44E6y/GZB3zVbRQHQbt7o=;
	b=LROYLFejSM99uk9vW9SKXm6yph21GnewZYigIdZxGYMeDcCThxNSVdFuAATRmiKNmxvX
	 cNwvXJCNwWWpXx/ZO2GrXeEk5ZM6vPB2DRt7a5BPBhKKqzqdj7MLlKHjPO6odU2VHeA5/
	 OgWdlVdGx+y0OXd0ozyeJw+hIiyHPguvW19QtGkXbLL3frxTRRO431tsKgFaspgLuIoHe
	 9TTUreprkA3CN+GG3Iu1a/TavGQunKhIJOZGrjGvBkWEoIPree6kclaMRgkkZvpY83NZk
	 V7ycui408/VvNzrTs5bDPWSChdcpKssiqxyfcJ0tWFx5RFowYNPKUVWIgSTyp/bmDZqRX
	 XuJU/fHBmr21C+iKZ0rG421M3iop1jMfppHnwn244lHe8/U/hv/3RksKfl31A1iCX3vwV
	 //W7ZJEpfg6y6ZZvgwbtOHyRtOIjdaR37AWsGCDUPEIP0bDeAzxvYYR6ERndpRz/hCXdX
	 MX++o493XBDuPBdhnJXdcZXjTKrbFU1r4e+qQJbWKfNTtSqgjamR0+lmv/LlqUtmYnSmK
	 Cqjh1ZI+6NREdFSN3iC9cAw4w0I75CAo6dZn6qxsQXRSRNe+NIsHsRVgMMK+9Tvhj0+2A
	 cekyiXPRZs76cL7Y0SrwtenMQ3vVnfq1L4evltXYSIXPZ/TMdMD0AgIBno30wac=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739781099; bh=dgWLyV9lX0zvLrqfEHozvom8x4q47FmWW3yz+GZOZFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l3Cay12TgkWdYHbuSCv208h3Zz6tlVABWgXvaCWC5UQgbuSjI/X7TGqv8z0PKZADI
	 yMWtRExXXWGUnommd9zLOUF5llAGVVoUZX8SNkg20TInCe6TdR8jSWUFGJ+Fsk2aLm
	 h3IyGVFAHZnwIvOa7pG0Sh0K5YAFM30tJ+E7ELHdxvmJ9pSY7DWmpN9YLEe4R1Bqp6
	 IHYAoNxuh77u36RpHJiZ3iyYVc4Q+N3VMpE+HIY8tos5WLNJU6I5IosmeF2heNiTq3
	 JvgJkDSxZadAVVaUBXlb2QULgKNtejwzWg/W2s75TIy0hwk8hKIPAZ39yI1ykriKrb
	 8V0msmLKylKdg==
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 09:31:39 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [XEN PATCH 2/3] xen/sched: address violation of MISRA C Rule 8.2
In-Reply-To: <180090ff-f0c1-4040-8c42-6ded7536a527@suse.com>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
 <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2502141303380.3858257@ubuntu-linux-20-04-desktop>
 <180090ff-f0c1-4040-8c42-6ded7536a527@suse.com>
Message-ID: <c4dbb8c88d068cf7bbc5cc6c9d8440ba@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-17 08:54, Jan Beulich wrote:
> On 15.02.2025 00:04, Stefano Stabellini wrote:
>> On Fri, 14 Feb 2025, Nicola Vetrini wrote:
>>> Rule 8.2 states: "Function types shall be in prototype form with
>>> named parameters".
>>> 
>>> The parameter name is missing from the function pointer type
>>> that constitutes the first parameter.
>>> 
>>> No functional change.
>>> 
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> This small fix is needed in order to keep the rule clean in the
>>> follow-up patch that changes the Xen configuration under static
>>> analysis.
>>> 
>>> I wasn't really certain about the right name to give to the 
>>> parameter,
>>> so if there are better options I'd be happy to accept them.
>>> ---
>>>  xen/common/sched/rt.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This is a specific scheduler you touch, which I think wants expressing
> somehow (e.g. via an adjusted prefix) in the patch subject.
> 

Ok. I think it should be "xen/rt" then.

>>> --- a/xen/common/sched/rt.c
>>> +++ b/xen/common/sched/rt.c
>>> @@ -500,7 +500,7 @@ deadline_queue_remove(struct list_head *queue, 
>>> struct list_head *elem)
>>>  }
>>> 
>>>  static inline bool
>>> -deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *),
>>> +deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head 
>>> *q_iter),
>> 
>> I think it should be "elem" instead of "q_iter"
> 
> Why would it matter what the name is? There's no separate decl to stay 
> in
> sync with. (That said, I'd be happy with "elem"; it'll be a matter of 
> the
> maintainers to judge.)
> 
> Jan

I'd be ok with that too.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

