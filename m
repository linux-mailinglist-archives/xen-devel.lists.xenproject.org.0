Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC6CADAD7
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180902.1504006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdg9-0001u6-9t; Mon, 08 Dec 2025 16:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180902.1504006; Mon, 08 Dec 2025 16:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdg9-0001rB-6G; Mon, 08 Dec 2025 16:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1180902;
 Mon, 08 Dec 2025 16:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSdg7-0001r5-7u
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:01:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b2124c8-d44f-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 17:01:34 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so36519025e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:01:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331e29sm26839643f8f.32.2025.12.08.08.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:01:32 -0800 (PST)
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
X-Inumbo-ID: 2b2124c8-d44f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765209693; x=1765814493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z7GTQAwapMSaxAONp3YIcP9bF4EEZMXJqnu/kjsztk8=;
        b=K/prrGRid3v5sYAVGmIX05VJu9fAcTw9FyJ4fU9aRjCzPxO9t6uP8sFOOC5v5TPQoj
         9nSOB3g9CQQ9M99YEjvUr/hgfAtAxt/+tg5BqZrhelVz0UM/BcHI9jPacQ2q2sD2eQBi
         Fe9Lxx82JR5srq/AG2mMIdHLVTDkQp19RRAQWwc/w6mkz+sWQsle8kQm7+jho0I78Ndq
         b89gLYJv2LFEc6OQpG1FV7q2wSNaRuNQT3yDI/GE1b5aQgwvK1FMpwD4XtFkPzqAZ45w
         qaWAFYFcqXAWTYJDVejf2YvX4LxuvUZDE41eYz5rPM8t+NX25W1TSwpTi/Vntt1MTu+t
         zVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209693; x=1765814493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7GTQAwapMSaxAONp3YIcP9bF4EEZMXJqnu/kjsztk8=;
        b=MbE5tsyFSAcX5BszwpOacgNbeLg43EtCq4A76xzJav0YmuvHown6pu5rQboLUhplCK
         Vdx6e3kgQYkzj4d//alnGv3vlbecC58r15xP9cacfOe77aDnKs7JA95XwagZQvcnNcQ+
         gM9pJrLmaSOkF6avjIN/l/zKyVw7lSNnr79AbRORZRXbXHQovup7cQ9UZCjStiNqaMOW
         z+Pn3SbpDpO30iNzoUs6c0RXbwRXSWmrS6awQlY/H5pDrKlDaqFUir+NraQxUFrl4aHQ
         c3arMbeKQLAvexgTot4C/SI31itSmC88m+teBYnYb4CgbA5xp0Etu1GUVjjIjArg3jeS
         EFVA==
X-Forwarded-Encrypted: i=1; AJvYcCWGeuv7q3tG3gDsN+5SfCawLHstn77vZmqhcmq/tiO3IgmXHwkJkLYMrT0MQ7iuP2kiIRg9TI24m/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCXxgvJN4+zLgnsR8VGUDSUfpiW4sC7ftXJzsvis3aqnHIOzSJ
	rdn4o8S2qiYdSIhgLqmeSK9FAGjlR8LGuWzEEc+RqTxKNirxdxbtAdadGBnFqSLn1g==
X-Gm-Gg: ASbGncsAo9siXYbIymntiAFJt2WfcNj2Rg22UJG7F/OC2OzqkXzTfDSlVuvt+eKgsfb
	VLtidIA3REdho9UGCIYZblP4Law7veTsAaEKqqgR60QYpzmtZsyXx8FnnxnWzXQa4GBmad8fwtZ
	VHBu09doIVVAp+onPtTk77WYWFxvfWldKb+WhigfBLwqKjJd8ryBDiJlAFk/P9qgMq0Da5s0Rge
	3POVfc+bHllfkMkTNPfOfSqgw0OAuPH1MLEfq8OwYVLE0VnN9hkyO7vBu/X9PgXVNUkJiyoXzyb
	093hq/KEWdQfmj9h/hSTlxM0GRdi/ypzDZRsapYvZ+W+HIDDgW6Xttsa0JLdj9xzC+miNQyaEgo
	WlupzSPgfZUNr/t4Bk6i6rb+2KpE1DLTs4xnzXzgIUFzlyNbd76TLUFCNj4qPXFpBX1L1jRpOEw
	jmSG1WNsR3U0tmCYKYnifQ6vI5Mz4ARMsUYW+cHlxy2goocf4I3c4iLyd/TAQwklpGtFNnodJ5Q
	Zc=
X-Google-Smtp-Source: AGHT+IH3wCDksPt98Boo/rI4VxwbF3djk7cMi2HcAJf9aSX5uD7ZuwuWH1qp1iUFaUT2k4F8aQhUfg==
X-Received: by 2002:a05:600c:3114:b0:477:a977:b8c5 with SMTP id 5b1f17b1804b1-47939e3a61cmr78412815e9.31.1765209693383;
        Mon, 08 Dec 2025 08:01:33 -0800 (PST)
Message-ID: <b2806144-f694-4220-9605-36ccf75f9313@suse.com>
Date: Mon, 8 Dec 2025 17:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/11] x86: Migrate spec_ctrl vendor checks to
 x86_vendor_is()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 17:44, Alejandro Vallejo wrote:
> This is the file with the most dramatic effect in terms of DCE, so
> single it out here.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

If we accept the basic concept, changes like this are of course okay. Just one
remark:

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -388,7 +388,7 @@ int8_t __ro_after_init opt_xpti_domu = -1;
>  
>  static __init void xpti_init_default(void)
>  {
> -    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> +    if ( (x86_vendor_is(boot_cpu_data.vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||

Here and elsewhere please keep line length within 80 chars.

Jan

