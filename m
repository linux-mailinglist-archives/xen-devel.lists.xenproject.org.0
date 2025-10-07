Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A4BC172A
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 15:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138778.1474388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67Wi-0006qk-9V; Tue, 07 Oct 2025 13:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138778.1474388; Tue, 07 Oct 2025 13:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v67Wi-0006pJ-6j; Tue, 07 Oct 2025 13:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1138778;
 Tue, 07 Oct 2025 13:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v67Wg-0006pD-Hg
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 13:14:46 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97df86ad-a37f-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 15:14:45 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so13368a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 06:14:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63788110080sm12599755a12.34.2025.10.07.06.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 06:14:43 -0700 (PDT)
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
X-Inumbo-ID: 97df86ad-a37f-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759842885; x=1760447685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf4j2zj6I0qw4hINHm+PiTHsExFcolPo27zdm46bvJ8=;
        b=ZapVK9FmOuR/RIHY+xlBTqt5Yuu6TXJAv/m0h2tP0lBiC0HzubdqsucwtL6RBKu9Ky
         cKuaPj0nGIr6gnbs/2wzFNA8MYeJw/zH1bk8n4yO7rASGysQjxe/aBtCJt6Qvpmf6YJI
         1BCAagejQz4MsCy1deBxKPGOjvoErpAyx4NrAeAzQr8T00pvb4UGUxgL9/O/HjuUqLMo
         O07l+tIzja/Yv5I5Q1OT2I/aEPd56Cmj4SpR8JrZb+Jz28EJXUJM6iLYfH0RWCqFe2Zz
         2VxsllTQ+n9j051K2M4HUUETsKUioyNxdErHi3Yy7OhuAhc8VK8Daoc4nFq8Uc5c9EWF
         Eoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842885; x=1760447685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf4j2zj6I0qw4hINHm+PiTHsExFcolPo27zdm46bvJ8=;
        b=CKnuunDZSpnD8Q9uA/7/L09x+e8Dn8gADgyOqOQ/3L78MG3K8lOc2WSvKADJl1FupK
         TolUELXsgLgiZ3ggTZboirMd2b7b818bSbegHAVBhf7POrQnbPhMnv8CZnDGYsZQjYCG
         cWDu2QHAZv+lOWOt5J9UyD9HKXE7fhg/InYd00iCrvOUEYyYayMoQnrftvL9J4rdL/0K
         KgQIzWduZ5nTQZCJ2sBHiUb3MQvBFd6vcNyUB20DDHRUDWdbyr+Oei4O/TQf5a4j8GQz
         P385ryTwI5E1Zl+SVlGVsReZOwpKWbH7YAT1eQhLcFWxPPKY5i53F8qoWUrWcxy3v+GZ
         ibNw==
X-Forwarded-Encrypted: i=1; AJvYcCXx9LBKeNlOGndzGMAwEcIcgAE3+D4HOVsVfM4M6aPhYLqj4yB+xL9RC0118GE9fUDf+H5VFdG863k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJfepfMi7/Wx9Fd5Jt6GHoicrFAsMJCV0pXJXRNEsEMvA8jlRs
	nnLQjYCScud50ROZtE5Jb1jPvGGCvRLLtObbPEwdgp6UCnuPgQF+6Tr/atkUXkVgCQ==
X-Gm-Gg: ASbGncuMpLDQrprG6CZAHqUgM+bM2C4XG/esfr7ATSZAncoTKfN1jS79nnzqGo1xh25
	HNsDx36WD1n+Ii9pcqANWuZuZdL9ZJjSqW/VdsPnorZp9z/+2b+5Lm/OJvkPHV3iSb/Gj5o/ZY0
	KSOH6qhiC5vukLWbZde2KLCfAGeNzmRNnL7N5tVGhdil2ZAY1lEelfmBSegjNiJklf+3l4Skt0U
	T/xN6yxNCKoxkRDuD+9BSuZfLbu7lcG/kaVlZqavFE4pO773LFMN8s/rMvBjdWR7B/5uiAerZNT
	JFodb0dITZrF8Gu68FGOzC65Y2oA+/n117OlPcuEz6aaxezaJzT0kQ3y6MjF3g07nFB50QJDIfs
	iUZ/YEeo+Hoh83DrvGeSR7vijZ7nswl4xyZcuTB21j0zE3NpOUeAs1oiNzvJWMaO5775PTNbOCN
	EQwWzmLbDa4M1NsZqVjkdSVDdg8SDNlkY=
X-Google-Smtp-Source: AGHT+IHAIneMBlKRhDuiweCyQSlwb37bYtFEQ0XAorWoFWfXgUriEvJV5yNtZn+400fudHPxVleZ1g==
X-Received: by 2002:a05:6402:26d1:b0:633:7017:fcc1 with SMTP id 4fb4d7f45d1cf-639348de8f0mr17762107a12.14.1759842884696;
        Tue, 07 Oct 2025 06:14:44 -0700 (PDT)
Message-ID: <cd6f65cb-d2f7-48bd-81db-eb67b3c20d36@suse.com>
Date: Tue, 7 Oct 2025 15:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5065d9f1552fd940cc19087d8e00a0fa3519e66c.1758145428.git.oleksii.kurochko@gmail.com>
 <854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com>
 <577daeb5-d43f-4172-9a3b-2062c01b8d45@gmail.com>
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
In-Reply-To: <577daeb5-d43f-4172-9a3b-2062c01b8d45@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2025 17:37, Oleksii Kurochko wrote:
> On 9/22/25 10:46 PM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>> +        if ( rc != P2M_TABLE_NORMAL )
>>> +            break;
>>> +    }
>>> +
>>> +    entry = table[offsets[level]];
>>> +
>>> +    if ( pte_is_valid(entry) )
>>> +    {
>>> +        if ( t )
>>> +            *t = p2m_get_type(entry);
>>> +
>>> +        mfn = pte_get_mfn(entry);
>>> +        /*
>>> +         * The entry may point to a superpage. Find the MFN associated
>>> +         * to the GFN.
>>> +         */
>>> +        mfn = mfn_add(mfn,
>>> +                      gfn_x(gfn) & (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
>> May want to assert that the respective bits of "mfn" are actually clear
>> before this calculation.
> 
> ASSERT(!(mfn & (BIT(P2M_LEVEL_ORDER(level), UL) - 1)));
> Do you mean something like that?

Yes.

> I am not 100% sure that there is really need for that as page-fault exception
> is raised if the PA is insufficienlty aligned:
>   Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages, Sv39 supports
>   2 MiB megapages and 1 GiB gigapages, each of which must be virtually and
>   physically aligned to a boundary equal to its size. A page-fault exception is
>   raised if the physical address is insufficiently aligned.

But that would be raised only when a page walk encounters such a PTE. You may
be altering a PTE here which never was involved in a page walk, though.

Jan

