Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CBF9768FB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797400.1207343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soimR-0003uH-5o; Thu, 12 Sep 2024 12:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797400.1207343; Thu, 12 Sep 2024 12:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soimR-0003s2-3G; Thu, 12 Sep 2024 12:18:35 +0000
Received: by outflank-mailman (input) for mailman id 797400;
 Thu, 12 Sep 2024 12:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soimP-0003rw-UQ
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:18:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffc8098-7101-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:18:31 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso1032368a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:18:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65742sm738232466b.216.2024.09.12.05.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:18:30 -0700 (PDT)
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
X-Inumbo-ID: 1ffc8098-7101-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726143511; x=1726748311; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kKf4nOiPJHGf5+yzzDZuLpbwq5RY8zgkYb3jDBk//r0=;
        b=doFWQw0yO/IY7+RV0INQgCDTMwCTf6Ynm2AH29ZO92BBP4/8whbA8RsQBLjvTT4AHT
         m4rfkpK6whh2xSyBUnvt2i+SLSBtU1GGOzd785fCungLt4/4UwIDKgFNxsUaxhIkEkQn
         DRZjypun7fsM5VFwcpMM9szQrKi2t+2rLCFfjLhsBlqwIGmUCEmfWlL82vKOoZP/pdKp
         GHcb4zVxToSa2S7icgJZiv7HYg9S78igvA8cg/B5GQxxdlcDnC7COHtQnHaGyar45OJq
         QIXSaNXq9Pu4G1GbaybfLGeJ/OtAsxHDfswSKd0yM04MGfypKnou//wSwQkekc9WMpWT
         jAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726143511; x=1726748311;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKf4nOiPJHGf5+yzzDZuLpbwq5RY8zgkYb3jDBk//r0=;
        b=V1czqdo7cYK6vV53EyiKscQLSIKHD8nJjtiaNj5WOnNIC7XA6FFt6OhrqRQmg5jxOe
         rJxKlSuiQXuo6RpVCOwe1Y6bkrs1dpnqB+v7LxzMMJ9rGVUaacdJoIug7CndEgzI+SWU
         Q99h+XYToEiLbutR4b1b9aoi5Gdn/5xP17MWjukLt2Xi6JBlf968hDsz79Y0GoFe2+pU
         mRZf5Ik8i7uKHcWtYLqIn08Rwcs/xbRuN2CtyzjcDSwTptD66iRfkqbNTBFPyuJQemn1
         nQXGCZXyjuJHQrcni8EgnFzWLpMu1u0/Nw8kJ5QjXseNNwHvm2c6q934JVbjRwUDsJ+E
         HShg==
X-Gm-Message-State: AOJu0YzlO0FUP3LKNKW2QBWN5srHirnSUTcWeedoZyHj66yFt7AoUnTD
	Kicg5SbsHt86hZyZEh9i6mAbWs2x7BmlLybKEMdgYRkFC0PKiPWWV/EdJK3uAd9Ihz0V4jua5u0
	=
X-Google-Smtp-Source: AGHT+IGnHfHaz3QEgwE0tToILrB78psy55ewhQGcTPlH0ssla27TBuyu3meC4Pd88JbYojidM8tbiQ==
X-Received: by 2002:a17:907:3e0e:b0:a86:aa57:57b8 with SMTP id a640c23a62f3a-a9029730b2fmr272279866b.63.1726143511087;
        Thu, 12 Sep 2024 05:18:31 -0700 (PDT)
Message-ID: <ab2d325e-0d91-4308-b4d1-06314ad5ba0c@suse.com>
Date: Thu, 12 Sep 2024 14:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] types: (mostly) purge Linux-inherited s64
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: ubsan: use linux-compat.h
2: types: replace remaining uses of s64

Jan

