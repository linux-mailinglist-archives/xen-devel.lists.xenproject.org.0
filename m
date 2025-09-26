Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85218BA2DA8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131200.1470380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23Cf-0002lr-KL; Fri, 26 Sep 2025 07:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131200.1470380; Fri, 26 Sep 2025 07:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23Cf-0002jo-He; Fri, 26 Sep 2025 07:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1131200;
 Fri, 26 Sep 2025 07:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ys6F=4F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1v23Cd-0002ji-7t
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:49:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4916ad17-9aad-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 09:49:09 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 509574EEBC4D;
 Fri, 26 Sep 2025 09:49:08 +0200 (CEST)
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
X-Inumbo-ID: 4916ad17-9aad-11f0-9809-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1758872948;
	b=hxFbrJg0HD1mrPZrjhJEMHtfhfDkKhaIP4pFSe8syEAicIOsWZEJUvbUPXAn+7nUraXB
	 JaC29VkOzt0h2NV6FWdN5NJRh+HdwOPxYky6nsCoTJCZ+XX3vvqODkfk8rr6NsOcjflqz
	 ls9s36ZmQZ6uUlns5PBtOoGSk7hTK4daNJxxQSuym/CWHaDAvBILvt0Xcbs68eTQe4UOR
	 4zm/FmNopRKooKo9nbP/J4PzoxXAin9nmFkgc5bKc5ES66X1ahRYnCkAlLIbrbr/nxp3I
	 +z8Z5mmgGoXwbTRrdwGSXKMW7P9fpcEUT7X36txafnWhlvNZ35y/e+KK0fNR+1R3WvGiy
	 95ofcW9xTWb3WXRbpHdEFwbA7lFinsju8D8i/DkjQP+itHCxvUjad4t8ItkRyZ1bneoP+
	 QLoC2ExL4YPfRBrAl1gJoLnhKMUKmpMr90LgRxZrzCtRDkn2WRtA4rwi/bqr23DLFrKEH
	 hMGeUQ7H8zfQZ/otN4+Ig6UAwgLRtoehjbR0WKTZvuURpbOkt0+u/Qa4AO6VP3i181hbc
	 lRzl6H8L2JOTNY+wB7ddHt+hfSYBx0yDHRC7iTezvN7DP83cMDaYglngAIQwfadxH+5OA
	 tm5UwmeInxQ1jvZWp+YeInUORXPOhNw3Ou25CTrOU/Q+WR2V/p8PSAFMlpyJ/ls=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1758872948;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=hOX7BXjqXFIc87ZFW5RPol29CzZmaqU6Ty3bcp9Rj24=;
	b=pG0eS/YCx5btoq7YWTFj8h7cDTnrFfyrb1XNBwuNUzrx4bVhbOLeYkSQfldUr/iD8VMy
	 0PTLWn930BfE1jGupF7wEqAX/f8Cto8CxA4J7hxha8vXO4jEwNLGQaMCxr3glScnp4Mpf
	 8kzDobdo1fdJdxa68dDTGxE4ljeqLQp6Va/YyFw2pmNcJbZ7cu3xpG95UK5EbPthtmdVx
	 Gh3/caTsFboDevKMCNPGoWNO3whDJuZrWVgdWLp8taazo7X4zfdVbylJT8+W9wjtxFHwI
	 zHNWH/1GdHvNVRbDetcBhawLgdx930RPmU7q2Q9AWKlJkAkZrarDKQ4woAffnz133gPON
	 etMWvSEUPaJlVbHb3VAUVbCI7kzR1OLWgL87sZz21zlhbMNhJxWTaPu1XAeogi5C4D06R
	 7nfvxTjbY//sE5DzcywVxdm3MCCZuwKBcxY8F+h0mas6j5hfLAd+/Zb0yHdAoxfiCdOy9
	 cauuI6nmKMqXmpHG47mqvz4k3nCkXU5bm2zPOeKQHfJifIv5hG6hdB5mveo2HhQvT1lIt
	 CTa8InMXFW3rB/Brp2EQbCmQy82hOm7wjeucVkkCL7L8QW+R/fur12KMtWCzZOr5/m3ds
	 J6YQUQazJ0NptmqJTjVGKcLDcKpQHIl2JzbSi/JvxljlhAxXJBrnkSnFC/5lFXc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1758872948; bh=LYEoNRNlkar+Ws+T5bjZtE0Pzl/yxLwBSaDqoyDFass=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L3yKAlcRPzx6iPXDze0pc1Gfh+5t195AhLvddOImUAg+sjqh6aiA/Xqrc84o7ERw0
	 1YXFvm+9M8gNlTuJ52yplKC5F7jvTPwWQcuzKQ37UNDe7jpevW/ozrqn95Du0Jxv+1
	 3yFc9SVn4CczAUwoyWKUXMlDwb7ls5Oa+6SFxMwoAf2h08kofK7hqxxWddg2iuY5L7
	 zKoI2ZMCBxzG90tVzr653yLUWHCgJqyu/0Fs7StxFyH8ETuuWdOeZxgUm3xnJHloss
	 owCBx9CwdiQcrC8GcTxP2/VZHS4/ZZNLprujNmPOy1nnlBLIp3H8fg8d/k0rdDfipL
	 i7a1aRpDBUU8A==
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 09:49:08 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein
 <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, Jan Beulich
 <jbeulich@suse.com>
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule 11.3
In-Reply-To: <278915c9-0049-4e25-90ab-9bb3da7ecee1@epam.com>
References: <859503540c6b7447f13365c2b70b386c2975edd0.1756056144.git.dmytro_prokopchuk1@epam.com>
 <21268b36-ca49-4628-835e-1708ad313946@suse.com>
 <278915c9-0049-4e25-90ab-9bb3da7ecee1@epam.com>
Message-ID: <c2d212972ec11d133defbae610981d82@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-25 21:11, Dmytro Prokopchuk1 wrote:
> On 8/25/25 13:23, Jan Beulich wrote:
>> On 24.08.2025 19:27, Dmytro Prokopchuk1 wrote:
>>> MISRA C Rule 11.3 states: "A cast shall not be performed between a 
>>> pointer
>>> to object type and a pointer to a different object type."
>>> 
>>> Violations of this rule arise due to the 'container_of()' macro, 
>>> which casts
>>> a member of a structure to its containing structure:
>>>      container_of(ptr, type, member) ({                             \
>>>             typeof_field(type, member) *__mptr = (ptr);             \
>>>             (type *)( (char *)__mptr - offsetof(type,member) );})
>>> 
>>> The 'container_of()' macro is safe because it relies on the 
>>> standardized and
>>> well-defined 'offsetof()' macro to calculate the memory address of 
>>> the
>>> containing structure, while assuming proper alignment and ensuring no
>>> undefined behavior, provided that the input pointer is valid and 
>>> points to
>>> the specified member.
>> 
>> I may have said so before: This all reads okay to me, just that I'm 
>> unsure
>> it would actually be convincing to an assessor. The "provided that 
>> ..." is
>> a pretty strong requirement, which isn't overly hard to get wrong. 
>> Stefano,
>> Nicola - what's your take here?
>> 
>> Jan
> 
> Stefano, Nicola,
> 
> gentle reminder.
> 
> Dmytro.

The fact that you can't guarantee that the pointer you receive is 
aligned was the main reason why I didn't already introduce such a 
deviation in the first place. Now, as Stefano pointed out unaligned 
accessed are largely ok on ARM and x86, with the exception on MMIO 
pointers (hard fault) and some niche cases in x86 which probably don't 
matter for Xen dealing with vectorized data types. So the crucial point 
(not just for this specific deviation) is ensuring that pointer are 
properly aligned when it matters, which in this case is the same as 
making sure that "ptr" indeed points to a struct member. What might be a 
convincing argument is to have sufficient testing and sanitizers (ASAN 
mostly helps here) to show that this assumption is met with some degree 
of confidence.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

