Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03C95F027
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 13:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783427.1192762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siYFj-0002hL-JF; Mon, 26 Aug 2024 11:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783427.1192762; Mon, 26 Aug 2024 11:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siYFj-0002fC-GH; Mon, 26 Aug 2024 11:51:19 +0000
Received: by outflank-mailman (input) for mailman id 783427;
 Mon, 26 Aug 2024 11:51:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siYFi-0002f6-HL
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 11:51:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 803e286d-63a1-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 13:51:16 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5befd2f35bfso4812447a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 04:51:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c72a7sm5472141a12.65.2024.08.26.04.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 04:51:15 -0700 (PDT)
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
X-Inumbo-ID: 803e286d-63a1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724673076; x=1725277876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tEoNtuDoPj2LbGgBcFqpdvQuo13wzOJeXlgU+P3OSxo=;
        b=T4P+5gLR4Do8OtU1bMeirA2CV3f84iPyRcLGxSCE0K9Q8drEtT/9/M6THScuwgOdv9
         v+uGSG6kcgG3UkgnOOZ4s0u+TANAJtQ7j5YhPtzVBlf6sb1y/RJ9AUaDdf/bG1AGcyWc
         fMuDbNmi/w9FyfLRnIAfgIoWgRgOjvp5D/o9qbJNa/M5c3ht94wJT/Sy/MfyUZiRYZ9Y
         llIbC6cx8o8LRA6paXZNzSCfu/HEzgxI/Zvz35LxLX2SpjbLNTTwgxCaKRA2HbgBDfIX
         zvWpgQvYHdZjKmxACuq9SssH/LBzi0ekUMezYm2NYCiBfOVfNMWA+f4FG0+vyET/TxQa
         0dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724673076; x=1725277876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEoNtuDoPj2LbGgBcFqpdvQuo13wzOJeXlgU+P3OSxo=;
        b=D+uXGjY1JihdO+RhxL2/5smCjA1ivWJEdTQEyUrPPE+6g1opWtN8TC7IU4Z1+MewDW
         xbj+Pvbkhph7b0txkX/Y4F0Y84yZw9JcfYJBqLMccmDpfv2yOZkn/dBXl1+58BeblVk8
         8SehGLPzwtqpslTRNq7DrH2G9NMRorj1jSYkAXUFAfw5zmJM1SUyHoV2mt0viuyTmulo
         imtjj8ZLdw2s2T7fcTdOOLGLB8q8QGTxb91ViOw8LfWvao0U4CKNPZDdnTcPde/YKVht
         tPArxUUV5AgosSt7QSNL7GCQxo0uos+Aog20iL+HwxC6g0nK5gnLU1ETik8T98udo36N
         raDw==
X-Forwarded-Encrypted: i=1; AJvYcCV/8zmaUYhNpc7fOFPUqY3UaNvvM5D283ZtOA3Owsq7NidiznmQyTbbFLHThFjnyrrf0xupLXYkYxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZEa+vVQS4JAQARRXyJAL7LnqURAbtHNAo/oTE7wsCs5dnxcTJ
	NXrU0gYeFUDy77G5Y/ZJ3Eqpr/SvSbEjEib7qRJoycPlgF3rlj4T9n0/6ox2qg==
X-Google-Smtp-Source: AGHT+IEWx/inlVU2WwFL3xmWWyNsJdhcPxfpmxy89f7MqQSoHUZ8+bLMhwKFcCuvrgxbTOds2wYITA==
X-Received: by 2002:a05:6402:26c8:b0:5c0:a8cc:2cbe with SMTP id 4fb4d7f45d1cf-5c0a8cc2da3mr2469542a12.28.1724673075710;
        Mon, 26 Aug 2024 04:51:15 -0700 (PDT)
Message-ID: <37d43f0c-974d-4607-b629-a0546e1ddf83@suse.com>
Date: Mon, 26 Aug 2024 13:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] xen/bitops: Drop hweight_long() and use hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



