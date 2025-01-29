Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35BA21D52
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 13:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879132.1289349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td7VZ-0007Mr-9o; Wed, 29 Jan 2025 12:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879132.1289349; Wed, 29 Jan 2025 12:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td7VZ-0007LN-6H; Wed, 29 Jan 2025 12:49:29 +0000
Received: by outflank-mailman (input) for mailman id 879132;
 Wed, 29 Jan 2025 12:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td7VY-0007LF-Dq
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 12:49:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c434f0-de3f-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 13:49:23 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so1311669366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 04:49:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6963743d7sm706321566b.91.2025.01.29.04.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 04:49:22 -0800 (PST)
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
X-Inumbo-ID: 76c434f0-de3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738154962; x=1738759762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P13nDXn0ksUze1YCLpPOQ4mzqk36RMO0+DPY/3Rbc7I=;
        b=VsE+nihzm59nR67Vsk7DxX+Ofwj/RE5SxLCirXsMrTh+yffXV36RA+Qg1PaKCF/IMk
         S2sFkdE/DnNqIHf9xj4wiCxKOR13ghw3gcih4tPB+/3ltu2zdp9vGf8IofhcnIICs3Cq
         E9rMpM3KLLm0hLDjfFJsmSXRc2ZnHES+/Cw335UfwNrdPsAG4NU3uyVD1RwfzE7+4RwP
         7u+hwiFn79JRJ1CKgrS/xgjAbJhQfltg32XkIfHrzE1mGZ1aiyHFXYBy6yJdFIFOU6UN
         Lx8i2p6lSBSIDhFQi8sIHvrnXbkSLvKfXU+exGRlRew3Fn1ZN9FmXIbLZdu1a8fRxI36
         t9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738154962; x=1738759762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P13nDXn0ksUze1YCLpPOQ4mzqk36RMO0+DPY/3Rbc7I=;
        b=vx7Vwdaw7+bAms22HC47AyJPzWFJh6k7HnZP63LW4mIwfd/Y6CO4nU2zCM8FjPEViK
         bMJa7dxNHe2O1/LqT50ydepxqftqpkH5ICoVLgjFW9UsRcKAXP1l92nahwRoXdcUPJEB
         mlVEZxivAPPcUtbpGaLZ+o4d37DMYkvPIQOXwAxgKB1roPIwGYAZVlT8N/tjb50DeZxi
         oJv/5Ctsze+cJMBygOqdjuS43sEVaq+R6qOSHdNMqv8NSsyw1KBATycGKtz5Z8cyK8NA
         ttP+Y2GcH3LCdBSTCF18gALXppZhJwMLjUQVcS7vvL5Ql+iEyA02Z3zv6ikVKFwnMR0z
         qFBw==
X-Forwarded-Encrypted: i=1; AJvYcCWUz3cVFyVkaL+Fzxd0+Kk5CwVUYJdNB+l3YV9FmXHcVefxx8Uh3jS4FoDJGe9QvbBOS6airZf6ewE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpUu7LZBySCplQmMUrQSSHjh15lm1qXmZ6XS5Uez4YJXyQYW8/
	BahgAM1BejyfK2COzanZmGEGabtMOWdSCsH7lysQlmMdlk16D39hYpPRnxraeA==
X-Gm-Gg: ASbGncvP9/UduDd8fUZRw1TANr+p5J8YqXDH5MP6Rl6evsEXzypRcnGdgV5wWvxsy9w
	rlOtJ/vKXF7yhV/k0TVnDMig/ZPHjZfPcyYo2h9BQT6UJmdVAEEPjQP/MtZZ6jZJ6XrkWUgFsy3
	Kb7Xg/2T9yHW3c0dVhNitqVBXCCgVAS6r0i2uIKBcPHnudkTCCteszuskr3+mIK60ASLADYqPhp
	gl6XKPHWaYZHn4H8moU/Yq9ReIokYkIaqb63+V/Hxp07fVWOXNfYRFfdor6eAKFvnNwouTKeuZl
	6v24HP+lr5FThu63inXyw4EqtgXSXfTh73Ro8p8i+sZVaLLYE4s1CHLQkuFfb0Ejt1JzH6vlLqH
	J
X-Google-Smtp-Source: AGHT+IFbOOXBWI8FB+7yf4hzIic7jBHj46Y0AzXKI74CLRhnwt0JFJ60eK4jgC+pdzwi6Ic0HcyRYQ==
X-Received: by 2002:a17:907:7fa1:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab6cfdd851amr290915766b.35.1738154962327;
        Wed, 29 Jan 2025 04:49:22 -0800 (PST)
Message-ID: <4d7ed713-68b5-4e9c-8952-002d21d662d6@suse.com>
Date: Wed, 29 Jan 2025 13:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
References: <Z5mOKQUrgeF_r6te@mail-itl> <20250129030315.GA392478@bhelgaas>
 <Z5mfA32bvEn6yD-C@mail-itl> <22ad7276-624d-49fb-a2bb-1b7908318a4e@suse.com>
 <Z5oWq4YgMgwWvl2G@mail-itl>
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
In-Reply-To: <Z5oWq4YgMgwWvl2G@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 12:53, Marek Marczykowski-Górecki wrote:
> On Wed, Jan 29, 2025 at 10:17:20AM +0100, Jan Beulich wrote:
>> On 29.01.2025 04:22, Marek Marczykowski-Górecki wrote:
>>> On Tue, Jan 28, 2025 at 09:03:15PM -0600, Bjorn Helgaas wrote:
>>>> The report claims the problem only happens with Xen.  I'm not a Xen
>>>> person, and I don't know how to find the relevant config accessors.
>>>> The snippets of kernel messages I see at [1] all mention pciback, so
>>>> that's my only clue of where to look.  Bottom line, I have no idea
>>>> what the config accessor path is, and maybe we could learn something
>>>> by looking at whatever it is.
>>>
>>> AFAIK there are no separate config accessors under Xen dom0, the default
>>> ones are used. xen-pcifront takes over PCI config space access (and few
>>> more) only in a domU (and only for PV), when PCI passthrough is used.
>>> Here, it didn't went that far...
>>>
>>> But then, Xen may intercept such access [2]. If I read it right, it
>>> should allow all access (is_hardware_domain(dom0)==true, and also the
>>> device is not on ro_map - otherwise reset wouldn't work at all).
>>
>> The other day you mentioned (on Matrix I think) that you observe mmcfg
>> not being used on that system. Am I misremembering? (Since the capability
>> where the control bit lives is an extended one, that capability would
>> neither be read nor modified when mmcfg is unavailable.)
> 
> Yes, but later (once dom0 starts) it switched back to mmcfg. Now I see
> this:
> (XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
> (XEN) PCI: Using MCFG for segment 0000 bus 00-ff
> 
> Another thing I noticed in the bug report - the reporter says warm
> reboot from 6.11 (where it works) to 6.12 avoids the issue (not sure
> about further reboots). Cold boot directly to 6.12 results in this buggy
> behavior.

Makes things yet more odd, imo.

Jan

