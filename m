Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14904817180
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 14:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655987.1023907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFE8E-0005hB-U1; Mon, 18 Dec 2023 13:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655987.1023907; Mon, 18 Dec 2023 13:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFE8E-0005ee-Qo; Mon, 18 Dec 2023 13:58:06 +0000
Received: by outflank-mailman (input) for mailman id 655987;
 Mon, 18 Dec 2023 13:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFE8D-0005eX-Ki
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 13:58:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7631c74c-9dad-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 14:58:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so29657465e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 05:58:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0040b632f31d2sm43018361wmr.5.2023.12.18.05.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 05:58:02 -0800 (PST)
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
X-Inumbo-ID: 7631c74c-9dad-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702907883; x=1703512683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GyQrSRSCGAFsbstRqubNv6AvRfxrPkij+L7T9YVmuG0=;
        b=b7cNMseBTHkirEZk5Llj/rD7PPhDeS9mJu5bLQfxk4TDraC41vTMca+ruUGyQ2LIlo
         Jb7Ddcz6xd4l7a5hzL5qQRmaKdbcfRVSzQ7jLYZ+vms6QZSiTxWqM28BavgB6P2eEAS9
         YCaW5InYHywgh0o+fKPgEdZYTJGTRbVkI6yszXc++UHqeBruS4m/i/VNgKygnhmCA6PN
         Aa5ejwXWtzcKYRY6fx5Bhqpy6pc3r7MwnffJc0ReoT0/gkwPLTdPCOnpCqbVO3FARGjw
         Hx1SQ2CDcHx54M7+egD7KyUfkkCX1l8X9ooZT64d2dYCg/mMsb3ZX4hTbKL0MXYRlsqh
         Ko9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907883; x=1703512683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyQrSRSCGAFsbstRqubNv6AvRfxrPkij+L7T9YVmuG0=;
        b=TxjNI3vAMTQQloU+/KijWC8cxXlGnrQS9utosDD+VeZV7wi0lzM450Xw0cz/HTDlC9
         KM+yB/qlF6l0Qca+QtXeRUUmwOQDca3MnkoaLvClcfJSMka35cA1v2u9Fgw7Hl6LuumN
         4GtLgG+YNQHehbI9IWaV7u4xKj2c1n3md4/fh8JPzYhBL7vObaLrMEbxYEam3Xbd10Mb
         rW+/pTMLgCu9d3zSrvuvwvSmrHp9HuHKmficxNKis8wWR7Yyizh+vusKAXt/ckLjFa08
         uOoLE35vU8ZlXeh8T1jBb33csLl3wPQJ3Rh2xCJ+SvR3PhrWlA/rsj9TLEqP6ShHweHW
         45Mw==
X-Gm-Message-State: AOJu0Yz+B0rS/CVBH4a6sOgg3qFTneRh37/k2wxBxy8a/WCfkIfkr8IO
	vSfMGOIRpKQWg+H7Zh8wK4f1
X-Google-Smtp-Source: AGHT+IH35fQbtMpq2sadzdVXv1VSc7lpdaBQdXgcyoyGnOh/M7Oc/uuzmnXDz2lA2Ip6ew3wQatrwA==
X-Received: by 2002:a05:600c:4c8a:b0:40c:d3a:2447 with SMTP id g10-20020a05600c4c8a00b0040c0d3a2447mr10062550wmp.87.1702907882841;
        Mon, 18 Dec 2023 05:58:02 -0800 (PST)
Message-ID: <c618b09d-c9eb-4f2b-81bb-18c486ba6ea2@suse.com>
Date: Mon, 18 Dec 2023 14:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/spec-ctrl: defer context-switch IBPB until
 guest entry
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <83c2a504-bce4-d3e7-1d9a-76ac0ca17bab@suse.com> <ZYA9ap4dB5nnFCu3@macbook>
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
In-Reply-To: <ZYA9ap4dB5nnFCu3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 13:39, Roger Pau Monné wrote:
> On Tue, Feb 14, 2023 at 05:11:05PM +0100, Jan Beulich wrote:
>> In order to avoid clobbering Xen's own predictions, defer the barrier as
>> much as possible. Merely mark the CPU as needing a barrier issued the
>> next time we're exiting to guest context.
> 
> While I understand that doing the flush in the middle of the guest
> context might not be ideal, as it's my understanding we also

s/guest context/context switch/?

> needlessly flush Xen predictions, I'm unsure whether this makes any
> difference in practice, and IMO just makes the exit to guest paths
> more complex.

I need to redirect this question to Andrew, who suggested that doing so
can be expected to make a difference. When we were discussing this, I
could easily see it might make a difference, but I cannot provide hard
proof.

Jan

