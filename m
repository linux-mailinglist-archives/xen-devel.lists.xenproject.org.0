Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF7jL09SDGqmfAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:06:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538A57E4E1
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 14:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312926.1583108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJDC-0007RZ-HM; Tue, 19 May 2026 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312926.1583108; Tue, 19 May 2026 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJDC-0007Of-Eb; Tue, 19 May 2026 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1312926;
 Tue, 19 May 2026 12:06:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPJDB-0007OZ-2B
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:06:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJDA-00DQ9J-EE
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:06:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c5230-2eae-0a2a0a5409dd-0a2a4508a802-22
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:06:12 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c5234-63b5-0a2a45080019-d155802dc4e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 14:06:12 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so28636315e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 05:06:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab52a6sm320514215e9.10.2026.05.19.05.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 05:06:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1779192372; x=1779797172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lXu9b5gL8rrqkBgtoIMfae6gMi/kN3ttpRTG890ta6c=;
        b=DOgvZ1fYAVdAJdplKEnIuHOS4eAMz5xsy9xRk1jfDn6vDXC096re5r+aPs0CbVmCUl
         qvFzuuPRIP4AKaO9kJWwYXz5n1Wheqb7Zr8BdTNetT4wbjQDZyJlMdAqJKj6R2DeFFvr
         GYZvkxeizcl9hJwx1tPmILqmf4d1l3MjhicgHdvzPu28d5FBNJoV/lD2rvqHz/44ejrr
         nQKDidCRH7o+UCRdQaJrXl3QfUDjEWnFkDt0AAn5zE+Xpm0fRT5efg8m6IdFw2zztMyS
         E/MftMjohgQp3hVYxi7q8201Gps1r8BT1tEWupj9tNqkOPK9FHpyB0ZnGpskIBxDxZa/
         Ur6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192372; x=1779797172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXu9b5gL8rrqkBgtoIMfae6gMi/kN3ttpRTG890ta6c=;
        b=NwEwFmW/QPzFYkxM2eVZm9MCgAL+LYE6YK0dc7ZrwQUT7uiypqLw5NBv16IRAT1Xdh
         BtG0QE7LkPXkgFBsG8ER60CMAIS8ftXsFESt+pNRAXdPYArlC79wPGz1a+XIKR5+dCmM
         k6NzVEldzOvb30ueW5bjJGa9ZSoTDbXtWoQaH3j9i13B8rBgH8vUFkw99RryKGqTJdwI
         Yo5uxwE648+CAloWHLuf9cifbOIDsBFinEmLckR32GIytV7jEkOONN6evFJ9d5fMd8W8
         kxsqB62FYZPOQOG6T4KkCcDtt5iddThM9fxdevrLr8QnCjxswY1PAbTUssz8cMfFEc3e
         ky/A==
X-Forwarded-Encrypted: i=1; AFNElJ+qdCADBa/q2Loxe5EiROeQnNOaWxJaFZkrfcpOpaQXhTskjuvv77MKsB+2nnlFIuBjiea2JMWg5+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGZ1O3wCLoGAh7ayayHQgJ8tgbemUoDH5FL74yjBOESn+hlW3O
	YlesnqFgRVDijfuPVayI2+riahI6rWNVjTazx4NbAiTy72O2f3Adqkf2gY+J5+RgsA==
X-Gm-Gg: Acq92OHSponCk3I8abfxQUj6qn4osQKwt6YEIEeror9agHdoG7eHAmCESS0GetAW4UD
	qHzl1E1RHCWzZHx/g/ndHNoTiLvPhIDxlE7c2wWBkgTeU+UggS2RkUGEQ6iCpeKiU/I7TZjrmZM
	aIGs74dMzDbRWGzsXJL62k+khvp6V4nxJmqOIRxxr0l7o5B0r5SaJOMgY1WD2g7AHGIz+kJ5edg
	28ValnaDZz5Fc9yxcit27AHHsUfudmGTmWMdFu/Jw6CnoFpxglxqvZbTXWGzh7ce+vUg74sEryH
	PDZqrdIMax0q9+MjeYp5F7vPez3KQIvUPm6H7lmiA9A3LGCt/T+iN/+MwbBPpZsGzjSH54Uuplg
	a0oIc7RZl6e/9IX/Tb4USIPGCzR2d8BCg4QbEGYfP+lUVGQ1pITFYe5WZZXgiIfH1L2PwP5HZck
	mawMmasBWGaRBkbJTI/e3SB24/vYktA/PRi2Bwj1u0LbM855Z/s3rlt03GwUq93Tz0ywaV8wNXT
	ZaJ6Ag0wSGJPQ0=
X-Received: by 2002:a05:600c:c087:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48fe61f2911mr218583605e9.15.1779192371717;
        Tue, 19 May 2026 05:06:11 -0700 (PDT)
Message-ID: <7aa7e06e-7a86-46ea-a7fe-bbb81c96d743@suse.com>
Date: Tue, 19 May 2026 14:06:10 +0200
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
 <ee441369-cc67-4ec1-84f9-4619ce645da1@suse.com>
 <f5cd7d50-e274-4a8c-a535-8c0f47cec137@citrix.com>
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
In-Reply-To: <f5cd7d50-e274-4a8c-a535-8c0f47cec137@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779192372-C487BDB1-D6C4DC5B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3662
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:baptiste.le-duc@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,lists.xenproject.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 3538A57E4E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 13:56, Andrew Cooper wrote:
> On 19/05/2026 12:51 pm, Jan Beulich wrote:
>> On 19.05.2026 13:32, Andrew Cooper wrote:
>>> On 19/05/2026 12:22 pm, Oleksii Kurochko wrote:
>>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot
>>>>>>> inside
>>>>>>> the domain's shared_info page for vcpus with id <
>>>>>>> XEN_LEGACY_MAX_VCPUS,
>>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>>
>>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>>> dereference triggers UBSAN:
>>>>>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>    member access within null pointer of type 'struct shared_info_t'
>>>>>>>
>>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>>> shared_info page has been allocated, mapping the vcpu to
>>>>>>> dummy_vcpu_info
>>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>>
>>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>>> I question this, largely (but not only) because I also ...
>>>>>>
>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>>> ---
>>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>> ... question this mode of operation. Yes, you may (for now) be able
>>>>>> to get
>>>>>> away without, but e.g. event channels will want supporting at some
>>>>>> point.
>>>>>> Which will require a shared info page. Better put that in place
>>>>>> right away,
>>>>>> even if the guests you test with don't use it (yet). Certain other
>>>>>> common
>>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>>
>>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>>
>>>>>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>          goto fail;
>>>>>
>>>>>      clear_page(d->shared_info);
>>>>>
>>>>> ... but without calling share_xen_page_with_guest() after that
>>>>> allocation as share_xen_page_with_guest() isn't implemented at the
>>>>> moment?
>>>> Or could it be an option for all arch-s move allocation of
>>>> d->shared_info to domain_create() in common just after
>>>> arch_domain_create()?
>>>>
>>>> The only question if share_xen_page_with_guest() could be ifdef-ed
>>>> somehow so not to block new ports to implement it from the start.
>>> shared_info is an x86-PV-ism which escaped into HVM and then infected
>>> ARM too.
>>>
>>> Sadly it's ABI there, but this is one of many areas where I really want
>>> RISC-V not to inherit the mistakes of prior ports.
>> In which case, how do you propose e.g. event channels to be handled in
>> whatever is going to be the alternative?
> 
> Implement proper enumeration of virtual capabilities (to be retrofitted
> to x86/ARM too), and only offer the FIFO ABI (which is superior in every
> way to the 2L ABI).

What about the wc_* fields then? And about everything in struct arch_shared_info?

Jan

