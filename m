Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D5B43FB4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110399.1459626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuBLr-0005N7-Tc; Thu, 04 Sep 2025 14:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110399.1459626; Thu, 04 Sep 2025 14:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuBLr-0005Ld-Qj; Thu, 04 Sep 2025 14:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1110399;
 Thu, 04 Sep 2025 14:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuBLp-0005LE-TL
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:54:14 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04ce721e-899f-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 16:54:12 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61e8fe26614so1995864a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 07:54:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7ed1sm14881499a12.1.2025.09.04.07.54.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 07:54:11 -0700 (PDT)
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
X-Inumbo-ID: 04ce721e-899f-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756997652; x=1757602452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KvfZFCF++iFIXHxCkympi4+YUmyTvno+HR2qF84oyOw=;
        b=gm/QYKp0gn/YGXgFKDA1UPMAj650RO4GnlmdvFuScfgxV8JO3Qhcizx+ZiFfyuMAGg
         DjCjhhiE8SbyGTXxD1G3A1FEddxEFwZvaQRBJ7LQzc0IWZOSkZEmOMhOYGxWhQ6YATEA
         oaGs4vhmJCziP2Xf48CXuYK7OUI23Q/gpTRe2udkki35V8F/i1wPkukI94K3TUB6r8jR
         EVcXlmXr+EMq1v5gHQdlsqFFy9wASR2WgOyzVI3XVS2eJCVPdgv62kCW7cEYVwFA531g
         WkPCQ3+QK+qno9/SFlYWpQVul6Fbq0jfKyjOIMZSOkoUfftZvFqkVu6CrexmrC49/oBF
         kxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997652; x=1757602452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvfZFCF++iFIXHxCkympi4+YUmyTvno+HR2qF84oyOw=;
        b=F7O0noT436kDNjZ4AchJzhp6tBgolaygI+VkqFECYPcaOyjAvmxRrtOecFOx8Sjpje
         d8dlD3uBXx6dAvcNGNCNeQpxaPve0XaEr6dG1DGh0VR7eGfHLm6e5etmVthJm9EGsRQx
         vDFe1Tuezk2gdnM77XkxzHHRK7EbRAieu77g7xvb4H2n7HTxzkz1Acnn+Rlnv0ipAGZT
         TPNXPfv6bkspK0vlH+J8ASJJnzGAT1yt4xdWvjWVuguD4ksOmKpO9r4OgryfmHudUx7k
         y3u4GfIVDtLiQOEoW2CovvDwdSX9t5vz8mfezmmmTatMnBpfW7Bei8gZWSJCAkdVGQi0
         IoUw==
X-Gm-Message-State: AOJu0YzT4PONWB0trtkstxQVApaGeXNDTMRX4hN79mNcANla6ZNqaCd4
	JNWcQ/+5Kh1LpLUY7y0weV9Lk/d0a+Akb/4+O59zuwHm1YMJuMb0+FqhuAB4uw9yTGsNRTqhlKa
	/sdg=
X-Gm-Gg: ASbGncssy0uK6EWrX2ac++YdXmFbbki5Xpj5g1yQuQVD3708yjJvaDz1Lz2pw2YKdbE
	94LGu/+dLg0Q138eO0lOb4qipXRptmfKON5AHC3EiFeVvZr73A6sm5QiJih68evg/1pdNKXd9Gu
	h4EqFa9RbM+HxTqjSzSEhiA4B0UmkdK0Hjy+kv4RsW1nPT9U3h5Zql//i9x1onwP0l6K4ODAaCG
	1OyngIfoEPdehtbGm0SN2qlOBpAl/BR0Z+DMfDH1ZofxU/lZO2zuwzAUOrna5uiC0O8Ns1rVpeO
	5ozH+valj2biqn63jTR7LMbLNbFKCcNs3fcVQeUdZX2uVTyRkjA0IH+WpYTJjcn5Q8JfTwoBpKk
	NKUsw2DrDOOCAM7tHTX3DyPaVaHZGVERgcZPmkmQ4vhQCBzSnQrFZZRQXxFHHSwQCV2xvl/TYoy
	VA4tMVXVxVgSsj1F8gaw==
X-Google-Smtp-Source: AGHT+IHe9kK1smMzFK70YRuzIDzb8hTWRDmN35rvVE6wZVCua2cIfFKu3TEepqm8IcluEAEZZZticg==
X-Received: by 2002:a05:6402:d0e:b0:61c:8114:8832 with SMTP id 4fb4d7f45d1cf-61d2699b037mr17856608a12.16.1756997651721;
        Thu, 04 Sep 2025 07:54:11 -0700 (PDT)
Message-ID: <78196af7-d6b6-4f08-a806-ffee777ee762@suse.com>
Date: Thu, 4 Sep 2025 16:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68b9a73be8eb_27ea7e2d9ed55e799088716@prd-scan-dashboard-0.mail>
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
In-Reply-To: <68b9a73be8eb_27ea7e2d9ed55e799088716@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 16:50, scan-admin@coverity.com wrote:
> Hi,
> 
> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
> 
> 1 new defect(s) introduced to XenProject found with Coverity Scan.
> 2 defect(s), reported by Coverity Scan earlier, were marked fixed in the recent build analyzed by Coverity Scan.
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
> 
> 
> ** CID 1665214:       Integer handling issues  (INTEGER_OVERFLOW)
> /tools/firmware/xen-dir/xen-root/xen/common/symbols.c: 123           in symbols_lookup()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1665214:         Integer handling issues  (INTEGER_OVERFLOW)
> /tools/firmware/xen-dir/xen-root/xen/common/symbols.c: 123             in symbols_lookup()
> 117         }
> 118     
> 119         /* If we hit an END symbol, move to the previous (real) one. */
> 120         if (!symbols_names[get_symbol_offset(low)]) {
> 121             ASSERT(low);

With this I wonder ...

> 122             symbol_end = symbols_address(low);
>>>>     CID 1665214:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>     Expression "--low", where "low" is known to be equal to 0, underflows the type of "--low", which is type "unsigned int".
> 123             --low;

... how "low" can be known to be zero when getting here. Without the
assertion I would accept that the tool doesn't understand that an
"end" symbol can't come first (albeit imo the report then would still
be a false positive one).

Jan

