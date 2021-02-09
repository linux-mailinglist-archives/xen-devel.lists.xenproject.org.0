Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F73314A93
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 09:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83170.154183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Odf-0000mV-W2; Tue, 09 Feb 2021 08:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83170.154183; Tue, 09 Feb 2021 08:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Odf-0000m6-SR; Tue, 09 Feb 2021 08:44:51 +0000
Received: by outflank-mailman (input) for mailman id 83170;
 Tue, 09 Feb 2021 08:44:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9Odd-0000lz-Rr
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 08:44:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9OdY-0002VG-GH; Tue, 09 Feb 2021 08:44:44 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9OdY-0007mi-8L; Tue, 09 Feb 2021 08:44:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JHNad0cRbgJiiXXvQqnBjdntDM++m4DLcJwaUrDqeoA=; b=daLdFN31GiQsQjcwAk/NpDECqe
	IvYsyjY4A70wepeE7/Qp3GjC1u8B8BYCNSw3nvhe4jkEuGtYpAQ9IFmEXq0BjyEA3kuN7xHAyBENI
	0Is4EK2M3x+YJ6ZK7LKK82KiV+jF+lcZ8eOmsGQ34S9XcQ09Cp+M4R2ToqqBJ3DCiDpg=;
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: lucmiccio@gmail.com, xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
 <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3uhiFKE6gepaPvWZxqRErCyLiv2CTDSx3Sihef7CaMtQ@mail.gmail.com>
 <alpine.DEB.2.21.2102081556480.8948@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <c1fa0c41-07f5-eef3-254d-c5285a672f97@xen.org>
Date: Tue, 9 Feb 2021 08:44:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102081556480.8948@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/02/2021 01:57, Stefano Stabellini wrote:
> On Mon, 8 Feb 2021, Julien Grall wrote:
>> On Mon, 8 Feb 2021 at 20:24, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> @Ian, I think this wants to go in 4.15. Without it, Xen may receive an IOMMU
>>>> fault for DMA transaction using granted page.
>>>>
>>>>> Backport: 4.12+
>>>>>
>>>>> ---
>>>>>
>>>>> Given the severity of the bug, I would like to request this patch to be
>>>>> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
>>>>> 2020.
>>>>
>>>> I would agree that the bug is bad, but it is not clear to me why this would be
>>>> warrant for an exception for backporting. Can you outline what's the worse
>>>> that can happen?
>>>>
>>>> Correct me if I am wrong, if one can hit this error, then it should be pretty
>>>> reliable. Therefore, anyone wanted to use 4.12 in production should have seen
>>>> if the error on there setup by now (4.12 has been out for nearly two years).
>>>> If not, then they are most likely not affected.
>>>>
>>>> Any new users of Xen should use the latest stable rather than starting with an
>>>> old version.
>>>
>>> Yes, the bug reproduces reliably but it takes more than a smoke test to
>>> find it. That's why it wasn't found by OSSTest and also our internal
>>> CI-loop at Xilinx.
>>
>> Ok. So a user should be able to catch it during testing, is that correct?
> 
> Yes, probably. The failure is that PV drivers do not work (they trigger
> the IOMMU fault), specifically PV network and block, maybe others too.
> 
> I think it is unlikely but possible that an hardware update would also
> trigger the bug. For instance, a change of the network card might
> trigger the bug, if the previous network card driver was always bouncing
> requests on bounce buffers, while the new drivers uses the provided
> memory pages directly. I don't know how realistic this scenario is.
> 
> 
>>> Users can be very slow at upgrading, so I am worried that 4.12 might still
>>> be picked by somebody, especially given that it is still security
>>> supported for a while.
>>
>> Don't tell me about upgrading Xen... ;) But I am a bit confused, are
>> you worried about existing users or new users?
> 
> I am mostly worried about people that start using 4.12.

I think it would be a big mistake for anyone to start using 4.12 now. I 
can already cite a few bugs (including in the SMMU driver) that haven't 
been backport to 4.12 . This is only going to be worse as it is not 
stable anymore.

It is also not clear why someone would decide to use 4.12 when 4.13/4.14 
are still supported and will also come with an extra 1 year and half 
security support.

> 
> If a user was already on 4.12 and not seeing any errors, they are
> unlikely to see this error. It would only happen if:
> - they didn't use PV drivers before, and they want to start using PV
>    drivers now
> - they are upgrading hardware (not sure how likely to happen, see above)

Right, if you decide to switch device or upgrade HW, then you may also 
face other issues either in Xen or Linux.

Once a tree is out of support, we make no promise that it will work on 
new setup (including dom0 software). We only promise that it will 
continue to work on existing setup and we will address security issue.

>>> - is the submitter willing to provide the backport?
>>> - is the backport low-risk?
>>> - is the underlying bug important?
>>
>> You wrote multiple times that this is serious but it is still not
>> clear what's the worse that can happen...
> 
> PV drivers don't work: each data transfer involving granted pages causes
> an IOMMU fault.
Based on all the information you provided, this is not a fix I would 
recommend to backport to 4.12 because it is only impacting new/upgraded 
system (software or HW).

Cheers,

-- 
Julien Grall

