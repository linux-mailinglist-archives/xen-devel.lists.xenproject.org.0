Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27679ABF7DE
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991942.1375730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkTq-0006f5-9v; Wed, 21 May 2025 14:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991942.1375730; Wed, 21 May 2025 14:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkTq-0006d0-6f; Wed, 21 May 2025 14:31:38 +0000
Received: by outflank-mailman (input) for mailman id 991942;
 Wed, 21 May 2025 14:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHkTo-0006cW-V3
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:31:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd2aa49-3650-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:31:36 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso1185761066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:31:36 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06ddd6sm925802366b.55.2025.05.21.07.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 07:31:34 -0700 (PDT)
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
X-Inumbo-ID: 4cd2aa49-3650-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747837896; x=1748442696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qayd1Jk1yQEMeBqLuKl2cbOb86FMBCDqSXk5OE5RkPM=;
        b=Kmxv1xmHxWuxCATUZhNMXpVBAm+3nSTmLDBxfaGzTjOdp89XQrg0kM7KtAXY8SDSa7
         y9u+BMhCLAGBKTymEj+JLMIIxR/WwZ+tHMICrGMA+FNC1hRkgsbFhPmZUgqMDiro14Xp
         opuMktdVxVDDy4bQxMGI16oVmqlVFFUuCJ6uZ83dSCfevxCnthdzYhP8zVhNyacD3W7q
         nACrMmego/fHzKDHYpvhTEPmEGfshD7oH7yGfjUI/sFM2j4ZeyWSPY532Sx4pLwDy6fp
         bmTVkoh6nVZcWWkJ5GRimVqZvjsL5tF61/1iKypPQ73vILMrT8HExxOHl5lr9dOC97Vh
         E1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747837896; x=1748442696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qayd1Jk1yQEMeBqLuKl2cbOb86FMBCDqSXk5OE5RkPM=;
        b=rO1oOhfarJyKFlcpvDr2/GvRp8pCHYBlRBLgL2K88iobng2uDJbmrEcnl9+oa3QV9J
         zMS19g2xeRfErAg7zi9vcFtQNzfhXlyyoQ+LlTvrH9VptmWRJgtD8Xx3tl3oP40JPI/c
         QthrLqAbFS+4wz9JY9epP5A8d9duAQQkgvVsaFcTmRNq8AMDVJ7HntKpLLcXfWnp9lLX
         fZufCKATTmYWwdVjroiGotPHs14TvzdKzXkBEC4iIfIkqzFkH4reidjzoYpnPWfRfYRO
         X2pXcUy2tHw9MdPtaSGFhQWn4AbXRyXQzoA3EmQHHdxP8LCvlN1QjiNhc/TZOmGZmKA9
         rsgw==
X-Forwarded-Encrypted: i=1; AJvYcCXBcb+w0mfgAhaGL1DVMaN0c+LODzIoXr+UJHbn55wcSUPG5FZ/Lf9GjKoC2e4EW5w6Iv3KguULagU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyikJmzdBzXruu7ZBkxffesnUKM8DfDqjQo9xtsznfJM8V6O7Hd
	pUSwCd7BQHf+oBmstEnIGZ/loICHq+ubQJh53/+CLxRDVFS1y+49VPQNnucKdTyhBw==
X-Gm-Gg: ASbGnctTuMSSvcHem7mlHSmv+lyzkp8NO8dRVNW6qDH/vJtREi6dSHmPAUGkptqrbFE
	atEdYsjjlntOtaa6st4Ey4lHiVP+39yEVdvZmXLPOlXl6WmTZ3edILhQ++vOv6uj9AJcZNUl+aS
	ToIV+pUIxRjHeAoa/9zUbmHYaztXIr28M+jz3/Rq4cL0f9h+fQNy3Td3RUAPZaxg0xG4fkinkp2
	WYm0IRCe1w5wtR89ZCyioSdJiYxWMmQSAU6WpXV0KS9jVym6Ie35VfG+O3mVGd3hpxO0JP7qqU4
	TzDHpGUAmgiGgH5sH5jZox1vI38V4sIQlmQ9D/YGcp2NdBq7P7mR5zUEQQ+2jQ==
X-Google-Smtp-Source: AGHT+IGdw2z4gTLtYAfPbaAbIEw2ojJuFUR5PV0MeMXPocW/z/vj3aSW/gP+hCD6huk3EDxRMQAWPQ==
X-Received: by 2002:a17:907:f496:b0:ad4:d0bf:f4a9 with SMTP id a640c23a62f3a-ad52d4cd771mr1864721266b.21.1747837895602;
        Wed, 21 May 2025 07:31:35 -0700 (PDT)
Message-ID: <4ea08d6d-c2e1-40ad-a31e-554e7bb5cc6c@suse.com>
Date: Wed, 21 May 2025 16:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Victor M Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org
References: <20250516083159.61945-1-roger.pau@citrix.com>
 <7bbc1569-672e-42a7-a5b8-4187282fcb18@suse.com>
 <aC26W4Brxl-laNif@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aC26W4Brxl-laNif@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2025 13:34, Roger Pau Monné wrote:
> On Wed, May 21, 2025 at 10:29:26AM +0200, Jan Beulich wrote:
>> On 16.05.2025 10:31, Roger Pau Monne wrote:
>>> For once the message printed when a BAR overlaps with a non-hole regions is
>>> not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
>>> is quite likely overlapping with a reserved region in the memory map, and
>>> already mapped as by default all reserved regions are identity mapped in
>>> the p2m.  Fix the message so it just warns about the overlap, without
>>> mentioning that the BAR won't be mapped, as this has caused confusion in
>>> the past.
>>
>> I was trying to get back to this, but my attempt to use this "fixed
>> message" as an anchor failed: You don't modify any existing message, and
>> hence I was unable to determine which other message you refer to here.
>> None of the ones I looked at appear to fit this description.
> 
> OK, it's a bit tricky.  Note how the new implementation of
> pci_check_bar() unconditionally returns true, which means the message
> in modify_bars() will never be printed on x86.  Instead a slightly
> different warning message is printed in the x86 implementation of
> pci_check_bar().
> 
> That's what the above paragraph attempts to explain.
> 
> Maybe I need to adjust the last sentence so it's:
> 
> "Avoiding printing the warning message in modify_bars(), and instead
> print a more lax message in the x86 implementation of pci_check_bar()
> to note the current BAR position overlaps with non-hole region(s)."
> 
> Does the above make it a bit clearer?

Yes, it definitely does. And with use of that I'm now also feeling reasonably
confident to offer
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

