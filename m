Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB73492A53F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 16:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755477.1163848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQpow-0000oQ-Jh; Mon, 08 Jul 2024 14:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755477.1163848; Mon, 08 Jul 2024 14:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQpow-0000ms-Ga; Mon, 08 Jul 2024 14:58:26 +0000
Received: by outflank-mailman (input) for mailman id 755477;
 Mon, 08 Jul 2024 14:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQpov-0000mh-Gs
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 14:58:25 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8677e9e8-3d3a-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 16:58:24 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eea7e2b0e6so14500991fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 07:58:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b2adc5f46sm2989759b3a.151.2024.07.08.07.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 07:58:23 -0700 (PDT)
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
X-Inumbo-ID: 8677e9e8-3d3a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720450704; x=1721055504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgum466QHJ7ydqdO5ETUPd+3a6X1tyChMoxuZMXY6Ts=;
        b=dc3qcfgeCwkOexaASe7IfbrkjVnyHw3wq1iWvMKdm2Yp0hEmzzEDuy36ZABnVj9npQ
         wH0a+n1fb2BGedyKsRyanc26PM79ylp1cglN0tifDxbd2tCYqfiiKE+yRyrzXP1nfBo3
         MuqhazbWmJWY1h+KajPMeuLkTsO3J0P8LMMssHdSk7+5ayvoNLk6so/OceZEbv7By1Ja
         nCeZd2PrcKvWaPaIDD7u9+O8uNf++w6gaMkfVrL6q48NRvK817g6v4AM4xxU/sVUXSD+
         Dic03totjb7xJ0XvoDPRb2RKL8K4vnQLguAxOG5cTtmq2ahwVx3kbiV+zLslWbBSOH2A
         lQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720450704; x=1721055504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgum466QHJ7ydqdO5ETUPd+3a6X1tyChMoxuZMXY6Ts=;
        b=LBHc5sQ2adszZCSWZXIew7vBMbo+O+2K4jQZ0et2qAJcHOVxDs/Lq/AiytODYFCMPW
         VVoWc4G2p5ZQoUO+mVMCZGKpwUdnkROMJDwP0ZBOZQxXU232i3Dhwu4q5nbsLWZXqsQh
         SSuuyKK8IJz65FvZl3H7KmAUEVShjeu1RB5YSrEEyegWTZiAt0G/VA+rajUsqWlP6UYX
         Z+TiMPKlPttmDrbLC7MnVINak/RXb/u+v+X0T0okGeqQdKn26LnwwAHWeBFLVu7NyBCg
         aZeOWw63F+Yo7oMRsIH/iHUFIEkBGMuYgZ2AAAwDQXZ+rdrLpBkUNi2oChyA6sTe4ptS
         /hEg==
X-Forwarded-Encrypted: i=1; AJvYcCVLNNRkcPx75jJxKLpSmzWkJ+31JJqjUfsByJGzZQSbQ9UeTwzS7QGjvvqIRWFjPRmKkoo/ly16GwkDCZk8/BkJdGa96n6lwMdYQZx+14s=
X-Gm-Message-State: AOJu0Yy27RG/KAN8BbQ7XyV4Y4WCFnZg1isqgNrveqUemz6Z8JzD8/Ud
	f5jABNRNm+bUgSsczyh8KqB51ScEnQVxHakyUvRJAW/8xF+1MGxko2LAUanxtw==
X-Google-Smtp-Source: AGHT+IFtXjYzrV4w5yK72z7EUjTC1/uqV+2fHj4ZVVqHEJL5Q6aXqc+Qm2oAOcRt1rr/CdG8WmQYHg==
X-Received: by 2002:a05:651c:d1:b0:2ec:89b8:3d2f with SMTP id 38308e7fff4ca-2ee8ed45b27mr84632751fa.19.1720450704159;
        Mon, 08 Jul 2024 07:58:24 -0700 (PDT)
Message-ID: <9a384994-5e0a-40c1-80e3-59910bd634d1@suse.com>
Date: Mon, 8 Jul 2024 16:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240708114124.407797-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 13:41, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> 
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
> And add a new check to prevent (un)map when the subject domain
> doesn't have a notion of PIRQ.
> 
> So that the interrupt of a passthrough device can be
> successfully mapped to pirq for domU with a notion of PIRQ
> when dom0 is PVH
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



