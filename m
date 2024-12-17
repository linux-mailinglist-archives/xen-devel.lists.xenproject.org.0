Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7A9F5159
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859550.1271671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNahM-00014h-KY; Tue, 17 Dec 2024 16:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859550.1271671; Tue, 17 Dec 2024 16:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNahM-00013E-HZ; Tue, 17 Dec 2024 16:45:28 +0000
Received: by outflank-mailman (input) for mailman id 859550;
 Tue, 17 Dec 2024 16:45:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNahL-000138-D4
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:45:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50897f01-bc96-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:45:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so27547895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:45:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436362c654asm120175705e9.37.2024.12.17.08.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:45:24 -0800 (PST)
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
X-Inumbo-ID: 50897f01-bc96-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734453925; x=1735058725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KARgIs4hGluugSzQkm+g7woic7BzFqOEyx4oa2muXxo=;
        b=Bx7TWaR+GPbI6Hc/fQCPkfZRP45xbgXbicrQIaygo3dBJW1yLZ48EJhsyhrz+s604K
         6kAYhHwMYlD6rOFmGnu4J8SOw4bZwEFK+s+QJD5Y0yirl/YE8gIYns/QGck05wM8Pw+J
         Gyn0M2CS3dzIRNEVLMNQsp6Rf91Wrz0bCsXPs7GsZqVEyg4I5nmeO4J0L11/wV01at83
         7PW9IrmH88mUOdA6I3xvP/5JVp6bRL0Wd+OSzmdFqvyorKOHL8eX1Zj6vmc7lL+ERN//
         sNumzAkxCOy/jNnGxxjf111WjrnNW3GE1arDFI93CWLKW4DdYy1EL/5WuSpPC4VoHof7
         tz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453925; x=1735058725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KARgIs4hGluugSzQkm+g7woic7BzFqOEyx4oa2muXxo=;
        b=WzaoJAuAKzrpudQjcpB0Pz+XE/0rdzlH96dw1mjoF7gFpPj+iKkZ7WtODSZmQQX6oi
         MhWNyAZT7mpa5lMGQiLxxn62rv3hmqbpTD/Vl1t9FQ/FnbuYD9WRWOE67/CZKwg6B/by
         SREdYRsor+lI+1DqJxMxMNuASle9/XyStojFubbaHak+yKsVHEg+6oBB+MeNNgn3kO5K
         ap229fCugNrtp48AJ10+GR/AFu/zyp2QoTTADenlVaRacL1hHSaVgBP3i+43rZRlPam4
         Qv20r3Ac2OU/0DxTikXg/JtbDZSuwBAL7z23bipSHEZnzqL7n+ncnLSELb0U+gufOHlh
         WAMg==
X-Forwarded-Encrypted: i=1; AJvYcCWciO9UfwxK2xmyqv8YqPfymNI+m4NATvbmTWpyYgQykFO7XvLVWV17IfXv54sSTiCvssjtYAD8Zm8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ2ZEXDEfPtwqkWevhDeae/wmHX252L0uHjjFggmRqyNBh6W2K
	tCk7aPY7lJW+K4OmWwIQVv7YrtOQFQjdue7h4CTGwbV5H6rwIgsqycQYU6jIMw==
X-Gm-Gg: ASbGncuF5Syj9hJss5nLQQMIsXRpQJIpWDh+vmTq4kZOUpkf6gVWvvinglYgXOXV4zH
	LjG+iJYkOJc2RJD7NpevQW9PfqkQKK2jjx+IYwTMbw3LtJthAGiPvAPYXygow7NfagGZiJpF6kk
	mc8p0dFte884zzqMHiAExEcRh2dYyUWhDntaKFvL5aZvY9xlhiRYJCaJvUBMEPxcYw8TVKUfLhs
	h4gZEwPsRC5Dkhgio3JGWOx6ZuKbIboJhOQ4Yode8L++TqT9bofq0PVfwT21ms5Hddv6UfrLnCU
	qkEjrKZWYioy5ajK71L0NwanUHX0ZspsPyT/tTBMAQ==
X-Google-Smtp-Source: AGHT+IGlC2R85c2pP0Wun4nZ80vV7yxO1ZYHf53H4kBBanlcLPQlVDrpUeCRe4fLULp59AIFv9F/yw==
X-Received: by 2002:a05:6000:156f:b0:385:e328:890a with SMTP id ffacd0b85a97d-3888e0c0520mr15397962f8f.49.1734453924961;
        Tue, 17 Dec 2024 08:45:24 -0800 (PST)
Message-ID: <d18e6d0e-c3f5-4fec-849c-94a7edb8ae36@suse.com>
Date: Tue, 17 Dec 2024 17:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
 <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
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
In-Reply-To: <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 17:40, Andrew Cooper wrote:
> On 17/12/2024 4:24 pm, Nicola Vetrini wrote:
>> This extension name is missing from the current list of extension used
>> by Xen, therefore is must be added to that configuration in order to
>> avoid violations for MISRA C Rule 1.1.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Given CI is broken, I've put this in for testing:
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1592826906

If this was fixing an earlier commit, shouldn't it come with a Fixes: tag
anyway?

Jan

