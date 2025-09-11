Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449AB531AD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 14:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120118.1465188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwg1R-0004rm-GR; Thu, 11 Sep 2025 12:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120118.1465188; Thu, 11 Sep 2025 12:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwg1R-0004q2-Dg; Thu, 11 Sep 2025 12:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1120118;
 Thu, 11 Sep 2025 12:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwg1P-0004ps-UX
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 12:03:27 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530b73de-8f07-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 14:03:27 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so8086835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 05:03:27 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e016b5a16sm24440585e9.12.2025.09.11.05.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:03:25 -0700 (PDT)
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
X-Inumbo-ID: 530b73de-8f07-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757592206; x=1758197006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TNq70eBJGjUku1kl6S4ZWlnYQIdhEGvIwf2HGXsVXBA=;
        b=lwzZatexubpZxhfPhi9NhC3IWQs9fYSOhxaVgJNHsyE4Zo9yCARvXWkSp8lY67Kok6
         mJDsKD4mGrAvFDNgiDMfmJJNFcozpjaFBEwFRdqb1dR7nKFbyIBLkfeeO75MGAAUPwHk
         Y5rLd9zZuXTByizw8X/lFxGe/JFzYdE6wNsXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592206; x=1758197006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNq70eBJGjUku1kl6S4ZWlnYQIdhEGvIwf2HGXsVXBA=;
        b=Jxic/rmoZzaV0QgUuy1Bwzx92qdOWNiCqMZB6lFU9kCvu4BnNlG8iQEpHO/ep7GJQO
         Ant/nK97gto2faUmQXAN+/qLRkd6brmsumw8e7lh+kg/ArvdgEFCfZHBC/qkgSOBMhPV
         b+aSHRkfQ1JrPnRbhU+wJM7/6i73TxLBgxLLl32TroEdXm8my1YQweTZ7bbtZHigjK9l
         0ObgeMM+f99PevnqRzypUTh9KGg7KVlHkRlkc0UFNnmAv9AD9hgqc0NIki81XZjiN4yy
         R8egPUecfYe0qAvIbZR+nUDw3SVmspfAFUWDfhUqjKrPdQ5ID2VKBBElDbtqXgtyzC+M
         XVrw==
X-Forwarded-Encrypted: i=1; AJvYcCWOMP84A+u/T3gNmqwfYOz67FVTO6yj0RE3DeGpu/C5Eiyf2ce24U/1w69UtJ2GPndUgF6pLXXBeC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytKmP6Pru9w1fzEi9i+Y5rBRHjAtfJ021VsS06BPqCALil1xHb
	Bwy1jZm7H/ijflCVHnQgFsSxn4ZFLrbM19IdhjXRn751DU3aLgn1/DcYpzI0vwiQ7gw=
X-Gm-Gg: ASbGnctUeWH1If2qJTMI8CliME38pzGP6mgN68tNZL7ii4WbIequTVt9lsqJflAoCZ5
	1dfvVNYnanUIpO9J0UK6hZEAgUIti3LsblqDTXkhveo3L7N/ViTNusEm2jbfoXZnf93lLUJrHUq
	1iuE2JwnM0IzFh/f3rHHvKxFbRq9UUUm/Z5jQC6BN6JDJDsKAtJHLp9EjceL/jtiYTx7ShGmwIf
	Rqa48+x8KMGbawEerEqIXESDQOg1P2wXKYaXKiyVvPGWeYfqgrqw6ZtgT++wVeZoxKxGFLhrctH
	++bJb4kwzxOfpAcfROhc57qRJAIsQjyi9EA2unH1h2LXZUveqhpm9n4PSnULg14dLu7ryCfk6R9
	Kf1lmC/8F3V0rWWTzJBEC719350gzuc3u2FSgHy5HrrEsUVuBH92RGXxd9b31dW5yOTs/
X-Google-Smtp-Source: AGHT+IEWu4l3ou+sTPuGxSUbLYD3F14++0HjkAt2KSBW6zTA8F8AfQcygaIzwYmANYx07z0KYf4knA==
X-Received: by 2002:a05:600c:6305:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45ddded7652mr193370495e9.24.1757592206400;
        Thu, 11 Sep 2025 05:03:26 -0700 (PDT)
Message-ID: <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
Date: Thu, 11 Sep 2025 13:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2025 12:53 pm, Alejandro Vallejo wrote:
> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
> by the device model. The GPE handler checks this and compares it against
> the "online" flag on each MADT LAPIC entry, setting the flag to its
> related bit in the bitmap and adjusting the table's checksum.
>
> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
> reaches 128, even if that overflows the MADT into some other (hopefully
> mapped) memory. The reading isn't as problematic as the writing though.
>
> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
> then the bit where the "online" flag would be is flipped, thus
> corrupting that memory. And the MADT checksum gets adjusted for a flip
> that happened outside its range. It's all terrible.
>
> Note that this corruption happens regardless of the device-model being
> present or not, because even if the bitmap holds 0s, the overflowed
> memory might not at the bits corresponding to the "online" flag.
>
> This patch adjusts the DSDT so entries >=NCPUS are skipped.
>
> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> Half RFC. Not thoroughly untested. Pipeline is green, but none of this is tested
> there.
>
> v2:
>   * New patch with the general fix for HVM too. Turns out the correction
>     logic was buggy after all.

Hmm, this does sound rather more serious.  I have a nagging feeling that
until recently we always wrote 128 MADT entries.

So, while this looks like a good fix, I think we might want a second
Fixes tag.

~Andrew

