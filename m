Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A44853408
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679996.1057793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuIu-0004q2-Vv; Tue, 13 Feb 2024 15:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679996.1057793; Tue, 13 Feb 2024 15:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuIu-0004nI-SJ; Tue, 13 Feb 2024 15:02:36 +0000
Received: by outflank-mailman (input) for mailman id 679996;
 Tue, 13 Feb 2024 15:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZuIs-0004n9-Tg
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:02:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea04e00b-ca80-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:02:32 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33ce32ae879so82325f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:02:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d6d81000000b0033cda3d3916sm1727871wrs.88.2024.02.13.07.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:02:31 -0800 (PST)
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
X-Inumbo-ID: ea04e00b-ca80-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707836552; x=1708441352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+yKBwC79Wsd4Nq9xIpwBQRWZaPPy5YuOEJdJjpWzNk=;
        b=gPD6R2w8ittZhhNymNhgzO326nmrPozThTbWMuvI8C0aI4cKm8o3cMWvvNsX4TdZ60
         djxblONsm9C9X4eUBINrhGiS5zzS46NytSK+xjCXtroGonaci9zAySUpOUB0uEIzbmMD
         yweQcdXo7/VDyFds5yz29sHNv6uqVclLI2OM7kQATIBt/IqH+UIl6ATCMAmaZuAJnqEg
         1ekQBbfaHt+nTvDZtFS2+RVIe9erAs2U6rsyRuvMtP+ba9v93sSqRnoms/GG91pplr1p
         1HWNvTTP/RIdesOpkLPecRgeEAjWnpnYVceyVrXjcawKozdILxyNJ8ZLWu/CdKwj3EtS
         +r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836552; x=1708441352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+yKBwC79Wsd4Nq9xIpwBQRWZaPPy5YuOEJdJjpWzNk=;
        b=nQjklxiv3VYf/URTGxnnQMX17K3PCq98D/Oh2V8cZKbxfE/wQodamNf6cVm35LJBCx
         Avacx4EPrYd6g6uCEHUGKFOC0r2NRJLP9jyKCPExb1Oa7j4Y/Mb6LGOzYZOwj6m/jbyy
         l3/pLPN4yNTvdltjM3h/1o04EUWTW9S4R6Ug5KryXeCYCSTKIfZEykdOW+f4Z3dHk23X
         jNqdIjAsTtby/qbb0mUK1yjy0kOZtYBosTn7+aRxPSzLKTFgYgf6VDM7WYhQ/DAzK7Dg
         ahWrpQ2Q9/yeV78l1TfKWVNx8mOoa91/WU6P52tozcrKHTGw+y0N5A9Sv0nm2giOPN7x
         ZvGg==
X-Forwarded-Encrypted: i=1; AJvYcCVcQuK7d3enRAznYYpAGDgwkX0XjW7FWL8kAJdSLT9irpYKQUsAQghjoAi2Lg42KvZHyq54xGTjmHziwr2fjMCk235JTHBBEYH+aaiICGM=
X-Gm-Message-State: AOJu0YwIm35u6cjp+XdK+JKqBHHvQyxW0EEL3v5yAjcEoFwiR4VoUJ4O
	KdarIby8Y61gN4Nx22/YWzh1ES2dym+rqilvFb9a9YuRfZ46a6M0H8y1+Qv7ig==
X-Google-Smtp-Source: AGHT+IEmlnyAJCXKGOvzygehvDKS7rR0AXLgBYen2u5eslRQx1i/Sxx+1+jxvyGdRg/juA+bGoItEg==
X-Received: by 2002:a5d:5688:0:b0:33b:649a:19f7 with SMTP id f8-20020a5d5688000000b0033b649a19f7mr7111439wrv.53.1707836552232;
        Tue, 13 Feb 2024 07:02:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViPa1Hye7AdFJt48+9JuK6B+V6AzACWBaBkYQcygSAOFQC6muvtI5W+RWMuL9PUwa0VWz/bU9bsozUimUNobZwPVn2YMpNORSaWBCuv2y8KRdDqCXHOrBEPEWq4Fk8XapeC0QwdUsuBhSVQX6X/7ItGHdCpDmozia3ng==
Message-ID: <34bfa65b-5537-4bd3-a017-c9a3b01fb331@suse.com>
Date: Tue, 13 Feb 2024 16:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <4ced67935b2e1a2fc79ccda7624c0849bea6cd87.1707836102.git.w1benny@gmail.com>
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
In-Reply-To: <4ced67935b2e1a2fc79ccda7624c0849bea6cd87.1707836102.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 15:56, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> It's located in libxl_domain_build_info, not libxl_domain_create_info.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Any reason you didn't also add the Fixes: tag that Anthony suggested
to put there (for me to recognize that this may need backporting;
didn't check yet when that earlier commit went in)?

Jan

