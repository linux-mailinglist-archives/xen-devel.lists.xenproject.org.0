Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF01A89EE0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953857.1348259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fuI-0000VV-9R; Tue, 15 Apr 2025 13:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953857.1348259; Tue, 15 Apr 2025 13:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fuI-0000TW-5t; Tue, 15 Apr 2025 13:00:54 +0000
Received: by outflank-mailman (input) for mailman id 953857;
 Tue, 15 Apr 2025 13:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4fuH-0000TN-HP
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:00:53 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a854ceff-19f9-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 15:00:51 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so4889717f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:00:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fca5sm216483635e9.32.2025.04.15.06.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 06:00:50 -0700 (PDT)
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
X-Inumbo-ID: a854ceff-19f9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744722050; x=1745326850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+CbeIpcVt1ZpLQZDXh7CG1DiVR3LVF/Dd4jC7ZuuU6Q=;
        b=fhjWIQNWo6JijmCPsihZ3yXeR69bM8SvO0vvzayDK6G6tzzn3xw+czCsVBXKmV8MAI
         8BYtYI3c6m+94jh1moovl17Fnft5vZFPqpDUzziKK6Gu2fN8cBsf/RTbZH8a5EHzzE0O
         oqi6MzfJR1QvYfPPwr1k4g7OgocjxIAZNec2FDNvJA89wrZZd3DMV/Dq1Nsb0g5BIU/I
         EJloKZgjdhYRefb+I6qlNtJe1AoD2uADWnemSO+q4MLkLtvCF2xDYesPvCUm9CKT6EG3
         biSkSI+G1wI0Bhrhwr3uDY9T7SGGDr+jpSeWq6cpl3KFr3Ufi/6YiD5i0D92Md/uFm4s
         xy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722050; x=1745326850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CbeIpcVt1ZpLQZDXh7CG1DiVR3LVF/Dd4jC7ZuuU6Q=;
        b=BJ8yQtfIHVysr5eaHb2fqXPCclHQlpmxSivA7R7TYF1NHTXubqFwRXjVFTnDON7XfR
         cKYNZdDmL4ZWpXq8tIvJrDUyHFVAhYbiKqY0Zx8EwdOhhA4nhdQgWYI2PJxvokauTec/
         nIvYrE9PvV4p76hNgHAA2p/KiovKEiWXxjaaY6dE0TbK0lTECnkucgLwRB3SPcZ1tpQT
         cpokKAYHValPNIKi8d1ZzcppekeL05c+kiztBA5nGgNwDiMytzRlKSGxv1u2mVVW1wb+
         +3C6mgpNSEVI1BiQf6iAXTgLZPCeaMFmCkBNcD3iKq9k4COCoiKPbJkeSLx1XkVJoJL0
         VAIg==
X-Forwarded-Encrypted: i=1; AJvYcCVmlI/Li+lWEQyBzTuPPfLExeKob6dz5BhnY15GgWdP37CI6O+PBruP7FE0F/bQnNvyQKotjpb7hq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPrNLt1DpcaeGNzAjqKNWPxYku2IbT9S4WFZaaiZ/QcqB9BSge
	7BBNHmZW48ZIUwKL3cPyGZuG7xj28OZGc3IEQ+UwctuH79sZEhSDdf3N5Kf7Pw==
X-Gm-Gg: ASbGnct9oD7UA5346wcwimVHR5rRtxyx5ijThVudr1RoC84LuMNf7BA+Wv5xyXa5qYL
	/w87bvcM1BKkF9MFafYzludjJiMSstcHs8pBbHADairK60x0NuRe0lX0fVFEeaiYylP2b586IZv
	0pb+Yd3v+kLfZcP7hCfjj+PEMGianVxPUMSgzXiJNYCS0Le8iNvp3doKMcZ96sDrHwI9XcyJN/y
	ovcbPWrxvEhdY+G5qbHu5gd+eHsCmcLkg+3+dL1i2E0vmr/B+OoNkFlXHSmI329vOtcaM6TzGBE
	QcKUKtqzmrg8pDRZ1xCin/A53xXGvE3mRK8SzEIjQ33XNuG25KbU+FjgNKQLL61vBeGSnW1twiM
	UwpT2SHwVivtqqZaV5CbT4WBN9Q==
X-Google-Smtp-Source: AGHT+IE3b6mB9CaDM3ppB6DsI2xxiG1GpfHrl9NP0z2EtjDZ5zJ7zDEYeTO8fmrBr59rbE9YVeuqOQ==
X-Received: by 2002:a05:6000:2809:b0:39e:cbcb:8b56 with SMTP id ffacd0b85a97d-39ecbcb8dabmr7352203f8f.12.1744722050388;
        Tue, 15 Apr 2025 06:00:50 -0700 (PDT)
Message-ID: <9211cbe0-3674-41d5-8862-c819ada37140@suse.com>
Date: Tue, 15 Apr 2025 15:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Fix UBSAN in hvm_emulate_insn_fetch
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech>
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
In-Reply-To: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 14:49, Teddy Astie wrote:
> UBSAN complains when trying memcpy with a NULL pointer even if it's going to
> copy zero bytes (which are the only cases where a NULL pointer is used).

If this really was a problem, I think we'd need to go through and find all
instances. However, ...

> Fix this by only doing the memcpy if the pointer is non-NULL.
> 
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in arch/x86/mm/shadow/hvm.c:168:5
> (XEN) null pointer passed as argument 1, declared with nonnull attribute

... it can only be the compiler who has added the nonnull attribute; we
use it only in very few (other) places.

Personally I find it absurd to forbid NULL here when the size is zero. Yet
I agree that the spec can be interpreted this way.

Jan

