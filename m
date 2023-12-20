Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351A819CDF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657610.1026575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtvs-0003Wn-S4; Wed, 20 Dec 2023 10:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657610.1026575; Wed, 20 Dec 2023 10:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtvs-0003UZ-PO; Wed, 20 Dec 2023 10:36:08 +0000
Received: by outflank-mailman (input) for mailman id 657610;
 Wed, 20 Dec 2023 10:36:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFtvr-0003TI-4S
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 10:36:07 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 921a7d5e-9f23-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 11:36:02 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3367f8f8cb0so34695f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 02:36:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j29-20020a5d6e5d000000b003364e437577sm14944631wrz.84.2023.12.20.02.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 02:36:01 -0800 (PST)
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
X-Inumbo-ID: 921a7d5e-9f23-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703068561; x=1703673361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Y9sEFJwb5zkOk6siITXqoNrfmMtJY9X+M6whwB7kQ0=;
        b=bgIh+g+naNZjf/WBEFMtJCnXMpZtLdC4JFITsqT1CTwJSyhD5IDvPmzeIxRf/IhEhy
         v9Ke03L5J2e+YF0Z1EgFiropMA3VEZim59mXFAyIDl9GOVC+76XZXGhP7QkEpyu47May
         4XNBSRRWUQtSnqnNRzD3N0yid23Helpznt3A1D5WGRGRg/JIKhg3oFgsQoHwnz17f1V9
         r/AAAOeCIi9TUF3ZwRlnjJjwqDR37bMWJt81e9Bhs7xUJm/NufsPvHGI6Ll7YkvZcpDL
         VfasbwPiSEcFVNWwpl+yof9Rast4Djei3SFbKIviom6tHTvMh6J6rYNJhVl0My4PUue5
         QKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703068561; x=1703673361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y9sEFJwb5zkOk6siITXqoNrfmMtJY9X+M6whwB7kQ0=;
        b=YrlB+9ukLUgEHo/h+u396db8gRbOo+GHxMkEO6J00k1Xmtu22JHgsscq7gS4CfyAym
         OAcjU56JLIdIEkxnqeIlWKtWHZL/VLo7m0QrZB94SUFTjp2cBu9QEUw444+x+pwWeWnR
         Wj5BcgdidAgSAFRj7XgHo1htfPdrWYEBS6vGu24yzTqm/qDMF3vAahmuq3Cvgj83hxep
         R6sQeCJxpQJua8YJOzmPwEo8o0VV3jcBGAW9prwS6qG6qP5S3nuNqaX9EiTLEH6Tka+D
         6SCb7efGYgJCbhsRU+UDcW+X+8dwI81bu7p+g7IeWoq2oDk9P1aJCO0ga2fB49bXOrku
         5CnA==
X-Gm-Message-State: AOJu0Yy2LIn7L0QTLnGR5SFiBuWKS72RpWbAd2G739adGmNIUW+CaMBJ
	+jkCtyBrryZIdR9yAdahnTum
X-Google-Smtp-Source: AGHT+IHsuk+klNmJeTCuNhZVCrrH21vq8gD/A11A3PNLBveCWo54L5KmrZvEZpP3iVwuovnTmf+3cQ==
X-Received: by 2002:adf:f5c6:0:b0:336:7197:56e6 with SMTP id k6-20020adff5c6000000b00336719756e6mr1710207wrp.136.1703068561548;
        Wed, 20 Dec 2023 02:36:01 -0800 (PST)
Message-ID: <f9207c2f-d28a-4bbf-a8cd-620952b4fa7f@suse.com>
Date: Wed, 20 Dec 2023 11:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] x86/iommu: cleanup unused functions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-8-roger.pau@citrix.com>
 <02a8e90e-dc4b-4fda-a2a7-50c12d356c63@suse.com> <ZYLCiq2XLgSP7ZMo@macbook>
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
In-Reply-To: <ZYLCiq2XLgSP7ZMo@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 11:31, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 05:23:57PM +0100, Jan Beulich wrote:
>> On 15.12.2023 15:18, Roger Pau Monne wrote:
>>> Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.
>>>
>>> Adjust comments to point to the new functions that replace the existing ones.
>>
>> And because of this affecting what was done earlier in the series, perhaps
>> best if patches 5-7 would be committed together.
> 
> By committed together do you mean squashed?

No. I mean only ...

> I agree that it would be best if the series is committed in one go,
> otherwise the comments in the tree can be inconsistent.

... this (and patches up to 4 can imo go in piecemeal, if we wanted to).

Jan

