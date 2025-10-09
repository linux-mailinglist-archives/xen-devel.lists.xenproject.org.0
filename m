Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A9BC8343
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 11:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140409.1475304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6meb-0004zM-Ov; Thu, 09 Oct 2025 09:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140409.1475304; Thu, 09 Oct 2025 09:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6meb-0004yK-Kc; Thu, 09 Oct 2025 09:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1140409;
 Thu, 09 Oct 2025 09:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6mea-0004yE-AF
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 09:09:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae9e581d-a4ef-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 11:09:38 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so3671775e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 02:09:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46faf16abf6sm37954945e9.12.2025.10.09.02.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:09:37 -0700 (PDT)
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
X-Inumbo-ID: ae9e581d-a4ef-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760000978; x=1760605778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v9/Zkcqv2SvE5SKy83+xhxQFybJY5yxsugWKCnkpDC4=;
        b=ErldNZEx3s3+8qTacZdqnyK4sydinXW3jz1Ks2JVmIsZCC2MhdM0MJaAMtON8ZRKFM
         QN81Hod+vmBH5SMJ/UL29uo5uJKs1GKRlshyx+gwPxsPeiZ+t+6zFDNBh9BlGT9wvpPz
         cgx7mrt7c2yFXwAbyeq69CnitObFkiF17Fgp+Oeu3jhSqLO3HUKYTIngZL7x0v4apkLA
         n6XFAj8Qcy/AfL05aeh6QzZ9oj+TEo5VrWCX0RY7U3jsWLYW+nHckbnhk/fkdPB0JZ01
         a/xX9aq1fCdA/STzJ8cWMFdrEHYLyjBHHBLNxxVs7AveOLlhr5zYQkiFQ3GeYIWbV4dP
         9KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000978; x=1760605778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9/Zkcqv2SvE5SKy83+xhxQFybJY5yxsugWKCnkpDC4=;
        b=ZOVM6sjBECRezQ2EDbfSh88n1b2dIwB6/ttCkWrUjSkQrVfBJr4Z6b8SJZ3wir1IoS
         QRu3K5WfN+wUrZygP0Oy6EnlJmeZ2R7vO5shIZGbzrIwiHXA+Ij0NVFDystY4BEWHTsu
         pcxAVyMa1/t1krJGLv+3Qo5Ts2bqOaQAQwEQ81E3SgWg+AVwvXX+j2eHz9/ZwUxWvWXO
         hSuDJGHt98ajsnL1f5Gsin0esx/USwYJP67v/9RQda8RUbpX/9WXYn0BVUV4zkY1CDc6
         2uro0+m23aSP79yN7acffNtCzORBmPZKoNCHltJ6qkX48qfOolZhF6luBWsNJKGHsUxM
         pm2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUT1SkwcdJ9pNf/JVn1m/rpUbv1CUha7R9KH/OMeG9qmmy1538eUuWs6jibWt/1tNGYVTIrmXzRg3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEeuer9f4ODmnlWABktRtAdDeowwEUhr4Y5bvLR1YLrCKQc/OX
	IwjhZhOsbuWkEKKU5pYeQrpCL+NmuHic+lytKPaClyQbTnmPMC7WdO58az4XAirjMw==
X-Gm-Gg: ASbGnct8LuIeIjLNI3pXSJk+znbuOyeqXeMPVJWkpaOnlx2JrLV2oAILLMyktO67TNQ
	j7PR/J21blvTAHdGuPjZc/61mZ6l9AQv3TI6H7tZ4YqMqkC2+8DrIzSXPI0i5fM7+pgkIUuX+xV
	WCLN7S7/T91e1u2RNDQM8ldnj+9jc4WRs2ONHJC87TPoL3LrED1pCAaxF25+bbJKBTnDKXiQ175
	UglINpkPEMHiDIapTibzautQVG1q053LZVPLNt08qeAYobwbXebUNLKMii+qEmYBVZbdz3wi93R
	/hMMSO76w5Out3yZEtDFkuiKTiKMjqAcqz65jzoylvmldw9gshS7YOXREwrmpD3sKZu5pG5I9XR
	INFBSd2CX81+blkHF9vK3U31IWKOzfRqjVU4cfRTHtva/Ln6dvzGYnADDdRX8TzaWQKcLFKnB4q
	sjjqscCwRzux+2aExF6aXbB4Apoqy4t7O3GJSzenEkqw==
X-Google-Smtp-Source: AGHT+IHF3ZQb2bQOuvjhiQhVQZPGq4lzKHVk0V+awRKj4i5hejxVV0cs7n8NVVScpGr81uV6g05IfA==
X-Received: by 2002:a05:600c:1e8c:b0:468:7a5a:1494 with SMTP id 5b1f17b1804b1-46fa9a8ef84mr49947505e9.1.1760000977684;
        Thu, 09 Oct 2025 02:09:37 -0700 (PDT)
Message-ID: <6c4c89d5-cb17-4655-9c45-25cda9c4c6bb@suse.com>
Date: Thu, 9 Oct 2025 11:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/HWP: adjust feature_hdc's section annotation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2622f83a-e67b-479c-8027-5578eb066ff3@suse.com>
 <d445b2c2-0278-4ade-a14b-178a0ee0f5c5@citrix.com>
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
In-Reply-To: <d445b2c2-0278-4ade-a14b-178a0ee0f5c5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2025 11:07, Andrew Cooper wrote:
> On 09/10/2025 9:50 am, Jan Beulich wrote:
>> The variable can be cleared (set to false) by a non-init function's error
>> path (hwp_init_msrs()).
>>
>> Fixes: 99c4570f8209 ("cpufreq: Add Hardware P-State (HWP) driver")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> For 4.21, surely?

Definitely, forgot to tag it accordingly, but Cc-ed Oleksii be this reason.

Jan

