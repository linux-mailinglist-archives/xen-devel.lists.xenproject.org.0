Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3EACCF64
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 23:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004912.1384580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMZZH-0007y0-L7; Tue, 03 Jun 2025 21:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004912.1384580; Tue, 03 Jun 2025 21:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMZZH-0007vb-IT; Tue, 03 Jun 2025 21:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1004912;
 Tue, 03 Jun 2025 21:53:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMZZF-0007vR-Cl
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 21:53:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMZZF-000PXk-02;
 Tue, 03 Jun 2025 21:53:09 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMZZF-009HTy-0y;
 Tue, 03 Jun 2025 21:53:08 +0000
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
	bh=ZbAGSy41kFbcj3x6f03D0CDbPKm+J0fC6Gg03ennvME=; b=KzpG1WiGrx/L7gJC7zdMMeirbq
	s9XnV5ULGnRi2NKEHTji6ZFesrzye/Ub07brgR3eDyeSzhMGa5P6G+V5a4qE82RMP2HnP93uBXBUv
	P0cKOe8ICO9Exy+QObWjqVhhRNmHMUBFMpBLmmI9KNkL/UqHYKZwsq7XZm6i920a2BLs=;
Message-ID: <44fd7458-bd29-44a4-b3c7-71f15732e004@xen.org>
Date: Tue, 3 Jun 2025 22:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/kernel: Move parse_params() back into __init
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603125215.2716132-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250603125215.2716132-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 03/06/2025 13:52, Andrew Cooper wrote:
> It's non-init caller was dropped in Xen 4.14
> 
> No functional change.
> 
> Fixes: 02e9a9cf2095 ("xen: remove XEN_SYSCTL_set_parameter support")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> Found while reviewing the lockdown series, where an __init callee was added.
> 
> It appears that GCC has inlined it into it's single caller (which is __init),
> and not emitted a non-__init form.
> ---
>   xen/common/kernel.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 8b63ca55f14f..5be668ba855a 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -67,8 +67,9 @@ static int assign_integer_param(const struct kernel_param *param, uint64_t val)
>       return 0;
>   }
>   
> -static int parse_params(const char *cmdline, const struct kernel_param *start,
> -                        const struct kernel_param *end)
> +static int __init parse_params(
> +    const char *cmdline, const struct kernel_param *start,
> +    const struct kernel_param *end)
>   {
>       char opt[MAX_PARAM_SIZE], *optval, *optkey, *q;
>       const char *p = cmdline, *key;
> 
> base-commit: 2c4a3d688943b2034756859844b8337a5a97ce07

-- 
Julien Grall


