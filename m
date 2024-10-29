Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98E9B43EC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827090.1241572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hMX-0001PE-OP; Tue, 29 Oct 2024 08:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827090.1241572; Tue, 29 Oct 2024 08:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hMX-0001N8-LK; Tue, 29 Oct 2024 08:14:01 +0000
Received: by outflank-mailman (input) for mailman id 827090;
 Tue, 29 Oct 2024 08:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hMV-0001N1-Ew
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:13:59 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bebd64b8-95cd-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:13:57 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so53489045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:13:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3c7b9sm11740510f8f.32.2024.10.29.01.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:13:56 -0700 (PDT)
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
X-Inumbo-ID: bebd64b8-95cd-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730189637; x=1730794437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IEogidPCVBegSFGjR8C0CerxrkTSHig/HI9uV5sNcGo=;
        b=QQzOjbrhd/i3/LzpCWGb+VR85mKGq0WYZ1TguNDSr6bIFxuhLGFNwElscQfGoHvDiD
         BR702DwMDHzPzyNDJz3yhZmk7/PPn9YocXlChyG483seevTTxe4Zq3eSfFKwozvLd00E
         8B0T8oeJ/yFhF7wfGecNlPtLQyRNVXGY04p1IUD4THwxFnutpTP1/V39weBuiXr39dVc
         aCYWOH+oRF58VUo6pRChjeFpiu/9vY25Pcp46weAULjenZMeag3Yy8TOUhBgUcPf6Vib
         wNse6rrfhgmZmoo2lbAsBwg7Dw7FBUctPVom7P+fDjN8wFHd8fr3n+qbcVCajhqtKJa1
         UWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189637; x=1730794437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEogidPCVBegSFGjR8C0CerxrkTSHig/HI9uV5sNcGo=;
        b=bD3Wz/Wjy0OBTEHiTlf93KBrkex4qAppek57PO+KfKDGEqxetgh7t3qJBbHb+XN3on
         gUTLTuXjBiFVqLbfAZrI//NVg1LZH2YUEL6fBg2sqwel9jdhdcUQsMOSqO0XmIZ5EhVe
         QJTnT5e59xRpdv8EymBFDEuU3SJvutWPdiXoX2nI+eM1cD78yRvAHw+mxCgMqkwCOrUF
         OOu7nSNeHyhQSgu9MfAbV5SvYy3WUUofczMqOKrW+60ehx55erfrMh6TaSiEkBzYw4L6
         yitd8gwX2u8OYcwEOLL/H+R8eoOPMX/POHoRrpW/caPo6I4GMBGyQXhLfP9zOnqz3O7R
         /exw==
X-Forwarded-Encrypted: i=1; AJvYcCVmVLwDtXN/6mXlTc2NNX1V+mJ11aVgW5aU4VVZXxRqSDqIfpbg4WsbqMbOhkzuCbDN5uWYcIr5wTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0eYY/2e/7C/vimRbDBROaHyph0udpC68dEBjTVgLxU0rNwlk9
	Rpu5ABrfrauspvG+3W8ZkSp6FyMeWPTQOP+0xgP0VP0G6t/NPKmx0e4VskApXg==
X-Google-Smtp-Source: AGHT+IGJkQXuS9Z8WCQOmkjSqnQCgIGGH8np8FYl9Im/x9AgtCVR9OGEqZj5oeVEMuPK1tetvkVVEg==
X-Received: by 2002:a05:600c:4fcb:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-4319ac9c15fmr82013185e9.11.1730189636783;
        Tue, 29 Oct 2024 01:13:56 -0700 (PDT)
Message-ID: <7027a24e-3213-48c5-8027-24dcf1df55ac@suse.com>
Date: Tue, 29 Oct 2024 09:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] x86/xstate: Update stale assertions in
 fpu_x{rstor,save}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-2-alejandro.vallejo@cloud.com>
 <fdc89027-d33c-40f5-93f9-b8d7e880e732@citrix.com>
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
In-Reply-To: <fdc89027-d33c-40f5-93f9-b8d7e880e732@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2024 18:16, Andrew Cooper wrote:
> On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
>> The asserts' intent was to establish whether the xsave instruction was
>> usable or not, which at the time was strictly given by the presence of
>> the xsave area. After edb48e76458b("x86/fpu: Combine fpu_ctxt and
>> xsave_area in arch_vcpu"), that area is always present a more relevant
>> assert is that the host supports XSAVE.
>>
>> Fixes: edb48e76458b("x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu")
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> I'd also be ok with removing the assertions altogether. They serve very
>> little purpose there after the merge of xsave and fpu_ctxt.
> 
> I'd be fine with dropping them.

+1

Jan

>  If they're violated, the use of
> XSAVE/XRSTOR immediately afterwards will be fatal too.
> 
> ~Andrew


