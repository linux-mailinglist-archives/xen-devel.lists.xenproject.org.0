Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3137BFB21
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 14:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614912.956161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBi7-00030k-8X; Tue, 10 Oct 2023 12:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614912.956161; Tue, 10 Oct 2023 12:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBi7-0002y1-5e; Tue, 10 Oct 2023 12:19:39 +0000
Received: by outflank-mailman (input) for mailman id 614912;
 Tue, 10 Oct 2023 12:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+X1=FY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqBWH-0006hr-St
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 12:07:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bf94520-6765-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 14:07:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E77114EE0737;
 Tue, 10 Oct 2023 14:07:12 +0200 (CEST)
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
X-Inumbo-ID: 8bf94520-6765-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 14:07:12 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Paul
 Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <f9a24504-97e7-4a2e-8601-8e4672b45f88@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
 <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
 <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
 <alpine.DEB.2.22.394.2310061746190.3431292@ubuntu-linux-20-04-desktop>
 <d90524b8-70ee-457e-8d6a-9e69f135b81d@xen.org>
 <alpine.DEB.2.22.394.2310091803060.3431292@ubuntu-linux-20-04-desktop>
 <f9a24504-97e7-4a2e-8601-8e4672b45f88@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <eda6269602e89abf5bd1e23cc81d0528@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>>> 
>>>> I agree on everything Julien's wrote and I was about to suggest to 
>>>> use a
>>>> SAF comment to suppress the warning because it is clearer than a int
>>>> cast.
>>>> 
>>>> But then I realized that even if BITS_TO_LONGS was fixed, wouldn't 
>>>> still
>>>> we have a problem because IOMMU_FEAT_count is an enum?
>>>> 
>>>> Is it the case that IOMMU_FEAT_count would have to be cast 
>>>> regardless,
>>>> either to int or unsigned int or whatever to be used in 
>>>> DECLARE_BITMAP?
>>>> 
>>>> 
>>>> So we have 2 problems here: one problem is DECLARE_BITMAP taking int
>>>> instead of unsigned int, and another problem is IOMMU_FEAT_count 
>>>> being
>>>> an enum.
>>>> 
>>>> If I got it right, then I would go with the cast to int (like done 
>>>> in
>>>> this patch) with a decent comment on top of it.
>>> 
>>> I might be missing something here. But why should we use cast rather 
>>> than /*
>>> SAF-X */ just above? I would have expected we wanted to highlight the
>>> violation rather than hiding it.
>> 
>> My understanding is that the cast is required when converting an enum
>> type to an integer type and vice versa. The idea is that we shouldn't 
>> do
>> implicit conversions as they are error prone, only explicit 
>> conversions
>> are allowed between enum and integers.
> 
> We have a lot of places in Xen using implicit conversion from enum to
> integer (for instance in the P2M code for p2m_type_t). Does ECLAIR
> report all of them? If not, then why?
> 

Can you give some pointers as to where this enum is used in arithmetic 
operations?
 From a cursory glace I can see equality comparisons and
as arguments to the array subscript operator, which are both compliant.

>> 
>> So we need either (int) or (unsigned int). The question is which one
>> between the two, and theoretically (unsigned int) is better but due to
>> the reasons above (int) is the simplest choice.
>> 
>> Yes, instead of the cast we can also add a SAF-x comment, which refers
>> to a deviation that says something along the lines "we could fix this
>> with a cast but we prefer a deviation because it makes the code easier
>> to read".
>> 
>> In general my personal preference would be to use a cast, because we
>> shouldn't implicitly convert enums to integers.
> 
> See above. I'd like to understand whether we are going to sprinkle the
> code with cast. If so, I am afraid I am against this solution.
> 
> Cheers,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

