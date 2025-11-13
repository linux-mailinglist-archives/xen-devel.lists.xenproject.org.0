Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98FC57447
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161090.1489104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVqW-0001Ny-Fx; Thu, 13 Nov 2025 11:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161090.1489104; Thu, 13 Nov 2025 11:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVqW-0001Lu-DK; Thu, 13 Nov 2025 11:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1161090;
 Thu, 13 Nov 2025 11:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVqV-0001Lo-9V
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:50:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5169967-c086-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 12:50:33 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so1193348a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:50:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b2155sm1287405a12.29.2025.11.13.03.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:50:31 -0800 (PST)
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
X-Inumbo-ID: f5169967-c086-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763034631; x=1763639431; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zCQyhlYxpZcCq/t6A4KQwqoBcvSUZzjN81//0doSuEA=;
        b=VPMklaVJkClz4ssMXopEJJi1FII1A/fP1fY8C9JMsH9KFaGFnM9p8Or/TPTgTGzrTQ
         ix+Fw218kQg5exRi7/JKcNEpqQ6B6neqRBYxdc/xDHMYDyD/qqR4Hviwf8GM1T8wqSS9
         ja12Pv/DP2Yec5Qa81EJa5ZGKGakEalbj0SJR4DozfZQpmBp3mqslxnGwO9DsmkbgxrM
         x41HEd60G+qjViD7xNXTF3iAo0nk4u5GvDOJem3brW+YjyiFr24tzmvi7PBb1B5m7AAO
         BArVV0XjGa92yYdQjbd/3wxMb66LCq0FGYBOkVlXoCFg9/k65470V2nyYY2k83XGGwLt
         Ta3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763034631; x=1763639431;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCQyhlYxpZcCq/t6A4KQwqoBcvSUZzjN81//0doSuEA=;
        b=izYkRi8r9Kb0GbtSFADw8xQujfpJ09aHGsdud8Tt9dBMUYDWcRYZX7krZgZJRbgU7N
         Tg3nN4pAmwlZbFqN+AqNvq0sWGiQlpsSnsPYS8Pewr6CuF5Z95M9BD6iQ/MSNbwMWMHF
         6umWyjj7GVooaTBo3CGsVqoVXAS9W0XAg5rMnfdrvH1UEB32BI3SajE5UuPTXUmiRRlT
         JL6ss7otxAzSlMr0hMyRyRaeJib1EKToo3Gi+rD2Hl82utJaYUgfyJGyBraNXza9s0dj
         IJkOysraha16tsd9wyLv8rSkZ4X2MlHVJcSPu49Vp+BZujTQmUgcFoDe2H4s6zWHvXqG
         Tstg==
X-Forwarded-Encrypted: i=1; AJvYcCWmeeQvFcYXvnyyw/HD6B59D6oLcJN6wFova1tApFghgJBw0WWyvYFDcHkLBnaThSW8+FotF+mePCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoSlgZlzAcXU4XYRjTMdzuE0xcth5Aa8DgnCp/OTg5BdgJ6fFQ
	ZjxTeu66f/7JhrVDMIRyKmVu0PSW4aSOy/d66RsYLm1Wv0N8DQsQWxF0dq1hR3Cxfw==
X-Gm-Gg: ASbGncuFNJ/U+nVGYyX17eUFbAnzS2htBiSjinBNZBQTevcqAFYcvmBKFgaBSi0WVoy
	N8h3S7ZByt+awwuiPPA22mglE2mkHNJGSqwZcRffHFU2hHRmw6KGlc97ZpAuJT4nHWr0cNuaLm+
	N+MU5+KQUvhvp5aJqmeagsTV2Tx6nTT1cXiDTOoPozmTTOtXog4+RyQBQGpzpsN0vlaFu8FH8+D
	KGrvzeMUwJFGlxISjRJ8ShFbzKNYpa955G8zBsCgVX5QT8ulk3PdPJH494joYHxB+vUlMxWdQ4l
	Omo+JhJ4oE46/LcJHpJMu3USA7L7ECP4qgto3vlmVR19N/H6LxdXLYyujGoLHn+LuhHzQn1mHh7
	04FvDlRedOIYwIIFvgfRfeu/s8TGlKRv49Ef5Xn5BVRADJedjQCM0MUdKgWGCxR0PIZ8MhkvTtM
	oKPqYetVKICbHK2sA3krh4XR/kc2WeVG5wNMWcCLSnJSxbu+j7cMMY5TsRdNfjbO18pLv7DzTok
	VM=
X-Google-Smtp-Source: AGHT+IEIboc0S+e+9JX/ImrFUHfHIS9DDfUsS8tEtlJ1dBZKWHzPDvZdxijBlXlnOYejf4OAgNx/Ww==
X-Received: by 2002:a05:6402:51c7:b0:640:c69b:8ecd with SMTP id 4fb4d7f45d1cf-6431a57647dmr5512081a12.25.1763034631295;
        Thu, 13 Nov 2025 03:50:31 -0800 (PST)
Message-ID: <5c08e298-3ef4-451c-b0f8-24f207a9d512@suse.com>
Date: Thu, 13 Nov 2025 12:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 16:22, Alejandro Vallejo wrote:
> They are unnecessary. The only two cases with link-time failures are
> fallback else branches that can just as well be adjusted with explicit
> IS_ENABLED(CONFIG_PV). HVM has no equivalent stubs and there's no reason
> to keep the asymmetry.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> I'd rather remove the "rc = -EOPNOTSUPP" branch altogether, or replace
> it with ASSERT_UNREACHABLE(), but I kept it here to preserve prior behaviour.
> 
> Thoughts?

I think using ASSERT_UNREACHABLE() there would be better, in particular bring
things in line with the {hvm,pv}_domain_initialise() call site. Preferably
that way (happy to adjust while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

