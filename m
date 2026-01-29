Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO+zKQxIe2kdDQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:44:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16380AFC33
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216328.1526246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQRH-0000A5-E6; Thu, 29 Jan 2026 11:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216328.1526246; Thu, 29 Jan 2026 11:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQRH-00007q-AV; Thu, 29 Jan 2026 11:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1216328;
 Thu, 29 Jan 2026 11:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlQRF-00007k-Ir
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 11:43:53 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8185886-fd07-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 12:43:51 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so14201705e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 03:43:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322eefsm14056334f8f.30.2026.01.29.03.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 03:43:50 -0800 (PST)
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
X-Inumbo-ID: c8185886-fd07-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769687031; x=1770291831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WDwMz6MaCgFyose2e3pvmTf0pX4P6lxe59RscuoGPe8=;
        b=GJRXyzFfQ8MNZXOkWBBx0QSKWm++J6AeY2fYZQL7hEBXsXoPNdv4GpLEa+0RxSpB7b
         Wg1TnOLJOPhjl0NFGG3CFvILbG79tG2TuBtquhfDjWsFAPlM0Hwjd4A3gC6CBZf9Ekv3
         ka7tdyIBjSqecnBnS8VP1iH6PMfW7+KVRWCNIeOGSosVL9AeOY721sJa2TdHaocMFWmn
         1MsOLu5TLgrjW8x0lJrTxF99WJM3sOAQ2EKBQqwTS5Pvp7vJofBGcacpfGsUWgyrJygJ
         pOJWKeB7qvFXyWwQPPj0lttPpk31QpGUsZ2OLQJ8quFQdVCiX/EVEx7+k+Mfp9oZ7iqO
         DPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687031; x=1770291831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDwMz6MaCgFyose2e3pvmTf0pX4P6lxe59RscuoGPe8=;
        b=DNe/dS3TGjnolRX33hUMEYnxgPt6qBwB7hQpR0MkbG1/bvxS8/4/jPpdMecZFeL+hg
         BjoYnUX9AY+w3/UMI0NEP3OmcYJiUejYiH/j40Qfbxq/H/u1uRjQ/WiXlvbMM6vU6SjI
         1meRyhbepIBDzOBck37msryzM0JNFTh6BUIgrxz0Ol00QKdKNRO9jQdmtYVCJSBqAJz7
         Trs2NoiWOpEzHxv+TRIjR+WOwMbYzStzrPVJTdsEyL/TRp1fn6YkgBPZ6IlDJIYwRzHp
         r+WaAeA2T0ULpYCxXE03aWKgldxYsoHH58ThaYN2zWvOSWDUWxBdDysuNrgfgqxfj2Cu
         MamQ==
X-Gm-Message-State: AOJu0YzNYcNrQJGJMIohcmEyJfkawX0wcQBi8bDHD79Ab6vjOE3/GluU
	hzhtabXUbhih0EmO3Zbbhs5nRSZqbDj8L5pAmWV/X58L4S14IwAxKr6vrwA3YewF7w==
X-Gm-Gg: AZuq6aKDOCMHDUyDHhxd/J5A3Xo/kRLzdluz/9GBcXSC7MAifH2s6IvMULtH3FyvReK
	HszXHl3J522ZWRDhSPvDnHXcYa9Uo7DECuzgI04INUy/7l9kvZZpgXfMixuiGDbui70P4Gn8cYs
	qKlSRKelGVpceIU0gvB/Qzgar9e+l6Jy+YlWCbrjj++3HvCdm6MVm0F/XwLC2Zz0W0bT9J92wN8
	LIAE4OgqTrst65Bv0ys5sNZYtovKdooyXAg5ljCV4ZGPcZy48GDttQFWocbVlQIKwemaIGMS6Fs
	PeauTpZduzliFmGRaG5QoVVuOn6eIv+uGfBFMM1/riIFutDHneADRLXx8P8bfWNkAKn4xpcPRUD
	YRPmXGfG3alKaeAFiIvE1enMytQkxABokanbRdv/DOCb7IH58bsKMazRMGrxOielrdV4sgSMw7f
	zqBUcT6B4BQnkgfHAHiMGrtL+vRqG6xEWl1irwML02GFxPpNTJb3y4GlDucQ2BCE4GFXZnD1uck
	uoG9m79MHHnew==
X-Received: by 2002:a05:600c:47d5:b0:480:63c1:3ac7 with SMTP id 5b1f17b1804b1-48082874614mr23477805e9.2.1769687030703;
        Thu, 29 Jan 2026 03:43:50 -0800 (PST)
Message-ID: <d7635e8c-e910-4fe6-9f5c-9fb1057efcdb@suse.com>
Date: Thu, 29 Jan 2026 12:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com> <aXpMIOuRZvX8IyFK@Mac.lan>
 <2d5e017f-1675-4753-9494-2b664c4ca7fa@suse.com> <aXs3hNjxbbs4zKGN@Mac.lan>
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
In-Reply-To: <aXs3hNjxbbs4zKGN@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 16380AFC33
X-Rspamd-Action: no action

On 29.01.2026 11:33, Roger Pau Monné wrote:
> On Thu, Jan 29, 2026 at 09:15:30AM +0100, Jan Beulich wrote:
>> On 28.01.2026 18:49, Roger Pau Monné wrote:
>>> On Mon, Jan 19, 2026 at 03:46:55PM +0100, Jan Beulich wrote:
>>>> Legacy PCI devices don't have any extended config space. Reading any part
>>>> thereof may return all ones or other arbitrary data, e.g. in some cases
>>>> base config space contents repeatedly.
>>>>
>>>> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
>>>> determination of device type; in particular some comments are taken
>>>> verbatim from there.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. There'll be a v3 though in any event, to add the command line option
that you asked for. I'll take the liberty to retain the ack (whereas I've
dropped Stewart's R-b).

>>>> Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
>>>> risky code (as reads may in principle have side effects). Should we gain
>>>> such, too?
>>>
>>> I would be fine with just a command line to disable the newly added
>>> behavior in case it causes issues.
>>
>> Can do. Will need to get creative as to the name of such an option.
> 
> pci=check-ext-cfg=<bool>?  Kind of a mouthful.

As we already have "pci=", I've added a "pci=no-quirks" sub-option there.

>>>> @@ -718,6 +721,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>>>>  
>>>>                  list_add(&pdev->vf_list, &pf_pdev->vf_list);
>>>>              }
>>>> +
>>>> +            if ( !pdev->ext_cfg )
>>>> +                printk(XENLOG_WARNING
>>>> +                       "%pp: VF without extended config space?\n",
>>>> +                       &pdev->sbdf);
>>>
>>> You possibly also want to check that the PF (pf_pdev in this context I
>>> think) also has ext_cfg == true.
>>
>> I don't think so. No extended config space on a PF means no PF in that sense
>> in the first place, for then there not being any SR-IOV capability.
> 
> Right, but won't it be possible for Xen to not be aware of the
> ECAM region for that device, yet the hardware domain somehow managed
> to enable SR-IOV it and request to register a VF?

Then we're screwed elsewhere, when we try to read the SR-IOV capability
ourselves.

>>>> @@ -1041,6 +1049,75 @@ enum pdev_type pdev_type(u16 seg, u8 bus
>>>>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
>>>>  }
>>>>  
>>>> +void pci_check_extcfg(struct pci_dev *pdev)
>>>> +{
>>>> +    unsigned int pos, sig;
>>>> +
>>>> +    pdev->ext_cfg = false;
>>>
>>> I think I would prefer if the ext_cfg field is only modified once Xen
>>> know the correct value to put there.
>>
>> Well, my main point of doing it this way is that the code ends up being a
>> little easier to follow. Especially without the optimization talked about
>> near the top, there inevitably will be a window in time where what the
>> field says is wrong. With the optimization there'll be two main cases:
>> - MCFG becoming newly available: The field starts out false in this case,
>>   i.e. the write above is a no-op.
>> - MCFG disappearing (largely hypothetical, I think): The field may start
>>   out true in this case, but will go false unless we have another access
>>   mechanism for extended config space. It then can as well be set to
>>   false as early as possible.
> 
> Yes, with the optimization to not re-parse existing MMCFGs there's no
> transient windows where the filed is wrongly set.

When there's no change. When there is a change, there'll still be such a
window. Unavoidably, though.

> I also think the registering of MMCFG ares with Xen should be done
> ahead of the OS attempting to access the config space, and hence it's
> not possible for there to be in-flight accesses that could see
> transient invalid pdev->ext_cfg values.

Yes, for Dom0 alone all should be fine. My worry here is with dom0less
and Hyperlaunch.

Jan

