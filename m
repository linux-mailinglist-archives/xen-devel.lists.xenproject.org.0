Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4990C542
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742902.1149780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJV3Y-0007Ia-6f; Tue, 18 Jun 2024 09:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742902.1149780; Tue, 18 Jun 2024 09:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJV3Y-0007H4-3m; Tue, 18 Jun 2024 09:23:12 +0000
Received: by outflank-mailman (input) for mailman id 742902;
 Tue, 18 Jun 2024 09:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJV3X-0007Gy-0O
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 09:23:11 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60123bef-2d54-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 11:23:09 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57c83100c5fso5652297a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 02:23:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f63f7e9d8sm492780866b.182.2024.06.18.02.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 02:23:07 -0700 (PDT)
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
X-Inumbo-ID: 60123bef-2d54-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718702588; x=1719307388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X2cOGxP+OyaxgX906gQx67pblQNDp8zrUXWHTlRxoMk=;
        b=gPQXa9wq81PW27PVQRsSxpAZEpRUTuDXQ3kqxW6i9gXYdxkykTkK3iCQdXQSefyLrw
         985PwbH8uGpFhqIi7Qt8I8elHHxhNaMxkf9i0footZcXGK7FRUaaWcNKnkycVhvh2jMo
         L+bRjOIeRila8qx+Xtkfv0veuGu0tGrqDmEifdErjFN6ZjOEz1D3IJgODR+nppgqENNc
         Sk2eOG86O9Rr39wG4/6FChVQrceD28XmdxadWdQPaaz35KzT4lqm6l3OuolIByvkXiBT
         oT+j95BOMJY7Q90+qsxk99+CZgSmZhY4DyXBOoW3KIw/cxb82f9DGxq08Zl2t0JDKemo
         x5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718702588; x=1719307388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2cOGxP+OyaxgX906gQx67pblQNDp8zrUXWHTlRxoMk=;
        b=wLxxbtSi64Oek448wmpOVUL+LdLOBhoDzmu7HNWlh5P8HEI/vCFp4dC++SSKDloPBz
         mOOiF6UgVPvwuGkkW/XIEoFzqDsVE1TKtfjWNr5SQR4uAvvr1IAq7vnpwU+QmHLUERmy
         dKkRNbiK5MYKfJngQsEYZ366RzjKaBcC5tp7D+SyUVakGfEJNG3t+WBmlo+vDYHn6pHn
         Ee95V/sQcSZqTTpmnCsrihpXmYB7SOUDqjW5zVDvhMZ5F/ECHgmpc4RJD5/gy3f8IaKp
         DipH/Aky1JKHQTW1NRF2MlU7pyRTE1aeVve+laHrM7Eo1wCDx04cjxiuaY9fiP5Spi1C
         N98g==
X-Forwarded-Encrypted: i=1; AJvYcCVP1W66XkgyuC4DnJwKfmHwixul2aasGI+YhG3GR1vovPwNxVSt37OTX71hQTAwTVbQuSd3vpx2uz03WxkL9nkx4gFvsyU4S3cRdWwQwFc=
X-Gm-Message-State: AOJu0YyH7dG8wLIp2pi+Wu5/oMAgKK1DXLbfzp2aUcy+vbbDHfyXObJ6
	53U8yyxs13SuXv+FgtG9PXGXUABXEkPw+5t317pWBnhk+Uah9YpE/C2JwJWgFQ==
X-Google-Smtp-Source: AGHT+IGNSpRQzR/k4AoPEJne+cDcAACxwW6b/CiQ/k1ex8Yt/fwQx+LLgfytepi24DUW4cYisMRmhQ==
X-Received: by 2002:a17:906:4883:b0:a6f:13f0:c8e9 with SMTP id a640c23a62f3a-a6f60dc54acmr733896766b.53.1718702587876;
        Tue, 18 Jun 2024 02:23:07 -0700 (PDT)
Message-ID: <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
Date: Tue, 18 Jun 2024 11:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 10:23, Chen, Jiqian wrote:
> On 2024/6/17 23:32, Jan Beulich wrote:
>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>              rc = ERROR_FAIL;
>>>              goto out;
>>>          }
>>> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
>>> +#ifdef CONFIG_X86
>>> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
>>> +        r = xc_domain_getinfo_single(ctx->xch, 0, &info);
>>
>> Hard-coded 0 is imposing limitations. Ideally you would use DOMID_SELF, but
>> I didn't check if that can be used with the underlying hypercall(s). Otherwise
>> you want to pass the actual domid of the local domain here.
> But the action of granting permission is from dom0 to domU, what I need to get is the infomation of dom0,
> The actual domid here is domU's id I think, it is not useful.

Note how I said DOMID_SELF and "local domain". There's no talk of using the
DomU's domid. But what you apparently neglect is the fact that the hardware
domain isn't necessarily Dom0 (see CONFIG_LATE_HWDOM in the hypervisor).
While benign in most cases, this is relevant when it comes to referencing
the hardware domain by domid. And it is the hardware domain which is going
to drive the device re-assignment, as that domain is who's in possession of
all the devices not yet assigned to any DomU.

>>> @@ -237,6 +238,48 @@ long arch_do_domctl(
>>>          break;
>>>      }
>>>  
>>> +    case XEN_DOMCTL_gsi_permission:
>>> +    {
>>> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
>>> +        int irq;
>>> +        bool allow = domctl->u.gsi_permission.allow_access;
>>
>> See my earlier comments on this conversion of 8 bits into just one.
> Do you mean that I need to check allow_access is >= 0?
> But allow_access is u8, it can't be negative.

Right. What I can only re-iterate from earlier commenting is that you
want to check for 0 or 1 (can be viewed as looking at just the low bit),
rejecting everything else. It is only this way that down the road we
could assign meaning to the other bits, without risking to break existing
callers. That's the same as the requirement to check padding fields to be
zero.

Jan

