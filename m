Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117FB2F809
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 14:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088640.1446370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up4RX-0003GH-S3; Thu, 21 Aug 2025 12:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088640.1446370; Thu, 21 Aug 2025 12:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up4RX-0003Db-Og; Thu, 21 Aug 2025 12:30:59 +0000
Received: by outflank-mailman (input) for mailman id 1088640;
 Thu, 21 Aug 2025 12:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up4RV-00031X-VC
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 12:30:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af503609-7e8a-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 14:30:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134533so1965468a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 05:30:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded539ebbsm386134466b.111.2025.08.21.05.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 05:30:55 -0700 (PDT)
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
X-Inumbo-ID: af503609-7e8a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755779455; x=1756384255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X2zm1c0WhDKUDA/RtUDXmIr5olRl3yU07m4XPIOp/po=;
        b=MWA2iSjepD2Gz8X6TIDhHAGptf1ebKQxJPUnNL6u1I0JkkIe9Xj9nl2kSmo51KHJHb
         lkKIF59i4ixYQ25um9yWIQFXERuzjzRKPqvi4NdpcCBG+Q/z71/vvG7U/G+CvwpUyDs7
         3Xs9xPOAIEo3WJNJLeYzmB7BpEFL0PmE2aKvTCEVe/wnaC7IFyeOxlbGR7IumPBPS8zb
         Ng2/CgWoIz5ewjT9J7hf4DPve6Ag/JlAGvolzrUB87Jv7mN2A/gXrpxqpHM1pWG7nOb0
         0eKzOAHkmxKTGZbMjOKqRCBXTE80mQd2tjrzazPvJ9PcgfA0XbryJD6G1I7JrP0XonSs
         X8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779455; x=1756384255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2zm1c0WhDKUDA/RtUDXmIr5olRl3yU07m4XPIOp/po=;
        b=CrfeHUVBrAyORni944o8ghzXfS8AWJRAtfUXNfSdUspy/1CNafVQg9g4YS74RxQSgr
         m4CapJhfvnsmrKxK7GD8mg/xuju3zIbpBWVWiYQwODpR2oXP3HjrHbcU/15ZCq/FZxpI
         5585nqeui8RogbOw4lOLDAHglfHLHFNCS1H0bWmuuFnuBkgXagZ0a0ETD1//d2lTjM1a
         uFjvJyq579eZzP1yEj1f9RvGkbTPvVxId8x7TTXiVpOZER14qoZmaz3VmdzaE+RuM5Sr
         BfGqiisbmc9tBrgEalE4ZB56WjycqzyKGXnNwRKuqoknQwXtM7oQ70yoqeC237xv6uNM
         rrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtYKsJnCGkxOyG7Ovc/LKhLhbI43JhbpS85HqDvt2qPc1DRKnvt9JHfAHUoBoBlnVuPbF8MZ6Kn3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGcsq4UqdbxPEoPj1gOlPOEAew7tZtmDaenjl51Jhx3ME4VduO
	g+h0iV4VbZdirWQdzBgo/i1zFlb8N4G/r5poOusa6t+1P0TcegUqgsFQoklYD+L+eg==
X-Gm-Gg: ASbGncuRa5zPsVoaHUwupvjqkk2qYWiWDfsG74li2SrQ4hr7L94R8dVowrbydjrVsGX
	uPqbytGfTV/xGStQ3c75YgOis/enmRQCRlu+2H5TF4FQmjZBv3sXKaCLcewbNLMHYyTD4ZRa/x2
	loRe134aWtlB43rojvA6kQqMR0jhLRN8tX9SRHV/NFVZ47mEln4sc5nMVvqy1+oCaFoSxvkJXND
	oYCPaLTAcJWZJ2H7jwl2CoJy0hKuOQKxQx/0gwH4w6LZbseQfsxxW4U2V9YFLCKG04fQFxwLfK3
	5EOVqVhHUDKjxrXq6tzSsCJ5R2XaxU5rw9iTRbopspVT91B7p02AKPMDe1GCcWEsS4rtwWz3F8v
	UlVwZVnj5pZSPbW5zVw/pDqKbmM6p+ZlLhOBVZpnmW6UBo3fRhodQfVyysgWTEqzfzfDhgGLyaq
	EamRFD0Er6LX56KoEfCg==
X-Google-Smtp-Source: AGHT+IGtyWtAvTOJOVxYadEsrW33Dxqc6eLTfDV2pJbLyKbrWRarcGcJwVDombrHf2Z2lmCthCjpSg==
X-Received: by 2002:a17:906:f5a5:b0:ae0:e065:ddfb with SMTP id a640c23a62f3a-afe07a08b0fmr239082466b.18.1755779455589;
        Thu, 21 Aug 2025 05:30:55 -0700 (PDT)
Message-ID: <267bd33a-70d4-417f-b26f-32de863f1d2d@suse.com>
Date: Thu, 21 Aug 2025 14:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5ecb3da69ba1581971197388c6b9062b46900cff.1755775255.git.mykyta_poturai@epam.com>
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
In-Reply-To: <5ecb3da69ba1581971197388c6b9062b46900cff.1755775255.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 13:23, Mykyta Poturai wrote:
> With PCI disabled the build fails due to undefined struct
> pci_host_bridge.
> 
> Add ifdef guard to pci-host-rcar4.h to not require the stuct being
> defined when PCI support is disabled. All call sites are already covered
> by HAS_PCI check, so no dummy implementations are needed.
> 
> Also move includes under the header guard to not break MISRA rules.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Along with the Reported-by I thought a Fixes: tag would go without saying.
Can likely be added while committing.

Jan

