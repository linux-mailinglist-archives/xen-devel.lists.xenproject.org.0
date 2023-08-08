Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7B67738C3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579356.907300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHbW-00066u-Ff; Tue, 08 Aug 2023 07:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579356.907300; Tue, 08 Aug 2023 07:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHbW-00064E-BX; Tue, 08 Aug 2023 07:58:10 +0000
Received: by outflank-mailman (input) for mailman id 579356;
 Tue, 08 Aug 2023 07:58:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTHbV-000648-Cy
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:58:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTHbQ-0004oz-86; Tue, 08 Aug 2023 07:58:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTHbP-0004q8-Ru; Tue, 08 Aug 2023 07:58:03 +0000
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
	bh=MkAvYxPF5O5PUVW2zj0seh+ME1qdF6hK2yx1CWIRDgk=; b=w4CYa7kPMf5d2SRxA1WuczJS46
	eA+lBFNcl5NB9d349qJvKQ3PjIETCZPcGV0yLPrIv4UIh8/yaCQfiRSCWpvHbGKyjpizmKpRe73Ho
	EEaopvj0jQ67V0pz86WzLpjJXC3ToJdGXN4mHUr0bYjtlVlbGjYZhINqm+T/d0QXWQhw=;
Message-ID: <b9f1d337-023b-4555-8761-789abff52ca6@xen.org>
Date: Tue, 8 Aug 2023 08:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mm: Factor out the pdx compression logic in ma/va
 converters
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-3-alejandro.vallejo@cloud.com>
 <db533ea3-8b1f-fb36-a0b8-d196f3a84f33@suse.com>
 <64d11b39.050a0220.2ab40.c2cc@mx.google.com>
 <825bb94c-a427-62ff-a790-39c0792553d3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <825bb94c-a427-62ff-a790-39c0792553d3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/08/2023 07:05, Jan Beulich wrote:
> On 07.08.2023 18:26, Alejandro Vallejo wrote:
>> On Mon, Jul 31, 2023 at 05:15:19PM +0200, Jan Beulich wrote:
>>> Especially since the names of the helper functions are longish,
>>> I'm afraid I'm not fully convinced of the transformation.
>> In what sense? If it's just naming style I'm happy to consider other names,
>> but taking compression logic out of non-pdx code is essential to removing
>> compiling it out.
> 
> I understand that, but my dislike for long names of functions doing
> basic transformations remains. I'm afraid I have no good alternative
> suggestion, though, and while it's been a long time, this may also
> have been one reason why I didn't go with helpers back at the time.
> 
> Plus of course I remain unconvinced that compiling out really is the
> better option compared to patching out, as was done by my series.

I am with Alejandro here. The altpatching is more complex and would 
likely require arch specific code.

I don't exactly see the benefits of such approach given that are no 
known x86 platform where PDX might be useful. Even for Arm, I am not 
aware of a platform where PDX could be disabled. I agree this could 
change in the future, but this could be revisit if needed.

Cheers,

-- 
Julien Grall

