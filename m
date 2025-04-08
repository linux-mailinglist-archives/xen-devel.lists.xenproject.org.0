Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62CA80282
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 13:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941796.1341187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27QY-0005g6-Vn; Tue, 08 Apr 2025 11:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941796.1341187; Tue, 08 Apr 2025 11:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27QY-0005cy-SV; Tue, 08 Apr 2025 11:47:38 +0000
Received: by outflank-mailman (input) for mailman id 941796;
 Tue, 08 Apr 2025 11:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbxa=W2=bounce.vates.tech=bounce-md_30504962.67f50cd6.v1-6add6fcaea3f497a8fe23b192498d509@srs-se1.protection.inumbo.net>)
 id 1u27QX-0005cs-IV
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 11:47:37 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43408b0b-146f-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 13:47:35 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZX47p23Y6zS62GxB
 for <xen-devel@lists.xenproject.org>; Tue,  8 Apr 2025 11:47:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6add6fcaea3f497a8fe23b192498d509; Tue, 08 Apr 2025 11:47:34 +0000
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
X-Inumbo-ID: 43408b0b-146f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744112854; x=1744382854;
	bh=YfNQ6hRfzm8uz2wsvkuZLO3cvqePYwKdvDhIOCJV7ZY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jQ/Kv+raJRbuq6l7++0SFHZuTnB6BD0lxTWie7VnsJbAoqM0IDWLbGZ+8wrWAuM4e
	 cEkbKDgZlJbSR1mF796oe0emD3lwJXPn96wk+o2fe2U5CUAC5YFEeAyZJOurh/hP2I
	 WlleZHsUVdmxazvMqLSvK6swFhIfHn6B5ILADAhHTNRhCbKLbZWlziKqKvwWrLvWhz
	 Gmz2viqwBhF7Yi9jOXmVDhP18mggIaF2I72CZwAXmfJuZdZTi2Cx2mrc7Zl/21NgKg
	 ZKP1rt2IsVd7Z+nNjEbG/+T13DaowE72/AHsoU8LbcP1luyd932iG00YYpatgAjICU
	 hmDrEk9OdfTBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744112854; x=1744373354; i=anthony.perard@vates.tech;
	bh=YfNQ6hRfzm8uz2wsvkuZLO3cvqePYwKdvDhIOCJV7ZY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HEtJ3/O37//1s0YmB6yP7yuMucLorJ7L4NnZHde3b4Wqag46k5WnE20bxjxh45vck
	 rIJ21z7k9vJDkgjE6fNj9ghk4KMg8FEzJ0tGrKSg4HAmONEP1/IyJCJuGe/nlUYlsf
	 2+509S3c8kgpp1jEazRVRRkmRNSpiaDEDA14gqWne3XLHVRSYK2vYSvA7qcsQ4mE/8
	 XT+zOi3u9d9bJ4HVMewd++1yHkxaaDrTncrui7icipsI/cxxcY3SmxktDDzfEuWnOa
	 K2cYmyxijm0kMytifU39RTpFEd+O/oXiWUCDZAPXQOGHQN05dHTELEXFB1aGbO6vCU
	 EyR9MmJAxIaQw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Ping:=20[PATCH]=20libxc/PM:=20correct=20(not=20just)=20error=20handling=20in=20xc=5Fget=5Fcpufreq=5Fpara()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744112853666
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Z_UM1KaELOPAtQ7l@l14>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com> <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com> <Z_PI2UNn2C4GKqYw@l14> <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com> <Z_Pt6Pv8_RrV4J2U@l14> <8f29b0b3-dc57-417c-937a-50f5aac6f6f8@suse.com> <Z_Tze0pQFrU-9pNq@l14> <38df7f46-4468-4d0a-92a7-92f0fad13ede@suse.com>
In-Reply-To: <38df7f46-4468-4d0a-92a7-92f0fad13ede@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6add6fcaea3f497a8fe23b192498d509?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250408:md
Date: Tue, 08 Apr 2025 11:47:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Apr 08, 2025 at 12:47:58PM +0200, Jan Beulich wrote:
> On 08.04.2025 11:59, Anthony PERARD wrote:
> > On Mon, Apr 07, 2025 at 05:38:57PM +0200, Jan Beulich wrote:
> >> On 07.04.2025 17:23, Anthony PERARD wrote:
> >>> On Mon, Apr 07, 2025 at 03:23:48PM +0200, Jan Beulich wrote:
> >>>> On 07.04.2025 14:45, Anthony PERARD wrote:
> >>>>> Calling xc_get_cpufreq_para with:
> >>>>>
> >>>>>     user_para = {
> >>>>>         .cpu_num = 0,
> >>>>>         .freq_num = 0,
> >>>>>         .gov_num = 9,
> >>>>>     };
> >>>>>
> >>>>> seems broken. It's looks like the `scaling_available_governors` bounce
> >>>>> buffer is going to be used without been allocated properly handled, with
> >>>>> this patch.
> >>>>
> >>>> The local variable "in_gov_num" controls its allocation and use, together with
> >>>> has_num. "Use" as in passing to set_xen_guest_handle(). The only further use
> >>>
> >>> When has_num == 0, `in_gov_num` is only used to set `sys_para->gov_num`.
> >>> It also make a conditional call to xc_hypercall_bounce_post() but
> >>> there's nothing to do.
> >>>
> >>> Why user_para.gov_num seems to control the size of a buffer, but then
> >>> that buffer is just discarded under some condition with this patch?
> >>
> >> That's nothing this patch changes. Previously has_num would also have been
> >> false in the example you give.
> > 
> > Right, sorry. I was persuaded that `has_num` meant "any" of the buffers
> > are allocated, instead of the written "all" of them are allocated in C.
> > The logic in this function is really hard to follow because it doesn't
> > make sense, especially the conditional on `has_num`.
> > 
> > Your patch does make requesting governors actually optional now (and now
> > that I realise the calculation of `has_num` doesn't really reflect the
> > name). The introduced `in_gov_num` local variable isn't very useful as
> > the only real need is in the cleaning path (and we discussed earlier
> > that cleaning can be done unconditionally).
> 
> Hmm, yes. See below.
> 
> > So the patch is fine:
> > 
> > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Thanks.
> 
> > Oh, one more thing, it's funny that a lot of faff is done toward making
> > the cleaning optional, with all the "unlock_*" label, but then cleaning
> > code path can be executed when e.g. cpu_num=0,freq_num=4 (unless the
> > hypercall return an error in such case, but the code shouldn't rely on
> > that...).
> 
> Yeah, perhaps I could have dropped the conditional there, rather than updating
> it. Are you happy for me to do so, dropping in_gov_num again (adjusting the
> description some, of course)?

Yes, sounds good, thanks.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



