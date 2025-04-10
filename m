Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8209A8436A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945629.1343793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rCr-0000b7-Ls; Thu, 10 Apr 2025 12:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945629.1343793; Thu, 10 Apr 2025 12:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rCr-0000Zb-IH; Thu, 10 Apr 2025 12:40:33 +0000
Received: by outflank-mailman (input) for mailman id 945629;
 Thu, 10 Apr 2025 12:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2rCq-0000ZV-G1
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:40:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fca4cae4-1608-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:40:30 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so5789435e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:40:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207c90a9sm53672295e9.36.2025.04.10.05.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:40:29 -0700 (PDT)
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
X-Inumbo-ID: fca4cae4-1608-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744288830; x=1744893630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AZQ6LGzDmPSRM0zBJjmSPiidfYi7WtPp9OY6skd9ixE=;
        b=gHbtgW0/W5J1vyEGlVvDiRwPIxdJlOAeOfnXvp5wvOK+cgfnBPVvtORv1oGSFr4RbL
         HZ8xUPvuHgxmEyo/6gskDMBkvLkesYCqjzO5SmehUWHhAlBZa3efxAu+nQmvknelzAiu
         Nv5zaI67Hd8ne9X2FLmt0IsNoZv4S6dvM4qBbRrbdI7XMav2WWK6VZAO9yxHsjmeOwQR
         GEBKcxjN+YPSs26o16d5m9ciURfTQbLu3yAHxayjX8Ujkky2fswVqcWi0hTVsBIGCLxY
         TAn+y+phnkgaEx3M9LUgJgLaaIKKfk0noSv27DvPOWX5xSib/mbteg9QkNGYHdQ/OlY0
         k8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288830; x=1744893630;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZQ6LGzDmPSRM0zBJjmSPiidfYi7WtPp9OY6skd9ixE=;
        b=BRzsPkHw3v9cSj5cFkywuTtY7XED+6fFlrt9mXCK5IvgXAoRgxNqe6H7nuUTFb/aES
         UR78C/BLzhLT/ZNCu9cNjxBtwCp06yw79BuKR5ECtdkbPAxsYhSNr+9wq/T9a+vgeoJi
         gUBY3BqsIZHqtOskhyGGw9qlYpYSDFK4TXUf1HOa/NP/rxPp5g8oZY49HTcUEolyECV7
         p8/a8Ik+SB/hbxLTSUUv0l4ld3Rin95he54kyHIazfMZv/IgrUJGgNyzxMr0UNzbyequ
         mHbBbtv+qpXRTvVDzotiQ+bYIN4hMvipiLitpBz/nSMq4Yxo3swIljpv71umtSaJPzNp
         7uLg==
X-Forwarded-Encrypted: i=1; AJvYcCWCJGlzEIpt8PadrYGyDCJ12WjJ0Eoq5Ok5gL+NJ4JLsL4/FF729jcpHd4LbhdOwX2cUqK654plJhU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp4nuYtkMFIFxK/+BD/n76PAQRTQcKBs51fl+9fW2maCrvYgWl
	i/oAna6KVWTF4s8HGPfuL+f1UJM5INnW0q1W6FXUwiO+ftl/zAq34ap+3t2l+Q==
X-Gm-Gg: ASbGncsPOcNxwWVOaJ9knVUg13K1pcCsFZsKTSDzjKe42MMba3aK8XzFtkjYB2feRC5
	3wKg0NphuIjldk3uxaCDONEgky7aQdta1Nd0BLKZrjzGjopHxYx9UDzwTOKNV181YuuVZTmbpkE
	/CLDM7yEHNtSGByRVURpXgz/bP6Ow+hxrb0I9qChZajFwUs4Rvkqa1MDoFbQZk2hspJNZ2uKzLk
	bjjVSlUGiVeOptATT+ovOWgU2N6JwGJ9ysN4Jl39+ibwEmxIGaeeEuUAP008AGj1oL2LJO8+W3d
	dkfuKCBTOjNovakrrXKHLegP2fJGBpwHN06KinRu64098LbvBcc3Lwkp5N9hwh6CawVl93+Ib7J
	vgEXEp7gnj/9i6SZgPLmbtzeZajuaB+Yd/ihf
X-Google-Smtp-Source: AGHT+IHBuJcl+HtHa6jwSmqeQdIO5FGpGlsBQXcdhC24wgm40VVxuSXJ7PRJmbPO9mionuRV+MwDJw==
X-Received: by 2002:a05:600c:a43:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-43f2fedd1e5mr23365915e9.12.1744288829921;
        Thu, 10 Apr 2025 05:40:29 -0700 (PDT)
Message-ID: <7e89babb-ea6f-4434-a90b-19c2d12cc58d@suse.com>
Date: Thu, 10 Apr 2025 14:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250409064528.405573-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 08:45, Jiqian Chen wrote:
> Current logic of init_header() only emulates legacy capability list
> for guest, expand it to emulate for host too. So that it will be
> easy to hide a capability whose initialization fails and no need
> to distinguish host or guest.

Before I (maybe) look at the patch as a hole: When you say "guest" you
mean "DomU" (which is a common pair of synonyms we use), whereas when
you say "host" you mean "Dom0"? The latter is not a common pair of
synonyms; "host" generally covers the entire system, including Xen and
all domains. See e.g. wording that we use in XSAs.

Jan

