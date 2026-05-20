Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I9rMprRDWpP3gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 17:22:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF37590B8F
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 17:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314095.1584110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPijq-00039f-8e; Wed, 20 May 2026 15:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314095.1584110; Wed, 20 May 2026 15:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPijq-00038o-4H; Wed, 20 May 2026 15:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1314095;
 Wed, 20 May 2026 15:21:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPijo-00038i-Go
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:21:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPijn-00H6k0-9x
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:21:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0dd17f-5cb7-0a2a0a5109dd-0a2a4505884e-0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 17:21:35 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0dd17f-aaa8-0a2a45050019-d155da2fc517-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 17:21:35 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bd85ebb368fso723872466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:21:35 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4bd0a24sm874062766b.11.2026.05.20.08.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 08:21:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779290495; x=1779895295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e/uf9Lkg0CRtG5Rk8s9zUsp5qaEY5uGp+gmWi2WAye0=;
        b=jYW65RkR91UVh07EvboFybjn/KZM73dP1lshsXbNt9ddEu9DkPij3dlYh6E1SPM3pC
         Wt3a4UGDYtRC1KAVQzf7IP1SL2oNY2j42Yzy8/1mZ+eEUiHszKLvTZGKMtjtkkCYYlA7
         Lia49h3YfYGqy0MvbmgZVvrkl2e65u2A9b2dUhZnLgeXomWxAUXUefEHvV2y3BlWU57I
         sDzRcm0DbVWxzR/BtlzA91QuT7WcCADK0zraai8Yr1/g9TEm3tz6Muvlu7dnaLVXP707
         MBPh28x+ld2pXn/pQQpqJyRIztCImZRI7WcYgk7zSmp6/fVFFKL7SsNzFTRQyjGVz5SH
         WSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290495; x=1779895295;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/uf9Lkg0CRtG5Rk8s9zUsp5qaEY5uGp+gmWi2WAye0=;
        b=c0pE0IN4H2ivhTxqT34xSccrc6CfAYL1yBZPetZ331MmBpGUFA509+dieohHTILjbf
         A9UdWY1OmBgFMwT+tTAR4IGT+YdOafKNmrba7HpHTNgy8MVYHOBsktqd+ReMe0xIZxHs
         TzugEIKXyHL0OEKQGiLHW89Tz7M1gyRAoTN/HjpixYgQaxU2TANuctpSdUclTdyDP16+
         sSzH4RrPdyABUbn9Rs82nLZD9C8V5WfdbsETWPq6FhRET/ZjEHoCukLQb740cY8iG2xm
         wryF8wbx255eAaV4Vm8fdxQHmvIrl5op8dF11R2sNr2n5nOKGOIbeNAPBNM5Y7NIi+w3
         xNfA==
X-Forwarded-Encrypted: i=1; AFNElJ81SZmMTDxP1pE3TMB7sQF5xSaBdWrMS1o5QMAKcHT4oLkzQ2+FuEmL1zeiATq8RO2FLs4PHASsPUE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBY18fEogBdM1ZDJdntZpywOEP5qlRyJlHcKGgjatMAjUlC69F
	VeO3sxK8Je8V9VaqtbjzK3sWVxUtfKR21tXpVwYuflzUALzzmf/9mwf6
X-Gm-Gg: Acq92OFlnimLhs9oJWH0AFUgLp4LJOBNpltSYyg9gKVsY1CVJUY6klrU2RL4k1D6y60
	/X1ZodBrsyuZHZjSQXUirAof/DQ+iLGpm5Yl4C0xlk1kKYW4iXrgGn27Rz38S+sfOWQ2sLrsFY6
	IXhmJrSKW3sSrgh3AUgzgsUMPhoEXEqskvI5n9MEmRJytBU4pZMfumGmfF6d1FDauotbOJ1GVHZ
	aXiCbdV9g2iuCRlacWUohHG5LoEXQUf83X11RvbCJKf3iPZHkhkxRrqRInngUoGvpJkMXtZFGRd
	Zuhgx9Y92Eoc9ZjFsQqGFX2Q32REkCxx0T01Cpzdkiiugew5g/yZyqC5bR+HuxwPeTAS5jxPHlj
	faAsf36RvNBI+zPtTSjvm7sMfZdsziVm41ge6VXQRB1NzqL9/F28ogwyOn0z5YQlLes0MBrr4+Q
	r1mPyRfWmC5W7IQbb7X6bf8Z7yV2OozI/X2zH3vqJwAxXtxGMM6JAHur6uecZ517O0ZGpqwREaA
	Sc=
X-Received: by 2002:a17:907:c291:b0:bcd:be80:63b8 with SMTP id a640c23a62f3a-bd517ad60b0mr1466955466b.44.1779290494560;
        Wed, 20 May 2026 08:21:34 -0700 (PDT)
Message-ID: <f04bf56e-187c-4378-9207-851776290c5d@gmail.com>
Date: Wed, 20 May 2026 17:21:32 +0200
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
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
 <ea274abd-d7be-4fee-a147-936a8adc1c81@suse.com>
 <12e89d4e-2856-4130-aaa7-1ec1a742c72f@gmail.com>
 <2d8166e4-009f-4066-b96d-fb9e41b548a1@suse.com>
 <eec28059-d7c5-4d30-80ff-7b1b57d706ec@gmail.com>
 <5f2013a0-d90b-49c9-bd18-afeffebac74e@suse.com>
 <16fb059d-84a1-4f2c-bd25-36ac1fc6d0c1@gmail.com>
Content-Language: en-US
In-Reply-To: <16fb059d-84a1-4f2c-bd25-36ac1fc6d0c1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779290495-D8D7F443-6184FA2D/10/73395122804
X-purgate-type: spam
X-purgate-size: 9082
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1FF37590B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 5:08 PM, Oleksii Kurochko wrote:
> 
> 
> On 5/20/26 4:21 PM, Jan Beulich wrote:
>> On 20.05.2026 15:40, Oleksii Kurochko wrote:
>>>
>>>
>>> On 5/20/26 2:03 PM, Jan Beulich wrote:
>>>> On 20.05.2026 13:33, Oleksii Kurochko wrote:
>>>>>
>>>>>
>>>>> On 5/19/26 1:53 PM, Jan Beulich wrote:
>>>>>> On 19.05.2026 13:22, Oleksii Kurochko wrote:
>>>>>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>>>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu 
>>>>>>>>>> slot inside
>>>>>>>>>> the domain's shared_info page for vcpus with id < 
>>>>>>>>>> XEN_LEGACY_MAX_VCPUS,
>>>>>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>>>>>
>>>>>>>>>> However, it does not guard against d->shared_info being NULL.  
>>>>>>>>>> The
>>>>>>>>>> shared_info() macro expands to a member access through d- 
>>>>>>>>>> >shared_info,
>>>>>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>>>>>> dereference triggers UBSAN:
>>>>>>>>>>       UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>>>>       member access within null pointer of type 'struct 
>>>>>>>>>> shared_info_t'
>>>>>>>>>>
>>>>>>>>>> Extend the existing fallback condition to also cover the case 
>>>>>>>>>> where no
>>>>>>>>>> shared_info page has been allocated, mapping the vcpu to 
>>>>>>>>>> dummy_vcpu_info
>>>>>>>>>> instead. This is the correct behaviour: dummy_vcpu_info 
>>>>>>>>>> already serves
>>>>>>>>>> as the safe stand-in for vcpus that have no usable shared_info 
>>>>>>>>>> slot.
>>>>>>>>>>
>>>>>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area 
>>>>>>>>>> registration")
>>>>>>>>>
>>>>>>>>> I question this, largely (but not only) because I also ...
>>>>>>>>>
>>>>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>>>>>> ---
>>>>>>>>>> RISC-V does not allocate a shared_info page at the momemnt 
>>>>>>>>>> because its
>>>>>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>>>>>
>>>>>>>>> ... question this mode of operation. Yes, you may (for now) be 
>>>>>>>>> able to
>>>>>>>>> get
>>>>>>>>> away without, but e.g. event channels will want supporting at 
>>>>>>>>> some point.
>>>>>>>>> Which will require a shared info page. Better put that in place 
>>>>>>>>> right
>>>>>>>>> away,
>>>>>>>>> even if the guests you test with don't use it (yet). Certain 
>>>>>>>>> other common
>>>>>>>>> code also assumes d->shared_info to never be NULL for an alive 
>>>>>>>>> domain.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>>>>>
>>>>>>>>         if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>>>>             goto fail;
>>>>>>>>
>>>>>>>>         clear_page(d->shared_info);
>>>>>>>>
>>>>>>>> ... but without calling share_xen_page_with_guest() after that
>>>>>>>> allocation as share_xen_page_with_guest() isn't implemented at 
>>>>>>>> the moment?
>>>>>>
>>>>>> I would have said "yes" here, but ...
>>>>>>
>>>>>>> Or could it be an option for all arch-s move allocation of
>>>>>>> d->shared_info to domain_create() in common just after 
>>>>>>> arch_domain_create()?
>>>>>>
>>>>>> ... Andrew's reply pretty much rules out not only this option, but 
>>>>>> the
>>>>>> shared-info-page concept as a whole (for RISC-V). See my reply 
>>>>>> there. In
>>>>>> the meantime, the change as suggested may then indeed be what we 
>>>>>> want to
>>>>>> go with, albeit (a) with a better description and (b) perhaps 
>>>>>> covering
>>>>>> all d->shared_info uses.
>>>>>
>>>>> Looking at guest kernel code (Linux), FIFO is tried first, so if 
>>>>> RISC-V
>>>>> is going to support only FIFO, d->shared_info could legally be NULL.
>>>>>
>>>>> Looking at the Xen side, if an architecture decides to support only
>>>>> FIFO, d->shared_info is touched only in vcpu_info_reset(), which is
>>>>> called from vcpu_create().
>>>>>
>>>>> All other places where d->shared_info is accessed should not be
>>>>> reachable except for one case in event_fifo.c: when a guest issues the
>>>>> EVTCHNOP_init_control hypercall, setup_ports() reads from 
>>>>> shared_info(d,
>>>>> evtchn_pending):
>>>>>      static void setup_ports(struct domain *d, unsigned int 
>>>>> prev_evtchns)
>>>>>      {
>>>>>      ...
>>>>>              if ( guest_test_bit(d, port, &shared_info(d, 
>>>>> evtchn_pending))
>>>>>                  evtchn->pending = true;
>>>>>      ...
>>>>>          }
>>>>>      }
>>>>>
>>>>> This looks like it handles the transition from the 2L ABI to the FIFO
>>>>> ABI: if a guest started with 2L and then switched to FIFO, any events
>>>>> already pending in shared_info(d, evtchn_pending) need to be 
>>>>> migrated to
>>>>> FIFO's per-channel evtchn->pending flag. But it looks like I am 
>>>>> missing
>>>>> something here as I mentioned at the start that Linux uses or FIFO 
>>>>> or 2L.
>>>>>
>>>>> Am I missing something?
>>>>
>>>> Quite likely you aren't, but I didn't check. My earlier "covering 
>>>> all" may
>>>> well resolve to merely stating things accordingly in the patch 
>>>> description.
>>>
>>> If either FIFO or 2L can be used, shouldn't guest_test_bit(d, port,
>>> &shared_info(d, evtchn_pending)) in setup_ports() be dropped? If FIFO
>>> was chosen by Linux, there won't be any events in &shared_info(d,
>>> evtchn_pending), so it is essentially dead code that could just be
>>> dropped.
>>
>> Why would it be dead code? Who said that a guest couldn't to 2L for a
>> while, then switch to FIFO? Think of boot loaders, for example.
> 
> I jsut based my assumption on Linux use case, if generally such switch 
> is okay then I will add to my original patch what I suggested here ...
> 
>>
>> Jan
>>
>>> Or would it be better to leave it and skip only if
>>> d->shared_info is allocated: if ( d->shared_info && guest_test_bit(...)
>>> )  to cover the case when a guest wants to switch from 2L to FIFO (if
>>> that is even a possible case at all, since as I mentioned above, the
>>> guest (Linux) chooses the event ABI once and it stays for its lifetime)?
> 
> ... + refactor commit message:
> ```
> xen/domain: fix UBSAN null pointer dereference of d->shared_info
> 
> It is legal to have d->shared_info equal to NULL for architectures which
> support only the FIFO ABI for event channel management.
> 
> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>    UBSAN: Undefined behaviour in common/domain.c:325:10
>           member access within null pointer of type 'struct shared_info_t'
> 
> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
> and falls back to dummy_vcpu_info for vcpus beyond that limit.
> Extend the existing fallback condition to also cover the case where no
> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
> instead. This is the correct behaviour: dummy_vcpu_info already serves
> as the safe stand-in for vcpus that have no usable shared_info slot.
> 
> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
> should be updated to avoid a NULL pointer dereference of d->shared_info,
> since in that case there will be no pending events in
> shared_info->evtchn_pending and the pending flag of the FIFO event 
> channel does not need to be set to true.
> ```
> Additionally it seems it is needed to add the following:

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..2fa2dcdf4ded 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -104,9 +104,12 @@ void getdomaininfo(struct domain *d, struct 
xen_domctl_getdomaininfo *info)
  #ifdef CONFIG_MEM_PAGING
      info->paged_pages       = atomic_read(&d->paged_pages);
  #endif
-    info->shared_info_frame =
-        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
-    BUG_ON(SHARED_M2P(info->shared_info_frame));
+    if ( d->shared_info )
+    {
+        info->shared_info_frame =
+            gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
+        BUG_ON(SHARED_M2P(info->shared_info_frame));
+    }

      info->cpupool = cpupool_get_id(d);

diff --git a/xen/common/time.c b/xen/common/time.c
index 04a65f00b35c..1ee49a8b0d13 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -94,6 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
      uint32_t *wc_version;
      uint64_t sec;

+    if ( !d->shared_info )
+        return;
+
      spin_lock(&wc_lock);

      wc_version = &shared_info(d, wc_version);

~ Oleksii

