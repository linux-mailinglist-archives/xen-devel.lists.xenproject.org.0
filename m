Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B295665D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779443.1189179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyMw-00025f-MN; Mon, 19 Aug 2024 09:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779443.1189179; Mon, 19 Aug 2024 09:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyMw-00023J-Ja; Mon, 19 Aug 2024 09:08:06 +0000
Received: by outflank-mailman (input) for mailman id 779443;
 Mon, 19 Aug 2024 09:08:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfyMv-00023D-85
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:08:05 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a01bc0a-5e0a-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 11:08:03 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a83869373b6so398298966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 02:08:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383969e05sm608666966b.191.2024.08.19.02.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:08:02 -0700 (PDT)
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
X-Inumbo-ID: 8a01bc0a-5e0a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724058482; x=1724663282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dufbDC2txZUeklQxKtc0XhQk4l09UB+er7K2xQuzkAY=;
        b=JSHhNrseZEfPFzOdpRjIPKItNGFj5p2ypHXZt2e15lp9VduqxXhD2Qu7PflTd042Dw
         9HMDfEGD2qePr1uqH6V7wubRnnZDf/y6bnydi1kSkBbBPRkdlM77vR4DmDpczN4328+z
         x6rojQ59F6PmqgrBkEpQuyLA0DBfZV233RU4/fZP5bc2eZIDx4z2E8GL8AK/ytIjbtDq
         DyngLHOpdpec228edWw7UvbT70UKkONjMPv74DNzRIshUmjCfTzVBXFErgzawFEAQG9n
         ksei255AEt9SoJuDv9H1e7W1Mdw8ggND5WbGwggFHy8vKY2W5FwNHndsggHobAGYmOci
         KjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058482; x=1724663282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dufbDC2txZUeklQxKtc0XhQk4l09UB+er7K2xQuzkAY=;
        b=HmktVLYm/ecdU0OyhdvjIz/Nspd63t67NTmNrRtsySn6/uEb+lhrhlP7MW9ORKqVhz
         eY3JCECO5bQCIS4xmZunjZXEwywsANb6scewOlM0olc2b01OQvslJP/KX6zqk66i/M7Y
         gXFoCA4hT4GiH+qHv7cppB1fJYgwJ1sObXBvy29PUXOQ7sbeJVtuycopDiKeA0VuWmjC
         8ZQ99wnE+gt4ha2yxkiKhesfk1R3M/8CxcN+iFIg8/mVbir4eY7IoeCvGlshXMwJGspN
         V5upFBc88heGEEpxk2D6wh77sUDyaMWgJhWaW+kDfXETOPR5p5c7qHKfKjHxhIknVOUn
         BqGg==
X-Forwarded-Encrypted: i=1; AJvYcCXGSx9tRQe4whLq/5yOJu4Avp+99EY+9V/u0TydDVJgdfKQB21nqeJzrJPY0XV0Db6CzVXGgm2F2kYTZkYCXT7XUfj8jqxNWdkpnm53DVw=
X-Gm-Message-State: AOJu0Yz0wVnHWFGsJLeZsEn32pupx0kZ35Vxhp7Hwz2JzapFQ2GeABc3
	n95gPH8EKImiPThChx7SnA5nnhRksGPZTCBqhnBYJ+GzykYHrlk1zvQjAqK3Xg==
X-Google-Smtp-Source: AGHT+IGKOkpK4ItdHsM8t0AOLbPyAiaFZHl/S3n3iAHr2UBNNydiaRIY4KOEVtEs0P/cnHaCz3MRHA==
X-Received: by 2002:a17:907:e29e:b0:a7d:c696:76ee with SMTP id a640c23a62f3a-a839292f15bmr773210566b.17.1724058482394;
        Mon, 19 Aug 2024 02:08:02 -0700 (PDT)
Message-ID: <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
Date: Mon, 19 Aug 2024 11:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240816110820.75672-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:08, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> 
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> iPHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
> So that the interrupt of a passthrough device can be successfully
> mapped to pirq for domU with a notion of PIRQ when dom0 is PVH.
> 
> To exposing the functionality to wider than (presently) necessary
> audience(like PVH domU), so it doesn't add any futher restrictions.

The code change is fine, but I'm struggling with this sentence. I can't
really derive what you're trying to say.

> And there already are some senarios for domains without
> X86_EMU_USE_PIRQ to use these functions.

Are there? If so, pointing out an example may help.

Jan

