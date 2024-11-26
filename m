Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4689D9273
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 08:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843374.1258989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFq0Z-0004rg-2k; Tue, 26 Nov 2024 07:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843374.1258989; Tue, 26 Nov 2024 07:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFq0Y-0004oh-W5; Tue, 26 Nov 2024 07:29:14 +0000
Received: by outflank-mailman (input) for mailman id 843374;
 Tue, 26 Nov 2024 07:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFq0X-0004oL-DR
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 07:29:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ad0547-abc8-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 08:29:10 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4349cc45219so20569135e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 23:29:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6723sm12578240f8f.16.2024.11.25.23.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 23:29:09 -0800 (PST)
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
X-Inumbo-ID: 20ad0547-abc8-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIwYWQwNTQ3LWFiYzgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjA2MTUwLjM4Mjg4LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732606150; x=1733210950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QyiUH4G3ChJbqNvplGVO/K9BWhi6KFqfYJ1oyCM3nYc=;
        b=f5/wWulHAHrRkM46S8nDT4IfjS/AP24uJAk42ybeFbUqJPpj24hJMmbUkYzGFYZo07
         KpmHkPjoP5F6+vHf0OSI2qvvKHV5x2iwED6C99Ox+o6RyEueqM5AppCDAKECw50lNsUd
         5mUhmt31FTZzuEDvMqpaTcega8km5Li3j4UdmDpJbXpUcrphR75PCQGc+Uhfy/Vv1UC1
         EhAxFr8l+VONMbeOxsroBV4CnbEKtA8VRVJETiagfmbm93jDhEdYPGIIZiJQClXkPq6b
         pZ4Ma4lvYfisb3R3oM+f4FrVuIHxil+3k3zCpEupP7b3hyU7ZHLMh8VhJbtrl9hdyWv3
         O0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732606150; x=1733210950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyiUH4G3ChJbqNvplGVO/K9BWhi6KFqfYJ1oyCM3nYc=;
        b=DVSqwEdEW9EETLaO9cC0rTTOZhq7pD6pW2LVjgRlHmOWeD8/GQodPkELaEUo6BzVu3
         uAK9RNLgfICxSZIkrQpVVTdSPRpKJeCcgnBuWZPW2J/H1eMhY2qGEappAtbissrV3KJy
         EJh+CGsHKpe6udnhvVwO0N+oy7km1XBLsDZocyQd0mpkcQRsGjK70GJA5lyhGYpFeFuX
         08wEaIV5HxJEyPmLkhDzpgKfUBbd6Ha57HhVORGeUVM6oi8T7nOJbmx34he/SzgUcem+
         95ssajmbNrn2Bm0lXQe0DCoVjBMfIWvPRrbwI96OX9HUpSoD24jk/5PVK13ADluZqLFc
         C8KA==
X-Gm-Message-State: AOJu0Yz7s5Emo6Jny+cNIVo9+caOY+sA00KFf0vLA2HQhBjaLVVvZPDx
	NiF1YiOK1QtRe09SkAuU8MC96irQc++OSODIq+NPijTviCBqlCB+12uuc/IcaQ==
X-Gm-Gg: ASbGncuUGsyqM9o377OoVcihnE0f+sqDMY+t7/BpGRlQZyfUgEY8InuqByB02h8V0rZ
	cqn0/t7NmeMyfWYKbNMzigMoUcvsJ9yHwqygRLDdCkb5t1Tw4/3Y5gL9WddpbuFm+ndQSgMFTap
	4qZvY9XXh4MdYJIJN4IZOSLs57Dwwz80cN1YABBKeQmx82yzFrK7mz405dMSTHJb1h5XI97avy2
	Zfs71SPZo9wRzGxR48O+goFqua6GHPFn6Bc50bfenIG4ZiWGAe6i1w7kS5M0x5cQHjnU9dYBQN0
	2hI/gEMGg76tPKTEGdhxLccFwk2TIGHeL+Q=
X-Google-Smtp-Source: AGHT+IHNh3FofcGINtO5irp3GQZzWPQWrx0mOdfGiWpob/XU0fca/2n4veaTHLbNIqJVLEJUOkPxpw==
X-Received: by 2002:a05:6000:18ae:b0:382:46d2:52ae with SMTP id ffacd0b85a97d-38260b589e0mr15355179f8f.21.1732606149668;
        Mon, 25 Nov 2024 23:29:09 -0800 (PST)
Message-ID: <8a810323-5cfc-4072-a7d4-dbeb2fc41879@suse.com>
Date: Tue, 26 Nov 2024 08:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] libxl/ACPI: bound RSDP allocation
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <7455ff48-4bbc-465c-baff-d5c0ff684dfd@suse.com>
 <e995156e-c84a-426f-8d20-bebc8ccb3961@suse.com> <Z0SuMDXVzrf4OHpQ@l14>
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
In-Reply-To: <Z0SuMDXVzrf4OHpQ@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 18:04, Anthony PERARD wrote:
> On Mon, Nov 25, 2024 at 04:15:49PM +0100, Jan Beulich wrote:
>> First instroduce a manifest constant, to avoid open-coding 64 in several
>> places. Then use this constant to bound the allocation.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Hopefully, `struct acpi_20_rsdp` isn't going to be bigger that 64, but
> it would probably not work well anyway seen how `config.rsdp` is used
> here.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

>> ---
>> Similarly bounding the info "page" allocation would be nice, but would
>> require knowing libacpi's struct acpi_info size here.
> 
> Or register the allocation size in `config`, so acpi_build_tables() can
> check if there's enough space. Something like `config.info_size`.

That would feel kind of backwards. It should be libacpi to specify the
size it needs, yet that won't work as libacpi is the consumer of the
config struct. We could of course add acpi_get_info_size() to libacpi,
for libxl to use. 

Jan

