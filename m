Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNpyMwuDymkW9gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:04:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41335C875
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267685.1557135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DE9-0002yA-8v; Mon, 30 Mar 2026 14:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267685.1557135; Mon, 30 Mar 2026 14:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DE9-0002vo-6C; Mon, 30 Mar 2026 14:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1267685;
 Mon, 30 Mar 2026 14:04:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7DE7-0002vd-3z
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:04:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7DE6-008Rrc-C9
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:04:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca82db-2eae-0a2a0a5409dd-0a2a4507b34c-22
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:04:22 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca82e5-fd74-0a2a45070019-d1558033e8d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:04:22 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso45418155e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 07:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d23679sm529882985e9.9.2026.03.30.07.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 07:04:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1774879461; x=1775484261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4XJaoDmj9rU7BKNttWDNX2p73LCzMAvFtjJhEh1LxtQ=;
        b=F0GSFpUqRcvxcjxmVitE/I5NvtRA0esDIfA0L9Lq5NOOBrUiFzZuQFAT5XAjUhKv7C
         7IvU0BHhn/+T+Vhb/0cEM4beS3xds7QcMjrP0rKpbyecQrnJZFyAGqY9MqgQpqM3rxHq
         2/eU5L63S0Vb/VvDclbc9AOQ2ig2dx6BUQIOZEF75jgmfFeOAjCunoyz71gvD7XHp4DJ
         JjI0iPO82b5/ez7UQjp/QBhnv3Qsnz9qP/fu0WcW2OX5jXApjnu8fpgmsjlmeFRUWBQa
         YJrlwVZ2QjzUSLnK2UweVoBloEU4s/L244fzMuGOnDo8bvi2nL28Q2JBz4JGP4FuOqp5
         2jPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879461; x=1775484261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XJaoDmj9rU7BKNttWDNX2p73LCzMAvFtjJhEh1LxtQ=;
        b=SJqKvF06ydBwtQWscUB9u+Lq6u0w4Hs3yoZpPB9ZwmzUMU+9wXt8btFuRZOsSSjNVY
         bWEGDhgYooSgdHP2aB4NSKdbZlEfnEtiHCGq1EbC36iC1eGVLrsSB8iJpjzvUj7NufYB
         Jz2EN1v9ixKRSp6BiNdMoqL4rKk+vf+6Y+wDE9RhxNHZCauWb9t+DOSdlfJONCOIZW3U
         erbsgmnIA5qMo7fSX6BzJZ+ldCK+DUMyAX0sGW8zOOcKwcAGdnPf+w/KFbd5T1GnpeFJ
         M0Ja42jWeVTrJwSsYlC7hYiqgaMlF9WswkVFzVr81F1slLL6lFfuC0bgfkBUePLMxMw4
         etKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPKNoOHivsdiDk0x/5gl+v2QZ7MHKu1+gUkLoD6Jw7HKo/j4I7A1uU/YltSUbSgqpjQ23lah7GIFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTpUfM7zS5mZrA6Xz2P5vM82J/Q7AMnxfPYDU1w939rqYs4TNi
	E8MBEZk/c3JLrE++Cu3g36Z9Bk90Lqh88ossCweeGdJwV5N0ttkjJUUlC2oIqOSWmw==
X-Gm-Gg: ATEYQzzJop65P5pQu1cUDSRWG4rzPlBbBKovagOzkQSxrbFtcJzLgSDkZ0gSpMREtH8
	LN0foF+o45mmx/2v7TT5+DgKpLe2Bp+xpbYw2fFW29Hnhkod7JEGrGt2j/WXGXeklaWcQYz10UX
	l5QN2mCEqtn177HgP7+3X+0kjaWolm40TgO0gj/IcmjXVkc7vAiWYRQVEyyx3hMeX2+Sq4nL2Ne
	xJ/Ix0+CcY0jhuM9dHslwFVfHyLScmBk8IPXjDcTWBLVCwwPdMrOc3z+FkfHzqgHXlyNt9Kc6ZV
	v7SDAFH5lIErETrlOsjFOFMLAS+YK5pZnxs5gLe4ejq1pwzlROhZMX4pVeywiVFUJ4HmV2wyVDz
	BA6XFQnFtsSR1Jxpr3AQxqV/2B5ysFkyYqmHjml6muPMAb+yMQuGYRyRDBAMgq8uFmIgzK+B7Fq
	xvlnLbGCO0ZHgUw2z0fbCI7+5UtfUV04+TdcV4fZYhjF0ZEp8MdVLxk0zJLyE5mAsCpWsPR6SNC
	80ZiO+ZJXv4Uvk=
X-Received: by 2002:a05:600c:c10b:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48727d87bd6mr165580505e9.10.1774879461525;
        Mon, 30 Mar 2026 07:04:21 -0700 (PDT)
Message-ID: <cefb810b-0366-43dd-8979-62702b628611@suse.com>
Date: Mon, 30 Mar 2026 16:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] xen/riscv: implement get_page_from_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <ba0ea599c4ced7fca0b8f5dd66bb7ffb277f3a4f.1774281309.git.oleksii.kurochko@gmail.com>
 <ef4eac20-d136-4c9a-82be-72259c088537@suse.com>
 <437b0d3c-916d-4513-9159-ee4e4c904bf4@gmail.com>
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
In-Reply-To: <437b0d3c-916d-4513-9159-ee4e4c904bf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774879462-5C989303-B1FF526A/0/0
X-purgate-type: clean
X-purgate-size: 1363
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.901];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2D41335C875
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 15:40, Oleksii Kurochko wrote:
> On 3/26/26 2:50 PM, Jan Beulich wrote:
>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>> +    if ( page->u.inuse.type_info & PGT_writable_page )
>>> +        *t = p2m_ram_rw;
>>> +    else
>>> +        BUG_ON("unimplemented. p2m_ram_ro hasn't been introduced yet");
>>> +
>>> +    return page;
>>> +}
>>
>> Finally, what doesn't become clear at all is why dom_xen needs special
>> casing. ISTR that when looking at the Arm code in the context of reviewing
>> v1, I spotted why Arm has this special case. Maybe I'm misremembering, as
>> now I can't spot it again / anymore. Yet whatever the reason there may not
>> apply at all to RISC-V.
> 
> IIUC, then Arm having this special case for DOMID_XEN as it is used to 
> share pages beloging to the hypervisor, for example, trace buffers and 
> considering that trace buffers are part of common code it will be also 
> true for RISC-V.

Ah yes, share_xen_page_with_privileged_guests() is what I didn't spot this
time round. But then you also need to implement the XENMAPSPACE_gmfn_foreign
case of xenmem_add_to_physmap_one() for this code to actually be reachable.
IOW either you make crystal clear (by way of commentary) why the case wants
dealing with, or both parts get introduced together (thus making their
connection obvious).

Jan

