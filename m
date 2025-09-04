Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CEB43B84
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109965.1459324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu93D-0006Om-R2; Thu, 04 Sep 2025 12:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109965.1459324; Thu, 04 Sep 2025 12:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu93D-0006Ls-Nn; Thu, 04 Sep 2025 12:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1109965;
 Thu, 04 Sep 2025 12:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu93C-0006Lm-Sj
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:26:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6de1115b-898a-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 14:26:49 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61cf8280f02so1367598a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:26:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc51sm13901945a12.27.2025.09.04.05.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:26:48 -0700 (PDT)
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
X-Inumbo-ID: 6de1115b-898a-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756988808; x=1757593608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XNX2HRvMEi5y+i4pXQz5zgydtrI2YMz4JAmIh8Fhxf0=;
        b=MlgaWAdcfputkfECWT7OxMyxuvlPRBZtY53+E496Zvr7TfZNSzeKpNape1Fgpj1KTe
         pSwGySfUF3VHkRIykJd05EkmkyKfGhD/gecBrDlA4TtmQ3JIvAZ0xVS/BohqpRBpP53j
         cRqzUnee6yLd6/U155merePheNL5LKInINt5Qj3QvF7GyNsyXWZwX0W4xQUnwVoyirUT
         LmZ2uHeHUcmGdhAp+HR+x2HrZbLe6e9lHb1SEJbZSU3abWZfHsjnZf9Ei2+Vbj7jvOO/
         8CqOzqJVBMEedTvSGHxDKESmIt/8ZWb9giJV7ephDbk/HIXwqy/UIz4x6lM2D7SWSoU1
         fKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988808; x=1757593608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNX2HRvMEi5y+i4pXQz5zgydtrI2YMz4JAmIh8Fhxf0=;
        b=JRxJP1v0SYcCPH7JqT36FVmVdz0B28iVtDOiO+sKkVs+XIY9g4OgTZgVsdFDlC0yU4
         BmSvdAZlK6226B3Cco182oBOyPUybqRpHAOP1ErHCmNrw0kA+cUu9Uodp8+GgPZct8T7
         AGeBbsL9ihGNP2SbFPKvG2NQncy9dVE+L1HVTP6AGdA5lVrgw4KwUBkBfMXw6STUx566
         aasCQdcJ7PQLw+BaXHV8/1UjF4sJuafzRmSe5O+inqDPGtmg2Q2ENJJME1aoPY0iybKu
         jRdEt17FEkGsZlgznMyIbUVYzbTzzZvYaSBUCMtpSvlvWzx2PErsugbdomHUk5SYO3Wx
         ixZw==
X-Forwarded-Encrypted: i=1; AJvYcCWxN+9NZSsmTcy2acT7L8eztKYJFpXIxazcwOZCoEsSrTSS5YItiMrUpr+Sw3UQBXciLo9AH+2hS7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWcjsu4iFZTajfeTa3LJFskLrrasgbyDpNGCERZlsj+cOb8tVh
	3ypBknacM7qZXfW6KFpekOHHCtawSS6JGpsZnJv16kQZ2uqQPCl3ZFP3ILas2/injw==
X-Gm-Gg: ASbGncthpxesu2xh8CrnJfWSlmT+i0lxITP9ZHGlBakWcDP5/Rmn9fLGqegzrKiF2L8
	MElNTd4LwJvlkp+DdWr1oOw+OmbAPphpF7GVXQ/HCSQN6wYFcEXAt+DCsvC/eQWESgtWK3GEcVQ
	iwU4X0H54uhE35R+gDCfLlVdPUDyIl9bzQR+i5MjpWMN8NxCcHxw2nff7HWbzSP8t8J/EzAKI+q
	GD/VrDqBTNGhrk9HjaOSwfDB8velNYW7QkqG5ZHxzdecOJ3hNvhJvtNBvWkhmQkA/oPutEyJHjH
	wftJcq5n11MZDNbuMiWgH/yY4336twcCfEkjwLJoLJaBwslsKxh0I/KYZZ+EPjIbH1FlOr24Fhq
	hsSjq6UAdI6a5W8iSjJOXL5oGcp/TmuddHIV44ZFHXD29SVgTpy6Fsua2JAk9EeWN7tgWdabrDr
	jjxQ6jG7tjZ2MoRwvvqg==
X-Google-Smtp-Source: AGHT+IGRGxHkCR7V7xWervRFwYHMkNpFFiZAM0Oc4tHlJgeZxvC0/JlQ8PAbJnKm90JilP+lry15/Q==
X-Received: by 2002:a05:6402:3594:b0:61d:3e6a:197d with SMTP id 4fb4d7f45d1cf-61d3e6a198dmr14978452a12.22.1756988808480;
        Thu, 04 Sep 2025 05:26:48 -0700 (PDT)
Message-ID: <fb2918bc-5ca2-4b95-ab03-4e9ad4989db2@suse.com>
Date: Thu, 4 Sep 2025 14:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] tools/cpufreq: extract CPPC para from cpufreq para
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -492,7 +492,6 @@ struct xen_get_cpufreq_para {
>                  struct  xen_ondemand ondemand;
>              } u;
>          } s;
> -        struct xen_get_cppc_para cppc_para;
>      } u;

Which means the outer union could now be dropped as well. Which may help
proving (or perhaps even easily seeing) the safety of the change you're
making in patch 7.

Jan

