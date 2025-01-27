Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176BDA1D4B3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877642.1287778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMd1-0002DL-RK; Mon, 27 Jan 2025 10:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877642.1287778; Mon, 27 Jan 2025 10:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMd1-0002Ao-Ns; Mon, 27 Jan 2025 10:46:03 +0000
Received: by outflank-mailman (input) for mailman id 877642;
 Mon, 27 Jan 2025 10:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMd0-0001ah-6w
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:46:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6728bd3-dc9b-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:46:01 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso6349759a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:46:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8ab9sm5162441a12.78.2025.01.27.02.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:46:00 -0800 (PST)
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
X-Inumbo-ID: e6728bd3-dc9b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737974761; x=1738579561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gVrL5ZnCJNmg+XsCPqZMwMCOIU9fjI8lpvMFD8YiMlk=;
        b=HC0L0gwNapWzI/+ueEA5fncoWZJCh94e0FZxwJmicXNXX7MJOtez5hkx03FvifjKbl
         oIxIl7p68Q6fzJbZ8wtUHnxCi/eviM35JAMnt/x+6MWeIvVwDENldvoB+v7uUL7DU+P6
         QwLpfElQAswTfmIgordrOpTkHa55f5uCKyx3Mlid+x/PmZ1ln71ANb9hkkasMnAkwqI8
         cd1ntkJo6CCz+B93Gjx7Ga0Muv+TqzZSYxTBzp1QhiUIkMSKmyutsIEVzlx7F1maQ9Et
         Kwg2RkCwsgKz+Yz3g7TmDVQHClf8CmbC9Vrcv6XsGbS/ER8NEsRWfFdLmS9/M3TT0SJQ
         FBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974761; x=1738579561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVrL5ZnCJNmg+XsCPqZMwMCOIU9fjI8lpvMFD8YiMlk=;
        b=l4nXmJc1fdXZ7+5BBJGKoVtaTHWD1Nu4d04LcS3HeSrtl+Ky/kpHjhdRX9BP3kstIk
         2gAtFFz0aeHZGnrn0B4c1+isP2HC8CPb1MsNhrTS+/dgH2thkslOChhEiysFygvk7Vel
         PwBfCw80mGJUaFhsWBoETBR3TvWA5rygRh3LSNOo+SwYxV7PAbN9gsm3Ij+WrTMfd3Cj
         KotFPa4XR4PD1QGge27ky8mrZdACVQuK15p0mnwTevEBdNDKKvZnYjdqvtjupNoKKAz4
         WMH7roPVIvLiS1sY/hB+29F8xIv1LrJn9DV+gHCee03lp0x4Vt+WKXKlYM86TD6tAcHE
         Su3g==
X-Forwarded-Encrypted: i=1; AJvYcCV+BeYxDcIuGK4V7EOmGqofZypAlyDLTbzQiAPVBpPK/mfQ4Or7g5KEWpkOEd8J+aft+Cy0a9ivx2Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMxeDGcz10uY1oC5OrDcVxe7pB/6OtZs9mi5A1AwWIwwQTUenZ
	R4J3+nhL2JjOiZ/8x418FjL6gZ604H4rWWvBhxAAV1hdgZBz/+X94LMvv0VhYg==
X-Gm-Gg: ASbGncs8n0H0prh7np4MWTHjX04tLLMRPunbRaP8xRLsVMMo7OgMK1cLQ+7tNwKWA6K
	u3DtYRYl6NuhlXlIPlsyZjAmnRy13iAAdjYy7gKIhJOWze/CwUA9xji+6xZS1lzH4bs6b5qp6fa
	7zGT6w0M6Dy/Yxe1vdcPtR93cbsDpbVNd89Qi5/53rar4J09cq+7Jg8vRoeoyRiorFgSXoRKByV
	pG/YQ9ojte1w8qjR2LR45/4GuNFWCvPrZwcZW07W1fArw7AYN4KCmI/h2rOXYVJjQt1FI3gr5n0
	LNAKifmeT7iG+q9ioWdxmSD0XT+44WMtgzkxfEgHkGXd1PkloSu0O0rF/drgsT6PmQ==
X-Google-Smtp-Source: AGHT+IHLOscrQvsmuL5tvNuLJAGZpwGEBLtyyzQeUyH4RIrIwCd7B41Jb1R2sK7nuou5exL9EtKrug==
X-Received: by 2002:a17:906:5617:b0:ab2:b8c3:be3c with SMTP id a640c23a62f3a-ab38b3fb0dcmr3186508166b.51.1737974761231;
        Mon, 27 Jan 2025 02:46:01 -0800 (PST)
Message-ID: <5b897c0e-1102-4bdc-bcb8-8cd8e4a4d6f6@suse.com>
Date: Mon, 27 Jan 2025 11:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] x86/xstate: Map/unmap xsave area in
 {compress,expand}_xsave_states()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-8-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250110132823.24348-8-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:28, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



