Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDFDA6ED58
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926254.1329121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1HN-0002aU-Eh; Tue, 25 Mar 2025 10:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926254.1329121; Tue, 25 Mar 2025 10:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1HN-0002XP-Bw; Tue, 25 Mar 2025 10:13:05 +0000
Received: by outflank-mailman (input) for mailman id 926254;
 Tue, 25 Mar 2025 10:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx1HM-0002XH-4z
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:13:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc93d99e-0961-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 11:13:03 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39127512371so3551680f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 03:13:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b565bsm13498546f8f.58.2025.03.25.03.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 03:13:01 -0700 (PDT)
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
X-Inumbo-ID: bc93d99e-0961-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742897582; x=1743502382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iLpYgtVIGNlrXmuj4OwC0hAJFtD5zWPqfFUENM96ZfA=;
        b=OAx9Is2lRFl/iiQiDZiQt/fos5LkerqD4zJNldmdxjb82QfIyODReTJ6ppSp5Yvjvz
         YyUx4wgdIcIfOyAOttedLWIPcxFKHmpyEGrKMTHRnWNrtPGct4tnE1uLRjSBxftt9rdL
         uJNihkB6RQAtajom0hktdbHrNbIm9KqetdQ3hFXUioTHUMxjDEYi4rRPSPnVEnmurSRP
         6Hsk0XrToras8U/7h1aQEjkmnRzRMavp1V+5Hm8Z/DGTDUNEwjE3IVpoIIF+QE1WYBRa
         v3vhURrJlBfBEMvgEEIo9PquM2tchqOnr4iirxewtLlMo1pCQ3FNMscY3Ny7syDD2Wt4
         826w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897582; x=1743502382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLpYgtVIGNlrXmuj4OwC0hAJFtD5zWPqfFUENM96ZfA=;
        b=Em+b/Qql3mPUTvzf0yOyuxaeLFkaJjDSLk23Q8uN3iMZtoOK9oh13rVbo2WGt5gzGE
         f4pqnUO25jeJTw+sJRu7ybggXOzyAbURhmYZDvp2GYsmRVW8k3YroCXWeOKwyjnLukuO
         k1OT4aPIMu+psYLEUiOB1pLNUQgntjB+vlMcf83WDqgvVYUucqm3rKhTFcWyjyH0aAN4
         iUs4OkTy8ieF8IaYLb60a6UqRIfS/PN9ZXU8DQ+WvK52TgKEZc2DhSbonQVP8eq5kiP4
         9DL4fq/aXof+ANHiDD7CyuT6kbjHgCSn+uu/yPwXEArsVOuPrCoeYmb7omWkh7qFNHX7
         bMeg==
X-Forwarded-Encrypted: i=1; AJvYcCV00MnLZpjPedBA6YOF4mXFIfSYY5OmTYUP+pqpuIwWrza6ABP4uolfMO0Zgx6518MJVIQ0yF+oktM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWM43/OPJQ/XMiqbeXTFXj4jGM62yE81S+GpbqBLvk3z5/7CjI
	1NgrZRndlL8ox7/4s0EzdtWs8V1KPLnDIKaSrrEAXYdrJLcx35vvo+83x8I8pg==
X-Gm-Gg: ASbGncuW23TFa3YydfjqdnQ+lw+Xl2qjywg6DuMrbmtm2Rhv/RqFt2tzkbqezFG4e3p
	lt5UK8djs/jhDmB5idsyB8fU7BOZLq7Rnpin9ZajqlePSGRfAoaF7j7U9RiYUfTMtUMLcBFI1hb
	QaroqwU9ESaJrZgWcvvBmUzu0YZNuZczRrWOI16oMb+kOGG4UoEKCOR6lh3k+4LpmZImWSxeU9M
	8k/k8T5UjtV5gX5FFnu82TKS54kOcZXlChc9YySo3xwrxFb47qkvnA19ox5AZT1nARPAU68LpHy
	6a5zlbO7CHGa8XtsFsxmMR4EFADquK5qkCelsu0tErOffSzstGrpFMWQZ41b3+HgO6eq+OkROI1
	sfhg3ESILjfBACVDBjQJ2zERzTehTZw==
X-Google-Smtp-Source: AGHT+IEQ9vCptsaJS1SaW6VfjPQ1PqgBO4aWR2a4Wev9aHtdMoMNgNpQz9Dr6ePchkTsxUh0OpvTmg==
X-Received: by 2002:a05:6000:1867:b0:391:2eb9:bdc5 with SMTP id ffacd0b85a97d-3997f90d2bdmr14728240f8f.23.1742897582399;
        Tue, 25 Mar 2025 03:13:02 -0700 (PDT)
Message-ID: <624e002f-208e-4aa2-b60e-9df4700700ae@suse.com>
Date: Tue, 25 Mar 2025 11:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] xen/cpufreq: abstract Energy Performance
 Preference value
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> Intel's hwp Energy Performance Preference value is compatible with
> CPPC's Energy Performance Preference value, so this commit abstracts
> the value and re-place it in common header file cpufreq.h, to be
> used not only for hwp in the future.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Hmm, this had gone in already before you sent v3. Why was it nevertheless
included here?

Jan

