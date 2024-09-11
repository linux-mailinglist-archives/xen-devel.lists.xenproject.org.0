Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5C975011
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796409.1205970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKux-00036F-VW; Wed, 11 Sep 2024 10:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796409.1205970; Wed, 11 Sep 2024 10:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKux-00033f-Sh; Wed, 11 Sep 2024 10:49:47 +0000
Received: by outflank-mailman (input) for mailman id 796409;
 Wed, 11 Sep 2024 10:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soKux-00033Z-9V
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:49:47 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ea7f9a0-702b-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 12:49:45 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so143087866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 03:49:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5dc74sm597458266b.208.2024.09.11.03.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 03:49:44 -0700 (PDT)
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
X-Inumbo-ID: 8ea7f9a0-702b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726051784; x=1726656584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XJRIiUlJ8ommq1PHN9jr7QCA5+Hpjzh9HVDPtbIjbv4=;
        b=Y+5fxadzZ+EOIzB0DnOiFBVZsvj8lDXiCzkoCGC9LsGTp2xt/xYqMxU9Te7VFr3GUN
         tzqKqCoPK+vxtUWpx24g1YkPLtnfFEo8AZJv6M67qes4sxzjF4yngqaW0C1Ws7bhRywu
         0zo4xakOgkZfBWMwoaSP1p27+w72LbXo+4Qw9Bws5xnmyEnBWX6F5A9QsVYzV091u683
         Wre7JNjm/moXZ2ifYXQDrTbzrGLoOJb/Kb1etImGfTKJgUPo/YQcxC22Bwp2Gs0Mt3Kt
         Ti/RKGkNet4iuHEv5TTQEGOcD/LLgszp8/IdzEMGJaDbFitmXui75syBYJjHsch8ZJ/6
         fvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051784; x=1726656584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJRIiUlJ8ommq1PHN9jr7QCA5+Hpjzh9HVDPtbIjbv4=;
        b=r4nfD9SX+dqLQ8S69bEcqjLLogIqeOWRGqbadTS/O7vVIOH5PvpmZlbYhGoabhNJzB
         Bh4tTRnkhfkbLv+08TLN2T6/nQqWSsZj3a3zZOUktmQhx7Y3H5F+I+6SFgXriGR7xOsU
         eoR4f9QnzOmDbiPdkRvOz4DDylymuLZUzPcKmBlfzPl0o9qMdjcCvCNqTKP9blwTayg6
         0JO1AZGZkQln7xOpq49RzDdoSr3JvCmUafa+YCoHO1RvJ7J+uQrUwmYqRdpfbocvHh3i
         eE6oIuPjqLlTGQ9vzMjj1edACkxO9/SDowrmrw/mcNKcWqvcCm5Vo1OBFwKSBmvWU4nD
         JfrA==
X-Forwarded-Encrypted: i=1; AJvYcCWp7RP3P0F/wsSLM6W/d3ipXV+HkS0Xk8XtR9s4tqtEiX8Er4Tt5EwkFkAO9jh4a9ueNPQO8+iwbUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxcjd/RDVNaGlsQOSDh6bZTYMZyBnIyumQVfwUAcPFDxbsZtsiT
	rQRrG666/dmr0EigE4tvZECJM7KWfbGmMuLaQYSzha5mM/2WVdFmp6h5GFMQSQ==
X-Google-Smtp-Source: AGHT+IEkvupdJRmw6tee0Teg9pIjoP5P301zMol3pyLQlRc3cc8YuZwxrfxxvqmns27GQm1EN/xiPg==
X-Received: by 2002:a17:907:268e:b0:a80:7193:bd93 with SMTP id a640c23a62f3a-a8ffab29894mr455746566b.25.1726051784463;
        Wed, 11 Sep 2024 03:49:44 -0700 (PDT)
Message-ID: <9537bdef-26f7-4a86-8bb8-52c7e409f742@suse.com>
Date: Wed, 11 Sep 2024 12:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v15 3/4] tools: Add new function to get gsi from
 dev
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Huang Rui <ray.huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240911065832.1591273-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 08:58, Jiqian Chen wrote:
> On PVH dom0, when passthrough a device to domU, QEMU and xl tools
> want to use gsi number to do pirq mapping, see QEMU code
> xen_pt_realize->xc_physdev_map_pirq, and xl code
> pci_add_dm_done->xc_physdev_map_pirq, but in current codes, the gsi
> number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
> wrong, because irq is not equal with gsi, they are in different
> spaces, so pirq mapping fails.
> 
> And in current codes, there is no method to get gsi for userspace.
> For above purpose, add new function to get gsi, and the
> corresponding ioctl is implemented on linux kernel side.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
> RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
> https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/

I'm afraid I don't understand this remark: The change here (and similarly
patch 4) ought to be independent of when the kernel change goes in. After
all the libraries need to work on older Linux as well. Please clarify.

Jan

