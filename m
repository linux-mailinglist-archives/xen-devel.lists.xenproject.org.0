Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D4A26CD9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 08:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881130.1291249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfDiE-0007rZ-TJ; Tue, 04 Feb 2025 07:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881130.1291249; Tue, 04 Feb 2025 07:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfDiE-0007pO-Qa; Tue, 04 Feb 2025 07:51:14 +0000
Received: by outflank-mailman (input) for mailman id 881130;
 Tue, 04 Feb 2025 07:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfDiD-0007pF-C0
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 07:51:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd9b9e60-e2cc-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 08:51:12 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso1045685466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 23:51:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6fe37da7bsm700209366b.109.2025.02.03.23.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 23:51:11 -0800 (PST)
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
X-Inumbo-ID: cd9b9e60-e2cc-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738655472; x=1739260272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tpER173M8Lm7Ddy3Yn+c7P4ef3Z61dTLrLnhOQUlcmM=;
        b=Zi8FlvHB5VvkA/bgFDMHZLck/R2zM6c9/LsFAVX/+Bhwz3ic/A4XkOevdz1hL685i5
         FHcacidrsvk35Hjz3AmeOAKR4a11EEFdSSjul63UZBKwcyDE3v+SEZca9F75VuJ+DBVg
         Btl/sxzCyZtoONMk7c3IORg1Y0VHSsZ76nXfH5wmc05Cpt030Im11h5d43nAL+h9Fnxr
         /QONNZLge4yDFiz4QnLT7PMwn53AOCDrzT41kbva3ubVhx+6ENBsIdZOGzYjhBIZO50W
         SK2pRxszw+iUJ6cuPThP1v5IquLtW3MHcPyHzstHdnabNHn+vJZsjSoDNYWwJ66NSm+J
         /1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655472; x=1739260272;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpER173M8Lm7Ddy3Yn+c7P4ef3Z61dTLrLnhOQUlcmM=;
        b=o6VZt59SVB4/4iiGZcpg+keNS+hUSPU3+GtrxWjflXOMxXl+Yk0JRiKt26SyhAJ/Pa
         7H6tfXhdn3TAwJGXQU6qCBj6nMSe95Y3gszxEO7KMSejtJciVXP9SOUa2oo5iC0Xtzb7
         UtCSm4hSANOUgK6mQALrM6RhFd1/ZmTlUoPyVbAlBLKrry224JrjqDPopszSlIVqnuGt
         D4Q0ee8Zye58/UyheuOQVFSheI37yz6HW52WtcERi/4MWfz6BpZJq9mZtlVf7eCqiZiO
         Z2Gqx+NxgRYJ9tPRvJtPlLrJ9XE1/iTUy16CVz9Ra+wiFkejfkKrq8spev2f9gUcem4r
         QhiQ==
X-Gm-Message-State: AOJu0YwUWkqJIl4Sx6Ot595JaJlg6ak81Y0Bt3eW/GdVwyeadD3Agn6U
	5KmSbL5G6vjmtqR370OmO95FpJwPSRvSRfJ1O8atVb5zav+ijErbJXnoFChGwA==
X-Gm-Gg: ASbGncuvTyw3z2AF81ig1i9yUIQQRIthqp/fCFFxQXQngQKGU08kv16bzlb20CuNiMn
	GCdOZFuUf4a9WcwhvLSViplnACbqq66Ux2RVn/Fjse/HM9KV40pifzPGzy1rjtV9u0Lj17hVrbY
	oXDln9flucy2EGhdEI3J8/sZzsqpVezCOS+vJ00EgmvzBRqPJLnyg9Mbhlc0r7VkjLkwmLKHi6S
	oI/QjaGTf3TAL/ePnhssoZKiAgswYDs1KMFKPhRZ42MvpounRfNUM+6QFplA8GiFJPCorIUgVEJ
	3oUeikH+V6bn1w7iThC7E/JlNTHFW7Yzh7fzWY2vzEhwgyTm0NiTUd3x/XKqXivLEvQIiSqRxwT
	9
X-Google-Smtp-Source: AGHT+IHg991QIChVHPIhdKIgHwrS5XWDlUsCciw1Rc+W1sUuFoUkvVMwqejzWNM8n67jDRIITfh5/w==
X-Received: by 2002:a17:906:6a15:b0:ab6:bbe6:2a33 with SMTP id a640c23a62f3a-ab6cfcc9f7bmr2732721866b.15.1738655471840;
        Mon, 03 Feb 2025 23:51:11 -0800 (PST)
Message-ID: <afaff8bf-41c5-4c80-a24d-3ce748b52a6a@suse.com>
Date: Tue, 4 Feb 2025 08:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
 <Z6D6c69hJrxUdnJG@macbook.local>
 <8b0d0446-04d9-4aab-8ede-d12f3442ac1b@suse.com>
Content-Language: en-US
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
In-Reply-To: <8b0d0446-04d9-4aab-8ede-d12f3442ac1b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 08:45, Jan Beulich wrote:
> On 03.02.2025 18:18, Roger Pau Monné wrote:
>> On Mon, Feb 03, 2025 at 05:27:24PM +0100, Jan Beulich wrote:
>>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>>> @@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
>>>  {
>>>      bool valid = true;
>>>  
>>> +    if ( pci_add_segment(0) )
>>> +        panic("Could not initialize PCI segment 0\n");
>>
>> Do you still need the pci_add_segment() call here?
>>
>> pci_add_device() will already add the segments as required, and
>> acpi_parse_mcfg() does also add the segments described in the MCFG.
> 
> Well, in principle you're right. It's more the action in case of
> failure that makes me want to keep it: We won't fare very well on
> about every system if we can't register segment 0.

Thinking about it: Your question may be more applicable on Arm, as I'm
entirely uncertain whether there segment 0 is always going to be needed.
I could well imagine system designers deliberately putting all the
devices elsewhere. Segment 0 always being in use on x86 is more a
heritage thing, after all.

Jan

