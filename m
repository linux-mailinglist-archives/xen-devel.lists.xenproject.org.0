Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D55B0D9B6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052587.1421314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCCH-0003oE-TU; Tue, 22 Jul 2025 12:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052587.1421314; Tue, 22 Jul 2025 12:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCCH-0003ml-QO; Tue, 22 Jul 2025 12:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1052587;
 Tue, 22 Jul 2025 12:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueCCG-0003mf-Cn
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:34:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dbd8ebb-66f8-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:34:15 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b611665b96so3060201f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:34:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a93sm75374185ad.102.2025.07.22.05.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:34:14 -0700 (PDT)
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
X-Inumbo-ID: 2dbd8ebb-66f8-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753187655; x=1753792455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UvVQcx2H7Pcvj2Rcx3WbUhig+IfT1QWyVbFVpiiv3EA=;
        b=EVds0FEBbN9SP1LUJyZQ6R9bjRl6rkQQwGCfzrNEJ6BQZJhRhjoccNFg5Nry1M0dcB
         FXKcGcmtXhgin0dhVS/hk/SElszWke8t5sdp3rVLmF3XhjGXJmJK7IPv3NQk/XQcFejy
         JfBG8E20NbbCMscPvTr2SxCzmfY5CvvaU/AJ+m/gNv5tvQV/t31X4s2Dnkx/5SyBV+DQ
         6Mr7EW2IgT/i6dfHRj8yMSdUkM8I8qK+szFDIq7UIJb8V4QDxhvMx47BY3OWjA2s+8z9
         cXvVSTQ3673lhMSbvPNQf5vPeI1PcgF7AoFCAV5fMzu20vMLijPxGAYeeK/ZLSme/D4c
         fCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187655; x=1753792455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvVQcx2H7Pcvj2Rcx3WbUhig+IfT1QWyVbFVpiiv3EA=;
        b=fviyugs2ZnObhppibsrykL4ew3+MkMUZ773bR0cjk97zi6PHuOADbUB5XXqdk21SgU
         or2o6KpUsc3DBuHIZAUU/IudkpOpJmCnXct8cSDQz6PknDXf1Rhm/SlAogTZUOVEMxC9
         Bnelkwgtu0ccZExldLHfMeYBmQLJnQ+K1qc6+gAXgnFrCf1C5pUP2C9DTkwibmNJlwBq
         s+GWg8n0b1Td2TvRMwQxBu5njfpC+m/8YDml35719O3H0LZSyFuTAD9aJ1xT5ZyoC2XG
         SBPeIHkmn0omoa6+ZJSx+kFwIzo7RitJ5vLVYc6MlsneHSDoMy+Lf4T9LKUGMtxigW/V
         iRQA==
X-Forwarded-Encrypted: i=1; AJvYcCWIcixGZzkQm5XPJ8CcKZBJaTz/2pkG16DPCqd/Nd3MBc3KSEwFFrOlqPqnuF9/emzDtEVPuAV8mdg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMuCkJjbOsQP1j8jYeXWypS/7ZAX4no/DwCtpAL3hC0c2CEYaw
	NzJyaQBxVMx12yU9T5BspTB3Z5GbibwHmGCZKHEbesU8Eg1IAX+VW1Ts0aVWIErxoA==
X-Gm-Gg: ASbGncuH0qerglSqMLfXzKpY+5j/e7XbwcLZR9vt0ThvQw3KjPb0LsUi3v88xiyDrvg
	0IkwLBo5WQaDhnpjQEFmFbAm2dGd0rdGwO6Fkr1J0U3Z+EnnFFkiGXXIqkyE19a2FEtX2pANnMh
	ExTih2/K15Z22UZ2PBz4oF0j+TOwWW5WjeT5x/mZ7cdRHU9o9CRucKSxSvGpwFo3/+fJjz47k4N
	L9Mx5rXbsBx/vkGW7KNqazSB+lj5WBkTP9lBzbuzBs4I7263GjSkkdxoRF+jnP9WZmSzURVUFSt
	jh1HJjIt1lfkMtS70RE67vyruYQs4JIrRKqExJCRx+9zMtbmj3V6+qejNSZeRaGg+FKHiIfoA7p
	Ieo4sGh3mxednGSweM5wjr8djUtpbGEjSCLZQn2mr/QBtoR4bZU8/G+p/lQyylxtEHtDr3aKqnO
	HYc8TMyjY=
X-Google-Smtp-Source: AGHT+IEeN2hXpyhm47vOQqZ4L9qBBZFdYeZmlUjtFFLPbi4G+ORtUwnv8H9CaGNNL4jaW4avbpX82A==
X-Received: by 2002:a05:6000:2484:b0:3a5:276b:1ec0 with SMTP id ffacd0b85a97d-3b60e51cebamr17346043f8f.45.1753187654773;
        Tue, 22 Jul 2025 05:34:14 -0700 (PDT)
Message-ID: <3ff863d9-764c-4478-9bb9-b783ff850185@suse.com>
Date: Tue, 22 Jul 2025 14:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 06/10] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <aa4bf9a069721ace3b9da7409923455eed2f6896.1753184487.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <aa4bf9a069721ace3b9da7409923455eed2f6896.1753184487.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 13:41, Oleksii Moisieiev wrote:
> @@ -859,7 +860,25 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_test_assign_device:
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
> +        int ret1;
> +        
>          ret = iommu_do_domctl(op, d, u_domctl);
> +        if ( ret < 0 && ret != -ENXIO )
> +            return ret;

If this is where you want the ENXIO for that the previous patch switched to,
then I see no reason for that earlier change at all. Inside the hypervisor
you can simply figure out what the right thing to do is; you could avoid
calling iommu_do_domctl() altogether and call ...

> +        /*
> +         * Add chained handling of assigned DT devices to support
> +         * access-controller functionality through SCI framework, so
> +         * DT device assign request can be passed to FW for processing and
> +         * enabling VM access to requested device.
> +         * The access-controller DT device processing is chained after IOMMU
> +         * processing and expected to be executed for any DT device
> +         * regardless if DT device is protected by IOMMU or not (or IOMMU
> +         * is disabled).
> +         */
> +        ret1 = sci_do_domctl(op, d, u_domctl);

... this one right away, for example. (Which of course doesn't eliminate the
question towards the overloading done here, which iirc was raised before.)

Jan

