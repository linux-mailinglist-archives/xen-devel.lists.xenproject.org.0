Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7D838DD2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670409.1043172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFFR-00052S-8y; Tue, 23 Jan 2024 11:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670409.1043172; Tue, 23 Jan 2024 11:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFFR-00050g-6F; Tue, 23 Jan 2024 11:47:21 +0000
Received: by outflank-mailman (input) for mailman id 670409;
 Tue, 23 Jan 2024 11:47:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rSFFP-00050a-NU
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:47:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSFFK-0005Z1-Uj; Tue, 23 Jan 2024 11:47:14 +0000
Received: from [15.248.3.94] (helo=[10.24.67.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSFFK-0006uS-Ln; Tue, 23 Jan 2024 11:47:14 +0000
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
	bh=Icpm85/cqww0Up29YWZATEFcwpEy3O2L3gB4f5rNPQQ=; b=n6CoEc+WTm9P6qD9gPWIwEK/gH
	Fy8wNZTpT3TLOWJewjMjpx1hWgaAEj5r7/mXypIWSUNJQ+A0jk5wqfY4S/mxHfqUpDM1XlvStO5/y
	BzLTMMo11XbsPXCq4bHtWgCHsGAGdHNnpfIDeRaT2lI9cZbwwy1K2VF3EsBcKoRh0h8I=;
Message-ID: <11258371-d386-4693-90b1-8ea29f07e17b@xen.org>
Date: Tue, 23 Jan 2024 11:47:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-10-carlo.nonato@minervasys.tech>
 <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
 <101c638c-03ee-471b-a6c8-9c2c10772001@suse.com>
 <CAG+AhRXctKrh8UcLsygA8aoiVkc8HaOqG-gNOwtmJyjebhDU2A@mail.gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRXctKrh8UcLsygA8aoiVkc8HaOqG-gNOwtmJyjebhDU2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 18/01/2024 14:27, Carlo Nonato wrote:
> On Tue, Jan 9, 2024 at 11:33 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 09.01.2024 11:28, Jan Beulich wrote:
>>> On 02.01.2024 10:51, Carlo Nonato wrote:
>>>> v5:
>>>> - Carlo Nonato as the new author
>>>> - the colored allocator balances color usage for each domain and it searches
>>>>    linearly only in the number of colors (FIXME removed)
>>>
>>> While this addresses earlier concerns, meanwhile NUMA work has also
>>> been progressing. What's the plan of interaction of coloring with it?
>>
>> Thinking of interactions - what about static memory? Is coloring incompatible
>> with that? If so, should the two features be excluded to both be used at the
>> same time?
> 
> This was done in one of the earlier revisions. Then it was dropped because
> we thought that it would have been better to have a binary that supported both
> static memory and coloring. The only checks are done at runtime.

I actually prefer the runtime checks if they are not too complicated. 
This would allow distro to ship a generic Xen where user can play with 
various (incompatible) configuration without any rebuild.

Cheers,

-- 
Julien Grall

