Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F33296E9A7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 08:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791551.1201435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smS2k-0003oR-VJ; Fri, 06 Sep 2024 06:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791551.1201435; Fri, 06 Sep 2024 06:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smS2k-0003m0-SR; Fri, 06 Sep 2024 06:02:02 +0000
Received: by outflank-mailman (input) for mailman id 791551;
 Fri, 06 Sep 2024 06:02:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smS2j-0003lu-TX
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 06:02:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885e780d-6c15-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 08:02:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso230677666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 23:02:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a9019a3e6sm27536366b.45.2024.09.05.23.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 23:02:00 -0700 (PDT)
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
X-Inumbo-ID: 885e780d-6c15-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725602520; x=1726207320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxr6MoTt5oRqnxJB3TwT8+RGow391HdxTu4/DV4LszY=;
        b=BNMoAlLkRE4Fs/bm74coiaGRzpHC2Zx34GPS/uU5LfSo7sStBog28M2NtttLgpzrOE
         O6yrW9K1KQYnMWbikdVtRiTfnYN9cwDZnMjK8dQIj6cho7ifk5D14lHKINGPAyTES9rQ
         6qUAuebZla85cjGxu0GfVL6z2VpZSz8b2bmBVFNceWc0ouy4BcaRk/MirUDvw3LNZ10f
         X+YDPnHZsV+34KAyOwuIbgRHxBJaiwZfWar/FArqfIvzWWNqn1FMiqukd0Azjh8zei0/
         rtCko1pTPa670KBYj0b9rxp5UXMjqkZPRgWAaW3NrXX1MnxyrJJJKxWqYPEV2alodpbk
         B7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725602520; x=1726207320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxr6MoTt5oRqnxJB3TwT8+RGow391HdxTu4/DV4LszY=;
        b=ETOHs2JSOmj+YvTLKMgDlLp4NzQQaduXE6WUtDylXgKUYMbik/gJmMNK5yjFMHtnzr
         F0q7V2Nj9LIoKtz5EYS4pLhSTVFj5miN5wy9yTbMEtQ0XUb0Vwb0CWbIJsgQ3WQJOp4R
         B63o36mSuRjKTfAW24Du2ik6jSfUeo2bRLgKH42qfYDdXzSW1o6PTaXIW2VyliEerTmz
         YQOHRd5PQTm3r9tUImYm8BsNxL9kQAjcZQlbZ8jpMDbjyPrbEA55VLHjUke0f8KsvW3N
         g85V0mM64qOrWu9vFYHrdhsUqa7HrzDLYVUCgwyraJp2HMJi2VTn5G51IDK1fo/nZESP
         bjhA==
X-Forwarded-Encrypted: i=1; AJvYcCWrot6C8LQnWogPSyb8v3BtzB+82uOZMywgZqCCkHD85QTAISkv/FkwpytZZjNzvYMx4ig3ImhNhCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpwncHKuudqtrbGmS3U8ws4YrRhhKtvDx8RfgMmhfzTjODwkm3
	ktAFDboCxgHoiE3p7IF+YbuK49LAiH8rqWgElqe8Qr+ym1ScFENPms9OsSI3Hg==
X-Google-Smtp-Source: AGHT+IHdqTskvmafY81Uy55nIqgv8X/YRM1PoE7kRrs5F+3cetTl8CcNbMUkaZoicj2JkzWK4kPFrA==
X-Received: by 2002:a17:907:9702:b0:a7a:9144:e23b with SMTP id a640c23a62f3a-a897f8364demr2040137566b.19.1725602520396;
        Thu, 05 Sep 2024 23:02:00 -0700 (PDT)
Message-ID: <a965943c-45f6-49d2-8638-6fea0a20c270@suse.com>
Date: Fri, 6 Sep 2024 08:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ping] Re: [PATCH 2/3] xen/ppc: Adjust ppc64_defconfig
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
 <20240621201928.319293-3-andrew.cooper3@citrix.com>
 <418f7868-325b-4f6b-8d79-0882eaea4fd9@citrix.com>
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
In-Reply-To: <418f7868-325b-4f6b-8d79-0882eaea4fd9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 23:54, Andrew Cooper wrote:
> On 21/06/2024 9:19 pm, Andrew Cooper wrote:
>> All of CONFIG_SCHED_*, and CONFIG_HYPFS build fine.
>>
>> Add a stub for share_xen_page_with_guest(), which is all that is necessary to
>> make CONFIG_TRACEBUFFER build.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



