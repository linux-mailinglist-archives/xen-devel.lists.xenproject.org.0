Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNkEGDFODGqxeQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:49:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92457E005
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312849.1583017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIwQ-0000rZ-Fa; Tue, 19 May 2026 11:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312849.1583017; Tue, 19 May 2026 11:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIwQ-0000nb-CO; Tue, 19 May 2026 11:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1312849;
 Tue, 19 May 2026 11:48:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPIwO-0000lg-LV
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:48:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIwO-001v21-1B
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:48:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4e05-bab6-0a2a0a5309dd-0a2a450390fe-48
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:48:51 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4e22-672d-0a2a45030019-d155802cbd6b-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:48:50 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488b0046078so31205555e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:48:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5e9d5d9sm376080335e9.15.2026.05.19.04.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:48:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779191330; x=1779796130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xweuh/3vGAVF5+Ir+VMpBZdMEtPfAozc94TAl2/ZOI=;
        b=askT7LmFPmXxWCa27YugitSTSy7G5l/2bbrKdnKj79l4MnxPiSv2ZldHb5RIcIVNjf
         YOTGki44tL4rYtE+FDI2O3IShC2fQL0uIAVXLgFD75kjwPJjJSBIcnuepbFJVI4Q1scp
         eF1fkfFh3gSjUhXyeXmweUJKgYXZH5GlLmoKPyR7m5tcoSE/wZ44rh5dqR4h8GwfzT+y
         372duAASlHiaeW+z1urXBFfprbPmra3IFhRPHwsK+SOTVBjeGo4MP0jKIUOG4Olkxwnv
         q++MEXT4l9kPXPi79NzgusTywmyxiCqP2l05FvGwdmhOdCFo4Q0an6RkWGd4usB0UMto
         yaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191330; x=1779796130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xweuh/3vGAVF5+Ir+VMpBZdMEtPfAozc94TAl2/ZOI=;
        b=tIzExK2jXtnfAsFkPOG0Xm5jbxQUv+FTjYFWKM5XOMs0FqnfRBozY0RZDCIaHha+Fu
         JK0QLWHB/i+O1Eb8o1Dd3n+GuFL6BgLh6Uz7I5ULPDMzJzOwl2U+8i8NFnRpmW9z4gt5
         m2fzo9Uu3trg4VJpbvV9H/FpbUJ2ysdTxrLbTkNKJWjFNRvNrZ8elFljDFjaUC9LKq4G
         Dlvigp4uBhwXX6ghmgQjHN+FmdTo8ILeXJIfvJpBDnxN7YBx/gUSVCMPQB5q2W1DsAw8
         KLBv/daDdxq/2MdLslG50r8hfaQM8PLUSGLY4IMmtGy6FDCbmlZ32c6vUxkVD9tund0C
         0Srw==
X-Forwarded-Encrypted: i=1; AFNElJ8uRPLX/oXSU5/WTcIYRXIlWy62At7D0gDUS0Nx/mk/Xz02qqzx+Xct/vH6RVpyyhxmSXAPhIrxtDs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsrrvZ6CwYx+k2G63h12SKCC6Rf6V1Z2STrnMM7rihb8PiYATg
	Lt7Z+UFhw7LGwzGeS3flnfh/GT1p15/P5GgHzdryW36U/tGipyS+2MuJ
X-Gm-Gg: Acq92OEfcx4AAFYbVVfc0vcUtE+bgty1+simZ0r7dK5FB8/HqGSaCrDoiedXrLfv54I
	PHAiCLyQyJf9jBc5RikaaRa+bVj78LGc0ZHuPP+elrU0s2R5Jlfh64O8m4bJDFeIHlvzRkaOlEk
	EU6lMkbt7ya7cWfusGB/i/CsdnuTm+eVOi+kxgcXvp8u/BdBdXL37pe9DtO/YFTlclhupy0kah+
	oxezxc0G+AwsvfgjOmAYqi7B7hhFgybMw4bb0naPCLbZ4nTeREazabKKfnig8re5mfG0tLRZ1T+
	GSSsf4fKCqw/r0OHxZQpZc/hh4zbUbXBIhCriGI18fuwT5SI7P9VJcD+AUQLEyM4wDDjOfR3Nvi
	hDsKe6eWLK416aOHHdrW+rbWH+wah+WPCkNaqVkFWr3hSLNCw38owG9q35T6oeXLJLZi4KMao5J
	JWakz74hK+X+4LGBa5BUH1gIrFRTwA/K/ZAT+hPFHcRAzRoiJ6mVu021QlXF/ib84Dx8fw2OsjG
	6OcIVce174fug==
X-Received: by 2002:a05:600c:c10b:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48fe5fcdedemr228875815e9.5.1779191330262;
        Tue, 19 May 2026 04:48:50 -0700 (PDT)
Message-ID: <1de1cff5-65c0-4f59-a55a-f563b48edb73@gmail.com>
Date: Tue, 19 May 2026 13:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
 <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779191330-38F72938-2D792059/10/73395122804
X-purgate-type: spam
X-purgate-size: 3313
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:baptiste.le-duc@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EE92457E005
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 1:32 PM, Andrew Cooper wrote:
> On 19/05/2026 12:22 pm, Oleksii Kurochko wrote:
>>
>>
>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>
>>>
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
>>>>>     UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>     member access within null pointer of type 'struct shared_info_t'
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
>>>       if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>           goto fail;
>>>
>>>       clear_page(d->shared_info);
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
> 

Could you please clarify what could be done better now? It seems like 
shared_info is used in a lot of places in common code base and it is 
needed for event channel stuff for example.

~ Oleksii

