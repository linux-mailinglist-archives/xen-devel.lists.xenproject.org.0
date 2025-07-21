Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B07B0BCF3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051042.1419364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkJ4-00069N-2I; Mon, 21 Jul 2025 06:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051042.1419364; Mon, 21 Jul 2025 06:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkJ3-00066x-VG; Mon, 21 Jul 2025 06:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1051042;
 Mon, 21 Jul 2025 06:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udkJ2-00066r-9L
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:47:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5293c0-65fe-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 08:47:23 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2236619f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:47:23 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5cfb0sm9465815f8f.83.2025.07.20.23.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:47:22 -0700 (PDT)
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
X-Inumbo-ID: 8e5293c0-65fe-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753080443; x=1753685243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VyZ7AykgCQvQ6Nq3k7GeOpTTaPhchh+B3vPdlJup2c4=;
        b=D/NHe6Y+zv08j4xon+zGGK5FroBLiRRW69d9mXwehrEHEigRukJoxit/Ic5opuR0S+
         RdsJZTWZcc/QszuwEBJnWTRWtJCQ1t0jGkSd54Fsi7sWFn5vQN8okeHLrBUT/ASelTJc
         WdwXWQseODFbYZYe0JPBbY7g9KTEYezsnnPrik4UQLy/FKbee29gtJ+PdWVs+a5G+ZK+
         xCdw18jHfciZhT9eY9yIFUBaM7s9JVBfzVkoCI0L7Abk3vFKVjHhmNJ8FEEAIlHgWHNp
         KhINT6/TuePs4T2Ig7KscS6dOmX2dKflIbp6sb0YrUxCxmZzeF3A0TkR+nQmjvVNuvtI
         8s1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753080443; x=1753685243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyZ7AykgCQvQ6Nq3k7GeOpTTaPhchh+B3vPdlJup2c4=;
        b=cl9zwV2s+r87LBx2fEb5HKgzghYMQgcDYTZ97s9ZvuT0HUjxO/InssiGPsJCiZYje2
         O+58H7bd56It7Usmkqjdi18xbP/wtrByIMrBufOdSy56iYnG/0wm4qM12qTWOZhL2gCt
         OYNsppa4W8JdkgQi50z1NXvrn5KPMIAwjeNTOTIhoEvFmj40G4lkvgIzsPwOgYEnJRcG
         NwEp6gamzaUY7Tl9+2lnAJbm1u2ehQGan777lQvEAOdkhqxTHCvpcIcr1G+xtBDG/1qg
         1jolGO8R5MqheYy85Cwf7FcX5wxUVzA4w9N0dHMaJ1/RcEc39K44QgIVWmLUhTq1rgJc
         nDsg==
X-Forwarded-Encrypted: i=1; AJvYcCW5j+2lI3frdlSiPp6duXCbl+c88CbQ4SbrA6c0BOTKEop51GidGTvks9XW/BS1tVzFJKWApJpdbYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yznuokp3PaRJ8YTknd+ODFgdhl1N8upDOw83nKHEDZzh8iUDorl
	Z0nHx3Svy2L94aKiVaBNcBhSrxJj29rOpzYjRYb5UDWV4pLof6v/g7cj4QYVE+M45Q==
X-Gm-Gg: ASbGnct7tYTx7dc81GVKixpE6Th/t6ViV2x1wAMgv7pHSpjpKc5EBf+nLcu9q5tYigM
	t0qHbcp0lrFJjYKUZt/MIXhA6/VtikhD4nkf0sVHwEB0FdH+t5ZxIMDgQ1EF+LFzZT2tjKs9iBf
	ueG2Q2vj9RfMZtuC3Y/8My+CWbKtu4KaGICn6r6NhI7HtMmFpFB3bx9E+tOQnrpHJt4Ahy4ULqu
	W1GW8rV0pn5Qu1c4nmQbwdqWDSnfKLfNo+1JEDZNqG0RVb7tZFF0qR6oSTVvb+lJZ5kpOo16PC0
	lKnR0a8U/CRMQj/0KdsCfSHUS6bUNRONghK0ImOqp6Qdk7/6UDo25kf6LCyJhyBtZ/qf6OMdgeo
	RS1Gs+RdWaJjtqalCJ/xH153it8Y8yuuwprO7o1j7VmasW6bmsr7g5p+My9fqxFOxC/5DBcEHKU
	lksxaM//Xuvb1noTPH0YlyPRdXBJgaoJssj2EYRDnd5NHf2RWwrTWGi4CV
X-Google-Smtp-Source: AGHT+IFK6euPsR0efF+ROlxrye4BprlrO41jARH1PSZwfp/5FinI4qenl5rtp5SzT2l9RkkeIFuipA==
X-Received: by 2002:a05:6000:2312:b0:3b4:65d4:8e27 with SMTP id ffacd0b85a97d-3b61b217fcbmr9280985f8f.29.1753080442847;
        Sun, 20 Jul 2025 23:47:22 -0700 (PDT)
Message-ID: <2689c8b9-d2a1-493c-8004-8b7b562bfd3c@suse.com>
Date: Mon, 21 Jul 2025 08:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/apic: Convert the TSC deadline errata table to
 X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
 <20250718142006.2471129-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250718142006.2471129-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 16:20, Andrew Cooper wrote:
> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
> helper to match a specific stepping, and use it to rework deadline_match[].
> 
> Currently, the table is scanned on all systems, even those without the
> TSC_DEADLINE feature.  Introduce another early exit for that case, which
> removes the need to encode every row in the table with TSC_DEADLINE.
> 
> Notably this removes the overloading of driver_data possibly being a function
> pointer, and removes the latent bug where the target functions are missing
> ENDBR instructions owing to the lack of the cf_check attribute.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


