Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D3234405
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 12:19:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1S7h-0006IB-NT; Fri, 31 Jul 2020 10:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1S7f-0006I6-QE
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:18:43 +0000
X-Inumbo-ID: 357022b6-d317-11ea-8e22-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 357022b6-d317-11ea-8e22-bc764e2007e4;
 Fri, 31 Jul 2020 10:18:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7D68AF95;
 Fri, 31 Jul 2020 10:18:54 +0000 (UTC)
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
To: Julien Grall <julien@xen.org>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
 <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
 <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
 <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6066b507-f956-8e7a-89f3-b21428b66d65@suse.com>
Date: Fri, 31 Jul 2020 12:18:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 12:12, Julien Grall wrote:
> On 31/07/2020 07:39, Jan Beulich wrote:
>> We're fixing other issues without breaking the ABI. Where's the
>> problem of backporting the kernel side change (which I anticipate
>> to not be overly involved)?
> This means you can't take advantage of the runstage on existing Linux 
> without any modification.
> 
>> If the plan remains to be to make an ABI breaking change,
> 
> For a theoritical PoV, this is a ABI breakage. However, I fail to see 
> how the restrictions added would affect OSes at least on Arm.

"OSes" covering what? Just Linux?

> In particular, you can't change the VA -> PA on Arm without going 
> through an invalid mapping. So I wouldn't expect this to happen for the 
> runstate.
> 
> The only part that *may* be an issue is if the guest is registering the 
> runstate with an initially invalid VA. Although, I have yet to see that 
> in practice. Maybe you know?

I'm unaware of any such use, but this means close to nothing.

>>  then I
>> think this will need an explicit vote.
> 
> I was under the impression that the two Arm maintainers (Stefano and I) 
> already agreed with the approach here. Therefore, given the ABI breakage 
> is only affecting Arm, why would we need a vote?

The problem here is of conceptual nature: You're planning to
make the behavior of a common hypercall diverge between
architectures, and in a retroactive fashion. Imo that's nothing
we should do even for new hypercalls, if _at all_ avoidable. If
we allow this here, we'll have a precedent that people later
may (and based on my experience will, sooner or later) reference,
to get their own change justified.

Jan

