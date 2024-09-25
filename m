Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CB985598
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803555.1214202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNVd-0002lN-C8; Wed, 25 Sep 2024 08:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803555.1214202; Wed, 25 Sep 2024 08:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNVd-0002js-8W; Wed, 25 Sep 2024 08:36:29 +0000
Received: by outflank-mailman (input) for mailman id 803555;
 Wed, 25 Sep 2024 08:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stNVc-0002i1-C2
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:36:28 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 413dc9ec-7b19-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:36:27 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so4620884a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:36:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f54141sm183094566b.83.2024.09.25.01.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 01:36:26 -0700 (PDT)
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
X-Inumbo-ID: 413dc9ec-7b19-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727253386; x=1727858186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FPotWCcfJa6WIdnZaaVx8anADCibZYUfha4+lg+Kp5c=;
        b=TlIzj6BLIo55EMnZ4/HTjUDf/yCa2tGdPujXUIXsKQhmubEB8H0Eajr0r3z3dWkvEX
         bHv1k89J6v4rZS9GVrXvqii7RDWOSzRxIXXnQrkyxQ60x1/3myZbzgEHAb1JMMa46xxJ
         u2pHVUXlriXzcO1MaunuxdeIAOX6gngb7OVHModffBuYPbZfHZMCPzjvpsn6mtxHYwaU
         JfBdlJThShGYG63sIMHPtnKcScmp35cU0YVxaxocbxk5awGRa6mnD5kOfroc8W61GYK3
         lKTJKCkhtvF9/Woikb6nftudDkskPh7DoCTsQ+t9EAHrUqeKxFU6rg2V+vv1/nuXUFVQ
         YMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253386; x=1727858186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPotWCcfJa6WIdnZaaVx8anADCibZYUfha4+lg+Kp5c=;
        b=mNI0BIF9qCxxc8+mlZIGEsoCrFvTdDHD4uSv8foFSTE4F/IPOg3zqP15uULX+Y6dlx
         X6+Mbq4BVaEa6Qvjo3EiU1YswsJwahCWfXd93yEPTpCK4YPX9D95MWhYgsNRRN2AiRFl
         tc0jWlkbsVzKzzx/SUUH4bmVbck0q7p3Vc+Y2eRoWNa4pyRg4bT1xUC4QHIKJEApdxLm
         Yfpl+gpV1XtO2qfi9KT8iNUvIXUYjFhhxuDe4+5fMzBUBjBlL92iHJ4IlYaaAMHuegHI
         Mkx9proOzKN9uKcHDMwGzdzDV6JgEu1/gj5YDQdtuwS3Z2PhzkxGT/U2tsJSGPsa+YaK
         UwFA==
X-Forwarded-Encrypted: i=1; AJvYcCXghOyGlu4mLSgGYRnIec8HG5ZDJIbTtCxNFQ4rUSR8EzQ2dz0pbILDh92iiqIzfgM/9+a0+idwb1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5xV1HDuzeAv9ALgisrnWxMQzTxRk9/oYJTYjlGjN61/KjlAfx
	tWk8SpnKtc/RmqHTXDRlc7yJ1s56201pJCeHiY0SjNHMeFzOA8j5hKN8Ibz1r6uEDQw3NNusj/U
	=
X-Google-Smtp-Source: AGHT+IHf2b3dDj7IJSoOAnpCh/CVY3IyQvLmFROntDPf5ZWLW26kHGPTbopuq7+fjnwrqP2a8K63RQ==
X-Received: by 2002:a17:907:3202:b0:a86:9107:4c2f with SMTP id a640c23a62f3a-a93a0632fa9mr222140566b.41.1727253386581;
        Wed, 25 Sep 2024 01:36:26 -0700 (PDT)
Message-ID: <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
Date: Wed, 25 Sep 2024 10:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen: define ACPI and DT device info sections
 macros
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
 <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 18:42, Oleksii Kurochko wrote:
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -114,6 +114,11 @@
>  
>  /* List of constructs other than *_SECTIONS in alphabetical order. */
>  
> +#define ADEV_INFO     \
> +      _asdevice = .;  \
> +      *(.adev.info)   \
> +      _aedevice = .;
> +
>  #define BUGFRAMES                               \
>      __start_bug_frames_0 = .;                   \
>      *(.bug_frames.0)                            \
> @@ -131,6 +136,11 @@
>      *(.bug_frames.3)                            \
>      __stop_bug_frames_3 = .;
>  
> +#define DT_DEV_INFO \
> +      _sdevice = .; \
> +      *(.dev.info)  \
> +      _edevice = .;

I have a question more to the Arm maintainers than to you, Oleksii: Section
names as well as the names of the symbols bounding the sections are overly
unspecific. There's nothing indicating DT at all, and it's solely 'a' to
indicate ACPI. I consider this a possible problem going forward, when this
is now being generalized.

In turn I wonder about ADEV_INFO when comparing with DT_DEV_INFO. The
latter makes clear it's DT. The former doesn't make clear it's ACPI; 'A'
could stand for about anything, including "a device" (of any kind).

Finally, Oleksii, looking at Arm's present uses - why is the abstraction
limited to the inner part of the section statements in the linker script?
IOW why isn't it all (or at least quite a bit more) of

  . = ALIGN(8);
  .dev.info : {
      _sdevice = .;
      *(.dev.info)
      _edevice = .;
  } :text

that moves into DT_DEV_INFO? I can see that the :text may want leaving
to the architectures (yet then perhaps as a macro argument). I could
also see a remote need for the ALIGN()'s value to be arch-controlled.
(Why is it uniformly 8 anyway on Arm?)

PPC's desire to use DECL_SECTION() can certainly be covered by providing
a (trivial) DECL_SECTION() also for Arm and RISC-V. Seeing that even x86
overrides the default to the trivial form for building xen.efi, I'm
inclined to suggest we should actually have a way for an arch to indicate
to xen.lds.h that it wants just the trivial form (avoiding a later
#undef).

When to be generalized I further wonder whether the ALIGN()s are actually
well placed. I'd have expected

  .dev.info ALIGN(POINTER_ALIGN) : {
      _sdevice = .;
      *(.dev.info)
      _edevice = .;
  } :text

Jan

