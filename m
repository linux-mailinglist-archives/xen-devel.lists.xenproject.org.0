Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25187BCDF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 13:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693186.1080917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkH8-0006Xb-O2; Thu, 14 Mar 2024 12:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693186.1080917; Thu, 14 Mar 2024 12:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkH8-0006Ve-Km; Thu, 14 Mar 2024 12:33:34 +0000
Received: by outflank-mailman (input) for mailman id 693186;
 Thu, 14 Mar 2024 12:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkkH7-0006VY-AZ
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 12:33:33 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1127d7e6-e1ff-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 13:33:31 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a44665605f3so92273866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 05:33:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jt12-20020a170906dfcc00b00a465f570dcesm680689ejc.144.2024.03.14.05.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 05:33:30 -0700 (PDT)
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
X-Inumbo-ID: 1127d7e6-e1ff-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710419611; x=1711024411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMsj3FylCP7oKPcU/EF8ndE36MTZCLB4/juuFmblABs=;
        b=GMMsf47CwMNxRhPWIHxBl4BClggmblX6xFEJNpvykF7gUbD2G0VNZDUZirm/aELQL/
         rs3ndWix31IMI6TI+J3xWNA3YW1s3jmHLe7nz4p4xJK0E3qQrW1Q+A95MDmxkPG5scKo
         KODcnpuS31GYlH7YV0vZ2tah6NcbeCIriRVYnv+5ITnMYu9aPMZcPFXVbGFPgc2vUnyM
         F3AFlWaZDNwJtbkd9mcj3SbDjkcIEg/IB7XDURz0PiooFMjZPvxTH9LzjI6H41LDwzDy
         Q/UiObL8JOGbsyrY7KB97IpI9Umn/oPUneJbjHFLHJreeHnfJ9Yh+bI9heItPKGODjQD
         wbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710419611; x=1711024411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMsj3FylCP7oKPcU/EF8ndE36MTZCLB4/juuFmblABs=;
        b=Lw+Bbm81sbP/Denx4/fK1f+pdzDpal9XwAQ0xTYe7v/L0Htc3TxbChUUmGcRI9DBhU
         BBEvmSGtq6UB12rSbepOJZtHc2huFBsMmj9YOWDCnIzSoAtCKlYnW9FjSwupp/XzmTKg
         0g3aFk341wO0byxbrIjZ1cms9JuLixJIJ2THngsBHHG83ZJchim9dbjtzv1svvYV5XsJ
         Q0sUmbABWb/OymQoblCcp/ldHtnLa2jzP8MoSzP2z6B1ARVrVCfeyuAe6fd4mPkooTlG
         ECDT7CGsdrslffJdb0x7JVRawDVb4/6gMC+Z2jtJ7MUG3EmNBKZ67pTmS58I3zcZnrsC
         h1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVK5jkwPD6kkkqaTzRm+StaAqoOS8oAMY1xYeDxZvst3W6lPHvAbTA+PDtAiTn3TAvUnsjy5QfCuctUem92q49ls9Sr6sXahTo+kgwlxkQ=
X-Gm-Message-State: AOJu0YxkC4BUeynwrDo63tE5ju+6fot/bAafkDVTCR2Bd64s0rJ3tDGT
	zWCAWdZlL/2yJ1sfl4q0uu/vXF7rTxzpUvvRIxwd2Y81tvouRRHJ2S8/jfGfiA==
X-Google-Smtp-Source: AGHT+IHlBshpT5wwt9H9QyXHl7jS/FBPdtn8H6tl8IxX/K/AcevIK/rm8nI2qSx6+GUCE6suOiq/JQ==
X-Received: by 2002:a17:906:1d1a:b0:a45:22e2:bd6 with SMTP id n26-20020a1709061d1a00b00a4522e20bd6mr362732ejh.23.1710419611175;
        Thu, 14 Mar 2024 05:33:31 -0700 (PDT)
Message-ID: <617f4e55-4b7c-424a-b545-ce117bb264fb@suse.com>
Date: Thu, 14 Mar 2024 13:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] perfc: add pseudo-keyword fallthrough
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <47eb1f8316672af172d9c34bfa6e7dda6bd7ce37.1710403601.git.federico.serafini@bugseng.com>
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
In-Reply-To: <47eb1f8316672af172d9c34bfa6e7dda6bd7ce37.1710403601.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 13:25, Federico Serafini wrote:
> Add pseudo-keyword fallthrough to make explicit the intention of the
> code and meet requirements to deviate MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



