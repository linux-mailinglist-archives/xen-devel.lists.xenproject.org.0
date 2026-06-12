Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v+Q6JdfxK2oXIQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 13:47:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44FA679147
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 13:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=e456bTAb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336639.1598463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY0Lc-0006DM-75; Fri, 12 Jun 2026 11:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336639.1598463; Fri, 12 Jun 2026 11:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY0Lc-0006B9-4S; Fri, 12 Jun 2026 11:46:52 +0000
Received: by outflank-mailman (input) for mailman id 1336639;
 Fri, 12 Jun 2026 11:46:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wY0La-0006B3-G9
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:46:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY0LY-00A8GQ-3S
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 13:46:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bf199-5cb7-0a2a0a5109dd-0a2a45018cb8-38
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 13:46:47 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bf1a7-c1f2-0a2a45010019-d155802cccae-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 13:46:47 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b8a97b11so10264845e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 04:46:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm4561933f8f.15.2026.06.12.04.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 04:46:46 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781264807; x=1781869607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozjSI/ZTiOPvYnvgtd3Mrlif8ZVMJ4SVpUa4b8rj8Tk=;
        b=e456bTAbnabFhOPrs67gDGnKA1uqjO4qzQ+DHBQpfDOcG5IBHCqExF1rYQKP8qxvao
         5V0aBB3prferNeRx+HM2c6vqD1iGX9cM5UbrjlTrMwVVL1BNZvQ8oKOFXHEh7S9MAesv
         z6AUAGcpJ2WjT01t5I7MTlppldnN99m8N/MCu6L5DxnykaQpnkUlaCMxi3DSR4WUAB5z
         I5dMXHUVeHlMb8op9wa21qL5iCgBBijSwOGM9HPXKaY5gCsdBHpX/7BkSO99nz54NivV
         b6d4CiAT9JTo3HbxnDXueyJEzwffWfr3T/eOqu/9U8kMGJeNxTPHr/YbNTBtBZMjJbIz
         fezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264807; x=1781869607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozjSI/ZTiOPvYnvgtd3Mrlif8ZVMJ4SVpUa4b8rj8Tk=;
        b=D1Z/+s9nX0Ec7RDX+bz+Fe2QAv6/8gBNLYLPoghedDWF2AKZooKMD5raj5rnJeJwMQ
         fCcnC2cgFNB8Txkxfdz+GWjtoUvmN0XCK6Knun0UwbT02sjSz2uCTn/xPFcXwQrnViGX
         pjz04cqbR8DuVssj2+41sOKpDJWmryxi2M3zVWcsQA0XZ3xe7d9EPS7OjikyJIHDO3zt
         72Na3SePk5iA31CKY+Jm4LUoabobTJIBpG++yTG9fuwDBfyAV5owZM3aW39xYbsO77+U
         36sZPr8ihrSxNIIyDSyWbunUkn2J3rJP8Ki1ZxeKP2b2UIcVglylc5hZb3+u9Tx14m10
         rsXw==
X-Forwarded-Encrypted: i=1; AFNElJ8/DsHKZDwHLtqnsTJwzErLrA3xQ+fVek6/MQKkeJ9uNwoxtBvFBOELEF/raeFVqSip72yj/mrghAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFOKEeejjv2ocKjlEqfwhXiCowi1oh3RtmzW3Yv3caHKORD3bM
	c2uREQAxq0tusWou4kF5wfhfGfH9YPycXd5VheXwzjb/YgJVH93OgYjOXcaOYTlIvw==
X-Gm-Gg: Acq92OGOT+/S7Efv04t2vpIpE+aJ1dEvoRp0mjiqmp2eboVVmjFnxrh3jFdRL0znYqe
	vhM1lhSJlov+WBPf4PEi0eTZIuAnhX691jGpDcTeTsNWApaSTxqp3bohs3nDW2klE/aKMgxINT1
	ckfctLHD0+K/cjf9gI5hE6cke1R0UaiYftYpE8VWphNq/TDLbQcnFozjISXhwDsyfyQJkSTyj82
	FVqxC3mrIC2EIC1qDQRSaNerehw/hp5KDwHN4DT69/N+NkxfX+Mc2GFxwIzXfKhO+29w7TlC5yN
	bJU9pRX7QdtsbKOuLD7VupyD5mkm+hfWONXGTF6giCwrXi6GYU+KoUCS66HgY0YcmOQ/z6WhGBo
	bpBti8PAoyiQaTVdoXzSgBA1jvkyDLowFPSRH01L7IDrA/EvKY23nFT/uuclOpl2Hwe13/QNz5q
	lXcuw14IJ6ZYKglKAweuWd99unQu2JgaH7nWtuY+7cZpdz55jyz6iPjS4cj68HOoVALLOgxvk6k
	oVv/BsWmhbdKns=
X-Received: by 2002:a05:600c:42cc:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-490ec4c4bb6mr20089685e9.13.1781264807371;
        Fri, 12 Jun 2026 04:46:47 -0700 (PDT)
Message-ID: <f42daff7-dd18-4fc1-b5f6-45cae9d8c6db@suse.com>
Date: Fri, 12 Jun 2026 13:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated machine
 type (i440/Q35)
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
 <9f67c3ee-4450-4d4b-b03c-66ac1aa63014@suse.com>
 <1781258478.8631fc262581453bbf619ec5b2062170.19ebb476458000701b@vates.tech>
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
In-Reply-To: <1781258478.8631fc262581453bbf619ec5b2062170.19ebb476458000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781264807-B5545FF4-73291543/0/0
X-purgate-type: clean
X-purgate-size: 2071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E44FA679147

On 12.06.2026 12:01, Thierry Escande wrote:
> 
> 
> On 5/4/26 16:43, Jan Beulich wrote:
>> On 13.03.2026 17:35, Thierry Escande wrote:
>>> @@ -648,6 +649,47 @@ void __bug(const char *file, int line)
>>>      crash();
>>>  }
>>>  
>>> +machine_type_t machine_type;
>>> +
>>> +void init_pc_machine_type(void)
>>> +{
>>> +    uint16_t vendor_id;
>>> +    uint16_t device_id;
>>> +
>>> +    if ( machine_type != MACHINE_TYPE_UNDEFINED )
>>> +        return;
>>> +
>>> +    vendor_id = pci_readw(0, PCI_VENDOR_ID);
>>> +    device_id = pci_readw(0, PCI_DEVICE_ID);
>>> +
>>> +    /* only Intel platforms are emulated currently */
>>
>> Nit: Comment style.
> 
> That's for the missing capital on the first word and full stop, right?

See ./CODING_STYLE - the full stop isn't required here, but the capital first
letter indeed is.

>>> +    if ( vendor_id != PCI_VENDOR_ID_INTEL )
>>> +        goto error;
>>> +
>>> +    switch ( device_id )
>>> +    {
>>> +    case PCI_DEVICE_ID_INTEL_82441:
>>> +        machine_type = MACHINE_TYPE_I440;
>>> +        printf("Detected i440 chipset\n");
>>> +        break;
>>> +
>>> +    case PCI_DEVICE_ID_INTEL_Q35_MCH:
>>> +        machine_type = MACHINE_TYPE_Q35;
>>> +        printf("Detected Q35 chipset\n");
>>> +        break;
>>> +
>>> +    default:
>>> +        goto error;
>>> +    }
>>> +
>>> +    return;
>>> +
>>> +error:
>>
>> Nit: Labels indented by at least one blank please.
>>
>>> +    printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",
>>> +           vendor_id, device_id);
>>> +    BUG();
>>
>> Can't this be moved up into the default case, thus avoiding "goto" and label
>> altogether?
> 
> There is already a goto error on the vendor ID check. That makes it more
> readable imo.

Hmm, maybe to some people. To me the extra "return" goes against better
readability. I agree we don't want to duplicate things, but we can still get
away with one less "goto" if the label was moved next to the "default" one
in the switch().

Jan

