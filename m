Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B59989F7A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 12:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807185.1218466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDj6-00017d-2C; Mon, 30 Sep 2024 10:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807185.1218466; Mon, 30 Sep 2024 10:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDj5-00014S-VO; Mon, 30 Sep 2024 10:33:59 +0000
Received: by outflank-mailman (input) for mailman id 807185;
 Mon, 30 Sep 2024 10:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svDj4-00014M-Qc
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 10:33:58 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8017f1d2-7f17-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 12:33:58 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5399041167cso1569638e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 03:33:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775d0bsm524010566b.11.2024.09.30.03.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 03:33:57 -0700 (PDT)
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
X-Inumbo-ID: 8017f1d2-7f17-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727692437; x=1728297237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ACzeTsXMTdtJ/ZcVB++zuQ5WGjHbP1J69HgrGTajiro=;
        b=E1OWTQNbUib0DuTwRTE8jquH11e8vIwV5fKbxc5ItQ4Gdb38IZ3UWRetTCY6JtaiZY
         oHyamCvyw/zk2Nld7wYvhlc+kw0njwws1VGRrhbNCN3TOxGJRffpEb7o3xyRtnymiysQ
         kC6R5o0okdUD28bYD0LS4BUzt+SfFeuwFIijisZpFHJD2yv7CrLVz0C9lAOppiG1sd0S
         uIvYDmdD615QwJvKclCNMC5uHEYVmznyYyiedlEotydVVRON+h7F2i4CsDCOHErErOc+
         9hvRvbGkR3sPesAQuAx1Qcz6LjPyVsxklIQ3BBJBysAznImvAIpsIpi8hwvDgjHc5cQ6
         f6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692437; x=1728297237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACzeTsXMTdtJ/ZcVB++zuQ5WGjHbP1J69HgrGTajiro=;
        b=ALUV7t7XzqA9tSf6AAX4VKit8G9p/xYh6JjMe1+SUyXIdV3PiabeCuga27O8GU9y3W
         vAJbK0jLXt2/iW+ll1VALOSpmbnBSJFOVzeaF9xowIVGjfslKwJzklnuEfjW0l2GxbGi
         h+wrw+X/w8bAo2Gb8RAb+X3swaRu/SwnTLni087/uXINnqUNhsYto9sJ4/vFYhLsQKGZ
         NoPrK6i0vOB73JjSIhYUuMJBnaMqmrNCZ2+OwvCgFi2yXXXrU/i8pcwzN0x1MGiTFSEP
         qnCSHe3EEw/vGV0ee3T/BtBT+483wy4N6CeXsCovxC1EvXeBrCtkOiz6EiZrKtgzsycZ
         lnTw==
X-Forwarded-Encrypted: i=1; AJvYcCV/FN3EyQuy95g3iLu99Yo9Ur+Hh1zH2pdzxkFBWoVghJTyd9hN5xgntwTF/y4oqRuFkm+p1Ii3UEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv0bRctMkVqUzb9IkZ2GlXmbrfN+v0BVPshgHcCcaWqF37P47c
	KjWnCTLM+HesOGrQMN8TQfzutB8Epckb/NYzgH+AohAscfHAQSiXludDBtSClfFzCxWgdxIDhkw
	=
X-Google-Smtp-Source: AGHT+IEqDnRtO5SxzFH5KrfAINIZ6Xvnlk/QGPO4yf4LQOQKWpWiRpgXvdvTTa9DNi/GtkPVFdDVag==
X-Received: by 2002:a05:6512:114e:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-5389fc3bf19mr7771090e87.16.1727692437534;
        Mon, 30 Sep 2024 03:33:57 -0700 (PDT)
Message-ID: <df77ceb2-b0fc-41f9-91f9-f61c3073f28a@suse.com>
Date: Mon, 30 Sep 2024 12:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd-vi: make IOMMU list ro after init
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240930102849.18309-1-roger.pau@citrix.com>
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
In-Reply-To: <20240930102849.18309-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.09.2024 12:28, Roger Pau Monne wrote:
> The only functions to modify the list, amd_iommu_detect_one_acpi() and
> amd_iommu_init_cleanup(), are already init.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Surely the same can be said for VT-d's acpi_*_units? And likely other
globals there and here?

Jan

