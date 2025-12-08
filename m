Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF933CAC981
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180244.1503464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXCs-00073s-RB; Mon, 08 Dec 2025 09:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180244.1503464; Mon, 08 Dec 2025 09:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXCs-00071u-OF; Mon, 08 Dec 2025 09:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1180244;
 Mon, 08 Dec 2025 09:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSXCq-00071m-WA
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:06:56 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e49f862-d415-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 10:06:55 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so2329268f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:06:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee71sm24606278f8f.15.2025.12.08.01.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 01:06:53 -0800 (PST)
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
X-Inumbo-ID: 3e49f862-d415-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765184815; x=1765789615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AgCyVeDsYLXk4iinPjr41y8XrZc9h0G9eV2Fq1IlV+g=;
        b=DjamhtURBovNp+Kym46G5VGKZZGYE4h8UJXThyKnHiDr8OBAqB1G1HyRgngaDoe2KZ
         Pxmf/0BvP4SrMpRDpunHfEwdNFJoOP5/DslLhE/jkkX66ZwgpUH9C0ZDJP2x5uN0Gd8m
         +TCQMdkEisSCsosnF54RMaVu1SchTg+i2O7xCemvtrlhfpysJ9Wj435XBq7OXoGg2I7x
         T8NEG14xU712bjSOjYonDRwD1G2R+TtZBA4xTtiYfQUCerAfdqmNFnAGVXEmxuAQPzjt
         nLL+b0CfBd+JW1ET8oWIk9AFaBVqbkLyhHva/YDoKb2cDoIE9cbx1DYuNBuVO4Qk0ylJ
         H2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765184815; x=1765789615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgCyVeDsYLXk4iinPjr41y8XrZc9h0G9eV2Fq1IlV+g=;
        b=XLHT58/la6I9Oorgeq2j2zjrZoIcXSpZoWJVDRy8m1camcxuDi76PlABCgjcl1tqpT
         r9W4O26/3ekxPrQBFUq/2yCG5oKt+C6+CBIBYolkjKIzs+qdmIB/fEnWh6E/4m5yggIn
         ASg34KbCQ9sjHb2UY1oIZyKPKmg/XFJw/vYw6GnFlateMWQn3K/R7yqm5ksrnF34YplD
         ERupxdnYke3DXoBHj+RUu0A1RSI6Ydxnhj9myVin1XHAUp0FM+FJhgHgK64HYTcF17TZ
         WkQsr3ANtgObXS4bXjf2bSaaCMHbuWoChuY2RfrzG2l7UAP8gYK13pukFbqUBxRF76t9
         y+8w==
X-Forwarded-Encrypted: i=1; AJvYcCXhYJfzKMthsWINlictO/yaVmXADdL3GO0+4EDURvaGJk2QRhb70rK+1WHcEVmnf7C/Kc6Avnqnzo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywkqd07s82fdzCMi15aLvBha5uIFtyJjoNLrI50MfRxSBr5fCAl
	+tjbMFuZuSVt4VS86OnfXTCNK2HZAJ7AkF2B4iydBOsj4nBEIRWkGEgdPEKp8hW3MA==
X-Gm-Gg: ASbGnctcNjvz70pAlZVQRPtGAENVUHM2PnuBx2TKQ2qcsPSNfFSe/Q2/ZQLxP+a8X+o
	OFruQ7p4D7sBQjmX7vrm2JTa/QlU+A0xtMubkCFA4gJXNxdfj6u+N7M5Sq4QcyGxi2VjVTr+Cwl
	e/JCzqdgjixKErKlIA15MimFmxksAfAF7FvSbbfGbGcSFLQPZtrrXyMd3+MltpK3yvGTvTWnNY0
	vkCwXuXNphKQY8XULAElHxV+PwEt6jGoN1/djEstoneM6EDXKGqQ2kVOJHNqPrQbDK0WEvkrFWU
	xfEViCdh+uul0JGZ2faAhb2QDuQQCBti5cERJaPkxQ62W0W5wApbctx+WxLtI1AhYfN7q6EYRSM
	vulhmz+geRRCN/yv/nU2uRiCJ0cWkUgYDjtHrGllMqFFR3UPvOZPd6QBcWWmzO5BtXEZ8qf9Uw7
	W4jbNNk9swT2ksIS5lXKa8pH/E31NjyaDVgguuTjr1bu/H4lhFsAzdeLX06T+p3Lu6c/hau8mZT
	EE=
X-Google-Smtp-Source: AGHT+IEi1vaCr0tG5V82L6Gv2Hcz1zpg65XKevi7Z9D+0r1dUSY9mJ08CfBhlv9HgN1MJRIJZ1ulzg==
X-Received: by 2002:a05:6000:613:b0:42b:3ed2:c08a with SMTP id ffacd0b85a97d-42f89f0afa1mr6990591f8f.13.1765184814865;
        Mon, 08 Dec 2025 01:06:54 -0800 (PST)
Message-ID: <d74a4d73-31e7-4a75-b96d-6eee6c65ee0c@suse.com>
Date: Mon, 8 Dec 2025 10:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/svm: Drop svmdebug.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251128201937.1294742-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 21:19, Andrew Cooper wrote:
> Everything here is really VMCB functionality, so merge it into vmcb.c.  Move
> the declarations from the global svmdebug.h to the logical vmcb.h.

Nit: s/logical/local/ ?

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


