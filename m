Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85F976BB8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797535.1207514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokaX-0004uT-Nr; Thu, 12 Sep 2024 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797535.1207514; Thu, 12 Sep 2024 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokaX-0004sL-KD; Thu, 12 Sep 2024 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 797535;
 Thu, 12 Sep 2024 14:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sokaV-0004s3-Vi
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 14:14:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f368b1b-7111-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 16:14:23 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d3e662791so67439866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 07:14:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76f55sm6568920a12.69.2024.09.12.07.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:14:22 -0700 (PDT)
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
X-Inumbo-ID: 4f368b1b-7111-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726150462; x=1726755262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=itO5bSVGsaZ2sJNc4X+OHDHv/llsiQbbYiIrdbqPoso=;
        b=HKQ32bW0N33L+PJ9BawoZtnUdmM3PXQKD7WqsSGobsel0MeOb/OcVszoGP7XVnXFZm
         3CVrPotzsWXLmLkuc0wV8cAgq3odnZwW0SLA0JmH+1BTbAO6IEoGX+Ty2LO1vixtyIrg
         vHkM+CN2ahf/O1qwS8GJradAikptwiYXbfL356lPoDAEm/3KD1Dh5nogSS5wr0JKE8hX
         xZblzdXaXWUt4fzQIgPPxxRZbuv4CDUbc9HsTXEhKNvHqPPh+X4btzq9UOpjFMT+NSn0
         DBhO76U11IxjmOpSDVWqzheXDANFFLfzGu/KvsmqQaiwmKQ2mKXy67EnFcHP1QL4Ugtb
         SXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150462; x=1726755262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itO5bSVGsaZ2sJNc4X+OHDHv/llsiQbbYiIrdbqPoso=;
        b=V00CYVLhz3Q/yzIr0EUD0I1jVU5rq3s2XMAJwS/WyAby5fCKo9NGmZ4m9JSX1o7YrD
         ATyAOZCFSslHGSq8Pzq0qBtWBEotrIGLXyhRIZU+2Qx4GOcSR7ImgbOuAYDugslVXLIo
         qJdc1hXCt2Ou7SwRgetO7d7rO5VPvOmHF2MSK/ZWzFNnvSdM2h9gLIsW+nCEvgBlzPiv
         4OgBwWIN3WfcJBSw1tnsMjOpYEuOGgCEnZ5uhyHJR5IvKFh2sCTYTGMz7Vh6k3XmFK1T
         AG4KTIF3JMkrc/9TeQmEBtz0N29abT7LHpzLllvs1rWxsD1DPOhsJRB/CORFyxUR03B+
         a9zw==
X-Gm-Message-State: AOJu0YyAMTDIm9TQW607e2ROUzUKFbflvvsHtFH0yhPuwSpkJUdkBOd/
	q2g4x9N1MoibvCMIdrR3ioB7zOxqyl63UO6rkBYWt7oXAYVf/675Cjo7V7Fnwg==
X-Google-Smtp-Source: AGHT+IERKFVChFKugrUMzbrlARTuhb0BQFHQ10aAvXgDkImZq4NRBv5d997y8DjvmLAv3E/4m7YTJA==
X-Received: by 2002:a05:6402:27c6:b0:5c2:4cbe:ac17 with SMTP id 4fb4d7f45d1cf-5c413e05910mr3930382a12.4.1726150462291;
        Thu, 12 Sep 2024 07:14:22 -0700 (PDT)
Message-ID: <86b937d6-3cde-455b-9441-008f5323c11e@suse.com>
Date: Thu, 12 Sep 2024 16:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] types: replace remaining uses of s64
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <ab2d325e-0d91-4308-b4d1-06314ad5ba0c@suse.com>
 <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
 <CACHz=Zgwy0XVuiXwWt+wZaE0SZkvYSp2tk-q6P9K_oqFbRkb8w@mail.gmail.com>
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
In-Reply-To: <CACHz=Zgwy0XVuiXwWt+wZaE0SZkvYSp2tk-q6P9K_oqFbRkb8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 14:28, Frediano Ziglio wrote:
> On Thu, Sep 12, 2024 at 1:20 PM Jan Beulich <jbeulich@suse.com> wrote:
> Minor for the subject, there are also some removal of u64 and u8, not only s64

Right, which is being said ...

>> ... and move the type itself to linux-compat.h.
>>
>> While doing so
>> - correct the type of union uu's uq field in lib/divmod.c,
>> - switch a few adjacent types as well, for (a little bit of)
>>   consistency.

... here. The subject still says what the purpose of the change is.

Jan

