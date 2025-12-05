Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51CCA79BD
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178957.1502617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVDY-0000gV-Gl; Fri, 05 Dec 2025 12:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178957.1502617; Fri, 05 Dec 2025 12:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVDY-0000dn-DY; Fri, 05 Dec 2025 12:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1178957;
 Fri, 05 Dec 2025 12:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRVDW-0000dh-Ci
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:47:22 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a002826-d1d8-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:47:20 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-429ce7e79f8so1364981f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 04:47:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331aeasm8468537f8f.37.2025.12.05.04.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 04:47:19 -0800 (PST)
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
X-Inumbo-ID: 8a002826-d1d8-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764938840; x=1765543640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hdJ4TLbnb/qqWqVEKQ6FdlJ3YFJ+xSGg9eF5zyF6zmE=;
        b=VjNpg72XdqaIExzD8EDI0kE1v0P2NoNgb1i2FXmnwd9pxIdwtKI5nVLQI3zNu3G9Xc
         MhFIVL1Ij6bzsxo6qhEkfrLsXDsyUC5E/vMYQhjwYk2WAp2Xnc277GFJ2SiJvM5zhKHd
         4EWk7VzVuF52DTT/uc+ozYkY9yj5x5vetNZw6j3bOebj04XE92aYRH5zpJklhLSZmOrz
         j3DrRWGqCYnzGYaIzNaBMTm/ATu6RQcjeec5fgxKMOTnftGN/WyDuV5Xo22D6mjv3ZpA
         rpVkx0K+w7gPBUIYpcH17z4AlE1aIGdYiDkvxxYi2sJ3ptt06gTZgdkVI+bagS5TKOK5
         0KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764938840; x=1765543640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdJ4TLbnb/qqWqVEKQ6FdlJ3YFJ+xSGg9eF5zyF6zmE=;
        b=TVcu4BRo+1AL5U9tUyZdxPcwrX1+WhlElWIBMrM0sc3ZQDkZKv2BZOywxs1EaEEXF2
         MPHdKZPpApctGPr8/qd30XX29sc7uW80vArqpCjr/v03pVSVeDX5bsDTxToUy8W8UCgi
         A9rpx40DCctSH875jnp6qH9qoiIbOHvTBwsFSUeBCB55Dmg/rDhTODJ2JXp13Bdu5tk4
         hcVZY5mSH7e6g33gfADvI+LmCRMBwTZ+H/R/nW/xbcticdIE7/GF4Yo8AkFl1O2pA79U
         Ein9KBoCAP84ju83jcZ1oCrxVIwj5+RL0PUfFUoue1z1EgUge7lyh2o86gI//UAvTkOR
         Fmpg==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZEMkwlF3ZtBAG5dXtomBbS3Zq6jmTR/LpcRsq27fzbOgkbKQdly5qNb7UK8irQI/PstUSl6IVX8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCMOnyQKhdHhKgukVsXjciimbqXMxKcwrnXmSm6GdWY44h18NY
	5luWbnjSlxnEh7AtvLckMtam3B6lvrExw4wp+wPKwwwsvzmGYjl6CVb9nhKugZQUFQ==
X-Gm-Gg: ASbGncuU8fH6ALYU5wF80/ir7pdjzIX/QzTQOLznM5MM7u9XmIodIHVcrmXGkC+WmdG
	lqk8Wa2qlzKMXarNxL8KMyT0gUI9JYuYcVA5vtlkr5w47nevsiVTzMLPRMhg8jMpOgT30rO2GvD
	tN0qPe50b6ZzBxJsZjOyaETD47w52kNYIxW0aKjEFfpOHfN+CAIrrIH806BGGe5keyTpHK4wKbI
	vFfjvzawiaYUoMP624ssIcSaFoxpfnfIu6RgfSRWC8uYVBFsMqfQMXKvFuOz/faBEP/wnzt4wZq
	3rJHceqmPgV/feErMQQgT7sXrL0TDsjEuCusqXjn0atJWoEFsm7gSIL1vZiSRibbAPNpKZRYivr
	igkvo2w98N4sCs9/cdJRXilO7dEHGPxsOuztVnMUV/Bjp8BvhEIksxdzoythmwANEwTx1BErf4R
	1/2fGxAKEBJu6/+sJmxPBh6Yajvo81pHfyAlNnd823tk2c34uQ/ePCeO2khP1xSpRIegxVHarJ7
	U8=
X-Google-Smtp-Source: AGHT+IE9N1tpme/tHnO1Lian/+cwIebfBjf6pqzaDOljLBViaKM3z4rj6YEtTXFtIumLEavUxGuw+w==
X-Received: by 2002:a05:6000:310f:b0:42b:32f5:ad18 with SMTP id ffacd0b85a97d-42f7951496amr6857186f8f.9.1764938840103;
        Fri, 05 Dec 2025 04:47:20 -0800 (PST)
Message-ID: <0c481383-1ac8-4a31-8685-def51cdc9005@suse.com>
Date: Fri, 5 Dec 2025 13:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/10] x86emul: support AVX512-BMM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <732d56d9-d200-410e-8b52-48c5e25bcf5c@suse.com>
 <50ff35c6-5da2-4c6f-94b2-025440ee618f@citrix.com>
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
In-Reply-To: <50ff35c6-5da2-4c6f-94b2-025440ee618f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2025 13:33, Andrew Cooper wrote:
> On 24/11/2025 3:02 pm, Jan Beulich wrote:
>> EVEX.W meaning is unusual for VBMAC{,X}OR16x16x16, but that needs taking
>> care of only in the test harness.
>>
>> Like already proposed in "x86emul: support AVX10.1", use just
>> vcpu_must_have(), not host_and_vcpu_must_have().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The Disp8Shift settings are guesswork; the binutils submission bogusly(?)
>> suggests no scaling at all.

I realize I should have dropped this remark: It was applicable only to
early versions of that change.

>> No idea how to test this without having access to capable hardware. AMD,
>> to my knowledge, offers no equivalent to Intel's SDE.
> 
> I'm not aware of anything equivalent for AMD.
> 
> IIRC, the binutils thread says Zen6 for these instructions?  I'm still
> trying to get access myself.  No ETA yet.

Yes, that's what they add for Zen6. I committed that patch just earlier
today.

> Very tentatively Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks. I'll put this into the patch as-is; it's unclear to me though
whether I could legitimately commit the patch with this. (It really
doesn't depend on earlier patches in the series, after all.)

> Given that .W is wonky for these instructions, I wouldn't quite so
> easily rule out other wonkyness.

It's AMD's way of giving .W dual purpose; really triple now.

> Would the test harness pick that up?  Not AFAICT.

Not without adding something to it, which I think makes sense only when
one can test it. (Which is where Intel's SDE helps quite a bit.)

Jan

