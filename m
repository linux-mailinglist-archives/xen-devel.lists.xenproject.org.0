Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AE9037A0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738184.1144845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxai-0000wZ-Rt; Tue, 11 Jun 2024 09:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738184.1144845; Tue, 11 Jun 2024 09:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxai-0000v4-Os; Tue, 11 Jun 2024 09:14:56 +0000
Received: by outflank-mailman (input) for mailman id 738184;
 Tue, 11 Jun 2024 09:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGxag-0000tm-SF
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:14:54 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f5088e2-27d3-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 11:14:52 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57c83100bd6so2439141a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:14:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae2321e0sm8968376a12.88.2024.06.11.02.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 02:14:51 -0700 (PDT)
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
X-Inumbo-ID: 0f5088e2-27d3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718097292; x=1718702092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VjiAdgWOVSKYgm8t/BP0TJ5qmzYPqyPBHxotHaIsFnA=;
        b=HpIlvaZ0ztba/U5RpxVeK80Oo5/rHmrpWyhDfIeAE/VKgDLqyUlh/IyAvWaWVqh3Q4
         tP/a5uWkusDwmr3Ssez/UZOwExeTFA06XNhRLNdXqDABK8ivS+PzxrAifj34EaAa5439
         gDWkStXSU/SlKpNN0ogzrVcmMZaGABo2unS/EHLnWCNE54VxwsAx91A5bwnixMzQubDK
         6iQuBCDDVpWwQJtQuGsE4X4E5tCmxEKqyp3rNgK2oV9amTuZyRhYPLn8zVU1YTJvUwaT
         hM5gG5dA5ovNcJPtZsg94PWPXxuIGTRHL1VAGETRgtjt8CJ+V/M+UZcKVhgbNNyO3XyW
         8vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097292; x=1718702092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjiAdgWOVSKYgm8t/BP0TJ5qmzYPqyPBHxotHaIsFnA=;
        b=Uo1sxqI27GkkuaZWvtOumXvy+2XLVuzH1SOeKqY7qHCgWd8T2lDsRg4nM97hdU9UQ0
         CJmvvNWmGZfC8QN5i3qTHeJ28PwyP1Q3TNN9feAlBkl2YPOPnBal1J0WN2X1NrQE4iSI
         lsqhkTTE1ZPuN0Dh3ZdBQ7Fa02xC3NcBIiqFnqho5FNdtm8F4lgUe1RxKOjKqZaaDmBW
         8Zm0WHbk/710+aE1v/E8k1wW9SpRggPgmKpE+tBOiCygo+wpna0+B/Vq+nht4LGeSCE/
         an/W0nJE4LLX4GgsQ7vAeSOJ4ReQnQ4G3HZdXFM30ZbtsOQUE/1nbAUxu+5sTtrolwmR
         0yMg==
X-Forwarded-Encrypted: i=1; AJvYcCV4k/L+q4dnNQXklIqCh802pp7QVYmPSUNH3GbEzKtKAWMkJ9JLL0qHWn5jBCof1pvuxoAE+55FfFmmCLH3VN8ZqaulhYJf6qyK+Q4dcOg=
X-Gm-Message-State: AOJu0YxBXXDyoRuNsTq4zkCLiBVMPBP8hk4Td0nizFUwBMJpAY3ZV/4d
	XJCz1H5LZGTSYdgV2il7NWbXrXkYbu6A1HIwUiezHYt7EPCgNHZh0s0RC70DVA==
X-Google-Smtp-Source: AGHT+IHXYDohSIaX+xR7RjJ6ieqlKeJbUF7DVXX6SHgEGlZAKvCndfJQGWMeiN5z+eLNr2rrv6jb4Q==
X-Received: by 2002:a50:d796:0:b0:57c:6ed2:870c with SMTP id 4fb4d7f45d1cf-57c6ed28bb1mr4686608a12.2.1718097291976;
        Tue, 11 Jun 2024 02:14:51 -0700 (PDT)
Message-ID: <217202e9-608f-4788-b689-8140567e4485@suse.com>
Date: Tue, 11 Jun 2024 11:14:50 +0200
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
In-Reply-To: <CAKBKdXiiZdz70nWx7kqp2S5RdbRsku+qtn6z9DBk44LZOgp3Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 10:00, Petr Beneš wrote:
> On Tue, Jun 11, 2024 at 8:41 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.06.2024 19:10, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> Encapsulate the altp2m options within a struct. This change is preparatory
>>> and sets the groundwork for introducing additional parameter in subsequent
>>> commit.
>>>
>>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
>>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
>>
>> Looks like you lost Christian's ack for ...
>>
>>> ---
>>>  tools/libs/light/libxl_create.c     | 6 +++---
>>>  tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
>>
>> ... the adjustment of this file?
> 
> In the cover email, Christian only acked:
> 
>> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
>> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
>> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---

Right, but above I was talking about the last of these three files.

Jan

