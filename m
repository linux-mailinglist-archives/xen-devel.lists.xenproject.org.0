Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C8CAE5FC1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023418.1399407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzHD-0000cq-RV; Tue, 24 Jun 2025 08:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023418.1399407; Tue, 24 Jun 2025 08:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzHD-0000Zx-OA; Tue, 24 Jun 2025 08:45:11 +0000
Received: by outflank-mailman (input) for mailman id 1023418;
 Tue, 24 Jun 2025 08:45:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTzHC-0000Zp-Bl
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:45:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b4328a-50d7-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:45:09 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso101248f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:45:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8608d4asm101232745ad.128.2025.06.24.01.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 01:45:08 -0700 (PDT)
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
X-Inumbo-ID: 88b4328a-50d7-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750754708; x=1751359508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8miDBLok/lM907sVFvUEWVZBUvkM2zC54U64JikRjmo=;
        b=K7xWzFmK1q2Ky3vhimc+aRaC823KGg5128pbaw59H/qDp54J0j77wZZBM13FS6oWz5
         tKn/jg3VEisytTBXxUOTK3f8b2xUO8EgLKBKpAg7bdKT50VD4agQsQoHm/aniImqtskp
         ysq6XQ2iVVJl24vbJK2lgN80z2lvNrpucmuwPf0nPSJJ2h15u+yrLLZZB7xKUjtTkc1f
         GdS/BlujxlC2g+mqogFAbp8YUohFqqAKimbQnRy+jY/HPfFKOlNXKQN0xwfvqSJ11yAX
         JjUyh8YFZG6Au78S8amAjthiETy4vSTUbTKh5wWKLX4mcqp5V2jpZLQjkZWRHysMyyzL
         Titw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754708; x=1751359508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8miDBLok/lM907sVFvUEWVZBUvkM2zC54U64JikRjmo=;
        b=hnQjJggCInfknCrnE3t6QcWbJy5wuYIIxIOsow423iLbogen3x0nO3QDEBg34/vZZD
         6r+w2VCpZevs+y7axS07pO5MChV56CvBJggIoRDaCXgPUP0yGzDci6TdgTfIQmYD+GJr
         TMciEuVXeb1imAVDKaKhGHUy4wwTzBLVFNtbeQ2K8HSY29xuMPQnz5DzR82yCO00OWk2
         uK0R51cax0YDa5fgfaqI04V/Op0Uk+G8C5B9evbXeBnBheej0qimjH4MeRqojzopXLc1
         iIU0/g6voJc+767UMGqzUEZsAYyApBhIgw3lE+9rL+S87uL1ZDOv1ht0B40df6Oyim5b
         oK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3Gu0/S1avaJ/DK4MXyT5kf/Fda/1Od6ESkq5NerEQL0Rx9T/lMO9mF59fSA5f4a72cdj8K/Bxvbs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHcGeqn9FN4n4JKpOivzzBh8UGttonH4hR2B9Oup1W1UhdITvI
	piUdBmko8Od94mggnBRarVsSJRWvkK/bu/tj9q63jeLOeA1owVPTVfAkBzWgGgSsig==
X-Gm-Gg: ASbGnctn0VxiInS1dEDhsSjbmseZx0fn/elTO5e8AynvRKbOhGDvEo3YHTTJSkPFfaw
	f10QIprsVwyNSyhBQQZOwN3iJFgfI4F9UV2oH/7viUhqH3gPnHhPr3HUHblq0FOUeYhZbIZw6Oc
	ZcPDR9K00+qxZCD555kRwRrXbtFcV8wjSpBnP/fZcm+rhzOF5HEmRoXJ/f2JluWVB4xXQnoZvrR
	3oq2T2Kdm94oJG5sNnt7vE2dBYdy+npuDOxcyv1O3prHvWDiNNOt/ipdnnzg2+0gqvsWi9pSr0s
	nz9RfgdH15xmmfX6WzfDRWXQPv37+6tXFKwlyOFsYuZcMKu+rEyyhCSqLMSXJtqDksBgTvfByvJ
	b/+7hhsDwgWGxA9POA88HAfwWyPbWMcEYQbf2liXYG39jT1E=
X-Google-Smtp-Source: AGHT+IEamTWLjidQw/vJ1Lq7cC+W/3IirPny9cjAL1lXqqhRufSTPbXH48ErDzeV2hrskdNork0SfA==
X-Received: by 2002:a05:6000:2b09:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3a6d1329a75mr8348679f8f.43.1750754708544;
        Tue, 24 Jun 2025 01:45:08 -0700 (PDT)
Message-ID: <1ea09a95-5f13-4af4-bad1-e7081bf065fc@suse.com>
Date: Tue, 24 Jun 2025 10:44:58 +0200
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
 <3eaaa6c8-d696-4eca-913e-6e6fd9e618d3@suse.com>
 <BL1PR12MB58497F436C3E127CB9014BFDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58497F436C3E127CB9014BFDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 10:32, Chen, Jiqian wrote:
> On 2025/6/24 16:28, Jan Beulich wrote:
>> On 24.06.2025 10:26, Chen, Jiqian wrote:
>>> On 2025/6/24 16:17, Jan Beulich wrote:
>>>> On 24.06.2025 10:12, Chen, Jiqian wrote:
>>>>> On 2025/6/20 14:34, Jan Beulich wrote:
>>>>>> On 19.06.2025 08:14, Chen, Jiqian wrote:
>>>>>>> On 2025/6/18 22:33, Jan Beulich wrote:
>>>>>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>>>>>> +} vpci_capability_t;
>>>>>>>>
>>>>>>>> As you have it here, ...
>>>>>>>>
>>>>>>>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>>>>>>   */
>>>>>>>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>>>>>>>  
>>>>>>>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>>>>>>>> -  static vpci_register_init_t *const x##_entry  \
>>>>>>>>> -               __used_section(".data.vpci." p) = (x)
>>>>>>>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>>>>>> +    static const vpci_capability_t finit##_t = { \
>>>>>>>>
>>>>>>>> ... _t suffixes generally designate types. I don't think we should abuse
>>>>>>>> that suffix for an identifier of a variable.
>>>>>>> What do you think I should change to?
>>>>>>
>>>>>> Well, if you take my other advice, this question won't need answering, as
>>>>>> then you only need the ..._entry one.
>>>>>>
>>>>>> Btw, noticing only now - why is it finit that's used to derive the identifier?
>>>>>> With that, it could as well be fclean (leaving aside the fact that that's
>>>>>> optional). Imo the name would better be derived from cap, and it would better
>>>>>> also reflect the purpose of the variable.
>>>>> I considered this.
>>>>> I think it is easier to use finit, and finit contains the cap type, and the main purpose of this struct is to initialize the cap.
>>>>
>>>> Yet identifier names should make sense for the object they name.
>>> OK. What's your suggestion about naming the entry?
>>
>> cap##_init or _##cap##_init for example.
> If so, I need to extend the parameter of REGISTER_VPCI_CAPABILITY since current cap is number, not string.
> Maybe:
> REGISTER_VPCI_CAPABILITY (cap, cap_id, finit, fclean, ext)

Well, yes, in the helper macro you may need to take precautions. However, I was
wondering anyway why

REGISTER_VPCI_CAP(PCI_CAP_ID_MSI, init_msi, NULL);

would be necessary, when

REGISTER_VPCI_CAP(MSI, init_msi, NULL);

could do, using e.g.

#define REGISTER_VPCI_CAP(cap, finit, fclean) \
    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##cap, finit, fclean, false)
#define REGISTER_VPCI_EXTCAP(cap, finit, fclean) \
    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##cap, finit, fclean, true)

(other variations are possible, of course). Then you could easily derive the
identifier wanted (requiring another parameter to REGISTER_VPCI_CAPABILITY(),
yes).

Jan

