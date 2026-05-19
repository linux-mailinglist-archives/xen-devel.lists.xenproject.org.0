Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHxsIiQtDGq0XwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:28:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2E57B46B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312643.1582716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGjs-0003WX-T9; Tue, 19 May 2026 09:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312643.1582716; Tue, 19 May 2026 09:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGjs-0003Ul-QS; Tue, 19 May 2026 09:27:48 +0000
Received: by outflank-mailman (input) for mailman id 1312643;
 Tue, 19 May 2026 09:27:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPGjr-0003PG-HM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:27:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGjq-00BKH8-Pt
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:27:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2d11-bab6-0a2a0a5309dd-0a2a45099874-6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:27:46 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2d12-2497-0a2a45090019-d155d02badbe-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:27:46 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6804e24803bso7498683a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:27:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4e9175csm666314866b.55.2026.05.19.02.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:27:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182866; x=1779787666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dodeXLv0derw32YsSF17DhDhOcw506Kyc1XmLVi4mT4=;
        b=Z1r3uS/QB88RgKUs8QPUw26H4Vp/sZZIUeA1K866016MMoNT3jMv43IB1yE0zrCOlV
         7xJiyFFWJ8Fj5p6ADExRvSr5JUjGlb9tnd0kK+mrgvILCZ+mfVjXiSpbgPJZju2LjHBR
         syFZSwTlvRQ/e9mHqOfecSh3xPoLWcFPOfLGcYrF238d9zQIlGqAerc6Vk975I8qX8u+
         mI2fTtueia/a528cgYluPIZQYfXe4Im9ZJydXJTmYtUHbDcCFdlb6jRxEGiTMX1eRr20
         ViBvFoychrhlRueNDO2PAg/2hC17TicdnvqYZXICeGTBSQHOnvh/RyXUi5H/oEGps887
         g0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182866; x=1779787666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dodeXLv0derw32YsSF17DhDhOcw506Kyc1XmLVi4mT4=;
        b=Nx2NYD56X4Xq8R0LfB3mF+gKEOGaPRBSArdj4Jw4GV1veDczfMH4FDGfQ2zn9qXGaG
         RqCKtYHVr0XHgIrh6/hc+wRQ13TLvhVuAk9ZxxF4ie82PJiv9c493at5kojAaMBmWuz8
         3DcjwYox9K30kPx1TbI7Kwkjn0tOwtr3QD+ug0ORPwTSrkqjz96i7n1JBuXCwZoRucIo
         0aKSRgV/zbcEG14eihWT3Rrst6K3JRbVttzgB6bUVDdIHx83W15jVbW9GgKO5GIYLWEN
         asZDDpVsQcU60b96Xrh27ICn8DMWfd9UQ05m9asPc2igWk7XaL4fgVyZ4y1+iaQRYF8q
         CFTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TroqraooCN21CyOHb7lPSuXyZX9CaEISTNP9Y2Jyb98DsST8I3qAtqItwrilPmNqdxJuhB/6by90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfoEA5eFyDSuOJGIC1dhLA1557HqjWY+0p2OUsayeaizKdAfbg
	riiYzefCV8z9TqWvSo2Hkmc3cK7A1/E3/cVqzOHjvip8ueL17jAkjWwr
X-Gm-Gg: Acq92OGkQzu7ToFRzpkomHyD7VwgWposWr5ghkS0RtVf/O87yVKdFZqKWwFiK4oqsYC
	8xdSrWzXhgYmDRTqqUFQzrTSiYDq0FQ6mtX9T52G7p+lE8rB7QCqYeGlgDm/62A3y+YZ+WZhUoD
	8b+EPbUg/xghzqqEPfUyrIhHR6OVP3T4fjgWV/I4UI2Dt+OdVRn8cftnwFbtB1PVAxrqZoSR5/3
	yWZAmD6XPStOpiQJJpP4lMkCx4WtAEe2PbNl6cvm4Kja+07bfRNyXSqtg8e1na7WfGGEmkM7Ps8
	IUUHx0ZjyW9/gXzcEhfeATIFHww37b1SgmIXVfoiSDunSFFyUKM8qClXaXTJ0gMvapFcblAxsn7
	hLOec22OZH5EdpAmHMCB69IQDLIivzWkKDyUKiP9rNJ9YrQP9FuuVX0icNWRdKGNPUoNLSfeRvD
	RNkpddGgpp/deLHexzoezeCFxhiMgRrhKfEkljjgiw78Nntl44W2ymqPnAz5s5Iz0v/KGNcErY8
	qaa+fA+ytSjwQ==
X-Received: by 2002:a17:907:cf8e:b0:bd5:7c2:70ca with SMTP id a640c23a62f3a-bd517a992c2mr1041704466b.48.1779182866083;
        Tue, 19 May 2026 02:27:46 -0700 (PDT)
Message-ID: <a4dca380-1a7e-4c34-9b52-58c056745e03@gmail.com>
Date: Tue, 19 May 2026 11:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/26] xen/riscv: Implement ARCH_PAGING_MEMPOOL
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <97f20cc49563fdf01775a649e562e302bd0fa886.1778250616.git.oleksii.kurochko@gmail.com>
 <97011ba2-0f54-4336-9949-5ea0d76900f1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <97011ba2-0f54-4336-9949-5ea0d76900f1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779182866-88B73A53-0AFCDA1C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1764
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F3A2E57B46B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 5:13 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> The p2m_freelist is used to allocate pages for the P2M. To initialize
>> this list, domain_p2m_set_allocation() may be called from construct_domU()
>> in the common Dom0less code, so RISC-V provides an implementation and
>> enables CONFIG_ARCH_PAGING_MEMPOOL unconditionally.
>>
>> Additionally, implement arch_{set,get}_paging_mempool_size(). They are
>> not directly used yet, but are required to support the
>> XEN_DOMCTL_{get,set}_paging_mempool_size hypercalls.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1606,3 +1606,27 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>>   
>>       return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>>   }
>> +
>> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>> +{
>> +    unsigned long pages = PFN_DOWN(size);
>> +    int rc;
>> +
>> +    /* Non page-sized request or 32-bit overflow? */
>> +    if ( pfn_to_paddr(pages) != size )
>> +        return -EINVAL;
>> +
>> +    spin_lock(&d->arch.paging.lock);
>> +    rc = p2m_set_allocation(d, pages, true);
>> +    spin_unlock(&d->arch.paging.lock);
>> +
>> +    return rc;
>> +}
>> +
>> +/* Return the size of the pool, in bytes. */
>> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>> +{
>> +    *size =  pfn_to_paddr(ACCESS_ONCE(d->arch.paging.total_pages));
> 
> ... the stray blank dropped from here. Will take care of this when committing.

I would be happy with that.

Thanks.

~ Oleksii

