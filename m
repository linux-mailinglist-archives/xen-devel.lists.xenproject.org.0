Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346BA83937
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 08:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944884.1343186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2lOJ-0004yV-Gk; Thu, 10 Apr 2025 06:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944884.1343186; Thu, 10 Apr 2025 06:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2lOJ-0004vq-BI; Thu, 10 Apr 2025 06:27:59 +0000
Received: by outflank-mailman (input) for mailman id 944884;
 Thu, 10 Apr 2025 06:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2lOH-0004vj-Fl
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 06:27:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed9ac316-15d4-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 08:27:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so272666f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 23:27:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89362fbfsm3762894f8f.13.2025.04.09.23.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 23:27:50 -0700 (PDT)
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
X-Inumbo-ID: ed9ac316-15d4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744266471; x=1744871271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7W+30oyUtP2UW9K/V3HqdmoS8/ihSVVZkzIjQf+ZbQ=;
        b=WKU5f8n9RNiW7ML95sQ5zcDNmCTeZBl1H1ozYZ9wt5yRyKqxTnBC7qJXjLz5kbcDrz
         vZ/oxgj0OUkwZjgmbJ/XRdhK/0CQAuS83h/8oagrOzI8XEWvo3Ql/L13ELQSApRcVNiz
         gRKChyrpFFraUzA2HtiuCM6gvesfmPACcJ9oDWVeLqDL6jTeJPkAvxGjMyPz0sJNNBqk
         v5i5VHaCY6JHwXT+yXN3FXEtRN3BxgceeCjnTPQnkT9B0g+70pjIgD7E0pNxN3NzU5lB
         BCmlAyg+gVqQOkTbtLsGW6pkWuAAG9dvJv7XOxDUsD9ZVkXO6mFYtAMBi5PZZd+ggoBR
         6xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266471; x=1744871271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7W+30oyUtP2UW9K/V3HqdmoS8/ihSVVZkzIjQf+ZbQ=;
        b=Dos13AWnCRf1znOcOSeDE0BaiJnSPO+GkxdZGN+wK7kBZN0f/R0yj3sKkkcvJAvHEx
         /OjvrHUsb7vLBYENgmQozllw4cKo+zydOhVpPW4PZP7YYHUgIdbe+KpLaFsEc2yK239+
         9MiigEcmKvH85ivJ17Ekd1pfA+cB1J93UWs3BpCRZfKx6oYyIm/dUMvd4uhDmK+0x0zt
         JM43OmQXQdwuDuTbfxoijfDDKmWob5Kk0O3QJSdsydW/6oV3lmZ6ahoXkdLa0dHRAaY2
         JLuRq6NA/l6puNntPM1dujdpxocl7XjZ4E74soczcqxhsl2yQJ2LHoNBfDZBTu2qzTHm
         2cCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf1pgyRaKnb7Sul5U+O4C7KKyHrk0QQfQenMHFlyqB9PkCZ0USu5aO/7suykcshhIMzr3A2zCr4bI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVE2OuxxEVp66eWIWXFrF/nM5W8e3yQMju2WMHWcmTBEwzdRAw
	1hbicgdMUj1Ax/G8+wlXNIovIQhksrmLXDhG9gXQKA9t0X9LpM+zzVrw5UrOiA==
X-Gm-Gg: ASbGnctdI4oY57vZRUH7bO2CPGdxqpqxvlDd1YH+0uBP8S4V4v3rBWXwUrJb5AvkTDl
	zmwkcrdz9cT0OfY3W5OYJv6CC4/hlDiFNYcD3Py22PoO2Cc+G4f9VeK+2UjV5yLEAjEfOsLXXPz
	tcKq6BLeeoi/zQwv72wVOUIV2haZ/UWyLrXi6X9SNKOATG7b1jbRVw16nWRnoPf/G5YuS4u4qvA
	wmmle2O3ZzK16R+GGoB+5DFkg2TaX0ZMtGVYO2Io32NWXQScPzlfN6lV2UCFtmUOe0Pzdl+N+4A
	sJTjVRw1akW2wxLeiYX+05orLimwWbb/WNJeO5K/1V7VolWUTQ3ZVIR2NkJrDeKSRWISgGRLrn1
	THcqAvmb9w323wk2nrqTaZS1xa7/OfnXHWgyk
X-Google-Smtp-Source: AGHT+IG1Ajzd+q6omwd33ZaTirfargnMms0ksAY2uPv4TpCk5mpBi0zGyLRT7UeDBFRL3EJ/EOz0ag==
X-Received: by 2002:a05:6000:1a87:b0:390:f358:85db with SMTP id ffacd0b85a97d-39d8fd8c84bmr827763f8f.30.1744266470748;
        Wed, 09 Apr 2025 23:27:50 -0700 (PDT)
Message-ID: <d0d6cdf2-e436-4a72-8a02-5ec331cc950d@suse.com>
Date: Thu, 10 Apr 2025 08:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
 <Z_ZOWAttoFNoFYCV@macbook.lan>
 <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
 <Z_Z3PYYSBH3QWioF@macbook.lan>
 <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>
 <Z_Z9unJ-wS2dXxUV@macbook.lan>
 <b1e8e761-ddf9-4e4f-b5bb-624b2e7d012c@suse.com>
 <Z_aTYmiOLEfKTend@macbook.lan>
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
In-Reply-To: <Z_aTYmiOLEfKTend@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2025 17:33, Roger Pau Monné wrote:
> On Wed, Apr 09, 2025 at 04:08:47PM +0200, Jan Beulich wrote:
>> On 09.04.2025 16:01, Roger Pau Monné wrote:
>>>  As I understand the checks done in
>>> mmio_ro_emulated_write() are to ensure correctness, but carrying the
>>> access even when the %cr2 check fail wouldn't cause issues to Xen
>>> itself?
>>
>> Well, "wouldn't" is too strong for my taste, "shouldn't" would fit. The
>> checking is there to avoid guests playing games. Whether that prevents
>> merely in-guest just-bugs or actual XSAs we can't know until we find a
>> case where the game playing might make us do something wrong. I expect
>> it's unlikely for Xen itself to be affected. But an in-guest privilege
>> escalation would already be bad enough.
> 
> I see.  That was kind of my understanding of the checks.  At least on
> HVM it feels a bit weird to handle r/o regions this way.  It would IMO
> be more natural to use an hvm_io_handler, but that's maybe because I'm
> more familiar with those.

I guess this would be an option; I assume it's the way it is because PVHv1
inherited it from PV, and PVHv2 inherited it from PVHv1.

> And in that regard, hvm_io_handler don't seem to do any of the extra
> checking that mmio_ro_emulated_write() does with the %cr2, but maybe
> that's done by some higher layer?  AFAICT that would ultimately get
> called by hvmemul_read(), and there are no checks there at all.

That more general framework isn't page-fault specific, and hence there's
no CR2 recorded to check against.

Jan

