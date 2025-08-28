Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA6B399EB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098305.1452394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZuM-0000dD-4E; Thu, 28 Aug 2025 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098305.1452394; Thu, 28 Aug 2025 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZuM-0000bi-1V; Thu, 28 Aug 2025 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1098305;
 Thu, 28 Aug 2025 10:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urZuK-0000a2-54
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:31:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18e7481a-83fa-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:31:03 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b6b5ccad6so4063125e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:31:03 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70ea81d38sm25050829f8f.17.2025.08.28.03.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:31:02 -0700 (PDT)
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
X-Inumbo-ID: 18e7481a-83fa-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756377063; x=1756981863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPM8AkYtXLXH+CNRhXcUGcMq/7mlT3bYJ0nkmw1ljd8=;
        b=F0CP0+Lb5h26vvbWwEMddtouDYSSz9LujcOGVBN9hVdv1Jb3vftQtIGDFR1BBxciye
         rxET93vhnzemnB1Y1LtTuliKWncRyt7OB+H2u1c1EMHLtoe8OqrJM1IH211UgeFF7OFJ
         WE9Cx77Spb+90PV/qV3jMcIVgprFiO6LBu70U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377063; x=1756981863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPM8AkYtXLXH+CNRhXcUGcMq/7mlT3bYJ0nkmw1ljd8=;
        b=G+Xh3ktis2gw8CNvhaABZVSCsnK/Pe/6U2Jp1kj5u1djSD1Y9i8GRWZV3L3ORDniLJ
         lIjAXjSQbvuwCRKoIBhU4fRr62es/kYl4PL0lvf2Y58fLOOqgtxc6QTEKv/p7361g6Ec
         gUI3Yr2qgqPekH3Oik4Jj7kvmTgTJaXvyD5Bp+iWqET9rBkGoGguSyu77FSIW9iBbi2J
         fP/cdyzztch3+jpI8SV90NMIxz4P9oFOPDS6eYpruOMi10KX81S4rrY9zirPLQvAJHd4
         fTyam9c3RNmmL+6Lx/L5p2ho9LPwrkd4YAgm0mKL/ya9BtI5f4eAe46HXtiZl/H2MImk
         XH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0y+h2Jmzq4u7eyD4sq6e6QpQUfaLfE9oBWy0B6CCv5ooknmtBBTYxcavsW8coMD5E6Qu17R/Wg9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEJ9QSk0eSXFQG0jB1VYu68JyjpKfYkBKJNZQvqZZcZE3/d6Xr
	GWVnR9SYWOU5CUKDIKpPuo9qSrKi1pprtIcUkosV0q8RmKGussJXFYh95TkBbqDSTBQ=
X-Gm-Gg: ASbGncvOs/zskxfng243Aq0NRJRyA39zK32m0eDhHCxCg+UNWMstASbMudEVTLRIsQV
	yRnvKrDlO66jDdAxVTwlptmjrpIoz5kwAhtEtjCczc4PHi8L4vCJ4fktOjaEGmh4JQ8dLa9O+hi
	d4eDvrsHyc5ROWQIS7ISH2CSaLikhBVO/D93j+r8lRiuzhPCWspw1kRktn+9w43niOkC6R2Bph7
	cyxeLPCwx1M7KOVDuO3KRNTR0cFsC4CEn9TC53e7Jd91UnWvRy+m8Ebwy3OJhgLfNDXBrJX0JPj
	j92EbXYHjCRqC429GMMDmCNOa0BRV5Unzp5yg27FDMvf6XjysZhl/ikJCzeVH8OCffryY3aj/jy
	VTPE3VwRPssqQ0QVjz5KADfrT7BIEghYfP+tSCebjNfAboCuE9YngkgWLHz/1hXVso1IFgMJwAO
	Fshe0=
X-Google-Smtp-Source: AGHT+IF7gU1fWTKNirWq4ph+Hp5Z7m5IImEMoHsugUuN39l+nbwYnMrKeRMZymR7pxBXxzKGrBuRJA==
X-Received: by 2002:a05:600c:4748:b0:45b:47e1:ef66 with SMTP id 5b1f17b1804b1-45b517dae4fmr191672425e9.37.1756377062577;
        Thu, 28 Aug 2025 03:31:02 -0700 (PDT)
Message-ID: <bad9ece4-a95d-4fc1-83b2-dc382f9db438@citrix.com>
Date: Thu, 28 Aug 2025 11:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
 <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
 <1901e764-9725-4e9e-895a-54c704473510@suse.com>
 <50c15166-b3b5-4e17-8bcc-cb37ad03f0ad@citrix.com>
 <e24606c1-3f54-44aa-a78c-6cb36be3d5f3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e24606c1-3f54-44aa-a78c-6cb36be3d5f3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2025 11:22 am, Jan Beulich wrote:
> On 28.08.2025 12:01, Andrew Cooper wrote:
>> On 28/08/2025 8:07 am, Jan Beulich wrote:
>>> On 27.08.2025 19:47, Andrew Cooper wrote:
>>>> On 22/08/2025 2:47 pm, Teddy Astie wrote:
>>>>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>>>>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>>>>
>>>>> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
>>>>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
>>>>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>>>>
>>>>> $ cat /sys/hypervisor/uuid
>>>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>>>>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>>>>> $ cat /sys/devices/virtual/dmi/id/product_serial
>>>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>>>
>>>>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>>>>> written in the table; which effectively fix this endianness mismatch with
>>>>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>>>>>
>>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>>> ---
>>>>> This effectively changes the UUID seen with UEFI guests as it was
>>>>> actually inconsistent with SeaBIOS and SMBIOS expectations.
>>>>> ---
>>>> I agree this is a real bug and needs fixing.
>>> Hmm, I didn't realize this is a bug, and hence put the patch off as 4.22
>>> material. If there is a bug being fixed: Teddy, please add a Fixes: tag.
>> I'm not sure if this has a reasonable Fixes tag.
>>
>> It's a combination of an ill-specified domain handle format, and using
>> an ill-specified version of the SMBios spec.
> But the problem was still introduced into the code base at some point. Afaict
> in c683914ef913 ("Add code to generate SMBIOS tables to hvmloader"), i.e. when
> smbios.c was first added.

The thing that changed was the SMBios spec, in version 2.6.  It went
from having an ill-defined statement of what a UUID was (and for which
Xen's code was a valid interpretation), to stating a MSFT GUID format.

~Andrew

