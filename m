Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED9806832
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648940.1013055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmF7-0003Lz-Te; Wed, 06 Dec 2023 07:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648940.1013055; Wed, 06 Dec 2023 07:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmF7-0003Je-Qv; Wed, 06 Dec 2023 07:22:49 +0000
Received: by outflank-mailman (input) for mailman id 648940;
 Wed, 06 Dec 2023 07:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAmF6-0002kr-KO
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:22:48 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41ba2ed2-9408-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 08:22:48 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3333fbbeab9so417098f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 23:22:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n6-20020a5d67c6000000b0033335333d88sm12133526wrw.43.2023.12.05.23.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 23:22:47 -0800 (PST)
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
X-Inumbo-ID: 41ba2ed2-9408-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701847367; x=1702452167; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N46oMtztTMKivnkI5qJIbT8O6Da7Ep6qclq26Ay1Jq0=;
        b=DMKoyWFsllDHrYq+YwosbBEqlb58pQ6+ZMa89Mnyg8KJKCAYFS4uuuN3hFi5XxrrjP
         FbnVd9cdAQf60sZ1do7rZE+paTNt62RHO/dBAOYqeUb+oMWW5SzadHI/0JHHrZgD80hf
         VYwEdkie183JJco47T4W/RxGqPb6uhLqhEzEPzdbu8JUuyeCgil/G+2J9SJAeIgdIEUG
         ewXeFbi4k/UqL/vFohQo+DEhL761bGMepcaHcWNlPOhRXorQs33Ji3EoOy+p5cHbwCpz
         ookc5gPDD7o/eUCriyMlZVY1YRbMO1nj+FqfbZY2ojtcYCXRS2HcYbeYhrefUhEiGZnf
         xLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701847367; x=1702452167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N46oMtztTMKivnkI5qJIbT8O6Da7Ep6qclq26Ay1Jq0=;
        b=v/WLT0UkkJ0N/ZmVAUGtrHCAmvHvUSSYBbGAkVpqadaJzRLy6tUZAvdbCgRbZaYyNj
         lHsg4c6hUgJ0fe/rHsraohfhYep8PFDfxBFMqyVJpGhDKbeoopG09YfnfFgVJWxkmUki
         rskJQXBjCAx/Ui9qilDEiLYKlVi7fcIP1qiPWzOYc74FZKFJpMGXBJbkWCMaOA8rUfY6
         TSQ0P681KQwwQoFh8eYHLUkIlfRKxEPmT3gB43yeAH7SqMGapWsll31oWBd5swJUgQC6
         7dCCx3L64wCS1yxyjGTfQhkb5SAkx1nwRoMdD+l9hFudXldFbyHlhQOzVBnNQ5LX+ySh
         TdzA==
X-Gm-Message-State: AOJu0Yw+Yify0+6Y6c7B55mXMHCuAURNK35ItWhfn1javC/K41Jjhc7/
	iR/kalb/KZVjfaZq1Js7OZaE
X-Google-Smtp-Source: AGHT+IFe+V2eK2a9SxRAPXEYklTVE4Tejfi+Esn99uo2+1aLaHFU5JrG4zs5cYNHGbsdx8Va55Qf4g==
X-Received: by 2002:a05:6000:cc2:b0:333:39dc:d99e with SMTP id dq2-20020a0560000cc200b0033339dcd99emr227028wrb.119.1701847367501;
        Tue, 05 Dec 2023 23:22:47 -0800 (PST)
Message-ID: <d71ca852-087b-4781-9fab-304acbdfc968@suse.com>
Date: Wed, 6 Dec 2023 08:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/vPIC: vpic_elcr_mask() master bit 2 control
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <09fc4c14-07e8-4e59-a23e-bb295125f25a@suse.com> <ZW9d9MK6l6GwXo60@macbook>
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
In-Reply-To: <ZW9d9MK6l6GwXo60@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 18:29, Roger Pau Monné wrote:
> On Tue, Nov 28, 2023 at 11:35:46AM +0100, Jan Beulich wrote:
>> @@ -387,7 +387,7 @@ static int cf_check vpic_intercept_elcr_
>>          if ( dir == IOREQ_WRITE )
>>          {
>>              /* Some IRs are always edge trig. Slave IR is always level trig. */
>> -            data = (*val >> shift) & vpic_elcr_mask(vpic);
>> +            data = (*val >> shift) & vpic_elcr_mask(vpic, 1);
> 
> Not that it matters much, but I think you could use
> vpic_elcr_mask(vpic, 0) to strictly keep the same behavior as
> before?

Indeed, as also said in the description. Personally I view it as (slightly)
more logical to not mask off ...

>>              if ( vpic->is_master )
>>                  data |= 1 << 2;
> 
> Since the bit is forcefully set here anyway.

... and then set the bit, hence why I chose to go with 1.

> Regardless:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

