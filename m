Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7051CB4ACB4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 13:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116394.1462725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvwpn-0000Rc-JP; Tue, 09 Sep 2025 11:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116394.1462725; Tue, 09 Sep 2025 11:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvwpn-0000QB-G2; Tue, 09 Sep 2025 11:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1116394;
 Tue, 09 Sep 2025 11:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvwpl-0000Q5-Va
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 11:48:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3de6404-8d72-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 13:48:23 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0449b1b56eso804779166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 04:48:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04670b5eacsm1507551766b.27.2025.09.09.04.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 04:48:22 -0700 (PDT)
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
X-Inumbo-ID: e3de6404-8d72-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757418503; x=1758023303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=si+TFBWW2d+pAwZZw/WH0jcWpZgvOA1F2Gn4rX/yois=;
        b=fb3QSs4Qyn+v/+nUkfTUWYCBS5Zm4eJxNt72UUJvg5HVDKRLYlXhqwslVXrvElGxmU
         EvcmZUIxrMOOw8gefo6txjUvbJIUJ3EQIvoirankmfuzN+ho4pjYwKDKqS5Vr4pS9vgL
         MX/cf6UTRd9a6gKPIh7hxfX5XRdl/CpynwSsDaQC0KwT2OzoTYlnwpi8ua5mM9wo1uO3
         f8vlW8emrYUfFi16DC+e+/OQ4Jbp9Q3+X6wPms11rs6Nm2k7cOAIBhM8NxMuDhNRQkND
         QD/AeLfWetRMsKitT4qk/n9yKxO/1miU8rbNMoPR1FL4NuMqxNd0JL0YuYaEclreqqAJ
         Q8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757418503; x=1758023303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si+TFBWW2d+pAwZZw/WH0jcWpZgvOA1F2Gn4rX/yois=;
        b=wUTxXgHP2YrFBwuP0UD7eHGyRkB24X+uSbpKAx7Y+8waeITMBvIxsAX2Wn8WUuCgLG
         KNb9EgkjV3bX1v8w9RTsamsjrvpVg/SXOVWUEzN4bg8ereiGn4eRClXFOCn1SQ5RqGZu
         jS3+ffTeGapNQFDqUgPmnUP2t7YTert76NRqxzy+Hi2neCCuKxqL261jrCZiYAJWkwNE
         UYwTji4H3pxb0VzWZTw39f8f6uptn9Lze46W0iC3gndwd0f22YMuEWaOSm5R9yEhoXcP
         63GqTjW6EZEMkOJPEnVhTwf5EnALq5aVW0nkurChfewYNgTMah2PKyq+lIe/YovgY2mm
         YBfg==
X-Forwarded-Encrypted: i=1; AJvYcCXuvI+7/ALg+nUBzfBoQ1ER8xo8BEd+D/5MFAPyE9a1f/UoCTUVI/d4mBMu/NQDvysZ/+EFDyMCygo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAVIMpLStDubnC+X9XF0weQimtdsu7C6bx/xcXnxxA3AHH5CAD
	H+HBsHnhcTgF8tc/vy+nxH/gggu23rf2PQ5JfK68n7i1i5VcYchfA/rKgslRuO+LYA==
X-Gm-Gg: ASbGncsOkOFkxN7rulfCAd15BtjvWoMmb1+PV/0hH17mIJDG5pDsmvoJ0qbSUSyi4PJ
	XcN69G72eV2caFs1HVKWkJXlDI/B8fszLk96ty2/AKscCbLRVDJLhOt5XfzGwfTSv9BnYETaNvl
	qaVRgbEJqqSr9RCZ9iRseGwQ5qcOR7ekhDbYg33cGYc5Eyg0PHH4x1cPlUmjLlJWPAAyRBtwLKE
	ExynOXkEw8nVhylrcuoErUit94tQL7PpoW+7T6eAqh9kodKYrjBsOp00c816Z4jkwQpELuC/0u+
	6888NB0S31Qnuf2kOxeedMs+IiAyEOVpVtqpC6hCqwUX0OftiySwRLm0Njyz/mktKdlIjooQvtC
	Oij++7EDZ1WqztMsjpsYueD/B7cXEPEtxPsfm14exd0vuXnmYUMbypZbqwpsRx7HS5xqc/KrXOi
	RYLINjL+mWFHScgpZoXw==
X-Google-Smtp-Source: AGHT+IHmJ1UoN/YX+YLdWXEnVsMkWdEhlwjct2tncvIE/nnp9Sn84gGnRJldA4LkjqecQuIfysVp6Q==
X-Received: by 2002:a17:907:7f89:b0:b04:725c:bcb with SMTP id a640c23a62f3a-b04b14b7851mr1087810366b.23.1757418503141;
        Tue, 09 Sep 2025 04:48:23 -0700 (PDT)
Message-ID: <370220d9-5ed7-429d-ab9c-2b947911de75@suse.com>
Date: Tue, 9 Sep 2025 13:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com>
 <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
 <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com>
 <21f2f6e1-cbf7-4b36-bbba-bffc2dab3422@suse.com>
 <CAGeoDV-U74A2ooAsZ5N00_rm8Xo=GNnGA6zBuvF=naQ45jhtyw@mail.gmail.com>
 <646f7070-83c7-45ce-a4c9-c59cd39a33c5@suse.com>
 <CAGeoDV_79CUDzG-=36c+NkWwbBH+pcKaw1QTdozuHMsnMORPiQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_79CUDzG-=36c+NkWwbBH+pcKaw1QTdozuHMsnMORPiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2025 11:55, Mykola Kvach wrote:
> On Tue, Sep 9, 2025 at 12:14 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.09.2025 10:14, Mykola Kvach wrote:
>>> On Tue, Sep 9, 2025 at 9:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> Furthermore with continuing to (ab)use domain_shutdown() also for the
>>>> suspend case (Dom0 isn't really shut down when suspending, aiui), you
>>>> retain the widening of the issue with the bogus setting of
>>>> d->is_shutting_down (and hence the need for later clearing the flag
>>>> again) that I mentioned elsewhere. (Yes, I remain of the opinion that
>>>> you don't need to sort that as a prereq to your work, yet at the same
>>>> time I think the goal should be to at least not make a bad situation
>>>> worse.)
>>>
>>> From the perspective of ARM logic inside Xen, we perform the exact same
>>> shutdown steps as for other domains, except that in the end we need to
>>> call Xen suspend.
>>
>> Which, as said, feels wrong. Domains to be revived after resume aren't
>> really shut down, so imo they should never have ->is_shutting_down set.
> 
> I believe this is out of scope for this series;

Yes, but see at the bottom.

> actually, the same applies to shutdown_code.

Not quite sure there.

>>> The is_shutting_down flag is easily reset on Xen resume via a
>>> domain_resume call, so I don’t see any problems with that.
>>
>> You did read my earlier mail though, regarding concerns towards the clearing
>> of that flag once it was set? (You must have, since iirc you even asked [1]
>> whether you're expected to address those issues up front.)
> 
> As far as I understand, this issue is relevant to x86, and I believe
> it is out of scope for this series.

Yes and ...

> See my previous message here:
> https://lists.xen.org/archives/html/xen-devel/2025-08/msg02127.html
> 
> I will prepare a separate patch series to address it.

... thanks. My request to not extend the badness remains though, as to the
series here.

Jan

