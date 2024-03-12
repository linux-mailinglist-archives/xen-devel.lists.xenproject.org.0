Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B70879215
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691743.1078019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzRn-0007S2-8n; Tue, 12 Mar 2024 10:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691743.1078019; Tue, 12 Mar 2024 10:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzRn-0007Or-6H; Tue, 12 Mar 2024 10:33:27 +0000
Received: by outflank-mailman (input) for mailman id 691743;
 Tue, 12 Mar 2024 10:33:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rjzRl-0007Ol-Bq
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:33:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rjzRk-0006oS-EM; Tue, 12 Mar 2024 10:33:24 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rjzRk-0007HE-62; Tue, 12 Mar 2024 10:33:24 +0000
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
	bh=TSZP2P9gugiylnBmvjJq7kv8toSoLDfvd0y2KYSe3yk=; b=B4cZVF1KhTQJ2I3VgXCJdqFu6T
	uMPIX59JPzRzGFRIKXevALBxfuKgjjxyI6Wb3f893sAxXM3SqSRMHFj1CjgPwrV3HEI/uYy0QTHjc
	xFBTxN2/kLmvX7Z3uM9aI7B/N3YdVZfrTsYMYNmm6XMu2jKlqfnVoUm36TTHthNn7q6Y=;
Message-ID: <cb41fa55-5c05-4156-87d8-1ef1c2bf5ce5@xen.org>
Date: Tue, 12 Mar 2024 10:33:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f7b82e17-8282-400b-a6c2-b74761bbd6ce@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7b82e17-8282-400b-a6c2-b74761bbd6ce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/03/2024 10:27, Jan Beulich wrote:
> There's no use of them anymore except in the definitions of the non-
> underscore-prefixed aliases.
> 
> On Arm convert the (renamed) inline function to a macro.
> 
> On x86 rename the inline functions, adjust the virt_to_maddr() #define,
> and purge the maddr_to_virt() one, thus eliminating a bogus cast which
> would have allowed the passing of a pointer type variable into
> maddr_to_virt() to go silently.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> v2: Avoid aliasing macro on Arm.

Interesting, I was expecting x86 to follow the same approach. I don't 
quite understand the benefit of the aliasing here but at the same time I 
don't maintain it. So for Arm (only):

Acked-by: Julien Grall <jgrall@amazon.com>

Also, Oleksii, when you send a patch for RISC-V, can you please avoid 
the aliasing on RISC-V? I understand we want to prefer static inline 
(and in general I would prefer them), but we also need to balance with 
avoiding aliasing when there are zero benefits.

Cheers,

-- 
Julien Grall

