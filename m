Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO2PNhZIDGprdAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:23:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A057D7F2
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312795.1582893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIX4-0003Ip-NR; Tue, 19 May 2026 11:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312795.1582893; Tue, 19 May 2026 11:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIX4-0003Ge-KI; Tue, 19 May 2026 11:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1312795;
 Tue, 19 May 2026 11:22:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPIX3-0003GY-7U
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:22:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIX2-000EN5-JU
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:22:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c47fc-bab6-0a2a0a5309dd-0a2a4509a64e-44
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:22:40 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4800-2497-0a2a45090019-d155d02bb077-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:22:40 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-67389cf78b0so8029478a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:22:40 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68310b4069dsm6303182a12.1.2026.05.19.04.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:22:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189760; x=1779794560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PgFiqEWjNufsJ8px8sHsLEdCGgRsHES8u9NiutjzCzc=;
        b=H2/BMQ+Kwpo5E6XgYL2ocLNcvRcXzZp3lRAnjBhGLrBE7Y22hQ7e6WZb69FdNg0Edx
         WOHrmpjvQWSEyPfWOMz6rga+jA39REcDR+6smwPaiSzWf9E4fUSeb/YjljdUCFHpGWl0
         oPLUd5iuXkggtsjJS+Twm9w7HxlURQ987GIYGgrZ0bjW1g5AeTrXPZsDUOxYu8NclP80
         X0+bQwhfHb7+HEtShBjmXIVhMjQk/YopPXqMZuqxk7kOwuSRnYunv4afXCb4HyyfitP4
         GA3+OTlZRdUbCz2fulSUpjibAUijrfEVeQzeokf/w6K6Qh1FuU5Ucu2uAHCca9MTmEeR
         JNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189760; x=1779794560;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgFiqEWjNufsJ8px8sHsLEdCGgRsHES8u9NiutjzCzc=;
        b=Uoi1gGT5ILwL+jw1NaKIkEW5Po7pP4m2j6XOzqpePu9XOysvQS6SG6MiQen5USari9
         AQBVPDcWhYCjXXy6J6QHOlYx7PztOesvvomkg3KQLzd5P2L7+lLFj8dcADBIslh/Jwf/
         PQxdQD43wMA5VdhLqDk9IMZTTK/Q5wqUGkjVPwDvFGdutolLseCWkPIBPmgYqmCkole6
         oe3rkqOU0XjdeUmKAF0WBiUWC1JEQtuTHAqV87jsE/oIRfkEBaNPvTgWkJVKMJzLTzJt
         WFCUSsN6ffe3y0HWtYVIZx8zp1BD9Id95+c8iMBHcPvMerBx8Qn21/ZboN9L8sJPlwoT
         LYEw==
X-Forwarded-Encrypted: i=1; AFNElJ/sXss/O1O+1Fy0hFCi82VidNXsz5rbZmarlTn0AvlJbBZqXyuwLSE7hC3C+f2uZTnhsEjGEcroeck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqM8ARy7xXhZkMCWwfsDCmVhLMv7wAp1ENWhdxU50S33SSEVPp
	7HsiAOneGbqDarPeER9F11CmO5vebCV6u/7nURkbrAt9jptzhUHL4Lo2
X-Gm-Gg: Acq92OFOLRMKIc5Tc/SHQ2mXT/sWA7UBSYl0Uhhi2Ov1DCc6yZgR6t1QgOJa/nYfQ18
	zI+1CHaJM/blUfZ9D5yCx6foEsP3h2gYiQHPAvpQIumexu9+banpiQSryn0MiiZZ+TQnPWlnuEA
	oVFd+611uMYN0ttLtCds3DtMsbxt/RfKi0nhm9BIuO5Pj8uMVyVXlfCUuXi4Pdbud5lSqTRp3cZ
	s+MjWf6nYi8HR8YwrDoVc4nm87BebBIG4A/tqSYeMf9FsewkQKO1B6T6QbPuYtET2BkB22PEUAT
	DSCwHEN0TKUJrY2jz/CDsi1W8OqnSLKmB+0hNBXxK4aYShhw7XVNlYoPVISBk+8b9qVDRSvFXsE
	bB4nYB1fPIIEhRGfRcDaNvuCcGA38x3vIaRiLsG1oqZMCVFmI28gVmmVd+vqvFsDBIvR1tbCBnZ
	grYAyAmMs4cMMpEFzAs3zESPa5niQ2bAe7U8AUVOMrJn9Gz+hynKJNT7g4ulEnumOM8TnN4luE4
	08=
X-Received: by 2002:a05:6402:3241:b0:681:5b59:648a with SMTP id 4fb4d7f45d1cf-683bc6b7ed1mr7201586a12.11.1779189759888;
        Tue, 19 May 2026 04:22:39 -0700 (PDT)
Message-ID: <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
Date: Tue, 19 May 2026 13:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
Content-Language: en-US
In-Reply-To: <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779189760-8A18BA53-3B91C3CE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2640
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email];
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
X-Rspamd-Queue-Id: 493A057D7F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
> 
> 
> On 5/19/26 11:37 AM, Jan Beulich wrote:
>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>
>>> However, it does not guard against d->shared_info being NULL.  The
>>> shared_info() macro expands to a member access through d->shared_info,
>>> so when an architecture does not allocate a shared_info page the
>>> dereference triggers UBSAN:
>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>    member access within null pointer of type 'struct shared_info_t'
>>>
>>> Extend the existing fallback condition to also cover the case where no
>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>
>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>
>> I question this, largely (but not only) because I also ...
>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>> ---
>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>> d->shared_info remains NULL throughout domain lifetime.
>>
>> ... question this mode of operation. Yes, you may (for now) be able to 
>> get
>> away without, but e.g. event channels will want supporting at some point.
>> Which will require a shared info page. Better put that in place right 
>> away,
>> even if the guests you test with don't use it (yet). Certain other common
>> code also assumes d->shared_info to never be NULL for an alive domain.
>>
> 
> Would it be fine than to allocate it in arch_domain_create() ... :
> 
>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>          goto fail;
> 
>      clear_page(d->shared_info);
> 
> ... but without calling share_xen_page_with_guest() after that 
> allocation as share_xen_page_with_guest() isn't implemented at the moment?

Or could it be an option for all arch-s move allocation of 
d->shared_info to domain_create() in common just after arch_domain_create()?

The only question if share_xen_page_with_guest() could be ifdef-ed 
somehow so not to block new ports to implement it from the start.

~ Oleksii

