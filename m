Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B064B1C22D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071432.1434889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZY1-00052n-RN; Wed, 06 Aug 2025 08:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071432.1434889; Wed, 06 Aug 2025 08:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZY1-000507-O9; Wed, 06 Aug 2025 08:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1071432;
 Wed, 06 Aug 2025 08:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujZY0-0004yq-MX
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:30:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc427f7-729f-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 10:30:55 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso11149551a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 01:30:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a396fsm1065094766b.42.2025.08.06.01.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 01:30:54 -0700 (PDT)
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
X-Inumbo-ID: abc427f7-729f-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754469055; x=1755073855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cxaFVrKD0vX9OqDoZeCQDISNDDaHhnL2BmqJAOAItRU=;
        b=csoim9jMiXBZzgWO+3idmrWML5Wx2QdQh+NM/5hBGbY0w8P4RPcBDlKMmXHBKBSOl5
         ZB64O8jYdsFLiCNqJEPDBhT+q/U9z1b70HsooXIvcI1+gtMafnXaeQ3Lw4PKPFX/kRXu
         Hp+0XymWHKE9Me5UfdxqoCrmGowUgayTWaF1c5fm1s6CPjCIm4+c8q+26MBXmQOI6lKC
         SppIsDBaNoO5Fa4AQ6dCV0oPZ9Sh2X8zSKmU5k5eRBB+VCQ88w3Y2xrqJJ9blwApxBSj
         8hRrn6hpNyK34YQBU5AzIcZFZMV5Y26z46n98pLjVUTs9jhvs7HNSwCnWFZkA7q9T1kL
         s11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754469055; x=1755073855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxaFVrKD0vX9OqDoZeCQDISNDDaHhnL2BmqJAOAItRU=;
        b=pllW3xDvZUuY98k80IPJ5fbgyH1fIhLWuRFjuqokTwFBv+VuNNdZTtJdlqMHvawv2a
         ONFkbluN0KVy2kuj4sk9HicQnTg9LW2d2C+7rsyCy30a1jaKSYxMHZfpcY4jG9nq2Qy2
         14S0lJiV9D9HMNV/aOhVrnBrLhPfBPtLVpn6LvKibIrkKESHR74+ZPDfVX5OW741I7+z
         chquKLTsuVlFLVIMzYgdfKUoc94ZjjlNhAtAQvAP3dfU72GGP9hvcXCdqxRL3eJdb2LL
         F5uPSsRw9/ONEFDFwqR3fYhXAw1oLgvGOSZXsa+k9y/MI+VBaPedDx42b5LEQnDtjnru
         aR3A==
X-Forwarded-Encrypted: i=1; AJvYcCXA9GgAXjzTmfx//QCdr62uLcSx7y3G6CfQ7QOAUe/gd6VXx6m8zt/Z73sJd1+zb4+Bh0MgA2fM51I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVbOBLNpTyKzGpzk1Axr9EjbGnKWC/ps6bO86Dfj9PQB7ph+Ll
	5/jiH2O3xZh7ayUINBHunpu6bqq0cky2X6Qcg+lxLPHKgnHCXVQSvB8/oxpV1gevWKPDk0HKhme
	OGK0=
X-Gm-Gg: ASbGncvLlxAjy7fRAKFKyxtdwRNN1xYf4eDFsmD27KK66o+BIMn2fZflQngDGPruNrL
	qClz6Tkt5hZQJw9avz1mpHDMO6KP07xWTIMR7odVId1S9m870rNaRVB7S4MuMCOvT446R1sIX/I
	DDYybepntBb1fNgHXA5BwoXLqAnIUU2v0mmAlnzvUphrFV2taWqLWN627lbz26HB8l4+7S4ajgj
	p9F1tLV9bCPfKnVl3RTN0UJr0DkXJJrSiQ3Gxa3UFK+xGPYvw/vwhgWhNqvkoZWjeobmnEYaE3g
	qrqmblMbzy9U7kAmyrJSb1wN6h+EGmtccWrLRnbvidtF9/lHD8iY7ohlYyBCkR1BnEG63S9pMgy
	zdeCr1854nRjGMMxvPlcVVdlR4LXBN9vODbF4BVTx7pv4/6SbYWcja08XpUIYmLSs948i1Rw/88
	pdkWXJwRg=
X-Google-Smtp-Source: AGHT+IGlz9IeWpuavLOL6/O3IWHCXmSYiBeyfe7pSC7x3LeAuW5SfwGyxgZQE8LzRRfxOYsDtgCdGg==
X-Received: by 2002:a17:907:981:b0:ae0:b33d:2a4a with SMTP id a640c23a62f3a-af9904014fbmr181279866b.35.1754469054977;
        Wed, 06 Aug 2025 01:30:54 -0700 (PDT)
Message-ID: <20990797-0523-429d-a920-a8e2ba92d18b@suse.com>
Date: Wed, 6 Aug 2025 10:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
 <aJMQrT8NtdDguvYN@macbook.local>
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
In-Reply-To: <aJMQrT8NtdDguvYN@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 10:22, Roger Pau Monné wrote:
> On Tue, Aug 05, 2025 at 10:43:09AM +0200, Jan Beulich wrote:
>> On 05.08.2025 05:49, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>>      return 0;
>>>  }
>>>  
>>> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +    struct vpci *vpci = pdev->vpci;
>>> +    const unsigned int msix_pos = pdev->msix_pos;
>>> +
>>> +    if ( !msix_pos )
>>> +        return 0;
>>> +
>>> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
>>> +    if ( rc )
>>> +    {
>>> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
>>> +               pdev->domain, &pdev->sbdf, rc);
>>> +        ASSERT_UNREACHABLE();
>>> +        return rc;
>>> +    }
>>> +
>>> +    if ( vpci->msix )
>>> +    {
>>> +        list_del(&vpci->msix->next);
>>> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
>>> +            if ( vpci->msix->table[i] )
>>> +                iounmap(vpci->msix->table[i]);
>>> +
>>> +        XFREE(vpci->msix);
>>> +    }
>>> +
>>> +    /*
>>> +     * The driver may not traverse the capability list and think device
>>> +     * supports MSIX by default. So here let the control register of MSIX
>>> +     * be Read-Only is to ensure MSIX disabled.
>>> +     */
>>> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
>>> +                           msix_control_reg(msix_pos), 2, NULL);
>>> +    if ( rc )
>>> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
>>> +               pdev->domain, &pdev->sbdf, rc);
>>
>> Here as well as for MSI: Wouldn't this better be limited to the init-failure
>> case? No point in adding a register hook (and possibly emitting a misleading
>> log message) when we're tearing down anyway. IOW I think the ->cleanup()
>> hook needs a boolean parameter, unless the distinction of the two cases can
>> be (reliably) inferred from some other property.
> 
> I don't think we have any signal in pci_dev itself that notices
> whether the device is being deassigned, in which case it does need an
> extra boolean parameter to notice whether to add the r/o handler.
> 
> I'm also wondering whether we want to limit this hiding to the
> hardware domain only, and for domUs fail the operation instead, and
> fail to assign the device.  That can be adjusted in a later patch
> though.

Yes, DomU wants handling as you say. Iirc there are other open issues with
DomU support, though. Hence yes, "later" ought to suffice here. Perhaps
worth annotating with a fixme, though, to be able to easily spot all the
places that require adjustment.

Jan

