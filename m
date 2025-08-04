Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFEDB19EF5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 11:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069002.1432849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uirmG-0003zM-BA; Mon, 04 Aug 2025 09:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069002.1432849; Mon, 04 Aug 2025 09:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uirmG-0003wu-6y; Mon, 04 Aug 2025 09:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1069002;
 Mon, 04 Aug 2025 09:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uirmE-0003wY-9v
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 09:46:42 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8b27213-7117-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 11:46:35 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af93bcaf678so320813166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 02:46:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af919e96050sm710727066b.0.2025.08.04.02.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 02:46:34 -0700 (PDT)
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
X-Inumbo-ID: e8b27213-7117-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754300794; x=1754905594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HdrvA9JI2A33aDBJxxfFF1vQBWdZKHdIZjz6ftvV8LI=;
        b=Mmn1Pbr6qLuSASMJy9O2QITp18DjnC9Ar/otaFnD6TsQjBUdg1NeKO890FCLB4p7CS
         B8T2GNEkkjPvxbcOoMJgoP2LSt5oufdv+kOQSTiPLEqNk5wKW2zl8Ako2+wlkR7F099G
         mrX8Jo2bmBXdnKdyXPb6G7wK41Z2PfsXZFQuqy+kTi8ZaNkJ4tElKsPv/1dAvyE/fKXw
         muKCru8dZaEdwPTZM3WHsjIbdaARQmGxFiYKIgOi47zaTJ7qBdOgIW0X8w5Vm54VFF+F
         ZK/0yAPZwNXc5MDODj4CWmiEARHnZZBd6NfAJQJQgpcWw/JRgHw9SPVPGR8YSzjc2d/2
         x3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300794; x=1754905594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdrvA9JI2A33aDBJxxfFF1vQBWdZKHdIZjz6ftvV8LI=;
        b=FjMjF1iC/lrYlfAgoeq/ZGvq4Bu4/iDZu0oy2lyOSilTxIJ0ZwxCHlBSXslmkYLaIf
         nAJJzMZnBG3Zkm63rROqRn8UUzKrUa/hZfI35rG403F/lMPfybu4ud215QizKjYdfbmD
         Us8e4m8G0RgOoD1zUfw54/AUXiSm5OQ7dNcKS/sucjEY6SVRadFsQCqwFThY7eV+Esg+
         MjMSl+1qSxfKAKNYwqs39PPY3823uBQsktHF642utAL1aSkCTwjOPZVWBsI6Y9Il6kov
         akQK5rS1Tt/60z+YGCPUOZ8dwyXYm9vrifwyUlBNQKbu7/fvjZfSkod/wkBfFdC+/TS/
         KheA==
X-Forwarded-Encrypted: i=1; AJvYcCWU08GemqQOLzI6YKl6akH0W8nIWJS82R2zYLSkb+OuSoMAx8QlQRorlr3d1E4x+D2HZAhmA9evp6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk40eBdfTJ62B4xkcPaV9iY/GhVbRo1mE5OlUbDZl5isc97srv
	rJgXYM5f5lPTr3bQZ85vzAedhYqG5cFQjH9+ibVCWa5JEOra1BX+hI1if5QorxDHVA==
X-Gm-Gg: ASbGncsaxEmE/ONhibLZUBwaqufeSgmc6fVWEKIizG81tofeW5jwappBSyOTExx/Yqu
	Ej+F+b+6lz4Y1ff6iT6IpZaGhfuMUgeq5BcLvDWQNdVvgG8kXZO7hFFofl5kQCMIzqbX3bif0R9
	h0wr7pjiFiy2IZRJFT+ZXoFg8zF8ReLkK9ILaPzShlLQKUZnJLpqBi9g1UgoUeD8vsaqlQD0M19
	BPKV7PuchfQtqFPaaZjtZhvSJjZZ95uhhX2CdWlz2iX5rFqlEfdpMfdfHtgtgL71ANY07kLwdOH
	qLfrt7P2CFUFSJvxRKc8LHmtBO6lJeHNzFPJ3EVGe8Hj7QgKeSjC+HZLAeGz8JMnqNUdz9ovclB
	M+w6KW7TYTKKCUf2/QSZ/s1eWoaO5WV9gZz9C8w7dYE8ucSbQBOk/Gw7CUCRc2OQbw5MrM1nKph
	jcvqkNVk+9+MQyxheofA==
X-Google-Smtp-Source: AGHT+IG3qTXoyNCQM9iP3YXVvfWJA9kb9szxX7r9xgsqPEab9ctwU3slVu1ePPrP26wccyZaQY6bqw==
X-Received: by 2002:a17:906:9f92:b0:ae0:bff9:98de with SMTP id a640c23a62f3a-af9401ff12cmr770699566b.40.1754300794443;
        Mon, 04 Aug 2025 02:46:34 -0700 (PDT)
Message-ID: <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com>
Date: Mon, 4 Aug 2025 11:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] xen/domain: introduce common emulation flags
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-2-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:21, dmkhn@proton.me wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -652,6 +652,8 @@ struct domain
>      unsigned int *llc_colors;
>  #endif
>  
> +    uint32_t emulation_flags;

Just one further remark: The field probably never should have been of this
type; unsigned int will do, and imo will want switching to while the field
is being moved. (Before giving an x86 ack, I want to convince myself though
that this is moving us in the right direction.)

Jan

