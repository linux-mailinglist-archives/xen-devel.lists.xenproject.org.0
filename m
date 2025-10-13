Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FFBD2DC5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142284.1476477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HAY-0006OP-3F; Mon, 13 Oct 2025 11:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142284.1476477; Mon, 13 Oct 2025 11:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8HAX-0006Mx-VK; Mon, 13 Oct 2025 11:56:49 +0000
Received: by outflank-mailman (input) for mailman id 1142284;
 Mon, 13 Oct 2025 11:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8HAW-0006LR-Cw
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:56:48 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d16863-a82b-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 13:56:47 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso2650418f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 04:56:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e13b6sm17985726f8f.44.2025.10.13.04.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 04:56:46 -0700 (PDT)
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
X-Inumbo-ID: b1d16863-a82b-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760356606; x=1760961406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=73gfcekB4XaZaAAzorurBZ89TJY+IgjZkPa2xLpLONo=;
        b=bHgTocOWYaNVzefVxaP0qGvrQeEKYUNth3Z9sHM4j90T932bvFGP2cJZ2Et/aZO30F
         AEIKKYpvgZv+DrT916kSJkeB33hQKiRP+Rvph46UQVQPcLqF6WWri9nw8cjQC6U2OSlJ
         zmUsmGpq7Ja1eAfU/MKbdYKxapQ4fRn8DGo3x/IN7Wlb035kGTIVcVrZxUIbnwkNDKPd
         kAfSG0SHAAMPRIEpOvcqmFeicCuGK4fT683HbkFYXN2RbPZgdbELwg6O2LvG+/ttaEhH
         t3QmK5S0CVTKEJubxdHhZU6xZRXsyyzun6ZQ5ZjVXbRMnRKRC3arbL8aR2uleb0x8ErL
         9FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760356606; x=1760961406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73gfcekB4XaZaAAzorurBZ89TJY+IgjZkPa2xLpLONo=;
        b=S5VvP7J6Y5Wl1FQi3OLbAtfLehCI7oUslvk8RKIduhukCm5N4d145H60o7I0DJ+IO+
         uaNOxblkJkzxiRUG2ASEbpOpiHaG0JaDCSBiJiciyO+QTmc8soARyI5xD8bXZ/zEqaKa
         TNxrygqcgNLEy9B2Q4y95duONl4H+CvaIl7E2fCiMXkYvLA2K+32FV4VlgFVUn1eOYqa
         2WpdNpXXnU+Lk3UR9m9NuW+OlFJoUzliD9HbuDJnVQ6WMODllDm9Ade84JzDCMJJctiU
         D15AoNv74TIQX3XS/vPnFMHc4PnTWnbmn+wf/1WFWugve87W0G9tsbHBIlE9JOFcbJlA
         C8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9eiHphJ7X9cxwDCeL6H8dAtLbJCsQVXf71sbsPIep6UETiigp7HOSLt72ZtGyMA+3o3q+/xpBJ+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcW7RJnVdgu9BaDSyFo6nr1darvu0fMUS0qhuXFLgOQvVOKkih
	YZNNZHwnxlq+VJIN5ADpWvSGhAmXh/EI6HY4OkJ8JV+06VXiL65GS8uPSv/Q28+OEA==
X-Gm-Gg: ASbGncsf8quEkqxKeL/hstrqhXnOt29LchQdp1HZ7d54om0vsjbqpO0wxFIkUfZ6eN0
	DOQctAXkhC2ZLZTHBWJQT7rHmSkzBS6ClF7kiv1fPqbC3NaoYBVbSuUNetmHs+MxVvmOR9db5eL
	07NzZ7NaTbzkvPfxOi4qLffZ8pVZRi9nbezSBs8qnvppA7/u1xPdbhLQn4R2TZlfj/Rd9EBMr+S
	1PvGN5EoXK0dKxQN92bdhH+7eSsmy8dZclk2la89aZ8coKsNpYt14k4XkarM2YdGc8kaW70kzhD
	dDqSAsW22RioZPJ8Quu4tbkPkjXuGxINZezg0STApueYgIfIoEO+E+yyiEDZl8zew91FRteng28
	7Hkm5da0VpQXL5r3m0CaNM6v8ch7Z0vyYPnwVNJ9152hYXuK3nnAz+LigsJ3DIavEU/FPm9nVlz
	dVAj+IOzF5+CWUYdCyb9DKrBenXw==
X-Google-Smtp-Source: AGHT+IGq9Oqpppqu8zQSKBbzzeYgL4cXtulxv2d2cf/fxoVfxp549P9BBfOJnOdeZVCAu4mdUjh2qg==
X-Received: by 2002:a05:6000:2389:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-4266e7c7b2fmr16041479f8f.21.1760356606429;
        Mon, 13 Oct 2025 04:56:46 -0700 (PDT)
Message-ID: <b7924304-e7be-4876-96c3-495b2579d850@suse.com>
Date: Mon, 13 Oct 2025 13:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] xen/pci: disable pci_device_{add,remove} when
 hwdom uses vpci on arm
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <d86ae19db4a62d196b696e421683725d0c647b2c.1758618839.git.mykyta_poturai@epam.com>
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
In-Reply-To: <d86ae19db4a62d196b696e421683725d0c647b2c.1758618839.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 09:59, Mykyta Poturai wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> On ARM, if the hardware domain is using the emulated bus, it should not
> be allowed to add/remove pci devices, so return EOPNOTSUPP in that case.

And how exactly would PCI hotplug be made work then?

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -19,6 +19,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> +        if ( hwdom_uses_vpci() )
> +            return -EOPNOTSUPP;
> +
>          if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop() )
>              return -EOPNOTSUPP;
>  
> @@ -57,6 +60,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> +        if ( hwdom_uses_vpci() )
> +            return -EOPNOTSUPP;
> +
>          if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop() )
>              return -EOPNOTSUPP;
>  

Along the lines of my comment on patch 3, these uses are clearly _visually_
wrong for x86; they're correct from a functional perspective simply because
the predicate returns the (apparently) wrong value there right now.

Jan

