Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2985B16CD1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 09:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064937.1430241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNt9-00078s-Qn; Thu, 31 Jul 2025 07:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064937.1430241; Thu, 31 Jul 2025 07:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNt9-00076u-NF; Thu, 31 Jul 2025 07:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1064937;
 Thu, 31 Jul 2025 07:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYFp=2M=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uhNt7-00076l-4x
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 07:39:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817d878a-6de1-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 09:39:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6622A4EE3C02;
 Thu, 31 Jul 2025 09:39:34 +0200 (CEST)
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
X-Inumbo-ID: 817d878a-6de1-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753947574;
	b=GA1+COm9/OgmcVjF1ur6k/iLXsS1eWBoS3UffoEniungSamJZ2N76oeo4x6K4IA8VpcN
	 G8sDaCCUXjYDsrPQnAXrNLM+kupsPtWhvHXU+ZmQEtuWSRVeb/j5qvRnk0/+CteWHvS/t
	 +pf7FK/cajZ2/On+SD8P4X+9G9R3MfuOPLf9TwFDsI4Ng9iPq+pZkFp+EVShr1GNhNJzS
	 XVh5u7kB4lpcwgt/OVyyCWPF52h4eztIsPsRrWKQBj0RVobJL9zXD1z9L4IyF7Sn1SfPC
	 e0Sgc/ZMbvQ9lLOv+HbbEjepSOfVIY11ThGXVviuvO+CwD3zhqiPlFziJGcr8zEJcOQM8
	 MNnMToQGHr2OpIuaRxc30k4thks8MBnVT96bf3i4kAZyXK3TpEA7jG3oQuCMWelvev0Bf
	 Y+39jVXDuipMh+iFkdqBsm8wBo/UtnHYOphaX6BiU7U9N3KmLHWWQ/IgRbTKkT0YGyg9E
	 lOvcQ/TLqOGgDyUV6Aal79/uPYiC4yMp3AXV6mriIW+rlB+d+0xJFO27to/a5OJ9VWBlg
	 Vz0FjijdHbbytJHpSFaGA8iTqzCB9DhXmCZ+eYh/zbrVD2oyn7rG9bZSYAQdHpMrHqkx6
	 VKEok14+3BqArBB35dN+8KgSf/t861GO1zSxlew7FJSlJA+4UrU7cphcG6tkQdU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753947574;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=vIPr3qMiey4PqbLh1d3XXQP2tuTtegO/vWfI/tNTi8g=;
	b=svdkDXwwstratBoLljX42F46Cn9aAQkH6D/FwiJBR3QTfobe4Xneq2eFVAFOBMRBYWbe
	 CuNzvQ+g4/I8djj+2T7ivY8a7t5Ueqt90usAVDzgWMZgt2c6cKltW6unCX5S9ZrkpK75w
	 Db3wzrcPhwt7WEEnWG0Pz3Zx5aHXoY7rfhtQ0+TZM2Vw1YJapyz33NhjHbU1ifCYtTYn0
	 DvHOLMx5/jHUzwHXZje6bT4pSTNF3SKdxINiUlEiOUwpJxdXVoJz3r9QVjMR2PyGT9XCw
	 rHBL29Rs5ebbOODbJQPoFTriqo7AJ5fpjGwldRP2QispT2b5f9PY6hzkuGuGX9kpQFWsK
	 GzPuVMYeqENSOqUBGkpoTERctg3IS5v6h/yMk7VjOfo08ulRz47QUVn0TorDOLkxqqF64
	 WlIJGBfkqQUqM6eu71kMsVGpI6bkYVCBQPzvAQcNyUednWKpRXYgEg19pUq0qWfUQROJI
	 8uUBEdZJlX2pvsCdkYU+HiN5jlPyURD0bKCF348IeROgaRQq2pBFe1c51qrLzKDqkY9MK
	 +fTguQ6Iiyf4H9DRyvpBXOKsXAhPtShgQt/KGDlCKt5y0b5LTpdMFVFvJZBpxDiSn9M3q
	 Y9fSLyTGoaEVbNFwL049vn6VAbQnMjK2+ApKarj1XOwFhaaifTyIu3KnIE7qT2o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753947574; bh=oVsqTYiXPa4ewJzzr13nyGlPNIW7Hvaij+6+g+uCCq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nrVq7Ja3SeLUV/rq/4LW1rP9ZXFWWjcgbLR/Lg5gu8nfXAQLt1rT9bK32+/mfF7Lv
	 qBr/11YeWVAVJ0uBWtOEjWe871B4aqjGOKDZbKuyuNotY11f744opHfDjU6hO7Us6V
	 jQTlJzVDJUjJTR45xUbAcQ2TYvinIbYfeQyKHeM9cM+T3zSRUpSEWFcOwwdaqaz85k
	 thP7cd6vOxHp3DN+GAQksn6EO8H9m2dL46ovVqgrzeKjxQW+qCpZBxllc/Hn3uI62A
	 DalE5ko4sONaAl58jse19wdXeLqPNYi8yjw6JyxOsJm8oYEnIkyrNHUj4IQxx0mzUu
	 pIqNanMf5oubw==
MIME-Version: 1.0
Date: Thu, 31 Jul 2025 09:39:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] misra: add deviations of MISRA C Rule 5.5
In-Reply-To: <2be39e0f-25c6-4fe0-8b80-71c020dd3b0e@suse.com>
References: <e681e0c083d945f48e6d0add1aee32af16be224e.1753911247.git.dmytro_prokopchuk1@epam.com>
 <2be39e0f-25c6-4fe0-8b80-71c020dd3b0e@suse.com>
Message-ID: <06961e6bd6b5bed128050b8fae50982e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-31 09:15, Jan Beulich wrote:
> On 30.07.2025 23:39, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 5.5 states that: "Identifiers shall
>> be distinct from macro names".
>> 
>> Update ECLAIR configuration to deviate clashes:
>> specify the macros that should be ignored.
>> Update deviations.rst and rules.rst accordingly.
>> 
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Nit (along the lines of my comments on the other patch): Make better 
> use of line
> capacity here.
> 
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -117,6 +117,16 @@ it defines would (in the common case) be already 
>> defined. Peer reviewed by the c
>>  -config=MC3A2.R5.5,reports+={deliberate, 
>> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>>  -doc_end
>> 
>> +-doc_begin="Clashes between bitops function and macro names are 
>> deliberate.
>> +These macros are needed for input validation and error handling."
>> +-config=MC3A2.R5.5,ignored_macros+="name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit||set_bit||clear_bit||change_bit||test_and_set_bit||test_and_clear_bit||test_and_change_bit)"
>> +-doc_end
> 
> I have no idea whether regular expressions could be used here. If so, 
> shortening
> this at least some may be desirable.
> 

It's possible, without using name(_):  e.g., 
ignored_macros+="^(__)?test_and_(set|clear|change)?_bit$

>> +-doc_begin="Clashes between grant table functions and macros names 
>> are deliberate.
>> +These macros address differences in argument count during 
>> compile-time, effectively discarding unused parameters to avoid 
>> warnings or errors related to them."
>> +-config=MC3A2.R5.5,ignored_macros+="name(update_gnttab_par||parse_gnttab_limit)"
>> +-doc_end
> 
> No restriction to common/grant_table.c?
> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -142,6 +142,28 @@ Deviations related to MISRA C:2012 Rules:
>>         memmove.
>>       - Tagged as `deliberate` for ECLAIR.
>> 
>> +   * - R5.5
>> +     - Clashes between bitops ('__test_and_set_bit', 
>> '__test_and_clear_bit',
>> +       '__test_and_change_bit', 'test_bit', 'set_bit', 'clear_bit', 
>> 'change_bit',
>> +       'test_and_set_bit', 'test_and_clear_bit', 
>> 'test_and_change_bit')
>> +       functions and macros names are deliberate and are needed for 
>> input
> 
> Nit: "macro names"
> 
>> +       validation and error handling, ensures that the size of the 
>> object being
> 
> s/ensures/to ensure/ ?
> 
>> +       pointed to by 'addr' meets the minimum requirements for the 
>> bit operation,
> 
> 'addr' is pretty meaningless here.
> 
>> +       preventing unsafe operations on improperly sized data types 
>> that could
>> +       lead to undefined behavior or memory corruption.
>> +       The macros encapsulate this conditional logic into a single, 
>> reusable form;
>> +       which simplifies the code, avoids redundant function call.
> 
> What's "redundant" referring to here?
> 
>> +       Also this bitops API was inherited from Linux and should be 
>> kept for familiarity.
> 
> At least this line is clearly beyond 80 chars.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

