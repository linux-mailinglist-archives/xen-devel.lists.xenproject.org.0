Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40060877B77
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 08:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691215.1076938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaQh-0003F8-EP; Mon, 11 Mar 2024 07:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691215.1076938; Mon, 11 Mar 2024 07:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjaQh-0003DV-AX; Mon, 11 Mar 2024 07:50:39 +0000
Received: by outflank-mailman (input) for mailman id 691215;
 Mon, 11 Mar 2024 07:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjaQg-0003DP-Ge
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 07:50:38 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bde9c53-df7c-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 08:50:36 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso3509303a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 00:50:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bm24-20020a0564020b1800b005682f8b62a6sm2630131edb.97.2024.03.11.00.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:50:35 -0700 (PDT)
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
X-Inumbo-ID: 0bde9c53-df7c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710143436; x=1710748236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=heOoF6FxPXs5QfTjJ0UPeg4ZxggrXWoqaBJ8pkjzs4o=;
        b=TlQ94GfMpz2B5zGoTCaGjftZ8fqeB7VKMWc0Nk8Yd8rmCl/sKsl6GLByhVXqu4swV/
         bFZMpCcJPMjcXGAbFzhfsbY5665ZDpPkPAa2bRx9YfcNFQDRwMBmmluBWC4ESi5lew/O
         dT3E6JOMq6/7EnykMAwAg/qwe8n2I4+Z0OjRsNa9MfzHUwkfsLodC+JySsE+PmpRZzfv
         +iofQB1qIXeJbxmzRjANbaotfNI/WZ4tMffSKU1H9XeGq5Xwv0u18vHmE5Ixdhy277eI
         p/MwlnzP1WrKRahVI1RCGnROZL0RY9fM6nUagpIjy89zAm7atoWIZ5JtdsPxnm9mZO0G
         ds2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710143436; x=1710748236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heOoF6FxPXs5QfTjJ0UPeg4ZxggrXWoqaBJ8pkjzs4o=;
        b=wHqPIGiVyiekn3ZgiF8ls2j24MDEGsJp3kDjA9/ikA3ajQ/ZFcZIlUshcu2u7F0M6E
         X8KSn5DZifRTR7ZAm4VxijieGu1gBzj95ktDhSFEtzCIiz/fnNwBK85HQqIpIL5ZpMRo
         wsUnSj0iU0MJhmgJcGY96m7D+4zk6cJTTHK70K+G/8vGTLq2jB8hi+giELjjHCmdlqDv
         KnKZvzQI4+0NLuuLbEbpgbsSv9P1r1jzGu3K400i0UJpG+v8SxA2CPExJYKfYGkS3U32
         WQ3evmVT864VVsA1qwKiJcXbIfQcxiuPM+zCRIDmA2mkzzhvNT5fS91javr6BRQJYWIE
         J0eg==
X-Gm-Message-State: AOJu0Yzw5dU2HGDT+n+Xf1vbz4R1pIVPUYxiOUd0SuIL7xqUnMnoY4Sn
	21vzYmW7T9B2eJ4shuw6d8AnDjmm0G0acuK8VPSEmQLwpKVh5rtz/aPIHZyB6A==
X-Google-Smtp-Source: AGHT+IGL8ovGi+HY4xGYzYTRNd5gLrld9lXPXG9R1mMykyhL22NTuOACuk/gAvk1NQXL3EoiqobWGw==
X-Received: by 2002:a50:d59c:0:b0:568:1c64:277c with SMTP id v28-20020a50d59c000000b005681c64277cmr4108140edi.15.1710143435959;
        Mon, 11 Mar 2024 00:50:35 -0700 (PDT)
Message-ID: <2a676fc3-ce69-4943-9c40-66056d5503da@suse.com>
Date: Mon, 11 Mar 2024 08:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 6/7] x86/irq: parenthesize negative constants
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
 <9b7e9135952e51043427e3233305917126c95659.1709896401.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2403081754160.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403081754160.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.03.2024 02:54, Stefano Stabellini wrote:
> On Fri, 8 Mar 2024, Nicola Vetrini wrote:
>> These constants are parenthesized to avoid them from
>> possibly influencing the semantics of the constructs where it is used,
>> especially inside macros invocations.
>>
>> This also resolves some violations of MISRA C Rule 20.7
>> ("Expressions resulting from the expansion of macro parameters shall
>> be enclosed in parentheses").
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


