Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91109A7FA92
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941720.1341131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25jt-0003c5-JO; Tue, 08 Apr 2025 09:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941720.1341131; Tue, 08 Apr 2025 09:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25jt-0003a6-Gn; Tue, 08 Apr 2025 09:59:29 +0000
Received: by outflank-mailman (input) for mailman id 941720;
 Tue, 08 Apr 2025 09:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odLW=W2=bounce.vates.tech=bounce-md_30504962.67f4f37c.v1-2ca678eeaa2d4da3894aa5bc9a831ee4@srs-se1.protection.inumbo.net>)
 id 1u25js-0003a0-10
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:59:28 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26ef9515-1460-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 11:59:25 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZX1l03tMJzS62H9P
 for <xen-devel@lists.xenproject.org>; Tue,  8 Apr 2025 09:59:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2ca678eeaa2d4da3894aa5bc9a831ee4; Tue, 08 Apr 2025 09:59:24 +0000
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
X-Inumbo-ID: 26ef9515-1460-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744106364; x=1744376364;
	bh=yUBUC6eOcXEnZae2QLjdkhL3Fa7cAE9ycBJ3eRdw94Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mw8Qjq4CXrsCUEkDfKC6B0T36BM7CnLH/tPfsx5cO4lF4tfgLAIITwYR1C7oN5YX/
	 JVteQJ+A0NlfjlirM10BOLfMqnYRFon7Zsi+zQA5ZHGb20cKCcFT4d9tSkpLHizmXn
	 ciwNYIAqyFzFizSQEYS/dxyCUVVvvEoeAKKlMUnp0b69E/KT7GFMKOzDPKw1T492ow
	 GVG8Z4kUMsWpEy5csKPpY6A35QbuDLYs2FS0RiiXjiolRmShJxhts/q05sDPMS7Ghw
	 xHzQVV8a6ag1i64Ee9xPbJWNTs3GwNUdgiE0gUGQTu641H9cCzuH3bVAVhchUdYBwo
	 FyUdBKyIEidyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744106364; x=1744366864; i=anthony.perard@vates.tech;
	bh=yUBUC6eOcXEnZae2QLjdkhL3Fa7cAE9ycBJ3eRdw94Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tMCd3AO8mk08aP7qWMqBM1R/CPn+xuz0jGSG9g32bFo787727SiNobyXkwZ0+OnDH
	 QuZNLMEf9gW+Qd0fLWOMdvu+Fq+h9Ah+trtuUuP0XvPt3TinZZ4SBgIKcLUQngXWnJ
	 qoqHQtpXcHPwsdau0K6aefDgp2w47OEPeXC+l1VD0cNrQmZcjOIc/2/bnoFiVkU8cs
	 rai9YmM51s6AqUUZdG6zkOldc5Cy++2R7ZYeKT6T6MHjdUaINLfoj0SxeTRjME86ee
	 edUJLej4nLu1BSpzg+xwxoCwQ2ATKLD/JTkEw1iKZiGe0JFQkQwZON7gzMWqeOMAi6
	 Z9+RD5FSsfWJQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Ping:=20[PATCH]=20libxc/PM:=20correct=20(not=20just)=20error=20handling=20in=20xc=5Fget=5Fcpufreq=5Fpara()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744106363855
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Z_Tze0pQFrU-9pNq@l14>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com> <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com> <Z_PI2UNn2C4GKqYw@l14> <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com> <Z_Pt6Pv8_RrV4J2U@l14> <8f29b0b3-dc57-417c-937a-50f5aac6f6f8@suse.com>
In-Reply-To: <8f29b0b3-dc57-417c-937a-50f5aac6f6f8@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2ca678eeaa2d4da3894aa5bc9a831ee4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250408:md
Date: Tue, 08 Apr 2025 09:59:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Apr 07, 2025 at 05:38:57PM +0200, Jan Beulich wrote:
> On 07.04.2025 17:23, Anthony PERARD wrote:
> > On Mon, Apr 07, 2025 at 03:23:48PM +0200, Jan Beulich wrote:
> >> On 07.04.2025 14:45, Anthony PERARD wrote:
> >>> Calling xc_get_cpufreq_para with:
> >>>
> >>>     user_para = {
> >>>         .cpu_num = 0,
> >>>         .freq_num = 0,
> >>>         .gov_num = 9,
> >>>     };
> >>>
> >>> seems broken. It's looks like the `scaling_available_governors` bounce
> >>> buffer is going to be used without been allocated properly handled, with
> >>> this patch.
> >>
> >> The local variable "in_gov_num" controls its allocation and use, together with
> >> has_num. "Use" as in passing to set_xen_guest_handle(). The only further use
> > 
> > When has_num == 0, `in_gov_num` is only used to set `sys_para->gov_num`.
> > It also make a conditional call to xc_hypercall_bounce_post() but
> > there's nothing to do.
> > 
> > Why user_para.gov_num seems to control the size of a buffer, but then
> > that buffer is just discarded under some condition with this patch?
> 
> That's nothing this patch changes. Previously has_num would also have been
> false in the example you give.

Right, sorry. I was persuaded that `has_num` meant "any" of the buffers
are allocated, instead of the written "all" of them are allocated in C.
The logic in this function is really hard to follow because it doesn't
make sense, especially the conditional on `has_num`.

Your patch does make requesting governors actually optional now (and now
that I realise the calculation of `has_num` doesn't really reflect the
name). The introduced `in_gov_num` local variable isn't very useful as
the only real need is in the cleaning path (and we discussed earlier
that cleaning can be done unconditionally). So the patch is fine:

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>


Oh, one more thing, it's funny that a lot of faff is done toward making
the cleaning optional, with all the "unlock_*" label, but then cleaning
code path can be executed when e.g. cpu_num=0,freq_num=4 (unless the
hypercall return an error in such case, but the code shouldn't rely on
that...).

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



