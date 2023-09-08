Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F88779899E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 17:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598030.932521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qed76-0002gH-9X; Fri, 08 Sep 2023 15:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598030.932521; Fri, 08 Sep 2023 15:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qed76-0002dS-6t; Fri, 08 Sep 2023 15:09:40 +0000
Received: by outflank-mailman (input) for mailman id 598030;
 Fri, 08 Sep 2023 15:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCyG=EY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qed74-0002dE-GU
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 15:09:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9fddf6f-4e59-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 17:09:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2B1484EE0738;
 Fri,  8 Sep 2023 17:09:37 +0200 (CEST)
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
X-Inumbo-ID: b9fddf6f-4e59-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 17:09:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
In-Reply-To: <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
 <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <98406cf53192652013d35ee8856df5c0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2023 16:53, Nicola Vetrini wrote:
> On 08/09/2023 13:59, Jan Beulich wrote:
>> On 08.09.2023 13:57, Jan Beulich wrote:
>>> On 08.09.2023 10:48, Nicola Vetrini wrote:
>>>> There is a build error due to -Werror because of a pointer 
>>>> comparison at
>>>> line 469 of common/numa.c:
>>>> i = min(PADDR_BITS, BITS_PER_LONG - 1);
>>>> where
>>>> #define PADDR_BITS              52
>>>> 
>>>> I guess PADDR_BITS can become unsigned or gain a cast
>>> 
>>> While generally converting constants to unsigned comes with a certain
>>> risk, I think for this (and its siblings) this ought to be okay. As 
>>> to
>>> the alternative of a cast - before considering that, please consider
>>> e.g. adding 0u (as we do elsewhere in the code base to deal with such
>>> cases).
>> 
>> And just after sending I realized that this would still be disliked by
>> Misra's type system. (Much like then aiui the 1 above will need to
>> become 1u. Which is all pretty horrible.)
>> 
>> Jan
> 
> I have a proposal: in our tests we enabled an ECLAIR configuration
> that allows to bypass the
> constraint imposed by Rule 10.4 that warrants the 1U iff the value is
> constant and both types
> can represent it correctly (in this case BITS_PER_LONG -1). This would
> allow using the proposed
> solution and documenting why it's ok not to respect R10.4. What do you 
> think?

And perhaps also use min_t instead of min, so that the typecheck can be 
avoided.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

