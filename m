Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4F65CEFC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 10:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471068.730767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzgl-0007e5-E2; Wed, 04 Jan 2023 09:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471068.730767; Wed, 04 Jan 2023 09:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzgl-0007cK-Ak; Wed, 04 Jan 2023 09:03:59 +0000
Received: by outflank-mailman (input) for mailman id 471068;
 Wed, 04 Jan 2023 09:03:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pCzgj-0007c8-Rl
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 09:03:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCzgj-00008o-2o; Wed, 04 Jan 2023 09:03:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCzgi-0007ac-Tt; Wed, 04 Jan 2023 09:03:57 +0000
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
	bh=E5QF3ZIYhIqtza+uUT60SAKBwRufJQsVMuv2YnaYHQ8=; b=VvcM8sPcG29hG5Jox/rEHnB177
	Pls2nM4qVrVH6uGURQk4eWL9L7sXOTkSshSZx8F9lt8+B6mfjC+I1/tCfi2V14Fj5W6NncFgy4bke
	PW7uTsyqNsrvCgDfUGk9gZbWmQSmD/RKvBdgJQLZhNYETDom45TeuOFWlnsTMRKsEk7g=;
Message-ID: <11432e22-94cd-c956-63dc-d45c419150f5@xen.org>
Date: Wed, 4 Jan 2023 09:03:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] public/version: Change xen_feature_info to have a
 fixed size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230103200943.5801-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 03/01/2023 20:09, Andrew Cooper wrote:
> This is technically an ABI change, but Xen doesn't operate in any environment
> where "unsigned int" is differnet to uint32_t, so switch to the explicit form.

typo: s/differnet/different/

> This avoids the need to derive (identical) compat logic for handling the
> subop.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>   xen/include/public/version.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
> index 9c78b4f3b6a4..0ff8bd9077c6 100644
> --- a/xen/include/public/version.h
> +++ b/xen/include/public/version.h
> @@ -50,7 +50,7 @@ typedef struct xen_platform_parameters xen_platform_parameters_t;
>   
>   #define XENVER_get_features 6
>   struct xen_feature_info {
> -    unsigned int submap_idx;    /* IN: which 32-bit submap to return */
> +    uint32_t     submap_idx;    /* IN: which 32-bit submap to return */
>       uint32_t     submap;        /* OUT: 32-bit submap */
>   };
>   typedef struct xen_feature_info xen_feature_info_t;

-- 
Julien Grall

