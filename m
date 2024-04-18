Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF81C8A9760
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 12:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708198.1106857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOz4-0002YP-R0; Thu, 18 Apr 2024 10:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708198.1106857; Thu, 18 Apr 2024 10:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOz4-0002WN-OM; Thu, 18 Apr 2024 10:27:14 +0000
Received: by outflank-mailman (input) for mailman id 708198;
 Thu, 18 Apr 2024 10:27:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxOz2-0002WH-Su
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 10:27:12 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37075ade-fd6e-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 12:27:10 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so1146049f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 03:27:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2-20020a5d6442000000b003479bec98cesm1461969wrw.115.2024.04.18.03.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 03:27:09 -0700 (PDT)
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
X-Inumbo-ID: 37075ade-fd6e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713436030; x=1714040830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzCIm9h/4Gv8VYxZvFLQWXI055QtgevYfLngtXeC0Dc=;
        b=MbAuwtvgi3X7tmVd6PEciIfTtpRUOewriihO0mCYvub2oXcmEDRVBXKigB7sR7zO3E
         PuykECvCv+cYEMOGr/fKeIhhKW32zvARK65J+fSKWG4wkwgaIKVhfim5qllZe07qQdPS
         W+WddsTGgVcIkFrF998VZQpMKnnjNo2ZuIimL7qb6s+4R+tVsfRphbSYP+SI3hj340rc
         PZQFslNffx0zpvLOGr2MrA+35m2oJYO/+t0lYKjxKJbJBM9+EJlHwC7gLi6bpO0C3Kyi
         NRZQiL6KMl5hTYM+VE5PVqrcMs68jx1h8k0w9Kzb1uI6dJRs3eT8YY1a2Rjpj0FuN5Jr
         +l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713436030; x=1714040830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzCIm9h/4Gv8VYxZvFLQWXI055QtgevYfLngtXeC0Dc=;
        b=ffl+4Cs6pBJfUGKhD4zlKOj6zQDfJL6RvMYATg05JwQ04pRqS3hI/WdbSKrWXSz2Rw
         sKxIqQ9sN9nyB/sx90fbNK1N0OiiWt/FYt9HsioRGslYX0ZST5HOwf98Tcaoiu0PEAnT
         ZzusyIEM42nlTtxkmdFV35xitSn5qJLM8Owu/u5aR6qnrXNzKEMpAXtCD19DI7yZUdRl
         kL6TkakKJwnMRi2lGSvA6uV5cHaD73SHL/Lzcs7RzErMG8X3RZ8almsmI8pagelZz+Mo
         c72piaJqOR2caoSV+kYIaUUUV+JVkFimGm/L8Xl2TERGXGOr43hyHLcwIhGz1kZG5neX
         MRXw==
X-Forwarded-Encrypted: i=1; AJvYcCVt83Dd7pxxGKQ6cqFLT/OR4eWpURXmAFNl3mZbm2U6lw93B2x3IjOokVKJJKVKv31mwtFZ1xKMK4goz1CGI0+T7dp5B8Xz/+OsKwAGKqY=
X-Gm-Message-State: AOJu0YyWHx+4hu7YLEJsvoovXDipl6Xbtycksia1KY8A+rLx5YYNPXTS
	uky6jzBrLtCJByB4JckDiJl+2l+yh4kyK4Q3nQe/cUah3EvZAf1O1zzgudGXtQ==
X-Google-Smtp-Source: AGHT+IFn3SjbYO58cMa+Qzj9CxJarKCHBHPp5y/qMJtsvcoZ4r9TWCyAu/eg8c4WZD7/82JLQD+G8g==
X-Received: by 2002:a5d:6a4c:0:b0:346:47a6:e77e with SMTP id t12-20020a5d6a4c000000b0034647a6e77emr1346800wrw.27.1713436030254;
        Thu, 18 Apr 2024 03:27:10 -0700 (PDT)
Message-ID: <d100385d-007d-4b20-9bbc-51ba06b4e8bb@suse.com>
Date: Thu, 18 Apr 2024 12:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Simplify segment override prefix decoding
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240411152314.1755561-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240411152314.1755561-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 17:23, Andrew Cooper wrote:
> x86_seg_* uses architectural encodings.  Therefore, we can fold the prefix
> handling cases together and derive the segment from the prefix byte itself.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I notice we already have suitable BUILD_BUG_ON()s, as we use similar logic
already for PUSH/POP of the selector registers.

Jan

