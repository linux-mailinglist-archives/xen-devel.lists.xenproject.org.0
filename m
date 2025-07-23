Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FEB0F54C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054248.1422976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaTo-00007w-8A; Wed, 23 Jul 2025 14:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054248.1422976; Wed, 23 Jul 2025 14:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaTo-000065-5B; Wed, 23 Jul 2025 14:30:00 +0000
Received: by outflank-mailman (input) for mailman id 1054248;
 Wed, 23 Jul 2025 14:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueaTn-00005z-1t
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:29:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817031a4-67d1-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:29:56 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso4104988f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:29:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e51a66bd9sm1824124a91.24.2025.07.23.07.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:29:55 -0700 (PDT)
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
X-Inumbo-ID: 817031a4-67d1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753280996; x=1753885796; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RUIvX5TJlEo9wtMbcVJNVC9tdgpxbhlmEzHi///yLK4=;
        b=W3pwBNvxwHKly3Qcf8eyPv9PSrnEhUXUqR81du21RDAlkFrIDQ+0qOhdRNq47aTgus
         OPFUUIo/UHVRXvnbpj7rDyOMhIHE6sCVgxUqvmuYXmEB7SEmnyigDWLIUk4Mb7xPtmkZ
         cNQApJB/3t9/XA3P7nvTm/+RW+evM6ZylpDgLIUIwy3EBk2uNzjZHOiaWy1TMKjtolEF
         fkunMBFfgNGYA5e0Y6FepIsrGtROqgk4iQAe1oJWa3QPacBWVBHSORmS1rqbWNMTikq7
         jeXUmr+xSEwToMG4gZjxSfsgx2gDUD/2BEu0fvKVW/2CEjAxqNThj1q7o57yySwvV3fz
         zaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280996; x=1753885796;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUIvX5TJlEo9wtMbcVJNVC9tdgpxbhlmEzHi///yLK4=;
        b=wECjtWH6XjHyGsq1b8r+dvg8qIdu14ivIeXzeHjPSjOtTd2ag6yq2W0zhnb9o7cV6s
         7mWhbC2KfqxP9SqN8v8hkyO2ki/J53nvDrdhBInul3EZm/vrhL9S+zPCXsOmZ546Axv1
         dBk4KiVbkDiE/rnqZ/4zLBt73M/8QzxUYGNwrRXXyLymZ3B0xPUXnQQTC3nZewMltD2f
         AdL4mKiEnai211WGuT3X2uyC/6ochkARoZlON9F4uYiZ0jSw6rLDdqMxKc6xOf+pgA2t
         mCyTHpq2uWNZGLFUbt6W1KMKk7e/t3hlQEZ0BdKFpZMvED9YDEqvCbZj3Th8FuP5QRfc
         brkw==
X-Forwarded-Encrypted: i=1; AJvYcCUVs0jphJOJEsWFy+brWQhnG/pivnsaKZySx6REkxJ5eZCbTioh6VcZAhGiDU8hzFbd87blCTcsv9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxZobseUJoJGVNGlWXytA0SajbBH87ciCauOZaowSGcGafi3Dh
	7XAkspYPoRwrY/XUyIlPhLMAcDmmEZNPO5UGWX+r1Y9HVcL92gdCV8vbL68wvN6GtQ==
X-Gm-Gg: ASbGncv5DejpNQslgnhdggMZ9HFj+HiOU9AcQEfLd9BSUrS5G9BYl3P6NsdY79c/4IF
	87OOxN24cWclrTBNKPYgPUmq/hWaIkrQpXEW2mMQUqxjQZR2UnSSbAYt69J6AY/EHHsZpR8gVLS
	sWq9PgazlXg4Bn/hKnfoCAvoMcf9RR1ddjwOXexjeKDHilwNq5SEftsNagh+Yqt/38ttim/BsNd
	taEMFKHyslXs6sMCTK0eJ5TkUuBvmG89i2ec7CjTDJ5L5jxQaZirVcrS2OoQ4XiisJRnEzS+1Y8
	xB56ZgY6C0kk/IXemindFxn9KAyQDKLLDhgs6qH1SYybDYU+EZ5/EXfY6qgQNvwGYwbkHUrPMzp
	0hXbMi4zneIPunGyhXx5FF89a7WQlhX9CM4s9tgAUTvGlFQwroB/qzci94NfLP3MqYVGtviB3MU
	Wmb5sL9g8Dr05R0fB+ww==
X-Google-Smtp-Source: AGHT+IHuJg6/G4JR2zRpAmeU0Bk+7cfiri2h9HZR8QcXLKDnmMuqbOSDGMrHF7cUJl849Id+kaF7Ww==
X-Received: by 2002:a05:6000:2303:b0:3b5:dfcb:8fee with SMTP id ffacd0b85a97d-3b768f03091mr2663559f8f.41.1753280996000;
        Wed, 23 Jul 2025 07:29:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------wdDVtgAhTH2YR333pn8u4OfD"
Message-ID: <96575ed2-b1aa-4be7-bccb-3f8914677eb6@suse.com>
Date: Wed, 23 Jul 2025 16:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>

This is a multi-part message in MIME format.
--------------wdDVtgAhTH2YR333pn8u4OfD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:05, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Oh, also - can you please avoid Cc-ing (or even having as To: as you had
it here) email addresses that will reject replies (see attached)?

Jan
--------------wdDVtgAhTH2YR333pn8u4OfD
Content-Type: message/rfc822; name="Delivery Status Notification
 (Failure).eml"
Content-Disposition: attachment; filename="Delivery Status Notification
 (Failure).eml"
Content-Transfer-Encoding: 7bit

X-Mozilla-Status: 0001
X-Mozilla-Status2: 00000000
Delivered-To: jbeulich@suse.com
Received: by 2002:a05:6520:5c8:b0:2cb:4b14:9c99 with SMTP id r8csp263947lkr;
        Wed, 23 Jul 2025 07:27:29 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8f:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3b7634e4deemr6216533f8f.18.1753280849283;
        Wed, 23 Jul 2025 07:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1753280849; cv=none;
        d=google.com; s=arc-20240605;
        b=j1Kn+NAfGZ1mHmilwSA1ItpPDhvUrcPCt2GPKk+uaNVhxmyNyu6PsokRJejthpzsap
         42fDpdMZ9cI+HgyC5HpVz+Tw2Axwn6CQZnbXuih7RMB7FsTFBo+Z2cxC1PeS25TNPZ5R
         PHPJ0uPqDr5WejSnCZv9i9WkarSDLWTnoKaRqL8VvOPm8pwCycpDhoT96+FWUlYZd3lV
         DI6MR3AprHOn+a9dYkuH7yYy4kJ+Yo9AVWxyZFEFM/3oE2/ovi1GiLc+tbR8rQVgFVFn
         oW8zviXA0XasGTOubh7tFOUBmm89bOLd05XHvEHSQC7aSN7BIlSAHMXMjKbiRSNtnna4
         cFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:references:subject:from:date:message-id:auto-submitted
         :to:dkim-signature;
        bh=wJ47Bdqmnplm4mxLVEz8cCI30zRuG8c8LRvzDR2mxX4=;
        fh=1F3UM0FYF+P+9KQLobQQV/FcbYgLvya74ksf/MgpYhI=;
        b=eqDpGWuCTFi89swQNx/dQ3G/4DZkEnb+RddWOUrKv4HTqG7mbNcZ6bqB0ZmZ6xiEl3
         b8EMyfANyv5zaTHrz3Qlq5VpuHFtC1w2TlEcGG+/U6gWZwqJHEKayVuwsC8jIUPkSVEK
         5M1Hf94PJUQRIXVGIU5lEeA9610VawzOLKPEjXvtVsjiQp1XjipRq/xda1K3SRrLUQ9X
         5E9/x75giIQ6ZxjjOxRBGKB4U/aVto9UROG+vnnuF3y36h8Sv70zW7FGjbwoeHeXRP3L
         8CLYygBiUI/OJ8ScPsAq7p0ihZzrWun5lXhW1hdRMtyWUuqg0hDJ3XjrTvIx6RCxq0JJ
         4+Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@googlemail.com header.s=20230601 header.b=XkL4SKhL;
       spf=none (google.com: postmaster@mail-sor-f69.google.com does not designate permitted sender hosts) smtp.helo=mail-sor-f69.google.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=googlemail.com;
       dara=pass header.i=@suse.com
Return-Path: <>
Received: from mail-sor-f69.google.com (mail-sor-f69.google.com. [209.85.220.69])
        by mx.google.com with SMTPS id ffacd0b85a97d-3b7641fed89sor1506395f8f.5.2025.07.23.07.27.29
        for <jbeulich@suse.com>
        (Google Transport Security);
        Wed, 23 Jul 2025 07:27:29 -0700 (PDT)
Received-SPF: none (google.com: postmaster@mail-sor-f69.google.com does not designate permitted sender hosts) client-ip=209.85.220.69;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@googlemail.com header.s=20230601 header.b=XkL4SKhL;
       spf=none (google.com: postmaster@mail-sor-f69.google.com does not designate permitted sender hosts) smtp.helo=mail-sor-f69.google.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=googlemail.com;
       dara=pass header.i=@suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753280849; x=1753885649; darn=suse.com;
        h=in-reply-to:references:subject:from:date:message-id:auto-submitted
         :to:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ47Bdqmnplm4mxLVEz8cCI30zRuG8c8LRvzDR2mxX4=;
        b=XkL4SKhLQ0Dc7uwEAP+czsmzmeDVwCmW+IDI0gRW7EhrWPXRPR3TVcJnBStm95e4kX
         YZMfwtiEGSUiqoOjjAyiRdeg+CDAfW7V700hgos55vBAgFGyqnbr2Y7dbz27jRO3u2uH
         aD6swYt3b/r5yonMpHXSCKX8bXFfOQ+MrbCEl7nXdzuZoQm4RIO1EgP2AEXG04FdFOD9
         nck/BsaJLeeYTOZsHc/SK8eHM9XfDltPQwjlpVrMlODzUH7BFaKNkL8aGBIC2A7E8mtg
         whRvmYBI/0DWP9YGtlmljpW3h02xvNqPuwbENWCeWhbXLbr3D1exFzFw5v1iD0++7Wq2
         xYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280849; x=1753885649;
        h=in-reply-to:references:subject:from:date:message-id:auto-submitted
         :to:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ47Bdqmnplm4mxLVEz8cCI30zRuG8c8LRvzDR2mxX4=;
        b=KjKUuJnK/z136Qx21AnMNKDvy1Hi0e4jXzQ5NF9cUmZI6IxnyfN6ZWVcZa3k1ZaIFW
         jjRMapZxamOA294/+GxdaHhq+McvYGVBq8bEdnXv0lmUGT3YCNoj/Vxd7PuBZ77HxnCe
         ku/ZKPOddM3UosZhXEhZuZUqdZXiiMnO52XrQLl7MnpFeC1rT7ErAz3oHqU7eNyrE7QD
         VHMrpwEyJoKP++WsAWWoi4uYG83QACwl0Av6JTeuLSUftrNjs6ntP+P8/ZM4AMXnIYf4
         BrwgV6y9+tw+g43/6mL9ohJ81in7yGU/aw2be07GpofuANqSnljDia/SGTd32P8/pNjf
         vtBg==
X-Gm-Message-State: AOJu0YycwyQN+kZiFps2kE+GctpSvF0HDYOVhDNLCHaFGf9GWkFMs2K7
	nrJ7ZLdAtJ/F3iwbAoOB3s7oRXBcbKzjB2qw31NK+quunROE5zilpEUo/Ex9X07BQ95rUIOHn6f
	3iTpCIVqrzqd9bFu5g3lsyvhv3i2ttg1iYggZZWfsq4DxJ89DkKq7kdAzSQ==
X-Google-Smtp-Source: AGHT+IHm1nykuIf13M+fyPc4ApedcERKDQN4d1qHc6/VHWFws0F8o783hP1abYkH5TjFdP4awgiTJ6Luh71eBwYWCXuK6WzqG9CMHlc=
X-Received: by 2002:a05:6000:288e:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3b768f2e267mr2292204f8f.52.1753280849061;
        Wed, 23 Jul 2025 07:27:29 -0700 (PDT)
Content-Type: multipart/report; boundary="00000000000032ff9a063a99824d"; report-type=delivery-status
To: jbeulich@suse.com
Received: by 2002:a05:6000:288e:b0:391:3aaf:1d5f with SMTP id
 ffacd0b85a97d-3b768f2e267mr1967402f8f.52; Wed, 23 Jul 2025 07:27:29 -0700 (PDT)
Return-Path: <>
Auto-Submitted: auto-replied
Message-ID: <6880f151.050a0220.3414c9.27f3.GMR@mx.google.com>
Date: Wed, 23 Jul 2025 07:27:29 -0700 (PDT)
From: Mail Delivery Subsystem <mailer-daemon@googlemail.com>
Subject: Delivery Status Notification (Failure)
References: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
 <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
In-Reply-To: <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
X-Failed-Recipients: amd-xen-safety@groups.io

--00000000000032ff9a063a99824d
Content-Type: multipart/related; boundary="00000000000033222b063a998286"

--00000000000033222b063a998286
Content-Type: multipart/alternative; boundary="000000000000332237063a998287"

--000000000000332237063a998287
Content-Type: text/plain; charset="UTF-8"


** Address not found **

Your message wasn't delivered to amd-xen-safety@groups.io because the address couldn't be found, or is unable to receive mail.

Learn more here: https://groups.io/g/amd-xen-safety
(Warning: This link will take you to a third-party site)

The response from the remote server was:
510 5.1.1 Your email address, jbeulich@suse.com, is not subscribed to that group. To subscribe, send an email to amd-xen-safety+subscribe@groups.io, or visit https://groups.io/g/amd-xen-safety

--000000000000332237063a998287
Content-Type: text/html; charset="UTF-8"


<html>
<head>
<style>
* {
font-family:Roboto, "Helvetica Neue", Helvetica, Arial, sans-serif;
}
</style>
</head>
<body>
<table cellpadding="0" cellspacing="0" class="email-wrapper" style="padding-top:32px;background-color:#ffffff;"><tbody>
<tr><td>
<table cellpadding=0 cellspacing=0><tbody>
<tr><td style="max-width:560px;padding:24px 24px 32px;background-color:#fafafa;border:1px solid #e0e0e0;border-radius:2px">
<img style="padding:0 24px 16px 0;float:left" width=72 height=72 alt="Error Icon" src="cid:icon.png">
<table style="min-width:272px;padding-top:8px"><tbody>
<tr><td><h2 style="font-size:20px;color:#212121;font-weight:bold;margin:0">
Address not found
</h2></td></tr>
<tr><td style="padding-top:20px;color:#757575;font-size:16px;font-weight:normal;text-align:left">
Your message wasn't delivered to <a style='color:#212121;text-decoration:none'><b>amd-xen-safety@groups.io</b></a> because the address couldn't be found, or is unable to receive mail.
</td></tr>
<tr><td style="padding-top:24px;color:#4285F4;font-size:14px;font-weight:bold;text-align:left">
<a style="text-decoration:none" href="https://groups.io/g/amd-xen-safety">LEARN MORE</a>
</td></tr>
<tr><td style="margin-top:8px;font-style:italic;font-size:12px;color:#757575">
<img style="padding:0 4 0 0;float:left" width=12 height=12 alt="Warning" src="cid:warning_triangle.png">
This link will take you to a third-party site
</td></tr>
</tbody></table>
</td></tr>
</tbody></table>
</td></tr>
<tr style="border:none;background-color:#fff;font-size:12.8px;width:90%">
<td align="left" style="padding:48px 10px">
The response from the remote server was:<br/>
<p style="font-family:monospace">
510 5.1.1 Your email address, jbeulich@suse.com, is not subscribed to that group. To subscribe, send an email to amd-xen-safety+subscribe@groups.io, or visit https://groups.io/g/amd-xen-safety
</p>
</td>
</tr>
</tbody></table>
</body>
</html>

--000000000000332237063a998287--
--00000000000033222b063a998286
Content-Type: image/png; name="icon.png"
Content-Disposition: attachment; filename="icon.png"
Content-Transfer-Encoding: base64
Content-ID: <icon.png>

iVBORw0KGgoAAAANSUhEUgAAAJAAAACQCAYAAADnRuK4AAAACXBIWXMAABYlAAAWJQFJUiTwAAAA
GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABTdJREFUeNrsnD9sFEcUh5+PRMqZ
yA0SPhAUQAQFUkyTgiBASARo6QApqVIkfdxGFJFSgGhJAUIiBaQB0ZIOKVCkwUgURjIg2fxL4kS+
YDvkbC/388bi8N16Z4/d7J/5PsniuD3fyePP772ZeTsDQRAYQL/UGAJAIEAgQCBAIAAEAgQCBAIE
AkAgyJT3Mv+Eq7vYK8mTE+MDRCAghQECAeRQA5V2ZOpmg5vDx3NPzRbmGRMEcmTrEbNNB8zWfRD+
f/Efs2e3zCZvMjaksBg27TfbcuSNPEKP9ZyuAQKtHX2O9ncNgWC57umMPKvRNb0GEKgnLoUyxTQC
rcns0/6uIRAs8/hGf9cQCJZpTpjdO2f25/03z+mxntM1eLtsZAgiUtX4JcaBCAQIBAgECARQ8CJa
G5jab4J4pm4WZmO3OALVh802fIwcLkyPkcKAGggAgQCBAIEAgQCBABAIEAjKA/1AnahhbO5FdOOY
VsrrDbPBYcYKgf5D2wLaV3p+22xh1u17tO3S+DTcvxvagUDeivPgx/a/95J/73w7Sj26Hn4pKo2M
ehuV/KyBJM6d0f7k6RKx/R63vvL2tmf/ItDdM2ZTP6f7nkp9Y2fDx1v9akmpIU+KSCLVUghUQfSL
zVKeTklbLxGoctw/nzC5rw8L5KRNbkpnKq6pgSqEClzNnFzY+XnYWrt6VpVk1vbwWvg+RKCKMOUw
Q1LEOXA+/MX3mpJvGDHb265xtnzmFoUK1HaKQGlMtePYM+q2KKjXuaS1NJYIEKgI8jhEgqHt4cqy
Ky53j3hyHz2bqSLp2o2LbJ7MxKovkGqXteoWpaOk96O9/yF/dF7NwlS36AuIQIBA5celQK4PIxBE
4LLzrtoLgaALdSy6CJRkWQCBPGLsTHznomZ9nszUECgJ2ml3WWHe+QVFNPSQx6UdZNtxr9pbEShN
eTTz8mQXHoHSlke7+Z+c9m6VGoHSkEfs/trLW3wQKApN1V3lGfnGu2Z6BFoLtYCs3GWBPAiUCLVh
/HoaeRCoT9R873KLM/IgUBfapnCpe5AHgXry4pf412ihEHkQqCdxd5VqrcezhUIESsJMTJ+Pdthp
Z0WgyNlXXPHc2Mc4IVAELl2Gnh8mhUDvCkfbIVAkcbf/aOoO3fMKhqAD3frTa4quwpn0hUDOkQhI
YYBAgECAQAAU0QlYObl+5Ug8NcprZkZxjUCxRPVA6zmtEXHCBykskrhjgHXN09PoEcgFl4M4H11j
nBAoApcj6ZoPGScEAgTKApcDoTw5sgWB+sGlz1n90IBAPdE6j1o21PfcC11jLagL1oFWRyGlKU3p
OxcSJQ7NZAjkhHp/uG2HFAYIBAgECASAQIBAgECAQAAIBOkxEARBtp9wdVfAMOfIifEBIhCQwgCB
ABAI0oV2jhxZ+nfBatuPZfgBCy0Eqqo8c01b+uu51XZvzOgDWoHNTGR+pCwpLEd5svuAZXlO2uEr
PyEQ8hRWHgRCHmqg0sjTnLalv6crJQ8C/U8stqNO0I4+VZOHFIY8COS1PGL2ybd5yUMKK7s8zYmL
dujyd3n+nESgcsvzZd4/KwIhDwIhT35QA6UyE1qyxZnfvJMHgdKS549JC1qvvJOHFIY8CFR5eV5O
XimqPAhUdHnmfx+zgxdOFXkoqIGKKs/cswnb/8Oeog8HEai48nxUhiFBIORBIOShBioskkbySCLk
IQIhDwIhj28p7FApR6b1qlEbHGpkO/rr6215vi/zH1r2x7tApSGFAQIBAgECAQIBIBAgECAQIBBA
LK8FGADCTxYrr+EVJgAAAABJRU5ErkJggg==
--00000000000033222b063a998286
Content-Type: image/png; name="warning_triangle.png"
Content-Disposition: attachment; filename="warning_triangle.png"
Content-Transfer-Encoding: base64
Content-ID: <warning_triangle.png>

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAYxJREFUSA3t
VLFOhEAUBKLFXXMd3VlqZXGJrX6AP+AHWFsZ4CpDoQmBhMTyfkdbEwsrLaiJnQ1XmIAzCuTt3nKs
xk432fB2dmYeb9+C4/ypEQTBKed3ivZsyavVatd13ZyTsa3OOkFRFBdN0xxwMrZN4NoQ4zj2q6p6
gfmMfFTxNp1O94G/jumtKoD5TWdOQ8bExsy5P1rBcrlc1HX9AFPlZVBF7XneUZIkj9sSKSITEea3
ujl5xLhn0khsawJcyTMYHUuBjLlHjsT0eDBBnucTkDMpyLLM5ZQYOS1Xg7+WgwnKsoxAmRtVKjhv
uSrarowJoijaQ/mhUWEAyaXGsOUYE0CQgswjsh2TVrPB18/TQdPY1LsNph1wgh7dS6pSAb5MD/d7
9OpJAxlTSw+JKYv1en2OUheSIOOBW9RTqKVHDyDoE6BJM3w413LzJzE96NVpd7oA2a8Q+93a9ER/
GhOuYX7rdUn8s8lhGPI3/IS19X9eM9WX7+jHYZqmz90R5b9ozmR8UXr+j/ET+ADSfKckAihanAAA
AABJRU5ErkJggg==
--00000000000033222b063a998286--
--00000000000032ff9a063a99824d
Content-Type: message/delivery-status

Reporting-MTA: dns; googlemail.com
Received-From-MTA: dns; jbeulich@suse.com
Arrival-Date: Wed, 23 Jul 2025 07:27:26 -0700 (PDT)
X-Original-Message-ID: <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>

Final-Recipient: rfc822; amd-xen-safety@groups.io
Action: failed
Status: 5.1.1
Remote-MTA: dns; lb02.groups.io. (173.255.221.194, the server for the domain groups.io.)
Diagnostic-Code: smtp; 510 5.1.1 Your email address, jbeulich@suse.com, is not subscribed to that group. To subscribe, send an email to amd-xen-safety+subscribe@groups.io, or visit https://groups.io/g/amd-xen-safety
Last-Attempt-Date: Wed, 23 Jul 2025 07:27:29 -0700 (PDT)

--00000000000032ff9a063a99824d
Content-Type: message/rfc822

DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753280847; x=1753885647; darn=groups.io;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9mEASbLwwCVE/obmsJeCMMIzPX37DrYnx3yhn/GarWY=;
        b=RpsPuu1qmtTuE7kbPY+0l9VDAQUNRPgUF/NjE+slWAy4ALbxHFsSH1yqmHCDeDwe5W
         EP/3f74ClnVfWobsgR4TwlV5G6J3v3BAGy7jnXBjvQBxD1Vx7Eq29jsJ7GsxfRBRYBBX
         fPHSu5jHtwHh/79GJr3PXXWLzaoy0QHBVc3VtDwt8ajZQy3dC15k9tz/fIdIiTVHH75b
         /JZGYG5bWaFW3SPUV9bm4DkOaTHUdpaUnc79xI7teC6eeUSCXBsqpSPX9PAuhlrb1IHZ
         uXNY9u8b0kxmCY96WDMrMwiqvqxtW4cb7IejEzQFkbey1qv+yDdOp2Bui/tiB95WQUCe
         2Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280847; x=1753885647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mEASbLwwCVE/obmsJeCMMIzPX37DrYnx3yhn/GarWY=;
        b=qdvSC/aAy9n8/Hww4IQr9WkUJABIuYY9q9mnEIQ7n50Jyi3c/AzqvnptEwceZNh57p
         58V8mdkaBNI8f9kVoxz4KbL+AWguCrrHNvkOLSf8JKbpeb2SLSaCeMHjeLxWEZAszwt/
         k2T7sop9+/OLS9HK3gDHL4ua/E03DT7Or04zUBhnhoRnPoIF2BL/0fpv0Q+B95ynXE29
         NdTcLsgwdrJi6UfQI9QOcxUFnHHDhw3eveS/2El443pABabNafHhqaecyeUJ4n6C8MZf
         PpEBDzYyj1s7HF80MyDcV6RsSO3ZpO+s/OpNOLl1n1bi9FiA99aNDc5AER4Mn8kRM7bC
         U/nA==
X-Forwarded-Encrypted: i=1; AJvYcCVU+4yX315RXbwZoNeYhmU0h7HHaGRq4SZ/lqbmPZ6QEnrY8pVH2T9Pf/PEUSKsCoqaIh26xCIYoirOUe4VLA==@groups.io
X-Gm-Message-State: AOJu0YwzqMH29CDyUpQDXqIOz8XIGZlm0HLkIf00qqXvs0mQCY/hv5Ny
	0d/0QLeSpQy3p8hb2LYNvIjzW46o316WwGMv/H9TKzTwW+W7U306e0Y04Qkb/37nfQ==
X-Gm-Gg: ASbGncuOhr14a5bSjjgNvrFbGaebg1Jy/WppuMpICqPE4VUZaoZDj1a9Lr1WV7BAJG7
	q1WOqIuqd7TrTpIVjzffpDAjLtY9zYI2fqW643bN7dG8XJTv76IqGnkK6iYKxG1JoxdifWCjzo0
	gEmWajbfRKVLrmhXd5hhR47QCVjgpQ0uu0QrB/646Q7ggkKDQqnyO1DbhwAMYZkbWgIiP/7X+9x
	rYdPIVcTlocDDNky7Wpj9TIkZ966bKwgSrDZzwtveLhhJEXzkWH4MRjjH7UIyDAmeQV2hLtIhda
	fVZ3bsCYrKjBJpvcq8RGaQCDnFPRUvg/mRypoQvOvXaclE3CVr4QvUEf+Mas4wq56SLarTaFm+o
	U/JCE/aBqtWThEMt/Z4b2yYa5e9JQvxJwOVf6cHhlqeD62pWvYO0qSeuTm+sjZ3vwqMjwSFgeAx
	ANK9dxF4M=
X-Google-Smtp-Source: AGHT+IGDm4CpV2f5IRaqAYmmNVKEkTXMwOvlBRXDWxuOtGajphD2vpeoRetdet1+9oc7Vd1NBdvE1w==
X-Received: by 2002:a05:6000:288e:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3b768f2e267mr2292122f8f.52.1753280846685;
        Wed, 23 Jul 2025 07:27:26 -0700 (PDT)
Return-Path: <jbeulich@suse.com>
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e51a19571sm1842038a91.31.2025.07.23.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 07:27:26 -0700 (PDT)
Message-ID: <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
Date: Wed, 23 Jul 2025 16:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "amd-xen-safety@groups.io" <amd-xen-safety@groups.io>
References: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:05, Oleksii Moisieiev wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE
>  	select HAS_DOM0LESS
> +	select HAS_DOM0

This wants to move one line up, for the set to remain sorted. But see below.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -21,6 +21,14 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
> +	default y
> +	help
> +	  Dom0 boot support enables Xen to boot to the control domain (Dom0) and
> +	  manage domU guests using the Xen toolstack with provided configurations.

What about non-Arm? x86 has a Dom0 too, but doesn't select HAS_DOM0. It
actually requires a Dom0 for now, so to me HAS_DOM0 is a misnomer. Maybe
HAS_OPTIONAL_DOM0?

> @@ -92,6 +100,9 @@ config HAS_DEVICE_TREE
>  config HAS_DOM0LESS
>  	bool
>  
> +config HAS_DOM0
> +	bool

Same here as to sorting, no matter that ...

>  config HAS_DIT # Data Independent Timing
>  	bool
>  

... HAS_DOM0LESS and this one are misplaced with one another.

Jan

--00000000000032ff9a063a99824d--

--------------wdDVtgAhTH2YR333pn8u4OfD--

