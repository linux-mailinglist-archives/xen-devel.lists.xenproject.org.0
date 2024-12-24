Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB39FBA94
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 09:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863028.1274524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ0SK-00030Q-La; Tue, 24 Dec 2024 08:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863028.1274524; Tue, 24 Dec 2024 08:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ0SK-0002y0-IF; Tue, 24 Dec 2024 08:39:56 +0000
Received: by outflank-mailman (input) for mailman id 863028;
 Tue, 24 Dec 2024 08:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tQ0SJ-0002xu-4v
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 08:39:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a54972ac-c1d2-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 09:39:53 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d437235769so2114729a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Dec 2024 00:39:53 -0800 (PST)
Received: from ?IPV6:2003:ca:b711:5c39:9cff:9fff:3d81:6f3c?
 (p200300cab7115c399cff9fff3d816f3c.dip0.t-ipconnect.de.
 [2003:ca:b711:5c39:9cff:9fff:3d81:6f3c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80679f19fsm5846593a12.45.2024.12.24.00.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2024 00:39:52 -0800 (PST)
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
X-Inumbo-ID: a54972ac-c1d2-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735029593; x=1735634393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K/NoVEctWS4l3fPRjtycCBEAjYeRehZDCpHqeWxScuI=;
        b=LbAx8BNlBls9Q651OQdhr6mIZYRkDzMSx+bjtR15lrHuhd75gfJpoU8cy1CftZwBgA
         z6WetU8bqUeLZaF4Lus9PiUn/PV4fEU1p9+DdhH4baAtFHu628E/omxxaWceiNSjj/SU
         s5SQgpQa+rlOtG/beqomQJQqYjnX8fAx7mvCMkOyDSBhxToU6+NYv9NKfSgDrUkbf2ml
         jo8CV8gH1GLIPuLV9IWMssok6RvMiVSteX1YhOdmFH4nBzg+dwSWdkl09Hv27MZ8kmYw
         KWrTr4d/8HpJJ86Vzqino/nTXir9pywrVxR4oJkepT14ER43gJ2CPmosRWi2CeLxjONT
         HOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735029593; x=1735634393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/NoVEctWS4l3fPRjtycCBEAjYeRehZDCpHqeWxScuI=;
        b=p2pUPfChSkQ5kIdw3PE2aOwADUNgEe4KWcUR512jQjIh9esrEtmaDlFJKSwycB8Eqa
         Xy0jb1mZccsbiAs4AANmtG0ZHosZhw/XOteNyIH5BweavEdfuE4VYoOPXewH9/WDJAD5
         UEvfg/tCgQ7cq3XLxUWeSQmvBC3k0w60EfsCm31gS0MghAkpofMvUa0LyZNDCspPQwKk
         vkeLVSDKsWwjV8ESfnOrRKQDunap94L3FYJbpp80dHiHvtrj5WVV8Wo3X5sAe+oRQF/J
         xsLX2PpB2bxSTlVCMu2vR8fNUWb8Irnfv051g1EkVZVVj1NGqHL4O8danoOlwdybKYGd
         z5/w==
X-Forwarded-Encrypted: i=1; AJvYcCXqTFgrLVUf+bjXs/MzBpFm3zLpu7MYx7fKfhP1ficQKbaosa98MpPY9EkqRWf4Xinzxih6F7yPjNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydL/CJMjkDbcatQobrfI3U8cNpVhH9jOptyAtnxB2xP/eOTBu1
	qnkvhMt5JFSGOm6R4GaKPcKW6h2bmafUdWx+GnN3rNwpCtL4sWJg4Pk/RvHd2w==
X-Gm-Gg: ASbGncvmW5YIYPcGV8/7s/yNOQrb32rp9V0ZpVCufOdIN61sHW6xTNXCzEajSnk4Nmb
	kXY+84VAE3Ezo4vPCvxcfUmAk05mJ61Jk5VdDMjcnYTemnnDh/8kTNhOhrZkRWLItfU/L+alA7P
	NStWAVf4pJuK2sbiBo702u2Qyohkf0Dd0/J2CMUaBFkFK/Wims5actp8/3PVTGBx2hNaevdatHp
	IWkLcriTsvrjxHXuO+87aaveW+WY4+U6VznEYkbMpGktq0lWf2Ksz4g9ArCINz7oozlSyFa4hSq
	CMzTgc80i1j/m2DkFQqYlQKc/7YouJVmU1mdf7F84ErdQwPSMWZ2WH94+fMn4lxnjZpiiRDShpj
	ehwo1lI70QrjHDk4=
X-Google-Smtp-Source: AGHT+IGwrvrSruFMWNSjdfkDS/bSYVPSM+sf1sqvz6Uj+qiFnpD6jANyFiuK0ykrHmUr0EcbJvc+Kg==
X-Received: by 2002:a05:6402:270d:b0:5d2:73b0:81e8 with SMTP id 4fb4d7f45d1cf-5d81dd820admr12901857a12.9.1735029592803;
        Tue, 24 Dec 2024 00:39:52 -0800 (PST)
Message-ID: <69b4de29-9de7-4ee3-a44b-bf4961bb19c2@suse.com>
Date: Tue, 24 Dec 2024 09:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1734652343.git.w1benny@gmail.com>
 <f381634bd45c647d145a81c0076211ea044febc8.1734652343.git.w1benny@gmail.com>
 <258c4e83-4379-4212-b80a-4fe909849e66@suse.com>
 <CAKBKdXhru499ZcF50TroCn39kxHdPVBGtBQaECoryBMd29JGxg@mail.gmail.com>
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
In-Reply-To: <CAKBKdXhru499ZcF50TroCn39kxHdPVBGtBQaECoryBMd29JGxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2024 17:34, Petr Beneš wrote:
> On Fri, Dec 20, 2024 at 2:09 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> To avoid the flag becoming "sticky", I think you need to clear it ahead of
>> this switch() (or right at the start of the function).
> 
> When thinking about it now, wouldn't it make sense to only reset it in
> the p2m_ram_rw case above? I mean, where else would be guest
> page-tables located.

I'm afraid that unless you can prove otherwise, my general take on such is
"you never know".

Jan

