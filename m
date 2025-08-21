Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4BCB2F564
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088420.1446172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2bj-0007RM-2e; Thu, 21 Aug 2025 10:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088420.1446172; Thu, 21 Aug 2025 10:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2bi-0007P2-Vw; Thu, 21 Aug 2025 10:33:22 +0000
Received: by outflank-mailman (input) for mailman id 1088420;
 Thu, 21 Aug 2025 10:33:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up2bh-0007NU-EP
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:33:21 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41e5a34d-7e7a-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:33:20 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b5f620dso1189379a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 03:33:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a758c062bsm5134197a12.55.2025.08.21.03.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 03:33:19 -0700 (PDT)
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
X-Inumbo-ID: 41e5a34d-7e7a-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755772400; x=1756377200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PZU7HWifhl63Yg3+rr0dv9iKVLdWF7jEc07x6hJuslY=;
        b=aQn9iAaQLnJuWRDcHKQufZDV6M91Z135zWMbTAypLDJUlUCaUHKgXmAEQk3pXsDJrR
         /aZUosjAzcihWxDdce1Bx6oGTX4rSvCZ5gNA0l2xMiPlednL04w8ocqU2UzXb9LYLWp/
         FRdPQQBIeWK7pTjNSbgiOJk+QEaZK6QZMXOawDQ8j8ECy3j5ZMts6FZUJy3WyslxOTCn
         vJZalLXNjBfiNT9/8a7UuFFM5mf5qpdeloKHWcHbPruzRA9m58sI4N+R0L4JO8FeMza6
         FABvJ0gSunUoxzKvJ7k7l3m3/qZcfR0DZgEi8Jy7jERol+jNpWuanmUixvG2yeCERDwn
         9XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772400; x=1756377200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZU7HWifhl63Yg3+rr0dv9iKVLdWF7jEc07x6hJuslY=;
        b=tpmqwRJuOXBCMNwKUys6YgMXxTaz7PGBOvuWdCPDkT8myvgs8zwDJNbNoF+h2Y+29A
         fcmap4VSZsg2QWs2tqeJRLpE5dqRjgKxAqCRMfvbAyJN1UcSjD/Mq2dXYIWfDjCUCluW
         FUzI2XmwkI1oaM2dtyh7DFGY1BnPDeEY+0uIHcQR9qGtjVyUUD96EvwQgpM/wO34CYyl
         l8LnnBCWQpneQaPVh2pA51ADCQdrWbBctMpkaHNr9Rns8m9Fd+qRIzWK+8Sl4pTOmH9P
         3agygQtiIGj3565PylAKVX6ubl4Aau/wn9LhTx0WE2CabV8nsnMEyF8EvDqnQBR509+X
         A+LA==
X-Forwarded-Encrypted: i=1; AJvYcCX2lRU21N3rXBC6V0Q4bEJ09AzZd8IX9JsOb0gbavfZwAD30KV5TmvPHCXkUGGnuyawVPPDQp3Ekic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhr1ioeiedDlTJbTO8ciojTf9tmwx5kgI9VbpJDSuQpJtPhtcn
	xOZMA3x7cDHKcdYU659sjd8nbMnAMcX9Mq0Y/MqE09COdgkinra/asFVa03Yk7iBtg==
X-Gm-Gg: ASbGncuLiboDCgghRankQOI+GEN1WB0pInRUeulzCMYOc8nZUzPkEzrjeH0GdSTbcDF
	68leA6dAEBOt5bBbKRgmMPERt9yVifGyX+69AbRU+dj9+BR/M5aafAYPvvDW85aYOj85mm8eePO
	caerhCWmEn/+AWC+jsykpVrHJ1A3uJcIF328E4srtnTF8nhhl7KCUf7NiX3AqbWAzPkL9HTorVu
	0gpaW8N0ygcGOdWlfNTAe2lr0V3ZcYUNf5E4g+0RWL18Eg9vfg7HNT5fsa5DOzZrmjPezWosJeF
	ykywM6WrQIOzAP2Mfgk0dN4UqLIDSevUBSDEMw9YIp3CEhay9FS9Pxw9XEOaysjseNVnf9jUMr3
	93fk+ReboWXtFkG41o77flyXu3W0OPpY4TDXZHpq4aozKUujf91VN0dmt5d4iXVr6qJDh56Qn06
	+kAHEm56c=
X-Google-Smtp-Source: AGHT+IESwTqvZhRBUwrrdklbwPAGvXIpqLEAyIpGdHkYpo4jfUdmXDljF7pH1ktZORqd2Mmb++N8sw==
X-Received: by 2002:a05:6402:1ec1:b0:61a:9385:c780 with SMTP id 4fb4d7f45d1cf-61bf884ecabmr1472291a12.37.1755772399867;
        Thu, 21 Aug 2025 03:33:19 -0700 (PDT)
Message-ID: <98e8ca88-75cd-4d59-9e94-f758324fa46a@suse.com>
Date: Thu, 21 Aug 2025 12:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 20:05, Dmytro Prokopchuk1 wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -852,7 +852,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      PrintErr(L" failed for ");
>      PrintErrMesg(name, ret);
>  
> -    /* not reached */
> +    /* SAF-15-safe deliberately unreachable code */
>      return false;
>  }

Much better (even if not tagged as v2). Yet then, did you consider
alternatives? For example, with PrintErrMesg() properly annotated "noreturn",
I'd kind of expect compilers to not object to the omission of the "return"
statement here. This would then let us get away without a new SAF comment.
While you explain in the SAF text why you retain the statement, I'm not
convinced of code clarity suffering if it was deleted, as long as a suitable
comment is still there. If PrintErrMesg() lost its "noreturn", surely
compilers would then diagnose the lack of "return".

Jan

