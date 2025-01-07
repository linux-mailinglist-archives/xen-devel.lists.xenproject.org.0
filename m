Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0B8A044DD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866565.1277867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBf5-0007tg-DN; Tue, 07 Jan 2025 15:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866565.1277867; Tue, 07 Jan 2025 15:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBf5-0007s9-A2; Tue, 07 Jan 2025 15:38:31 +0000
Received: by outflank-mailman (input) for mailman id 866565;
 Tue, 07 Jan 2025 15:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVBf4-0007ey-RD
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:38:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e1d1a0-cd0d-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:38:30 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso11926472f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:38:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c833899sm50657116f8f.42.2025.01.07.07.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:38:29 -0800 (PST)
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
X-Inumbo-ID: 71e1d1a0-cd0d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736264309; x=1736869109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n88R0tKAJGFAg7FLHaog3UqW9b7iYYT3soyLICmHikY=;
        b=YEKv44FTTlTwnkLRlYYrOqrTfAlBNO7tMwU2EgE7as8yGjVHy8KR9J8P/0bCG5zrgv
         YGtVA1BhjQqzdP1k6svMiKk4AArz92ChHvkC/DjuYv0694tdEaY3x0B5IvbgV7Kgch2M
         ihLk0iFC315rU7DXY80HaUF+YRFW7+Tbw4hdv4oCAwMqnQuhZkg6Fb56FUoW5kLnrnvt
         VMxY9GeF0zp4DD3qXoBBNIupHu7yRUtYnTkyHCpbKOO0k35OnuIusTZ49s1SViwk7YeZ
         IaZZeIvVSEQk5ty5SrHL3syf/Fs/uF27DghHFKPmwyLw5/pVhLCWnRDOOcZpjFvFiyDR
         hS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264309; x=1736869109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n88R0tKAJGFAg7FLHaog3UqW9b7iYYT3soyLICmHikY=;
        b=xFAZLRkT6K+mG4nFZ2bTCRT5DNcIDFBurSfZlpbG8UxcaT55/RPC322mEQ+S/sO9lA
         p5LdWGZxIpDbBuJhzRi5sy3fjq2Gi0AnaQ81gkkWhfBrAVX2PfkaTSk3pPFtv1K7MwXD
         Rd+XehuRDK3UMJDMq3QeFksx6j0dArdRq4YHXrN3BI5BXGOjlfNI+kTZ1Db0IXmTBG5n
         RKN5X4OEOki1yEBzTWTKXigycViSfbUgZl46ZQfq4qUhGAaXTb2kxrLnMt32k7EMlxED
         GJ8OCk3xvokIEnMc3ScxrXWT7ee/6Dvf5NKwp+hvDYGjXtKJ1+6qc99NB/Hx8tweDBiJ
         yriA==
X-Forwarded-Encrypted: i=1; AJvYcCWRhIzabkdofUit6KB+PrDG6FQ37Iz3T2/39yHXxSEEVKIGoX1DQk+ouAq0R4BEyFKxCW7gXEn3kvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9o74q87sRI3Zn43PDAGz1KPg/LoEmPPu+wfCFW1bq2/ptQIYD
	vZRmNCFKez6S6b33MfbmZHu3GY/EF/htPr+l3O7HuwywaLA/muQRLAycnry5cw==
X-Gm-Gg: ASbGncunM/ooTycKAtpsyCHA5MC2ejZZRNcMaPHl5DhRzEFVTy/TfZat7CMypcMCWte
	gtleID5qFi2gkEWLK4iWSthEV5BGp7u+rfVx0PPXjABnCHdN4Dbz+crLXb17h6FCfkVfehSfVri
	6BXu2PfkwTuWvVo5ZwYUTJE4FuaUvlVOiKHpjmk2ESebuYfJIuXOWZszbHtXjZEDNvrAWcs//Tl
	mi6wUTI2ds/rTmpItUzSUKbsF0qdtDpf+8FOyo6Nd660gqQ3Nu9B9d+h+TNBbaMscr5oUmU6M8a
	NPiERrkpDI+kjjjXoTOjC/vj7wb9eIQ1iue1Zq2eXA==
X-Google-Smtp-Source: AGHT+IF1OlE39RDk6tm+3E3AJjyjSXEbTHVWM/NZhEpr9voa25Zjp9Er+u4EBToV/wA4npQnEFvtog==
X-Received: by 2002:a5d:5e09:0:b0:385:f062:c2d4 with SMTP id ffacd0b85a97d-38a223f768dmr50685881f8f.37.1736264309648;
        Tue, 07 Jan 2025 07:38:29 -0800 (PST)
Message-ID: <053a7a26-2dc9-417a-9b91-cce151543050@suse.com>
Date: Tue, 7 Jan 2025 16:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] xen/events: allow setting of global virq handler
 only for unbound virqs
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-4-jgross@suse.com>
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
In-Reply-To: <20250107101711.5980-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 11:17, Juergen Gross wrote:
> XEN_DOMCTL_set_virq_handler will happily steal a global virq from the
> current domain having bound it and assign it to another domain. The
> former domain will just never receive any further events for that
> virq without knowing what happened.

Yet - see my reply on patch 2 - it may actually have been intentional to
be this way, in case the new domain is indeed the designated new handler.
Otherwise such a transfer would require more coordination - the original
owner would first need to unbind, then signal the completion thereof to
the new owner.

Jan

