Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A5866BB3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685294.1065760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVzv-0005jQ-4H; Mon, 26 Feb 2024 08:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685294.1065760; Mon, 26 Feb 2024 08:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reVzv-0005he-0P; Mon, 26 Feb 2024 08:06:03 +0000
Received: by outflank-mailman (input) for mailman id 685294;
 Mon, 26 Feb 2024 08:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reVzt-0005hY-OA
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:06:01 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f33518-d47d-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 09:06:00 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3f3d0d2787so259502066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:06:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b00a3d99dc3f3asm2152648ejc.67.2024.02.26.00.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:05:59 -0800 (PST)
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
X-Inumbo-ID: e0f33518-d47d-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708934760; x=1709539560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ULCwp2UA1ESsjpMBKq9RnRhKl0nq5NgpjAgXototj4=;
        b=CIiv8CtBIzkHqQB35B7nJuHPzWrcvUE9pVrrcMzhkklU7xnc9qXeO1fnu4sY0c+Pq+
         pGYP20R9r/AcH7IIGRJp7uyHH+DTQdHvjF7zIDYCgRhPUzbdRh2amc6tyed6CdTm+55i
         wxMaitrb4iOq/MwzJUWLqvvy94gglI54pDysMYLx6faW7JjjFzPUIxgCGbXRlZDcgBrf
         mmms+UbvpeH6AUEe+WBysEOS4GFfOGFHCLlAFY5vSWj2MynRF3YUxsNwiPseadOtkzKy
         5NiAwS8Q38oP9UB2zyNCV6o2bSMXfmBfqlSaFBCxmSpzCjy6doqEaj9iy8m6hvQsfhbw
         67aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708934760; x=1709539560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ULCwp2UA1ESsjpMBKq9RnRhKl0nq5NgpjAgXototj4=;
        b=GgwGNLCBlBIPlRrKj3CwvCd+pQ8nalJmH7kXTc32EHkwHSNKQ9e6x+Mf94WdzakTtZ
         xDQvc1dOLyP+GIOnnR6ddHVOX4J3a3sEMYLds5rD5U5TsAwkYrpDJhwr1Ng420jH26Tu
         +WFsy/ZP36F84DUyeD07ds8muxiFY32xzysvimW66pNeSwPI5EGpRhcTNiZTCuRRIS9f
         xefHZV64uj73Qj5xYFY37JC+qamilPc//mRsE2RhuCvf7+Fy1T/K2XvzmfTqtZtqeXL+
         /ZeY8dQG068Nj6diRpDiz6WYJCD4A74SxiXEF+HBt19OYDk7zK/1LEDnV7QNAr5QTYLo
         5+RA==
X-Forwarded-Encrypted: i=1; AJvYcCX0D39w5/y3cn/kx/U5REWquS92uc7hCB3G+g/mmYblUweoWNGqAdGzTYh3NSp5dudQGcU9U4OsxarKnCPwvxaGGA+9WZb2vz6oIQp07ss=
X-Gm-Message-State: AOJu0Yxt2hT3Zmy0d1AKILqfNg103cE5LzdUsPLnyv8EFeYGEJkrgflx
	yqRl1vceBXgoNU2n8Zfa+4AilthaKq9xKQDydPqv2T+U4kWDULog5TAF5qZHPw==
X-Google-Smtp-Source: AGHT+IFCw9n6jKSb8+m4CC9/r9lqPHWUkaUESpWwkYw9PS5Gyq6SqLXFwj2sxPu3QDbdg9IvFVjgkQ==
X-Received: by 2002:a17:906:d145:b0:a43:7e63:6997 with SMTP id br5-20020a170906d14500b00a437e636997mr219703ejb.18.1708934760083;
        Mon, 26 Feb 2024 00:06:00 -0800 (PST)
Message-ID: <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
Date: Mon, 26 Feb 2024 09:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 10:35, Nicola Vetrini wrote:
> Refactor cpu_notifier_call_chain into two functions:
> - the variant that is allowed to fail loses the nofail flag
> - the variant that shouldn't fail is encapsulated in a call
>   to the failing variant, with an additional check.
> 
> This prevents uses of the function that are not supposed to
> fail from ignoring the return value, thus violating Rule 17.7:
> "The value returned by a function having non-void return type shall
> be used".
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

I'm afraid I disagree with this kind of bifurcation. No matter what
Misra thinks or says, it is normal for return values of functions to
not always be relevant to check. To deal with the Misra rule imo
requires to first have an abstract plan of how to handle such
globally in the code base. Imo such a plan can't be to introduce
perhaps dozens of new wrapper functions like is done here.

Jan

