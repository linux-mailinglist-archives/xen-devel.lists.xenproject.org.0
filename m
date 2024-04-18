Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED08A9F5E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708512.1107490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxUAP-0007tP-5N; Thu, 18 Apr 2024 15:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708512.1107490; Thu, 18 Apr 2024 15:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxUAP-0007qk-2H; Thu, 18 Apr 2024 15:59:17 +0000
Received: by outflank-mailman (input) for mailman id 708512;
 Thu, 18 Apr 2024 15:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxUAN-0007qe-Ef
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:59:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a5badfb-fd9c-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 17:59:14 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34665dd7610so518758f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:59:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l6-20020adfa386000000b00349e2fab2a2sm2174724wrb.12.2024.04.18.08.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 08:59:13 -0700 (PDT)
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
X-Inumbo-ID: 9a5badfb-fd9c-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713455954; x=1714060754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WoFyF8j/3F8xBWW6YBJMJg47uewNkTCWrI/XkW7WWv0=;
        b=LUr24edC5fvCFBrOyhAlwuMFoJbyazV5MGivetGe3dlk7og0pJXFtEwszCQykeQW/1
         WHfjnqtQbL6K8QYtQaoxilkVfWqOLQDtIhoC38lmt1CJd/LMmZd4PQdljGJVCXRDB6e5
         N4eD6tb2iFQV4lW723Tet9Yk0QkcJPV639ijbQrBpy4OHnXOCLZft6PT5c4cfpxOy2Sj
         jl5tzcaIq3DoA7pGrT2RjrZ92+ruJ2t8k3+KeOF43WxosEUXpVstShf6B4PpY36XyXwG
         W+9jozmyjzN4OFncjZLi1X0ihSqa7Yh0BXIY+Aj4m080aVtOIc8iG11VIvtb3U+mqv33
         qxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455954; x=1714060754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoFyF8j/3F8xBWW6YBJMJg47uewNkTCWrI/XkW7WWv0=;
        b=htLNNH1mpkcoqVom93t+F2+63BNYX7t4HcECwhax2o8F6cgu6lb8y/SI7RcfdaFQI0
         Ku7ExCVOBO78HmQbQB0IBOcZ5NI/wp78Y6xRY7li7EtKhsjjSrDrnsZjtM6dlRu49Epd
         WCocxABPD0FrnqaOI9yz4ZFm48PKtXLKZUZJOqO6In5XMiMqCwLpIwna4S0G7ids6G8i
         GeaFI8sY5SjYCSCB6mEp9Obnrx7NAUxukoEgjQIKszrTzEhbFHjIjbZHUm1tlLmhiDc9
         SrjwafIHFoapojhRDMyRM6CPzvOSnV8OsXm4zIW166Jv7Wz27y26t/Ve9ESH+xHuE37k
         4fXw==
X-Forwarded-Encrypted: i=1; AJvYcCXmSzAn6FOU9c4NQj7/TMCn/gGYPvULsq4t7OFkNAMNPVMpUJcmi4Cev0U3BDqg9BUyAv6MqUZukcRD81h6f3HEgaoyLU27NaDaZYijimw=
X-Gm-Message-State: AOJu0YxtMb4ab1kv/rpQXz+t7/MmLKeqZtSDFwiGVOUrzRxZ8fFG4oab
	DtAMwE3lIxG8SQu0Q5IRpNfwKzCYJ0+2/DYI4WkKsETMYUUGzXLFQg8hFqQc9Q==
X-Google-Smtp-Source: AGHT+IGsDgCcJcp0TZc7MP1I+JZikXbJg+btlNIE5cLQvOIb4qUXCZkfN6SlC+olJLElgvejRCyU2g==
X-Received: by 2002:adf:f74b:0:b0:34a:72d:8dae with SMTP id z11-20020adff74b000000b0034a072d8daemr1744635wrp.22.1713455953698;
        Thu, 18 Apr 2024 08:59:13 -0700 (PDT)
Message-ID: <11fecd33-68ba-41f7-a17d-71f64554590e@suse.com>
Date: Thu, 18 Apr 2024 17:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/spec: fix reporting of BHB clearing usage from
 guest entry points
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240418155208.7771-1-roger.pau@citrix.com>
 <20240418155208.7771-2-roger.pau@citrix.com>
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
In-Reply-To: <20240418155208.7771-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 17:52, Roger Pau Monne wrote:
> Reporting whether the BHB clearing on entry is done for the different domains
> types based on cpu_has_bhb_seq is incorrect, as that variable signals whether
> there's a BHB clearing sequence selected, but that alone doesn't imply that
> such sequence is used from the PV and/or HVM entry points.
> 
> Instead use opt_bhb_entry_{pv,hvm} which do signal whether BHB clearing is
> performed on entry from PV/HVM.
> 
> Fixes: 689ad48ce9cf ('x86/spec-ctrl: Wire up the Native-BHI software sequences')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This looks correct to me, so:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But since Andrew indicated concerns, I won't mark it (locally) for being
ready to go in.

Jan

