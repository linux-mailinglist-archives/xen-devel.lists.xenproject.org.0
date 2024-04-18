Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA28A964A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708164.1106808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOBl-00053F-DC; Thu, 18 Apr 2024 09:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708164.1106808; Thu, 18 Apr 2024 09:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOBl-00050T-AE; Thu, 18 Apr 2024 09:36:17 +0000
Received: by outflank-mailman (input) for mailman id 708164;
 Thu, 18 Apr 2024 09:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxOBk-00050N-Op
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:36:16 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19cded89-fd67-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 11:36:15 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-346359c8785so465651f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:36:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b00343daeddcb2sm1371494wrt.45.2024.04.18.02.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:36:14 -0700 (PDT)
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
X-Inumbo-ID: 19cded89-fd67-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713432975; x=1714037775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PuieK1UYmmHqLoOvrU1CZpgX0o0+qK+QbJIehaJKxOU=;
        b=F6qGPnk14tacwKIuk//NQ5tLCa4VNBx/s6Y8IRdlMbHMn9AGcQEAmndS9JOhWxuO31
         6A9hpwXY5FQH2Nn9sinVMtIGmjXdJiXrHhqsB9Npoyk1m+tGa8AWJFC06DTX/2yl0qaM
         4tEEJTQ2eDFxgl8leQl5iGGvScfmibUXAr4w3HvuoaStCAK+d3b8elppBvrYCTKvgFZQ
         Mn329lRNOCY0Qc0OnIN7Onr/At4tS3UV5CcuPVvxtrwSAJa5jjQOfO6GU24IHaRMLAnY
         URQC37fAxKIhsllzyb6fSShVJCr8NtZIfK+82sknhRFZo65nzRiR0PP89A3ZNVYeOC5u
         8Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713432975; x=1714037775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PuieK1UYmmHqLoOvrU1CZpgX0o0+qK+QbJIehaJKxOU=;
        b=aSmzSpX39MIpLHSfDHhVr73EyTsoInVUgqwZq2piYW7SocD+ejWkK/L0D87rI2+Taz
         MGLpIWYJ5RAcFBlH4rW5XfHZ0Oq8vATHkQ2NlpkLnoibGvC2aDL0pvxd7jlN5kMhS8Kk
         Vf4Tbma9i2ElcFjJ6SMxXkKxB+TRFNb+/4+2ft2R3/VFT74TbCSAwqeMUHgzkki2hnq6
         qIKdvh1cC74xZN7yyU4NM245q1DBYumZgwcRGdG+0/thb4T+Gl0Oy61CYIkpHRI6avtR
         lIW3kFmBHBAEbAhSgJTwvBkejQXH4IoXxBFCFglFodDrJCKbwuxfUwIq7WEP86FADLYA
         qmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyySKAX5fXAsphh5xumxI6X2yHOZKd2qfbn4IzoP9i+cD7Tt5ANUceQ7visfYxisN7TZtQdXUn5Ah8sq3tsxFelKDlCQMsTlKFODp4Aio=
X-Gm-Message-State: AOJu0Yxz3csAGYkXID5xbW9luvFlg7LBpKCXoKDP7/TM2y605nkmy/Wt
	y5fovqFb+J3097bTM016D8TwK12ShSVthx4IZW7vZ09sxnFU+9apUVHJiAJiaQ==
X-Google-Smtp-Source: AGHT+IF1oFe0XI4T7EnwDP0CgbMuw1DShDJQGjvh6By7UTsEFn0yjNR6bdeReJlUoLuMlD8uowwpwg==
X-Received: by 2002:adf:ab0e:0:b0:341:a640:b516 with SMTP id q14-20020adfab0e000000b00341a640b516mr1118616wrc.70.1713432974711;
        Thu, 18 Apr 2024 02:36:14 -0700 (PDT)
Message-ID: <82fb4a07-ecd7-46a7-b7a9-596f2f8ca38b@suse.com>
Date: Thu, 18 Apr 2024 11:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/public: Use -Wpadding for public headers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240415154155.2718064-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2024 17:41, Andrew Cooper wrote:
> RFC.  In theory this is a great way to avoid some of the spiketraps involved
> with C being the official representation.
> 
> However, this doesn't build.  gnttab_transfer has a layout that requires a
> CONFIG_COMPAT if we want to satisfy -Wpadding for both forms of the structure.
> 
> Thoughts on whether this cross-check is worthwhile-enough to warrant the
> ifdefary?

#ifdef-ary in general would be okay. But any #ifdef CONFIG_* would look pretty
odd to me in a public header. Perhaps as

#if defined(__XEN__) && defined(CONFIG_COMPAT)

it might be tolerable.

> --- /dev/null
> +++ b/xen/common/hdr-chk.c
> @@ -0,0 +1,13 @@
> +#include <xen/stdint.h>
> +
> +#include <public/xen.h>
> +
> +#pragma GCC diagnostic error "-Wpadded"

Everywhere up to here you say -Wpadding.

> +#include <public/grant_table.h>
> +
> +#ifdef CONFIG_COMPAT
> +
> +#include <compat/grant_table.h>
> +
> +#endif /* CONFIG_COMPAT */

I'm not overly happy to see a 2nd header checking "pass" added. We already
have the headers.chk goal in xen/include/Makefile, after all. For the non-
generated headers adding -Wpadded there would seem more natural to me,
first and foremost because then it is less likely that one of the two places
would be missed if a new header is added. Something long those lines may then
need adding for the generated compat headers, but again preferably without
enumerating them all in yet another place.

> --- a/xen/include/public/grant_table.h
> +++ b/xen/include/public/grant_table.h
> @@ -355,6 +355,7 @@ struct gnttab_unmap_grant_ref {
>      grant_handle_t handle;
>      /* OUT parameters. */
>      int16_t  status;              /* => enum grant_status */
> +    uint16_t _pad0;

While you may view it as nitpicking, in the public headers I'm pretty firm
on not wanting to see new name space violations, i.e. new names with leading
underscores which aren't file-scope identifiers.

Furthermore what's the deal with using "pad0" here and in one more place,
but "ign1" / "ign2" in other cases?

> @@ -371,6 +372,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
>  struct gnttab_setup_table {
>      /* IN parameters. */
>      domid_t  dom;
> +    uint16_t _pad0;
>      uint32_t nr_frames;
>      /* OUT parameters. */
>      int16_t  status;              /* => enum grant_status */

I'm surprised no padding field would be needed right below here, seeing
that what follows is a handle:

#if __XEN_INTERFACE_VERSION__ < 0x00040300
    XEN_GUEST_HANDLE(ulong) frame_list;
#else
    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
#endif

The size of this padding field would then also be compat-dependent, I
suppose.

Jan

