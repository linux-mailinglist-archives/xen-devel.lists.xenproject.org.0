Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5EB33C81
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092909.1448510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUMF-0006Mz-IV; Mon, 25 Aug 2025 10:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092909.1448510; Mon, 25 Aug 2025 10:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUMF-0006Kl-EY; Mon, 25 Aug 2025 10:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1092909;
 Mon, 25 Aug 2025 10:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqUMD-0006Kf-W6
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:23:21 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 855ce52b-819d-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 12:23:19 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f501cso4522355a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 03:23:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe5aa4e6afsm447008466b.45.2025.08.25.03.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 03:23:18 -0700 (PDT)
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
X-Inumbo-ID: 855ce52b-819d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756117399; x=1756722199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XuZ9Raf+CthEKeLzs0DoWfqs/UVEOwwOXsKBpgkT5Uo=;
        b=ZCgQ7Yoc729G/EwIectbRTSAuKOAbOxDzkAkvW0x5Ec/9C1Y3rOYTVszSqIRO0zMH5
         vKu+BJetiXTSlzbp+p6t24nAK6fVIuYAhPAg/Pj33nWdc4SsbE3virKnqR0tgjWFS8+0
         QTIHXD8nbtr739Cgt2W4T4L/OByluVZsXF+0ITXbAibDjAByy34Jj+AlPrM6ByeuqBtE
         hxdCcEdDyV97o4QRm/PuINje+4WkhMhP7kFZo8FKpYYi2aVdHSEWyawzqo1CrdXgO5o/
         ctWQjQrET3UBiFDgGbxK5cjDz5r+3wZA91X08xnBr++2pbcRlVD/BfsKCslP2atO6nlE
         rNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117399; x=1756722199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuZ9Raf+CthEKeLzs0DoWfqs/UVEOwwOXsKBpgkT5Uo=;
        b=psJ6ENIAIzg5lIyBJdEXP6sM8/YJ9CBMJvxqDa52Y1SH2LVBFllkMCIlR7h0RP8pUQ
         NiW23xhTKhLDZnkIaejM9ObWPqSz/feEtjR9XILZqjQvZeWDygdDZoh76YTs/V+N7I/F
         mn5ZQr3qJWxg4Kua3GSk7tNsr+JLwzn/OA856BMXogltLRb78fi02ZGhJ7pCM3sXoXoJ
         0k22CtaJB7whxQU3bnS3SIIk/C4rkCraNtXQdUJDeX6xLN7pGXFMdvWTmiLxaLKl0mRn
         3E4zagj3eDUy80mSbTnIQRLcdtI5JVhZ0kb0ZZrRZ/ITv1Hm9AucbbaWcUjYTkHZOCLB
         eHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBpEsRQbDywdSgN1J+MNLyfr50c2ys9MnjeNZG4lgjZun4E2CYkgFOaeWCmOeZbKs/lKjQEOLJbQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYPVbtgGRkduoLOVuuK1Lcc17jr7Mh2ZTCam29ZXwXU9PLrOjq
	7fythVULBksByAWSlp3N6wLEC7Io01gnxB1W6WRcHdNgnzWHolquke1LD+itr0sqWw==
X-Gm-Gg: ASbGnctRxhTy6ryEPadwDb7TOs169XZzeu+TudECceRQU5YLSi02oUgH48xftQaauHz
	SsR64byf2zc5OKCzP5AYZcjtHRYlR3YDYu90ENRW0m2yOVa8pFkxM4Fx5paMcHRTKXHwcylEw+J
	/4POKbUyX8+5WWRwRApQP0r3EGA6B4ImIBQ7Lu0YCGDiqX22IB4H9Uc7Cu8CTWtw4KuDJsh9U+m
	45x2fHqCsU+5yoeW7EOYd8Cvwjn0gk4seceyEv3n5TLvLaav/aM0Bme9D2YczfXrq0dZv+ybTAd
	fDQW6Dn9yR9mRbg1yDP8AskNYOOCuxYHUkdKpVh6NbQGKPgdhV8Pbm7KsD3Cvj+E2nYxupu1rto
	oWb40vtMFlkO3kvvSPDSbMtyEEbRL50XDHSMsoTm5uRWBPhyJsRGP7aVVWzMsA2vABvq2A94lQh
	ziiF7k4s4=
X-Google-Smtp-Source: AGHT+IGI53muZal7w2v/CjKK2DGhaWKXV45KhP+n2rrf2CFAb17vFsVUVAmXcgHnmU+rtV+VGN4dIg==
X-Received: by 2002:a17:907:9715:b0:afe:7575:df07 with SMTP id a640c23a62f3a-afe7575e705mr322306166b.13.1756117399048;
        Mon, 25 Aug 2025 03:23:19 -0700 (PDT)
Message-ID: <21268b36-ca49-4628-835e-1708ad313946@suse.com>
Date: Mon, 25 Aug 2025 12:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule 11.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <859503540c6b7447f13365c2b70b386c2975edd0.1756056144.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <859503540c6b7447f13365c2b70b386c2975edd0.1756056144.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.08.2025 19:27, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.3 states: "A cast shall not be performed between a pointer
> to object type and a pointer to a different object type."
> 
> Violations of this rule arise due to the 'container_of()' macro, which casts
> a member of a structure to its containing structure:
>     container_of(ptr, type, member) ({                             \
>            typeof_field(type, member) *__mptr = (ptr);             \
>            (type *)( (char *)__mptr - offsetof(type,member) );})
> 
> The 'container_of()' macro is safe because it relies on the standardized and
> well-defined 'offsetof()' macro to calculate the memory address of the
> containing structure, while assuming proper alignment and ensuring no
> undefined behavior, provided that the input pointer is valid and points to
> the specified member.

I may have said so before: This all reads okay to me, just that I'm unsure
it would actually be convincing to an assessor. The "provided that ..." is
a pretty strong requirement, which isn't overly hard to get wrong. Stefano,
Nicola - what's your take here?

Jan

