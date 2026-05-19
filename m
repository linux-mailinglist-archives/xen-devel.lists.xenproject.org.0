Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL1GLj9rDGo8hQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:53:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC25580098
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313086.1583317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKsR-0005Sx-4N; Tue, 19 May 2026 13:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313086.1583317; Tue, 19 May 2026 13:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKsR-0005RJ-0q; Tue, 19 May 2026 13:52:55 +0000
Received: by outflank-mailman (input) for mailman id 1313086;
 Tue, 19 May 2026 13:52:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPKsP-0005Ql-Sn
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:52:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKsP-00CrVd-8d
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:52:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c6b2b-bab6-0a2a0a5309dd-0a2a4505e706-34
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:52:53 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c6b35-aaa8-0a2a45050019-d155d02be5ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:52:53 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-67be41d5eeeso6300829a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:52:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68310b3e8fbsm6640261a12.2.2026.05.19.06.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 06:52:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779198773; x=1779803573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zQzDAawb2MyiQGrMt/FCPmrtX8nCJ88FEd+CX8xZiY=;
        b=TqkYayUqukRkAdQEi6uco7Ts8MN5ZIONI4AsEETCuoHb2pyIYN/uEuHfyZofXUyxWO
         wsIa1ipdsPGrQMp8OAKX6IWurs+7l16/O6OMextvPx9N3dPylEXqHK3qCxHuhGFH9PEC
         8RPwQytGSVHrvUEXUAUzwpweqvrrr4FKO4KAfFFWe7O3cl9jqlF7oLI7LyATJHWu211D
         aV9GFEDOStGK7KbgQFxBIreMFyOL4jWaHCzUNdD5JMZOuE/RohYpH8hnpSq1O3m9f05Z
         zMmuCaCXsNrR55vgkrgCsLDf+W58n1ZTxGdGdjNWzpOTpdXi6+vIdMJEEly+LtMYktz6
         eexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198773; x=1779803573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zQzDAawb2MyiQGrMt/FCPmrtX8nCJ88FEd+CX8xZiY=;
        b=mvZEqVdZGRiSGNrSY0fZFmuMM3Eht87ZmZ4mpXHwj9Hxf5fZXNZNBqeAdBiyYp2ADI
         QhMpO7FwlbC20dY4XHtvzlXx5c3Z6AQHFRqqn5BRj19o1XbQiiMgcN6ax/7f2Rj32mfo
         bPPsMZiMKmfUYqXTfdhQHAY2J4FsoAvDt/K1SnLcfxNIuyFALfJn1KAHTbeZW1lMN6sZ
         WlHxVAhWBgSwkmKFSFstMaYerbfFt8ML+oUnA00FJGcd6MlQ6G56JksMDNaGufAOIawE
         OJzQCS11HQVCD7xe/LW//BPV8sQLWhuv9FeW31Q9yZfdHPMWtFgObHvWcAqg0HpAl5NJ
         mnoA==
X-Forwarded-Encrypted: i=1; AFNElJ8rEJyRJwK96aAapR95HIQoHOe4Bibo747HIIZIN53s8LDBkg1OcXRokDc5q+Ns+Vx8HrzUEeVzzC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpFXIc1V0i3koExSUGcEzpIt7sg0OAhfhWRY+bgIAFqSEbF/5k
	wgFwrjc66gr43NSnGfmgRs8uqg9Q/aQY/AiFqsBr2tzrqgKzXp0fqAa6
X-Gm-Gg: Acq92OGeJw4Xyp5rI0dn7H2LvrG19TsHPvvL73msbtWZojbpNrTxJvuEDyMUhjJicqi
	rdP9755xD8ILnhvmDn7/ap3ZCxLblLcXSs785gpi2xt5tegQBHAKo2bxg6ueYFuQ44gp2ChCleP
	jdCyE/160WRnwsPYvavs47eTPsZT3rLiFHfwVL8FJd/nQEzGq611igTyFphecL9yuR18WB3NJZB
	TzlNWUvDgV1SbbS+sbMHLv1EiCzo5skVFOPbHfksrn3JE9LOnQxPGBS7R9DfBPwgVI8h+txBVBv
	8VHFxNXYabWppsfITcLmlPixN9a1TVjoEaclzjhGzkVSurL/x/CJMi/d6eES/8zfSkbsJ/4opoo
	lTYMtvWAiwiybauhQIVar4JY4//l0Kua5frTr8N32TlFzLOZsLu/K3TZATza6+qGLQZOE/fuXQ1
	VIRxnr7I9rjiVOi7ol0qubXcV3Y7DnmnKyNByZ2Y59cmq9RVaja0Yde4iYxjTMq3EwV65tiCQ/M
	Zc=
X-Received: by 2002:a05:6402:428e:b0:683:e394:cc0c with SMTP id 4fb4d7f45d1cf-683e394ce69mr9374327a12.4.1779198772428;
        Tue, 19 May 2026 06:52:52 -0700 (PDT)
Message-ID: <f6b8ce86-11ad-4014-add3-6360c9c53230@gmail.com>
Date: Tue, 19 May 2026 15:52:50 +0200
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
 <ee441369-cc67-4ec1-84f9-4619ce645da1@suse.com>
 <f5cd7d50-e274-4a8c-a535-8c0f47cec137@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f5cd7d50-e274-4a8c-a535-8c0f47cec137@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779198773-D8145443-08A95838/10/73395122804
X-purgate-type: spam
X-purgate-size: 4202
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
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
X-Rspamd-Queue-Id: 2EC25580098
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 1:56 PM, Andrew Cooper wrote:
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
>>>>>>>     UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>     member access within null pointer of type 'struct shared_info_t'
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
>>>>>       if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>           goto fail;
>>>>>
>>>>>       clear_page(d->shared_info);
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

I'm not familiar with the FIFO ABI, but after a quick look it seems 
d->shared_info is used here for example:
static void setup_ports(struct domain *d, unsigned int prev_evtchns)
{
...
     for ( port = 1; port < prev_evtchns; port++ )
     {
...

         evtchn = evtchn_from_port(d, port);

         if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
             evtchn->pending = true;

         evtchn_fifo_set_priority(d, evtchn, EVTCHN_FIFO_PRIORITY_DEFAULT);
     }
}

So shouldn't it be still allocated in arch_domain_create() or as I 
suggested in domain_create()?

~ Oleksii

