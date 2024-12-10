Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD79EB35C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852550.1266311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1HL-0003NW-Bq; Tue, 10 Dec 2024 14:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852550.1266311; Tue, 10 Dec 2024 14:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1HL-0003Kw-8P; Tue, 10 Dec 2024 14:31:59 +0000
Received: by outflank-mailman (input) for mailman id 852550;
 Tue, 10 Dec 2024 14:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1HJ-0003It-IP
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:31:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81867389-b703-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:31:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a2033562so50898245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:31:55 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434e83f3958sm127960075e9.25.2024.12.10.06.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:31:54 -0800 (PST)
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
X-Inumbo-ID: 81867389-b703-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733841115; x=1734445915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NtlEXwh6yYBs/wbgm42hE/EwOq6DI8mNTFjnOTacq1w=;
        b=Khcfm+d9xy59XeOKTvcfHDMJLrj/W3CmQKDA+8YUjek6oHQjD6Btqi4AF90xkaK848
         yljSZO/SsCEQYGcmHWM1wjV3m971WNG8cFxAxK2mXrC4nV84uR3IxwSZLVjKshto6Mu4
         +QOJ3xnSQY+yzxTpvnxbroNdoua+5Ahd16gPzlTJOsc5oolOpCviQjbWeBVC2RrfaXQa
         q2EfHly4/cHtD/gGLjpAlyDvzDsQ5d3e3yKXFTmb4rNG+/UrbGXtqCwmDBWBj99cCxjJ
         Wmf8GaZFTiGhfZwnZdJjZEmJDm2jj1CDj06e/TeS+dyBOmBqus6AMoNpOdrfUP+YVFmt
         gRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841115; x=1734445915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtlEXwh6yYBs/wbgm42hE/EwOq6DI8mNTFjnOTacq1w=;
        b=kPcEPfnvm43XWDqiYiA5rsH3Obxmjq60mgjJHnl16MIBcqs4bqrAk3M+VKi+On1srm
         6jYyQe6trpaVbV4vlLkp/a1YK7M6ngpm/L6kEcLwykVru1dFiW6OUPvP+vua6HaMnNeq
         Vaay4nhj/7G+xWMWwmtJRfdY0xF+jqzdj0r1X9Xtz7PGBLSxU3ZldoMSpTUlwLNuPAbW
         J5gdtAh07hHvN6Qq7I2CmGkP7acLJApc7HZ4S62a+pz8aAm36BIW2StQHxIx6e6qi1jw
         I/StrbDV1+pmItg0II2oi0xpX/VvNHG7V/J5phWB/htRrGMtzB3qf4DEZz7KGGl0Vzlp
         yvkg==
X-Forwarded-Encrypted: i=1; AJvYcCUVbs/Dm4sW1o/AfxpXCDhZ86TVTkuqxnp4FunNQUE+LTe0G1feR1vRygSHIqh8XuftO4E80JO2tn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG2AVvciXcUFyNFrnpSu3Mod85A8u/DVmKFUwaBSOxkI6mcf8E
	McSp0CTRo0rc0M7JsR5Q/ujJVw/sWy1jvHDXZHjFRuayLJ29fAD4349ve2vJbeeTn41gNDVfK/g
	=
X-Gm-Gg: ASbGncvwvWnugMiEtPXCHJH8jKmb3ymi/n5j30TBu1GBVPMYU2jGcxnWBjEVEmnVJXl
	R8IpgR6Qd5mhXDajJ9c630+S4naSLcl5Aj2zN+RxfbZz3VQdvLex0aBWymuWL2lrVea2iKUGfyt
	K5q5lKlesagnW83mPDNeYgMkD5hA0hDdbbSam6yaPPU2BYfECWGlNUGkpMvc2q4WG4zfCOEeEi/
	zOQZeBloCFvE/SrizujZEuW8kAhqknGJ6b//M29Cg97OciMI4yjc2q2cL7ZxzzxvDENMIQgPsbL
	6gFdDbJOkL0NKYXV/UtHMFy8A24Hyb/ivgG/ZXBUYTopuTbcUT7gv9128j7x+mXzsWLmLo1mTd4
	TmW0FJT1y8Q==
X-Google-Smtp-Source: AGHT+IFEmtvnklM3nnmWYiGcdCWSYmgaDSYQKIRk6zstYoaZarNl1fAnEoK8VltncZOBNphpZM6/Rg==
X-Received: by 2002:a05:600c:5587:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-434effba0e8mr104257545e9.15.1733841115150;
        Tue, 10 Dec 2024 06:31:55 -0800 (PST)
Message-ID: <1968c658-595d-4d36-8558-8f178f8ed531@suse.com>
Date: Tue, 10 Dec 2024 15:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/35] xen/console: introduce consoled_is_enabled()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- a/xen/drivers/char/consoled.c
> +++ b/xen/drivers/char/consoled.c
> @@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
>  static char buf[BUF_SZ + 1];
>  
>  /* Receives characters from a domain's PV console */
> -void consoled_guest_rx(void)
> +int consoled_guest_rx(void)
>  {
>      size_t idx = 0;
>      XENCONS_RING_IDX cons, prod;
>  
>      if ( !cons_ring )
> -        return;
> +        return 0;
>  
>      spin_lock(&rx_lock);
>  
> @@ -91,15 +91,17 @@ void consoled_guest_rx(void)
>  
>   out:
>      spin_unlock(&rx_lock);
> +
> +    return 0;
>  }
>  
>  /* Sends a character into a domain's PV console */
> -void consoled_guest_tx(char c)
> +int consoled_guest_tx(char c)
>  {
>      XENCONS_RING_IDX cons, prod;
>  
>      if ( !cons_ring )
> -        return;
> +        return 0;
>  
>      cons = ACCESS_ONCE(cons_ring->in_cons);
>      prod = cons_ring->in_prod;
> @@ -118,6 +120,7 @@ void consoled_guest_tx(char c)
>  
>      cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] = c;
>  
> +
>      /* Write to the ring before updating the pointer */

No excess blank lines please.

> @@ -125,6 +128,13 @@ void consoled_guest_tx(char c)
>   notify:
>      /* Always notify the guest: prevents receive path from getting stuck. */
>      pv_shim_inject_evtchn(pv_console_evtchn());
> +
> +    return 0;
> +}

For both of the functions - what use is it to make the functions return
a value, when all they'd ever return is zero (and callers don't care)?
I'm also having a hard time seeing how this adjustment is related to ...

> +bool consoled_is_enabled(void)
> +{
> +    return pv_shim && pv_console;
>  }

... the introduction of this function (which by itself is probably fine).

Jan

