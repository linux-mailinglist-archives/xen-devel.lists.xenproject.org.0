Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA3B1807D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067140.1432096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnTL-00070P-6u; Fri, 01 Aug 2025 10:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067140.1432096; Fri, 01 Aug 2025 10:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnTL-0006xf-40; Fri, 01 Aug 2025 10:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1067140;
 Fri, 01 Aug 2025 10:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9BkY=2N=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uhnTJ-0006xZ-Cy
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:58:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b506f5b-6ec6-11f0-b896-0df219b8e170;
 Fri, 01 Aug 2025 12:58:40 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id DC3C14EE3C02;
 Fri,  1 Aug 2025 12:58:38 +0200 (CEST)
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
X-Inumbo-ID: 7b506f5b-6ec6-11f0-b896-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754045919;
	b=ll4kwhdjSNCe6bybhotPTKvFBtb/tcyaQiSfiSuE6dWU3WsgIpI4gimSJGUYngaNi4dD
	 grgOIZnR968aaUQGTSt5/7PbhPpJEh9rojoTmSiEp9880Hk+OVx56YVecgtEZEQmZXy23
	 W1gxxNX4qhWDVV1l0hfUlUnLxKZjF1o5hjG9aiDc4NMMopcBXv0ctmZT7ZZNpfLK3J/7t
	 /nQILbm4+RMJdoDZ5tNyFSxjJD/JDronqsjK2Tg7mPuMdSumpamAR+DlIzpWgQVzPwMpy
	 L2fKMQ8JgbiZJXmC4G6eU3bdGAGeDdufORJ9LDPfj3ucx2y1j6kt8oXW+mtunYoP7n4n9
	 3sW+gwT+RuHTk2Sv8wMZ1KiytSYt+sUjaYcr5D1lQmpMYL+0/jt8X3nyUB9cXWcptahcL
	 6ZHNxZCbPAlW6u4WCqwXaRHYUmh6RkgE55qfSOX2KU3Wj4G2PjwEECRFOY+MnBaTm5Yit
	 ii0lBSMJjbCFPlH1E/bnRfiicCJF170zM8KLd2GFeOOqoKiL4wfP5dyU1eJbTbVLCPssk
	 S/DG8cDmJr7rhh3fn83VxUnYujE0xcHIkjayqKr6pqSZzf6afjU483o5mR4NkppnIKnDm
	 advmIgsNVXTfq7KVnDQqY0ME6ShM2sIOG13zaffPmatB5tbQuA0TpNKl3gyFVo8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754045919;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=l9zcpOkubj5IU7vpaTeU1fz2oeyMx4q6+I0OukzjbtU=;
	b=boU6akOiD27uUM/26UfM7GQbjcJFhX5swxNrxiAbp/8zeqCBcdvuz7ig0Blpt/jTVQes
	 6EUi+Kx0wOkGUPrV/rjQQuOnwqo2zhOCDUyH1kvcewoBqekjiZhNWzslFvL532JNG4VaQ
	 fvtnO4w8WHUpjW+pjGs8YHYXY2xDukPtEk8L0oXqIXPqLjEF5bKc9jwDNW2up1wBKhpzw
	 d9Gfor5s4zOWwgs0Fw/93uYZxk/1LVtVhkzrHO673aDWZt8H9gZ/tUnDpbVIjpHOlZ4GE
	 iST+GCOGHhHaa8zwrUzWuAutLFt0AUb4Ma7Tm5Lvd3h5CZpTLWy72VTaKRzkKG/ssnT/I
	 DC0h2X5lnzI/yd53F8EszRY6Ehb5qU5KoOOupFoQgAnUfrxoyTh57rQZTtKyNJZhowv13
	 gJIzLLfXfXSCzjZrXFJuJDvEGIJsmN8iDE/7XAxsbM3B3NjwvKq8pabyTEbP4n3+FeWcG
	 ls4SESQ55zbJgSlEWznHKghqQQMJvisH380mhJTYTIMSVVLi03qOHZsImRNfqLA2K9M4X
	 votkvruasNVDIaYLyt7ZNNSvrPc9by4Kw6oel1sIksM5KyhfzVnOiv0zxuO7F0AbZyI1Q
	 r2rWedQtzZsYADbTDlQ2+30+uzsghOaju6qchi+jHYdf8mHa7PyCLXL28AGQmQA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754045919; bh=1NgS/HPFX/e6Pq8rJJ74P0lYqDY2Vje7bDk7P3Eb7LY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rfXZF9qhunYVsgapGlwRLCXY70YEsUZ6DveYLshT/QfL+vBRvNaThaJSzj8QcNZSj
	 cVkAMXk0UW1l9DrPIUcXtk9y+tLWsb4nnhkHtKiOe6V1LZ27yphWOMSUXvla5r7ozz
	 EvhNAWmYOZ6YUiTyWJZQcXdteBGyx0ezAJpoJH1zhQT/vjMmleaIZbB3miWjpoGsN1
	 MQSWpNGvevNg1DNiOyYg7WNcz+DgTfqw1ngpFh+26HYVsIdRGjqt8CdYWk/4AjZz9n
	 uTW1NBuEFAoHNEBH0PYpp/s7zWYKCtRvsRYkNAd6UmaHagKkZdBw7asyIIDctNl9on
	 QCq/Cj3hRfDMw==
MIME-Version: 1.0
Date: Fri, 01 Aug 2025 12:58:38 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] misra: allow discarding 'noreturn' during conversions
In-Reply-To: <4475f575-91df-4f9d-ad05-41a4864baa11@suse.com>
References: <c68de6862ee6d3d6f33eee4db278096c833c17e0.1754043159.git.dmytro_prokopchuk1@epam.com>
 <4475f575-91df-4f9d-ad05-41a4864baa11@suse.com>
Message-ID: <ab80c9d2e8840a6e84d58596064816cb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-01 12:53, Jan Beulich wrote:
> On 01.08.2025 12:48, Dmytro Prokopchuk1 wrote:
>> The conversion from a function pointer with the 'noreturn' attribute
>> ('void noreturn (*)(...)') to a function pointer type ('void (*)(...)'
>> causes type incompatibility according to MISRA C Rule 11.1, which
>> forbids conversions between incompatible function pointer types.
> 
> This wider deviation ...
> 
>> The violation occurs at the call site:
>>     smp_call_function(halt_this_cpu, NULL, 0);
>> where 'halt_this_cpu' with type 'void noreturn (*)(void *)' is passed 
>> to
>> 'smp_call_function' expecting function pointer of type 'void (*)(void 
>> *)'.
>> 
>> The 'noreturn' attribute does not change the function calling 
>> convention
>> or parameter handling at runtime, making the conversion safe.
>> 
>> Configure ECLAIR to treat implicit conversions that lose the 
>> "noreturn"
>> attribute on a function 'void (*)(void*)' as safe.
> 
> ... wants connecting to this more narrow Eclair configuration. That's 
> what
> I meant when I said "description also suitably adjusted". For example, 
> the
> last sentence above could start "For now, configure Eclair to just 
> treat
> ...". Can adjust when committing, assuming an ack for the .ecl change
> appears.
> 
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com> # docs

Feels weird to review my own ecl honestly, but for the sake of the patch 
I verified that it is indeed what I wrote, so

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # ECLAIR

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

