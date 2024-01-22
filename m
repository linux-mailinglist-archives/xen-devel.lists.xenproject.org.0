Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABDF83645F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669886.1042375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuFc-0008Pw-3O; Mon, 22 Jan 2024 13:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669886.1042375; Mon, 22 Jan 2024 13:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuFc-0008NS-0r; Mon, 22 Jan 2024 13:22:08 +0000
Received: by outflank-mailman (input) for mailman id 669886;
 Mon, 22 Jan 2024 13:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRuFa-0008NG-DY
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:22:06 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bcc1891-b929-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:22:04 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cdeb954640so32033761fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:22:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 19-20020a056e0211b300b00361a84b89cfsm2495832ilj.51.2024.01.22.05.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:22:03 -0800 (PST)
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
X-Inumbo-ID: 3bcc1891-b929-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705929724; x=1706534524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xrEr0s+vULsLiDCmFWcy2xaYI8X1OhqjvVU2ut3dePQ=;
        b=VidTBv1Mkw9J+fIemCcpefxme8FuJAvI4tn1zNHRwl68bKLaXzX6/rvg0yAmxtFEY2
         dZR0rU0JKk4jG0G72VDW3MbifDUoToXPJ8dH4s6qJ1KAkxmgs6ZI1TrfUWKONhJQtsGw
         idrNo0K9uCalYHEuga6Oq+f8r5eRpA50cqx9x9BWaA8LufHN8mLZqLY4GZfQEVq+lJTi
         6VwCX3PRz0uETRfw7eiLzJAjZwAyEH9II6UEDoPJOJ2VfzIgkCIl722Thquf13u3qWro
         +k/tWnoE8b/4XSMLLZkh5QexQ9VOvayj47z0qCBpEr1Fd0Hg5Wiwz0zcDRC4hpdR7nqj
         cB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705929724; x=1706534524;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrEr0s+vULsLiDCmFWcy2xaYI8X1OhqjvVU2ut3dePQ=;
        b=cXufTV7zbKEbkw1khI/whLe8O1TmXfkR+kfoVH5LMR3MDMaSfc3bsuIXPo+hCVgB+k
         A9IsfYRsR+Hburh8+Erqd3aTIHSGbRKnnIS8dagIScZFPfsVBdo6119uOqXdlBzEEnzo
         KRzg/1/TCGOmQ3fLFmHfD98AtHgKxqnEHK8mOJ9XZJJLxpA68LY4zjqYpaWwjMXKEIL7
         C7ubQt5nl56HvCEzqaSofRvIpqHQVDFxeL0g4lpHoWvRn+dGPOE9agArhoysr5PfBlEa
         zq2O8bkqmcFQcEA5gfKt933HnjSdgn5LWVjVte9rk4vconAh4PkvNVzr+tSSyhEvDDZI
         7oSQ==
X-Gm-Message-State: AOJu0YyY/AKpsBfGF6MG3T1C+8EQuO1lRxenagI2Soa6Ftr5phvKM7MD
	Xw8+Vb+tf0s5Hnijt5gB2BrRp1HYeIvLWfIa76Ih2x0RZolecP5H/Pe3w9JmrA==
X-Google-Smtp-Source: AGHT+IE27jCk0c3GM+W7lT7StpttsRWc49ETu+Q9z32125Z45BJ4T9QGBqUWMoMQVOEQ3wkwMOFx7A==
X-Received: by 2002:a2e:8ec8:0:b0:2cd:4ead:9103 with SMTP id e8-20020a2e8ec8000000b002cd4ead9103mr1536527ljl.97.1705929723966;
        Mon, 22 Jan 2024 05:22:03 -0800 (PST)
Message-ID: <362fb92c-98a9-4ec8-a715-cebbc5321b36@suse.com>
Date: Mon, 22 Jan 2024 14:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] Arm: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <7871702a-b5ca-4430-b282-148b46fccc71@suse.com>
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
In-Reply-To: <7871702a-b5ca-4430-b282-148b46fccc71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 15:36, Jan Beulich wrote:
> Use the generic framework in xen/linkage.h. No change in generated code
> except for the changed padding value (noticable when config.gz isn't a
> multiple of 4 in size). Plus of course the converted symbols change to
> be hidden ones.
> 
> Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
> use site wants the symbol global anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> Only one each of the assembly files is being converted for now. More
> could be done right here or as follow-on in separate patches.

As this was meanwhile committed, I'd like to understand you preference
for further conversion steps: I can certainly see to find time to make
some actual progress here, but it might also be that you prefer to do
so yourself. Please let me know.

Jan


