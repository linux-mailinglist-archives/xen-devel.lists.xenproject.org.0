Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DD84EAA6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678489.1055842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC4V-0006zO-VS; Thu, 08 Feb 2024 21:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678489.1055842; Thu, 08 Feb 2024 21:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC4V-0006wi-Sf; Thu, 08 Feb 2024 21:36:39 +0000
Received: by outflank-mailman (input) for mailman id 678489;
 Thu, 08 Feb 2024 21:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYC4U-0006wa-Dy
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 21:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYC4T-00082C-D1; Thu, 08 Feb 2024 21:36:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYC4T-0003zo-3w; Thu, 08 Feb 2024 21:36:37 +0000
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
	bh=JsFidKjUcQAhbrMELN81Rxg6LTUTc51hbT9cqv8W31k=; b=2oB/P3RFCV6VYfSjlfALc3Luqb
	W00S/1BhR/Di8cAhpoaixaCrkWaxpGuZOV0XGgwsSG/v7c1wEYfpI/p1Jk9sXsg8COe75uIR6GVWJ
	uF/DHLv0SB2ejggl1BsaQiQOD9d605sIMDdVNCsZZ25x1kvR9V1RIR0HjwabBPFL0lvE=;
Message-ID: <6d1b1ec4-0502-42f3-a30f-2633ae14c553@xen.org>
Date: Thu, 8 Feb 2024 21:36:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <f20d2cef-4435-4b9a-9ad8-61ceddb6bcba@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f20d2cef-4435-4b9a-9ad8-61ceddb6bcba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/02/2024 13:32, Jan Beulich wrote:
> The type not being used in do_bug_frame() is suspicious. Apparently
> that's solely because the type uses a pointer-to-const parameter,
> when so far run_in_exception_handler() wanted functions taking pointer-
> to-non-const. Expand use of const, in turn requiring common code's
> do_bug_frame() as well as [gs]et_irq_regs() to also gain const. This
> then brings the former function also closer to the common one, with
> Arm's use of vaddr_t remaining as a difference.
> 
> While there also replace the bogus use of hard tabs in [gs]et_irq_regs()
> (I clearly didn't mean to put it in like this).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the Arm parts:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

