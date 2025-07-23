Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BFB0F71A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054411.1423180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebSn-0004rN-9L; Wed, 23 Jul 2025 15:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054411.1423180; Wed, 23 Jul 2025 15:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebSn-0004pw-6Z; Wed, 23 Jul 2025 15:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1054411;
 Wed, 23 Jul 2025 15:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uebSl-0004pq-3U
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:32:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eaf50b3-67da-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:32:57 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso71050395e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:32:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f3c999588sm7336322a12.66.2025.07.23.08.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:32:55 -0700 (PDT)
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
X-Inumbo-ID: 4eaf50b3-67da-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753284776; x=1753889576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UbS5003VCPKV1HA3/2Cps8wYVts6Ne5uI7BNFJA96h8=;
        b=K/ZgNrGM8XhgfSfEj++C9JGAuDGQFYpMR8ZmwLP0LMcie/Cl8EH7YO1Few1XsCy1lH
         uE3PvFkd4SV9jaw4fMHosKU55v4D5DCgRgxSFO4CzHxS7fbSdt4pTfsXQpOnhZI4UllJ
         oKrOUiWuSypWgZpOF/VicTWiKTz+PB2XqCk+PUwKsgMfkvUMgvhnSjl28sbquUUBFYGF
         rwhWIOrJYXDPkgOqGSzGgL2wJ77mAenrSEpCieQSVScMlNPjHCQ7HL3z5KG6dcSlH6kJ
         G40IB47KQtlUa2n2vulYwqE7AjpDqwgIwmGDj1AxfLQnsa41uu3jrH9FV3XVxyXiUBGA
         5csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753284776; x=1753889576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbS5003VCPKV1HA3/2Cps8wYVts6Ne5uI7BNFJA96h8=;
        b=ALtCRe4sCIcXJDn+sCYbjfe+saVmj5ZIZudEFVeUEgl42TmV5bd2ZJHGb8eLwdHJV7
         S35C7ADlSX3bGlFsdlfzdJDyRUeH3tJK8oAUfYZWODm3PGwCi0qOV0Wy/PuIa9ckA2Yh
         Nshq30Fxo4058eogEFcOs6m+sxF7bdaUsJeA7NzbqTRGGcbkCID/bF8Uc2gcilbGO58f
         wbFzLIlLaiWd8tdZn1Z4wwP659pUg48nVyE9jXBtqVzwYtZInouwBL8d+Rn+uDRSVMII
         /gAU36Jaf+qP31yJEKNMq1XUcIgjbfyHsMo7gB3EBIqs7eaPeu7z9nxOTCf2Gh58r5s0
         nmzw==
X-Forwarded-Encrypted: i=1; AJvYcCWuReifzW2x+8LvNbRRDNOpEZb40aa+c5TeHGi2I1A4QyH2I0MxSnQLgEQ/oXYXYvc0/b1MKUTESOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZBGH5NP0f+Sne4z14QyINwz97/w3QdceaAcZKdkm89fo5Ezun
	CsauOzU7fa1oex2LkjIdYY3U/PnqvMVsVtr5TfCUHSXz5S/Da7hL82gnu3+3+TO+Sg==
X-Gm-Gg: ASbGnctiqf7vbfKFCCA+cHBbjSQPWzhdPx4Sha0Gr75QCfqQkgKFkF1XhJsQm4lB542
	pbmlJgKHJX3keG9yLrAHzxyn/e934Q7DIL6Ua36Qlhq1dyRjKz7uCIK24BzBJXhWEg6Wa4Wgz8j
	VpSONvXTj0CaJeDN38OUQMgDC3j66KoK+CxCdCYY/+booeZsDa2v3kY7YbNZnMdn2bSJ2d6VfC6
	aP1yJwULw3t6xFEZ7tmKZCWbu0NSEk/ZLP8+FhV6tzof5hjn4ST9tOjHkft3OcECxz4tU50Iu/n
	vNxBaVRv/D1jOzC4zXfp1WB/lcjScuP+MLXkJaV02RIK1jxuiPPpqO3xI+yD4zgnYthvujfoL9R
	NOgfbV8npZ3nC7kIgBQxl4pyQFHRN9ngB89HtWaWshn885gEcr90bpzXTLf4KH3T0GrZiMsse67
	zd+yAlgss=
X-Google-Smtp-Source: AGHT+IGIwMZglcpa2c5FcRo3jdsLEyZbJPBjZVf+oHXMFnAE6Zt1D+8gJEgw68MX2HebVBLPFg1A+A==
X-Received: by 2002:a5d:64c5:0:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3b768ee093dmr2998819f8f.10.1753284776239;
        Wed, 23 Jul 2025 08:32:56 -0700 (PDT)
Message-ID: <ed42e8fa-ef5c-4280-ae88-4e7b817e3d6f@suse.com>
Date: Wed, 23 Jul 2025 17:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvmloader: adjust strtoll() to parse hex numbers
 without 0x prefix
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250723151949.89400-1-roger.pau@citrix.com>
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
In-Reply-To: <20250723151949.89400-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2025 17:19, Roger Pau Monne wrote:
> The current strtoll() implementation in hvmloader requires hex number to be
> prefixed with 0x, otherwise strtoll() won't parse them correctly even when
> calling the function with base == 16.
> 
> Fix this by not unconditionally setting the base to 10 when the string is
> not 0 prefixed, this also allows parsing octal numbers not 0 prefixed.
> While there also handle '0X' as a valid hex number prefix, together with
> '0x'.
> 
> No functional change intended to the existing call sites.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Noticed this oddity while looking at something else - I don't really have a
> use case for such parsing, but I think it would be better to get this fixed
> in case it's needed in the future.

I agree. Without it actually mattering right now, I don't think I'll
pick it up for backporting, though.

Jan

