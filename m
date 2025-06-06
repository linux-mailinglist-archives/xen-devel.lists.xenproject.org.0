Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A86ACFC8E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007888.1387053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQXR-0000v4-Df; Fri, 06 Jun 2025 06:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007888.1387053; Fri, 06 Jun 2025 06:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQXR-0000td-Ag; Fri, 06 Jun 2025 06:26:49 +0000
Received: by outflank-mailman (input) for mailman id 1007888;
 Fri, 06 Jun 2025 06:26:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNQXP-0000iu-KX
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:26:47 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37077029-429f-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 08:26:44 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so1448189f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 23:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2360307832dsm5697815ad.52.2025.06.05.23.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:26:43 -0700 (PDT)
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
X-Inumbo-ID: 37077029-429f-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749191203; x=1749796003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i03ce/j8kWJ56FGCgn62re4EOYij4bYvFBCVqTSi/7A=;
        b=CvqwIqSNDe0FkPBlPR6gZjpvozJfOSw50zqq2rtOBMusErtQ5ajqhzvNCAG+rkKpgU
         Chzw+G+IHoqC4Hp2d3+zQ+BGJgt7/zoD3vLpA/Sa9MQCxu8pXLyhbredMXed0zIHyiRH
         b6E2bJqplMEDxe95KsR5MSxsLXAMmcXLWjtNEt0SbEP+VcTq5uYY+5ak+u0XwHfEM3Kj
         bNOH8Um6Gl6X3Hg393EtMFGWeVhP6Xl3GjwB5+xCzGmVnQ/3LmAoQA611A1N36v15Lkz
         s6kWGy94aY+MRR6oG4AEBcYflWLDVgd/eSgZiCH4tqTnfcm/Ohnnwv17riAi8NFzfk5S
         bA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191203; x=1749796003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i03ce/j8kWJ56FGCgn62re4EOYij4bYvFBCVqTSi/7A=;
        b=dymg6dtY4JQHvtCP3LEFQQxnomWGEukO6s2lRUXjJpId5NBlhZyQmKlTV9uSCOoXJ2
         r77Mi2Nyanlq5sAqt8770ewaEH5esmCrIxJTQ6NY0Q8SA2k0002cYVM6WDM5Kg3NszPB
         CrtYiteQHMYe8t6w/p+9ml2pPhPw5NgH6Kfs57VJHqwRuUUZICYLZs5Yhure8+6LeT13
         BAGZeCg5k209/U3c+mjV+wwwr18nppE3sk/+gRRwL5vCN+WuoUiGUF7/Ag/wziqmu8Ac
         qtuH5LXtI1dylrm+jYA658rlY4i0qKwuhgAzVF5j8eE6MLDFPgxrvLyzL7JxJxuTO6jF
         EB+A==
X-Gm-Message-State: AOJu0YyH6omP2+KuO8SlHM0dO3UUzTdVvLdGKTPrRzaUhLcK+Lhnt9cp
	KofH48FarP7UDuneQcwMakkw7NjMIevpXBE7G02MAQ3KLoBKaTnHOV+9/BnIWQbKCw==
X-Gm-Gg: ASbGncu9X19uwlHqTB8dDiLyQeMwMheXZa//Yx7H2NWMDTvFZymdEZm13Ar5mcqOuVP
	0Q0fAAfec7r0254c4QjuuS2lcbuU3QpHrYZhxl4l9wAaDvFIJpOLzpfAxXEgXXPLL3iZqgBWP61
	Oqd5xh01vNYwvCzezGeDUnwrj3gNAL6Tv4PvrO1LiAg980aOYDBll9VbIVQBUiwlfPYmqWcDJ8R
	zeISix+fNSXAabVGEz9BFTzOgEuut9GAVADZmP/1Jh1y0oULHzXup3KXYE1S/bz9f3O9SLXSTxR
	dKJ+dajBf5Sm8DFEHLQrERB9cAyi2CSYYTsUSe3pCN9MTGVoPBARqDXewYLmgr1Qb3Uq+/91zA8
	0izdnf//NUvu11p1kI56HDRTchmNHLx3N06uo
X-Google-Smtp-Source: AGHT+IFLEYwVXmlMX4cd+pA0o9hHP0KQcsPN5qRXbFPr+e8ZMRQIbim4evRJLzOtGdf7Csu9fRm9BA==
X-Received: by 2002:a5d:584e:0:b0:3a4:d5e8:e352 with SMTP id ffacd0b85a97d-3a5319b6a33mr1689221f8f.7.1749191203460;
        Thu, 05 Jun 2025 23:26:43 -0700 (PDT)
Message-ID: <83c22da9-62c5-4fb2-bc2d-f34ad5956d3e@suse.com>
Date: Fri, 6 Jun 2025 08:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] console: add relocation hook
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com> <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com> <aEGu6-6dGqc_WUlg@mail-itl>
 <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com> <aEHBAsLFvZni1_5Y@mail-itl>
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
In-Reply-To: <aEHBAsLFvZni1_5Y@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 18:08, Marek Marczykowski-Górecki wrote:
> On Thu, Jun 05, 2025 at 06:05:02PM +0200, Jan Beulich wrote:
>> On 05.06.2025 16:51, Marek Marczykowski-Górecki wrote:
>>> On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
>>>> Why is it that this ring is dependent upon Xen's position? If the ring was
>>>> dynamically allocated, it wouldn't change position when Xen is moved.
>>>
>>> The console is setup quite early, I don't think I can allocate memory at
>>> this stage, no?
>>
>> But you allocate before Xen is moved, I suppose.
> 
> Well, I have those buffers in BSS exactly to avoid the need to allocate
> them (or rather: have bootloader allocate them for me).

Yet them remaining in .bss is now getting in the way. Imo moving them to
.init.* and adding proper allocation is going to be easier than the hook-
ary you are proposing.

Jan

