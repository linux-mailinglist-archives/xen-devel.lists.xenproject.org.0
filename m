Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35F8C851C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 12:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724035.1129227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vBS-0004sn-J2; Fri, 17 May 2024 10:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724035.1129227; Fri, 17 May 2024 10:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7vBS-0004pb-FJ; Fri, 17 May 2024 10:51:30 +0000
Received: by outflank-mailman (input) for mailman id 724035;
 Fri, 17 May 2024 10:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7vBR-0004ou-C3
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 10:51:29 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f2be96-143b-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 12:51:28 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so1955403e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 03:51:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5750d24c8c1sm1953881a12.72.2024.05.17.03.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 03:51:27 -0700 (PDT)
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
X-Inumbo-ID: 69f2be96-143b-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715943088; x=1716547888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8aXRxHrsWURK+LT/SUII3cdbVAWn4GY6HQxQg8SYLM0=;
        b=De17KFxUp1T1YVJHp4OVGN9LZtO0UZf5zIR2yVuNPtN9EWQZQkH4oizM0tbW/vmBjA
         gW+dhGPar6spB+y8WPVV9C6L8f5vIVupEWnZDdvPtUvRaM7aewmlsYCvx7lHG66rFbvC
         RCSlXFJ4YiDfiVkHbDGX9A6qttU7/iSIpLox7S9AgyUnQfUFctxZNfeyrudXHl+T0P11
         9aJ3DmQn7IAzjq1NbqUxTk2sj6sQeisD05fU5gc8H+PoGsC/VtLEvFhfpMfNY3ezknDk
         X8a6PDz0vTtXrxOvx+JI8dIzulhWvUAXcq4ldxl+hs5A77lks71c5xFgZOpRbtiKRcPe
         DvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715943088; x=1716547888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aXRxHrsWURK+LT/SUII3cdbVAWn4GY6HQxQg8SYLM0=;
        b=OMRIGj+D5f3V3v55WK1xfd0pizcrT0n3cTcBEzSjqkrHR1/3hae/ffcZOVT48WTeC4
         Tn0AsIQXu9TQ/xV+82v/Y7qU6/MlNRqr+8f9SEPXyEHWqbh77Be4iuCPf2emPKjObXnT
         ajOpRX1Z+u/i2bu69f/Ekd4JXSD0ncLOpuLV7jOFqclnzkkvU3tJd+t4i0j6GgakoBia
         BYbc0dkMtzJVwGUEPPWBA0vCmdSWTk9Gb8LR9cezEwN4s58YkQzE4X5ca4UPNYEmkXcu
         mRwijmnHj2z9FichjevRNZ6UiolLRlKyyHq2orAMGjfK33eoTqV31YDbtcm4zbg7WQ2x
         y3EA==
X-Forwarded-Encrypted: i=1; AJvYcCVw8LI9eD/omZhd49PqSctM/4hjsj/qXzQF/msJK6l3eZ7Vkb9QClqiLEra6/cq9aVimdUCpsfPbN3ZBztjllaUrQaLSOCwnwpALiH7wS0=
X-Gm-Message-State: AOJu0Yy5mTiGY+dqf5ZqRrf2uzlelqQTQuJ972BNkeaustcFXcr4WqgU
	17W11D45j4xIMyqgULJBncuhXD34tyvX9GBr+GO8MPxAg++4zXf0En/oRzcOrQ==
X-Google-Smtp-Source: AGHT+IGfZjbE6U2m/+wPZs6sFNF26OyW5wKHcGOalxDvshvoy2qJCMrLv7Yf5LTLZpxjSrzr2Rwxtg==
X-Received: by 2002:a05:6512:158d:b0:519:5df9:d945 with SMTP id 2adb3069b0e04-5220fb77429mr19477391e87.4.1715943088084;
        Fri, 17 May 2024 03:51:28 -0700 (PDT)
Message-ID: <b10e68e2-3279-471d-a089-c40934050737@suse.com>
Date: Fri, 17 May 2024 12:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 12:45, Chen, Jiqian wrote:
> On 2024/5/16 22:01, Jan Beulich wrote:
>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>> +        if ( gsi >= nr_irqs_gsi )
>>> +        {
>>> +            ret = -EINVAL;
>>> +            break;
>>> +        }
>>> +
>>> +        if ( !irq_access_permitted(current->domain, gsi) ||
>>
>> I.e. assuming IRQ == GSI? Is that a valid assumption when any number of
>> source overrides may be surfaced by ACPI?
> All irqs smaller than nr_irqs_gsi are gsi, aren't they?

They are, but there's not necessarily a 1:1 mapping.

Jan

