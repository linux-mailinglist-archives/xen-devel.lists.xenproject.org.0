Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4938C4EA4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721324.1124665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oeJ-0001v8-54; Tue, 14 May 2024 09:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721324.1124665; Tue, 14 May 2024 09:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oeJ-0001sR-1C; Tue, 14 May 2024 09:40:43 +0000
Received: by outflank-mailman (input) for mailman id 721324;
 Tue, 14 May 2024 09:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6oeH-0001SY-G7
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:40:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06271144-11d6-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:40:39 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so1263838466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:40:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574eb5ec296sm111706a12.35.2024.05.14.02.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:40:38 -0700 (PDT)
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
X-Inumbo-ID: 06271144-11d6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715679639; x=1716284439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlCLTqw00BwgOzSCcZqnQxUrm1RkTJWdJpeT/SE9zrY=;
        b=J8kzjHVgaBRmo2MklPZ/O4AlsYCiEdKjAXqhYwC8nZ+Xmk4G/i0B1iQrmLzlAXrFi5
         Nq0ALaHcJaxKSW9jo84XycYLjhuS4odfMmd+9s+97DAqniaZjVU2If6GzQyAo2FXFAwl
         7avM3IA/Ld/fiuwVh739tu8j7qMq05PESAz3krNtUhTLfu8O9aDUE4DIFl7Y68S+b20M
         ll0bb4QMSONlYjYUd6rVQTt08JwtxAKnm3xKVFtKwD5iOk7OyAK99vciTTl2tk9in0xX
         yvLL1wmEgPBfpc+q8U7UV1QLmOxPPITFQUW9JscpB+9/ZoH9IKY8Ai4y96KSQQHTDKvX
         0JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679639; x=1716284439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlCLTqw00BwgOzSCcZqnQxUrm1RkTJWdJpeT/SE9zrY=;
        b=DRkthe5clrpTrXxAstX2BvJgRjiskHywN0YnX0OIzJkPPmi/1/BHFPW9fbnpjL0/SU
         OKTkeOL7dPn3SStAk6LA+1ftUB6BG0rsdXTs92tedKU+5kEmz7BaMBVp4toD655vfDdw
         3Qs4s8weZv8KkXkuUTKabCLuN0z5isnc3PiR3vpGGUTuiWRYVDeOoXd26W3EjHW8z9BU
         lRtlmorW41zbZDTt+yuut3w9y+MP9Gc/Hylbz6h5l62lWClawy98OWDqi0/EjDsj4ay5
         AbFHfI4yn/7CPzGdPHRCSQ+BTeW/TojThCaLiPpdcJt1nwYXZDl5TAR9ApgjylcEOo+o
         n61Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8QFTOp8hLNLg4cVH3ILlueuWZ8XeglrUPl84nDuvpbaBv9PnJSSdKmWh/kSB94FNKIjiELxGvSXfjZRifbTCzl9v6z/NtIXLQgeGjhOE=
X-Gm-Message-State: AOJu0YwSA4kxMbf41AQBHKn/0mVfjYt6qfF6ogwGl5JYLD6Jr4cg36lv
	TZsz67Y0Q/FTVW1+z4asRdZaAEL1YYEAoMRxj1OY2yCCXaKt5IP7/PonTN7mLg==
X-Google-Smtp-Source: AGHT+IFieXlOHeQ1/bLYZ/47+S4VlfvWbubmp6QSsPNPmOQVNqVBETnp/QMKXSlWMZB/ORDfkLWZQw==
X-Received: by 2002:a50:8d07:0:b0:571:e272:296 with SMTP id 4fb4d7f45d1cf-5734d67ee8emr8507092a12.27.1715679639180;
        Tue, 14 May 2024 02:40:39 -0700 (PDT)
Message-ID: <aae35115-95a0-40d2-bc83-c89de1e448cf@suse.com>
Date: Tue, 14 May 2024 11:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpu-policy: Fix migration from Ice Lake to Cascade
 Lake
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
 <20240507134540.1714274-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240507134540.1714274-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2024 15:45, Andrew Cooper wrote:
> Ever since Xen 4.14, there has been a latent bug with migration.
> 
> While some toolstacks can level the features properly, they don't shink
> feat.max_subleaf when all features have been dropped.  This is because
> we *still* have not completed the toolstack side work for full CPU Policy
> objects.
> 
> As a consequence, even when properly feature levelled, VMs can't migrate
> "backwards" across hardware which reduces feat.max_subleaf.  One such example
> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
> 
> Extend the max policies feat.max_subleaf to the hightest number Xen knows
> about, but leave the default policies matching the host.  This will allow VMs
> with a higher feat.max_subleaf than strictly necessary to migrate in.
> 
> Eventually we'll manage to teach the toolstack how to avoid creating such VMs
> in the first place, but there's still more work to do there.

Can you explain to me in how far "x86/CPUID: shrink max_{,sub}leaf fields
according to actual leaf contents" would not already have taken care of
this (and not just for sub-leaves of leaf 7), if only it (at least its
more recent versions) was ever seriously looked at? I realize there was
one todo item left there (addressing of which I could probably have used
some help with), but that shouldn't have entirely prevented any progress.
(If I'm not mistaken an earlier version had once gone in, but then needed
to be reverted.)

Jan

