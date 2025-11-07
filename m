Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D486C405DE
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 15:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157620.1486332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHNUB-0002Uy-G4; Fri, 07 Nov 2025 14:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157620.1486332; Fri, 07 Nov 2025 14:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHNUB-0002SB-Cj; Fri, 07 Nov 2025 14:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1157620;
 Fri, 07 Nov 2025 14:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vHNUA-0002S5-CF
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 14:30:42 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56031c08-bbe6-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 15:30:41 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640f4b6836bso1500909a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 06:30:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f813e9fsm4151780a12.16.2025.11.07.06.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 06:30:40 -0800 (PST)
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
X-Inumbo-ID: 56031c08-bbe6-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762525840; x=1763130640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4FVQV1oONub5DxPN3iSH+bM2J/Px2UqDvAT6dpx8sl8=;
        b=fmJidqWsAmc1GirMcaJGDeXEF+F5PahGaOny1BKVSXc2xXwieJVk/UIsMOoHwvVUHj
         ZbkLP6zv4N3pXVo38s9HF9xYNcwejJ16SOayIkVDIlTeh2oo1lUjwo446rO2rDGbgfkM
         Y23LhgN7Geu3HXOOzpiLP0+AhyCE8OBN0yKB/utkFj2vOK9u9Hr0IFnjFdNELJKIUswL
         gYMCsf52/+0iDWU3sw9loJVAT2Iz4GQvziaocSEQoFwasnXzRm4X4cuFjw5stet19ijY
         jW6fZyJQAfdtPe6G9t3r9hp/8zi1eZ+iIy0TujhXJqFkUshdymx3QnbG8j7lc8ujz6rc
         KQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525840; x=1763130640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FVQV1oONub5DxPN3iSH+bM2J/Px2UqDvAT6dpx8sl8=;
        b=HLEMX/oX1B+GFjC1Ct2sy3+ggLzJDnxDxphDBmX9qCUQjO4yGAZxuWtfGogRmT9wFU
         9SSdyaa4lkzQRvgjSZyQ35XYBKKRiT95cD91hpt3OGTJT2fCT1wmXcyffnPuFavaM2QC
         klXffIDtBrci6t+OfevzHOREXgEsVTEOq4tbzfzV6SFo6PJayAMG+TETYf0aiyLjZ+Xh
         uwhOWE7ILEFF5mMoYwFcZUa9o8iTLj9wWlMXjR3P9efuabhLd2nwH+aSaV2cQB6Z3KtU
         40p0Al1kqNfLaMOsK2QK3oboCGsdej7BRaPoIrXqjlkQj5V4yuUIo0OvnkTzB6Em02Zt
         mTdA==
X-Forwarded-Encrypted: i=1; AJvYcCV5hy8DjeJLTh9avnGiQJvGGv1WyeZSxi1xDfM5/0JyBKBw8Ylqg9hRS54wQjNfUoKZnYamS4nnrzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMN5pVFiDXZ8AlXgGpedC+yEu5BVVuOUMefc7mdGeKtARFZF/L
	dlUio5noAjkt6cipeuYpVrExRq0R2BrGEgXQJsalQxTLJbc++c68XZl0pePxRLuFFw==
X-Gm-Gg: ASbGnct3wsYowYbhkpvkyzA7U5pTPpyLvVdrepeHdKWRLIAZCwQzJ0aaV68p8n/NGig
	P0LiN3IeNHPwy1bWysi07H71exNxmGAOfLvNXF2UOIUys2YCQx5JyvKXmUbbGspJU4pZgl8NIzl
	34lPXh9NFgVwFyMFGmxzJz70rM9+sKvK8RjmZ+X+R1IkWf5pMW8p7Xz4GteMKswBHdEK/qn5ffL
	1HRKBDtdDt7EwQQiEDscIZ0QENNQSZ5f0oCU7SRPyjPoM7yu2jxJl8S643LuruLWqg0zxppkG8i
	yL10SmBLjHl9bkOsoV/ma+wtHBZKBk5cSvh1Q8AtR+LjKhpri7zaukVHrqxmSOQbB4wJo2aSVZz
	jDr5FJ1V5QhOUFY1zgvo9csmC3M0i46RpRoBA8i8WPo3Om4PupIR+PVuHU/qX0sfdC0Lun3uBHC
	O5c9GRLpfC9xRh4dyWpuBMesdcm5flRzBzT606RWB5d/W245ugqnmtAr8+Yu7fwpYiRYAIb7A=
X-Google-Smtp-Source: AGHT+IETCgIAPtMw1o8npRrsfKYqq1R7Ka74mVls+7NkpH/lRLGTAb9J0FWyCtW4Fkg8YOvtb5n8bw==
X-Received: by 2002:a05:6402:3487:b0:640:bb20:41be with SMTP id 4fb4d7f45d1cf-6413f072444mr3300891a12.5.1762525840238;
        Fri, 07 Nov 2025 06:30:40 -0800 (PST)
Message-ID: <52dcf4d1-69b7-437d-a01a-eec33f4535dd@suse.com>
Date: Fri, 7 Nov 2025 15:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Add extra rows to the entrysign model table
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251107134729.20735-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251107134729.20735-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.11.2025 14:47, Andrew Cooper wrote:
> Link: https://git.kernel.org/tip/d23550efc6800841b4d1639784afaebdea946ae0
> Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Pretty likely wants to go into 4.21? Cc-ing Oleksii, for him to judge.

Jan

