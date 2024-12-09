Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B69E9BF8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851728.1265755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgoz-0002Kj-G6; Mon, 09 Dec 2024 16:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851728.1265755; Mon, 09 Dec 2024 16:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgoz-0002JE-DI; Mon, 09 Dec 2024 16:41:21 +0000
Received: by outflank-mailman (input) for mailman id 851728;
 Mon, 09 Dec 2024 16:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgoy-0002J6-IA
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:41:20 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6abbf184-b64c-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 17:41:19 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso2362311f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:41:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21631bd2c2dsm39345285ad.263.2024.12.09.08.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:41:18 -0800 (PST)
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
X-Inumbo-ID: 6abbf184-b64c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733762479; x=1734367279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4KNYZ7a2I2dbgKZ1H8TKiU7KiDZpr7dlCDtIM0BRtjQ=;
        b=KPdBnifDNN+4YW696QHGCPkmqEh4ZaG58EjqQwejwyb/4LFpG0JyPsOiqs1f9tqkF0
         GB6f7Gyq6KbCyPeEVLycuSM+s/hOomLk7vP6EAYImMIBbz8uluO0yIBZ4BnFWIgmEkXr
         3+kTuscVYF5Crzf2aOaROdX3yzp8BYYvymt9boAC3w04MIK9y5hQcJJnOwn3iM6CVfgt
         7zY5o2N0jRzN2G+yR2PyPZIeZdMlwdEKqpK9e1kymeBiWrbnu50hPbgLkyN/+NCGwK3F
         PRlHtWhZYMjPKoZM0R0AWKrF7JJQ8897a0MheuDAHJ4Bt0xXSQdXbyS3gRGX6B/Oftsw
         K4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733762479; x=1734367279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KNYZ7a2I2dbgKZ1H8TKiU7KiDZpr7dlCDtIM0BRtjQ=;
        b=xAu485S/ZmDU/gTeVIwfj4iO5RJQtHG3m0sCr/8NtDMIDf4GysjQ6EgYq1/W2LZdEE
         O1MCAPRk2pIVUgZC6yEYnOPkhiJB0BrwR2wArFkaZGLkzwZCNaQN5xmQtZ6M9AAo+F+2
         FsNlpmvUU0SYQCig6j+uF5hzgU3HGDYpf5oCfjfVu9vaE+2ockW4VjmTD9TIDQ3dep7+
         +n1Fun2quVX9VEwyOF3lbGBurnXHC5oEaUGBTMTgtHPZoX6F6VQJyeoViqqUEBNYd6GL
         femeamhkc0VlyQVYllpjp4Cl3DLGvUlrDUTgBpiFE8Yh/YFqGae/2FWhX0sOtO6fANmc
         VEow==
X-Forwarded-Encrypted: i=1; AJvYcCVytweop8XiE8+qTSnGleaUv1dBikyQuG5XGgi66kSxQ52WdkxPrUQ1VPS4+PPjU/5GRysGhfNPUAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBtZZgYIATN5yB5R6QVJSAAgzBwemlZjcPBnXgU3zQTyAYC6mH
	h/EdHMTkQssRVAs9YGS0arf2AhmqqaDk4H//g/UOLh3msckq/i/3U+KlsBG5Ng==
X-Gm-Gg: ASbGncutuxDMLBDyu96cRxFVKl+z06la1dxRqEwxLHdASkvhA8iwS5rHQhooPODD1fE
	Zl1h+7hKtUPfRXyGJVwPpbVcNmoV7TAkYTQErLh19xg0OK/KREhReiG9Jd9sXxsMjcX+jjSfGFo
	8SmVwPySw/4lf9jtAZCyNYXTH97uf97zYDOXo/cI4NveZI7tghacoJbKo+k+3GsaPPl6YDTv3aX
	pgW0Ng/UmCWdTpcowcnvE16ec39+b/NMO13SZOzOPUL4EyAv5wg80s+FkoJXwOip3P1/3Ta4tZv
	enRhs43F8WpfrhgMJOGqpY4RpSGH88UpTPY=
X-Google-Smtp-Source: AGHT+IGSswVdTz6RYfKM7Udf1KRZagQ99uGclDqxsm93sTcIJLE3syDKgE/xX7b8s4q7Ps0AkQwvsQ==
X-Received: by 2002:a05:6000:2c3:b0:385:fae4:424e with SMTP id ffacd0b85a97d-386453fe4dfmr1028394f8f.52.1733762479247;
        Mon, 09 Dec 2024 08:41:19 -0800 (PST)
Message-ID: <1eb18f87-eb50-454b-89f4-5e7431fde285@suse.com>
Date: Mon, 9 Dec 2024 17:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] x86/xstate: Make xstate_all() and
 vcpu_xsave_mask() take explicit xstate
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-14-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-14-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


