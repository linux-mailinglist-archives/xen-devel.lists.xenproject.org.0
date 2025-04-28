Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373FDA9F00F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970633.1359274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9N8Y-00040Z-8m; Mon, 28 Apr 2025 11:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970633.1359274; Mon, 28 Apr 2025 11:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9N8Y-0003y6-5w; Mon, 28 Apr 2025 11:59:02 +0000
Received: by outflank-mailman (input) for mailman id 970633;
 Mon, 28 Apr 2025 11:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9N8W-0003xy-G5
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:59:00 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a931fbb-2428-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 13:58:58 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so30923555e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:58:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a152csm157862695e9.12.2025.04.28.04.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:58:57 -0700 (PDT)
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
X-Inumbo-ID: 2a931fbb-2428-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745841538; x=1746446338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vmhRNVAo9gZ5GwBpEL3qhchuUVmzAjhTeUioubQCWNY=;
        b=DEo7XdOdYyZHQ/mINnq8xGw7tvJcPHPvl8/U6zA3HxhMUs3ctau/z+ygBawNHg3f6l
         XJNo1QjBZ+ce9mM9wu6b7vKHxFPzQ8wKnETkE0yhXXJ1KBYca0tLnVMqhAcE2jFGCYfp
         ziC/9skeskcqDq7T5WApr4p8E9eqOSKGUG6D3LnT7mBBzW6/cdqPERi1MeQM4GfFAW9C
         3XK+/f+ryxDTZzJjdNnsOlYb3rxpe3af9ZMK1eKWc96sZzrRTpANRQnBG58AvW12V/+S
         ntc9mOWQudEEibqTrc9g70Ed/TgMayk+h02qGf3Scrl/g7qb4HrLCTh86+b2x/3OvqSp
         cZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745841538; x=1746446338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmhRNVAo9gZ5GwBpEL3qhchuUVmzAjhTeUioubQCWNY=;
        b=YCn+FI7qFk4y0ctNup6mfa7eW4xOhzrzjOg8rQM+TMt9Iryf3Xsf/Pu522gUeN5Zwr
         253hIP40JkSXnc92k6dziLWrBGTr0SAxg60EUnmwZpWvczTxNe+jEjqsFpeUPgpJRn+z
         VrGR5FNyQFqPZUHO0M7MpRzwHYcqCv+2NNDEOwlHEdTqoo4kP3RW8zmBI/p+jhjfHmSk
         /xxCjytnoLCZPG72oN5h/qNXgsNLywijmJNew8gOyS8l8jU0YNiW9fQwRa0jUSBC9kLM
         0FuOE6FwRSh6UxVe0P9JnCSPJStCD6T0VodIZuL/01TuQqjXfa13tTABN2yIYVUL0Ndm
         abfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeJl7WktbzmPnvmJN0AtzRAITF5wS8Jp/7CzIAhEi6ypfEt/4FpGjAlHo09uyeHeWGxmL94yoWRto=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrzOjAE5+scWQo0G9sxXDRQidATcY9gz6jYl0Uh0ric+uHhy+u
	gt32a479xtbnVJidhyucZbNDIO9Ed4xfZt09d0twSW3sGwPR7VtQfTOkTL2NXw==
X-Gm-Gg: ASbGncvXAka8LQ2RoPTXcJvotwQTlgqHHAGT+9c0522hR1u3vVHNN9tndk2FvHn4WmZ
	TktjBTY0hXYbHLs/O78u2a8u/BVkW2jOWDArsri7S/bW1OgBdYpPWppgn9lqlONGwNmFuOMClKp
	06ulJMhJUiaQhmHzwZ8Xq+6mZslBia61A7Ga0/Ri21WOd0daDVtzCNL36jzobKNVxx96NHpPIFE
	XwILqd/5CIYLeGklI/f676fFTF1szu8hrH3O9wLahKycGuqzb/kXrJTQM2Sn439nuCSXysCG6bv
	zydFW/5J6DfoINpjW2pJ7X5ci6/yQlTnBzlgWocfuyLlgY7MoyqXrs88ypB0PeBMG0SP1L4K3Sg
	b/Qtca7h9Y4vygJ/DHVG9Q8LAvd1PbH9ExVfV
X-Google-Smtp-Source: AGHT+IHeeJRFOo+JbBZ3fgVGWwDjSoYQckNEbOMNWc30i+OEB4EF/OSi3LFdRqyxNx5AD+nL+fiPSw==
X-Received: by 2002:a05:600c:46c5:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-440a66abe30mr83265355e9.24.1745841537642;
        Mon, 28 Apr 2025 04:58:57 -0700 (PDT)
Message-ID: <badaead4-7eba-4796-8e96-96a95b36145a@suse.com>
Date: Mon, 28 Apr 2025 13:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] x86/vmx: Replace __vmread() with vmread()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 nicola.vetrini@bugseng.com, consulting@bugseng.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250426072819.39455-1-dmukhin@ford.com>
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
In-Reply-To: <20250426072819.39455-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 09:28, dmkhn@proton.me wrote:
> @@ -1957,8 +1955,7 @@ void cf_check vmx_do_resume(void)
>      hvm_do_resume(v);
>  
>      /* Sync host CR4 in case its value has changed. */
> -    __vmread(HOST_CR4, &host_cr4);
> -    if ( host_cr4 != read_cr4() )
> +    if ( vmread(HOST_CR4) != read_cr4() )

It's unclear to me whether this constitutes a violation of Misra rule 13.2.
There are two function calls in this expression. Both funcs are inline, and
vmread() is even always_inline, but they're still function calls, which can
be carried out in either order. And neither can plausibly be pure, let
alone const.

> @@ -1573,12 +1565,12 @@ static void cf_check vmx_get_nonreg_state(struct vcpu *v,
>  {
>      vmx_vmcs_enter(v);
>  
> -    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
> -    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info);
> -    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
> +    nrs->vmx.activity_state = vmread(GUEST_ACTIVITY_STATE);

This struct field can now also shrink down to unsigned int (or uit32_t if need
be). Likely there are others (and maybe also plain variables). Which in turn
is an indication that, as was suggested before, this patch wants further
splitting up. That'll also help with overall progress, as then what's
uncontroversial and not in need of further adjustment can go in right away.

Jan

