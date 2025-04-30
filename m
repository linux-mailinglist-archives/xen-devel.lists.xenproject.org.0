Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8DAA504F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973742.1361799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9Qn-0003IU-Rx; Wed, 30 Apr 2025 15:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973742.1361799; Wed, 30 Apr 2025 15:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9Qn-0003FQ-O7; Wed, 30 Apr 2025 15:33:05 +0000
Received: by outflank-mailman (input) for mailman id 973742;
 Wed, 30 Apr 2025 15:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9Qm-0002zd-Jt
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:33:04 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6783cad9-25d8-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:33:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5f728aeedacso9089183a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:33:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7013ff4e7sm8854503a12.22.2025.04.30.08.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:33:02 -0700 (PDT)
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
X-Inumbo-ID: 6783cad9-25d8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746027182; x=1746631982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NCTsPDSGYcfXO0Ph3zyQARJhIZesUwt7UeFdOU7TMa8=;
        b=BcN8vHNazPYZjMk0K4Vl+9D9avcTB1V9mWN0/FGVLL3bZiB2WzsxplzZsYnt4PLvvR
         DsCIpP7HSqFc32CBJETosuGe9LSc+Z9GQY95aJhqc0GP5dyAEogedMKsxcxB21OHuh7+
         SY64FW+HpE0NTc+2upUX41wGgTnkS1swgR67KupxiD8vvOsOUC3B2A8cXz5sRAGcruN/
         T5awYA4X5HVYaw5DHhGKayd9/zAB5cyfccRD/RIO5u4cvk+tQAg7vtsO7CuSwuCo+IFr
         b3uk3lDBuud5Iuqmw1Rs41iPmTesRSGVOWy54ZJ2dL1pj1/ANncZgCJA2IJ8CLMxD1zE
         Inqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027182; x=1746631982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCTsPDSGYcfXO0Ph3zyQARJhIZesUwt7UeFdOU7TMa8=;
        b=QLeY4eLzMiK74G8DpyYmHxLTQAZBMLIfLFKYO7X2VfdQMAlb2HHttM+r9DXrxrTPFW
         HBxIrE9QEAMNX7vjArFgBVcuPoQnyX0DpR4d1izxbVU+br5qFXYa2ojggwptMieMYgS/
         KsMRd5uxIW6105w6JFeQKJUsCimVSCtSKbQ8K+pdyJ8/4BevQ0AeWEmrrvF3IbIKmLjK
         1svfEyw1DT39fmcRwhoThXfhNOZTfIBpP7rPqYloL+2wdcOkP6xFOl1Pr2XzpT4CEcxQ
         DbkUOVTYFo0VncJOTzHPJCxKmlZovnTThjYD39Oxd68e+iSpmj414r70eaAjbeAQAUHX
         6iVA==
X-Forwarded-Encrypted: i=1; AJvYcCX8hvcbiYqk1w6GGYEpHO5IU3tGQVp/Bc0e+iJJcBvqVoOm38JYKoHVQ5S9ez105hWvBIXQutjteAQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVIQ79K9LbkPo+2qVHOFeF/Yy0kKn/SICpGWezXqeDls3AUs/I
	20seFRB3RsfcNtFYTrDmHtnOgSVJyGDmC1FZ1p99byk86dk2clLicGLFUr4fCg==
X-Gm-Gg: ASbGncufLXLa0y7/kVxkvN/W9PGHsNClZwbxPWIkpFkrAkIpv361spx7ySFHQXG8N+X
	EwOhwesWAde2UaXbOfzJ1SDxUqMFgn8fa195H+qcMuP1sTJh6nimqIks28NLaBCdoEPxmvnoor0
	mPzBvZ2mhrdu/P2lbi7P2nsZntv76QPN5phCY7CfGnJwCb2lQFgaV1qKpw5p15nRXSKi2ynjskG
	WgrHRHOX/Psd5tePJgBoVjp5bS0xCwGdVgI/xmV4lLRsYdmG2DQ+Cf7hUWo0FpcJWXH0ATkEwCi
	JYfxFYjM32o+jamsegGmTXdmzKE2+/+Gyi/EzhjgmDaRT2JpcZ/J8ISGg7G/dMIFn2WPsI+4e/o
	xYRugzOFYiTMUtoXE7YO7TCODwA==
X-Google-Smtp-Source: AGHT+IGgIFcPXbVOu9t7FLeJhNsajGLQiBTun22n8N68zo4N+3C9xmevQyrRpEHMGnQtPDeWpfcWPA==
X-Received: by 2002:a05:6402:268b:b0:5f7:f55a:e5e1 with SMTP id 4fb4d7f45d1cf-5f89be21647mr2981591a12.24.1746027182495;
        Wed, 30 Apr 2025 08:33:02 -0700 (PDT)
Message-ID: <2c00e3db-1931-4e73-a40c-907dfdf314f4@suse.com>
Date: Wed, 30 Apr 2025 17:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: Move mcu_opt_ctrl_* into __ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250430152720.602045-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250430152720.602045-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 17:27, Andrew Cooper wrote:
> They're only modified by set_in_mcu_opt_ctrl() which is an __init function.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



