Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9087B93D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 09:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692972.1080739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgPT-0005Js-Ht; Thu, 14 Mar 2024 08:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692972.1080739; Thu, 14 Mar 2024 08:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgPT-0005Hu-Dc; Thu, 14 Mar 2024 08:25:55 +0000
Received: by outflank-mailman (input) for mailman id 692972;
 Thu, 14 Mar 2024 08:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkgPS-0005Ho-Km
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 08:25:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7859c334-e1dc-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 09:25:52 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so881250a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 01:25:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sa37-20020a1709076d2500b00a4635a21ff0sm467385ejc.38.2024.03.14.01.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 01:25:51 -0700 (PDT)
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
X-Inumbo-ID: 7859c334-e1dc-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710404752; x=1711009552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4BQVZCAUZLtOYbg/K1gx8DsAF2ZNaLfyFD+765ChUs=;
        b=S2E6PyR3X8YA6JUy4BOQzjXtxe2Q3v44QmbQfr+IAZV1qQvqoPpuFnGjJrtpzF7ISj
         B7o61CZj5RtO20s6DkjuivOYRvF9MR3wpSJCcphQc2aWN4M80zrPjgCR3+n2sgWGz6HE
         GME+FUfmzF4uD+cXOqe4C7CKpR0SzJhPZm5iNX3KmIJnlhAgp6djNEfgJcJrLwhvaw9L
         aO6PhAMlUIBbRFiyCNfAac/uFtZo3hMXuLKgs43AdS9tqIiJWZkY4rP6xCHPMDGGhgVv
         pb9SH44g5TEMJFPt6mmXz5PiqZ9tWmuB19Hj03cBqTQoobAReaZP5jX1fL42sSMmfKPz
         SUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710404752; x=1711009552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4BQVZCAUZLtOYbg/K1gx8DsAF2ZNaLfyFD+765ChUs=;
        b=dRbRPOnzDbDRzwoJpD6tb5AcuUxgzTnt+zaJ4htvgAZiYfZtoyGHSj4B45FgZ0BpId
         V3TIwIhvPoHb8mv6oL+m9K/GBDNw/By+UyatPhQ1P9qlYmmoH962INAwYE43LlY3LW38
         Du4XvPwCsGUlSeAtwoQ6CGUGzb6sbIXuHf29zsDQcFFSE85ik40NbuYyYugh/y3axioY
         dXMVP3Y07Xyw1D8puCld0mltgUohR7m9mjJ5fjK/5UPHdBAcX1cMOuwmitW/IVoo+xO9
         66/HFeFtATLgbn11OIyXbmX0KS3fWZk1dtgzzCH9Mp//AA1yAZfF6yv/0A69QNeRpFvk
         rbwA==
X-Forwarded-Encrypted: i=1; AJvYcCVB887i37/ZWDFTq/jmmBL8xmvXEZ1VCa/1oZPV5leLzoDztAdd0uCNs4LNt8BJINTf+alykFEEZ5yKEr5ctvPX6wir02qqJUGdZFQFw5M=
X-Gm-Message-State: AOJu0YyAk6lgz6uqRzS9Y2WBWiylpOncAp3A69OvBeLBFjWRuhR/++cv
	m7avEeiKIYBB0ZGUcybzVdRfVE8St6Q/iBVOplHK5D0iYwKcUOFpLWTeVCnJ3A==
X-Google-Smtp-Source: AGHT+IFJxzEXEIIRmszXVnSvDzECzMhxKKcMo2qJi3iESG9UivHQQgDKP6KO6UK4SpqW3hvu8TVw7A==
X-Received: by 2002:a17:907:a705:b0:a46:4d97:82a3 with SMTP id vw5-20020a170907a70500b00a464d9782a3mr732254ejc.59.1710404751893;
        Thu, 14 Mar 2024 01:25:51 -0700 (PDT)
Message-ID: <4fd5140b-0a34-464c-8ed8-4c38a094e9b1@suse.com>
Date: Thu, 14 Mar 2024 09:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/entry: Delete RESTORE_ALL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
 <20240313142641.2150302-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313142641.2150302-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 15:26, Andrew Cooper wrote:
> There is only a single user now, and it's the one odd case.  Inline and
> simplify it to just the compat case.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> In principle we want to delay the %rsp adjustment until after VERW, but that
> turns disp8's into disp32's, making the overall code size larger.

While beneficial for SPEC_CTRL_COND_VERW, that might then harm the IRETQ.
So aiui neither placement is ideal, and hence the Disp<N> consideration
is the determining factor either way.

Jan

