Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD2A68A06
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 11:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920258.1324478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tur3A-0002C3-PW; Wed, 19 Mar 2025 10:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920258.1324478; Wed, 19 Mar 2025 10:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tur3A-00029L-Mv; Wed, 19 Mar 2025 10:53:28 +0000
Received: by outflank-mailman (input) for mailman id 920258;
 Wed, 19 Mar 2025 10:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tur39-00029F-FV
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 10:53:27 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f18dcd-04b0-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 11:53:25 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso6068061f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 03:53:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdafsm20792641f8f.62.2025.03.19.03.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 03:53:24 -0700 (PDT)
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
X-Inumbo-ID: 61f18dcd-04b0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742381605; x=1742986405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OXTMbzfbmdZ2YJ78GbE53eMp5htfQKVJu2BQW5atGEQ=;
        b=Pc8wRJPyJGGDsYuFXkQ6aKXk4TKObNNQm/c0bhPVuWpupzM6xUhtgYASht98DHtA9/
         jYNmj0gf4B7KWh1qT1Q+gCzmPNHGjrI9BOtuMGddiczkYeplOdzt4FuxLEDUEZAhOrFR
         IQy6zTgBvfSZO15nR9EPu32ynN/4YLp75fy7dpw/r5ZKERHfVkMsY4+mK+dDttMQCdDQ
         m/lcyqFScdExsRAMQMPGfRa8Qf83Wh3VP+5h13nzb28/RsTG51K5+mLkmpWs+YwI7Gyo
         62QlXMtMXKuqeqmiDWTZSwQjOjNVN/k/+oD1rkwW14Y3oic6PGaqI4Ay2HnORqjYKO36
         Oq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742381605; x=1742986405;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXTMbzfbmdZ2YJ78GbE53eMp5htfQKVJu2BQW5atGEQ=;
        b=j34YtJyohkIIJuCXoNPjDmBwtjAM1r+hgEmN+/r8TfWW3v57OIK2a2jeXv5YyhbnF7
         2PkuDsO2CCKDnRm06adakkZYK8IexgQfYyK5X64G8YhXFzTsCSlbZHqcow9jHx0Iw0XA
         BX+syKOwC8ksedUr2cFLsByOlL60qcyYCv4maWinBMJ5iOD4ABvThbAMuasYW7lME8mq
         yReCa6zCQsJjJsvse+nITQpA8A5tIpHeeDvzG+hGNC0RLKIfuGGyd3QgqjG/gr/q9gtd
         FhgAEwTfDq7pBhjjL04pp5EceF6gQ+u+F+KWWNlQ8wcHgSR4N7zVNXAdlht5buDmItna
         Cz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7NSaMPih6QOUP82WHU6NQ31QH1gOlM21BasjkTVa19l+62Q2RafAEx76j7JQg1VhsJGFBL9o5raY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+50c5O5Vi5ixEZWI7DaymbrVjhV3mrJoSIc8Of31P796EOOse
	F1KRYqQLeDmsPPSfPsR4WhBbwomWSTUC0qgUqui8fchuy9WYFiZgdh/JJlwUcg==
X-Gm-Gg: ASbGncsjCivDR0YzXCq8rWAV0qYVmC357YQh0Cczs1U4vjSqrBEnUdmP1VR+3sboA55
	sasbvXrRFZPmX7ClBpWai0p++obWTJOxq9I5fVrC+BDKckf4Y57RTWn898NzbiguZ2DszcJxTVu
	Gk+8PKsqNyFSHnPVvXY2DybZFntHq5KRevReGr/haw2mYpo4jqxic8K1umDm55TgvOKGX55kLfS
	eqG5IaZt2RyvT1lROoeUzVN6DLxrc8oVXlcL0X+hig4xKOx503UgJa84ozh4bsmfXpPPO4XdwhB
	5sNLRX8Ea50oY1Of0fUezhiCxejKAuw7o7xs6oDDD0QKc/tY3xDRhZmxQKCiv+YjyKsadFda/Qv
	orchQbBtPxLhdlE7+rmpYdG+Y+NiFZA==
X-Google-Smtp-Source: AGHT+IHG9M8dsl8a/5c2iKf4DeCxc3e4x9TGKI98uvWc4FeHEIm/jafTgU4rUUMSFPaMxy0PQD7T1w==
X-Received: by 2002:a05:6000:18ac:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-399739b9cd3mr1758535f8f.6.1742381604692;
        Wed, 19 Mar 2025 03:53:24 -0700 (PDT)
Message-ID: <11da3dfc-9370-469f-9616-6ed1fc883425@suse.com>
Date: Wed, 19 Mar 2025 11:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
Content-Language: en-US
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
In-Reply-To: <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 11:46, Jan Beulich wrote:
> On 19.03.2025 11:32, Jan Beulich wrote:
>> On 18.03.2025 18:35, Roger Pau Monne wrote:
>>> Relocations are now applied after having moved the trampoline,
>>
>> That's two entirely different sets of relocations, isn't it? What we generate
>> here is what is to be encoded in the PE binary's .reloc section, for the PE
>> loader to process. And for us to then process again once we move Xen back to
>> its linked position (by virtue of leaving physical mode). Therefore what
>> matters here is whether these relocations are still carried out while on the
>> page tables to boot loader created, or when already on page tables we control.
>> In the former case any relocation to a non-writable section would be liable
>> to fault when applied.
> 
> And yes - both calls to efi_arch_relocate_image() are ahead of switching page
> tables. The first call is benign - no writes occur there. The second call
> would cause #PF though for any relocs applied to .text or .rodata or .init.text
> or whatever else is non-writable.

Ah, no - .rodata is unaffected, due to it being writable as a result of also
containing all .data.ro_after_init contributions.

Jan

