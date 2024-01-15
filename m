Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51B82DB4A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667401.1038613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPNzC-0006kY-ON; Mon, 15 Jan 2024 14:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667401.1038613; Mon, 15 Jan 2024 14:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPNzC-0006iB-LE; Mon, 15 Jan 2024 14:30:46 +0000
Received: by outflank-mailman (input) for mailman id 667401;
 Mon, 15 Jan 2024 14:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPNzB-0006hz-Da
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:30:45 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa818fff-b3b2-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 15:30:44 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e68d0dbf9so28487865e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:30:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b00337478efa4fsm11982183wro.60.2024.01.15.06.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:30:43 -0800 (PST)
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
X-Inumbo-ID: aa818fff-b3b2-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329044; x=1705933844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=khlMCG6Lb9J8bmE3Xh+hVWhqFVltOB8R4ef78zKo+9U=;
        b=LnC3HeGDQtIytKDnD/xHpGzbfSEaTismMZzNpA4HXXyhDiTwhOxRhvOHS/mK1TDmD1
         bkTw5tcCOcHVAs0LzdsrgEpD+ZEmsrYBwJ9tBKe/FqxpSrq6YCr6gD9luWVEMrv6Q1bN
         TKXuTTPIcoMmYvC5E/GHaRxmPI48sgF66VgEJVUh0KPc+OUsCOlKtUtpkuXjg0YwhD7Z
         KyvlyItgfd2mIPps+qQj+1MHAbzQ4R1qPPAxXBlWUDf7hvdYfwWJOKwvUNDkkCSZxlyy
         dn/0lx9AKxSjO8lZAwpb0mB+sEJJ5jSEFVIGk5OvV8sD3ei63ceJzjnUQ9ZpgccuWfMb
         Pmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329044; x=1705933844;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khlMCG6Lb9J8bmE3Xh+hVWhqFVltOB8R4ef78zKo+9U=;
        b=h7Wgc5HsXStyUUj/AeWFh7ANe3khVKGzYnTNdzyyJxWDVxWBEYTP2KQ9/4oST3tP4H
         SYxwGkvXBxLbAvaBMQ6GNAkOPgpk2WdE9yYVRDwGLxk7nzq96+paY59oGxjOrafoJU2A
         YqVMsor8QS9pAjnRhYKZVWrWEOKDLuAYpo+hpvXOwQ3EMOLj36N4ugnmvOWJY0gYNHP9
         GQ69vGx+tqSyJveB5usJQpxhe5UMr0ZPCpv3zDcK1pdvh6qg+ApPnHZb9omtb3AYakEl
         n9+El+0Mw+e2jntJFmQEBbam4kqij239JmFIPFRbAvyiuKduamZjseGsEhoI7TdyDzme
         xyMg==
X-Gm-Message-State: AOJu0YwITzRfA4qXNqDgyKttrc5IS/1GkOC7zfrsS44PGGw9CxBFb0s3
	RrKqk3Cadl4Tkp8dnd2SkLX1XkH1t1+Sxfg/7ofp4JZC3w==
X-Google-Smtp-Source: AGHT+IGGTk/AZfU1HlLk7T4DHAEWlJvMqBUGMer07PXDHh/9j0zmLR+TdI+25dEFTVPC02HRca/6pQ==
X-Received: by 2002:a05:600c:154d:b0:40e:621a:bfca with SMTP id f13-20020a05600c154d00b0040e621abfcamr1555400wmg.30.1705329043676;
        Mon, 15 Jan 2024 06:30:43 -0800 (PST)
Message-ID: <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
Date: Mon, 15 Jan 2024 15:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/8] annotate entry points with type and size
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Language: en-US
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
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The model introduced in patch 1 is now arch-agnostic, and all arch-es
are being switched at least partly (to at least give examples of how
things will look like); PPC and RISC-V are still small enough to switch
completely in one go.

1: common: assembly entry point type/size annotations
2: x86: annotate entry points with type and size
3: x86: also mark assembler globals hidden
4: Arm: annotate entry points with type and size
5: RISC-V: annotate entry points with type and size
6: PPC: switch entry point annotations to common model
7: tools/binfile: switch to common annotations model
8: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions

Jan

