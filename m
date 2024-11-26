Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007BE9D95B6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843547.1259177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFszv-000446-Q7; Tue, 26 Nov 2024 10:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843547.1259177; Tue, 26 Nov 2024 10:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFszv-00041Y-NW; Tue, 26 Nov 2024 10:40:47 +0000
Received: by outflank-mailman (input) for mailman id 843547;
 Tue, 26 Nov 2024 10:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFszu-00040H-D4
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:40:46 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e29b8cd5-abe2-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 11:40:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4349cc45219so22106045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 02:40:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b4642b8dsm225168855e9.41.2024.11.26.02.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 02:40:41 -0800 (PST)
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
X-Inumbo-ID: e29b8cd5-abe2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUyOWI4Y2Q1LWFiZTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjE3NjQyLjY2NzY3OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732617642; x=1733222442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7+a6reuUcUA8C33ajglZrnVspJZ1Ux46Py6Q6jFCaD8=;
        b=CfModxsNMcaEUBoG6r/caSOiT11e4A43IT8yk65RPlyaCTtsGLi7Cq+hoOIAROy543
         lQsqAWs1WcsKnYY9YFobtLFJWXz3kgyZAN84DRjKljB2hiUFO/9+5ENOsPcwSUQxCGLM
         mBdjKPQZpnc3UEMhgHjpK8uMVDG+n1lh6l3KYQZO5ry2OFIKPyFWb+NdZqbHQOGXFnyc
         In8ttEhnxbo8DdmXd3hsLaGPSLEAPpg+flTmcV0zRO2ML43ZAHBewsmEwcFyQXL9Qnlj
         tO4xkwZZ/a2/LNPWI6Cy5+b6Z8vnxgnmTS1kkPJaJ8iM+IcEYjJzZpgw34xcBM1e8i8k
         Ecew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617642; x=1733222442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+a6reuUcUA8C33ajglZrnVspJZ1Ux46Py6Q6jFCaD8=;
        b=DsaCVB+5wBLJqdLeNehOMG61C9A/dYv58RMrtNOjv+vAJrfDChg0HlY3CTGUAkoLnE
         ept2xTS3xSxNppQ+ga6pbU9XCoNZbKucEbyq+qS43BJTFZz4lceR1+/nkj20EXifAI9o
         QxE2zsHhgZrmUSioc7SR+9foA3EqQliCUU3zDJNvHfxOXVIjWavUWNTVEzEwMqF4Ld2r
         S5BfitGSfckIfTg1opIKI4MQEyby4NiQJtA4I9C4+t14TnhRWYAiu0XmXE1EKGcJxN3/
         0FwiI242sEH8dT+UsHFS7SzB8R49vDhIwStRSpXTsB4LtEFZL0tZ5slbZWYSLY+BlUo8
         3k0A==
X-Forwarded-Encrypted: i=1; AJvYcCXaCXVpAt2JQSk8K0u5xC0lhp2dLeCE1IjG8u5ni418RgxSHGl1a5AzDP33W0JX9STNsju15Mgm65s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6PXHWPc1CgFtr98ze7q6UdppYX5z9lDZFrf4l4RM9fUvRfAt/
	7928hyJI2TTvY7+tvm/fYlsArrSPQsPpEzKRuTa2AuuKApke3xcjXWPc3tgZYw==
X-Gm-Gg: ASbGnctB0hnacr2XodqptPqwD5IvAN8wmp1LFFNhc6uLhimtrS5mXrR+qWqVhvcnUm9
	4XlfgkwcCqmqN2xC2VtCY4v3HqEB7xXx/PFwiBMyiedlo6EwxNWWD51LcFdxh72DV9hyYmggMJ5
	ZFrPdS3sPo6MTNUtN+wsthdKBZmiVCUYBTZM1cBM5bgDn07JRazadcM3erk0FLeYvRjj8CJr7oN
	KnAJEjPt0Cor9q4GApeJNlNcvW62K0nYgi0t1EX9mYRLDzFRJIPQ379VuUxVT12Sx324TiJT9m9
	kyhgS+nNPfvq/ilnKcqkNpLFIPyHfGa/Rrk=
X-Google-Smtp-Source: AGHT+IEyf++FdIgM+bc8VdI5FYaUkYCTkMuc/PBCDm3Pd0xG16YkxR4kaFSnQa6W83AmDmnGNmRSQQ==
X-Received: by 2002:a05:600c:4f4e:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-433ce426837mr161359035e9.16.1732617642060;
        Tue, 26 Nov 2024 02:40:42 -0800 (PST)
Message-ID: <db4de7c6-c955-43fd-ab25-947809f357a2@suse.com>
Date: Tue, 26 Nov 2024 11:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: Validate __copy_to_guest in
 VCPUOP_register_runstate_memory_area
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241126102653.25487-1-michal.orzel@amd.com>
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
In-Reply-To: <20241126102653.25487-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 11:26, Michal Orzel wrote:
> For guests with paging mode external, guest_handle_okay() always returns
> success, even if the guest handle is invalid (e.g. address not in P2M).
> In VCPUOP_register_runstate_memory_area, we would then blindly set
> runstate_guest() for a given vCPU to invalid handle. Moreover, we don't
> check the return value from __copy_to_guest() and return success to the
> guest, even in case of a failure during copy.

I'm afraid this is all deliberate, providing best effort behavior. For a
paging mode external guest, the handle may become valid subsequently. If
any __copy_to_guest() fail here, subsequent update_runstate_area() may
succeed (and success of the actual copying isn't checked there either).

> Fix it, by checking the
> return value from __copy_to_guest() and set runstate_guest() only on
> success.

_If_ such a change was wanted (despite its potential for regressions,
as guests may leverage present behavior to establish handles before
putting in place mappings), x86'es compat_vcpu_op() would need updating,
too. Plus what about VCPUOP_register_vcpu_time_memory_area, behaving
similarly?

Jan

