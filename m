Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B23932143
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759377.1169081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcgv-0006cj-Vg; Tue, 16 Jul 2024 07:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759377.1169081; Tue, 16 Jul 2024 07:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcgv-0006bF-T1; Tue, 16 Jul 2024 07:33:41 +0000
Received: by outflank-mailman (input) for mailman id 759377;
 Tue, 16 Jul 2024 07:33:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sTcgu-0006b9-Sf
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:33:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTcgs-0007bp-82; Tue, 16 Jul 2024 07:33:38 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTcgs-0002ZR-2E; Tue, 16 Jul 2024 07:33:38 +0000
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
	bh=6hQU9e18PqrTwj1AA1G35dUFtakyigUI+zTQruBZn5A=; b=ugU6kWZUweH5SLzKnZnxtNh1+U
	ns3kIuuPsDwCntm23Nb2tJ66TOuLC6gLciJBUgLE4YVsxSnUlsmBz1TvRklkTjifKWAgIFrq5opif
	IT8yXmtKnox2loIP89obKy/ZKvuhdZ0juCnyKKeTJpeNVDEYq24fbuh02bAXWcj9C+A4=;
Message-ID: <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
Date: Tue, 16 Jul 2024 08:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
 <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/07/2024 08:24, Jan Beulich wrote:
> On 16.07.2024 09:22, Julien Grall wrote:
>> On 16/07/2024 07:47, Jan Beulich wrote:
>>> On 15.07.2024 18:56, Julien Grall wrote:
>>>> On 15/07/2024 16:50, Andrew Cooper wrote:
>>>>> An earlier part of the checklist states:
>>>>>
>>>>>      * change xen-unstable README. The banner (generated using figlet) should say:
>>>>>          - "Xen 4.5" in releases and on stable branches
>>>>>          - "Xen 4.5-unstable" on unstable
>>>>>          - "Xen 4.5-rc" for release candidate
>>>>>
>>>>> Update the notes about XEN_EXTRAVERSION to match.
> 
> When this is the purpose of the patch, ...
> 
>>>> We have been tagging the tree with 4.5.0-rcX. So I think it would be
>>>> better to update the wording so we use a consistent naming.
>>>
>>> I find:
>>>
>>> 4.18-rc
>>> 4.17-rc
>>> 4.16-rc
>>> 4.15-rc
>>
>> Hmmm... I don't think we are looking at the same thing. I was
>> specifically looking at the tag and *not* XEN_EXTRAVERSION.
> 
> ... why would we be looking at tags?

As I wrote, consistency across the naming scheme we use.

> The tags (necessarily) have RC numbers,

Right but they also *have* the .0.

> so are going to be different from XEN_EXTRAVERSION in any event.

Sure they are not going to be 100% the same. However, they could have 
some similarity.

As I pointed out multiple times now, to me it is odd we are tagging the 
tree with 4.19.0-rcX, but we use 4.19-rc.

Furthermore, if you look at the history of the document. It is quite 
clear that the goal was consistency (the commit mentioned by Andrew 
happened after). Yes it wasn't respected but I can't tell exactly why.

So as we try to correct the documentation, I think we should also look 
at consistency. If you *really* want to drop the .0, then I think it 
should happen for the tag as well (again for consistency).

Cheers,

-- 
Julien Grall

