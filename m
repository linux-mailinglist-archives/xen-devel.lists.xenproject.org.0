Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1249037F4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738203.1144875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxvc-000304-0T; Tue, 11 Jun 2024 09:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738203.1144875; Tue, 11 Jun 2024 09:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxvb-0002wu-TR; Tue, 11 Jun 2024 09:36:31 +0000
Received: by outflank-mailman (input) for mailman id 738203;
 Tue, 11 Jun 2024 09:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGxva-0002wZ-Tr
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:36:30 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15276604-27d6-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 11:36:30 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebe3fb5d4dso19071591fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:36:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ebeeedb430sm5640841fa.7.2024.06.11.02.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 02:36:29 -0700 (PDT)
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
X-Inumbo-ID: 15276604-27d6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718098590; x=1718703390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fWUldjVAa8Hkj/pKWiQmgY0XPWD+ktn/SGr6EoSJ0Tw=;
        b=O2jqoSnedHIge8bnHyY3AXQUP5SCf44Jwxv45zlzp05jw+lrCLBSo3AJclqmFJ4zLl
         g8v0k82bGv88MkgyoVWzP7wzr11lPWV3egR1TnkVavCXHwX09AzW0O23uHMBCoO8TS/N
         ScQGoX1XIy2zKKYn95WZ/ILDgx9/W4ea1uNkZTTdGGFtfxA1a/ZS8zJdCft9MV9ZYJX6
         Tib1d4VwDMR4lST1MOh00CuMKQPCpyyXcDMdymLx3NaOMnPVhZyH4MxPqeiOlhln1RLA
         xqUxpnoBWAZlfBtk0IbAj+u1+VP17vdnf1LKJJoGTSsIlupoAGUxT5He9ODOVaUNMHsV
         X8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098590; x=1718703390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWUldjVAa8Hkj/pKWiQmgY0XPWD+ktn/SGr6EoSJ0Tw=;
        b=C4OKqGLYjjE4iiHi3t+V+P7/2//z86xb99ofsZHo9oVawyF85iKfa+4XLZEtooS5bL
         aSOGg0ZEoJ3SH8VU8aiuvJBCtdMDy09BfrqczgITZtpUAeQeS6W91zzWwe8TN+u4v1tS
         n1vPKW2qGOkHvq+HkH06bFw6hzSfLN0BtNmKLZnrtGmaR1i+0mpm+pdxnTphK+PHLk7P
         YJ8Z8x3UPBdztC9PG5/KYfR4C3KJvh2rXgKFgKRsSqZwLub1xbzgcadwqZvuyjunQvu1
         OmWb5prGRaDNWGVjZ11hbpdyJJKbLGdcp+pVmlt6o/79DIv/dPTU0Qeq5ea54gBwYzBe
         XmWg==
X-Forwarded-Encrypted: i=1; AJvYcCWbxoXces1UI0VhzVPs3vXRwYTOXqGQfueEhDGRu9mapDjko4btYp9KD8/kINE7+eqyMGNJBOKi5kN8J9pafLdKtAR3JOitFh5gXNBQ5H8=
X-Gm-Message-State: AOJu0Yw68lHvILtPpYeE76Kyq7zhvsU9CJ2FcUpU0QkNe4rhAueX35sg
	5XfWYMeiqHblIkTeVOomhjjnEBdYYVUDKb61IFIv0V3TGMX1osaXLENpnqEAgA==
X-Google-Smtp-Source: AGHT+IG5UrTbCiVxuZiYvN+SWySPYtARVrjgzCCkQ3Cf9TiFEsc0npD5O1DTuXMd4B8Eq9Qw/XGWvg==
X-Received: by 2002:a05:651c:b0d:b0:2eb:f626:ba6e with SMTP id 38308e7fff4ca-2ebf626bbd1mr3129321fa.21.1718098589818;
        Tue, 11 Jun 2024 02:36:29 -0700 (PDT)
Message-ID: <6cfeeca8-10dd-4d79-8436-fbe3cf342a54@suse.com>
Date: Tue, 11 Jun 2024 11:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v6 3/9] xen: Refactor altp2m options into a
 structured format
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1718038855.git.w1benny@gmail.com>
 <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
 <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com>
 <CAKBKdXiiZdz70nWx7kqp2S5RdbRsku+qtn6z9DBk44LZOgp3Qw@mail.gmail.com>
 <217202e9-608f-4788-b689-8140567e4485@suse.com>
 <CAKBKdXhzRZuaiZ+cDYD=ofShgRySbGyZjSZe=G9Rdd0T8wof3A@mail.gmail.com>
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
In-Reply-To: <CAKBKdXhzRZuaiZ+cDYD=ofShgRySbGyZjSZe=G9Rdd0T8wof3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 11:34, Petr Beneš wrote:
> On Tue, Jun 11, 2024 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.06.2024 10:00, Petr Beneš wrote:
>>> On Tue, Jun 11, 2024 at 8:41 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 10.06.2024 19:10, Petr Beneš wrote:
>>>>> From: Petr Beneš <w1benny@gmail.com>
>>>>>
>>>>> Encapsulate the altp2m options within a struct. This change is preparatory
>>>>> and sets the groundwork for introducing additional parameter in subsequent
>>>>> commit.
>>>>>
>>>>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
>>>>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
>>>>
>>>> Looks like you lost Christian's ack for ...
>>>>
>>>>> ---
>>>>>  tools/libs/light/libxl_create.c     | 6 +++---
>>>>>  tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
>>>>
>>>> ... the adjustment of this file?
>>>
>>> In the cover email, Christian only acked:
>>>
>>>> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
>>>> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
>>>> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---
>>
>> Right, but above I was talking about the last of these three files.
>>
>> Jan
> 
> Ouch. It didn't occur to me that Ack on cover email acks each of the
> files in every separate patch. My thinking was it acks only the
> patches where those three are together. Anyway, it makes sense. I'll
> resend v7.

Well, no need to just for this. Yet if a v7 turns out necessary, please
make sure you have the ack recorded.

Jan

