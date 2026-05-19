Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA0bM5hBDGq4bwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:55:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA857CF3C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312760.1582857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPI6T-0005Ql-0c; Tue, 19 May 2026 10:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312760.1582857; Tue, 19 May 2026 10:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPI6S-0005Oe-U6; Tue, 19 May 2026 10:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1312760;
 Tue, 19 May 2026 10:55:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPI6R-0005OY-NV
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:55:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPI6R-00CCcZ-3N
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:55:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c418c-5cb7-0a2a0a5109dd-0a2a4502d260-12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:55:11 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c418e-af86-0a2a45020019-d155d035c1c8-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:55:11 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6802f9c5debso8166411a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 03:55:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4ded6dfsm707784266b.39.2026.05.19.03.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 03:55:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779188110; x=1779792910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGogrGSd0RJvcukUMyuPyf1sE63H4AMkZ2I+S6HMH6A=;
        b=QgyKSYePeXJ7fOrPIp53BrQtEknDs/vfxdJZnbrW9snZPpDu+8/avsl6ttqqiexdl9
         UePsI0gZ2X1ikGJLmNkOggsaBe9/KNC8tpPYmn68BRlhgNXpWZp6AHXDMwcnPNm2553f
         fWmAGKlYq/CpRxsws/W9jQ+1W0VhvRzuTr0lOvGWEiXdIAFj3QFRuL1qEDhV5/7uXdyT
         0czeVq+m0ffucUs/MveAbqni4LhhOVBWBdMn8hHo37m9ErNR8PoOzZop8upUCPie9jNR
         or/Q6EUyjqfzxd/GSv6MvTrMPMj7X3m6xL5bJcPPVUens3RLv9hmQRyrhBT4MN98WV5G
         ej9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188110; x=1779792910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGogrGSd0RJvcukUMyuPyf1sE63H4AMkZ2I+S6HMH6A=;
        b=Coz7ZfFN7IqMCN7hFc0bzQx18QrZDuF0N4QFqcevC8gSCJfKfnlIDVtm/PQMw2gMED
         8DHza6fBcBd+6zxmMTBA5N8L0V6tgi+lShqo6RWUzZnzftdDPmTU+D2Bl87BCm/ff8Yz
         8P0pwhTJgfmHKa6R3Zl8CN6k6GY4H0RauzPilVDFXbJ+xiTgUNLrtO+FxVI+TUSR3seZ
         yWLczmZIiaJiDXj/0k90VMCbhW+cWxqksdzF/B5bqyixTZgAA86zVxcbZn/Y4LUN+Fyp
         mp6DxMyqNdKXq7piCrH3kE/jkDcveyJB/STdWDxyBAGdv7CXmIeSZaHpZnUx5A6r9gpx
         igew==
X-Forwarded-Encrypted: i=1; AFNElJ/Q4aEp7JqIYEtijMxgvWI7ZsWYIlf57l9m9+BKWg/0FLDgd9AkxdoSQQsL2r9BKYe6PDBmlfRZNJw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYlTCjdrjjJc/1LfESKMGKDQd6ISsJDXqFPdGG/jRn3wk9B7j5
	cGD5rv2K5EtfmkA675SaTT2/T5S3/uIB0IrTlzDCCQMaezuef2FOwefz
X-Gm-Gg: Acq92OEr9X/IqXcRReexPlBXV+TKX58LRLhwhxm4TzVpCaogJbmdgDkn9iii4DPOMYC
	l44ue/F42Ym7uQJElnTLqBgA56+7peHOdJda8YQW9L9XNAzj6KJFTq+5WiRfa42HNkm5BTj8wLB
	J9eEQgE3krnX/M8AJf8H0yViH39gv41Aoq4Q+/gQWXCPC3e4UY7XW8cf4SZ7dtDXw00LAB7XYzw
	qL4HjvhP2E3Pv1Zc8SvgsyZs6skPTKN3qibJ62MgxjRb5DRnDhfit9ih3rslvgKKW9oLf+PpUeb
	V7y1vrKfLM04arSEY7BV1d5E09fycN2W/Foj0/wZjsp0H+ky/z89vpFpZGW6lxxfGZPIModPiwH
	ppuuh91revUDr5rBRANzQy3561le6EB3T/tynqwiw21b4VGdiNlCqWvHlYyJtjMiVAFNSVUnBDc
	D4E7fKXOkyvo+w4apuNS5kC9hzYmLUjv8mImRRl8KLqQv7ksuozx6rxPLTUOTVkLmg2EaBXyM/u
	Gs=
X-Received: by 2002:a17:907:c8c7:b0:ba8:8c8c:1c67 with SMTP id a640c23a62f3a-bd5177dbacemr1124239466b.4.1779188110291;
        Tue, 19 May 2026 03:55:10 -0700 (PDT)
Message-ID: <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
Date: Tue, 19 May 2026 12:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779188111-AA175161-7A45A948/10/73395122804
X-purgate-type: spam
X-purgate-size: 2238
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 3BCA857CF3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 11:37 AM, Jan Beulich wrote:
> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>
>> However, it does not guard against d->shared_info being NULL.  The
>> shared_info() macro expands to a member access through d->shared_info,
>> so when an architecture does not allocate a shared_info page the
>> dereference triggers UBSAN:
>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>    member access within null pointer of type 'struct shared_info_t'
>>
>> Extend the existing fallback condition to also cover the case where no
>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>
>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
> 
> I question this, largely (but not only) because I also ...
> 
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> RISC-V does not allocate a shared_info page at the momemnt because its
>> guests run in dom0less mode and do not use the Xen PV ABI, so
>> d->shared_info remains NULL throughout domain lifetime.
> 
> ... question this mode of operation. Yes, you may (for now) be able to get
> away without, but e.g. event channels will want supporting at some point.
> Which will require a shared info page. Better put that in place right away,
> even if the guests you test with don't use it (yet). Certain other common
> code also assumes d->shared_info to never be NULL for an alive domain.
> 

Would it be fine than to allocate it in arch_domain_create() ... :

     if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
         goto fail;

     clear_page(d->shared_info);

... but without calling share_xen_page_with_guest() after that 
allocation as share_xen_page_with_guest() isn't implemented at the moment?

Thanks.

~ Oleksii

