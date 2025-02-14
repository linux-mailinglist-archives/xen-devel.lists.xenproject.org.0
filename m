Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FEAA357B3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888377.1297742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tipvW-0003qw-9L; Fri, 14 Feb 2025 07:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888377.1297742; Fri, 14 Feb 2025 07:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tipvW-0003oR-6A; Fri, 14 Feb 2025 07:15:54 +0000
Received: by outflank-mailman (input) for mailman id 888377;
 Fri, 14 Feb 2025 07:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tipvU-0003oK-IO
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:15:52 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 855775eb-eaa3-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:15:51 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5de594e2555so2696680a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:15:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270cbcsm2546241a12.49.2025.02.13.23.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:15:49 -0800 (PST)
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
X-Inumbo-ID: 855775eb-eaa3-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739517350; x=1740122150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uxGqufVzJPtAlS6cZ1BTFa9hSMaEMdvIrtI+divWp+o=;
        b=EP37eMhexzReSFDB9/t4WavlFrRbR7ZJCJHQ+ZObIJhAqY7T78/1OsuX78O+v3dZFP
         Kw3NccvHbtPBBy02y+Whvf96XDhUxrC8sBqhag7H14LQcgIHwOSYCBClsfyhHYH6LoUh
         uD1gxlQaVevK7DJoEQXAxh2NG3mW9oBwV3DGk6KK5ekmUawo8lTgXvjuSQlGNj7s0+E7
         bPrkjkXIYE4iu1xvVxiZdiY5vKNz6dhbHuCGkqhGdG7d1uSRPJD80GRGLfMaBfpDxaml
         7ePV2yHKGn1KS4gGKHkraYN2yLR0Y65QELFmUs4YHTjsniHBd8bBK7dlztcG+kGzNPPJ
         Dzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517350; x=1740122150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxGqufVzJPtAlS6cZ1BTFa9hSMaEMdvIrtI+divWp+o=;
        b=cZyIS/lcSfQJ8fuw6rAZdikgaoybDjOI34r6lKj0bpgAimSv47BPH44bGcHMXDJJ3n
         RCmM+/Vgh/D2moQeUKAphuEWturbwH8mv9KElGS49JVQzsiqwVvQJ9xXUL2mtE0wW3t5
         3qi84FpUb9wRAhk9+vAX00s017FRw9deKYsO7MRk/79lvxKTEprskqo1PS3D+2rnR97J
         cp6ua0EJkpwzK9/md0PLAXUPeKr/9lZ3aVIoCdrVEe8faNse1DDmQXMJieP5eRRhiAL/
         R6KD0UW7yu7MoIUillhcuuvENywGeGG0WW6YYUO9wlNUQyF9M4pXnJNm37cY6vI84tj2
         JG2A==
X-Forwarded-Encrypted: i=1; AJvYcCUf3Wg3N7+VTAXc3qi0+J7fHKAfJRZ9L6BVosonTW6+GFCXgU9lxe/3veUMQajTdJKIswn2BX/ABKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpAhsRYmny++iB6QTPN3s6uknjtl13bBx+7GZTyseSWKjk/V1n
	RET2PlOTmrMBnCuMoTrUrfQ81fkff+joQVuMN4El1pWDumQAAzLODt6b0gcvyg==
X-Gm-Gg: ASbGncvaEfqjW9mHOhWizFMrdU4I3Xy9GUaVpm4LRaX5vV16hpOhwp30tDqxHL9SaHG
	cGPmt3ur84VCjVloZApwwcvmnvZ/jV/jjYYXVLsde6SthS9IgghCmdoRCApHu+kOPnZTqIIkxXl
	SRWgD4EZeZdluYOc8t+RA9U1KV01eCoFt22pub1sA3cKZzt/s2RgDBW906udK2x6isGNhDeuI20
	LS9x6jA0lhtwv65uSf3FcyrZ4+6wHAd0IDuLiItuWfbY45d7vWRq9SbFysXz6Wj9/FZJhKPF4XU
	b4RLTgIau6WJQffO4bkAC4cc5p7b1wJfKUSM04F1XyGDXvV6he9+KMINylJh/B3HcjyltBs1RTC
	Z
X-Google-Smtp-Source: AGHT+IGTy6VjcPvudUW+ka2Xr7hTxyVBs1f+TVfUIBl3qxltW99mcfnVX8aLghcHct+ptNIauOrmbg==
X-Received: by 2002:a17:907:94c5:b0:ab7:c6f4:9529 with SMTP id a640c23a62f3a-ab7f33781f4mr1163296966b.7.1739517349883;
        Thu, 13 Feb 2025 23:15:49 -0800 (PST)
Message-ID: <f66556b9-1777-44c6-a086-320f65454021@suse.com>
Date: Fri, 14 Feb 2025 08:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Wrong RC reported during 'make install'
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
 <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
 <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
 <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
 <alpine.DEB.2.22.394.2502131103300.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502131103300.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 20:09, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Jan Beulich wrote:
>> On 13.02.2025 01:51, Andrew Cooper wrote:
>>> On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
>>>> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
>>>>> Hello everyone,
>>>>>
>>>>> During the installation of Xen on an ARM server machine from the source code,
>>>>> I found that the wrong release candidate (rc) is being used:
>>>>>   $ make install  
>>>>>     install -m0644 -p xen //boot/xen-4.20-rc  
>>>>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
>>>>>     make[1]: *** [Makefile:507: _install] Error 1
>>>>> My expectation is that it should be xen-4.20-rc4.
>>>>>
>>>>> I'm not sure if this behavior is intentional or if users are expected to set
>>>>> the XEN_VENDORVERSION variable manually to ensure the correct release
>>>>> candidate number.
>>>>>
>>>>> In my opinion, we should set the proper release candidate number after
>>>>> "xen-4.20-rc" automatically.
>>>>>
>>>>> Does anyone have any thoughts or suggestions on how to resolve this issue?
>>>> Hi Oleksii,
>>>>
>>>> I did a quick test and I see exactly the same on x86 as well. This patch
>>>> fixes it, but then it would need someone to update the RC number in
>>>> xen/Makefile every time a new RC is made.
>>>>
>>>> ---
>>>> xen: add RC version number to xen filename
>>>>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> This is a direct consequence of the request to keep XEN_EXTRAVERSION at
>>> "-rc" throughout the release cycle.
>>>
>>> I'm having to manually edit that simply to create the tarballs
>>> correctly, which in turn means that the tarball isn't a byte-for-byte
>>> identical `git archive` of the tag it purports to be.
>>
>> Just for my understanding - may I ask why this editing is necessary?
>> Other release technicians never mentioned the (indeed undesirable)
>> need to do so.
> 
> This is not an answer to Jan's question, more me highlighting
> priorities.
> 
> While having the appropriate RC version in the Xen name during the RC
> phase of the release process would be nice, I do not believe it is
> mandatory. We do need it in the official release tarballs though.
> 
> So the most important consideration for me is making the release
> technician's job easier and less error-prone. Therefore, I believe we
> should follow Andrew and Julien's recommendation on this.
> 
> Andrew, just to be clear, are you recommending to go with a patch
> similar to the one I posted, and then update the XEN_VENDORVERSION
> with a new commit every time there is a new RC? Or are you suggesting
> something else? I wasn't certain reading your reply.

Just one point here: I don't think we ought to be playing with
XEN_VENDORVERSION. If we switch, we ought to switch back to how it
was long ago - the RC number being part of XEN_EXTRAVERSION.
XEN_VENDORVERSION really should be left to vendors.

Jan

