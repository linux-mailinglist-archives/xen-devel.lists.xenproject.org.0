Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630F4957EE6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 09:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780062.1189647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgIsK-0008CH-Kg; Tue, 20 Aug 2024 07:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780062.1189647; Tue, 20 Aug 2024 07:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgIsK-0008AU-HI; Tue, 20 Aug 2024 07:01:52 +0000
Received: by outflank-mailman (input) for mailman id 780062;
 Tue, 20 Aug 2024 07:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgIsI-0008AO-Jn
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 07:01:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e62b3a-5ec2-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 09:01:49 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-428243f928fso56260265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 00:01:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396be1csm722199766b.210.2024.08.20.00.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 00:01:47 -0700 (PDT)
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
X-Inumbo-ID: 11e62b3a-5ec2-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724137308; x=1724742108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GLn2a+vpvDXGmWk6iH9PCriGAYCKBXcBzep4QTkXFWU=;
        b=UYylpsGt/QfOIFfWok46moxxGOcrjGEnxkZK+t/mGCda+jTAF89/ou0VO3eg8ENC1j
         U5PfCGmIV8uuHrFo7UCr/Rhb5wpve5m3aEePUSFW+lc310MWK31suenhUlEfjBlxUt5s
         k4ftNCh7AprUHM+LTLPITZH10EHHJ1TuMe3OoMWe8mdkBfWCPVUIcPh1ffZJCTbwxj0o
         cMzcP0YErhc7norwhMO4Llh7Ta9NUv5eQunc128O8+jcYOIUZjB3YD0FPbqI6zix+WDb
         0RnIV/tK1XB0lhtui9vVfekhrkT2CYhIn5NTTe2HAL9z1IuRz7vFZUJrR0xxAFmXX3w2
         tQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724137308; x=1724742108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLn2a+vpvDXGmWk6iH9PCriGAYCKBXcBzep4QTkXFWU=;
        b=KV3HpPlBHZMY7Li4zYjuX9R8Z6CxSpIRgg3FqeyqTZWZARhWZj3XUMzSXNgtav+eqP
         eb7VmRyc3f3GHxxs6g2nakNptFXNEtbaC9mGsNfp8PsEIpCcAwW8fdoS2bnbrgVfqXwu
         fo1KsHtyhP2JnqbtNQkpGbjruhOZhy/G3TXp6L9BaqahuDWkEnHox3sgbnvWt13jalUA
         y0mjgE0t7f4Gf7CiCY4jVBFAR0pT+px2YCf7uLCfPPQDBFXulmxI2gbpxh8QYyIWnGBm
         F24xjIomG1cVzFYAOnJhUIwZ6zT9KwJCpz0u66YERN/6nZXC/ozlPx6ok3oAKyDZ/o62
         Y7qA==
X-Forwarded-Encrypted: i=1; AJvYcCWVkFYq3hCf6IjFRMX6TUhsNlyPgwPEzcaRc9Ly0/bB/Lzh1C2AIF7iqN+zQwdcYp6j2Ma05fJtnGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp66V9RgstfLfyXxRhS+TiEkeF+REo1PpYnFM34avnPpQgfXpU
	35Ne79Ax0RrMYDkRGYcq+mlxkHhbwrRQf4MJ5RolsRhfRM8HIGo4WYamgBfmNg==
X-Google-Smtp-Source: AGHT+IH+VvICI8Zen2QppKQo7dYDhF5RMhpzM8pBLrTXGpqEzAlcdn50Dv/G/TZ5AMHVpMYl9J3KXA==
X-Received: by 2002:adf:cc8c:0:b0:367:4d9d:56a1 with SMTP id ffacd0b85a97d-3719468fa6dmr11873647f8f.45.1724137308224;
        Tue, 20 Aug 2024 00:01:48 -0700 (PDT)
Message-ID: <1e0eee6c-0dcd-4ed4-970f-3d7e569cec09@suse.com>
Date: Tue, 20 Aug 2024 09:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-2-Jiqian.Chen@amd.com>
 <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
 <BL1PR12MB58498DC98719ED77DA950478E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58498DC98719ED77DA950478E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 08:00, Chen, Jiqian wrote:
> On 2024/8/19 17:04, Jan Beulich wrote:
>> On 16.08.2024 13:08, Jiqian Chen wrote:
>>> @@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          break;
>>>      }
>>>  
>>> +    case PHYSDEVOP_pci_device_reset:
>>> +    {
>>> +        struct pci_device_reset dev_reset;
>>> +        struct pci_dev *pdev;
>>> +        pci_sbdf_t sbdf;
>>> +
>>> +        ret = -EOPNOTSUPP;
>>> +        if ( !is_pci_passthrough_enabled() )
>>> +            break;
>>
>> It occurs to me (only now, sorry): Does this case really need to be an
>> error? I.e. do we really need to bother callers by having them find out
>> whether pass-through is supported in the underlying Xen?
> I am not sure, but for x86, passthrough is always true, it doesn't matter.
> For arm, this hypercall is also used for passthrough devices for now, so it is better to keep the same behavior as other PHYSDEVOP_pci_device_* operation?

Despite seeing that I did ack the respective change[1] back at the time, I
(now) view this as grossly misnamed, at best. Imo it makes pretty little
sense for that predicate helper to return true when there are no IOMMUs in
use. Even more so that on an Arm/PCI system without IOMMUs one can use the
command line option and then execution will make it past this check.

I further question the related part of [2]: Why did the stub need moving?
I'm not even sure that part of the change fell under the Suggested-by:
there, but I also can't exclude it (I didn't bother trying to find where
the suggestion was made).

In any event - with [1] PHYSDEVOP_*pci* ended up inconsistent on x86,
even if right now only on the surface. Yet as soon as this predicate is
changed to take IOMMUs into account, the latent inconsistency would
become a real one.

An alternative to changing how the function behaves would be to rename it,
for name and purpose to actually match - is_pci_passthrough_permitted()
maybe?

Thoughts anyone, Arm / SMMU maintainers in particular?

Finally, as to the change here: On an Arm/PCI system where pass-through
isn't enabled, the hypervisor will still need to know about resets when
vPCI is in use for Dom0. IOW I'd like to refine my earlier comment into
suggesting that the conditional be dropped altogether.

Jan

[1] 15517ed61f55 xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
[2] dec9e02f3190 xen: avoid generation of stub <asm/pci.h> header

