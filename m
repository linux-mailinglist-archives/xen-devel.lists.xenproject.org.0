Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11FED1F87D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 15:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203286.1518533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg28R-00008X-GH; Wed, 14 Jan 2026 14:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203286.1518533; Wed, 14 Jan 2026 14:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg28R-00006m-DO; Wed, 14 Jan 2026 14:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1203286;
 Wed, 14 Jan 2026 14:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg28Q-00006g-BR
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 14:46:10 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beffb65c-f157-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 15:46:02 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so15469425e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 06:46:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee591933bsm31084985e9.15.2026.01.14.06.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 06:46:01 -0800 (PST)
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
X-Inumbo-ID: beffb65c-f157-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768401961; x=1769006761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LxSSAigpshvFRIR4HcF21VTPx1MqPmFL7Iw4jjvRg0A=;
        b=YmpsGUCtoabBxGE3eCvUUIO7fc8r3dKNatzVXOqEFr7jKOnemzP/7Q4ZHnxQxE58KO
         HjsCJAyl35HhjxxQs20vVvshWa+LWHXauByQrVqjhUDYK4Cvh79OgDKbsF2TVctXbjPi
         YYH1v8xh/205RxnCRvygsXHxtfJ2pS3Co5Rky38o2kod5tbX5ID13UxZC+LphOWC7x2V
         doYn9Df5D0JzotvsvBFmA9A1I2LqmXdZqdQxZg9cdX0kW17e5sjFcaA+Czv7VYYCQ4aD
         GwXgw02fsgUquh+FPunQcwwVwTiEEjnFMlIfdPhe9gwL8ayiRQqLV+8nZKGyCmW+fTZs
         mssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768401961; x=1769006761;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxSSAigpshvFRIR4HcF21VTPx1MqPmFL7Iw4jjvRg0A=;
        b=iYK3oujeg1wAxAJs12vf2YgB1FhlK6n6/8N3/MrXBGzrDISUn8pS3hBFbP3HHY1ItO
         kUbjtvdoNJn4XGhTWtbAjYXvLMSwa+ABNx4jmxcfCASHtjnSHOVoNvnuprAFzNOG2FOC
         42+gF/r2UP5JIPssO5x25GOd1AgnjVWJ2XzIUiAENDU9kZc9Ih14cVoNOHrzroJYBK+/
         qSiFY8d2VTfvtLgq659Evdw+076Un9Ceij8nCJkXXT/nCO7DtpKogX9teaaPW4noYTm5
         keekyJwl+/pXZww88Vr0pw+bOjMdHZtgghFvq6XGJ7M57f/MNPaUkEIcJEq24FdPCb4o
         gYVw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+jHPPQePWYKyM7un1VDUbSP6DEAf7rUmkHFyzgy4fhBYLZ9O+pFlJK9Gf4DBBwfwTLe2HC6qbKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRxnU6rV4lwkFVolj/viAXtxlJf0klaRQE7hR4IEu/3E5FUlIL
	O7rvVZMpQFJhTXDwRhKfmSf6l1fA14UEzeZZsoqvaSqPpYrpIomso1/fmKl0hs+Duw==
X-Gm-Gg: AY/fxX7NAgTkp6ywd0aaMpN5daSXKoUMHAloEhl6qw94rphJ2LyY3uaaIzAXgJl2lG6
	0wkQ73HkHlp5CSAdMAaj3Y0C7U2snoWjoldrcllfi0CLekHYmx1iD/amAhKZSkne78zjkfFu4BF
	n6mAmYq6ThoKh1NIzyesjN40N6Ap/VAVQTKp5+G2QTZL1ITh/WzXqlKoSA5voXW6o3zDOx4FVPE
	JpYJbeylMaAiQSnIdzEvCNf9L/j0Ilc0LKEAm/wJKAk26oyDQhbGxQGWbDjVxcRE2X7BMADMhZ0
	cYlfm8J4K6bq+YWjQ2zpziAhO3XwVbnEky+zwGnkIvuE5rpPsbhox5wCKDQIbbcDlHWAltixKVd
	KaWhJT5Lo9UHEN0zD8WDiFREK8uld5m/di3SJXu6jQDNsvuCAx0N1VDlytT7We29MaRg9aLO4HA
	5eDvzry/Juti/gZWMkMsrVVDkh68zCpx9AsI8P7t3U9PedAioWCoteN51+bS4FT5TmFaNp9mqid
	xc=
X-Received: by 2002:a05:600c:3e86:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47ee481c269mr30777665e9.21.1768401961327;
        Wed, 14 Jan 2026 06:46:01 -0800 (PST)
Message-ID: <79798faa-52eb-4ff9-b308-f7233d2fe2f7@suse.com>
Date: Wed, 14 Jan 2026 15:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: determine whether a device has extended config
 space
From: Jan Beulich <jbeulich@suse.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
 <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
 <cf24b83d-517f-4cd8-b7c0-94f60738dc50@amd.com>
 <e573cbe5-858c-4a7e-953b-f371c174125c@suse.com>
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
In-Reply-To: <e573cbe5-858c-4a7e-953b-f371c174125c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 11:46, Jan Beulich wrote:
> On 12.01.2026 22:07, Stewart Hildebrand wrote:
>> On 1/6/26 08:47, Jan Beulich wrote:
>>> @@ -420,6 +467,19 @@ static struct pci_dev *alloc_pdev(struct
>>>              break;
>>>      }
>>>  
>>> +    if ( pdev->ext_cfg &&
>>> +         /*
>>> +          * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express
>>> +          * devices have 4096 bytes.  Even if the device is capable, that
>>> +          * doesn't mean we can access it.  Maybe we don't have a way to
>>> +          * generate extended config space accesses, or the device is behind a
>>> +          * reverse Express bridge.  So we try reading the dword at
>>> +          * PCI_CFG_SPACE_SIZE which must either be 0 or a valid extended
>>> +          * capability header.
>>> +          */
>>> +         pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
>>> +        pdev->ext_cfg = false;
>>
>> I'm using a machine where
>> xen/arch/x86/x86_64/mmconfig-shared.c:is_mmconf_reserved() will initially return
>> false during Xen boot:
>>
>> (XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 3f
>> (XEN) PCI: Not using MCFG for segment 0000 bus 00-3f
>>
>> Then, during dom0 boot, dom0 will call PHYSDEVOP_pci_mmcfg_reserved, after which
>> MCFG becomes enabled in Xen:
>>
>> (XEN) PCI: Using MCFG for segment 0000 bus 00-3f
>>
>> On such machines where mmcfg/ECAM is initially disabled, this will effectively
>> set ->ext_cfg to false for all devices discovered at Xen boot.
>>
>> I'm not really sure if I have any good suggestions, but perhaps we could add a
>> macro or small function that returns something like
>>    ( pdev->ext_cfg && pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) != 0xffffffffU )
>> to allow this checking to happen dynamically (but this still wouldn't handle the
>> aliasing quirk). Maybe re-run the ext_cfg detection logic at the end of
>> PHYSDEVOP_pci_mmcfg_reserved?
>>
>> Regardless, I'd be happy to provide my R-b without this addressed, but I am
>> curious if others think this as an issue?
> 
> Hmm, no, I forgot to consider that case (which in principle I'm well aware of).
> Will need to fix in v2.

That'll be a little interesting, since per Dom0's request we may also lose
MCFG access to a range of busses. Looks like we indeed need to fully re-
evaluate ->ext_cfg.

Jan

