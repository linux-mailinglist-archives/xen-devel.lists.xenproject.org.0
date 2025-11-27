Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E11AC8E994
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173925.1498915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcOw-0004pV-N3; Thu, 27 Nov 2025 13:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173925.1498915; Thu, 27 Nov 2025 13:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcOw-0004mS-Jt; Thu, 27 Nov 2025 13:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1173925;
 Thu, 27 Nov 2025 13:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOcOv-0004mM-1g
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:51:13 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cbc7cd7-cb98-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:51:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477770019e4so6635865e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 05:51:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791163e36csm31215715e9.9.2025.11.27.05.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 05:51:01 -0800 (PST)
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
X-Inumbo-ID: 1cbc7cd7-cb98-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764251462; x=1764856262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w0cOrI2lIwOEb9+yW/dCtZzgoJVRTB+hiiybPe2KgL8=;
        b=Wu/bkwijytW3/oA+XYy7kqhWhCD5PtdbY30o4NTWRcy1m25HZVMnzfxGcKVjkARKx7
         M1LxROe1IYvJoJwnmZQVk8joeOwumwPEV2N3RSMYOiKflvEFFd8fpFM/D8W4yDg6+P76
         Ayyle5l5NcxoaQuhM3r3BWwcmOCs/EcteupuRcTXR83ne2xU8xSlGwV5SlAVMAY8JeMB
         7u0aFJx/KlqhGl6hIY3BDB26jpAE3Lu6MTv3wieaurSiu/ZKUQ1PRhYTis7re0kHqsdC
         eARqo2C+ugsO/hMCPXWyzUhPlSDHli48Zvk6skC7E7PHUmwzb7TDI5tTE9IYa7rYwzWt
         0v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251462; x=1764856262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0cOrI2lIwOEb9+yW/dCtZzgoJVRTB+hiiybPe2KgL8=;
        b=tMtOpOzCIZYLBtm8KDFWcGTEQHX75SRwdauJtsFz2Tk1eFSem+XxUAP9k3e6jZiCB7
         5w6/7SVr7n7OjoxHyjSFoz66R8K76SGv5pm/WqIA5qkkOaQoYFcREd/fxHaSf+WokpiK
         C0qIxBVUq22qTITUh2bK+COMkJhSDLMdCrbXV1hVFZjMImCJHHgo8zpDfPf0piNjSxNj
         PmlAtvlvkRY34h5BlMPQtGHvI+btQAC2MDzNSfZYNxb14nXA2hn9NFOraCjYnA3AaeLx
         m382DhCgGy7ZwoAr6Zk6W3MHyHSfWts3UfR8oWEVMyFei5W5Q7IJdnUPmogHLWCflSVt
         7+NA==
X-Forwarded-Encrypted: i=1; AJvYcCUZey7T4E/42lLGhIvbz4kL1zlZKoTeLSxCAXHkO640v6VeFMo39rjUNT2ETZCTd9VQ2KH5uvWluvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfCJtIUO2qBBhvHuSpMOlTaVNCbQGX5/wGtH5FqaScwgTCIWyJ
	BqBi5VIa0vUE9N6W7ywUKfmHSLbexCmvR41vnqLT3yqmk2KNkwBUhj31XTv/ixZKMg==
X-Gm-Gg: ASbGncshh7hJh4Bxk8zlTvFhAfbWMa57BJSEBYl6fCBvoGTPrP9r9qrQxcJ+eohyTCa
	lcHzcKSkS0T394iPPkrZHHv+OUDZ0GXVfwO4PPXogz0zSHB2ccfTOr9/1kHPWRqAAZhFdGJ63cw
	Gh4UqjJcIza3ADxb/fw+Gut+0eUpFqeCe/HIeQsZWhSsAbY5LOHcs5yIBf9J/cD36lHBRdXQwml
	PnFNKtyR2yrwtp/edkwSuAchqwyf0FWd9qrPbvA+LnbaM9BIXKZ2lb3qTjucaHFsxkt1oxt2s+W
	yp0MgAGZZ4RiA+XwsGOZ4X/rB0D2HI9Cx349425lNOb3qdxYUG8/neM1R8oaEWL5Sb1MaN0ZCtC
	bk6LgLDTyJE/2bUpY4ZPAEdiUZqxDHmhaDSbTgOh62t3gdaljSWVsZKYRHB+BNnAzzrtowu4DwG
	C/2f2m3Hk/HpNHQ+A+an82G7x7nlDootDaLvgyo2pYmr8qJVyIxRrvIrsB5q4/GIT65oRLlhcG2
	Rg=
X-Google-Smtp-Source: AGHT+IF6Iu+tXTsSs8iV0TTbucF0JR003nLDgTCNyZRXhW2MqcdqDLgKJUBUzcc9x0aRKdfSnl7AGg==
X-Received: by 2002:a05:600c:1d26:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-47904ae0654mr105162695e9.9.1764251461981;
        Thu, 27 Nov 2025 05:51:01 -0800 (PST)
Message-ID: <186afaad-2476-4c84-9f47-1e0ed5294d33@suse.com>
Date: Thu, 27 Nov 2025 14:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] x86/ept: Drop shadow mode check in
 ept_sync_domain()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech>
 <f63e38b0edbc2c49a7849af8896089c7f21c8956.1764248710.git.teddy.astie@vates.tech>
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
In-Reply-To: <f63e38b0edbc2c49a7849af8896089c7f21c8956.1764248710.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 14:39, Teddy Astie wrote:
> This function can only be reached from EPT-related code which is inherently
> HAP. Thus it is not useful to check for shadow_paging (or lack of HAP) there.
> 
> Moreover, it is an error to call this function in the non-EPT cases.
> 
> Not a functional change.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> This function is only called through EPT code and by vmx_domain_update_eptp()
> called by EPT log-dirty logic, and doesn't look reachable from shadow paging
> code.
> 
> I think the original reason of this check was for eventually allowing guests to
> use both shadow paging and HAP and switch between the 2 dynamically.

I don't think there ever was such a plan. The function originally lived in vmx.c,
and there - even if just as a safeguard - having the extra check may have made
sense.

Jan

