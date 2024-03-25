Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783978899D7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 11:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697683.1088703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohOJ-0004jF-1G; Mon, 25 Mar 2024 10:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697683.1088703; Mon, 25 Mar 2024 10:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohOI-0004hV-US; Mon, 25 Mar 2024 10:17:18 +0000
Received: by outflank-mailman (input) for mailman id 697683;
 Mon, 25 Mar 2024 10:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rohOH-0004hP-SX
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 10:17:17 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da6d4915-ea90-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 11:17:15 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56c12c73ed8so917904a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 03:17:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fd20-20020a056402389400b0056be0d1cd83sm2784122edb.97.2024.03.25.03.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 03:17:15 -0700 (PDT)
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
X-Inumbo-ID: da6d4915-ea90-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711361835; x=1711966635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmhhDUrgoZx/6SWnfQp+/r4QZSDmInPKyhk3TTbH2e8=;
        b=PSYoiM/jCN4pgZ8wjaeK3LrlF7E2USlJWKs9NOUyd/Wdc7OgCty89SMpJmeqxBOEpm
         RAUwnYggP/KruaOtPsfaHrXqWl4CLiDd4S9is06FDY8kFyBRYo9FGp4wsZzf5GQ10e09
         o7ZfCQIidG12CypEa74El1XwKuHcN3q+Xr4ZigNCp/gDRe3+FwxTngSP2PfWuNtbcskh
         HRXIJH7MLjka3ZDjuwsgmXOI1+FNacRGC84c9fEcf/ro/mxdgURFl71SCKuMkt4wz0K4
         P8kBaD0xRqC9qLc0l5AT6ZSar/XsNfa1hPFw93lPexDe5Na8I4xwVNSGQ9vbcs3B6ZRK
         gO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361835; x=1711966635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmhhDUrgoZx/6SWnfQp+/r4QZSDmInPKyhk3TTbH2e8=;
        b=OrVS09cJlueyf+rfl92ancwi9t8eDrWZXHgopB5PELG5IzQFwbTzGl5bJ0y/RWur1N
         k1paK7d3/N/KY6xOXmT/oflKojZ3SA42u9/amvoGJMwHz2stUrUn7hKWreIoA688zuW2
         fRaSqQJSsERxeGQyPGHpfG+1Wkt5r2jBdDVONIjOu0oRDeYRNURLZth8vhvFqNhmFpj9
         iv1qmMvRW136lLoRDdlZO7vOQvobDlOeZgtaX3HiC7rVg3ynJEcw8D8v6FR10FN+ANPc
         iTit/bJ8jK8XYTyoTsCzQwU9Blvf2v8KkBt0e2TzhJnHsICBC34hMzRds7RnMqJM2i1A
         zAyw==
X-Forwarded-Encrypted: i=1; AJvYcCX0J8n806zznuaUJZBZGlWzCizOTAeSyV8G/96bDY0Qw5A5htraLVuClbA7BMp0OnrVvL0De8AVXimS0l+dCu0/nfUFnbY11qI3oYEjdWQ=
X-Gm-Message-State: AOJu0YzjGqN9HxIVNpof7CNI3Mo2jnFwF1IXiRN5ZuKUlAvp9hkJBSxM
	z8SMq/fhIMq+HmkMoecCSceH6RzF9NvvhEdKbkUDCPvMjakBhd4XyNDn+gSTHQ==
X-Google-Smtp-Source: AGHT+IG9jaBlqDOGuRNFZeSLQnIQfedFcTBXFJma0CZ9AaOTjuOE08MUzx96uK2t9Jhf0A9KH+HwoA==
X-Received: by 2002:a50:cdde:0:b0:56b:9162:8e6 with SMTP id h30-20020a50cdde000000b0056b916208e6mr4817414edj.18.1711361835492;
        Mon, 25 Mar 2024 03:17:15 -0700 (PDT)
Message-ID: <0aa5a1a8-2b7d-4cdd-bcf1-530bedcd09a9@suse.com>
Date: Mon, 25 Mar 2024 11:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
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
In-Reply-To: <20240320135720.68894-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 14:57, Roger Pau Monne wrote:
> There's no reason to force HVM guests to have a valid vcpu_info area when
> initializing a vCPU, as the vCPU can also be brought online using the local
> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> of the bring up.  Note an HVM vCPU can operate normally without making use of
> vcpu_info.
> 
> Restrict the check against dummy_vcpu_info to only apply to PV guests.
> 
> Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Despite the Fixes: tag I have to admit I'm uncertain of backporting here.
HVM guests need to be prepared anyway that they may be denied use of this
sub-op without first setting up vCPU info.

Jan


