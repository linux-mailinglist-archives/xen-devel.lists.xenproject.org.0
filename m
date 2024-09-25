Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605598577B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 13:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803837.1214656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPlW-0005cV-AI; Wed, 25 Sep 2024 11:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803837.1214656; Wed, 25 Sep 2024 11:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPlW-0005a6-7b; Wed, 25 Sep 2024 11:01:02 +0000
Received: by outflank-mailman (input) for mailman id 803837;
 Wed, 25 Sep 2024 11:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stPlU-0005Zz-S4
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 11:01:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72854467-7b2d-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 13:00:59 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so8659993a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 04:00:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49dcffsm1737489a12.51.2024.09.25.04.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 04:00:58 -0700 (PDT)
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
X-Inumbo-ID: 72854467-7b2d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727262059; x=1727866859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iJkFEKbPnzpa8y52vcNws6uG/f1yXuz5581JXllD8aI=;
        b=VfBNL/GhVrjR4gSdrOon+k4K8LWRx6JUjizQbBkcHjG5aWxoSusaDwVDfmUsJm0N7Y
         7duIYNTM748JUjFFhaJN6tO4KJSQZoTZMrC5G/7WKcfLgjKB/vcfHcEVrO6AYBV16zvu
         OwIldO+y7R5IYLz3uQR6Zcy3Kg0ECAt22q6lcOtIqYB7nllnXGO6xr/MfjDBWoLrMBQl
         IOjY/AgHFIxPX03gEaYiRWVofJFkGWeLDPJlmZcrD7nWYC84mxitUQ9vKekRQWVSSQhb
         QmHMOcUMNnRF/Lp6VKzdKM79qDe7sBFZMUBddFFMm8p1KNfOy9WZJFUO/7IrvQA4zEyx
         m7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262059; x=1727866859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJkFEKbPnzpa8y52vcNws6uG/f1yXuz5581JXllD8aI=;
        b=J/ISg0ijwuD39EOnHXa3FDSfkpNpMQIJ/nQKaDbNZS7JkQOy0LNpdnw90dHZEe9R2p
         krxg94rC2GOYUBiR3U2SpMt8U3+NRjQZqa5FLrPPASS+dTkTbbMvbTEuPsXzzWG/dryK
         6qVql5dJYIUoBn89nbbxy+HYTnksOeXUnoJMNG3N0hazKYyOupsGe4fHZ/4Tm9UPsf3x
         dSqhNrR8TO1qfDh4a2D1XjstOJqlW1QzYeNexU8kLg5tjqviUAgMef17wRPUm6Z2atPM
         l+ydCiLnBcUIUELXtpu3o3sGJbf+jrEyz3TXtG0sSXR7DmVyv5Slj1IkuMpC3ltmdd4A
         CsXw==
X-Gm-Message-State: AOJu0YxgFFRziZwwM6AGlpNz8rhY+KiWOufzQNe+OZYO2mkAKGfm3uF4
	YOk7VEJ0mJLoni0grp9oe+W/gflQAnZIVoOVSrBRgSNoco1LmPgIKuAmOFUn/Q==
X-Google-Smtp-Source: AGHT+IEoOEN3JiGsrJcbbdUb0MRuA0QP+/WQTH5a1xxrDV/xo98aB2qG1yhyu9tlLVEB69Tbm6W9FQ==
X-Received: by 2002:a05:6402:278d:b0:5c7:2180:3807 with SMTP id 4fb4d7f45d1cf-5c7218038f9mr811440a12.26.1727262059174;
        Wed, 25 Sep 2024 04:00:59 -0700 (PDT)
Message-ID: <cbb8da7d-db0e-417a-a144-e9ad2ab5f72d@suse.com>
Date: Wed, 25 Sep 2024 13:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240912132347.28756-1-roger.pau@citrix.com>
 <ac1317a18ddc993a5fc926a8d25feb39c5349662.camel@gmail.com>
 <ZvPlq0pb6QIGr6lj@macbook.local>
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
In-Reply-To: <ZvPlq0pb6QIGr6lj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 12:27, Roger Pau Monné wrote:
> On Fri, Sep 13, 2024 at 04:19:32PM +0200, oleksii.kurochko@gmail.com wrote:
>> On Thu, 2024-09-12 at 15:23 +0200, Roger Pau Monne wrote:
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> LGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Hello Oleksii,
> 
> Could you formalize the tag into either a Reviewed-by or an Acked-by
> so the patch can be committed?

Nah, I'm intending to put this in with the LGTM:.

Jan

