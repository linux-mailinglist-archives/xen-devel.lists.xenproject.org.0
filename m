Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45C8A85C5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707535.1105548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx665-000894-Kf; Wed, 17 Apr 2024 14:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707535.1105548; Wed, 17 Apr 2024 14:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx665-00086N-Gr; Wed, 17 Apr 2024 14:17:13 +0000
Received: by outflank-mailman (input) for mailman id 707535;
 Wed, 17 Apr 2024 14:17:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rx664-00086H-0s
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:17:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx663-00076U-HM; Wed, 17 Apr 2024 14:17:11 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx663-0004LV-6E; Wed, 17 Apr 2024 14:17:11 +0000
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
	bh=grbIUBdSBOanmXVHc2LplTUD5Aypguwz/TBe2daZ23Y=; b=Gemhmon5+LdQ+iaRw8mSNekQm2
	Nv4BAuRaJSDDYQrUYYqSLek95Q8y19dmQ1fMrqo9kDniJQkNYkRQ6s//U9oWG94u2cguVjkA0GAiE
	DMAXfmskS+39IeIDxpGuOk1tdgIKzLN+T0Av4fbAr00AZZP+jOeEwrj9iw1j75gDmgJg=;
Message-ID: <be95f6be-0404-4c43-926f-d011782a02db@xen.org>
Date: Wed, 17 Apr 2024 15:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240417121442.56178-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240417121442.56178-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 17/04/2024 13:14, Michal Orzel wrote:
> Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
> in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
> for it. This results in a build failure. Example on Arm:
> 
> ./include/public/arch-arm.h:205:41: error: unknown type name ‘__guest_handle_64_int32_t’
>    205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
>        |                                         ^~~~~~~~~~~~~~~~~~
> ./include/public/arch-arm.h:206:41: note: in expansion of macro ‘__XEN_GUEST_HANDLE’
>    206 | #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>        |                                         ^~~~~~~~~~~~~~~~~~
> ./include/public/memory.h:277:5: note: in expansion of macro ‘XEN_GUEST_HANDLE’
>    277 |     XEN_GUEST_HANDLE(int32_t) errs;
> 
> Fix it. Also, drop guest handle definition for int given no further use.
> 
> Fixes: afab29d0882f ("public: s/int/int32_t")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

So it turned out that I committed v1 from Stefano. I was meant to commit 
the patch at all, but I think I started with a dirty staging :(. Sorry 
for that.

I have reverted Stefano's commit for now so we can take the correct patch.

Now, from my understanding, Andrew suggested on Matrix that this 
solution may actually be a good way to handle GUEST_HANLDEs (they were 
removed in v2). Maybe this can be folded in Stefano's patch?

Cheers,

-- 
Julien Grall

