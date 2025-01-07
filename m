Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FFA03921
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 08:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866073.1277346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV4Rn-0004Gj-Gq; Tue, 07 Jan 2025 07:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866073.1277346; Tue, 07 Jan 2025 07:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV4Rn-0004FE-D1; Tue, 07 Jan 2025 07:56:19 +0000
Received: by outflank-mailman (input) for mailman id 866073;
 Tue, 07 Jan 2025 07:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV4Rm-0004F5-1n
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 07:56:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df1bd8d4-cccc-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 08:56:16 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso12879120f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 23:56:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c846ca4sm50600894f8f.43.2025.01.06.23.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 23:56:15 -0800 (PST)
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
X-Inumbo-ID: df1bd8d4-cccc-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736236575; x=1736841375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ8pJhAisSeXRzr/sec6vfVpCK3RZROX0EmSm6DYgRI=;
        b=Bu4tlyH9HMw1xYxkocpDqOG6855rtzOhtqNytonaM0b62IjLUMt+K4xPplS4HycTy6
         Q4HPFzeWMO0nLDMOcGpYY5hNxOBxqj7QnOJhwKoaznCrxTBncmGkjaywf+6ewjCt6sfy
         REi9DUw/1vCDTlJD0oAGWm1o6S4YXda6su0kLdUJCYg1HBv9WC+peajZxUvZGalf1jKU
         wUHt2nvNvCmibVEmUIHuok1e3K63Le3sh0gb1AVl+oeIq8rCwqkuc1ZHHI92W8y10UqD
         Fj0Gy7FcJE+FXtQA9gW3w8oBNDA6665VBAaF/ek9xciNf8x/RDb/90zpGX/aimpk84tb
         6WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736236575; x=1736841375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ8pJhAisSeXRzr/sec6vfVpCK3RZROX0EmSm6DYgRI=;
        b=OUj2FavcdHxMYSD3z/SaE4JqX6aIpJmfpJWrNMrAFPfn7zR+iKnaKg8n4roaQMxPMc
         9WCDW0v7BNiIRkWBV2XF6wViAfVZ+SWlNRy9rcQleUAO/aAZwjJgTWVH5iX1ohOAl0gN
         GI/3tvadR96Udb06e/DKd/pAwaQUfsHtAEv+wZpnlxA/CuZAByxhnvl3vVt6oSWYadrZ
         3Hy+tHGzxEfRFsxesuRVl0MI4EtCe7FCkvyUvS9efZx7bwsFaCbNshJtRSwldV+CpL2w
         7mUybmcHj0O27M9O/hnEmxc8qRUNAriDt86PSx1SNgvmHVPAjsSXSmqrw0+lhTvtHNb8
         7RZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYjHRQcGWycpdZfPS7FFw0r2nfbiGCQXY44b4ZM5J4V3jIB5ECGhsuyExcAXSMYtdwsQwK/qg4164=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE5/5XRxvvgOe9GnfiYnAAuTQKOudBjwFlEynoQMuHfbJtwlw8
	BiqCqPzchzLNr8h8RYSU/XwfHF1jhZ+w5vbpzYv7+l90BQnR/brMkxqp5zgrZw+A3YFUqG6RUI4
	=
X-Gm-Gg: ASbGncuGBNB0NNAcWGSqLlN36JM8E99oQHbIUQpeGudo82CZ/1fDnjbagxnnYbZwkAo
	ieBQn5NS8SKWUusLkiA0XskUqjd0u1W37jiQU/LqlCtGyD55ZEiInOP5RcBe43dEuMm2IUrB4YN
	144ttu5uMPAcphmrX0QUmISUfAdJvyQDmPXhYfbbjm3cufx1cOeHIiQEjSYpjRa4khEln7VP5RX
	ueY1K/aV7VK1Sd3s0H7rFr1tSDH00No3duyCDrbD48BhUcFdd1v8wjYa86Ua2qTDuvWt88y3e68
	h5K+3Dkc9W4+nQQ4JEXDWs6PqYCxW0GgHm/2WpfGYA==
X-Google-Smtp-Source: AGHT+IF1hMDTVebgHUuVEgYhuFlwpTzXeNj4hxEa4Dp2c5Rt3BOJt0BHLOo7k9j4Nh48CB2sDG/wXw==
X-Received: by 2002:a5d:47ab:0:b0:386:1ab5:f0e1 with SMTP id ffacd0b85a97d-38a221ea67fmr57490789f8f.14.1736236575686;
        Mon, 06 Jan 2025 23:56:15 -0800 (PST)
Message-ID: <0f8fc348-14f5-40ac-912a-1785caedb675@suse.com>
Date: Tue, 7 Jan 2025 08:56:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: update pvcalls_front_accept prototype
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 22:36, Stefano Stabellini wrote:
> xen: update pvcalls_front_accept prototype
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> 
> Changes in v2:
> - also update pvcalls-front.c

The patch still gives the impression of being incomplete: There's no
caller of the function that you update. However, there's no such caller
in the first place. Why don't you just delete the function then?

Jan

> diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
> index b72ee9379d77..cab480059731 100644
> --- a/drivers/xen/pvcalls-front.c
> +++ b/drivers/xen/pvcalls-front.c
> @@ -769,7 +769,8 @@ int pvcalls_front_listen(struct socket *sock, int backlog)
>  	return ret;
>  }
>  
> -int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
> +int pvcalls_front_accept(struct socket *sock, struct socket *newsock,
> +			 struct proto_accept_arg *arg)
>  {
>  	struct pvcalls_bedata *bedata;
>  	struct sock_mapping *map;
> @@ -788,7 +789,7 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
>  		return -EINVAL;
>  	}
>  
> -	nonblock = flags & SOCK_NONBLOCK;
> +	nonblock = arg->flags & SOCK_NONBLOCK;
>  	/*
>  	 * Backend only supports 1 inflight accept request, will return
>  	 * errors for the others
> diff --git a/drivers/xen/pvcalls-front.h b/drivers/xen/pvcalls-front.h
> index f694ad77379f..881ef14660bc 100644
> --- a/drivers/xen/pvcalls-front.h
> +++ b/drivers/xen/pvcalls-front.h
> @@ -12,7 +12,7 @@ int pvcalls_front_bind(struct socket *sock,
>  int pvcalls_front_listen(struct socket *sock, int backlog);
>  int pvcalls_front_accept(struct socket *sock,
>  			 struct socket *newsock,
> -			 int flags);
> +			 struct proto_accept_arg *arg);
>  int pvcalls_front_sendmsg(struct socket *sock,
>  			  struct msghdr *msg,
>  			  size_t len);
> 


