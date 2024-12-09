Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5310F9E9B56
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851607.1265656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgOx-0000iJ-1G; Mon, 09 Dec 2024 16:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851607.1265656; Mon, 09 Dec 2024 16:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgOw-0000go-Uo; Mon, 09 Dec 2024 16:14:26 +0000
Received: by outflank-mailman (input) for mailman id 851607;
 Mon, 09 Dec 2024 16:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgOw-0000gg-BO
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:14:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8822253-b648-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 17:14:25 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso2346717f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:14:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e59ec54esm2902988b3a.85.2024.12.09.08.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:14:23 -0800 (PST)
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
X-Inumbo-ID: a8822253-b648-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733760865; x=1734365665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4KNYZ7a2I2dbgKZ1H8TKiU7KiDZpr7dlCDtIM0BRtjQ=;
        b=MHTOmHH77TyE7KfmvmRZ585ekxXST92HTUbtbrShe/JYjJdghwpn+iWTTD4MwpLPqS
         X26hU+/o/KhJCqQoGIZTmS41Q0npjPHTLvDX9NCv8lNgNcOsdibapdhoSSgA9evdrygi
         GlNmxHEd9aN9wHEj/pj0hELRSWMWw3yiU8Asl8O5Ukkw05aI0vqDybScutG0uBJo3HQo
         t/Sae/bZ6wNSrspGHKHNzX/v5LaYtZw60sytZwWZCyZQrX7Gk3wDmfpN+fYRRrCOQOM3
         25VZ3qFtPRpk5LZpxYFfAw2UNg+14A8J6bgFDXGWzL44HhXL1aPedR5kq0BElp3GuvkH
         KV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760865; x=1734365665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KNYZ7a2I2dbgKZ1H8TKiU7KiDZpr7dlCDtIM0BRtjQ=;
        b=ojGEjP3wHJ3M307h7X7niW7etOTOYjj0hk9X1yIRrQsn0VtGqp/BeIRdkwSdFI1djv
         qD8VY30ip3Rcu+TPCmDqXCJNevf3wlbCk/wtYlAD6wEjsbZ/ICQl78bDukXjDJCiEqVz
         K/4Pi+pHBw+hKsY3laeZJaK/c99cEcm5+6mqTRN7R1TTyqVuvArptsFKhi7cF3tVyWWS
         7BVd3S6BQPwmkyYkYHIk1hyq2sVUE2NEiVbed+3Clb5OwQA4lUVQTxGeVSRupT27aeKe
         ulU00Ojn3deM8UndKeN09GOKC7+lN5tEwVwPTL/4Xrwq5upX/XkrzxghvTOlpJSx59hF
         frvw==
X-Forwarded-Encrypted: i=1; AJvYcCWiYb4wyhK8ABttmrHqA7J3gLrnXG1RIyLQKR/TNiD6APsPn+OySy8new8A3oUvS8F9zzMIRatpqgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzccC9FF/3xH9LgYDI4agdHHxRKrRhJBZ6WQZHHjeQuvSeLoGZN
	XQlGqTEMpSoYluKV5TE+b3AjdabXtlNnVdtn8MVvF3QfVUjm4KTLTbD3s0hl4A==
X-Gm-Gg: ASbGncs42lfAYJH+K8camyDV1VxEaOPpGajtpQVqFEityrWArhVe/EaxceobuGoitbe
	a4GYnTyplpnpB0rn2rF4w29PXJhOFy2nEmAeEivVWPprzoWfj+XGl3MDTyD2Y6I8OBOef8zaVDx
	Am97tZb22Puc104B4NZL+syq8HkIQRrx8GGV1C7pz8X797FwInHSNnVKrVUeR8CCKklMEhKmNm/
	60vAJmtkSt+0Dyu5gQzThMYgLHW9xiwidlwcVxBQZLdnkAbh0S/JRFM+5VUxZso4+vEm85CAzNB
	Nth+KwZJbTcn0kPVarQMshxPM2mFBthuq2c=
X-Google-Smtp-Source: AGHT+IEDkqxHYEkoxi4V34u1EsaX3FathzMs6FKXU5lBOq87a8WdDlxtTFcU3xKN+w/Lols4fhlHPw==
X-Received: by 2002:a05:6000:2a7:b0:386:3d16:9609 with SMTP id ffacd0b85a97d-386453dbb27mr907422f8f.17.1733760863481;
        Mon, 09 Dec 2024 08:14:23 -0800 (PST)
Message-ID: <c9f934ac-b142-4161-8164-7b0273e610b4@suse.com>
Date: Mon, 9 Dec 2024 17:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] x86/fpu: Map/umap xsave area in
 vcpu_{reset,setup}_fpu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-5-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



