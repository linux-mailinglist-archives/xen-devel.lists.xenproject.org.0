Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D2B42653
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 18:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108736.1458799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utq6H-0000mT-BX; Wed, 03 Sep 2025 16:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108736.1458799; Wed, 03 Sep 2025 16:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utq6H-0000kW-8t; Wed, 03 Sep 2025 16:12:45 +0000
Received: by outflank-mailman (input) for mailman id 1108736;
 Wed, 03 Sep 2025 16:12:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utq6F-0000ey-Le
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:12:43 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12eae53-88e0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 18:12:41 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso19006a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 09:12:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046f2dda22sm134420466b.40.2025.09.03.09.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 09:12:40 -0700 (PDT)
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
X-Inumbo-ID: d12eae53-88e0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756915961; x=1757520761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUf9Bi1fhQo7vi2u6LKUPiphXi834CMqGISW0FVoQo0=;
        b=dskfjaZ4Urm2fjKqwyPnmNUg+qDDXeGHoZFZXMZu5e+CZbmlEF0VCp1g8fMDpYt8gL
         XV4urUD/8aO+AvE1xRW3GPQEQCqlxDOvqevvrifJk2Lb+CQ37zDbn2tgJFsuz2gbQWxB
         qp8bdfuLO3o9vjC9uKwlR6/MAfpoTuYUgh2+OIdfPrdDrSj7ZDuBiPTExgPc0ANntcoP
         8GeLCblQ8cCdBxTBaCb1LOiME2w/zDOp7D7wOEZ+C8IJVHNuDMXT4BgSF9HcdSrlQ4We
         ccvBJq49A5iEVujmS/gpreQvZAtcl39XsKnH89UygbSP3TBu5EB+QMMjybIBvDfENQpE
         eKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915961; x=1757520761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUf9Bi1fhQo7vi2u6LKUPiphXi834CMqGISW0FVoQo0=;
        b=fLNres6kLQkaeY2UyPY7+n/GbI+sZKtXNLXHyesF/5fV1GozCe2Qp1RZuuB+OMQHYS
         fkMxym5/COShxAC3kO8N+Cp0YhBsGnRn6O5n7vKdZ7kW2VrKf64iewKWQuC98G72jPaV
         vPq0yz0TQlnjmuFIGc6bw9LZ+J5CnqXx9uiQFmZiAWfIq9AQxiuiWE9PybfNutpjlgLy
         U0d+uvVUfAukp5qcIBmOY4XtQ44UHjUhQ+Zs1HBWzt0If2abQdXbFwRMAiQaAjIR60Lk
         K8ZrhUI7KGaRmYG+SQzhgti1G1I69OlFv/VcHHzLsEw6M1fR+Z9Wtj78nLcjCV8LJ6o2
         OBdA==
X-Forwarded-Encrypted: i=1; AJvYcCUdx+wXV8KAxDgPugbybpNPR+PgA9iwIYn8gHlTDaqQeE8jPhH81TClJ1e3Ek9Pqn+pyNdcPAU7KSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6+Z+YtB8Ykh3wYgXoK7PJEX+lTmmLz7kEg6e0rQTdcGkWpLR4
	ZNB+kjvHWxX4qSrN83Q7gSxY+0CHTr/2JggF3SGbcNOJC5a4+73wUkYP9RqAElRrqQ==
X-Gm-Gg: ASbGncutXo5rm1CvYa16RWSGgyVrjP3xYsQ6nj0aJiBxhDCBtD9rx6h+GQUStz7HwMK
	GV2+7VPi+4LRt7dWDhFXDebiVMNswWL0KrX3GF05L0TJ2B+0BVyFgOijkpSrqQDNG2ktP5azuqs
	xcwf5xUfPhOSSEXbidzS7x+mx2fBnfAVrceqGd2nRzv1MTIflbXxDtfDNvp51PkKUGsY2uAqlY7
	JFiFklaIxtN8od97XJWGewp9QmqXJO3pbUSWBv+/RUeN0zurwpXpgvqiAD+GZYgt0aKgGmf1QYE
	krUdZbqqChIdCUgWbQ7DVVvan9zWOYwyZ6t3qaZ/hCbpNjdIXCVQzbipbG5qr9PTUbQPS8m1tXL
	Fb6xbuAbiLjxSP3U9jpM2nyHQcpHFkFU7pbPmilpA8RweiR5Hm8wp3a+PA0VPgDMTQpvfdpT6sB
	EuI12JlvxSeQCpEr0GaA==
X-Google-Smtp-Source: AGHT+IGvs8DYxc7WiMoCGafuAjEIsWW1mTSYnu8O6CEKhKgeSQkG2VRc1k94PTcbw0s7SC0TgvkW2A==
X-Received: by 2002:a17:907:a0c8:b0:b04:3513:5138 with SMTP id a640c23a62f3a-b0435137355mr1042257066b.41.1756915960751;
        Wed, 03 Sep 2025 09:12:40 -0700 (PDT)
Message-ID: <6f310470-60f3-4c8e-a1fd-1216fd44e4ea@suse.com>
Date: Wed, 3 Sep 2025 18:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: avoid absolute paths in executables
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1071997f-efe6-4088-b753-b74d3a045a09@suse.com>
 <795b069f-12ea-4d05-bdc4-877a6a93fe7c@citrix.com>
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
In-Reply-To: <795b069f-12ea-4d05-bdc4-877a6a93fe7c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 17:26, Andrew Cooper wrote:
> On 03/09/2025 4:13 pm, Jan Beulich wrote:
>> For in-tree builds relative paths are used, whereas for out-of-tree builds
>> in various situations absolute ones come into play. The extra paths can be
>> long, wasting space and e.g. serial line bandwidth. They would also get in
>> the way of location-independent reproducible builds. Leverage newer gcc's
>> (and Clang's) ability to "remap" file names. For older gcc fall back to
>> using the option affecting debug info only.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course we may want to consider putting this in the top-level Config.mk,
>> to also affect other sub-trees (presently mainly/only affecting debug
>> info, for which even gcc5 already supports -fdebug-prefix-remap=).
>>
>> As to a Fixes: tag, I wasn't quite sure whether to "blame" the
>> introduction of out-of-tree builds.
>>
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -448,6 +448,8 @@ LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin
>>  endif
>>  
>>  ifdef building_out_of_srctree
>> +    CFLAGS += $(call cc-option,$(CC),-ffile-prefix-map=$(srctree)/=, \
>> +                                     -fdebug-prefix-map=$(srctree)/=)
>>      CFLAGS += -I$(objtree)/include
>>      CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
>>  endif
> 
> We do want to be taking a change like this, but it's also definitely not
> limited to out-of-tree builds.  I have full paths embedded even for
> in-tree builds.

In xen-syms I see only two full paths - in debug info, supplying the base
path to the tree. That's okay to stay imo.

In xen.efi I see a few hundred, but they're all the same as above. As I
learned earlier today, SHF_MERGE processing isn't invoked when linking
ELF objects into a PE binary.

> To be useful, it wants to apply to everything, not just the hypervisor,
> so does want to be in the top level Config.mk.

As per my first remark then. But no, I meanwhile realized that this can't
go in Config.mk: For the hypervisor we want to use $(srctree), i.e.
including the leaf /xen referencing the xen/ subtree. I expect that for
e.g. tools/libs/ we'd want something similar - eliminate the entire path
up to the base of the component's source dir. So it will need to be
piecemeal.

> https://reproducible-builds.org/docs/build-path/ has a full list of
> compiler versions. It looks like we need to use both options here until
> we can increase the minimum GCC version to 8.

Not quite, -ffile-prefix-map= is documented to imply all other
-f*-prefix-map=, matching my observations.

Bottom line - at least for now I think the patch wants to remain as is,
and further patches for other parts of the tree will need making.

Jan

