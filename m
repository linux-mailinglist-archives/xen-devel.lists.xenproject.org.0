Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4380F385
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653325.1019777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5v7-0000w5-9X; Tue, 12 Dec 2023 16:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653325.1019777; Tue, 12 Dec 2023 16:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5v7-0000u3-6y; Tue, 12 Dec 2023 16:47:45 +0000
Received: by outflank-mailman (input) for mailman id 653325;
 Tue, 12 Dec 2023 16:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD5v5-0000tx-Ga
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:47:43 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28ebf558-990e-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 17:47:39 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so30360215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:47:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c459400b0040b349c91acsm19299344wmo.16.2023.12.12.08.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 08:47:38 -0800 (PST)
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
X-Inumbo-ID: 28ebf558-990e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702399658; x=1703004458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNOWZc4yE208kyQTbNea+lP+dtLQtBZf8ABVh8X0IE0=;
        b=H7BhdANUx12WXNe7rQviYak+zXnWjpDF0rSCfaMZeQdQH4Lgpt71VSJYDOLkShPx5O
         gfkUBnR30XxrwUsCSWaOItoo7r7FWOdZIZ5IkPmjKs/KZ0NXfHE7OegBzegU8pzXoOEE
         gA7Bsfbs79cbiQXkTGVKxeXRzRtm7y7mS7IxaCrhAd0NAm9SnEAoWfHQAgTXDK+9Z607
         s9+FuOyYuAx46CR7Gff82VpbgkGCWti1KgR1K2kK/33btaW/X2FH/8XnTFPDEY37j3/+
         SIEnKNbbKR7aSbKHu1xyzCwj2H5FHI9WigKoqZIydKaVmtebk8/m4KE3APBUsQ54Wbfz
         rTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702399658; x=1703004458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cNOWZc4yE208kyQTbNea+lP+dtLQtBZf8ABVh8X0IE0=;
        b=S9QTcI9axFxX8BZ1qXIWS8zpWE/D/AUPtXvWKgh4SPuJWVkP2JDaGa1xwdd4VpzwpB
         7tYELwiJJhP/Ji0scXE11MNC8hYN90aCX5xW7sJrwxPFx3uERPO07UNhFMZCHZ6TOpZu
         w1nv/Yd+XQ1bc6eFdK4YrFwtqoBx5mUk30yYgB7VsCJUIPYlXuUuIioGmbwN4Wf0c88M
         2Xvx/+qdTx2YRB+R2jtLnZ1l97aTguikX7Ep3lrahkwweXlk9U6aWqHfGIgGFkmXpdKV
         f8tOGsGHtin42s2SV/F4noqY6K692/gWErHGnq3iOSOLDuzViQpgFX5gBnNs7jMch4ge
         mosA==
X-Gm-Message-State: AOJu0YyqoN5KPuDX+y94kgJX92lhyVsXoiIzsgqCxKCGeGpndJtamLwc
	FyMm9JjxqyBbgAPcEqT6uwR1
X-Google-Smtp-Source: AGHT+IHEt6EEtH8o3Xw+T30qxUG8NCxdz+u1vCzpaLufTSmSgLumg+1nXl2cIEY53f8QDBDHVXB0Kw==
X-Received: by 2002:a05:600c:a3a1:b0:40c:5822:bcc1 with SMTP id hn33-20020a05600ca3a100b0040c5822bcc1mr95946wmb.66.1702399658519;
        Tue, 12 Dec 2023 08:47:38 -0800 (PST)
Message-ID: <00f77f61-9905-48dd-ba26-5a68769eb919@suse.com>
Date: Tue, 12 Dec 2023 17:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 xen-devel@lists.xenproject.org
References: <20231212162702.26360-1-jgross@suse.com>
 <20231212162702.26360-2-jgross@suse.com>
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
In-Reply-To: <20231212162702.26360-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 17:27, Juergen Gross wrote:
> Instead of defining get_unaligned() and put_unaligned() in a way that
> is only supporting architectures allowing unaligned accesses, use the
> same approach as the Linux kernel and let the compiler do the
> decision how to generate the code for probably unaligned data accesses.
> 
> Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
> the Linux kernel.
> 
> The generated code has been checked to be the same on x86.
> 
> Modify the Linux variant to not use underscore prefixed identifiers,
> avoid unneeded parentheses and drop the 24-bit accessors.
> 
> Add the definition of __packed to xg_dom_decompress_unsafe_zstd.c in
> libxenguest as it is using a cruel hack to reuse the hypervisor's
> decompressing code for stubdom.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



