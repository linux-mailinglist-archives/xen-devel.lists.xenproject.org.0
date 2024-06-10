Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8E5902648
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 18:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737444.1143763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhYU-0004Xk-JZ; Mon, 10 Jun 2024 16:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737444.1143763; Mon, 10 Jun 2024 16:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhYU-0004VM-G3; Mon, 10 Jun 2024 16:07:34 +0000
Received: by outflank-mailman (input) for mailman id 737444;
 Mon, 10 Jun 2024 16:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGhYS-0004Tz-Bb
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 16:07:32 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a284a27-2743-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 18:07:31 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57c75464e77so42285a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 09:07:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1ec85a74sm156717866b.56.2024.06.10.09.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 09:07:29 -0700 (PDT)
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
X-Inumbo-ID: 8a284a27-2743-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718035650; x=1718640450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F8T0Yn8TRGJABK7UP2QjtOX0FaifK/kYwMk5L2z4/6I=;
        b=QAMbSRn0qi7HwjBYPp1B9oaSsfmEofbjNvbnCBDuNDCe4m2N/WUJokB7goqd69iArt
         U3jezbDgSBxZHVIxFKRnYXzJ/IoEIRx8oWmEtyywDOh6OSX293Vq9iuhi7WDyv956INg
         D2k9O2rpRXnD82SwoBOPCIujeTbrBzUV5IZpUVyqgeNtHkydbHKmi9QayQ6bp7rEYMqL
         GnfL1rldX5jheU/3Lnu5jDJa+34xKkRb55qDuKKIeprQbAGgvf0EwFdyprLiwa+/UYKE
         lYwy3zxIsWYUZ1Xzz3iWODbt2afvEmDavkDnbPqLe+oJTs5mNNV/Kh98u+aK00lA5w/C
         KB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035650; x=1718640450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8T0Yn8TRGJABK7UP2QjtOX0FaifK/kYwMk5L2z4/6I=;
        b=Bxh8UUU8z6QdTsOMIDmbaX3FkmvDR8ZYmTq/hXDi5ut7N54xKmKLSSb7dFljg3UOJf
         IhC6FNoAyrrjVPnnW3M34lzlCS+mrd27EqW9gqgDWByqwhMBEZGUJDeaRim6qFK8l1vR
         D2gveoT03tYIVfQowmlkWOMnzC4/88xb8W9oo268T8pe+c2qI1v7Z4PnQxwqY3tsK96V
         dvXGQvEUTKJgeRAXBHFgAsknWKDB1ZltUVQwWWMzLda01N+S7k5B1gHwoDDtTUnOLnPc
         a/OYSRrbKZmPWbQ/IASGEZVe9G88BPLyslEWYrspQoaVv2MBtVMTpMkiw0caofTtSYkS
         eMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBwtuYsFizQ8gCSFs2dIGSvyy/wmsNCaYUBbcNevSuKT7qjp8lBpxP/ZOpen8+29P/9gw3VIxqekGtXJSx59Mq7TxhQbwkhU0hU7q3rw8=
X-Gm-Message-State: AOJu0YwMjyJt6aY1/8eS1vyc+8Al2X/z0ROZHmbMUTxe/YIagllHLMg1
	qBuL/vfWMQnb6IePgWwaCIs0NGaf+x3O+uSadrotPnnRGXOJ5rIy4AF9/HonZw==
X-Google-Smtp-Source: AGHT+IEcGRf6/truxW/iq0L3+nvgrRFLsOCTE7thYlhYsI3422gYl8NGdy3OZO3qcwj4+13lUD5umQ==
X-Received: by 2002:a17:906:36cf:b0:a6f:24ae:f061 with SMTP id a640c23a62f3a-a6f24aef087mr154932566b.59.1718035649998;
        Mon, 10 Jun 2024 09:07:29 -0700 (PDT)
Message-ID: <e2202691-5ca2-42ad-a360-31761f73d889@suse.com>
Date: Mon, 10 Jun 2024 18:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v9 0/5] Support device passthrough when dom0 is PVH on
 Xen
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240607081127.126593-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 10:11, Jiqian Chen wrote:
> Hi All,
> This is v9 series to support passthrough when dom0 is PVH
> v8->v9 changes:
> * patch#1: Move pcidevs_unlock below write_lock, and remove "ASSERT(pcidevs_locked());" from vpci_reset_device_state;
>            Add pci_device_state_reset_type to distinguish the reset types.
> * patch#2: Add a comment above PHYSDEVOP_map_pirq to describe why need this hypercall.
>            Change "!is_pv_domain(d)" to "is_hvm_domain(d)", and "map.domid == DOMID_SELF" to "d == current->domian".
> * patch#3: Remove the check of PHYSDEVOP_setup_gsi, since there is same checke in below.

Having looked at patch 3, what check(s) is (are) being talked about here?
It feels as if to understand this revision log entry, one would still need
to go back to the earlier version. Yet the purpose of these is that one
(preferably) wouldn't need to do so.

Jan

