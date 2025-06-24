Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F45AE5F2E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023343.1399307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz1P-00087C-Fd; Tue, 24 Jun 2025 08:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023343.1399307; Tue, 24 Jun 2025 08:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz1P-00085o-Bo; Tue, 24 Jun 2025 08:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1023343;
 Tue, 24 Jun 2025 08:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTz1O-00085d-3V
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:28:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe8b1f5-50d5-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:28:48 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so90093f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:28:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f119e820sm9704971a12.23.2025.06.24.01.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:28:46 -0700 (PDT)
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
X-Inumbo-ID: 3fe8b1f5-50d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750753727; x=1751358527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ1v9caGWC8K5bNoYCQRWfHPK9+yKVOzzyRfF0h/i+I=;
        b=Hfizm9BqlnSLGpxAPIgh4S4mqIV3A5Lp+iLi13nZdulcCfnwjoejMVaELvgn3k8+hr
         d3SsFV8Ga3N6qmqMOyfP6W4+z5WImwbfM5M+VJstRDBl/e4R3o+mzuu09jyGLDuOJBPs
         GKtP4IkJwdgquzx1uqQ2sXh4KoxC7Xe6/4//Td7M0GyY8D5vqjCOmyJUmAHHAVkk9T+I
         ey4+shWX7ZX80uOTkx2HI0oo32XwxmyANXq/0zuMBhcE3n5lE6KNWl+KHkSyYkHGn5mu
         PhZf5umw39adj2AYHYCERaW78ociUdzu+GWyqxmR3PFpIcSlPSyUN6dVxEfUwtV5o/ya
         IT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753727; x=1751358527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZ1v9caGWC8K5bNoYCQRWfHPK9+yKVOzzyRfF0h/i+I=;
        b=bA/QE8nMkWZIOHQG+RaFAiuixrEG7C2JSFLm+U5YfrQF9j9hSqDLgkJscFe8gocG0V
         7+cvEbbUrF7JN4dbUqJtZVtU+agR7ePSYn1RnitEkBHKTjtGmZUe8VmSaPxZNRBXa8sS
         I3PbjEOSkgVu8nwOdFAjaIM+eigocmZM5dSL/piaoPKbQVpMwEXJ4I3AWeBf3xvWTMRX
         LpuwGwb/8/qpbOXHVsc6/uJqQe2/kJoTq2d1NTqSNNla+tna2LxEnurpqBy+lN5f+wkx
         z8IjowM/+GWavJfAFpolXwHnkYWa06yaqTLgvV18W0xYBiev5Cp6pW8KlOi8zGcm8gCy
         k7HA==
X-Forwarded-Encrypted: i=1; AJvYcCV53cOeG8GsioxZW0x/w4VatkMXw1RHYaeruYkyEDi2obhWY+/IEDTRrk8T8SWWLCuAW/fWmzomJKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3r7m3GNZqGnlKjzx4Tmp1KRc0Nh8OSBXBlMhrIW1fJPTSVsjW
	qw5Me1NBotYcfnQa+ujEfgiGZZVszTlHTWXEg+wi27T7IQVolpo+xHIc0zCGJdRO0w==
X-Gm-Gg: ASbGnctPLaBMQfYDFpjZd627YkNX6Xfq1kAaRb1/2f92PAC8H/T5O24DZIwyrnASv0+
	UHXvz3PHJCo7thNXQ5EkuG9HThPODlXvl+yKoyT3plgJapOP/0fNYZBGPYWPVewdzzbbx7Vqum7
	mMuMsNT8Oxyquu6RRLCkBmFz9EyH/v6W44Dg74qq906591zWxrv4Rx+H43bfOFOymvcr7LCQIL3
	a+08ia5q5NERmE+oXUoHyEPUvDwjsac8t7uBjDYKw3hCJfu8mLMVasVpx7Qvyka6GrfeooKL5X9
	5ntviPWU4sXXfkDCKiewqY+o1nilY8RooHh0rXwtooJJiOby5Gnl9FDenkpEPrkBv/yMLjNxTSR
	kNOktTwRdSYU4zZuTSO2pVLhcyH+ywvaDjs+IFNE9h6MvTfc=
X-Google-Smtp-Source: AGHT+IHul8aIkPK2JDOH4OgBtoVXKzlCdUGWTDtw/+uQHQHhn5HXtys5/EC62P1jGKykHqA4Au8G0g==
X-Received: by 2002:a05:6000:400f:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a6d11932bemr13084195f8f.1.1750753727375;
        Tue, 24 Jun 2025 01:28:47 -0700 (PDT)
Message-ID: <3eaaa6c8-d696-4eca-913e-6e6fd9e618d3@suse.com>
Date: Tue, 24 Jun 2025 10:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
 <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cf4679d-ee86-4666-adae-63a3f9b9b8f7@suse.com>
 <BL1PR12MB5849672813202821C57EAD5CE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849672813202821C57EAD5CE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 10:26, Chen, Jiqian wrote:
> On 2025/6/24 16:17, Jan Beulich wrote:
>> On 24.06.2025 10:12, Chen, Jiqian wrote:
>>> On 2025/6/20 14:34, Jan Beulich wrote:
>>>> On 19.06.2025 08:14, Chen, Jiqian wrote:
>>>>> On 2025/6/18 22:33, Jan Beulich wrote:
>>>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>>>> +} vpci_capability_t;
>>>>>>
>>>>>> As you have it here, ...
>>>>>>
>>>>>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>>>>   */
>>>>>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>>>>>  
>>>>>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>>>>>> -  static vpci_register_init_t *const x##_entry  \
>>>>>>> -               __used_section(".data.vpci." p) = (x)
>>>>>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>>>> +    static const vpci_capability_t finit##_t = { \
>>>>>>
>>>>>> ... _t suffixes generally designate types. I don't think we should abuse
>>>>>> that suffix for an identifier of a variable.
>>>>> What do you think I should change to?
>>>>
>>>> Well, if you take my other advice, this question won't need answering, as
>>>> then you only need the ..._entry one.
>>>>
>>>> Btw, noticing only now - why is it finit that's used to derive the identifier?
>>>> With that, it could as well be fclean (leaving aside the fact that that's
>>>> optional). Imo the name would better be derived from cap, and it would better
>>>> also reflect the purpose of the variable.
>>> I considered this.
>>> I think it is easier to use finit, and finit contains the cap type, and the main purpose of this struct is to initialize the cap.
>>
>> Yet identifier names should make sense for the object they name.
> OK. What's your suggestion about naming the entry?

cap##_init or _##cap##_init for example.

Jan

