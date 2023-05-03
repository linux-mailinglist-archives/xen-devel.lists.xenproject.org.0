Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0CF6F56DF
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 13:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529118.823150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAId-00074c-EQ; Wed, 03 May 2023 11:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529118.823150; Wed, 03 May 2023 11:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAId-00072o-BX; Wed, 03 May 2023 11:05:31 +0000
Received: by outflank-mailman (input) for mailman id 529118;
 Wed, 03 May 2023 11:05:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puAIb-00072i-Hv
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 11:05:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puAIa-0008Mk-FX; Wed, 03 May 2023 11:05:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puAIa-0006zv-7A; Wed, 03 May 2023 11:05:28 +0000
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
	bh=AeUrmNI/HwRkNCXfF485hOEexMp7VO2G/kxR0JPvuwo=; b=F3LB9urI+oDNr9Oi8jc/hvixXc
	SF8yb67dGPIonAapg/89vE52Vay4aODK1HPI+LQZBk9weHdIPx9F3UGnFt7IlqgLsGktOVktzop96
	7yn+YuyxcjxWHF5jhCIIdpowGNVRoGihsR3/PaqZJtyvRvZ87J+WR4xK+JJ5yft2nuUs=;
Message-ID: <7e8a0e14-51d0-a8aa-1395-6e50a7f6eb94@xen.org>
Date: Wed, 3 May 2023 12:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/04/2023 10:20, Jan Beulich wrote:
> PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
> more than 32k pIRQ-s can be used by a domain on x86. Document this upper
> bound.
> 
> To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
> parameter type) and setup_system_domains(). This is primarily to avoid
> exposing the two static variables or introducing yet further arch hooks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
> used. That would make the connection to setup_system_domains() yet more
> weak, though.
> 
> On Arm the upper limit right now effectively is zero, albeit with -
> afaict - no impact if a higher value was used (and hence permitting up
> to the default of 32 is okay albeit useless). The question though is
> whether the command line option as a whole shouldn't be x86-only.

AFAIK, ->nr_pirq is not used at all on Arm because we don't have any 
concept of PIRQs.

So I think it would be fine to move the command line option to x86-only 
(assuming this will not be needed on RISC-V).

Cheers,

-- 
Julien Grall

