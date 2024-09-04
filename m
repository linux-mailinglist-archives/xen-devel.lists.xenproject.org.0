Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C996B6B1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789954.1199629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmM6-0004Ft-IT; Wed, 04 Sep 2024 09:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789954.1199629; Wed, 04 Sep 2024 09:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmM6-0004DP-D6; Wed, 04 Sep 2024 09:31:14 +0000
Received: by outflank-mailman (input) for mailman id 789954;
 Wed, 04 Sep 2024 09:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slmM5-0004DH-6U
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:31:13 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ba13f4e-6aa0-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 11:31:10 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so4153244a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:31:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900ec17sm789547266b.62.2024.09.04.02.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:31:09 -0700 (PDT)
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
X-Inumbo-ID: 6ba13f4e-6aa0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725442270; x=1726047070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=diKYgr+RDcGsyap7PPhmeN/Kt+3zjogcuawNkl36+KQ=;
        b=XPSlYn+Jnfx9AT2KSJ3E4PTIw1qi3524gKw7aBw4EZ4O1g0E7QfW2AW5xxHSxCy7yk
         KJ9AqxiTNUix+RQNlwHkRCFCvsAPf3eE1dmEDJ46FswHKuMRcOCgpZ0znVnDHjyu+T10
         jOjeIb64AoI2/I23rJj9YGMlupWoNMWx0Es8Nt+Jesyfdj7rJFoRte2agHTbsbap/tCM
         TlDr662O5lxGjRQiELM2Ej/wj4pREhCfyOs0Jjtz31+8uqJssPSzgcFjMRJucOuWaIXX
         HjPPqIO07exRYh2K6xiEcvwvsnmFXXC4CZPkoCO0eMj6KNgSfMrZWu4WBeKtjKy/bXAL
         u4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725442270; x=1726047070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diKYgr+RDcGsyap7PPhmeN/Kt+3zjogcuawNkl36+KQ=;
        b=KzKy2tk3AMn6CmnbhdQflrK5VlyksRYzvEnngj378xGzcNI+z2jn2PKFPwB6W8G/nQ
         7jRx9GAydDxmVN5aDhxxK1nVsRVQW1POwQZ3lrV9DRRjN8jXB2flpjRU/dBvmzsjCeWi
         HHp/jXDypEmrIscDM8RVRDx/WLosT68g2T9Laz4hL0KR0dKuVKXV/yRBv3SihMNtSIw3
         bu11m4gMghFCn3Fo/JbC0xTnpMWuii3MI8RZtndowzCruDjPYZNhWwitNXPLL71gPGnk
         lk2oc8dOBCKgm/gXOn3lO/0zBUEqgU1HXEXWGQIDE/L/HVbqb5TEMeEt5o0vX3a0iI32
         XB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2tQZ5GRoSg6D+0cFC5MncW+YfDJRVlpQe3laEsiRRAxut7/bGwL5DuqKxyPl60ta2Ic0zrnVs/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTjge7epqY+HHR1vaOM6+NycxJluRZ/iRZr6VWikB+4uVnm+pr
	mcloylzJ/wBxIZtj5Tp09kDArF7tDcWsD9COKdD5EU3fXbUkmFowQJ1l2DPRfA==
X-Google-Smtp-Source: AGHT+IEwUIMtkaLo+M2X614w6ZNqnH6c1w9EZPK8yanjhWNSMWkCulpdGWVweqOS5SQMiv6e1iXGrg==
X-Received: by 2002:a17:907:d93:b0:a7a:952b:95b1 with SMTP id a640c23a62f3a-a8a32e76460mr250672566b.24.1725442269825;
        Wed, 04 Sep 2024 02:31:09 -0700 (PDT)
Message-ID: <ce9fea63-c618-4825-b30c-dfd3e1818a9c@suse.com>
Date: Wed, 4 Sep 2024 11:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
 <ZtgYnAeXSamlGKgC@macbook.local>
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
In-Reply-To: <ZtgYnAeXSamlGKgC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 10:21, Roger Pau Monné wrote:
> On Tue, Sep 03, 2024 at 04:36:37PM +0200, Jan Beulich wrote:
>> On 03.09.2024 16:19, Roger Pau Monne wrote:
>>> Current blkif implementations (both backends and frontends) have all slight
>>> differences about how they handle the 'sector-size' xenstore node, and how
>>> other fields are derived from this value or hardcoded to be expressed in units
>>> of 512 bytes.
>>>
>>> To give some context, this is an excerpt of how different implementations use
>>> the value in 'sector-size' as the base unit for to other fields rather than
>>> just to set the logical sector size of the block device:
>>>
>>>                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> Linux blk{front,back}   │         512         │          512           │           512
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> QEMU blkback            │     sector-size     │      sector-size       │       sector-size
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> Windows blkfront        │     sector-size     │      sector-size       │       sector-size
>>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
>>> MiniOS                  │     sector-size     │          512           │           512
>>>
>>> An attempt was made by 67e1c050e36b in order to change the base units of the
>>> request fields and the xenstore 'sectors' node.  That however only lead to more
>>> confusion, as the specification now clearly diverged from the reference
>>> implementation in Linux.  Such change was only implemented for QEMU Qdisk
>>> and Windows PV blkfront.
>>>
>>> Partially revert to the state before 67e1c050e36b:
>>>
>>>  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
>>>    the node, backends should not make decisions based on its presence.
>>>
>>>  * Clarify that 'sectors' xenstore node and the requests fields are always in
>>>    512-byte units, like it was previous to 67e1c050e36b.
>>>
>>> All base units for the fields used in the protocol are 512-byte based, the
>>> xenbus 'sector-size' field is only used to signal the logic block size.  When
>>> 'sector-size' is greater than 512, blkfront implementations must make sure that
>>> the offsets and sizes (even when expressed in 512-byte units) are aligned to
>>> the logical block size specified in 'sector-size', otherwise the backend will
>>> fail to process the requests.
>>>
>>> This will require changes to some of the frontends and backends in order to
>>> properly support 'sector-size' nodes greater than 512.
>>>
>>> Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Following the earlier discussion, I was kind of hoping that there would be
>> at least an outline of some plan here as to (efficiently) dealing with 4k-
>> sector disks.
> 
> What do you mean with efficiently?
> 
> 4K disks will set 'sector-size' to 4096, so the segments setup by the
> frontends in the requests will all be 4K aligned (both address and
> size).

Will they, despite granularity then being 512b?

Perhaps I misunderstood the proposal then, and you're retaining the
ability to have "sector-size" != 512, just that any I/O done is not
supposed to consider that setting. I guess I mis-read the 2nd to last
paragraph of the description; I'm sorry. "even when expressed in 512-
byte units" reads to me as if other units are permissible. Maybe it
was really meant to be "despite being expressed in 512-byte units"?

Jan

