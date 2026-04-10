Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APXeK/fm2GmmjggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:03:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E170F3D6818
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278872.1563582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAZT-0005yh-Rx; Fri, 10 Apr 2026 12:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278872.1563582; Fri, 10 Apr 2026 12:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAZT-0005wz-OM; Fri, 10 Apr 2026 12:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1278872;
 Fri, 10 Apr 2026 12:02:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wBAZS-0005wq-3s
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:02:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAZR-00EPvJ-Fr
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:02:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d8e6df-5cb7-0a2a0a5109dd-0a2a4505e692-38
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:02:45 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d8e6e5-3760-0a2a45050019-d1558034c157-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:02:45 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso17082925e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 05:02:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5d68585sm31953415e9.1.2026.04.10.05.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 05:02:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775822565; x=1776427365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n4gfOzT0Bf6nfUINS0bYkfoxYDxexXwmAFrNN+WIS34=;
        b=Vv0+MuIZYXYYLI1u090rW0UjuDksgVh+qOf1XAD3stmx89Y7Bb/MvkpX3Zcpt1jjHY
         /tUNf7PyoBqo3wRitGx0xkFaGI8AI3ZIMPGmIZF4Xyyfmhd8MEqg7mreWi52TYEpVPHs
         Nn8soBRqiZmFkp75pDS+0jkSpheUn+wuOcYfjq4gP+y++nbrfZtndYw51OyDwpYchoS/
         cqsUPB1RQQFLkPH3JuySeZpfjCnv3Ihn3M/ucP8DSZUZMzXFiccTVcANfgXZnskvoklI
         0KHvWIdHi+Ts3KlSKQZZyVQBR+2T4PJMcS/jOPFBRt0RnfYZDIW5LZgRTwNg4x0aj1/m
         HIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775822565; x=1776427365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4gfOzT0Bf6nfUINS0bYkfoxYDxexXwmAFrNN+WIS34=;
        b=SUOJQI5VQe2S+Pmkie8fJEbD5ur103PRlW/Gogdl8e9N7YwlJSfGBQFreUP2Y/sk7x
         X1agdv6VRhH+fLv2UNEiOYxMMUQrffWA/GgiB/2zGsEhc2fqNcsebNBMYVCdfjugBzeA
         w7ducJIt9yePCuw9sF2TFjTUS/PrIzjfkTBTLWxKXVHw2O/s/f9bse86CuPc38zyD8hh
         6TW8UgMRtCOdQfAP8oDsU7/SSULgBc4DaQZLasirhFIsvmNij6gZl6p1LtqaXY1MHNck
         FxUYjTcAUPETi68fuiR5UvbxTRjSOEeZXkIOyvrzgzRaGIueZBUIARCxC2Ouu9eotvq4
         J5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh/7exjeAXKHweptupZarj5zTirLCumrYdo50R/yfs1MN78LTBehvC/9aOSOZaDNphg8xj/7j0DsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRaNxTI9wfubrLr+gruMOszLWVzBgTowgFmV5ELgpi3HavztkH
	aoVMcwBKYBQlpLJqM0SwbcwVSHhsO+kVTGizK7lZjhTWBZFo2Im4Ov7QxsLEpcCWQQ==
X-Gm-Gg: AeBDieucAXKCcFYAZXTovVT4KmkE00uVJ3tEbPYoKi0Z7/MgNwnxZ1r7+K3Nvd56lcb
	GvOWUjGbJ85kshKoQlc/AM+bIeq/Mk/r2N3xd7bYwGYbr5Tfw2a/GF2Rx2u4XffwpSJkXilbxtK
	eIESaUdEcKi8EpaTlbbUzuBk30fAotNc+X+kIhvxtlo8Q6DSHX2qIGRJYXvYbeUm7ZxrY7VEnnR
	ZSUQyeeOkbgk5u0Phr4AeehfIAO8z2C93PsQfjy+BrfHRjkR42lYKMYAecN3wDH7Kc3cfLSFrMu
	4OzVoz08ml0SymC3gAzBXWsdXC1cw4558xeZM0XkL0NTDkXc3tPuywa1QtemIXp6cAGwX+IN8Mo
	FbjfDqXYwxI3t4/NX4q1Ye6VcnfIa1BjONxk9gy9ZMaKBUa0d5fGy1WnsvPYlNqZThIorneDDrV
	GEFoleqBPeGRx+v/thyVqZ06loaTiT+MmlK5ZsRwgvICjk2WlPmXPpoknO6pTJgiiuwLdtFeSyv
	ro5RlwFUg3VzaA1L+ZskVSVug==
X-Received: by 2002:a05:600c:6215:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-488d684c705mr35969665e9.22.1775822564658;
        Fri, 10 Apr 2026 05:02:44 -0700 (PDT)
Message-ID: <89d57cca-fecc-43e8-8ed0-88e80bb98cf3@suse.com>
Date: Fri, 10 Apr 2026 14:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/27] xen/riscv: implement make_cpus_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com>
 <7505a281-b481-4f3a-a7df-d8c234f28279@suse.com>
 <147735e4-cd03-4efa-8981-3f29e15d5e6b@gmail.com>
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
In-Reply-To: <147735e4-cd03-4efa-8981-3f29e15d5e6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775822565-32B2096F-9662AE8F/0/0
X-purgate-type: clean
X-purgate-size: 1962
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: E170F3D6818
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 13:19, Oleksii Kurochko wrote:
> On 4/1/26 4:11 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> @@ -44,3 +46,109 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>>   
>>>       return 0;
>>>   }
>>> +
>>> +int __init make_cpus_node(const struct domain *d, void *fdt)
>>> +{
>>> +    int res;
>>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>>> +    unsigned int cpu;
>>> +    u32 timebase_frequency;
>>
>> uint32_t please.
>>
>>> +    bool frequency_valid;
>>> +    uint32_t *next_phandle = &((struct domain *)d)->arch.next_phandle;
>>
>> No casting away of const, please.
>>
>>> +    dt_dprintk("Create cpus node\n");
>>> +
>>> +    if ( !cpus )
>>> +    {
>>> +        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
>>> +        return -ENOENT;
>>> +    }
>>> +
>>> +    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
>>> +                                           &timebase_frequency);
>>> +
>>> +    res = fdt_begin_node(fdt, "cpus");
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    res = fdt_property_cell(fdt, "#address-cells", 1);
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    res = fdt_property_cell(fdt, "#size-cells", 0);
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    if ( frequency_valid )
>>> +        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
>>
>> Handing through a property directly makes me wonder how that's going to
>> fit with migration. I understand migration may not even be a mid-term
>> goal, but still.
> 
> Do you mean if I will set timebase-frequency = X for guest cpu node and 
> then this guest will migrate to h/w where timebase-frequency is Y, so we 
> will have unsynced timebase-frequency?

Yes (I wouldn't name it "unsync-ed" though; it'll simply be wrong).

Jan

