Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8B9101A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 12:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744410.1151455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKFFs-0005dI-Ta; Thu, 20 Jun 2024 10:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744410.1151455; Thu, 20 Jun 2024 10:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKFFs-0005aD-QY; Thu, 20 Jun 2024 10:43:00 +0000
Received: by outflank-mailman (input) for mailman id 744410;
 Thu, 20 Jun 2024 10:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKFFr-0005a6-Ii
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 10:42:59 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db7bfd2b-2ef1-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 12:42:57 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so1200111f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 03:42:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e55e54sm134141535ad.23.2024.06.20.03.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 03:42:56 -0700 (PDT)
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
X-Inumbo-ID: db7bfd2b-2ef1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718880177; x=1719484977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gUbs0PVhQSU0rqVDNSjoLUAJk3gtFLPXXQqr/l5DJxo=;
        b=fgEq82XknhlGUsF6aApOLdJ7sf4904949fIOU18vv6i9JERVYYU3sjmhTo2KiUCbVl
         Hi0dILz+BeKiPhNrG8kgFaDrT72vg90kUdsdc7gWclnMNDrUItMkKl4xcIFgphR5OM8t
         /aEQflY+9oI2e25DRI57EbxOwZNEtkkoMMya5FB1x8o7+MvSl/VGYm4Q8V3QnJHmjQoW
         jJM7eHiFkGR0R7F+R0K5sQa3LzfIDhgbm0YAGMn3/jjIQfLDF3EwmF13Q8ziKvAc5p/F
         HKoZlxf8pgbW37TgJXszkXkesJe02qHeGVybld2d8wAKNV5VxXwzKiIg78r9BPVRjPDO
         ycdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718880177; x=1719484977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUbs0PVhQSU0rqVDNSjoLUAJk3gtFLPXXQqr/l5DJxo=;
        b=Ip5aprDgXDHoyBdemkoOJHUFCQ3r5APLGcw7RR0pdJo1pdXjo6M2JyjrlX3P4G6vuc
         gXCa1n9RAyXG8rHnI0BHoxzkG3qb1A3yHWHKAVcgZ4faPk2GP0Ara8DKROLAOU/3s8W7
         uH/0gNuiKGb/O6Dsqynphc0ycGpajYhSJm/WuJwT9f67gLpChmHHj5TMrLarHyTs6/rj
         Q0wvKu7Kyzhr9LzoqikYYQM/yuaaX8QIwv4A78dbWXvsxryoVG2cMqQBg38wHjmfbLqe
         fz0odMZNjT6wKS6hyf3hLbBDMrX9DFiCR5tA7cDRbQy10tbuydtCromGB7kA2vlu6Aaq
         Vfmg==
X-Forwarded-Encrypted: i=1; AJvYcCUrWaefhqYfY+FZUkl02fZBGZkShjeyb+l7d3/Q0kWWhdXqWhowyqCKd6pLpNk1tehMh5FuICnu7lFOioRIn0LBYmMjtEGIm8vTcbsZ4pI=
X-Gm-Message-State: AOJu0Ywtjxt3zPrMaIVrQU5NqdIWSPTTOdeIlXChWkn8R8e8gB+8iBKz
	KCiKWD0wIYDrAM5ZC3F1ecBDz7tbU3eqQIMuoPieVG8IA0CgDmxqh7uJFWa5Zw==
X-Google-Smtp-Source: AGHT+IHTF5kXUR9jiDJEWQd2zzP2Xf/mVRGFWG4rDz77KAwQ+s1yxkd8xB0p/eMmxdJkUeqdEI1CNw==
X-Received: by 2002:a5d:52ca:0:b0:35f:1e44:803b with SMTP id ffacd0b85a97d-3609eaa9782mr6292745f8f.35.1718880177268;
        Thu, 20 Jun 2024 03:42:57 -0700 (PDT)
Message-ID: <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
Date: Thu, 20 Jun 2024 12:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Anthony PERARD <anthony@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 11:40, Chen, Jiqian wrote:
> On 2024/6/18 17:23, Jan Beulich wrote:
>> On 18.06.2024 10:23, Chen, Jiqian wrote:
>>> On 2024/6/17 23:32, Jan Beulich wrote:
>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>              rc = ERROR_FAIL;
>>>>>              goto out;
>>>>>          }
>>>>> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
>>>>> +#ifdef CONFIG_X86
>>>>> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
>>>>> +        r = xc_domain_getinfo_single(ctx->xch, 0, &info);
>>>>
>>>> Hard-coded 0 is imposing limitations. Ideally you would use DOMID_SELF, but
>>>> I didn't check if that can be used with the underlying hypercall(s). Otherwise
> From the commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf, DOMID_SELF is not allowed for XEN_DOMCTL_getdomaininfo.
> And now XEN_DOMCTL_getdomaininfo gets domain through rcu_lock_domain_by_id.
> 
>>>> you want to pass the actual domid of the local domain here.
> What is the local domain here?

The domain your code is running in.

> What is method for me to get its domid?

I hope there's an available function in one of the libraries to do that.
But I wouldn't even know what to look for; that's a question to (primarily)
Anthony then, who sadly continues to be our only tool stack maintainer.

Alternatively we could maybe enable XEN_DOMCTL_getdomaininfo to permit
DOMID_SELF.

>>> But the action of granting permission is from dom0 to domU, what I need to get is the infomation of dom0,
>>> The actual domid here is domU's id I think, it is not useful.
>>
>> Note how I said DOMID_SELF and "local domain". There's no talk of using the
>> DomU's domid. But what you apparently neglect is the fact that the hardware
>> domain isn't necessarily Dom0 (see CONFIG_LATE_HWDOM in the hypervisor).
>> While benign in most cases, this is relevant when it comes to referencing
>> the hardware domain by domid. And it is the hardware domain which is going
>> to drive the device re-assignment, as that domain is who's in possession of
>> all the devices not yet assigned to any DomU.
> OK, I need to get the information of hardware domain here?

Right, with (for this purpose) "hardware domain" == "local domain".

Jan

