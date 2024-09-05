Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75FA96DEBC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791216.1201054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEgW-00078T-TU; Thu, 05 Sep 2024 15:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791216.1201054; Thu, 05 Sep 2024 15:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEgW-00075R-QE; Thu, 05 Sep 2024 15:46:12 +0000
Received: by outflank-mailman (input) for mailman id 791216;
 Thu, 05 Sep 2024 15:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smEgW-0005nf-4T
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:46:12 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9bc00fc-6b9d-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:46:11 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so17454991fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:46:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623a464csm150360266b.150.2024.09.05.08.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:46:10 -0700 (PDT)
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
X-Inumbo-ID: f9bc00fc-6b9d-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725551171; x=1726155971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gQZOCyh6aUyKK0i8H6R+QWL65SqoGaKw7NP6NimmFCw=;
        b=O9ecC3rmHfFjhE0JMjfkA4Zw6xqmxVPD04YKiCwQtYI7L+RSfhdnfKJ1kau7pusA87
         M3UnJYI5/DbeaKMHqNA+SDzvCUqYFFUyRCoJfrF+7sZ20SJ3cblb5vjb8vTkaPoKe0zT
         1YUtOy0hpMxxezuxS9ztj1OtTgWWnwb3KTc3GD7+V8xyAJAt3ej4z5qcMCfIJ5SuQWxm
         fHLifovsLppuZ/HJYZ0f5NrqGw/V83X1UAo6x+3J9OU8GmEAPPhkUjS7Agw3nOExrcbV
         DJ0bPhWJkXbKAeW3XXAQcEJDUdLjpIFQn9aQSzIbave31uN7UM4cWSrAmCpnMW2SBqBv
         Q4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551171; x=1726155971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQZOCyh6aUyKK0i8H6R+QWL65SqoGaKw7NP6NimmFCw=;
        b=gucYSApafyDjDkrzLArQoczncmjHYf2/fb9dwUlXDlls45jD4iDutb4x6Bm11DfpEy
         dXpAMk+eGQoKMR/88wmRzGissYaFRZ0pAAoftQqqlUubrbK90kQFQjC0x4mEO1ZH6v5i
         5dl1M+MiQysBeTg2SZ0tMvhEnG8HA6IWkmBc+7ZWldQZm7vrVgCrOsQFDNy2+5hhK1T7
         vtStGpZJeqEeI7FNTUZIY3bbgyfsE7maH9WETw9x+Lp9BwldtuMu9ZUmJ33Mj/T7DPYp
         WaRmjatXS8Hz785WPH9Bz6uUNS3oDpgdX4CmwX3j9psrQ41O/coRo/EOyHV50Bzy8zcY
         WONA==
X-Forwarded-Encrypted: i=1; AJvYcCVxPEJEwn4EmFVOyvgbWUIGI2MbAMcUX35Mvkgntbx5nD5uUHYuZ9a1/+qrpdX8xeJYYSk3THyW8T4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT65jDcbKpEG2MA3X0xjgOVmbACe5e4WR/abKIB/TaarDMLygb
	9pYiEvgmONtdvMm0bfTwdOiOcT6JLCLMmKBhPBCKGw1gPYEHKrbfB7rJHPhG6I8lCBtaKTTlqjk
	=
X-Google-Smtp-Source: AGHT+IHyXfFAxYKPkeOoDC4Tb81Hf15O5XF9cwHU92JP/+8lgCkvOH6il6hh8nzpVHoHR57PeO1hHA==
X-Received: by 2002:a2e:be03:0:b0:2f4:f253:ec7 with SMTP id 38308e7fff4ca-2f6104270b5mr243897941fa.0.1725551170944;
        Thu, 05 Sep 2024 08:46:10 -0700 (PDT)
Message-ID: <efdad2c4-6b38-40c1-bba4-163e170a8cfc@suse.com>
Date: Thu, 5 Sep 2024 17:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/time: move CMOS edge detection into read
 helper
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240904153151.83995-1-roger.pau@citrix.com>
 <20240904153151.83995-3-roger.pau@citrix.com>
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
In-Reply-To: <20240904153151.83995-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 17:31, Roger Pau Monne wrote:
> Move the logic that ensures the CMOS RTC data is read just after it's been
> updated into the __get_cmos_time() function that does the register reads.  This
> requires returning a boolean from __get_cmos_time() to signal whether the read
> has been successfully performed after an update.
> 
> Note that while __get_cmos_time() can be used without waiting for the update
> edge, so far the only caller does wait for it, hence move the code inside of
> the function.
> 
> The goal, albeit not accomplished by this patch, is to be able to split the
> probing and the reading of the CMOS RTC data into two separate functions.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



