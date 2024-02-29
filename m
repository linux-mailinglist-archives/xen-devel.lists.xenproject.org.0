Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9A286C2AA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 08:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686866.1069428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfazP-0001o7-Ny; Thu, 29 Feb 2024 07:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686866.1069428; Thu, 29 Feb 2024 07:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfazP-0001le-Kl; Thu, 29 Feb 2024 07:37:59 +0000
Received: by outflank-mailman (input) for mailman id 686866;
 Thu, 29 Feb 2024 07:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfazN-0001lW-Lk
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 07:37:57 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73b99fe3-d6d5-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 08:37:55 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a44360a8b9dso56336066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 23:37:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lb24-20020a170906add800b00a4131367204sm391444ejb.80.2024.02.28.23.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 23:37:54 -0800 (PST)
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
X-Inumbo-ID: 73b99fe3-d6d5-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709192275; x=1709797075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TxUzgkmubUb3J27gLbgz86cIAhX78Zc6oPVUOiI1wZg=;
        b=ed4JsGKOV7Ra49DqgXUQcwY4s+5Pkvyvr9WDp6Uo7I88mP+au/R5qIPFE2ViQvMrhV
         yw1PVmek9X5VgtLYjrjaIcox8aVCh5mbLYkMCnU3z1qm2t6NSKH9X7ht1/7GCAcNdAxf
         JLIWFeVoCR2nZgK/yOjPhDpVq2HHzDnzJZJ8BD/VdV5vtsjBTQ1qmWzrln8F5orMXvgA
         l8OFlIfDtS5CfoD8igDYctKJVXd2mc5btjzEk4gEqkDRh8cfx6c+xefcArdgQqLWLbiP
         IujqA6eiE/r7E5eRU/jGtdfFpVMD4z6rbSOpGvQdNtJAS/r5V+QcH6XUPK/jpZtbGD9H
         XZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709192275; x=1709797075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxUzgkmubUb3J27gLbgz86cIAhX78Zc6oPVUOiI1wZg=;
        b=hyUKn2w1+1ZDuXlbIr+St4XxUdyN17hDcUr9spIsD1VzLiD+lLX5w6ucK4aCI8CR64
         H+e7xm7cT1vyZmmrGHblSOHo96NmrIkJ8G7tFPbr+4/xAOZ4Do1JocTfeDkXuGX9Ah78
         RA+5OhXr33tTnSXsVGEdzrr6YvxK7UqVwi8SbPgGChxcDjIoQEM5UGCn4hWI0gihLtBt
         Kxrcr6iuBlfsJF2rocIoilHTg1RpmikhcxiUf1emFjj1PfXIgtaV3TJB68Juuw19ts/O
         jVPowV281yU0a6bB/OsTdELAwRQ5HoCpH4bs77ahxpaj+KzeeKZl1DYk1zzyKtYoOY9I
         qzTw==
X-Forwarded-Encrypted: i=1; AJvYcCXX7Org4Q1TMTWeWDJ7sy8bo+scNMbHtDyJvmMh8sszKNzFE7/wkAaAUHJElbQhtTZ7LzKHhrC8Z27Sm4aMUpABx/NW8xbwL/lQ7w5SX+8=
X-Gm-Message-State: AOJu0YzrSbQlTwyq0tWq3oSjno1jTw87zmvBBnh/9wGJJtKfmFqqSmWn
	BpgfBp0HVk2JhJ2liGcdURESlNDCgDv+YnVDxwzVlbfh6XMs36BooopEmKdouw==
X-Google-Smtp-Source: AGHT+IHe39N40kSTHn0ZakWxc6IYudPegU4lQ7t1DTRAqUGWBh43lajHEKJUCVHQIbYIQR7Lw/qPLA==
X-Received: by 2002:a17:906:fc1e:b0:a43:d6a9:ced8 with SMTP id ov30-20020a170906fc1e00b00a43d6a9ced8mr855517ejb.56.1709192274861;
        Wed, 28 Feb 2024 23:37:54 -0800 (PST)
Message-ID: <19c837ce-534c-4b76-b8fd-f5baa9f328bd@suse.com>
Date: Thu, 29 Feb 2024 08:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
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
In-Reply-To: <20240222090530.62530-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 10:05, Roger Pau Monne wrote:
> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
> can be achieved with an atomic increment, which is both simpler to read, and
> avoid any need for a loop.
> 
> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, same typo again, so my commit script again got the author wrong.
I'm sorry again. I would consider adding an explicit confirmation step
when there's no (well-formed) S-o-b, but I use this script elsewhere
as well, and in e.g. binutils and gcc S-o-b are pretty uncommon. (And
to avoid the question: I'm specifically avoiding From: itself in the
common case, as for you and other people with non-ASCII characters in
their names those typically don't properly show up there.)

Jan

