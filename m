Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225BA046C1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866655.1277987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCeA-0002Gi-IX; Tue, 07 Jan 2025 16:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866655.1277987; Tue, 07 Jan 2025 16:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCeA-0002El-Ey; Tue, 07 Jan 2025 16:41:38 +0000
Received: by outflank-mailman (input) for mailman id 866655;
 Tue, 07 Jan 2025 16:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVCe9-0002Ef-3O
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:41:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41e87510-cd16-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 17:41:35 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so57490805e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:41:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43664b15365sm588496665e9.7.2025.01.07.08.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:41:34 -0800 (PST)
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
X-Inumbo-ID: 41e87510-cd16-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736268094; x=1736872894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sge+i7ZEgDrRXMuV+vrYZq6xgx2kalBZAUAv5tDhHeM=;
        b=K6sA4PmF44Hkb9B1ccqETmM1nHaOZRFeMTISibHEdr+1YfhbvT5gvzfHTQhK6wnrZI
         5BRTaGhC4c32Zp8sBnEzSI41NcUeH6aHI4rdAxXMPKbb7zMs66Vbi5fHgYt81iqe5onx
         rU799M8R7lzlO5zm9vYe3ldjtuCUZWivT1aZiFsavRGp0MaUWoFLgfXwpub5lsVq8Jxk
         yP4QCwbDo51UERFt1LnKAFrXhKbZG0MSWzSbRGnNpSQ2bm0NcKOxqXUt4ENz8ub2eIn6
         0pVX+Zp42WepIn6HpquVWPJMlshCuJ93/xCIxGH01kI3x495ys52id5Sb3BedMJMDsMK
         KE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268094; x=1736872894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sge+i7ZEgDrRXMuV+vrYZq6xgx2kalBZAUAv5tDhHeM=;
        b=qBqEiv2SMhnAmLd+RzhjZhs/SqI8U8vQYmejiIT0olzknTwObk6k79R+/l0D+625Ob
         h6gKWkckYJOpFAAoZZdRPFNVri4otWkGtPdNjXo1phfTcnzboV6mvZA7InV9m8kj1qPK
         5mL22MS9oDDc8Mo/1qqlfbjHk2ZTtEJ7qVWZEThokIOxvprh9KXLZzWdqiq6T18zyKnL
         Npsfqar5Ua26kW+UeiOn1AVsmWjmvghtNIPQGVNlSao1wyYuJE2YQfOZ/Fn6i9q/XiYN
         vEM2YKj2RpxaHIp/VXoT8XaeRJ5nYmjQBgj32CbDqoWvU+bzrf8jxFV+S1uwtZyROtUI
         XdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq7TNvAd3pPeJ6/j0uTRHxcqL73fJU/U/PaQhDCJZAXZdDAtgIJw/z+KKpkB+/MEfvWkonGzmSex0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMPgp9fr6r59llWPpz7ig48E4jvT0uGntPJI5zBfED3Cd51wyY
	Gs5YLI9BFnWJouAzwB9mHLhDCsUlZQ2p8BxY+dDA4Bpxg2HyMQRHoYGx3B/kUg==
X-Gm-Gg: ASbGncukK4ntZpivyH2A+r3KxsJwZ2vjiNlk9t3LwqsJt33aaiHPG6vmmOOrskuwG7p
	9Tbh6TMMaDOzTKeWJo9VChTmfl0eB2z+oEZpXq3WNhLTG486m+b+iDhZrUZV5mgWKaeENuIU3T7
	mY/NX5v4OOoUyhnKm4kD083H9q/SCFlakW8yo3wdlNb0PQSwnfon3xYeJeJrs0/YXvy7SskQSaS
	PBkSEcPk4B5jUrgNLpUyrfQnxub8/zqOf73FJOaglyYwd7QLeZiUGFF9+T/5sDGeDy3L0hRMEtC
	h6RqlJdJK+Avf7i3eodFJcffinEEO8sw/uoh3XG0bQ==
X-Google-Smtp-Source: AGHT+IElXNoM4NNAb5QN6+ISxfNQLc5uKjwcvfQq0oRy+FyIHt9Acz/tzDsIJCbSXZ+pz4HSqJvPxQ==
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-43668b783d0mr499629205e9.29.1736268094653;
        Tue, 07 Jan 2025 08:41:34 -0800 (PST)
Message-ID: <0bc78550-5aca-4ce5-91e1-f8506c338b84@suse.com>
Date: Tue, 7 Jan 2025 17:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86: Rename _rsvd field to pw and move it to the
 bit 58
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1735837806.git.w1benny@gmail.com>
 <525e1ef971f06e8f2ef196e52a150820d155a5c0.1735837806.git.w1benny@gmail.com>
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
In-Reply-To: <525e1ef971f06e8f2ef196e52a150820d155a5c0.1735837806.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.01.2025 18:13, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> The EPT Paging-write feature (when enabled by the TERTIARY_EXEC_EPT_PAGING_WRITE bit) uses bit 58 of the EPT entry to indicate that guest paging may update the page, even if the W access is not set.
> 
> This patch is a preparation for the EPT Paging-write feature.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



