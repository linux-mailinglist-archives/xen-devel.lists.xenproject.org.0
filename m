Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DM+2JuuHVGrlmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 08:38:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB674795E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 08:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ImIBxeec;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361387.1613625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAHx-0000iW-C5; Mon, 13 Jul 2026 06:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361387.1613625; Mon, 13 Jul 2026 06:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAHx-0000fs-5Z; Mon, 13 Jul 2026 06:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1361387;
 Mon, 13 Jul 2026 06:37:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAHw-0000fm-9I
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 06:37:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAHv-003TFn-MB
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 08:37:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a548792-2eae-0a2a0a5409dd-0a2a45059c4e-16
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:37:11 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a548797-4f1d-0a2a45050019-d1558029d8b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:37:11 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493f2e39e81so9833455e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 23:37:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d97527sm278504195e9.2.2026.07.12.23.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2026 23:37:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1783924631; x=1784529431; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOd7fscKcDUVaDZTSmawEm0AzwzHgUqhu8aa+6AyuhU=;
        b=ImIBxeecrqwISl1ZiXKjbZjbmsF4HF33qi87UpQmhW/uZt5IXZLeXDkEWxYmdBGrPh
         R86jJHboJVkf+/xT0Yqy8Tu5fj0N9XvNBNc2X0Qy8cGSyGiA7WmZKckgN0xNrCVS/nXP
         B+MQ9Z14NTGP2pY1foK01gVDkYdLpDcvbK58LifYAU/tCDJ/6fuGNRSEd0H8ENoifdfI
         Ywoon4lmt7ZQpN8W9P7yQBnL8f44BD12dbg/4jeOc/UCAk0U5EYAC6VaXq6RJR031nYD
         DhwXF5iX1v+abY7b/9nG+Ad7dUVU7PKcD6MxR5nOpv6Pqnd/hHxk8A6xQ3Q0rFi9G24R
         WyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924631; x=1784529431;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOd7fscKcDUVaDZTSmawEm0AzwzHgUqhu8aa+6AyuhU=;
        b=BI5Cy7Za0lUWgowkvPuh1klvIwaNdliXg4pYgQqyL7ProeBdSymXh+tc47qGcNJssc
         oMAqgbmPZE5IfRP+oTbWWCRzC99L8e6ZzEh1atR0KPOHtTsAnC/qLipvuLvXE0PWNG9I
         TTjch8H4N2g73BZVgNUypPOph61IF/QxOcd2+caKCLFw7wlOa8ZGJxdG+c+dIxlnsJHQ
         B85qmD73ysaulaM4sDqs+BPKXr1Hu9ts8PPQ5oi4lIhlAUUdavhU4MnyCTGpgU+ebJwb
         cBre4kd6IZ7AtNWQ2L7AGnO4TQ8W7pWrRpewXAltu4qj6tl1hJr+zzKSwewP6cNdI1DK
         oXYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2oKv7wENKyeI4C8rDN1mLQcCQwFhiaP6/cojghEMAsWr22j7Ie9B1ZCz/vDqmze5s+omO1HQWicw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzr7lf5zySeaqKB1PhPm27LUFdDpN8PdE7SAGFf/qK11aDVvyYU
	A7A4hApouQ5Epz/Iuu4ECHel9lcsHHv3XQg7kJlTdUGIdQ/lXOiDEFhLqtm+Ol23Cw==
X-Gm-Gg: AfdE7cnrVUvVMSaFpq1oG6eHcQdXlL6Emy3sbfAwpA02U1wmizExz08ELRL8vr36KqZ
	PkL/jOURsARUmEW0gBRu0hiBzz9KN1DYcUrCPb8p7TEFf/obwoncfsCF7escBXSMZUSc3B444/h
	PVaS8PlzZdYGY5msXBTqoj9nAuoriISGUULgXf3NIXzki4C2tDxUptC7azpp0eHGk9POzSznHEQ
	POyC69XUTPQsGV9eZkDU0RRBEZV0LmErwcdvGZkOU4Ph5dD6xXSow2MJYqNzqq0r06GhFAjCDhj
	EAfEzvJ996MXPg9ofiDwXq+SfANe+lnTcmUpmcVSgYWLnS/0Gjpj8keLP9dXA24De7KgW/Hx5D9
	m1YgP1PeQJs2JWH9q1SNsX3p3alYI9kIEpixGiNls+ezgVXaBEDBqtIVdDLnbgiz+uCb48aMnjA
	/QTTlthzBThuxdN9GRoe4UF92cUDSxzIJggRY3mKiJw0YoDuQHqjBCFsTYXtJLb4jjrfYw3ghet
	aJb
X-Received: by 2002:a05:600c:5297:b0:492:454c:347c with SMTP id 5b1f17b1804b1-494013134aemr27043005e9.7.1783924631048;
        Sun, 12 Jul 2026 23:37:11 -0700 (PDT)
Message-ID: <3f0814c9-13fb-40db-b6ee-19e9964f8dc6@suse.com>
Date: Mon, 13 Jul 2026 08:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/26] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <dc486923b5313c64cf383575d25c58c9af9e5eae.1783331040.git.oleksii.kurochko@gmail.com>
 <2f26c623-e577-44bb-8163-f52b97496d05@suse.com>
 <79e5b29d-b107-4176-b8e8-bacf4c4059cd@gmail.com>
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
In-Reply-To: <79e5b29d-b107-4176-b8e8-bacf4c4059cd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783924631-DA74512E-71CE1253/0/0
X-purgate-type: clean
X-purgate-size: 2509
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3DB674795E

On 10.07.2026 17:00, Oleksii Kurochko wrote:
> On 7/9/26 3:05 PM, Jan Beulich wrote:
>> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>>> +void init_guest_isa(struct domain *d)
>>> +{
>>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>>> +    {
>>> +        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
>>> +
>>> +        if ( ext->guest_supported &&
>>> +             riscv_isa_extension_available(NULL, ext->id) )
>>> +            __set_bit(ext->id, d->arch.isa);
>>> +    }
>>> +}
>>
>> Right now what this function does is dependent on only global variables.
>> IOW each guest gets the same bitmap. Is this going to change soon?
> 
> At the moment, we don't have a use case where domain has unique bitmap. 
> But IIRC correctly we agreed that generally it is good idea to have isa 
> bitmap per domain and let the use to chose.

Indeed. But what you're doing (in this series alone) is a mix of things:
Some properties are per-domain, some are global. Such a mix might be okay
if it's justified by something. Otherwise I think consistency it to be
valued higher.

>   Else
>> why not calculate that bitmap once, taking the same shortcut as you take
>> elsewhere for the time being?
> 
> static __ro_after_init DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
> 
> /* called once from riscv_fill_hwcap() or similar */
> void __init init_guest_isa_mask(void)
> {
>      for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>          if ( riscv_isa_ext[i].guest_supported &&
>               riscv_isa_extension_available(NULL, riscv_isa_ext[i].id) )
>              __set_bit(riscv_isa_ext[i].id, guest_isa);
> }
> 
> void init_guest_isa(struct domain *d)   /* called per-domain */
> {
>      bitmap_copy(d->arch.isa, guest_isa, RISCV_ISA_EXT_MAX);
> }
> 
> Do you mean something like that?

Yes. Not necessarily with bitmap_copy() though; perhaps with a pointer in
struct domain.

>   Then allowing riscv_isa_ext[] to remain
>> __initconst (should really have been __initconstrel).
> 
> I think you explained me already why but I forgot. Could you please 
> remind me again why __initconstrel should be here? Is it because of 
> pointers used inside struct riscv_isa_ext_entry?

Yes, pointers incur relocations, and the need for relocations requires
that the compiler emit the data to a writable section. As opposed to
relocation-free data, which (when declared const) can go into a r/o
section.

Jan

