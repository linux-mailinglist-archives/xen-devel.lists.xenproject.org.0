Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89AD968171
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787602.1197010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2BW-0001IN-PO; Mon, 02 Sep 2024 08:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787602.1197010; Mon, 02 Sep 2024 08:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2BW-0001F9-LW; Mon, 02 Sep 2024 08:13:14 +0000
Received: by outflank-mailman (input) for mailman id 787602;
 Mon, 02 Sep 2024 08:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl2BW-0000lK-1u
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:13:14 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3249ba51-6903-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:13:12 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bec4e00978so3759632a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:13:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89890090a1sm524381566b.49.2024.09.02.01.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:13:11 -0700 (PDT)
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
X-Inumbo-ID: 3249ba51-6903-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725264792; x=1725869592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ1Dg8NghGAFkxzXOXgaInwt6JGUYKolZIL3UNy2b0g=;
        b=gmnoCWyemagD+clOQ3l0uViXOWyfNur+NsSV6B9XYuxRib/Pcet3y5VJoInzgWVXYk
         kwQvUX5pa4C8ACfmaH3bOfxwXM4/g4zQ/CPC+9NZDMMDC8mTiX+D7kM75PvXouBMCWDo
         yqyxQLtemc5nTUt4cGgNX6IXGerPCOaYlpoVowUtSHhAsmi7daFP62pZzPvybjBWs36I
         04CoMKdbTqk1OH/BfkwTG/z7wq5OqBwUHNroB9fZMnBuTFSncR2wPGws1wtfSacPd3uy
         3ddL4t/hOq2Uk9Ih0lSz0HAfCnvXgBv3rVwaf3TkIu17iJohG4iFMQ3nfC9dJwJIOYs6
         oFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264792; x=1725869592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ1Dg8NghGAFkxzXOXgaInwt6JGUYKolZIL3UNy2b0g=;
        b=JMrCi6He7BuNVc+XKPgcdyaaZMgow3iIer/oF5yghxb7jxSQbl7SlJes+FCzsQWCbK
         XAeqfJzExUHrKdk6ldEaVwesVxtbLrvM4DioE4277Po7rC0CZG1cP6fqx+TshvyuotAV
         nNiO87kCpk55nVVbAB2cAMZyYWi5woY0vRKYS4ABQ5C7+aj3GZNQe2y5EcMMGFSTFPiz
         r0QFXt4dMcSuGvzT5aA+YGLFRfDwCybM3w04dpxsDpwHoAqhJhoZIz3DHLZ49Hyu6A0D
         8m2Wsaa7FKBUWdUjhV+YlWvNxAwuI7bBbhrN9t14ygiDx21b8L9wfMIpxsCaXYupAwaF
         niKw==
X-Forwarded-Encrypted: i=1; AJvYcCXDQQXXvHe0882YkJQkYit5slTnaUfqXbcxAkpfyYg7oxz0O1LATy4RKjYd/JfE1sN7QcvcWusplOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+Qsl5k61dkXZ7g+RM0moZZa2AU/fyesz8fP565FD316cgEffH
	ARDnzkrqA13vRwZoOmPtZKn0IjDtQwV5xJzUaq1iGPshBOlzIAtOhhlkJnc2xw==
X-Google-Smtp-Source: AGHT+IG+S2iDod0gNAfUrlm4hUwyhrqWl2Xyq4KGEy1Z2Us7yLE7R/3mP3CQRHpXBewspyMTNco4+A==
X-Received: by 2002:a17:907:d02:b0:a86:a178:42de with SMTP id a640c23a62f3a-a89faf98507mr251304466b.54.1725264791608;
        Mon, 02 Sep 2024 01:13:11 -0700 (PDT)
Message-ID: <ce69523a-fbc3-49c9-805c-5dcb82b4ac68@suse.com>
Date: Mon, 2 Sep 2024 10:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/time: prefer CMOS over EFI_GET_TIME
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-3-roger.pau@citrix.com>
 <ca2aa9b3-44cf-4a44-9111-1d7e8c9b4dff@citrix.com>
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
In-Reply-To: <ca2aa9b3-44cf-4a44-9111-1d7e8c9b4dff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.08.2024 18:31, Andrew Cooper wrote:
> I think the init logic wants to be:
>  * If ACPI says we have an RTC, use it.
>  * If ACPI says we have no RTC, probe to see if it's really there.
>  * If we genuinely seem to not have an RTC, probe EFI.  This would be
> quite invasive in the #PF handler, but not impossible.

And would not necessarily be reliable: We can't exclude that paths taken
are (slightly) different for multiple invocations.

Jan


