Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92D82B01F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666285.1036806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvcH-0003z6-RX; Thu, 11 Jan 2024 14:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666285.1036806; Thu, 11 Jan 2024 14:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvcH-0003wm-Oc; Thu, 11 Jan 2024 14:01:05 +0000
Received: by outflank-mailman (input) for mailman id 666285;
 Thu, 11 Jan 2024 14:01:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNvcG-0003wP-KJ
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:01:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db7330ad-b089-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 15:01:03 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e60e137a3so4836185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:01:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040d7b340e07sm2030224wmq.45.2024.01.11.06.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:01:02 -0800 (PST)
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
X-Inumbo-ID: db7330ad-b089-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704981663; x=1705586463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tWGNgmdvuBAwsyVsRXMboLPiwPKGcnepfW+S3Qx+oYk=;
        b=THo/w49+pOlRW8l0WaSZzGphpDh16s8pFA6vhGOWDtlyQtEQaTvRA7zS4cqf4TKBqa
         rZKh5OnNC4mPl2ETH4wwephH6M6J31W8cwzM5Lmacb7KrZ46zMy6jRGx0JlJ254+MRJD
         e8FGHN41fvko1Zb02PqjGKteoUO1gkKZK0MG6Fbw2L96SptA9/zcPExgDL2TAiMK0+UI
         BTw3n6+XGCtmBkF/caBIRkjO/bRJlCy3rqJ9I7JPAGMjkGhNboLZeuuPEy6Qktsgx234
         1GfnaXoaD7cTcl+vWizm0ZchjFVMQivHmab41W4i7ySAPJIc+O6Zb5PeCxvhxI9t863b
         Imog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981663; x=1705586463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWGNgmdvuBAwsyVsRXMboLPiwPKGcnepfW+S3Qx+oYk=;
        b=kUJPAjNBInTLm0F1ZJGnH5IfkWdKhMiq0NAGF2icDGXO9GZcV2SYPkffWLXl2EJd3h
         S2gLUVFLE/wEDa2B4CMeovdLr0IDu/byuO/DPuXuRKX8ZGEKlaeml20N+Ucp40WZpsmi
         TAVfo0/2u9wTloKHQNx5WQbtKDy3m8oRFXTv+HFCEHBG3rlF6UDF8RYSClmOyjNkmiyH
         +wkl242wI1wmmN4xdIjIQY0oGFxr+VJGMNgcmJLqkQXmV6SsgYwsmJ1R5RRlRf/z8rok
         DiQN0VU5mR+1q/x1N5BLbh1qMtuBiaBaE1GyhJDtFTm0cNCnGXWn6NTVyvF6kLY9MnBC
         s98Q==
X-Gm-Message-State: AOJu0Yz/PwjfuSQnuQHBWlbNX0MvrLkcM5bKdU9OR1ARJ8HYOxAx6nfm
	+srdmeCftnJr6/q0miQz21GlSNyxKsPu
X-Google-Smtp-Source: AGHT+IFEgchcuzJCZsW/Qkxj/PDBUM+8vRelxoNuoHbs483tbOHtFkvDxColH6k7S+e+kaT8rFYBCA==
X-Received: by 2002:a05:600c:43d4:b0:40e:59d2:354d with SMTP id f20-20020a05600c43d400b0040e59d2354dmr488013wmn.151.1704981662937;
        Thu, 11 Jan 2024 06:01:02 -0800 (PST)
Message-ID: <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com>
Date: Thu, 11 Jan 2024 15:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com> <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com> <ZZ_di8pZB8bWtBuX@macbook>
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
In-Reply-To: <ZZ_di8pZB8bWtBuX@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 13:22, Roger Pau Monné wrote:
> Oh, indeed, can adjust on this same patch if that's OK (seeing as the
> issue was already there previous to my change).

Well, I'm getting the impression that it was deliberate there, i.e. set
setting of the feature flag may want to remain thus constrained.

Jan

