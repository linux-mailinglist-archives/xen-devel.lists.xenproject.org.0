Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8FE90B2AE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742393.1149201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDbd-0007uu-7Z; Mon, 17 Jun 2024 14:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742393.1149201; Mon, 17 Jun 2024 14:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDbd-0007s4-4v; Mon, 17 Jun 2024 14:45:13 +0000
Received: by outflank-mailman (input) for mailman id 742393;
 Mon, 17 Jun 2024 14:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJDbb-0007ry-Mv
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:45:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3258e1fe-2cb8-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:45:10 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso5012252a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:45:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cddba1a17sm2242771a12.43.2024.06.17.07.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:45:05 -0700 (PDT)
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
X-Inumbo-ID: 3258e1fe-2cb8-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718635510; x=1719240310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+2Mxxt+USuoP3e0fzSGmT0itw6+be4kBqbL/ExF9EM=;
        b=PxvKgy2D5XFI3MgGLGdi5mb14GFJdXeksCQ8c1v0mFSwjIHDkLqHUrTiBVOuCjslTY
         iCuziWBAtOTLbA9cZe5WnOx9MYXywpkxItTt56tKFjnmNz4iI5O7fBe2dMjiDSSVIoKv
         v7omOvHP9XJIedHsnaojc2tbMwSCibwFQoXcw+GoNSBRNRv4L8nRWDhuWkNEO6v2ogLZ
         JlBaizUPNkiX7QPuBA42IG8XBtztTMDK45ke3iTFmocW2HXdgtnWdqSHtL8KFJnJ47sL
         iarZVmMKQ9ve+8ShmRHOSMa6HVMHBu8EBt+PHD48IMDH5LIaBSHDB+3+UvxoU9N5KM1g
         ivow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635510; x=1719240310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+2Mxxt+USuoP3e0fzSGmT0itw6+be4kBqbL/ExF9EM=;
        b=A5Kg1p6KZt2vfm6wrLAEg09iwbhNllAVTd1H4WcDv4oYKrmHP6MoaUJxeNokvMZM4l
         qGJasgZjQ5xooYDwYGkReNuZ2+1s9BfOIEoem1vUC5XCdsVsT9ftBOtd8jhMSNMxh1dX
         hMj7wOLp+7m2iF+lX6HkZAzNzO3e8bg3veUYETRybUbdD3BiyX+zA0UWKgY1je5t9Jrw
         mJ67P9wzoK7ZxSp1er2V5/0z9ETazYZVS8Hh7rGzie9wXVVWyEB+ZIUGj/+Ryxrha7FN
         QZ06mlFGe6qnSktJqmTDLesnLXY3QqFa4xj8aoXgQsPxGYWBioPcmdNm3ikD//K4MGhE
         p0mg==
X-Forwarded-Encrypted: i=1; AJvYcCV4T5+ehNWwnbK0+uamDNgtp2Ng5DjfsZRMzKdTvnpi/X/EJxM9x7RFQg2TqE87fNYpjGimsl3NdhtoT7kB2eo7eGnGol0pQFAq94fiGeQ=
X-Gm-Message-State: AOJu0YxkazKlU9DWBIwUVzkwmdFkiYlOsX5EOBivam+9hXoT31sAvuzj
	oJH2Oky6V5mNMLqf3sWu5Uub1KEv5q6CQRj/hsU/GwAJhxsDc4uaIi5Xnvqq1g==
X-Google-Smtp-Source: AGHT+IHa4kr1TAl8Ve1dyaQtTALk+ruPgSzgrbBHfwymQyL5eUP+XT9odskuo6BKFD3ebIbEoVp4Mw==
X-Received: by 2002:a50:cdc2:0:b0:578:649e:e63e with SMTP id 4fb4d7f45d1cf-57cbd66c9bdmr5918321a12.16.1718635506047;
        Mon, 17 Jun 2024 07:45:06 -0700 (PDT)
Message-ID: <cb9910cd-7045-4c0d-a7cf-2bcf36e30cb2@suse.com>
Date: Mon, 17 Jun 2024 16:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240617090035.839640-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 11:00, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> 
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> PHYSDEVOP_unmap_pirq for the failed path to unmap pirq.

Why "failed path"? Isn't unmapping also part of normal device removal
from a guest?

> And
> add a new check to prevent self map when subject domain has no
> PIRQ flag.

You still talk of only self mapping, and the code also still does only
that. As pointed out before: Why would you allow mapping into a PVH
DomU? IOW what purpose do the "d == currd" checks have?

> So that domU with PIRQ flag can success to map pirq for
> passthrough devices even dom0 has no PIRQ flag.

There's still a description problem here. Much like the first sentence,
this last one also says that the guest would itself map the pIRQ. In
which case there would still not be any reason to expose the sub-
functions to Dom0.

Jan

