Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF5AED6FA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028921.1402630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9kv-00063S-PM; Mon, 30 Jun 2025 08:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028921.1402630; Mon, 30 Jun 2025 08:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9kv-000618-Mj; Mon, 30 Jun 2025 08:20:49 +0000
Received: by outflank-mailman (input) for mailman id 1028921;
 Mon, 30 Jun 2025 08:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uW9ku-000612-G9
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:20:48 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fc6182a-558b-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 10:20:47 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so3024403f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 01:20:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57df2dcsm8557564b3a.124.2025.06.30.01.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:20:45 -0700 (PDT)
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
X-Inumbo-ID: 1fc6182a-558b-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751271646; x=1751876446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VViF0g5AkG0VPWOu0z60MTfuy012hLzV2MXAXc8Q7do=;
        b=XNM0tN9oS1JxvnCfkfLTDBWlloF/mBqk/P0e6mNyUGXW0NGQ24xUrlg0BdYxGIx2G4
         mUE60i5Qu0MNUNlBavMNArzF43j794lb1cvTuIO33b1VWt7W+imk/eeXMjBWqOE8ZZM0
         TfT4YANwIHY+2VNzzORpLvQnbDRtcEJR10DYLOCJix+WuLL5VBVqOZFyZqq4JCg8DDkk
         XJ+sx0+lfjaWugLdSylONAA8pxCTwhGxP6LgNkhGGKb3xpNjOn1c1fL9dlXojMY50UH0
         1EelFKcMCLGuph8Ex/6seQbJthzuCXAu1s6PWaM9t+b2vQqI7R8sSLEV/AgTkSG044eC
         dUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271646; x=1751876446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VViF0g5AkG0VPWOu0z60MTfuy012hLzV2MXAXc8Q7do=;
        b=uu58X53+1WCPBvHYosEMjO5c18MPCsqY1iLHHMkKoNxfNgGKg7Z4cgVx98W8ScXjbE
         NVO5fQyUzPU5To+lJJdQcdWQO2KEveWP5UNp1lODyFm8RPSoTNTUaSclRUWWCok97OWT
         Qsn0rQBW3naMxa+Y2LYIv41lx48a+kMyGkHm0wQ50r+zZCg6M5ZW3jMSse6YFPAsVMiJ
         WBeFIs1aNp2U3DOBnsgDNsRuEIEC9Fpr29y10omy83CkfCh7C4VFUIdWYQSHJQHdFNzy
         MYyR0iUhNHX3dsuWTbmYlsl0/UjI1LCWDfMY1qSRzydmg6cZyONn0LNYgpyC6R9Bnveu
         Iq5w==
X-Forwarded-Encrypted: i=1; AJvYcCVSupxDQwtqugmqwnmOVqZx+RPZJlqrWZZ2amIk0ZQngzosG0PDACcm7/CkTjwBucmRUVr2q9hztok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZwFD8AgDuXiTzqi0MqlUj5fkIP1yryvCnlGyY4hcMks5xuvt/
	c5NqnhPWamwL6HBwFYZhECU6c34ydlsiJvWFNYslbPDi3pG5TVhqOrB6GpSRqG/tIQ==
X-Gm-Gg: ASbGncsZMlZNr+Vmzi2fcTNXgNMsrKUXAMGHM9bdsA/b5H99K91I174G4eqLp2N4fYE
	yXWYQi0T0bqyJV0aEOesxSeRUiLXjNozIj2V0qlQ/H7+6n6ggQ/Wue00rPkQusWL8Jg7qDHb7GW
	LjcVGnQt6CrstfOBVkrPfsKJTeHthSNkyk7eIufRVzR/IBfClryLKB73TIenDiq1VSZ1HP7iz+d
	pi6WB3IvwCalYAtdkosfVtXT6xQ+GqE9gqYhcb/9jtRRlHntO1vjIT2K55cilItczs/+kHT2Uyo
	HBMMgOJYBOzBVewruzsUHS4Ojz1+SAgxcuudWWvVZ7TDGGB7A72lvmeDEtERQxEQWU5Ef4CmKwd
	V2+a2V8DDJQ9e25tXSahM5E9wGKzjp8Rm9JVvlovssJletIw=
X-Google-Smtp-Source: AGHT+IG31JsL1Bi5wTyquonzl8TZFavWYJ1Hh5fW6XP7kKPMtFH1LaJGb9fIpAEBX23WXWLKpY1p0g==
X-Received: by 2002:adf:c084:0:b0:3a4:f9e7:2796 with SMTP id ffacd0b85a97d-3a9176038c6mr7939395f8f.35.1751271646334;
        Mon, 30 Jun 2025 01:20:46 -0700 (PDT)
Message-ID: <a4244940-8c03-4391-8078-7308d6a3fcca@suse.com>
Date: Mon, 30 Jun 2025 10:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <20250616064128.581164-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250616064128.581164-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 08:41, Penny Zheng wrote:
> Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
> equivalent "if !...") in Kconfig file, since negative dependancy will badly
> affect allyesconfig.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v2 -> v3:
> - remove comment for PV_SHIM_EXCLUSIVE
> ---
> v3 -> v4:
> - explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"

Where did these changes go? Nothing is said about ...

> - Add "default y" for SHADOW_PAGING and TBOOT
> - refactor commit message
> ---
> v4 -> v5:
> - For not breaking allyesconfig, changes to defaults are actually not needed.
> So remove them all
> - Leave one blank lines

... their (complete) dropping here. Aiui overrides for anything where you
remove the dependency (and where the intended setting for the shim is different
from the general default) would still be needed here.

And then there's still a non-"depends on" change left ...

> --- a/xen/drivers/video/Kconfig
> +++ b/xen/drivers/video/Kconfig
> @@ -3,7 +3,7 @@ config VIDEO
>  	bool
>  
>  config VGA
> -	bool "VGA support" if !PV_SHIM_EXCLUSIVE
> +	bool "VGA support"
>  	select VIDEO
>  	depends on X86
>  	default y if !PV_SHIM_EXCLUSIVE

... here, which (as indicated before) imo doesn't belong here, but at the very
least would need covering in the description.

Also, just to repeat what I said in reply to the cover letter: Imo this change
needs to move 2nd to last in the series, and it then wants committing together
with the last patch (which you will want to put in as a remark to the eventual
committer).

Jan

