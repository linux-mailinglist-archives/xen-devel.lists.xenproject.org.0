Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C780E93EF16
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766332.1176822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLCR-0006Ja-77; Mon, 29 Jul 2024 07:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766332.1176822; Mon, 29 Jul 2024 07:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLCR-0006HM-46; Mon, 29 Jul 2024 07:53:43 +0000
Received: by outflank-mailman (input) for mailman id 766332;
 Mon, 29 Jul 2024 07:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYLCO-0005iE-VC
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:53:40 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab6aa6ef-4d7f-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 09:53:40 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso281656466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:53:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41616sm472995566b.137.2024.07.29.00.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 00:53:39 -0700 (PDT)
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
X-Inumbo-ID: ab6aa6ef-4d7f-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722239620; x=1722844420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=47XvnKvqGFz/PAE7vf8u+e1o2yMA+dKIiEZnU44Qdps=;
        b=ddkSZE2VbjbRMuzm1uwyv7Nx4Qgpc0n7bwbkQhNH1pA+yWacznTVQ8GtenAt3RPvVh
         E6Q9UG4Vu4tkWqw/dkkitJH1ZTGIPi7UMhfuWEfufwJQLK0WJjmap2vsq+htGa4QufCJ
         2hMBABmUSJbk21BXZKYva+dmurXraJFq8dOLxvAC0o7ka9/QmHqqVA/+KUncdXJUE2Z5
         9dduDM/ku++ojMj5B+AJ6+M+pqDrIztV2/oNNy/dku4uyb92+STWAsTBo+qXVDY3+n4g
         QpI+hPBz8BTBWTzuJ952tti4HAPgCmZ8p9zlC53tPKRANP8YFNlrsVJLVYTZIZN/nJOw
         SQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722239620; x=1722844420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47XvnKvqGFz/PAE7vf8u+e1o2yMA+dKIiEZnU44Qdps=;
        b=PyyQ5h+n0PJzE9DwPovOh6GU7FkfsIUFtr+au+JRn64FcCL79QcHdy9LNMkmI3x/YT
         mAsSR7VysftyHe/wmtECRhU54VkSgCPvD3R3aRZqPsW3nH9+MvvpuDRRsXICEVRa7id/
         KXkWcEvkZA2/uXKWg+EDEz/0fGJiPAQCoPnw4dSvf7RTubFvDOeZfsQEEAP5P1R3GnUi
         B6Ejg/Q+ta16wymY25VmFTBkiD1x+lFF69pmFsJ9kxlhboIiJu+VEWVuNR5R636YHWfJ
         myiG7/I3LdY35rLMg0XdhFFllKiQSFv5UWwXqdyDRlvUccUdt/CsW6igLcqlbgUhejwl
         VF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiMA8pK1fJNFviByjwVAVczRoUyG3ldDMF+wm9/xy2Qgg7SLoPnfe4MNMXzsA9Zj3VoHm731FjQP21j9ujO8qtP714Nao6DaA5OoHZDqY=
X-Gm-Message-State: AOJu0Yy15hwvX2EUWzwtgdKAGbOKVRm4hxXm0f6cqkHDboIKBmCfO/KF
	sem5V9RMRQAnkNSHayfSjaAc6XJf43Q5OwvVk8469gwoO4fFnxzULgGKkzUlGQ==
X-Google-Smtp-Source: AGHT+IGyiwwlOqM8OqDR0y/GOidQf/UsAAQQOhUV7XOw69mErpgzb+PKZlI6MTV3ufK42RA+uJo1RA==
X-Received: by 2002:a17:907:9720:b0:a7a:97ca:3056 with SMTP id a640c23a62f3a-a7d3fff8d5fmr501686566b.16.1722239619888;
        Mon, 29 Jul 2024 00:53:39 -0700 (PDT)
Message-ID: <c20c15af-a8c6-44af-a0b2-bf24c7d27f72@suse.com>
Date: Mon, 29 Jul 2024 09:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] x86/mm: rename l{1,2,3,4}e_read_atomic()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-3-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> There's no l{1,2,3,4}e_read() implementation, so drop the _atomic suffix from
> the read helpers.  This allows unifying the naming with the write helpers,
> which are also atomic but don't have the suffix already: l{1,2,3,4}e_write().
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



