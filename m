Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BFCBD5AB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 11:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186758.1508184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV5ja-0002t5-O7; Mon, 15 Dec 2025 10:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186758.1508184; Mon, 15 Dec 2025 10:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV5ja-0002qp-L8; Mon, 15 Dec 2025 10:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1186758;
 Mon, 15 Dec 2025 10:23:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV5jZ-0002qj-H1
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 10:23:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11003f70-d9a0-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 11:23:15 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso14226025e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 02:23:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8d9c6fsm180249775e9.11.2025.12.15.02.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 02:23:14 -0800 (PST)
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
X-Inumbo-ID: 11003f70-d9a0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765794195; x=1766398995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jzipzRjZMJr0h/zZDIKRjPbFO+AxhNe4a0hJfCy0BxQ=;
        b=POT8J+cWMM3VtfphdstAr3y6bDW9TcMDsAvz/slmd+kwHR13b8pKUbcXko8poOJewL
         iYtRgNxu3kcBqQ1XdiP/KATYvrUYeiJQ6GlxZlJg5kvWin7Ex18ooA+3Yex54W7w8I9g
         1SUWspDh6niWzo1YvgDC0AMBEqeTqQGUe2zfwOV8vYtZkXXaBUG9QDQwez8+bEDyvtb5
         IUxo45GNZwY21USaru8GImIc9Jk3dTmoDd+St780ccDRdMxPQ2fZ19ft/jEzEfWOvwdb
         NLKtxXWxlJJtUHiq4m++YaWuD0IeUKxFlF+2C36pSD0yYtBq3aO9jwb/NJ0l1LubWPpr
         OOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794195; x=1766398995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzipzRjZMJr0h/zZDIKRjPbFO+AxhNe4a0hJfCy0BxQ=;
        b=ftzXCHoeu7ssY9D8ZmxsCAfHlj9O8kB0vj2Dg/Etd4BMQzRmA8QGcm+QeQKVEuOWuG
         Xal/IPldO2/fSpbdg1ptrYsSXmMSa/Kn0DDob+dz8OBMvDigVhyC+LD3sszZgT/tmXsB
         fe1ej15ZhiTzpdemi4mGDVcHt+s2ZPQFI0PRUR3c541qAPabLLRNe4/UuiKmmqt6/KBV
         WbNZrmZ3o895PpJj1+L3eVH4U9yw374yzL2TYVqQ0glP61tbB7Ebc3hl8me5LH1ASExf
         f3soM7vYCX0/hjpZ+aZyp2wdNF3VvK/70v+cex8fI/aWXJVCONtzrpynXfAlkp3euHBV
         hMLg==
X-Forwarded-Encrypted: i=1; AJvYcCV6glEvV/mFJL1VTxudEC6g6MoiOF7N14Dp5LVYSS4ny1ikt4xNSxQzQV22rmM4orSNCYKPZjvkDhU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYxZJ7LXRQKp1zV2R84JfwFbbikj10UxzkqvjwghlanDyl1g5a
	la3NJeE01mC2VAQ+vGkXqMD4VNtP62xJdFAQ9cH3sGy7hP1hPnrGBEh8aSg50SILcA==
X-Gm-Gg: AY/fxX4UyWKO+mrnR8PU6lfLwIBztXUO5SvAaTmPHqB0hZn+rR9Ngh9qdXjD/g1PxaP
	/eoF+PosIJg6FLHAxbK+DlS1O0J10+SSdiFGZWuU8AFjn/pwyCY4PkhyGv3h64T1iLhuyq+zZA5
	Q0MB1LCHxy2hI0MvD6QUIQDYw689P/o5NT4pgPS2pulqQC+IutMsD2AMptTQYCR+xAXQguy3b/E
	cR8JwdFVgL4vx8zby4ZfDxqCl64cIcwNbgANcOugzJpZnx+DLjGAgc66iNSB7rgxkpb0Azketd2
	wVbNwYzci8xW3zdQTwYfuv1876jyywrd0onEyDGWUUKgSZIdspFvZ9kADN7x2a7Vpx86u8EqEIO
	dRgawCLB9Yj287SRTvIf/OQH/SyOijcq+ejr/ECqSv9gDksfy/eYJwZFI2hlEaOs1BKbezWsSLs
	BlGaor+40aDHg4chszRmt+/VTVGiNc5+gHUoJvHTT+rho3cw14eDcicM0I3Spo2kO7yPc/k7FRk
	a1WforIyqNbsQ==
X-Google-Smtp-Source: AGHT+IH1jBA7Jaw5eL5OdcSjLKGBMpTwpTHDMIqIJVMvGY3XR8404EHf2nlkFUbjf+r3t+VT9N4E1g==
X-Received: by 2002:a05:600d:1a:b0:47a:9569:7872 with SMTP id 5b1f17b1804b1-47a95697b90mr65697455e9.36.1765794194549;
        Mon, 15 Dec 2025 02:23:14 -0800 (PST)
Message-ID: <99ac8c7d-92af-4544-b55b-f128f40867a2@suse.com>
Date: Mon, 15 Dec 2025 11:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86/svm: Untangle the remaining global svm/ headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 20:00, Andrew Cooper wrote:
> This turned out to be a little easier than I was expecting.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2212088192
> 
> Andrew Cooper (5):
>   x86/svm: Move asm/hvm/svm/svm.h up one directory
>   x86/svm: Move svm_intercept_msr() into svm.h
>   x86/svm: Introduce svm-types.h
>   x86/svm: Merge nestedsvm.h into svm-types.h
>   x86/svm: Merge vmcb.h into svm-types.h

Acked-by: Jan Beulich <jbeulich@suse.com>
ideally with svm/svm-types.h in patch 3's description corrected to hvm/svm-types.h.

Jan

