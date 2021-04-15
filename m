Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CED36089C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111067.212314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0Wo-00070O-Od; Thu, 15 Apr 2021 11:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111067.212314; Thu, 15 Apr 2021 11:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0Wo-000702-LN; Thu, 15 Apr 2021 11:51:22 +0000
Received: by outflank-mailman (input) for mailman id 111067;
 Thu, 15 Apr 2021 11:51:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0Wm-0006zq-PC
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:51:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0Wm-0007Bg-OR
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:51:20 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX0Wm-0001LZ-IS
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:51:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=49t4gg66rxXpVTVH70Dr+CDg8hlZIiBQiCLx/3tJU6M=; b=g2B8ScnrWGYsOkoHbhf5RujOQs
	UT3MCC7CqzHLawKhDGym8slaAOQFPwAh6/y91OYH7hpweyabEvLDZe66B9ClCfSZjKEfrJ9qKJo+2
	n1dVrrxUOiHmUcBw8/TqYYAe2DaH/jSOrGuPwy7QxVB2bmdopMmvKmYrfexKJi46i1RY=;
Subject: Re: [PATCH v3 09/15] unlzo: replace INIT
To: xen-devel@lists.xenproject.org
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <e9f80b21-dff6-d6f0-3e69-c42219a3aaa9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a1146d08-da82-649b-c24c-3091621b0a78@xen.org>
Date: Thu, 15 Apr 2021 12:51:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e9f80b21-dff6-d6f0-3e69-c42219a3aaa9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:51, Jan Beulich wrote:
> There's no need for this abstraction.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v3: New.
> 
> --- a/xen/common/lzo.c
> +++ b/xen/common/lzo.c
> @@ -135,8 +135,8 @@
>    */
>   #define MAX_255_COUNT      ((((size_t)~0) / 255) - 2)
>   
> -int INIT lzo1x_decompress_safe(const unsigned char *in, size_t in_len,
> -                               unsigned char *out, size_t *out_len)
> +int __init lzo1x_decompress_safe(const unsigned char *in, size_t in_len,
> +                                 unsigned char *out, size_t *out_len)
>   {
>       unsigned char *op;
>       const unsigned char *ip;
> --- a/xen/common/unlzo.c
> +++ b/xen/common/unlzo.c
> @@ -57,7 +57,7 @@ static const unsigned char lzop_magic[]
>   #define HEADER_SIZE_MIN       (9 + 7     + 4 + 8     + 1       + 4)
>   #define HEADER_SIZE_MAX       (9 + 7 + 1 + 8 + 8 + 4 + 1 + 255 + 4)
>   
> -static int INIT parse_header(u8 *input, int *skip, int in_len)
> +static int __init parse_header(u8 *input, int *skip, int in_len)
>   {
>   	int l;
>   	u8 *parse = input;
> @@ -114,11 +114,11 @@ static int INIT parse_header(u8 *input,
>   	return 1;
>   }
>   
> -int INIT unlzo(unsigned char *input, unsigned int in_len,
> -	       int (*fill) (void *, unsigned int),
> -	       int (*flush) (void *, unsigned int),
> -	       unsigned char *output, unsigned int *posp,
> -	       void (*error) (const char *x))
> +int __init unlzo(unsigned char *input, unsigned int in_len,
> +		 int (*fill) (void *, unsigned int),
> +		 int (*flush) (void *, unsigned int),
> +		 unsigned char *output, unsigned int *posp,
> +		 void (*error) (const char *x))
>   {
>   	u8 r = 0;
>   	int skip = 0;
> 
> 

-- 
Julien Grall

