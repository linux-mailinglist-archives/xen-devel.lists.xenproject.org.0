Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7FA6C670
	for <lists+xen-devel@lfdr.de>; Sat, 22 Mar 2025 00:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924678.1327785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlsX-0002oi-6d; Fri, 21 Mar 2025 23:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924678.1327785; Fri, 21 Mar 2025 23:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlsX-0002mh-3r; Fri, 21 Mar 2025 23:34:17 +0000
Received: by outflank-mailman (input) for mailman id 924678;
 Fri, 21 Mar 2025 23:34:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvlsV-0002mb-5w
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 23:34:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvlsS-00HIAP-0w;
 Fri, 21 Mar 2025 23:34:12 +0000
Received: from [2a02:8012:3a1:0:d473:3eed:4e56:a8b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvlsR-00FN6c-2p;
 Fri, 21 Mar 2025 23:34:11 +0000
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
	bh=eeMEf3p/slSL7nc0B+FICe+pSUqyAIkq8B5EyRFziYc=; b=VFrjJaMeZ7tsTwocHKG5vgqZoL
	bwD/83xjIiPYQJQbsCyVZeJY7VEWUFX/WuUBUFO5uHm7iry0Il0SmQhC3XbSjCdEkFPvb+uhE8uLA
	WU+dyeSmHryKJBetRtinvP8Cv+aF2HMFvwMskDMRVNzGmU4VEr4R2nuIedFScgG4zIS0=;
Message-ID: <1a27885a-ec07-4716-8e62-9c4bb25ca1cb@xen.org>
Date: Fri, 21 Mar 2025 23:34:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2503211517130.2325679@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2503211517130.2325679@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/03/2025 22:32, Stefano Stabellini wrote:
> As discussed, please add a wrapper with an empty implementation in the
> regular case and the call to libafl_qemu_end when the fuzzer is enabled.
> So that here it becomes just something like:
> 
>    fuzzer_success();

I was thinking the same when reviewing the code. It would make the code 
a bit more readable. We would also want fuzzer_failure(). Both would 
need to be implemented in a common header.

Cheers,

-- 
Julien Grall


