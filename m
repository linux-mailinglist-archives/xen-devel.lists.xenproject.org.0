Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4082BEA9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666738.1037579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEp0-0008Tt-O3; Fri, 12 Jan 2024 10:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666738.1037579; Fri, 12 Jan 2024 10:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEp0-0008SJ-LD; Fri, 12 Jan 2024 10:31:30 +0000
Received: by outflank-mailman (input) for mailman id 666738;
 Fri, 12 Jan 2024 10:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOEoy-0008SB-Ta
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:31:28 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda2be14-b135-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 11:31:26 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7ddd999bso7058103e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:31:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a056e0206c600b003607f777e2bsm855479ils.11.2024.01.12.02.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:31:26 -0800 (PST)
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
X-Inumbo-ID: bda2be14-b135-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705055486; x=1705660286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U+3cskQ2+69SDII5ZUMBhAh/Cftn4ngwadW9WtDiN4s=;
        b=VzjG2kNOUYlJRWe/mXfL1waF61ufcUXIZIHAce7U/5hLMJkqEVzqjKbDo1aIaWDfQ3
         7nLhfyVe/qsWVfWxsQLiPF+TfCzLwOLGPq4dgHPEQZRpqJRgX4FXn/YPCSXx29ZaEikZ
         UgHKDJj9EiR6ybK0U3EHq6h3ZzuaFCfeNpK18E5gMosjSyskghMhNjhX+jQI2y/qp7Ob
         P0kLpDhluw/wC7d4POG9j1b2m6crTjYiaI5oAXTyLMvYVIyaIiYeOMd0Ew/Rp9PFaMw3
         StSHL1KemLU1xLpAYT1DIMs1ljyd3rDwhVxvIW3NGg0XJVTV29PKqMyCm2bxCmROZs9t
         lxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055486; x=1705660286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+3cskQ2+69SDII5ZUMBhAh/Cftn4ngwadW9WtDiN4s=;
        b=dIlybFMFr0R0uZAL1GRftZKgZb+VcrhtvdjItcpvvoia/CWDEmvxo34DDvShnUvtt1
         9ylkE58pfld/Ndz82FzY0/oScck5suuWu1PIkLn+Y4G5T9TrHgaiWWpg2Hu9QbjQUwNO
         UBsuUUHZAAVj03mE7rMNHK0Dw8QfwSYDxU8wEgF1y8s2KYw1xRcp8OK3JVAbyDW803gx
         zkFwpwPuOlJrvzR8RaPiKHujAW93cCo9IqDjo1XZKisDjIWPHtIOzKgH/J0psHnEtCpG
         aAHCNdR5/nKMDRggfQaXQfN7a1XmEiZA8lBBSVMXVhF4cupuXqFesPCPEyyKQonuXRVT
         Ie0A==
X-Gm-Message-State: AOJu0YzL1Om1mpJS5rEDZJCImBHs2v/cHho8/3yiV7/z/OG9Tm8PQJ14
	j6YFc61ilcSfhvkXEYcaNzCNRD+MgieKyW2kL2wIPXPaCg==
X-Google-Smtp-Source: AGHT+IFSYfql2BB1rQA3a3/Kin76KP3kCPvyydSdKIB3ZhMaoudnMcQQRiy5uI0XhD84uzij/PpHXw==
X-Received: by 2002:a05:6512:282b:b0:50e:cd02:b537 with SMTP id cf43-20020a056512282b00b0050ecd02b537mr544945lfb.11.1705055486413;
        Fri, 12 Jan 2024 02:31:26 -0800 (PST)
Message-ID: <3300034e-f761-48ac-ad9c-cbbcbb768d58@suse.com>
Date: Fri, 12 Jan 2024 11:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1-alt] xen/livepatch: Make check_for_livepatch_work()
 faster in the common case
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
 <20240111201129.4010175-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240111201129.4010175-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 21:11, Andrew Cooper wrote:
> When livepatching is enabled, this function is used all the time.  Really do
> check the fastpath first, and annotate it likely() as this is the right answer
> 100% of the time (to many significant figures).  This cuts out 3 pointer
> dereferences in the "nothing to do path".
> 
> However, GCC still needs some help to persuade it not to set the full stack
> frame (6 spilled registers, 3 slots of locals) even on the fastpath.
> 
> Create a new check_for_livepatch_work() with the fastpath only, and make the
> "new" do_livepatch_work() noinline.  This causes the fastpath to need no stack
> frame, making it faster still.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



