Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE718D363D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731843.1137579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIJ1-0003Kj-49; Wed, 29 May 2024 12:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731843.1137579; Wed, 29 May 2024 12:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIJ1-0003IE-1b; Wed, 29 May 2024 12:21:23 +0000
Received: by outflank-mailman (input) for mailman id 731843;
 Wed, 29 May 2024 12:21:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCIIz-0003I8-Cu
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:21:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCIIr-0006HU-BV; Wed, 29 May 2024 12:21:13 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCIIr-0001Zw-3M; Wed, 29 May 2024 12:21:13 +0000
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
	bh=fa+qKvA3WLWsfIvafx9t6tO6vymn5iXMkbx+AH/aoAM=; b=tb0il0hI86CTPNlMEJXbVBC0ud
	4uPPeA/BPr3B8REYExKoqE6tiqV73h15TO+WeutjF4BUxZoPTuzICvaT/G6ITdYBTvNaW0LYerofo
	TAS8lm50hecvXMbvJeLzCmzCoAU0UJt/pMuWasiQouLz1GedH/2T+GBxah/cERGNVN7w=;
Message-ID: <ff1139a3-4f69-46d4-8f0c-c3aae778be3d@xen.org>
Date: Wed, 29 May 2024 13:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 0/3] xen/x86: support foreign mappings for
 HVM/PVH
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Community Manager <community.manager@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <0c4a9a00-b8de-4472-afb4-0a8d70c7aada@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0c4a9a00-b8de-4472-afb4-0a8d70c7aada@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/05/2024 08:24, Jan Beulich wrote:
> On 17.05.2024 15:33, Roger Pau Monne wrote:
>> Hello,
>>
>> The following series attempts to solve a shortcoming of HVM/PVH guests
>> with the lack of support for foreign mappings.  Such lack of support
>> prevents using PVH based guests as stubdomains for example.
>>
>> Add support in a way similar to how it's done on Arm, by iterating over
>> the p2m based on the maximum gfn.
>>
>> Patch 2 is not strictly needed.  Moving the enablement of altp2m from an
>> HVM param to a create domctl flag avoids any possible race with the HVM
>> param changing after it's been evaluated.  Note the param can only be
>> set by the control domain, and libxl currently sets it at domain
>> create.  Also altp2m enablement is different from activation, as
>> activation does happen during runtime of the domain.
>>
>> Thanks, Roger.
>>
>> Roger Pau Monne (3):
>>    xen/x86: account number of foreign mappings in the p2m
>>    xen/x86: enable altp2m at create domain domctl
>>    xen/x86: remove foreign mappings from the p2m on teardown
> 
> Here, too, I'd like to ask whether to keep this as a candidate for 4.19, or
> whether to postpone. Afaict what's still missing are Arm and tool chain acks
> on patch 2.

Stefano already provided an Ack [1], so the Arm part is now covered.

I am also guessing you meant "tools change" rather than "tool chain". 
Anthony is away at the moment. But this was reviewed by Juergen.

Oleksii also release-ack the series, so I think it would be fine to 
merge it.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/8e9a563f1e0f45883502bc47c4942081a5d66e1a.camel@gmail.com/T/#mdcb3e89046f817bd1b98190baa2b6d6b04e1ec05

> 
> Jan
> 
>>   CHANGELOG.md                        |  1 +
>>   tools/libs/light/libxl_create.c     | 23 +++++++++-
>>   tools/libs/light/libxl_x86.c        | 26 +++++------
>>   tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
>>   xen/arch/arm/domain.c               |  6 +++
>>   xen/arch/x86/domain.c               | 28 ++++++++++++
>>   xen/arch/x86/hvm/hvm.c              | 23 +++++++++-
>>   xen/arch/x86/include/asm/p2m.h      | 32 +++++++++-----
>>   xen/arch/x86/mm/p2m-basic.c         | 18 ++++++++
>>   xen/arch/x86/mm/p2m.c               | 68 +++++++++++++++++++++++++++--
>>   xen/include/public/domctl.h         | 20 ++++++++-
>>   xen/include/public/hvm/params.h     |  9 +---
>>   12 files changed, 215 insertions(+), 41 deletions(-)
>>
> 

-- 
Julien Grall

