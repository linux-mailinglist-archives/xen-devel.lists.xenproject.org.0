Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70686B0BC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686634.1068868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKKj-0000Ca-Dd; Wed, 28 Feb 2024 13:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686634.1068868; Wed, 28 Feb 2024 13:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKKj-00009L-Al; Wed, 28 Feb 2024 13:50:53 +0000
Received: by outflank-mailman (input) for mailman id 686634;
 Wed, 28 Feb 2024 13:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfKKi-00009D-9W
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:50:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61de7fb9-d640-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 14:50:50 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso6918096a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:50:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i2-20020a0564020f0200b00565efe074f4sm1794127eda.85.2024.02.28.05.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:50:50 -0800 (PST)
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
X-Inumbo-ID: 61de7fb9-d640-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709128250; x=1709733050; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gLhTWaeA6K8LvtOWvt7viO6z/8krLAbtiOifZaThhE=;
        b=TVi2a1bxTWJgJ5+853KE5vL/R53OsK7MLIsilsohma0pQhiXxVb605Z+7myFDByo35
         55QSpGGJGkxo7ETDgu82XdKTNoqa08fnIPsyXaOX/yRY/DVmb7QbzTcFUUAqiObd7Uyq
         B2l78WwSW/z3yD/fqVWK/lwcBdbYIA/DP3yCRQjsNf1AbbCDw/O6Flx//3kYmrr2xoQw
         hktRIupX+nOqyPhjVDCYn7m4zr8TK6R/YGIT4p33IVpF/4vsarPP5ug2hagh9raOzDpT
         d8eZfDcQZnEGgXSY07dYskZDsgJwYiHsF2FIkQ/e99Mdxj0Zzkq9cXtx6V3Zkk04JdGM
         swMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128250; x=1709733050;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gLhTWaeA6K8LvtOWvt7viO6z/8krLAbtiOifZaThhE=;
        b=NS/LYuF56kAUQEoinQ/UFrAEKh5oy+NBDsfEtxbYb4eO94zXzRZcmqERzuiVXCLp6X
         MCPIKyCVz6MWaZKULaWNbzoT6jHFXJKgjGkSjArkT+8pm+eBJOus0RlSn3SUsP1sXVV8
         ogh9g/Y7Dub7peN4i1IbY084+hJFV2FXl64E0Yu+Jh/b9vnqRkBRUHIQKIaQGsT7/pxI
         /NhBwyspYSSeJcnoogAFtYbw5fe90FXYG7DAD/jkxs9fnqwTNIpcoQ/9bFaSODMIw6WK
         vIIc+1RuWTvXa4vp4Sl46vb2j4TfFQTki5g0ucsjl/+NrFwi4hc9UOOcGxQYmUhYqFwW
         7aRw==
X-Gm-Message-State: AOJu0YybPog6921a70FNvnQ0gKY5KTJ0FIeC4GO8lpnhsQrBJt5Gqhdg
	PJtVIG/9Q4dwqv6yYhjbjAywN7V+rGkoRWCYe/Fc7s/y9yDdwlB1yRpir0VbsMrEnDY5iXHPf2c
	=
X-Google-Smtp-Source: AGHT+IGzeq78e3YxEG9nZClAs6SJQ65DIRxb3NLzC5C3F+8ZUOyPNLllO+WuGMaN3l/lc8lAscKSnA==
X-Received: by 2002:aa7:d694:0:b0:566:ba0:414c with SMTP id d20-20020aa7d694000000b005660ba0414cmr5519206edr.26.1709128250605;
        Wed, 28 Feb 2024 05:50:50 -0800 (PST)
Message-ID: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
Date: Wed, 28 Feb 2024 14:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86: CET-SS related adjustments
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

One might think of this as follow-on to XSA-451, but that's not quite
the right order of events.

There are a few open aspects; see individual patches.

1: remove redundant XEN_SHSTK check from reinit_bsp_stack()
2: record SSP at non-guest entry points
3: traps: use entry_ssp in fixup_exception_return()
4: prefer shadow stack for producing call traces

Jan

