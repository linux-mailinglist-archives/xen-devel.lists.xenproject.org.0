Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337359718CD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794362.1203233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd0m-0005SO-9R; Mon, 09 Sep 2024 11:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794362.1203233; Mon, 09 Sep 2024 11:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd0m-0005Q6-6f; Mon, 09 Sep 2024 11:56:52 +0000
Received: by outflank-mailman (input) for mailman id 794362;
 Mon, 09 Sep 2024 11:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snd0l-0005Q0-8b
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:56:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99035f94-6ea2-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:56:50 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c26a52cf82so1927490a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:56:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76ef0sm2929299a12.63.2024.09.09.04.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:56:49 -0700 (PDT)
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
X-Inumbo-ID: 99035f94-6ea2-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725883010; x=1726487810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yZI90BI5Ps2cCTZhnMhLfFqA1ML3W6SvG+RkE4vZLNY=;
        b=FOeMsBGAGiypFUODtwJxVUSTmyFL3728hIQqYwqQ3D3VdBYWfoonfIHWR3Sw+IPxFd
         qLsgTuxcWfNcvzdLfsUHg8627NIO2MzhZ9PIxQOvLO/ImYLEJQBTSf5aJ4CSLA68wUdl
         QidQy8p64zV/A4pKHOVz/KO1xcpU0Eh3tQZllKPTsOxRz/JSF67suPyXqPqdToKc55zY
         EwE1TL+KY9FO/fxPMOHkjyCCrNilK9GfGW3OCshURL66w+BKlRS8CPd0/fwZbuyB1HB6
         SfeDkZG7MJOmXTlIafgH5Zg9uucheypL3A10+TTDWwObqikUf9/4wcSCEnrXoglBcsAu
         8u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883010; x=1726487810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZI90BI5Ps2cCTZhnMhLfFqA1ML3W6SvG+RkE4vZLNY=;
        b=MqgstP3rc5S7RLO30IcZXKcQNS/KL35mEuZQhoWk6XhvkQ0iDUrVNjt4mmDH/0TuYs
         a78j2rw58/+VTNu9hrvI/PBRiomzGEdWkc9/gHwBxp+iyVS+NvdtnrmILXp3HfClRudi
         7tTDu1UIXZxPoSm6JhCOJj6R5xXxbIriTIxBJsoJxYUSIpjteWkvd4/cF2A2pDczrSNK
         0s543kTxJFJxwLurG4XFw3Uc67R94X4iRvRT0TV7bhFxeU84ZOt0ej8vtdU/WUvI7RAM
         pG6HJC41x5lWMia/IpOu7NQzn8AKloU1PcZ/qOSKXSrVI8uLT7gLRu2jeWAj4mJIDVJ1
         Y6dw==
X-Forwarded-Encrypted: i=1; AJvYcCV2/nETPd7wxngAJn39xP0R9Wix/9J4f1ZbkZLJCYu3V1ZgkWvC7mjBnW638dNUl+vqA89lO+82J7w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymOEVMGCZhtqcRAIIKsFRzzwVrQQQOa2d7/c8iz41drasq1WEN
	hAZyxj68JOrcTPG1/KVmLEwfspHqJNl9jKNe9GORnCNxnknQeH/I3x1wIpcx+Q==
X-Google-Smtp-Source: AGHT+IH/2Ir06Bw7/E/w04+JbAjDFdqES1MiwNCBKNj2qnvcJlGswOSsNaeivCHJ5DwaDAbX30Hucw==
X-Received: by 2002:a05:6402:34c3:b0:5c2:58fe:9304 with SMTP id 4fb4d7f45d1cf-5c3dc77b0a4mr9831253a12.1.1725883009749;
        Mon, 09 Sep 2024 04:56:49 -0700 (PDT)
Message-ID: <fcfa91e9-2a4f-4a00-8165-498ce3beba81@suse.com>
Date: Mon, 9 Sep 2024 13:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/build: Rework includes in genapic/probe.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
 <20240905220806.141300-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240905220806.141300-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.09.2024 00:08, Andrew Cooper wrote:
> probe.c includes a large number of headers which are unused, and not from
> churn so far as I can see in history.  Strip back to a reasonable set.
> 
> One complication is that genapic.h has to include xen/cpumask.h because
> there's no way to forward declare a cpumask_t.
> 
> Also strip trailing whitespace while adjusting the file.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



