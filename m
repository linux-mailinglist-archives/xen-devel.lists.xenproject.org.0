Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOPsHdpODGpIeQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:51:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9157E0B9
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312871.1583040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIyj-0003H4-61; Tue, 19 May 2026 11:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312871.1583040; Tue, 19 May 2026 11:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIyj-0003Eg-2q; Tue, 19 May 2026 11:51:17 +0000
Received: by outflank-mailman (input) for mailman id 1312871;
 Tue, 19 May 2026 11:51:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPIyh-0003EQ-GI
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:51:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIyg-006cPi-Sc
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:51:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4ea5-bab6-0a2a0a5309dd-0a2a4505d0ca-24
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:51:14 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4eb2-aaa8-0a2a45050019-d155dd31c900-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:51:14 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so2057047f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:51:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe582d0sm127886225e9.18.2026.05.19.04.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:51:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1779191474; x=1779796274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2gwjkzCgdOtpORCffBOgLnjw0oSmJe2Fsfw7MNLZ8AE=;
        b=YEIk3TMsD9BiKiZ2cNFv+GsrUA3t+K1E7qnLynZjvI1Yx9CrCnJMmGuyPlNX3f/A0/
         a5q2FtoOU0UK7D4ykYOihNQFjD2voqoev/ISeyp6ZARxHmJbC313hru0O0KveYEzsHZN
         RF0JRV1Ch2+pfMULwnGXvPwyT0P7vzQM4fYbZ4pqkAi/uBMgwT7RYfMcao1uJVMzwy50
         kbiHnWUpffBvEOoeFHs7f/lpqFJGAINqK6hz68GMvvgJWYDzRqzdQ4h9pJBwCobGiAk+
         Qz2TeecNDWdQznEGAXlnTdtFzKTTY26C+6ln1nTDJEfD3o7CZpO6/98OADPD0fr+eZAi
         nBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191474; x=1779796274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gwjkzCgdOtpORCffBOgLnjw0oSmJe2Fsfw7MNLZ8AE=;
        b=R1kDVcxCd85pBE+4t1m/TpdehzZWQlqBZgnXealhK+y9DXqBo75eniWxAoDFqF1dPJ
         W8S8Tl3nhYC1BgS+BVC+zs7pYk7wUhkyKtydH2NYxW2YmaoaxYZg+PdU0BONTRoWIxlc
         Z0fI2HHQmNNovPRXMPJsEozVUGyGa5LbQQEDSvaeVGzzpp5Jy+2bnI6TJzpubX6XENiN
         qVt94pAd0Jn5oiamKdVknPr/vmVLUrigv2ZfA+HvNlLKDOPxeIHpu1zsOa8AeXt65jM5
         YSRr6yX2NGUJdqiZrEpkPYhxQ7SuGvW/83uOycJViih8Tld6p8dRfuKsEd0YOEd+i2VT
         vY0g==
X-Forwarded-Encrypted: i=1; AFNElJ9OrSeNcQOAlVEAJpngX2JJKsaGs/G35YREb9r1y7Xs9Dxs/7x/FpBPwFBn9+EjKmZ1EiSdaEd+wJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykuHaG7/Dl8d4KehQ1McXxI+sod7HjIZG8n4MYUGRkuPRsDHFh
	cgRz+h+R52+FNAyyAtfGasMwILVVw9cOvs2VIn5oAiSh+kEAbDNBmOHUAmQU1RDSsA==
X-Gm-Gg: Acq92OFockX8Uv+CZ/4Ncp6LRY4lY9j6N6E17DvKqrV6G/SFTsMXebVNQSKORHsW3jj
	VNu89t6s4gXElgauRcu4hpGxmAxDsSYQsAF2Pc4LyOW2mn3aT+o655ZNruY4uqtLJYE1aFfIg7e
	WNvlivILRgIxhbNNk2Svj3zXNDlgZBFqtg/vK/tcJbt6YcSnmVuJIEFu1zw1kHjCyMSTKk0Z38A
	9RGIr1O6927QERen0tUh5uRTQBm7BgvqPEF1sHPUNwmYxFD042ZjQiu+33AS81QzbZciImmPCDJ
	vdkW72Z5BE/r3Celo115CY4x0ytEQIrwBleGgLXyMjat5+QIKFFz4yjOAA+QL2TN0OtvW+6glec
	ABUjBHupx6XSKYMPpauuhKlUJWpjXk97eNfOX0NPfDBwoEkwr3jbdTmjpG87l722QagWFa21zoJ
	G2UwkRBAxSKhKDbBKNPDKtciAvgzN7VhTdVFXmVmTTTEwkYuQmrV9pgiArUbyv2VbHWjDEbrcZb
	mg55V1H5gyLqYE/AgabyjJKDA==
X-Received: by 2002:a05:600c:a00f:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48fe63263dfmr308851085e9.16.1779191474171;
        Tue, 19 May 2026 04:51:14 -0700 (PDT)
Message-ID: <ee441369-cc67-4ec1-84f9-4619ce645da1@suse.com>
Date: Tue, 19 May 2026 13:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
 <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
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
In-Reply-To: <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779191474-DB36C443-73C3705A/10/73395122804
X-purgate-type: spam
X-purgate-size: 3203
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:baptiste.le-duc@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,lists.xenproject.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CEA9157E0B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 13:32, Andrew Cooper wrote:
> On 19/05/2026 12:22 pm, Oleksii Kurochko wrote:
>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot
>>>>> inside
>>>>> the domain's shared_info page for vcpus with id <
>>>>> XEN_LEGACY_MAX_VCPUS,
>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>
>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>> so when an architecture does not allocate a shared_info page the
>>>>> dereference triggers UBSAN:
>>>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>    member access within null pointer of type 'struct shared_info_t'
>>>>>
>>>>> Extend the existing fallback condition to also cover the case where no
>>>>> shared_info page has been allocated, mapping the vcpu to
>>>>> dummy_vcpu_info
>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>
>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>
>>>> I question this, largely (but not only) because I also ...
>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>> ---
>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>
>>>> ... question this mode of operation. Yes, you may (for now) be able
>>>> to get
>>>> away without, but e.g. event channels will want supporting at some
>>>> point.
>>>> Which will require a shared info page. Better put that in place
>>>> right away,
>>>> even if the guests you test with don't use it (yet). Certain other
>>>> common
>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>
>>>
>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>
>>>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>          goto fail;
>>>
>>>      clear_page(d->shared_info);
>>>
>>> ... but without calling share_xen_page_with_guest() after that
>>> allocation as share_xen_page_with_guest() isn't implemented at the
>>> moment?
>>
>> Or could it be an option for all arch-s move allocation of
>> d->shared_info to domain_create() in common just after
>> arch_domain_create()?
>>
>> The only question if share_xen_page_with_guest() could be ifdef-ed
>> somehow so not to block new ports to implement it from the start.
> 
> shared_info is an x86-PV-ism which escaped into HVM and then infected
> ARM too.
> 
> Sadly it's ABI there, but this is one of many areas where I really want
> RISC-V not to inherit the mistakes of prior ports.

In which case, how do you propose e.g. event channels to be handled in
whatever is going to be the alternative?

Jan

