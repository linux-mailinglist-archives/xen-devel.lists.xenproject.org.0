Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574689D2165
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839725.1255509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJNw-0004y5-Kf; Tue, 19 Nov 2024 08:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839725.1255509; Tue, 19 Nov 2024 08:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJNw-0004wK-Ht; Tue, 19 Nov 2024 08:14:56 +0000
Received: by outflank-mailman (input) for mailman id 839725;
 Tue, 19 Nov 2024 08:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDJNv-0004wE-2T
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:14:55 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a304f7a-a64e-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 09:14:52 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa4d257eb68so26300366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 00:14:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df26d6fsm621423866b.17.2024.11.19.00.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 00:14:51 -0800 (PST)
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
X-Inumbo-ID: 5a304f7a-a64e-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVhMzA0ZjdhLWE2NGUtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDA0MDkyLjQyMjQ5OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732004092; x=1732608892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xcYIf23G4cb8mxPzT+87GnPDfgP15dTrJ68QbgYfaf0=;
        b=gD59MagIefKd0/nIW/7uXyoyBYlORAjVcmfth+oPKxjKdvTOigc5XrTsl0W7IPoca4
         tRahoHrPq6BELXOSGHAM2P0Mf4q/PkdM30ftH3AEq/P62qQhirLoSkhabB3XwnTQ/zEv
         HKpdTZ8jDRGQO8eW5Pp1r1wTg4G7Y+5cJI3i9WinysL22YNc1YAbzDsI1sEwkmO2EBrj
         IWKmrDy0z1WNmEnvxXcAmgblNs25yJ6iNrt6zwIWou0adTjHN3fMPbnSq7dMEKrGqqxm
         XW6Q7yn/Oj/7TvlairAkzq/0MBeaZJ287Q+U1/QMWmyF6QGCoLbzx/aug28ZUgXNIJ9Z
         ja/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004092; x=1732608892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcYIf23G4cb8mxPzT+87GnPDfgP15dTrJ68QbgYfaf0=;
        b=hc5Zx5MRYhieM8kTGU2RR7zlWBdqd4WN7+YN4y+JVCcCQe7P/q53vQe5fqDBFhdvze
         mG+R9ZAz+lCUbyE5zKBw0Mgqtnv+PtRrkwpqRS8Faf7EJP+dfuV+bVgCZ/MeuLJt3XoP
         IC7jAmo3ZiUUfsBF4mfXQdQMo6ZV40bXoKhQNURqD+BrOKxCZy2BQikZ4KjTAzAPhRHm
         VHBXCi2u3RO5oXShfXrMstzlVDsaEKaN9G9pwhu5hfRX0wuV2QkYVHCH3fj0LbAxEPyj
         tDWkI8trqJaPw/ACArcltq7XMkIMcdvteoUk/xIVsM5sKQoG6CCe3nmSKyxx8WmfaEj6
         f6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy8ubGNsVqfirL6XPSj5EO5tM7nSPDa1NwEoLB4tAYFJPfU7fLM16ouBoyMMvtkMnhFUibbIO4SGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqWX93heT4PP/VNH3pWQuKkz8dh3SqrtHneA7oLX733/Y7v/k7
	mHdOabLzkG/qaVSPpQA+BFSoVh7+QB5rCIl0WG4h5J6QhfhcEU4JAasVxq9n5A==
X-Google-Smtp-Source: AGHT+IG65ICmRaXIQuU27gi12rtbyg1WH5ubHt1v4ybk2t+BqT1TSF1/UcLkBrTK+SK4m51JzW1A3w==
X-Received: by 2002:a17:907:2684:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-aa4c7e99ba2mr217616766b.29.1732004091906;
        Tue, 19 Nov 2024 00:14:51 -0800 (PST)
Message-ID: <dda211e2-0fb3-4750-a5bb-64f4cc77536b@suse.com>
Date: Tue, 19 Nov 2024 09:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: increase identifiers length to 63
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: alessandro.zucchelli@bugseng.com, simone.ballarin@bugseng.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2411181552510.1160299@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2411181552510.1160299@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 00:54, Stefano Stabellini wrote:
> Currently the identifiers characters limit is arbitrarily set to 40. It
> causes a few violations as we have some identifiers longer than 40.
> 
> Increase the limit to another rather arbitrary limit of 63. Thanks to
> this change, we remove a few violations, getting us one step closer to
> marking Rules 5.2 and 5.4 as clean.
> 
> The ECLAIR configuration is already using 63, so this change matches
> the rules.rst documentation with the ECLAIR behavior.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I wonder though if the subject wouldn't better express that right now
Eclair config and doc are out of sync. E.g. "align doc with Eclair
config for ..."

Jan

