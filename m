Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C79C1DC5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 14:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832591.1247880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Os6-0000xl-Qm; Fri, 08 Nov 2024 13:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832591.1247880; Fri, 08 Nov 2024 13:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Os6-0000vM-OD; Fri, 08 Nov 2024 13:17:54 +0000
Received: by outflank-mailman (input) for mailman id 832591;
 Fri, 08 Nov 2024 13:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t9Os6-0000vG-5l
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 13:17:54 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da72efa3-9dd3-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 14:17:50 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539f7606199so2145538e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 05:17:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7240799bb25sm3709653b3a.109.2024.11.08.05.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 05:17:48 -0800 (PST)
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
X-Inumbo-ID: da72efa3-9dd3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzIiLCJoZWxvIjoibWFpbC1sZjEteDEzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRhNzJlZmEzLTlkZDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDcxODcwLjIwNDUzNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731071869; x=1731676669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=44MqjS2Qw0/t+kC4+TvLRlMa6ZNUkGOne1S4wjO2nMs=;
        b=CEiI4Scda51DCKpLNpHQtfJev8K5tn+7QNKVzshj7yG1m284Gtyc7oGC4lQW5qYTMM
         cv5m3aRRh4w6EPdfF2KdhO9w90fjEyg+dQ/fOxAt3A42C4eFCXk4gKXEVyVNYFNi3vAh
         0qkLimUvK++8dMQjB0Y9cxKM659pmncKmxaG9jJgagAZTET7Wr40Xi+VfiuxRdfC44+I
         epXyoTRDnNra1VbKtvwIA7cOLIBmNpGmrIHiyODGTHXxpWg6TOYVsLz+V7l6Yt3fUOxU
         q3e+ITDHOIGOYaaG+56Ponw7VOZdbTREdxJZHlllD6/Pblg+VdvdIt0eIlE33rEXIqr/
         77nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731071869; x=1731676669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44MqjS2Qw0/t+kC4+TvLRlMa6ZNUkGOne1S4wjO2nMs=;
        b=rNhwMqSbPYPpQSUkpPMT9Bm1BKwTOJVuArPk70DqM713k2HbH4Df0Rtz5dVKrvm58O
         zD2LQtKNKQFeO7vSS6trgXFWy/9vLEw2bh6il+pPy+uYRlxx9wUsD0NDF1hI+3/tmEvr
         AGdYOIGgtWr7mTls1CEegxKL1V46r75PEbGzGZAQWwEDfvFKxJJHnUDq6f+2Ws1I552u
         rM/6ntzPQlJPnSimoHmK7sHHVHYUQTCREVoVXzV+62VfERuTSqBBiPwlliW48ow2iMOh
         O0+IcnMemZA4DN8A1gkPCFAVdjc8934Id7YNEHRDUTvhtYvfIWTzQk3MxzRf/KPDWFPq
         lQwA==
X-Forwarded-Encrypted: i=1; AJvYcCXDRCRwUP2tzSH+HBRzB1yv/Ja2ghQ6yuGZOBWh3STKXqrwFa3aXHfiyBoOFsPbo44HmczHzg+DVeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTQ/3FOKLz+wnWTdhwLx39Wb+6cPLprq3hS2rhTZxAW3gnjvrq
	KddoqZbWsPLRP9YjZg7XO83ZqNfPY/P4YVdG9+e+gBAkq6OHxF/KCulN4b+QYA==
X-Google-Smtp-Source: AGHT+IErz2pxU2nbhV1FVRsOxfBTz+X489lODuW7CphapPAXZ7xL/dTZSwrpzNc5tqI72/ZrSknL1A==
X-Received: by 2002:a2e:be93:0:b0:2fb:36df:3c8 with SMTP id 38308e7fff4ca-2ff2021b236mr14996771fa.10.1731071869506;
        Fri, 08 Nov 2024 05:17:49 -0800 (PST)
Message-ID: <39b2a334-1298-4e83-b7b7-393c79964539@suse.com>
Date: Fri, 8 Nov 2024 14:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
 <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
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
In-Reply-To: <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 13:42, Alejandro Vallejo wrote:
> On Mon Nov 4, 2024 at 7:44 AM GMT, Jan Beulich wrote:
>> On 01.11.2024 21:16, Stewart Hildebrand wrote:
>>> +Daniel (XSM mention)
>>>
>>> On 10/28/24 13:02, Jan Beulich wrote:
>>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>>>> Add links between a VF's struct pci_dev and its associated PF struct
>>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>>>> dropping and re-acquiring the pcidevs_lock().
>>>>>
>>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>>>> VFs may exist without a corresponding PF, although now only with
>>>>> pdev->broken = true.
>>>>>
>>>>> The hardware domain is expected to remove the associated VFs before
>>>>> removing the PF. Print a warning in case a PF is removed with associated
>>>>> VFs still present.
>>>>>
>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>> ---
>>>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>>>
>>>>> v5->v6:
>>>>> * move printk() before ASSERT_UNREACHABLE()
>>>>> * warn about PF removal with VFs still present
>>>>
>>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>>>> just after an adjustment to the commit message. I'm instead actively
>>>> concerned of the resulting behavior. Question is whether we can reasonably
>>>> do something about that.
>>>
>>> Right. My suggestion then is to go back to roughly how it was done in
>>> v4 [0]:
>>>
>>> * Remove the VFs right away during PF removal, so that we don't end up
>>> with stale VFs. Regarding XSM, assume that a domain with permission to
>>> remove the PF is also allowed to remove the VFs. We should probably also
>>> return an error from pci_remove_device in the case of removing the PF
>>> with VFs still present (and still perform the removals despite returning
>>> an error). Subsequent attempts by a domain to remove the VFs would
>>> return an error (as they have already been removed), but that's expected
>>> since we've taken a stance that PF-then-VF removal order is invalid
>>> anyway.
>>
>> Imo going back is not an option.
>>
>>> While the above is what I prefer, I just want to mention other options I
>>> considered for the scenario of PF removal with VFs still present:
>>>
>>> * Increase the "scariness" of the warning message added in v6.
>>>
>>> * Return an error from pci_remove_device (while still removing only the
>>> PF). We would be left with stale VFs in Xen. At least this would
>>> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
>>> order. Subsequent attempts by a domain to remove VFs, however
>>> (un)likely, would succeed.
>>
>> Returning an error in such a case is a possibility, but comes with the
>> risk of confusion. Seeing such an error, a caller may itself assume the
>> device still is there, and retry its (with or without having removed the
>> VFs) removal at a later point.
>>
>>> * Return an error from pci_remove_device and keep the PF and VFs. This
>>> is IMO the worst option because then we would have a stale PF in
>>> addition to stale VFs.
>>
>> Yet this would at least be self-consistent, unlike the variant above. No
>> matter what, any failure to remove VFs and/or PFs correctly will need to
>> result in there being no attempt to physically remove the device.
>>
>> You didn't enumerate an option lightly mentioned before, perhaps because
>> of its anticipated intrusiveness: Re-associate stale VFs with their PF,
>> once the PF is re-reported. Problem of course is that, aiui, the VFs
>> could in principle re-appear at a different BDF (albeit we have other
>> issues with potential bus-renumbering done by Dom0), and their count
>> could also change.
> 
> Are you enumerating it for completeness or suggesting it should be done?

I was meaning to suggest that it should at least be considered.

> Maybe I'm missing something here (and please, do tell me what if so), but why
> would this option be desirable at all? What would benefit from such semantics
> (as opposed to any of the others)? It would break the lifetime dependency
> between PF and VFs, and that doesn't strike me as a feature. It also turns
> kernel bugs into a fine implementations by making promises about how state is
> persisted, but the consequences of that appear to be too far reaching to know
> for sure it's 100% ok.
> 
> From afar, it sounds like trying to turn a bug into a feature. And that cannot
> always be done sanely. But again, maybe I might very well be missing
> something...

My main point is that the other suggested options have weaknesses, too.
Leaving stale VFs around forever isn't, imo, any better than trying to
reuse their structs.

Jan

