Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00628C77ED
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723347.1128110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bTs-0002UN-77; Thu, 16 May 2024 13:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723347.1128110; Thu, 16 May 2024 13:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bTs-0002SG-4P; Thu, 16 May 2024 13:49:12 +0000
Received: by outflank-mailman (input) for mailman id 723347;
 Thu, 16 May 2024 13:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7bTq-0002SA-SF
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:49:10 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11744277-138b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:49:08 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5727dc6d3edso3569800a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 06:49:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bebb6d5sm10530402a12.34.2024.05.16.06.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:49:07 -0700 (PDT)
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
X-Inumbo-ID: 11744277-138b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715867348; x=1716472148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hzbt2g5wYfhQ2IZeexNtkD/ZoJ5JqZpxfBpMIie+F30=;
        b=TD4+gLnzv6Fl8gvnt9KGmkd48FbE38sZLbH7bnZBK2MspWx/CLDQKMsD3vsc/mkad2
         bARTudkf6io1QHjwANFSrMnf3msIHmx2eKR1gyaVlBnqdBteeIlnCGJE+z+fBB0pBC+5
         fQgXdBiDfQgPHG1QNF5CBsPOYBlYqz7jZmvEARdw3h4VAreY/O5mEV5b1ltER89epDSB
         T5jbRYFbUVJpjBxl82caRC+zX+1tc5X4UIR75sEBsQEbwViv+it2Rir5HKnqQFvHPaSB
         Sh3ddR1bPmeQmSmzAupqDfyTb5nTVyUhWLov/6u1kFDvTOmF0f2glHDdOdEIkOGa5WDl
         TrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715867348; x=1716472148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzbt2g5wYfhQ2IZeexNtkD/ZoJ5JqZpxfBpMIie+F30=;
        b=JaksHCnudHTTXDGwdf4PfWlhGsw1QhtASkUu/2XpjOoLsa/lFFZ1P2FHi3doxMEGCm
         kJ/tPITerPZ1fBgSf391nxDYaE9+MDxZYbD3cO5HY1rN9mk6nRZB2H6gQndVWis6O+Ma
         l5rKy82g7/q3qSod02wfPUlbpipcErzGrUZChO2rakJelTy7VfYIGfpFXZv7IYu6xuoS
         lZ9DY1GhlG0QlvORf0LRwuU8Ct9ek00oaWERVCylB9QxKnQiY++yf1J+YJX/fCr0De8M
         ItuLGak1Rh7tuyWyW17/g9B0C+UL4TXxIDQWgCJHkM1VCubeOM27cDKu7DILo3w1LO4i
         fy0w==
X-Forwarded-Encrypted: i=1; AJvYcCXVWgPcKEJACP6yjwEAfAcs/iss+nQR+/l08y1ZyTs8Z7YAfJuLL2XogFaEGYWad9B+o/avGsiHATq0vDdZqjoeg+wvj7NUgUubrdqmaK0=
X-Gm-Message-State: AOJu0YwEiO2ZO+SXQFNKCYZWVMbU4YJZb8xBuJklebinkP/KD9xHz0/g
	YyHPVx3medy1VK++i1kNTXMHXxGyhYMiOl5ZG6g9CPcqrfsRpipFZd2rBlmrLA==
X-Google-Smtp-Source: AGHT+IHG9SfYYixUR7aDMq79JzGLosE2BMZIndbhbghaN7aoOm4Yy0X7phgYf/VxDVyXWFXYayNlqw==
X-Received: by 2002:a50:baeb:0:b0:572:6675:258f with SMTP id 4fb4d7f45d1cf-5734d5ceb2dmr12470457a12.24.1715867348209;
        Thu, 16 May 2024 06:49:08 -0700 (PDT)
Message-ID: <34f6ac6d-0bad-478a-86c1-a124df5504c8@suse.com>
Date: Thu, 16 May 2024 15:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240516095235.64128-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 11:52, Jiqian Chen wrote:
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -76,6 +76,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_unmap_pirq:
>          break;
>  
> +    case PHYSDEVOP_setup_gsi:
> +        if ( !is_hardware_domain(currd) )
> +            return -EOPNOTSUPP;
> +        break;
> +
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:

Below here we have a hardware-domain-only block already. Any reason not
to add to there? Yes, that uses -ENOSYS. Imo that wants changing anyway,
but even without that to me it would seem more consistent overall to have
the new case simply added there.

Just to double check: Is there a respective Linux patch already (if so,
cross-linking the patches may be helpful)? Or does PVH Linux invoke the
sub-op already anyway, just that so far it fails?

Jan

