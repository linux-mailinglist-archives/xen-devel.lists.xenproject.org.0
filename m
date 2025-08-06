Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97FB1C05E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071195.1434691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXRW-0002ol-Bf; Wed, 06 Aug 2025 06:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071195.1434691; Wed, 06 Aug 2025 06:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXRW-0002lk-8e; Wed, 06 Aug 2025 06:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1071195;
 Wed, 06 Aug 2025 06:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujXRV-0002le-0s
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:16:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d42c342f-728c-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 08:16:03 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-615d1865b2dso8082781a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 23:16:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe77cfsm9673862a12.42.2025.08.05.23.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 23:16:02 -0700 (PDT)
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
X-Inumbo-ID: d42c342f-728c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754460962; x=1755065762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dczS+tNctnniVobnE+PpRgRPaAjJiyLRuxq6M/I3H4s=;
        b=BJ1lmUSL0ozB/1d2Gk2q2wYkNvVBwLtYMmERL3NDzBUyVVRZS0MrPGyU8X9yzu1OrX
         i2PB5CUF6cNAAIqZRsYY8baZz4x5qvEXlbvJrfgTMrteNpc7tppYlV1HRioWFvJI8I61
         uC0Ek+xfGXRD+0DIfsYvGhE4kT9WnpmZfaqfB2/upNW12PFyyVM3l9dGji8rNirhObyE
         0JDsRE/tAvYGqFVAXmZJA1sP9MmE3bvdxMiiNiB9BtT2BAeOmexzTUYOIazvjDJo4d0S
         irbxmP2Cx50aC6xw9Doi1UGVNJFEwytZ0S/+P1nS0+DifaJ9F28npTGBHb5+U6DRq7Zh
         GBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754460962; x=1755065762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dczS+tNctnniVobnE+PpRgRPaAjJiyLRuxq6M/I3H4s=;
        b=WNfj/5GD4H0YoR9h2/+UclGyGMepoum+YbVn90JDaDfFZnJifT1JPl3mBC38l76p6O
         U6ODFy+ce9hL7Z7o/CbjqwT1BrPO/bDrYprJBthB8+SerdoiCIkFW43Ljw/ueF5K8D8I
         VXV8afbNvRjyEKU9y0ywCJQpI2Y1qDcqbGm52JPlcoSVarxuoSjEov/5oFXD14+bjZgv
         7AEvLUpkKRAKHshqH8ta0tNn3lcLSRukmpydg/XBFiK3ruyXszzYQPOZ+7ktSr5ePd/1
         GfYa5xw89owCb0+gmQ6GT7bZuITxG41SuVoVOZsMZW6OdKPEXK0Y4xBCG4seL7XOz+r1
         SWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt/pJ4Z+oQtoDfW7qwWxsXxj02hfN/WjzMhX9xSLvFXWxKq22AL2esrt7npYM2/ZmEzxP/rbnKBBQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxAiQZTRWoypdQEs7htCvqMg3nTVb2FhEB4MbInA8TQLXC9QPD
	iUrIueTGWejIBq1Kd5b1c5mfXedLf+8IVUpdUarRDXJtl7oCGdxy0EdxMTq2grn3nw==
X-Gm-Gg: ASbGnctKvAS12Byl7v5sjFRxJ5bPJIEf9LQuoU8ygqaOJ+SRHd/PUaHu/0iMu4o3vUq
	LN9UIYf2FbPB2Vsiiuv7mRi9ZeeU7xRwZQm/+H0hFivw9T2QRbukXlo+SMsiiuZ4cKxHq6LugtW
	km58Cfn7G+MKxB268ZbJMR+5O1faEVgeTSIcRuNXfpLrInWSTyssFFr7ZVRFn0Fme0biDcp8F6f
	awTPTtEn1+E8OZYjxTPem/NHPikZnJkxe6W7i32+EFkmyf451b1zxXIrlRbOxi0uqf0tQaM0P6X
	j1VzCMkY24SywOTRo1jxL7D+dj9Z/RKjJHAtntO4PLQceip4L11KL0aM9DDUkC3zusBprzLxT1o
	MydSOqD7m6e+XYR3LQSVNTecv0zIqKhIQgQZ0dNneH8aYqiRjyRkfR9NDT3RzrfW7mTDPWMOo35
	KB0Rf+P7LXORH6/Oqhzw==
X-Google-Smtp-Source: AGHT+IFBynEvXCMIw7RpT/Lx/BxC7UsusRCOjri8Nb2k/rK/U08HpfyidX1YLTjlYkUitOtirXnDZg==
X-Received: by 2002:a50:f611:0:b0:606:9211:e293 with SMTP id 4fb4d7f45d1cf-617960ce9ffmr953974a12.9.1754460962351;
        Tue, 05 Aug 2025 23:16:02 -0700 (PDT)
Message-ID: <f4c2a251-146d-4121-88ff-8f6d7624d298@suse.com>
Date: Wed, 6 Aug 2025 08:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] efi: Call FreePages only if needed
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250805163204.3631483-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 18:32, Ross Lagerwall wrote:
> If the config file is builtin, cfg.addr will be zero but Xen
> unconditionally calls FreePages() on the address.
> 
> Xen may also call FreePages() with a zero address if blexit() is called
> after this point since cfg.need_to_free is not set to false.
> 
> The UEFI specification does not say whether calling FreePages() with a
> zero address is allowed so let's be cautious and use cfg.need_to_free
> properly.

Well, no, this paragraph makes no sense. Of course this is allowed, but
not as no-op behavior (like free(NULL) would be), but to free memory
starting at 0.

> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

This pretty clearly wants a Fixes: tag, or maybe it even needs to be two.
I've checked the original code in 4.2, and things were consistent there,
afaics. So breakage was introduced perhaps in one or two of the many
re-works.

Jan

