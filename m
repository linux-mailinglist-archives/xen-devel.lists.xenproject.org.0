Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE8DC58DA9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 17:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161920.1489738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaVr-0007qI-IH; Thu, 13 Nov 2025 16:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161920.1489738; Thu, 13 Nov 2025 16:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaVr-0007nN-FK; Thu, 13 Nov 2025 16:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1161920;
 Thu, 13 Nov 2025 16:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJaVq-0007nH-LF
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 16:49:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bae840dc-c0b0-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 17:49:33 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so131088966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 08:49:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad48dcsm197981266b.25.2025.11.13.08.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 08:49:31 -0800 (PST)
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
X-Inumbo-ID: bae840dc-c0b0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763052573; x=1763657373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mBDAtgpture23e+Y1P8BA79C3krkdcCq1Kelp+HYmI8=;
        b=crtz3I1iwEgYSZ+HWfH6vHAj3kcLOi12a2Rohia+1SQ49geCCpCqWKt88Z5hxPhErL
         MwZYvtvI+QBQxT0T9VlhmHCfgpWzlczaeKKjEZVevn0PdTZL6weczzfi/SDQGcNo+X78
         YJ15Li1nmq4uBfnrwqIhuAzt65NDc+IA+Mpu5zXHLgxvv1atgyIA16TYt0BtaOP8e4J3
         CeYS3xOXC0VQDivJ2VQ7SSfYGIgBVID1tMMaX5YBZZIQAmDHrYISWCgOHe5EMryAppba
         DEWyoB/js0VggMgYsedWSxzVjKurV8JcVJj0/PnjToTQRxlm7Ng/Ffu6aFdCZ1whTYQa
         tCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052573; x=1763657373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBDAtgpture23e+Y1P8BA79C3krkdcCq1Kelp+HYmI8=;
        b=dd0/dgOHfUkAClWcXtpnhc20Kow5TYhwpCgB81v0/t5A45Ei142D88Dw3VA5P7P3PO
         4QP+EE1LDEjE3RWST+wc7om+aD2mwkRw2H9LwuFx9P8d9Qv2gxV7iZdHa+wkSoLkmeBW
         A9bRijcgXtwUk5e2+q2P8V37biBhKTxM96IAkJ7ft3kyWDrxAeHrqI3G298tQxIgyJpd
         XS0De5DpW4+ibBptti1yL2E3mnBy4PPhNmGSCIC0FeA1J8PX1s1cJ8QLirt7bwQyJtf6
         1VUyEJM5lj/BqqdD/Kl08mp5P0BdMH28jZQluLYhKhzvVrCLqVAFD/QhZcGJjX4ukDFY
         1lfw==
X-Forwarded-Encrypted: i=1; AJvYcCWNzJqivLFZPLXHmEZq2fdvlZTAZomXeqzT7y9vZbfUdiWrm8sJKjuQYFfTHgql2J59i+WNBAvDFUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxoX+XyBxapnRrvLs9d39hN+pdHCu+ZFMfszuIEUSLf1aOZ0Xx
	5TOw4rHtAO9Nj01KvjuaE8TkfVs6wM7LRN4cLCnv+IREBX4F/sKB2ows3/+PDjhj5Q==
X-Gm-Gg: ASbGnct9cEwSNzr93nfLoesKn8cfw6xHh9kAri3vYs/wZYM99YSk17haU9GRsrfaKwf
	Bim/qFy867k2bZzD4HgBfmm8mm5d2QcEhW+HOY0l/f+dGAGK2gd41Y+fkLnRotZH8Rjmv3EWzJ8
	4RdPRPhsoGde7NAWP8v1GKZoGaw/V9hshxmRyxxHfxGB16hD/Olanj2zoDmi5NrlKtonO1SXxiC
	WGYO6pjFopMEdgbhXlncnUBKy/Q79OIbqlLBSNnpeLlbGf2dzn+5y3zANbDyw6xJUpHT8SGGV5v
	Tlkg4VGX4tDVJ3Mkl3Ua2XWMcBobJdYM4GM6B32m9RUtuImBM4o16gOHF6yDAfiKDup5Wx9ArRV
	Eyyy+Wtz2c7Aw5IxQCWRYLzAgBE6rX/byS/Uq+MFSHhXCXz1eFCFK9j1O37wnajgNZwbgJbJPOT
	fuF38eM/yp/AbJ7T3bqPxyDV4WYU6JVDaLCenesaC82rIW1vkdwghla15L/BafPXavxUTZl30us
	rA=
X-Google-Smtp-Source: AGHT+IFCk4ytL6k9q2qaDXrS1Fn5Xzvl3Hi/FRCSWYJ8OQowGcUy+gIomxu67s3q4AOGY8fYdGxhXA==
X-Received: by 2002:a17:907:6e93:b0:b72:9d0b:defa with SMTP id a640c23a62f3a-b7331ab3429mr794732266b.41.1763052572479;
        Thu, 13 Nov 2025 08:49:32 -0800 (PST)
Message-ID: <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
Date: Thu, 13 Nov 2025 17:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] build: add new make pattern for making file from
 file.src
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-3-jgross@suse.com>
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
In-Reply-To: <20251111161959.13667-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 17:19, Juergen Gross wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -159,6 +159,20 @@ define move-if-changed
>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>  endef
>  
> +PATH_FILES := Paths
> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
> +
> +include $(INC_FILES)
> +
> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
> +
> +define apply-build-vars
> +	sed $(foreach v, $(BUILD_MAKE_VARS), -e 's#@$(v)@#$($(v))#g') <$< >$@
> +endef
> +
> +%:: %.src
> +	$(apply-build-vars)

I'm not convinced of having this here, rather than in less central places (say
under tools/ and docs/). I'm also not sure I really understand why it needs to
be .src - can't we stick to .in, enumerating the specific files that want
generating this way (thus avoiding accidental attempts to re-generate files
which need generating a different way)?

Also - why the double colon here?

(Maybe I figure answers to these questions as I look at subsequent patches.)

Jan

