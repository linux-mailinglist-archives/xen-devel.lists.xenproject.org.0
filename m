Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9A96DEB1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791205.1201034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEfm-0005rQ-EN; Thu, 05 Sep 2024 15:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791205.1201034; Thu, 05 Sep 2024 15:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEfm-0005op-BS; Thu, 05 Sep 2024 15:45:26 +0000
Received: by outflank-mailman (input) for mailman id 791205;
 Thu, 05 Sep 2024 15:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smEfk-0005nf-9t
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:45:24 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dca24262-6b9d-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:45:22 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c27067b81aso1043767a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:45:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc540adcsm1347724a12.21.2024.09.05.08.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:45:22 -0700 (PDT)
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
X-Inumbo-ID: dca24262-6b9d-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725551122; x=1726155922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMI5xOYdbPLSdizPWzCzvxkvLo8azZXAu9KLoZt+fgQ=;
        b=PXQiFdHzk4+J08r0msdyCuTmXCJWFazJxPflw5O+YZ34atOqnwhaJNk7UcOk2Vq1d+
         1HSzM2tEO7JfjTcSMFEMgB7E10CBaakEMQdBjB5Ux6mRtxMNJpv0UIHH0kSI0i5nXHFK
         LMQyIa89LBo3kJyIYgInumRnWL2QkzCbqiocnWE/UGLp2WTJwx049bEi66oB57goDhTU
         7mJb/fMpd8OuFARUD/N6pyP+oOf9+BrUQheTXXGOl1+juYb2rcpLc5ukYKULKeqfcKCR
         FySRvjWAaFdEnXg1YB7lcHQNkuOT2Wz0SGA5bqnSnOEA2mnKmSiPGvpBsOOBwvKgA+ys
         AhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551122; x=1726155922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMI5xOYdbPLSdizPWzCzvxkvLo8azZXAu9KLoZt+fgQ=;
        b=re6Oiy8LPaTIWACsqQr3XcydQXdhGDJ6HPVJ1cvlT8mk60ndH4vwf8ESVDwrvR3MQd
         5o+fSoYs0N1axHkJ64D5m2o1OlczjJWbghCgIKBKD8IGZ8pcPAzIcjqixt8jNi9ILmsf
         4O5FqOtkz3kqqdXz52Doo2C4lfoFaxGdcycOUmL6BGeHUcu84zJCSbN/HeEJ3O9Dr8E+
         uP2crO7lut+GJAA5VN/ExczQDqd0QKnZc1ZzcfPrykCRcvEhOBZJbrC+U+YQAptxaYBT
         X7yjG/hJbNbpeYtJAyPiQyRTYpqd6hE8aDL0M/PPR/8JpFxUg68eRMHvnyq3URBuByX9
         TZRg==
X-Forwarded-Encrypted: i=1; AJvYcCXagDDLy8Vpf9cqeMWrSB2IujnN691kCFIpcGg7sJh/sYmNzHZWPkOdq8Q8PgUbWF9PJ5PE4xTkgC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0mc2AtmrDfmGa8Fk7Bay8qBDUxROOVwdQcPLnsaWLauS+D9Xk
	FiphHA6Qau9D+8JwAlbgzvFDEuyXKymsa2YMacQug46+URv7xno8kVHLglviDA==
X-Google-Smtp-Source: AGHT+IEZgUVsTHLGGp/TBCZcTPhkFqffpGjcqiTxwWog8YB2es7liE+j5gNhwOfKRNfHnEaRSU91Sw==
X-Received: by 2002:a05:6402:5246:b0:5c3:5423:3d10 with SMTP id 4fb4d7f45d1cf-5c354233f35mr4152710a12.5.1725551122263;
        Thu, 05 Sep 2024 08:45:22 -0700 (PDT)
Message-ID: <cbfa09ee-a576-41c7-bcf9-dbc23df911d0@suse.com>
Date: Thu, 5 Sep 2024 17:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] x86/time: introduce helper to fetch Xen wallclock
 when running as a guest
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240904153151.83995-1-roger.pau@citrix.com>
 <20240904153151.83995-2-roger.pau@citrix.com>
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
In-Reply-To: <20240904153151.83995-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 17:31, Roger Pau Monne wrote:
> Move the current code in get_wallclock_time() to fetch the Xen wallclock
> information from the shared page when running as a guest into a separate
> helper.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Still ...

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -787,6 +787,30 @@ static struct platform_timesource __initdata_cf_clobber plt_xen_timer =
>  };
>  #endif
>  
> +static unsigned long read_xen_wallclock(void)
> +{
> +#ifdef CONFIG_XEN_GUEST
> +    struct shared_info *sh_info = XEN_shared_info;

... I'd like to switch this to pointer-to-const while committing, if okay
with you.

Jan

