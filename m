Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A225CF7D4A
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 11:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195991.1513861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4Rj-0003Xf-Dx; Tue, 06 Jan 2026 10:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195991.1513861; Tue, 06 Jan 2026 10:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4Rj-0003VV-BB; Tue, 06 Jan 2026 10:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1195991;
 Tue, 06 Jan 2026 10:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd4Rh-0003VN-90
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 10:37:49 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be10a871-eaeb-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 11:37:47 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so4727775e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 02:37:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7faf4cb4sm14312935e9.8.2026.01.06.02.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 02:37:46 -0800 (PST)
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
X-Inumbo-ID: be10a871-eaeb-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767695867; x=1768300667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VnEJ4Cdq23DCIsrH4J2zeEbPVJtvH3fYuXPDQXd4JNA=;
        b=X6apKxPR7vNXPZ4hzzIJFbaOCemniwHyruu+/FOEl/pc/au35RRJWD5/sGtCxqz2QN
         0itq9wzJ/3GINYyFb36iE0sh8bnDaWxhwXLeGvlW3rYsWs+jdn57XtSn4cV5aYM9k19b
         lv00VoIKmVQnoFmc6pBPndLuiA1fsgRyv9L2keDvUEyQMg5oyYOHmYgBWLv9nAUm6dyA
         i069W8nCR3Aof5II+hJaFuaQLctX33BaXgehzUsVBhDRBtX8iCM+1tXseDrBW5Ef51qp
         5ggcpB7mtYUuCj6rBDjS/5bcbb021ai2mr5jJNSPDoPvF4dCr4Oc7RqzzC5/UMdqbI93
         CdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695867; x=1768300667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnEJ4Cdq23DCIsrH4J2zeEbPVJtvH3fYuXPDQXd4JNA=;
        b=BKUyh04IlpkpKGz6kYr/JIZqI5fMkxTR+V0IAGsc+xqwn3LmKLEaROdNifcDlXAmiu
         ftcBK6VpRBi3C50EFjzLsAv20wFdgl2NzIGfkT2fafFG7fz+LtEai/fh16v1iXn3OXhz
         6tIWp5xKQ+iTwk7xN9MyLeh9tpFf6BLuO+Aah+hG830aObv2uZrYO13FQxoB/9XT6W4i
         n5URnOmwtcNVhbRWz7d0xqfTZQzCpiKT2hPocaJ1okDosjJn31cNR0sU8abWusigrQrk
         j3cdcAfypgTqp8J8j+NX1H/bWg584sl/d0q1lkroFK7Y+gBem9WuQ/a235bh0w8t7D/Y
         1oqg==
X-Forwarded-Encrypted: i=1; AJvYcCWOkbz3zgr70Tgi8u17TNsh3f5n4xR0ECk6wEwIfQIXvO/eS8rwRPOEw+OARCcKqY3p/bDxiISS0MQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyU9O1mBADRSckbnw1zpOJqYAFwUVISJOyo4UDqD3JpIEfSYnkd
	eEGZCi5a4a6p60dZvQL9IPm3Yt/bGAuz9mgDrXfy0Ia4yKYV5b4+s3rNRgJQ91+wYQ==
X-Gm-Gg: AY/fxX5ULLqLWNpTFAAh6k3tBRD+mzYTaA/2yG3sR9rZrkaO+5Z3fx3vAHvuaxyJalY
	URO33Gmh98CJzoWdzp1KlUu9tTCcKFrUVm60+6cMvf8ZftD9TwcJH4hRFJCWEYlXy+2rYq1beW6
	5ZT0VSVFLTrj6Js9vgoDMVNZNNz2eyfMjQ9iaaZugOLsJcf9kiay+U9EBmQxtN8ZwKSR5Jaei2S
	GXv/KmWhyB6gf8+w5hvF/0mZy6yGNDoBhwPNvkRp9vTXTH/8cA0fAnxJbuRCZTEQNHJCVqO6T59
	eZMByS0d3nqhFINz/tuvEZJ9ZA9963VwhQza+HABDSefUTpu5HQKMfyPlaFCmF7entV8vmnMJzt
	twCMMmL+o4MqkL/+45wJ8zEyOsvf6+duT3upeCA0+xMmtKiv+v347L/FS7Z+3YUJGJvlKCtDgjy
	Usxrl+WMAHur+xi3IOnwOgTN+Y6mEorWvUEjLxtAZ+Sldz7jSdcpfoO9cuc9w+ZpP5LaCrividX
	VQ=
X-Google-Smtp-Source: AGHT+IEtwJ2t4LIpPE0qde7foCzF2lXC7ZeTUAbp8MfL3Gb94CtXhxMKRihl3Rwel+PFZfpuYtPlKg==
X-Received: by 2002:a05:600c:45c3:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47d7f097784mr28452085e9.21.1767695867064;
        Tue, 06 Jan 2026 02:37:47 -0800 (PST)
Message-ID: <1db4bfe3-c190-4dd0-aa3e-bcffa42ee120@suse.com>
Date: Tue, 6 Jan 2026 11:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
 <03ede724-4b01-4a16-a23f-0bc2ed25efbf@vates.tech>
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
In-Reply-To: <03ede724-4b01-4a16-a23f-0bc2ed25efbf@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2026 11:17, Teddy Astie wrote:
> Some question: do we plan to drop xenoprof.h headers at some point (even 
> if not today) ?

I think we will want to keep the public header, to avoid breaking people's builds.

Jan

