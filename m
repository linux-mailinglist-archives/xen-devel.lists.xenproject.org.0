Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023E9F30BC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857978.1270185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNAQV-0007Qm-Mx; Mon, 16 Dec 2024 12:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857978.1270185; Mon, 16 Dec 2024 12:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNAQV-0007Nf-K7; Mon, 16 Dec 2024 12:42:19 +0000
Received: by outflank-mailman (input) for mailman id 857978;
 Mon, 16 Dec 2024 12:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNAQU-0007NZ-Gm
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:42:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e5e740e-bbab-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:42:16 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862a921123so3106133f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:42:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a8a5sm8068473f8f.48.2024.12.16.04.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 04:42:15 -0800 (PST)
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
X-Inumbo-ID: 2e5e740e-bbab-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734352936; x=1734957736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ge9+7Zj3HbDDcjUkuO+cmUsX/JU+tFta7a3FCl7OTU=;
        b=VvHqZyoBCYomcDOC3IZOoVs3mn/hYtaQHzTEwYEzIw+qfN+Il1uPW3RJyruf/TKT44
         qJxGFh087B/wNT+8tpwXEca2uYUisWLD0B3NpSjUH5OCmM2+aZOx1wH5QLvLK28BPjd9
         SEysaUBzQtxT/ajxKfkRDLvc5YGGeYby8JX3H+l8M4yvxFCRSNU5MZfd9EAMdoarzwV1
         CrVx7B6yvUS8OgOL5634uuFN7dPq/cJIQetKRLrICG59ljVaN+5y7kC4Pz2SddFfpAWU
         02ZYydTVKPwopynzATdJyKGb+QWFV7TVQ1hbHfn3jiaksA6/j3C4U/qoffHApbS7Fehg
         J4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734352936; x=1734957736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ge9+7Zj3HbDDcjUkuO+cmUsX/JU+tFta7a3FCl7OTU=;
        b=qqVahPDN89MH/B7M/D2xuDH6PTK+bD2wdcT6VuVEwaQP9IHatGZB5YluSfbgwWbbtK
         /cbtklYbEoNAfbHgw8MV3bTARBPOkuJ1MWVQyHO9luFi6oanTz1cCOb4it7K1nboamJn
         BxsID7CqIyXci01cofw4N6REB5oLRvs/8ZL/SCnE75aXzmFvwkUFPTGRWQpWMiSG06zn
         tvd1Jc4vEnz3g+wQVK+jrAVbLk9KF/eeMM4NaWQNmjBxvShdMwjNFzsSvCeVJpK28yb4
         4Edmp7dkcFPSg+6HyjRcqo1pFR8fWJH9ngd3v5nLCzAqjyX/wU3K91lJ+mVFfnhxBVCh
         E2sw==
X-Forwarded-Encrypted: i=1; AJvYcCU9h8avXQd3sl1FmcLc0NxnZXE6Q7glV9VAiA3daqxHrVVEa1o2C7chALvczxebi/rxynfimFL3iOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycC9Bjbm3/rmQoWGVm7qi4TXDoyN4aF5aVCOUeSkV+2UQvKd67
	DFxuZLgI0r2yWqI4goN8Ut0NUe5vnIu4PzrvBwhiG9IMx7l5iut/tZ/mHyWkMQ==
X-Gm-Gg: ASbGncsA6+BXXM1qPMssx8qXJq8QyqiQP5r7+vz29D/dhi9s/T9bhk0aqY6kUwvSTv1
	ThAIv3z4YYbhVRYaaI3LiTvkpAzxF0p1gkXpBZJHHV6UquO37+OSxD3MCYnHGmseh87HvvPanat
	FD5DCxPufrsTHjZx6L3EE6NhYRnUrVU84ZNfw1QfkeSGwi9ZJiqXO/YlVL1YGpPwI8tnodKuMJC
	3eAYvvLUJzXNREMqeBl5pw+1SzeAIw5UGxLQLiSeOjysdxEuBI1R3vPCuBoJHrCqmPTJEuXt8a6
	j3PZfOOgifAKN5j6SF8Vqt+xj4UebtvstDIrappCmg==
X-Google-Smtp-Source: AGHT+IHC3M93YKbX/zJekxQ2S6I60xA9HXMTt0MQkmdKkmC7QLRQCuK9iL0qARvZ5KOhQ65Qxqq1fQ==
X-Received: by 2002:a5d:64a7:0:b0:385:e9ca:4e18 with SMTP id ffacd0b85a97d-38880ac23d0mr10470331f8f.1.1734352935976;
        Mon, 16 Dec 2024 04:42:15 -0800 (PST)
Message-ID: <9a8089db-cddb-4f86-bc14-9dd71b0bc7ba@suse.com>
Date: Mon, 16 Dec 2024 13:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/12] xen/page_alloc: introduce preserved page flags
 macro
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-9-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241213162815.9196-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2024 17:28, Carlo Nonato wrote:
> PGC_static and PGC_extra need to be preserved when assigning a page.
> Define a new macro that groups those flags and use it instead of or'ing
> every time.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Aiui this is independent of 1-7 and hence could go in ahead of time?

Jan

