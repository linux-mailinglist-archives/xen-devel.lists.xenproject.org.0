Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB6984984A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675930.1051616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwk4-00064Y-SB; Mon, 05 Feb 2024 11:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675930.1051616; Mon, 05 Feb 2024 11:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwk4-00061V-Oa; Mon, 05 Feb 2024 11:02:24 +0000
Received: by outflank-mailman (input) for mailman id 675930;
 Mon, 05 Feb 2024 11:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWwk3-00061F-0Z
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:02:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0930ec22-c416-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 12:02:21 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fd280421aso14375455e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:02:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c500800b0040fd162944fsm6859582wmr.35.2024.02.05.03.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:02:13 -0800 (PST)
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
X-Inumbo-ID: 0930ec22-c416-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707130941; x=1707735741; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMhBhF+jLHqSxlmz3PoFc0DY3oDXSGsNldebH1x70jc=;
        b=ei0mN1u2KtEkwRRtxOLTKB6Ds3wJE0AFcMoyj6hIHUCevHQL4xDVsYQSoZw51zLCkP
         WLE4gt5zmFYviAJUu2Zid6VoIHK/8I4O03xgw1c04lc+tut61MMxThVom84PnSlVkf76
         6M/MMcZ46ttXC0NVH96Z2npbeF1b7M9iuIjBxdoX7YgDu+8oIv8RDjRD7merDoNrYwNj
         G9wkxhMX2xYc0NxSilDlJ1k20IH/3KEbNvtAj6YZ/ccMLcCgbKoPtqPK+9pgTVPv1U30
         XwGy4Yk4s68EZVC7Yx6M+eYeslgvIG4z8ppVmeXAh4BcIEPOGOfFwtiy37bedKIbWI5T
         UZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707130941; x=1707735741;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMhBhF+jLHqSxlmz3PoFc0DY3oDXSGsNldebH1x70jc=;
        b=cLFRgxCTVm0vuVw1PlgBS1mRdtOca1TcQLKI7z6BnOBM7Jwbuvqyv/QlxfMicwBLs1
         l7G49dQqUAk3PMgxXh1LBE68l1YSmMYWYbl/k2VNQBILwnzTtxSXWja9laWcJ9V9SiiQ
         fCiu9rzn0GWRjwW/NRa5tkBsqt86L97J/AqKJqmYacCsfTrmQz4Tn4gU8dY7UsGr4Jhk
         z/iGTPG2IkGDC+8w3ygII98L8wRmGbQBVsdIewkQgz1hJS6S/I6Bizrg3gSJdnwKkuMH
         XxHkjMbWH9QBH2kFs+00IO/GZhXQz+j2pPrLsE+nX3MlmwHb/ShiZ1MO4TTruIUFZ3Q+
         paBw==
X-Gm-Message-State: AOJu0YxR5udJqNU7z8P7Bfe6ir1580tS6L69MVaVU9h26SuBiSAWr+me
	4m/RCYXpewBL9g1e3Glml5eU5IZ7JER6dqpHN3PsOnK3wh+PXsjVTqC6ksh4Cskq8GHxe9YM/Nc
	=
X-Google-Smtp-Source: AGHT+IHoZ2j2fykQIUqgEUwSeqD2KadUvquUBLsnbiO59SBJLvMWkN6sm6rrXOn0LXcqOeZLcS/9eQ==
X-Received: by 2002:a05:600c:4f44:b0:40e:d30d:3fe2 with SMTP id m4-20020a05600c4f4400b0040ed30d3fe2mr4784821wmq.5.1707130933375;
        Mon, 05 Feb 2024 03:02:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUCwKy49F54VvtTcCjc4HlA6iTbflap4YpOlO614g9fbYRLWvDndOS1UOUGQqmyWMB/JH2TZjRf50/6r7ncU/iK5U4HWrjvZbZlFwTSo+X6h9Eu9df9wPP7YlE0jqLSYurjemKjG5S60anv7/eKlHG/v0tN6mCV5Rd2114F
Message-ID: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
Date: Mon, 5 Feb 2024 12:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] gnttab: hypervisor side XSA-448 follow-up
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

Let's try to better deal with effectively no-op requests.

1: fully ignore zero-size copy requests
2: almost fully ignore zero-size flush requests

Jan

