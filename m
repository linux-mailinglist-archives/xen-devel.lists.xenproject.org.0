Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9010F95377B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 17:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778171.1188209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secbP-0005UY-0L; Thu, 15 Aug 2024 15:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778171.1188209; Thu, 15 Aug 2024 15:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secbO-0005S4-Tj; Thu, 15 Aug 2024 15:41:26 +0000
Received: by outflank-mailman (input) for mailman id 778171;
 Thu, 15 Aug 2024 15:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1secbN-0005Ry-8a
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 15:41:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3bc0845-5b1c-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 17:41:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5bec4e00978so518882a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 08:41:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbde3eedsm1014606a12.22.2024.08.15.08.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 08:41:23 -0700 (PDT)
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
X-Inumbo-ID: d3bc0845-5b1c-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723736483; x=1724341283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D/ly9PjWzn7OCKemxIOsBpmm4awnIvpmOMr2PNFcB5k=;
        b=etdixekH6GGeFu2pwcjYU5vWlW8bQnKoX0qMjYVYbBlfRbKJuSrayff+P3ZFFxq/RQ
         TYU4TvfgWPtpAp4kE2+DkvRzYYWObsfBPuqD/mkqx1YBGkN1clp+/Izb4tlAmIZQt7xX
         kyAh0YlB31R6WuOneHJ0HvEerVem8QRQA1MXU1H35Xzu2t2zVn6R/7+DxopR/2iDTTUF
         iOOFR6xvBzQGqoFEMiSUdey8JsAeMsPoAe/z/EdgLv74y30Hil6tPH15uLfSXVD262Jt
         0ngEBrhebGvNX30if0dwRZvd7OZSYECxc8BTWR/LBrHE5YLI0yYxhd3v/wro0rluBBRn
         EB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723736484; x=1724341284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/ly9PjWzn7OCKemxIOsBpmm4awnIvpmOMr2PNFcB5k=;
        b=n16z3nuIXc21i3DWPNonIHSiVjvGNYTC0nDG257UaeCfcPDoFQfGi/PkQn0XJ4fJ/l
         oYEvwntICZ8Bp7m7NdKKAqFBko9koQm20F7hENPvqcvhev/is1ynIyoDm2P/U3bpbc8b
         EP83BCBjKpLYnoc4aH4bjT2auYBNBx8sa9QW4uoMGTFDIiZ/t3ozTDeHMBCAwM4Z0lVK
         wHb6tAWtqgMNwSMF9YP93Do88VAtoDjbpNRX820E/u/svqOvgnBvaNWlon163WFVMviA
         pyae3g1FDTlvzowEf3GeX3OGxbMjqPDAO5NNR6Eea1uC3VsA9MXDQy/icx234II6Qto9
         NaFw==
X-Forwarded-Encrypted: i=1; AJvYcCXk68hlJ/IRZ5S6ooT+JPRyXAWdI4JkG06EM7RoOiOzIRpfMVmfU4PX1Z91j70Lum55fiPDE+ag6qH5yOSLvoBAun/E7Dju2OLsRQsvYMQ=
X-Gm-Message-State: AOJu0YxCBZLUrmqbRMbjC6WTIT+c1HL0MkmrqlHXkJyWDGdsbYsRqk4w
	N+a9k7drb1k4LB5CWCYwrIz8pcGOzcKz1RacTGrHoFHPfQxYKPKbjSUB3Q2g0Q==
X-Google-Smtp-Source: AGHT+IH66YCCoywVaXztktMMeARko3T2vGcaFZAScw3WqLPi/9csXn5HtPHs1yfCrpweZ0VQQnmgdg==
X-Received: by 2002:a05:6402:d0b:b0:5a2:ec88:de7a with SMTP id 4fb4d7f45d1cf-5bea1cb20e9mr5203461a12.33.1723736483522;
        Thu, 15 Aug 2024 08:41:23 -0700 (PDT)
Message-ID: <82f78de2-3d93-4e51-a845-5bb96559a4cf@suse.com>
Date: Thu, 15 Aug 2024 17:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/pv: Introduce x86_merge_dr6() and fix
 do_debug()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
 <20240815131600.4037415-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240815131600.4037415-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2024 15:15, Andrew Cooper wrote:
> Pretty much everywhere in Xen the logic to update %dr6 when injecting #DB is
> buggy.  The architectural behaviour is to overwrite B{0..3} (rather than
> accumulate) and accumulate all other bits.

Just to double check (after 6 years I clearly don't recall anything that isn't
written down in the description): The SDM pretty vaguely says "Certain debug
exceptions may clear bits 0-3." What other information sources are there to
make this less uncertain? (Picking an old hardcopy from the shelf, that
confirms that long ago DR6 was indeed documented as all sticky.)

Jan


