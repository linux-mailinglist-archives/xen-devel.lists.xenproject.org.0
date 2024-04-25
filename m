Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777DD8B1F84
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 12:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711998.1112374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzwbQ-0000JO-VV; Thu, 25 Apr 2024 10:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711998.1112374; Thu, 25 Apr 2024 10:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzwbQ-0000Go-Sa; Thu, 25 Apr 2024 10:45:20 +0000
Received: by outflank-mailman (input) for mailman id 711998;
 Thu, 25 Apr 2024 10:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzwbP-0007s2-0f
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 10:45:19 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e779e8c8-02f0-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 12:45:17 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2dd6c160eaaso9653131fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 03:45:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00418d5b16f85sm26954858wmn.21.2024.04.25.03.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 03:45:16 -0700 (PDT)
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
X-Inumbo-ID: e779e8c8-02f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714041916; x=1714646716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQDIgLtMDd/1FcA7Ksnm+UpSKzgxxxqOEvnEcJ5ONN0=;
        b=g70ODuWO3D/C64I4Zg4CSTNJ43I8KtO2VGcrSQmaMWxZ5sEkl5hhzqnvQY/OgK1k2h
         S365VQ08JXIsEPFA3ECxLFc8lchGzAfPxE0jemYwqNo/k1Od76n9Yw3yJHDKidEP29BD
         U0Zld/nAm5Tzq3yViOAjMnnFAkKI70PHlHFnQklFdM/Cqkcdc502edYkL1K2V5jVdzEy
         drB5Mqz8kNPmMQZdNGtFf/g7iRbyXVg+10LQ9SD2pCsw7w4ZVin1aUcqSmPdZ6c09sTK
         hBSzUcKjsaAOCtUI9feOIICdyk1+u9c+Hcc7/VLkxa5NjCzotECKkU5dhnj9m2LA8Dwc
         L9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714041916; x=1714646716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQDIgLtMDd/1FcA7Ksnm+UpSKzgxxxqOEvnEcJ5ONN0=;
        b=nxjmgWRyARUej6RHuUZTPOuQaR45c5DLDd7/fw/J2s5Mv6b5rfHXtB8l1xzC4trhZy
         1dMnqw0WNMPUmRIc1FXvmU1/H/a3nM/06xXynd9+fGFtduhTd5ta/5iWUpb3j1SPpJ23
         ddKuf7m7MkpbR6oc1HUzpLO45xTVmRsyMh9VP2J4lYGpuhBAzhsBNG1apeSpS4qtNNmL
         2n1d2mMEsAdLYI4Z3w3hdhcCr5bTCPJalIn8dcJgTAFuFhAby3KibcLIT8t7a65A7xIW
         g45N6whVwto5ytAOkNxgrGP2LYlOKsNlAogyJOW7yluSADOEDy8lSLUzJNzzmHD1XvJp
         WfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLrearSwW/zfzeK9zHbCfe3t8m0yPK5uUPJhJ3YuQpUmG28MMs3PXWj8+K35xxhVAI0kDlMIJXu0a1QPUVMRXLjAwqyrnq1znZohOR+9k=
X-Gm-Message-State: AOJu0YxQaZQIv2sH/26xaIIwlHC5/Q4QtOla96ew96S12bUsw7vhvjI7
	grgn+8yvvXKwIhYlfNTEKE7xsQyqRocNVLkQ3PN/UyFIlob4o54/a6NBLtmK5g==
X-Google-Smtp-Source: AGHT+IFzLHOe5iZwO3+YtpkN28HBBQ/5sDJmCigYGKR5I/EjAS1Z9d+IrO3qL/GyBSbah/qIiWpi7w==
X-Received: by 2002:a2e:84c9:0:b0:2da:36be:1b4a with SMTP id q9-20020a2e84c9000000b002da36be1b4amr4341610ljh.19.1714041916594;
        Thu, 25 Apr 2024 03:45:16 -0700 (PDT)
Message-ID: <c2a9006f-a778-429c-848e-ab32529b43f1@suse.com>
Date: Thu, 25 Apr 2024 12:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <3e1150560a41bd567049627d684cd4e754530869.1710342968.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <3e1150560a41bd567049627d684cd4e754530869.1710342968.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2024 16:16, Marek Marczykowski-Górecki wrote:
> QEMU needs to know whether clearing maskbit of a vector is really
> clearing, or was already cleared before. Currently Xen sends only
> clearing that bit to the device model, but not setting it, so QEMU
> cannot detect it. Because of that, QEMU is working this around by
> checking via /dev/mem, but that isn't the proper approach.
> 
> Give all necessary information to QEMU by passing all ctrl writes,
> including masking a vector. Advertise the new behavior via
> XENVER_get_features, so QEMU can know it doesn't need to access /dev/mem
> anymore.
> 
> While this commit doesn't move the whole maskbit handling to QEMU (as
> discussed on xen-devel as one of the possibilities), it is a necessary
> first step anyway. Including telling QEMU it will get all the required
> information to do so. The actual implementation would need to include:
>  - a hypercall for QEMU to control just maskbit (without (re)binding the
>    interrupt again
>  - a methor for QEMU to tell Xen it will actually do the work
> Those are not part of this series.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> I did not added any control to enable/disable this new behavior (as
> Roger have suggested for possible non-QEMU ioreqs). I don't see how the
> new behavior could be problematic for some existing ioreq server (they
> already received writes to those addresses, just not all of them),
> but if that's really necessary, I can probably add a command line option
> to restore previous behavior system-wide.

Roger, please indicate whether you consider things to be okay to go in
as is, or whether you demand this earlier concern of yours to be addressed
by adding a command line option (or even finer-grained control).

Jan

