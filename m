Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613399DFC72
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 09:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846357.1261521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2BS-0005fM-0l; Mon, 02 Dec 2024 08:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846357.1261521; Mon, 02 Dec 2024 08:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2BR-0005dt-U0; Mon, 02 Dec 2024 08:53:33 +0000
Received: by outflank-mailman (input) for mailman id 846357;
 Mon, 02 Dec 2024 08:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI2BQ-0005dn-JB
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 08:53:32 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e691c9-b08a-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 09:53:28 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e3621518so1364011f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 00:53:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dfb2d7e0sm8703660f8f.44.2024.12.02.00.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 00:53:27 -0800 (PST)
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
X-Inumbo-ID: e5e691c9-b08a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU1ZTY5MWM5LWIwOGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTI5NjA4LjI4NDg2OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733129608; x=1733734408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eHwGe0iie1X8zSQpM1na0u6g//5QLMPxvpkm6VnnP+s=;
        b=C2hVsaY45m96fXc1A4j/mQ9zV1PxQpmN5/1nHPml+wpy4vn5ErbehwmCs6Hk46zZn7
         IYcu6ASqElKjmDgHE3/Xirs7VcdEMPO3k+PDy4UuHexqHbmH3vw57vAuuwDcsdxVgDnA
         J91H4oP4Rf3JWhexxWxjdUKzksqKZKJbkdhb3Nch4CwFBfW4STeq58G4c6ea7fAVkv+A
         fGMGaAcmMjvY62cAxVxgCpxnrCNlTBe7Kv7PqrdteJCHOi+wMTAFCdNj/msZC/8Wb1eR
         w8NNsQsoPP8GHjiP6Ai+ZitC4VLZYdeNm2d+2+0PSQvb9xQ7pHnuzmZrUAOIxEorwsVK
         WNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733129608; x=1733734408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHwGe0iie1X8zSQpM1na0u6g//5QLMPxvpkm6VnnP+s=;
        b=qVBl2JObXOYbflej+VsqGEl8YtMCxYlEXJxvY5nv2wxAsYSyjQePSDhas1PT1yWZ6y
         YGprMINkLQKIeD8v9Nv8VEqEhKXxI0j+qfwmaHavqB2NbBz8TfiR+agQrxNaAOwOCgTr
         9znfESYqKGUfI8htx+vL0F05OYX+vo6+O00wq5X7IoP1HijA4bPGPCNrEGFvW+exFRbv
         Z0d+gN+zpMCxE6JdMfxPmX7jlgiSDPFrA87442J4Vc/nbO/EEaFD+qgU9otV0ZMmsvBF
         QbtzaMsmI04Y0SrAxTdkg84PWKQyhgL2AFJGDDk+Ow2aliHcv2kWwMAQSsvu7XuAXOjq
         OOhQ==
X-Gm-Message-State: AOJu0Yzl3cfWLb2uL6VoVQyo+kgc2RCdU9P5JYyP/gUe7jook8vSKNJo
	DJwFIgfpmoX580KbHnfn5cyCYb0ejJRVm1neSxhfoAYspmCrZHUZkSCTClcxhw==
X-Gm-Gg: ASbGncsYQtFibrIwf2JOsplefDKnMhpzRIXWhjA76Lmh70fwMz2odR4yCaJZulbc45L
	F+d26ceoxn1l417i02JZyO4FBtaQFdLtmBs+5EhHI1zwGheaBLjxhmRR5nGJwUJoz71/NicrMD4
	59Gt9XRdHJ+OsvxKdUTrJCq6tDcgOnNE96jEAkZ2ooqKBIhdEwEOSBwdE19wiYv1xWut37hbDaT
	56WUu91zRUJblqAJA9vMZFotGWTP51vVnuD1znOfzQJ69Y8bRlcgZtbzCPR+mh491EQlpBJff+y
	dyuDP4ARl5MfwUhBbWGB6/eUXwiPGGvRPzA=
X-Google-Smtp-Source: AGHT+IGVew6GaD1esGkYvevWZtkzCQ0h2rtWln06y+MyoFrYTedF8dpo8R7J9URPPxWhKk0OXR7MbA==
X-Received: by 2002:a05:6000:1fac:b0:382:5aae:87ac with SMTP id ffacd0b85a97d-385c6ec0c37mr17966537f8f.32.1733129607697;
        Mon, 02 Dec 2024 00:53:27 -0800 (PST)
Message-ID: <95754086-9c90-4765-b386-299baf2b5f94@suse.com>
Date: Mon, 2 Dec 2024 09:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xl: Keep monitoring suspended domain
To: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org
References: <20241126171941.170897-1-jason.andryuk@amd.com>
 <20241126171941.170897-2-jason.andryuk@amd.com> <Z0ieLBwYt2jm_WAa@l14>
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
In-Reply-To: <Z0ieLBwYt2jm_WAa@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2024 17:45, Anthony PERARD wrote:
> On Tue, Nov 26, 2024 at 12:19:40PM -0500, Jason Andryuk wrote:
>> When a VM transitioned to LIBXL_SHUTDOWN_REASON_SUSPEND, the xl daemon
>> was exiting as 0 = DOMAIN_RESTART_NONE "No domain restart".
>> Later, when the VM actually shutdown, the missing xl daemon meant the
>> domain wasn't cleaned up properly.
>>
>> Add a new DOMAIN_RESTART_SUSPENDED to handle the case.  The xl daemon
>> keeps running to react to future shutdown events.
>>
>> The domain death event needs to be re-enabled to catch subsequent
>> events.  The libxl_evgen_domain_death is moved from death_list to
>> death_reported, and then it isn't found on subsequent iterations through
>> death_list.  We enable the new event before disabling the old event, to
>> keep the xenstore watch active.  If it is unregistered and
>> re-registered, it'll fire immediately for our suspended domain which
>> will end up continuously re-triggering.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

While committing I was wondering: Does this want/need backporting (and hence
was it perhaps lacking a Fixes: tag)?

Jan

