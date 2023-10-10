Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555D7BFAE9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 14:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614795.956088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBcI-0006Jw-Ed; Tue, 10 Oct 2023 12:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614795.956088; Tue, 10 Oct 2023 12:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBcI-0006HS-Bb; Tue, 10 Oct 2023 12:13:38 +0000
Received: by outflank-mailman (input) for mailman id 614795;
 Tue, 10 Oct 2023 12:13:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqBcH-0006HM-Hz
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 12:13:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqBcG-0008As-D7; Tue, 10 Oct 2023 12:13:36 +0000
Received: from [15.248.2.156] (helo=[10.24.67.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqBcG-0000qt-46; Tue, 10 Oct 2023 12:13:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=RLveUHV8OQlcFW/+suergQrYvKlbJ+9d/JJs3E9kxsI=; b=0+AU6tIkEB1wZud+0pEz6Mk8Zu
	5dgSkULtyswcs1XlgVLWemZOlzEtii6/xRAb4lg2HdGLU7FZ1AooQMAnD3SgzlceMKtQl9Nns5Cbv
	IKRLdrEUkR599e050/G3sc+3xztRW/OGCNHzmCYjbSQE+MrZ9IZUp66jO4VqqtBFguSE=;
Message-ID: <bcc81d48-fafb-417a-a609-d6e0c17daf99@xen.org>
Date: Tue, 10 Oct 2023 13:13:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
 <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
 <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
 <alpine.DEB.2.22.394.2310061746190.3431292@ubuntu-linux-20-04-desktop>
 <d90524b8-70ee-457e-8d6a-9e69f135b81d@xen.org>
 <alpine.DEB.2.22.394.2310091803060.3431292@ubuntu-linux-20-04-desktop>
 <f9a24504-97e7-4a2e-8601-8e4672b45f88@xen.org>
 <eda6269602e89abf5bd1e23cc81d0528@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eda6269602e89abf5bd1e23cc81d0528@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/10/2023 13:07, Nicola Vetrini wrote:
> 
>>>>>
>>>>> I agree on everything Julien's wrote and I was about to suggest to 
>>>>> use a
>>>>> SAF comment to suppress the warning because it is clearer than a int
>>>>> cast.
>>>>>
>>>>> But then I realized that even if BITS_TO_LONGS was fixed, wouldn't 
>>>>> still
>>>>> we have a problem because IOMMU_FEAT_count is an enum?
>>>>>
>>>>> Is it the case that IOMMU_FEAT_count would have to be cast regardless,
>>>>> either to int or unsigned int or whatever to be used in 
>>>>> DECLARE_BITMAP?
>>>>>
>>>>>
>>>>> So we have 2 problems here: one problem is DECLARE_BITMAP taking int
>>>>> instead of unsigned int, and another problem is IOMMU_FEAT_count being
>>>>> an enum.
>>>>>
>>>>> If I got it right, then I would go with the cast to int (like done in
>>>>> this patch) with a decent comment on top of it.
>>>>
>>>> I might be missing something here. But why should we use cast rather 
>>>> than /*
>>>> SAF-X */ just above? I would have expected we wanted to highlight the
>>>> violation rather than hiding it.
>>>
>>> My understanding is that the cast is required when converting an enum
>>> type to an integer type and vice versa. The idea is that we shouldn't do
>>> implicit conversions as they are error prone, only explicit conversions
>>> are allowed between enum and integers.
>>
>> We have a lot of places in Xen using implicit conversion from enum to
>> integer (for instance in the P2M code for p2m_type_t). Does ECLAIR
>> report all of them? If not, then why?
>>
> 
> Can you give some pointers as to where this enum is used in arithmetic 
> operations?

I can't think of any right now. But reply from Stefano suggested that it 
was necessary anytime we were using 'enum' as an '(unsigned) int'.

>  From a cursory glace I can see equality comparisons and
> as arguments to the array subscript operator, which are both compliant.

How about assigning an enum to an '(unsigned) int : X'? (where X is the 
number of bits.

Cheers,

-- 
Julien Grall

