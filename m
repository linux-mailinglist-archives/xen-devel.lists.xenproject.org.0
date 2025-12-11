Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA6CB6469
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184202.1506702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiFc-0002aR-N8; Thu, 11 Dec 2025 15:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184202.1506702; Thu, 11 Dec 2025 15:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiFc-0002YL-KO; Thu, 11 Dec 2025 15:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1184202;
 Thu, 11 Dec 2025 15:06:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vTiFb-0002YF-5f
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:06:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vTiFa-004rBp-0W;
 Thu, 11 Dec 2025 15:06:38 +0000
Received: from [2a02:8012:3a1:0:cd49:6fb:8176:d6c5]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vTiFa-0042CT-0h;
 Thu, 11 Dec 2025 15:06:38 +0000
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
	bh=7oGugNeQGSVHLHIynhQHPt61cQYkZx2gTElAtH8wwjA=; b=rvU2MLVkWDh0POiiEAMRY5v5WN
	oT2a2V4A5b8eDmLzdf6Gl1QNbk/fJQ+ZCsU1NUFCtys1qjd6DG75WFKJ3oDX3F0JEhvvIEl2I0aQj
	KAzjI+4YLLHwucd3JLpYe5DrURO8X9bEjBQGtebE5nrl+7f9vOyBVmGuqdJcM0bQFW6s=;
Message-ID: <0350292a-c955-4ce9-9f04-59540e84a8da@xen.org>
Date: Thu, 11 Dec 2025 15:06:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm64: Add support Clang build on arm64
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
 <f49dd123-32ca-46b2-a00e-751267667bd2@xen.org>
 <CAHFNDNgUNg2zTvxweZndgWwZ9EJjFJr3YB7Ouk-4x3RqcKRnPA@mail.gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHFNDNgUNg2zTvxweZndgWwZ9EJjFJr3YB7Ouk-4x3RqcKRnPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/12/2025 12:49, Saman Dehghan wrote:
>> And OOI, how did you chose Clang 11?
> 
> Hi Julien,
> 
> To be consistent with minimum requirements for Clang/LLVM on x86.

To double check did you try the version and confirm every works?

Cheers,

-- 
Julien Grall


