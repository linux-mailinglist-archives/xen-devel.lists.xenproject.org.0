Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76877933CD9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 14:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759951.1169651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3Td-0004Sb-AE; Wed, 17 Jul 2024 12:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759951.1169651; Wed, 17 Jul 2024 12:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3Td-0004Qp-7I; Wed, 17 Jul 2024 12:09:45 +0000
Received: by outflank-mailman (input) for mailman id 759951;
 Wed, 17 Jul 2024 12:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sU3Tb-0004Qj-QO
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 12:09:43 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 732b061a-4435-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 14:09:42 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so91716861fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 05:09:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ebb67f8sm7990110b3a.61.2024.07.17.05.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 05:09:41 -0700 (PDT)
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
X-Inumbo-ID: 732b061a-4435-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721218182; x=1721822982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iOVi6fKunX1YBfm0wL2Rh7RNa8nyeNRbVQjVgqlAmgk=;
        b=FKDZKSF+HX3Ykldhfuwpe0oYp6Ew8zx8xOUBuL2rsqsjld4T6b4ujJtYcEQ7DAURl2
         Je5GQ69uKVQSNF5PU6H+abE9LPpeY8Q0Fiw1ZqiopPaRIUum+EYv4AcAaqVsCUwGmjlX
         btCiL+5sMmAqRscoMe615zqWgZhh8ndX/vTVmLNy0u6sywaudvhBbFHNYKHefk8bhw34
         9w2GHB/PVzq4ANfucJh5Wm/OpE/BCA+jf72Nz+RhQYPOnGTFII429Z+eWoPHCypg1pAb
         LojxZysy+1jb4qXleLtbW8w34TAdpqiEqjUGoSobxEYeD4hLG+3A2MCGfr7t7tDmC3Wv
         vWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721218182; x=1721822982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOVi6fKunX1YBfm0wL2Rh7RNa8nyeNRbVQjVgqlAmgk=;
        b=fxWb49akv/DfEFr5/v/a1x+ZCiaazuRHamk2xr5PHBOMj1eywPObqMRSgNbbyZV2wm
         nFDL5XQMePQDg2RbnUQWaoRm43/IR4raZqNXRXmod4DBmHcxUblWxPrihe8GaeeDtizE
         T/YCFb3K9/iQgPoAamn6E0uJCxtukKuY3TaXJUggL/eT0IOB2NngTQW0TPXFt53/uG44
         1Rkr4deDqlk4SpuJZAnVj67xsosN6EjQt93mNl6uLsnBVEwJR8xB4e+eLPa+vzNGtKTR
         kFpN0bfvg8m0NEHqD4kv7yJNTmEcbo5D+p9tUYmjtByoZKKmPkICvSfVC5jte4m6qS91
         eavQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64AUwL0BNbHKjifSY4+yMfQaj7vqxbiO1fgVvNgaPygHJyOodxKLtUQA+PJ5wa0xwgcxRXXDdECGQOFzP4PhvOWh3DMzWnWio4Eg/ZCE=
X-Gm-Message-State: AOJu0YyL82Mw5OS8fqOZGzUCtBM1f2wsOQ7/cV5/x8gaiO7j0FcxbPtB
	/jbrluEyJ9W7WW5Y4cUlflBx+PLprFjk3cEfEvjqIl65XykrgznSYl2vTdsbwQ==
X-Google-Smtp-Source: AGHT+IHYp5W8sYirAgksIuoSTP9UWHyitvhDGnxtPft6fPXgPOVqIC+Ncp68oYs8C73EYtP3+xz/+A==
X-Received: by 2002:a05:651c:481:b0:2ee:8cb5:6ed9 with SMTP id 38308e7fff4ca-2eefd14c200mr11676961fa.31.1721218182265;
        Wed, 17 Jul 2024 05:09:42 -0700 (PDT)
Message-ID: <872020ce-5530-4762-a0bb-86f8763a0793@suse.com>
Date: Wed, 17 Jul 2024 14:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] hvmloader: Use fastcall everywhere
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717111817.3517937-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240717111817.3517937-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 13:18, Andrew Cooper wrote:
> HVMLoader is a single freestanding 32bit program with no external
> dependencies.  Use the fastcall calling convetion (up to 3 parameters in
> registers rather than on the stack) globally, which is more efficient because
> of reducing the number of stack operations.
> 
> Some bloat-o-meter highligs are:
> 
>   add/remove: 0/0 grow/shrink: 3/118 up/down: 8/-3004 (-2996)
>   Function                                     old     new   delta
>   ...
>   hvmloader_acpi_build_tables                 1125     961    -164
>   acpi_build_tables                           1277    1081    -196
>   pci_setup                                   4756    4516    -240
>   construct_secondary_tables                  1689    1447    -242
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



