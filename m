Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE88459C9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 15:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674460.1049380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXqD-0001MV-4k; Thu, 01 Feb 2024 14:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674460.1049380; Thu, 01 Feb 2024 14:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXqD-0001Kd-16; Thu, 01 Feb 2024 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 674460;
 Thu, 01 Feb 2024 14:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVXqA-0001KX-Ta
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 14:14:54 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4443fa92-c10c-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 15:14:52 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a358ec50b7cso177054666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 06:14:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n11-20020a1709061d0b00b00a31805b4165sm7307095ejh.11.2024.02.01.06.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 06:14:51 -0800 (PST)
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
X-Inumbo-ID: 4443fa92-c10c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706796892; x=1707401692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=372ElkJtaiL6Ckt2N2GRS8UgDvCeS0ipS47J5ex3oPo=;
        b=U5Zzk9cy3F6p1AYSXBhqL5oXqA2X9BDsNV9ogxQes40DqjhOE5PrDq2aDuJ2iF2OMP
         gJff50FwrbgJaJKVboXV5g354hTuGSJPY9+t0juLJc0zqWsGzW+SFAkiCDdkcx9dAPcE
         XirwuZcr+O8DV2hdGcauORW/cg3kL1BkTD1TBYi9efLy35160NVDQKcIYm9gKRhSxdmv
         XVBEWA4cTWRnnznzTv3OpNEl4vkoX/a5n/wcZRkD49VUN1txHkp0kBB0ozAldVYXkPYt
         xAgvtNSIfn/hQoYox7N13DlOOpuZkl5yhMQV6sFWB1fPsNPuUIhqbPnxQzK9XvR9lrib
         ua8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796892; x=1707401692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=372ElkJtaiL6Ckt2N2GRS8UgDvCeS0ipS47J5ex3oPo=;
        b=PF95EWIS2qB8TYydqiWMyoCdqsPGShrTQZInlBP6NcsiVn59SVFL2si9G4GTAfGB1l
         vDtPkZeQr9T19mutbE+kc7lAXDbRjLlnKfMdpu46/5VnOZde77Eey1a6LjjC7F+XOfWf
         xh/BZEolyxeetvZHZc5IRifQntZZUmj5pw8eNZWOtHYD3WHwxVfnA/+wbA+DkzeUDs4B
         vWlLtDIYe70oo6ZR5pBVD0MgxEZXgApqBQdz+RCQpPefF0/ozxMJGklfNfRStcDqjwtz
         1CJ/hUe2g4Ce2khnJy84ONpZ+t14syCAyMefsYS3iG1ibuhwO3GPsu2228HfRxqraLUK
         tKjw==
X-Gm-Message-State: AOJu0YxllbpLXY5BLWCGcEm7vZclV0vLiE26fh4aSMKvhgOaGcJcx1RQ
	9TqFFU0RZTziDpsPrmE5FVUvng7b/5EbFdbowmpiO0zXuZySMITBw9gPPCNgyQ==
X-Google-Smtp-Source: AGHT+IGMs6lhETPsxHHCYuu4paYmqeShsaRHhh6gxYOmsr1GP9cGuFZ6nDDesUE42Ccxf37+yHDpjw==
X-Received: by 2002:a17:906:f884:b0:a29:b31d:1dc6 with SMTP id lg4-20020a170906f88400b00a29b31d1dc6mr4608416ejb.6.1706796892038;
        Thu, 01 Feb 2024 06:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWrLCoi+13j4zvLjpgdICpGbP9M3IKMweasrcL5I5I6UVnXqoaByYfddo0BHjwYQc4u24nwrcIGpvOj/Sh6sMjpPELEuJOSoBkJ5RCqi50LGoxbAIu6SNLmfUBbzpUqh52JIRdWQ5FYC4LzCg==
Message-ID: <47b5a1be-280c-4e8e-a5c5-6df7da657539@suse.com>
Date: Thu, 1 Feb 2024 15:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/p2m: aid the compiler in folding p2m_is_...()
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
 <7cce89f4-962e-bfbe-7d30-18fea7515bed@suse.com>
 <CAFLBxZZLJMWpf1fCNN4dhoDpYpW6O=V_C==-sCAZy6t4Df_yBw@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZLJMWpf1fCNN4dhoDpYpW6O=V_C==-sCAZy6t4Df_yBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.02.2024 14:32, George Dunlap wrote:
> On Thu, Jun 23, 2022 at 12:54 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> By using | instead of || or (in the negated form) && chances increase
>> for the compiler to recognize that both predicates can actually be
>> folded into an expression requiring just a single branch (via OR-ing
>> together the respective P2M_*_TYPES constants).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> Sorry for the delay.  Git complains that this patch is malformed:
> 
> error: `git apply --index`: error: corrupt patch at line 28
> 
> Similar complaint from patchew when it was posted:
> 
> https://patchew.org/Xen/5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com/

Not sure what to say. The patch surely is well-formed. It applies fine
using patch (when not taken from email). When taken from email, patch
mentions that it strips CRs (I'm running my email client on Windows),
but the saved email still applies fine. "git am" indeed is unhappy
when taking the plain file as saved from email, albeit here with an
error different from yours. If I edit the saved email to retain just
the From: and Subject: tags, all is fine.

I can't tell what git doesn't like. The error messages (the one you
see and the one I got) tell me nothing. I'm also not aware of there
being a requirement that patches I send via email need to be
"git am"-able (unlike in xsa.git, where I edit patches enough to be
suitable for that), nor am I aware how I would convince my email
client and/or server to omit whatever git doesn't like or to add
whatever git is missing.

Bottom line - your response would be actionable by me only in so far
as I could switch to using "git send-email". Which I'm afraid I'm not
going to do unless left with no other choice. The way I've been
sending patches has worked well for over 20 years, and for different
projects. (I'm aware Andrew has some special "Jan" command to apply
patches I send, but I don't know any specifics.)

Jan

