Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF49C03F1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:28:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831686.1247034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90gT-0006Dp-NO; Thu, 07 Nov 2024 11:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831686.1247034; Thu, 07 Nov 2024 11:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90gT-0006Bn-Js; Thu, 07 Nov 2024 11:28:17 +0000
Received: by outflank-mailman (input) for mailman id 831686;
 Thu, 07 Nov 2024 11:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t90gS-0006Bh-0t
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:28:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd32cfc-9cfb-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:28:13 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso7480855e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:28:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda066fdsm1455880f8f.104.2024.11.07.03.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:28:12 -0800 (PST)
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
X-Inumbo-ID: 5fd32cfc-9cfb-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVmZDMyY2ZjLTljZmItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTc4ODkzLjM2MDQxOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730978892; x=1731583692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A7bBQYPu9Az+p1v15MSA/wK+0oXvQkwI0r0g5yDOrhs=;
        b=SVYSCh3XscZ0dl9lAg69IZbWG7XzzS7tjdX6xzPU6AXSO6kxQgJflur2lsogrnrif7
         lUKDckUHG+yNUjhYAr4GQvGZWCNSL3JMhXTBU8dR34NA115QEhe8crSYGRxuhTK0Fwc1
         kmsLRc8MDR3wsxMFH2sL1aaTjPJWvBa+DJgJcRq8/7d0KqTYMEjn3zK23R0M/bX7cIrn
         /1VKh5vheWXJvbh/89dBbtroDsdLkidON9E9HLbMBz/wXtcEs9EtBSBJhNPUOOi2NxfN
         /DCVS/GSikS5RhCuoBT6FBsN1HeQK77VMx8u3KxEipvMtvTLJ2OkWH9M5OdBnCDXydH+
         NlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978892; x=1731583692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7bBQYPu9Az+p1v15MSA/wK+0oXvQkwI0r0g5yDOrhs=;
        b=Ekuw+1BG6bAi2QnJzgJNJoutq6kZehrmxpKLiAUYJvur3j8z6+1n9jzbnmBm+2nGRz
         cJuqf0ZLOqnyjqnQCWEIV5RAX7uo3pq1EzRoZ0k5HdIu+WfJ7qGm6ABT+bA+AzuIek4P
         PKzP7vM6GjcfnnSaXxYJvMYvTq3EW5X6h5qlL2rg/Nxvv6ihUCpoxT9qmrNDYjsKBSUm
         J3EYKRW6152wxPD52segEt/mcmsNleaNEms5a2NHMTR5GDQrhYFA2cuW64PsdOeweos/
         LP4nYpAvc2FAPNUvva0CqqbhczVLd5Nieagj9EzXQLOSSYu1WePupFRwS983ATHO8Tx0
         R2RA==
X-Forwarded-Encrypted: i=1; AJvYcCVc8OSHiHpA6EFmMDJ1nQkP7KgNEM540iDH0ae+rF9tIcvtsatloCr0ughbBR9uWSvZwoUFIqynrcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkzaNdBzmPKshDvsCiMbuj/o4cl21j6y/UGN+QLUAh9NrY91M3
	GKlh+3oxOCb7EX3m0KV9CXII2mr78AAmARs6iyiTOIgEK3Lz/zgETEPhXCFnPg==
X-Google-Smtp-Source: AGHT+IEAQvKDPpL2lqIpjoD1YuF5hp+BkJTsXcY1Qn7NDWdyJaWkDzQrHQEAjSkJdduq5N5+k8yr/A==
X-Received: by 2002:a05:600c:138d:b0:42c:bae0:f065 with SMTP id 5b1f17b1804b1-4328323f762mr191227295e9.5.1730978892642;
        Thu, 07 Nov 2024 03:28:12 -0800 (PST)
Message-ID: <9472eba9-c016-40c0-8cc3-8297d7db04d3@suse.com>
Date: Thu, 7 Nov 2024 12:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] x86/mm: miscellaneous fixes
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
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
In-Reply-To: <20241106122927.26461-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 13:29, Roger Pau Monne wrote:
> The attempt to fix destroy_xen_mappings() so that L2 tables are
> consistently freed uncovered some errors in the memory management code.
> The following series attempts to fix them.
> 
> All patches except for 4/4 are new in v2, and 4/4 has no change from v1,
> hence kept Jan's Reviewed-by tag in 4/4.

Just to mention it: When a patch was buggy, and perhaps even more so when
it actually needed reverting, I think all R-b (and likely even all A-b)
should be dropped. Clearly the reviewer, too, missed an important point.

That said, the tag is fine to keep in this specific case; I would merely
have re-instated it after looking through the prereq changes.

> Roger Pau Monne (4):
>   x86/mm: introduce helpers to detect super page alignment
>   x86/mm: special case super page alignment detection for INVALID_MFN
>   x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()

Btw - it looks like patch 3 (with the possibly adjusted description) is
independent of patch 1 and 2. If you can confirm that and if we can agree
on replacement wording for its description, it could go in before you
send out a v3.

Jan

