Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E44B55852
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 23:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122582.1466181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBF0-0004fv-RR; Fri, 12 Sep 2025 21:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122582.1466181; Fri, 12 Sep 2025 21:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBF0-0004cz-OB; Fri, 12 Sep 2025 21:23:34 +0000
Received: by outflank-mailman (input) for mailman id 1122582;
 Fri, 12 Sep 2025 21:23:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxBEy-0004cs-SL
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 21:23:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBEy-006dmu-1w;
 Fri, 12 Sep 2025 21:23:32 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBEy-006Ajk-24;
 Fri, 12 Sep 2025 21:23:32 +0000
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
	bh=QSNFsOFIXDEOU/eQ5zPH08Xp1QN49RW9J/tguUW+J6c=; b=bhs68KVM8i8ZHWnY1ptVk2o7KX
	qz8sDZjMRBmL1TojxUpRoc2es7mDrXlk4gEgPDgk2smY6fFXqBRWsKSo9AqV2iNfl4MfHOrAzvVag
	bnPeebF7Wy6PJCGJMICExmaFTpfyJ+KUwiiIK1XFg3b2vBW1oz0WaadrK42KXQPi522Q=;
Message-ID: <53d760ad-c58d-4d3f-bd66-598b4a95a8ff@xen.org>
Date: Fri, 12 Sep 2025 22:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] releases: use newer compression methods for tarballs
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <a9b52101-c332-4791-8034-2d3043f82356@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9b52101-c332-4791-8034-2d3043f82356@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/09/2025 09:14, Jan Beulich wrote:
> Other projects have long switched to xz and/or lzip.
> 
> Tidy things some as well: With the removal of qemu from the tarball,
> intermediately extracting the tarball again has become wasteful. Drop
> that. Invoke compressors using asynchronous lists, to reduce overall
> latency. Drop the -v option from the (previously implicit) gzip
> invocation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I have tested manually the steps and the correct tarballs have been 
produced. I will update my scripts to copy & sign all the tarballs once 
this is merged.

Acked-by: Julien Grall <jgrall@amazon.com>
Tested-by: Julien Grall <jgrall@amazon.com>

Is this intended for Xen 4.21?

Cheers,

-- 
Julien Grall


