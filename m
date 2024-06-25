Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC85916256
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 11:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747510.1154939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2WD-00008R-L8; Tue, 25 Jun 2024 09:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747510.1154939; Tue, 25 Jun 2024 09:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM2WD-00005n-Hm; Tue, 25 Jun 2024 09:31:17 +0000
Received: by outflank-mailman (input) for mailman id 747510;
 Tue, 25 Jun 2024 09:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM2WC-00005g-4t
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 09:31:16 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab057946-32d5-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 11:31:15 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so30535111fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 02:31:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c81eaf92b2sm8043362a91.40.2024.06.25.02.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 02:31:14 -0700 (PDT)
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
X-Inumbo-ID: ab057946-32d5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719307874; x=1719912674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mPJTVbpcih923EnIV5/SV3GgFzPfabyUZsWU9+exr+w=;
        b=XRA0qKYwegwmMjh1PNgfsHC3PpfwwFf0868SJ6syyujbHQ4tOuaUZMLVWu7lL3onFB
         PWlGPyEWrqcLW0m9AwTmfS6N4pNko2fYv8ybLhG4ado/DfUDFScZPxIWerLAm2AuqjIV
         sWGVNBvXcAJbdLE1MQioFW7UjYl+XNoNrE/xp1YDaODZnwy/vWAFRtaW889KILMn61FJ
         KbgbKW6nBaNz/7nwQ1H6qep5EAgCWQhTOn9UiFYfCdYIfiMLcb0OiI0JM3AqirEQl1Ep
         v+OMIe7x6IZsCJs+Xede2uK9ClOOmSZi3nStEgIczZgmXIEuJx8AHdUWL4hNCYkYZXRz
         Jfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307874; x=1719912674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPJTVbpcih923EnIV5/SV3GgFzPfabyUZsWU9+exr+w=;
        b=AY/+ITsHAE/NlIO+Zq7C+ZpC1VsT2RAeHrbwn/H7/lEWKwT7dgZgH5lQq6e3p+GvaZ
         eYBag/w7JR90Ouhh8wQTJEoWxyrDVjsZD8j72qp13/Ou7lJihZXi9D58zu5QQKff+1YP
         CmuV2+KbhrlDPUEKBnbVF2CX3tFB9jM6ssB1CZoAtTO5jOdMRtYU+IIMECgGAiQ3HvH0
         bEQlNge5Wiae6Q7qeyTVqqRGBFig78B11xKN1IUU+K2Sb5oEykCEyB/oE4QbrqT24WcI
         UnJb066RLl+dimDXBru/r12HdPOzqZc4jtk4oAJE+lM/h8S+Gq9RVD7l0AzuTSFCrKw4
         rQqQ==
X-Gm-Message-State: AOJu0YxVb5d1mVRM5pvZG3vO1467PG8Bc9aCPCxmdnsUp8Y/HO5k2r0U
	u8BMFIXqe0+Yaeig4AS+i2rp8Rd29ClafTxxMZZrinnOdlbIHgQ/1jLIl3HCVA==
X-Google-Smtp-Source: AGHT+IGpQoltf0M0iJZzC+Q+aC9zS5IdGRsUH2myg5A1A3j0VQOUdXVuIagU1xm5aa3kMXYemPbTCA==
X-Received: by 2002:a2e:9b4d:0:b0:2ec:543f:6013 with SMTP id 38308e7fff4ca-2ec5931d86amr55159551fa.13.1719307874542;
        Tue, 25 Jun 2024 02:31:14 -0700 (PDT)
Message-ID: <b4da0eba-fc68-4459-b64e-9e19f8e45677@suse.com>
Date: Tue, 25 Jun 2024 11:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] gnttab: fix compat query-size handling
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
 <ZnqMuFBb0J9UF2XE@macbook>
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
In-Reply-To: <ZnqMuFBb0J9UF2XE@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 11:24, Roger Pau Monné wrote:
> On Tue, Jun 25, 2024 at 09:30:07AM +0200, Jan Beulich wrote:
>> The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other similar
>> constructs, should have caught my attention. Turns out it was needed for
>> the build to succeed merely because the corresponding #ifndef had a
>> typo. That typo in turn broke compat mode guests, by having query-size
>> requests of theirs wire into the domain_crash() at the bottom of the
>> switch().
>>
>> Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native gnttab_query_size check")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Looks like set-version is similarly missing in the set of structures
>> checked, but I'm pretty sure that we will now want to defer taking care
>> of that until after 4.20 was branched.
> 
> If we have to backport the fix anyway, we might as well consider
> taking it now.

While I put a Fixes: tag there, this is the kind of change where I don't
think it needs backporting. The ABI of released versions is supposed to
be yet less in flux than the "stable" ABI in general.

Jan

