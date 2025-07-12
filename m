Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70DDB02A66
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 12:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041779.1412355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXKv-0004xe-M9; Sat, 12 Jul 2025 10:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041779.1412355; Sat, 12 Jul 2025 10:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXKv-0004uc-J4; Sat, 12 Jul 2025 10:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1041779;
 Sat, 12 Jul 2025 10:20:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXKu-0004hv-DM
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:20:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXKt-00Dmj5-2G;
 Sat, 12 Jul 2025 10:20:03 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXKt-000qi1-1g;
 Sat, 12 Jul 2025 10:20:03 +0000
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
	bh=gnLDOsSJVwhmnFyy6lVFIkKEsXynChBfEIaM3EPP97M=; b=EtovwYovrxayoziBqD3nQnJDDx
	43dAc8j99/6T53QF5WiDROK/RISXwTL4Z4znYuBS6Cs4r27o1pKOZBnUawCcmjuk5ttQkhUg6iuI0
	C6LyjauiGuquek9yGjuuEffbSM6jjaY7gsCI9iIpn8/xspDvlUM12PYt4+EM5EaarwUc=;
Message-ID: <d250c47c-5d24-49f9-bf99-fdfd0648d292@xen.org>
Date: Sat, 12 Jul 2025 11:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xvmalloc: extend to cover 2-dimensional arrays
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <af01370b-4482-49ff-ada7-3e02d3f31d1a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <af01370b-4482-49ff-ada7-3e02d3f31d1a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/07/2025 12:02, Jan Beulich wrote:
> Take care of the multiplication(s) involved in determining overall size
> in the macros themselves, saturating to ULONG_MAX. This way on 64-bit
> systems the subsequent check against UINT_MAX will fail, while on 32-
> bit systems allocations of this size simply cannot be fulfilled anyway
> (such an allocation would consume the entire address space).
> 
> The only place where we truly consume guest input (but constrained to
> hwdom) is cpufreq_statistic_init(). Play safe however and convert the
> other three instances where a multiplication is involved as well.
> 
> While touching those sites also switch to xv*alloc_array(), following
> what was settled upon when those were introduced. Don't bother extending
> x*alloc_array() the same way.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


