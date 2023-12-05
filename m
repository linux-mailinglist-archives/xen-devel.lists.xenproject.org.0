Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71480569E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:57:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647908.1011643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVve-0000Xi-83; Tue, 05 Dec 2023 13:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647908.1011643; Tue, 05 Dec 2023 13:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVve-0000Uw-57; Tue, 05 Dec 2023 13:57:38 +0000
Received: by outflank-mailman (input) for mailman id 647908;
 Tue, 05 Dec 2023 13:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAVvd-0000Ta-0a
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:57:37 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dc403be-9376-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 14:57:34 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66cso45540675e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:57:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j35-20020a05600c1c2300b004076f522058sm22660085wms.0.2023.12.05.05.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:57:34 -0800 (PST)
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
X-Inumbo-ID: 3dc403be-9376-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701784654; x=1702389454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsWZxyy0NLSl6egU5ts9/0A9uLo96gMVmdJfhPHnNIU=;
        b=QaH/mwToej/CNp9rlMHRkRZ0/5xaZQ+w4BXXbFeJDokK1zyaW29SrIRoGoY0T9b2ET
         bDENNJS3PAUrmxkFm6M6aRGSyXLbq3YgLUzNxRh3pcQoCLiOIJdmKundxWZcn3EdPBEM
         kqLckAF40FtbfUpfK9mJ8CmLi4XxikJ+hkfSPYO3vQ3dzBRfqy6aL956nNxFD4/1cWFG
         5lBbpaDF3n+cMate+Fx6gnwOfAOoIow8oKptf5Oa4YLtV157FPRr5xoE7w+eXeBlGwjD
         THDmK+ozPQrWx5El0sjUOX7vUjx3hTUSgs81PTlDANOefJ0uAzXBzyOasTSuDEds3CBk
         jhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784654; x=1702389454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsWZxyy0NLSl6egU5ts9/0A9uLo96gMVmdJfhPHnNIU=;
        b=cBkMLbwZTFEs/padnKjfQb26gOFCmADyzBXv+1i91KfAG4MJ8rtChOKHa3R5HEWmSD
         Lij25WIBcZl6adyZVYG5IGod9rdgl3R5zPviUEf26B7WHxEJ1yWz5AXfnLHTy6gsIAld
         ou85iCr1DpRoUTjeJUT02rGjnSVTKeDFJ2mP0LNClUa3tGLB3JUyJujP75Z9m8wq0k6E
         g2xfJ1yjieu537ewQpLDoTlugNhD3zShGYPUqWCVghD6ysMZ1eaugqxmxqDCErwafoEl
         Spl/LKvi/Nrmj7E+ureCSpdrvdLHgI2YC3ViEzIGC+Tb65rD7s5wIE/5GIZJ2mknOHQt
         iBpw==
X-Gm-Message-State: AOJu0YxNqkl7u11LOHOhnqa2N+CmSjYLSiKR+quHxK+PAsK0bRsOwxnP
	Z2lqnCZim7Gc4F0Kc249JxfO
X-Google-Smtp-Source: AGHT+IHVcIB8g8fFwMUgMJAdQiXthk5jc17fujtV57Pag9NFAIwv0HkB2TUffnlIrASvwIlqUVZisg==
X-Received: by 2002:a05:600c:46d5:b0:40b:5e21:dd20 with SMTP id q21-20020a05600c46d500b0040b5e21dd20mr541396wmo.78.1701784654326;
        Tue, 05 Dec 2023 05:57:34 -0800 (PST)
Message-ID: <dd3a316e-1eb8-45f7-a27e-1467e8295a16@suse.com>
Date: Tue, 5 Dec 2023 14:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: remove asm/unaligned.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-3-jgross@suse.com>
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
In-Reply-To: <20231205100756.18920-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 11:07, Juergen Gross wrote:
> With include/xen/unaligned.h now dealing properly with unaligned
> accesses for all architectures, asm/unaligned.h can be removed and
> users can be switched to include xen/unaligned.h instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



