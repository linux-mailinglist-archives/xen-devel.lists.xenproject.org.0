Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71FB398FB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098111.1452235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZRg-0003gt-R1; Thu, 28 Aug 2025 10:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098111.1452235; Thu, 28 Aug 2025 10:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZRg-0003eE-Mf; Thu, 28 Aug 2025 10:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1098111;
 Thu, 28 Aug 2025 10:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urZRe-0003e5-Fi
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:01:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4510c6e-83f5-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:01:23 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0c82eeso6103055e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:01:23 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b797ce2b8sm26527205e9.12.2025.08.28.03.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:01:22 -0700 (PDT)
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
X-Inumbo-ID: f4510c6e-83f5-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756375283; x=1756980083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgzn98Bf9jvAbIg45OxQt97Bwj6IaTgN1vtbEO85Mkc=;
        b=VwzirF+6t6HNiU6LxLyXa4to7WnYR2FpQJ7SUGoSjv/xn1hmI1uF5+GXo2OuXSwBQ4
         iW/2A5oNoI0JW9YAfWsKJcH7R43f4gOHgYInwbneYOtP7iUIfBSGCUVseLdOXLRatN+n
         gVS0axLBXQdEboTv6I6Uyzk4vSB3QpJc+wqGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756375283; x=1756980083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgzn98Bf9jvAbIg45OxQt97Bwj6IaTgN1vtbEO85Mkc=;
        b=iG6jCGrqusbIw7o53n5sIPeJgGrJS9M8wnmECisy7tYCThtIrqiDojPUKspYBEZtvp
         0kRgoWcnFj+wP7QGuhuRcf+qojKLRQsvfAdtwUrJaGXcVU5uCuliy0+Jiue4+KMCHjcX
         UUk5qZmQQ0JZDIyAGClCilXfdvpWKnijzqMG2Zd7xo80CxYHOZ4Ph7If+dl8Phx8EERw
         9+EoNZ3yzkuq2nKeWo76bJzQZLeIjrGQ7mZ113z/Ss5RJreoE0gdCWn+l2iPnB8kSG2x
         rNnDw28Sq2eza5MHl9couIEMm+KGBfGL71ufj8ZwKR2orsIkzjwZuD7Y9/75/h6oFBNX
         p35A==
X-Forwarded-Encrypted: i=1; AJvYcCUf6OWVVDQg3TXiRN/jCgsdHu0l1zWBSLJF57rxlddv2Vc9DPTcTcwW5hOPWHGtSqKO4KGS1lCLlAQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpZlyZiWaE2TtvzemaBa8LeBpe3apyhLEEIfnYJy22wvpOS8ok
	fTynVccDIguUo/GP/Yknd0Y+3eBsyXo/PvS5vhBi0PdQeMQQ24CTB6Ckz5PiZ5Wx4RI=
X-Gm-Gg: ASbGncvKQ2Hxa+HOecAeMJy2/FRWc+iWENzNCvx+PBJJVntCSpKCBMaQW7ZAxs0keIS
	zDo20lKpH974rVz3m3tHH7UYK65HR9SNhWAciFmHoym1nXRT5GcnWVcCF1vfOAyZfJUDyKX96cy
	Si262SJvg2+2IRpC5IxrrQnilTVBeUaK8+raPlL2JI+wpzbgtZBKT9uMdKmo9GkU+9P+4aJHKkI
	GwVa2+iu4MgY4DOAhAkZoTz0xC1z+NZykZ5V4WiE5xu0AllrEa2L8DeWHGDxsgWL5iQcg/F7IMk
	M5e19hv22XOADMM+V/Bi42TnqDvgxPuPgfZoLmFJ1u4cifrCvupJ/PpZSxXULNsdAXfiCgoN4hW
	UrbAwt9mBghWqloMO3kH7cd8AchrUjNeO+mWQBXjG3JlJnKX6JzOX3pcrgzvodOZp8wzIRQF4fh
	1fiHA=
X-Google-Smtp-Source: AGHT+IHu8a9TqXqB+DhNZBig9Ly6oWd4Tjbn4YE5nha8xmVUDy3F8hSvIAPOvHSpAVRQEDXXpPfW1A==
X-Received: by 2002:a05:600c:45d4:b0:459:e3a1:a0c4 with SMTP id 5b1f17b1804b1-45b517d27b2mr220906075e9.30.1756375283144;
        Thu, 28 Aug 2025 03:01:23 -0700 (PDT)
Message-ID: <50c15166-b3b5-4e17-8bcc-cb37ad03f0ad@citrix.com>
Date: Thu, 28 Aug 2025 11:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
 <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
 <1901e764-9725-4e9e-895a-54c704473510@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1901e764-9725-4e9e-895a-54c704473510@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2025 8:07 am, Jan Beulich wrote:
> On 27.08.2025 19:47, Andrew Cooper wrote:
>> On 22/08/2025 2:47 pm, Teddy Astie wrote:
>>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>>
>>> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
>>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
>>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>>
>>> $ cat /sys/hypervisor/uuid
>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>>> $ cat /sys/devices/virtual/dmi/id/product_serial
>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>
>>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>>> written in the table; which effectively fix this endianness mismatch with
>>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> This effectively changes the UUID seen with UEFI guests as it was
>>> actually inconsistent with SeaBIOS and SMBIOS expectations.
>>> ---
>> I agree this is a real bug and needs fixing.
> Hmm, I didn't realize this is a bug, and hence put the patch off as 4.22
> material. If there is a bug being fixed: Teddy, please add a Fixes: tag.

I'm not sure if this has a reasonable Fixes tag.

It's a combination of an ill-specified domain handle format, and using
an ill-specified version of the SMBios spec.

~Andrew

