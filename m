Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC88B01FD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711142.1110878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWEh-0007Jg-Qp; Wed, 24 Apr 2024 06:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711142.1110878; Wed, 24 Apr 2024 06:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzWEh-0007I8-Md; Wed, 24 Apr 2024 06:36:07 +0000
Received: by outflank-mailman (input) for mailman id 711142;
 Wed, 24 Apr 2024 06:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzWEg-0007I2-1E
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:36:06 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc63cbe-0204-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:36:03 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34b1e35155aso3140769f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 23:36:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d1-20020adfef81000000b0034a7a95c8cfsm12425816wro.9.2024.04.23.23.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:36:02 -0700 (PDT)
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
X-Inumbo-ID: ebc63cbe-0204-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713940562; x=1714545362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wACAxOqtqPcpKWGT2BHwAnA5DUn6he8OM4hOsQBGBUg=;
        b=bttyh9cisL/em6dIfUIstlyJ0VH5U8NE566SmSv9nIvyvHlSyZv739zG2XjaUxLF3G
         /dM7q9cEB1C2JFnQvHkChs1qLjTrSU0lblTzYuIsq1WIU3EfFxndUvyfgLstmH+qNsl8
         J2jHwNGNf6o1EKoMfx+fDfVhUYmC6mcbNf6lOW7Ae0QLR5KnjLFpSviCKrPj6ng/irhH
         D1adL514l5cQ9lSHzvgJKYilkH11pMOu7B/lkPbWIMlBYoGFleAf4FEhoDfBeoWlsMfM
         UwjE5WYQLcSDyvdy5Tz3sALf0eFuX9DR16boe7kk9WBad182MAAlOmFhaK9wI4bm8MCG
         2/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713940562; x=1714545362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wACAxOqtqPcpKWGT2BHwAnA5DUn6he8OM4hOsQBGBUg=;
        b=C8F4S12rJLwU7zSypEMLtXjCx0FpqMBrNn3kXJh2zGzEjqNhGFrEqc4totHKeIJAeX
         Lk/pgMDH/kx6a+ysEt3EV680Vz1bh5wc3Ip3qYYrFKhVW8FLfjhiTh+JKkKDz5sEt2iP
         LEmmAtHnoA7oFY2s4neqg7fEc5dsZpl+AOe9zgC7viZfwnh235XkhshtdEfzqDSmSUfv
         89pu4SpSv91vn1BDdHxNm2M9qA63MuBcKbHMz5HAThU5RT511CWxNE4NDuYzYiac20Bt
         1xAD97YLrZuPiip7f4Om7A6T6K8n/BEsw8Bu5NUDhWMExAhpWSjkxUY+HkvLKAVl+Ao0
         W+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXGgPjF2L1953iijoMAUO9UNHHBJT4uPwGz1GiYrhIwrPIrrH0TNutMKJ5+tSRxl+RlOX38RK7H4i8jQpnNcJxnJPNX9pgMUBNl/5oCNRA=
X-Gm-Message-State: AOJu0Yz85efcQGVGoeaBUUUmN2nQsIgfmGidnRlh5u5gO1vpW+KTnlB3
	i6gOb+L/8Dbqn0zKEBlR5GPYpvQroGOAYLE/9olFxDzsmsNzerLM3Ea88AV3eA==
X-Google-Smtp-Source: AGHT+IGhTDug3DeYyl3ssvqpFdlwrArbhn3lLGKDsi1qgQ6keMjS4r+WdH0dmCgo5dxZorp3z2ohwg==
X-Received: by 2002:a5d:548b:0:b0:343:5cca:f7c7 with SMTP id h11-20020a5d548b000000b003435ccaf7c7mr1104894wrv.41.1713940562634;
        Tue, 23 Apr 2024 23:36:02 -0700 (PDT)
Message-ID: <92860d34-2b8b-4fe8-bf13-31c993620006@suse.com>
Date: Wed, 24 Apr 2024 08:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/P2M: write_p2m_entry() is HVM-only anyway
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <296c3ecc-b04d-4734-a451-0d4f9ed312d4@suse.com>
 <c38e488c-a3fb-4fcb-bd8c-b33c3fbfc2fa@citrix.com>
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
In-Reply-To: <c38e488c-a3fb-4fcb-bd8c-b33c3fbfc2fa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 21:29, Andrew Cooper wrote:
> On 23/04/2024 3:31 pm, Jan Beulich wrote:
>> The latest as of e2b2ff677958 ("x86/P2M: split out init/teardown
>> functions") the function is obviously unreachable for PV guests.
> 
> This doesn't parse.  Do you mean "Since e2b2ff677958 ..." ?

Well. I'm sure you at least get the point of "the lastest as of", even
if that may not be proper English. I specifically didn't use "since"
because the fact mentioned may have been true before (more or less
obviously). I'd therefore appreciate a wording suggestion which gets
this across.

>>  Hence
>> the paging_mode_enabled(d) check is pointless.
>>
>> Further host mode of a vCPU is always set, by virtue of
>> paging_vcpu_init() being part of vCPU creation. Hence the
>> paging_get_hostmode() check is pointless.
>>
>> With that the v local variable is unnecessary too. Drop the "if()"
>> conditional and its corresponding "else".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I have to confess that this if() has been puzzling me before.
> 
> Puzzling yes, but it can't blindly be dropped.

And I'm not doing so "blindly". Every part of what is being dropped is
being explained.

> This is the "did the toolstack initiate this update" check.  i.e. I
> think it's "bypass the normal side effects of making this update".

Why would we want to bypass side effects?

> I suspect it exists because of improper abstraction between the guest
> physmap and the shadow pagetables as-were - which were/are tighly
> coupled to vCPUs even for aspects where they shouldn't have been.
> 
> For better or worse, the toolstack can add_to_physmap() before it
> creates vCPUs, and it will take this path you're trying to delete. 
> There may be other cases too; I could see foreign mapping ending up
> ticking this too.
> 
> Whether we ought to permit a toolstack to do this is a different
> question, but seeing as we explicitly intend (eventually for AMX) have a
> set_policy call between domain_create() and vcpu_create(), I don't think
> we can reasably restrict other hypercalls too in this period.

None of which explains what's wrong with the provided justification.
The P2M isn't per-vCPU. Presence of vCPU-s therefore shouldn't matter
for alterations of the P2M.

Jan

