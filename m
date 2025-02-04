Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82F6A272C8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881462.1291603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIzO-0002Wu-Qi; Tue, 04 Feb 2025 13:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881462.1291603; Tue, 04 Feb 2025 13:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIzO-0002Ty-O2; Tue, 04 Feb 2025 13:29:18 +0000
Received: by outflank-mailman (input) for mailman id 881462;
 Tue, 04 Feb 2025 13:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIzN-0002Ts-Ri
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:29:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07a189fc-e2fc-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:29:16 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso6818336a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:29:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724ca086sm9394762a12.72.2025.02.04.05.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:29:15 -0800 (PST)
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
X-Inumbo-ID: 07a189fc-e2fc-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738675755; x=1739280555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3XlL6Vev5T6vXqu4rONlX+Bg16AVRQ+BBcjnP0nlPZM=;
        b=cAZ6lWzWzT4K4yGt9FqqO45DKYI1SzJf5bH0OCvXXzf5+Cf1W/IKOVBTPB/p3U7wUi
         jIWam+SYI48iQ3QqY6jGe4OijeZPQ7mLvfX3BHNBa6bANO/5/jmopHHH3tJvKgPEmsaC
         ONDNZYwUzfIjPBs4HCv4/h0jmlRDFfYTOqtc8THDehrOGTFB9W8Imjf05hKK2UX+zleu
         U7aTBcO/3wz33YNDAELzh4B9t7y/LSBG258C6nJIgXG6O7phgC8kCteJAmEIU172CoF3
         XMjEk8IvGHCpF7qx2jPL/aVkiTmB5Gt6yPKV8GGcAte2dHvOXRSy2kBi2VFbRvvX/Aaw
         0Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675755; x=1739280555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XlL6Vev5T6vXqu4rONlX+Bg16AVRQ+BBcjnP0nlPZM=;
        b=Y08hkuLTiN2gzZ22Mu/zF1iQk7h3gzTF60NUVNjN42D4QT36myxd9BkpZEqUY5g8C7
         pc1errIV/RHGCW42QT9J1LdtlrEuHG9YvImM6MRw9PXA5QGcuQx88tCZIyGTIRtOX/bQ
         Zvd0GTjZw2Yxp+HKAvCT/5JGkhv8qOkqQywYkREKBtIdmSKR78d7eawH4HwDU1++GF1c
         HM159y/eZsH+I+ccV8KaVAxNr5t67JWVqP5PicUOqhBCjMiBnms58yACo4kr8nTnKB8l
         HWwQUXYhaIFANVj8DKE7HTeXFPLgGy8IRJvvzwW7gpMLvishalq3Xv6wbRN2mstshlG0
         Hb/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdNWl1kz42prL1JeQsZkCfOMJyq8qXxZE1FDxR9W0RVrCzL/k3B4QX1BMYlpCOxPvgaGifWUoxWSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhRT1CUw7bXL9uJfSfSWLurBziDGLxDbigN6P4Kq7jw8pFH70z
	/mMZD5DLy3y77c2blfGZH9T4gArvhibkhEXowB2FpDVgayzaJS2Rd+4LR15xNFKsoIzPsHmqIsU
	=
X-Gm-Gg: ASbGncvnRS7CPA+DOzp807vUwQIWKtXc/TNCaPA9xoH9ZiRpZm7iTBwVFjSMw2/hiB5
	fMdj/yPyF17e1DH/LC6RsvHMehEzCNZDv7NaG8jotCV4y98eGi+/djRNT/ulfKwaSedbgSbp0BV
	MPGbWL0FPSHGOGrTUJH/d3juxKpegVSLej38DhOaqsZFqvkW9TWcV/LoJBGswt4nxCMPhNWS68Q
	snJ2w+XuNSoNyyEsRVZXEv/JmJ4f/0saz7C9yH7wXZBllE4x5seUk4il1d/9u4fm+jgBuqQy9Jj
	4WlUC3NG4l2mj8LwnH4wLxOdHF7uQCUAe/jxpu7WJQvAOpR1/S2GOR+97OjxvQJmWiDI0KpIJlj
	g
X-Google-Smtp-Source: AGHT+IHRshbJpFqxh9lGJ//tyRhILiB13c6V0YKdtX94Objc6Cm264hho2Tb8p4PdxmC1FGBxZOSRw==
X-Received: by 2002:a05:6402:2816:b0:5dc:1395:1d3a with SMTP id 4fb4d7f45d1cf-5dc5efa2e79mr28830363a12.1.1738675755426;
        Tue, 04 Feb 2025 05:29:15 -0800 (PST)
Message-ID: <8244c4bc-f815-4793-be58-ae1a5a58b526@suse.com>
Date: Tue, 4 Feb 2025 14:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 1/2] x86/shutdown: quiesce devices ahead of AP
 shutdown
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250128162742.90431-1-roger.pau@citrix.com>
 <20250128162742.90431-2-roger.pau@citrix.com>
 <9673c95f-7ee6-461c-8678-46aeab55735a@suse.com>
 <Z6H9-9QyJOsN0gft@macbook.local>
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
In-Reply-To: <Z6H9-9QyJOsN0gft@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 12:46, Roger Pau Monné wrote:
> On Wed, Jan 29, 2025 at 11:13:09AM +0100, Jan Beulich wrote:
>> On 28.01.2025 17:27, Roger Pau Monne wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1803,6 +1803,38 @@ int iommu_do_pci_domctl(
>>>      return ret;
>>>  }
>>>  
>>> +struct segment_iter {
>>> +    int (*handler)(struct pci_dev *pdev, void *arg);
>>> +    void *arg;
>>> +};
>>> +
>>> +static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
>>> +{
>>> +    const struct segment_iter *iter = arg;
>>> +    struct pci_dev *pdev;
>>> +
>>> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>> +    {
>>> +        int rc = iter->handler(pdev, iter->arg);
>>> +
>>> +        if ( rc )
>>> +            return rc;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
>>> +                        void *arg)
>>> +{
>>> +    struct segment_iter iter = {
>>> +        .handler = handler,
>>> +        .arg = arg,
>>> +    };
>>> +
>>> +    return pci_segments_iterate(iterate_all, &iter);
>>> +}
>>
>> For the specific purpose during shutdown it may be okay to do all of this
>> without locking (but see below) and without preemption checks. Yet then a
>> warning will want putting here to indicate that from other environments
>> this isn't okay to use as-is.
>>
>> This use then also requires that msi{,x}_set_enable() paths never gain
>> lock-related assertions.
> 
> Good point.  It might be better to just wrap the code in
> pci_iterate_devices() with pcidevs_{,un}lock().

I'd recommend against doing so. If this was just for ordinary reboot or
shutdown, then yes. But we can crash with this (or any other) lock held.
And this particular lock we hold for sometimes pretty long sequences of
code.

There's anyway the wider issue of how much code we want to involve in
rebooting (or kexec-ing) after a crash: The more we do, the more likely
that we run into a knock-on issue from the earlier crash.

Jan

