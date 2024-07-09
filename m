Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5450C92BA9E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756263.1164816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAZt-0005X0-17; Tue, 09 Jul 2024 13:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756263.1164816; Tue, 09 Jul 2024 13:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAZs-0005Tq-UQ; Tue, 09 Jul 2024 13:08:16 +0000
Received: by outflank-mailman (input) for mailman id 756263;
 Tue, 09 Jul 2024 13:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRAZr-0005Tk-PF
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 13:08:15 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d31a602-3df4-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 15:08:14 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so44171201fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 06:08:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6c48sm15594885ad.152.2024.07.09.06.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 06:08:13 -0700 (PDT)
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
X-Inumbo-ID: 4d31a602-3df4-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720530494; x=1721135294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NSYGY4y3m6QD1Xst4sVYikiWogvvrkFCMWfzJfKumiw=;
        b=f+2UquWcA8qYDMacgLsvHearXNxNUhiAmrUTKmyitmOiZO6edr0c/z0nq7jibF10JI
         j5cs/9FP3L7/1mCmVhbog0ViKmGsjW3fTvw6iaEPNatSECfZLXRu89oeZ7YesCKmhthf
         RxzCB4+haCDgAq37S6iAtibiFyfsBh4KfFpZ59bUAxh70GwC6bT+gKvr+q/hy6wyUdPS
         JiNPtVvNE6LkNAzPvF3eYcjtVJutX/q1iOLbUPD4s3QDK7MFYI1iiWfsLLZuRB1J2Buf
         bkzHW2YGzD77xkto5BqTiTgQhsnlWKdPcA/AIOQie3YEdIn5tDbqVQSQ/DhLPMWTZelo
         UiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530494; x=1721135294;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSYGY4y3m6QD1Xst4sVYikiWogvvrkFCMWfzJfKumiw=;
        b=JWgObLVguG0Ho3eZt4EOYw/kOcXMCbZiVnBwVLQPl8P9CPZ0/0kt1vLV4veQRgOFYf
         eZmL1KrIbgZSQddi2vwaEuFvFKNYFEzRtX08vHSeU6e1KrcDZiF7edA/xeplD8rR1hTs
         FYURPwYbaT3BG5nEzjUoehPxnePXQ3Y7HhYMd6X/MPKu2TGvhTYzc6q5yxrmvtDhUdoh
         4i05ZPWOsGlYLIYtI6pZlzZX1MSIPYo7afbFrOQJY2RC9iDYySEracZehGhF2AqaejqD
         akPJYk5bku6e39QYf2V3uipqBzfsiEXr0ctfhr411I9ww3G4oQJoPIWSS0RBYlr2v9jd
         L32A==
X-Forwarded-Encrypted: i=1; AJvYcCXHtCnWVDFOx4McDRzOVyfeccmcv/8UNhGM7nKCo1TP+BB1lyirxEOc7Utiwnw+gEA77PI18FRwu00lDMjeZXl76mprNpnMNG7uOGZZnnc=
X-Gm-Message-State: AOJu0YwlZ+tsnGpP2mXoZkm1OBGSAcrX9aDTkMYsyMjgguKh+RZjhXWq
	Oh6cJx2p7rXV2ZOqRq9gVc1/TWwQkySJLq/XP0RKU5NNeaNK1T12AOF7sbv6Qg==
X-Google-Smtp-Source: AGHT+IF6PF1m5ncIDnm5hMsmnjK3gYeTj+YhkAwY7WIrjDLyjJKXzrOcm2hE2rES1uB0ZIGyHCFJWA==
X-Received: by 2002:a05:6512:3c81:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-52eb99d219amr2472536e87.43.1720530494156;
        Tue, 09 Jul 2024 06:08:14 -0700 (PDT)
Message-ID: <e350fbb3-edfb-407d-aa69-ae995889b262@suse.com>
Date: Tue, 9 Jul 2024 15:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240708114124.407797-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 13:41, Jiqian Chen wrote:
> Some type of domains don't have PIRQs, like PVH, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> to guest base on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> irq on Xen side.
> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> passing in pirq to set the access of irq, it is not suitable for
> dom0 that doesn't have PIRQs.
> 
> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
> the permission of irq(translate from x86 gsi) to dumU when dom0
> has no PIRQs.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> CC: Daniel P . Smith <dpsmith@apertussolutions.com>
> Remaining comment @Daniel P . Smith:
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
> +            goto gsi_permission_out;
> Is it okay to issue the XSM check using the translated value, 
> not the one that was originally passed into the hypercall?

As long as the answer to this is going to be "Yes":
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Daniel, awaiting your input.

Jan

