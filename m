Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D41BE6851
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 08:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144905.1478105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dYL-0000ry-HH; Fri, 17 Oct 2025 06:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144905.1478105; Fri, 17 Oct 2025 06:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dYL-0000pl-Ea; Fri, 17 Oct 2025 06:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1144905;
 Fri, 17 Oct 2025 06:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9dYK-0000pf-Fa
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 06:03:00 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eef0ef86-ab1e-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 08:02:59 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4710683a644so13812815e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 23:02:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm39786673f8f.32.2025.10.16.23.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 23:02:58 -0700 (PDT)
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
X-Inumbo-ID: eef0ef86-ab1e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760680979; x=1761285779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t67zSzfAu0Gji3B7q03ubjzI6iUfJomD9RQTTUi3Yog=;
        b=DgzHNH2opyfQZki0v5piueUezhm96ZsxNEZUIaxzeGhVnEBhvC/DRoC5DEys7fS64m
         gDoQ+UNb0v+cfBAJsGjmpJyMxayUjLg3iY4TZa8wQ4lkiC3r6wEa4Z/Au/rV+sZqLeBU
         iImnaXzyNfBSf4JnHqxnm3WbtuelE8WdgxJnq0f/xWQIQ37Jzx1+4UnQZ0P4ET+IGxDb
         H8XQwQzfH+gl8repgJYyuhtXObYrYwiErgF9osaTHipl5yk3aMuMEKuvhOEOvbb+WcyD
         qbToxGsn07cBrAyWm0fALVV0HNEj0OtOdnOXumFOH4jXMZ+KGUIvTsPFI6E7DEWzDV9g
         rYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680979; x=1761285779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t67zSzfAu0Gji3B7q03ubjzI6iUfJomD9RQTTUi3Yog=;
        b=wc6vqL+lkUiS/07Bu0mnygNoEs1TiJVY4xVob/Jhd2tswVHt5jVuC+W438S+WwzxfV
         6yM5WunZ7saYC31pus6b+uPev652GPHrhbG2ZKd3FC2wxNusjfB0lfeuuzc9wJQ4vR0U
         oa0iRpPgI3cGELCaIDsCIVMLoJZ5aYU+JNr/ihRRxUCB3fWjsVJwLwW/KT6WPmwQzwtF
         00fhd+hKil97HkYYqo1CT9TFTzStsyaHcQxQElNQSckLRemjVYMiYkRScoHa0pjzGvVV
         aaRPpEP+XsO/h2Ek30O+3iSQy8qGKi8AOAYo6Mci8Dm227FpKB8qrkKipEa0iPWvOXyo
         23zA==
X-Forwarded-Encrypted: i=1; AJvYcCU8fqJT2zRfH22ewR/8dt1OSMJlxnrjpmrL/zgzQHRe+Og477XHBAddFY/cBbhE2VXMZZkfuNBbeh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8QXyk8GRWKUgg8DN+tDKX8PYoOLpBCdkPoe5DGMX9PcW0n7/W
	f9JFnEei5UZ7SbPVpj3dAl2U9V3BBPPiVAg7JyRKbva3iEokoWTfHTUu4Sic8nwMNQ==
X-Gm-Gg: ASbGnctzsQMlSnuPgFVzeWsgCdbHEqcpH5/tGuC3p7EMUW6tuGhZ/4cOwQsB4RZ+bEI
	D8oR0inNtSa7eWDsa16F1BK/xk/aykYgpbRpBnHkn/ZGs5DiozrktcE456imO1905uzFCOXSHk3
	RmmUQkv98iyouth4x3/Rp+IGgFyDxaVISVrhqNg6AWN3BT1WH0DuHfVAZt/2sBlCltMjMTQ6cPP
	2HeqOObQguOYNVvRKU6rQOTYe2nN2DGdmHaoFeXZJkRv50iA0i3OO7Ae8vQvhm2INe2scfJw/n3
	o0zflbAoBwQpEKsue7p5iGx8eBi0R/M7AofCIykoxLeHb7Zn1ez+DXEowYmowo0XXV0RGxv/vE7
	D544sXfQuNeUfP5MA5Zfhz0FC/gfqtK3PNxISgINRoHo2f85gZUwZsX8mvoqojNpcxhpQpyvUjK
	He9mfu44mtO+Yi1dgMXBCHrEqW9jLjVwPGGdtdy5W4FTsB6iSYTRSTPG9Sv2XPgCNG1gsSZN4=
X-Google-Smtp-Source: AGHT+IHoevQVCqqnrdSfbW8W4rG7SxuaW0JokQu1K88y1Vc+hon+tgNTPKz2PRsdyu9zCcPZgq5NQA==
X-Received: by 2002:a05:600c:a69d:b0:46e:1b9d:ac6c with SMTP id 5b1f17b1804b1-47109b58b51mr28521785e9.17.1760680978985;
        Thu, 16 Oct 2025 23:02:58 -0700 (PDT)
Message-ID: <f0820190-0819-4227-b1a7-209b6f1f9e29@suse.com>
Date: Fri, 17 Oct 2025 08:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Make gentypes.py compatible with older
 Python
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jgross@suse.com,
 oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
References: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
 <20251017020613.79855-1-jason.andryuk@amd.com>
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
In-Reply-To: <20251017020613.79855-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.10.2025 04:06, Jason Andryuk wrote:
> removeprefix is only added in Python 3.9.
> 
> Instead of the prefix removal, switch to passing in a "depth" parameter,
> and incrementing it for each level.
> 
> There is a slight change in the generated _libxl_types.c.  instances of
> KeyedUnion increment depth without outputing any code.  The net result
> is some cases where jso_sub_1 is followed by jso_sub_3.  As an example:
> 
> _libxl_types.c
> _libxl_types.c
> @@ -5535,12 +5535,12 @@
>                  if (!jso_sub_1)
>                      goto out;
>                  if (!libxl__string_is_default(&p->u.pty.path)) {
> -                    json_object *jso_sub_2 = NULL;
> -                    rc = libxl__string_gen_jso(&jso_sub_2, p->u.pty.path);
> +                    json_object *jso_sub_3 = NULL;
> +                    rc = libxl__string_gen_jso(&jso_sub_3, p->u.pty.path);
>                      if (rc)
>                          goto out;
> -                    if (json_object_object_add(jso_sub_1, "path", jso_sub_2)) {
> -                        json_object_put(jso_sub_2);
> +                    if (json_object_object_add(jso_sub_1, "path", jso_sub_3)) {
> +                        json_object_put(jso_sub_3);
>                          goto out;
>                      }
>                  }
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Here's an alternative approach to workaround removeprefix.

Fine with me; it's really Anthony's call. (He'll be back on Monday, aiui.)

Jan

