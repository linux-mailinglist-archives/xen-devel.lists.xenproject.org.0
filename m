Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEMxEFPjzWlVigYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 05:32:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A533832DD
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 05:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271020.1559366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w88mP-0004qE-22; Thu, 02 Apr 2026 03:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271020.1559366; Thu, 02 Apr 2026 03:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w88mO-0004oK-VN; Thu, 02 Apr 2026 03:31:36 +0000
Received: by outflank-mailman (input) for mailman id 1271020;
 Thu, 02 Apr 2026 03:31:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1w88mN-0004oE-4e
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 03:31:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w88mM-005aBa-1q;
 Thu, 02 Apr 2026 03:31:34 +0000
Received: from [2001:268:9abd:66c7:b99f:63d7:98fa:3237]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w88mL-00ERXg-0f;
 Thu, 02 Apr 2026 03:31:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=txgbhLlqWf03T/qCGMgtK8VOthSG10CY10iyPb0O4Os=; b=c6pfJbXuGOBqlEzcfUAT1H9FK0
	knpzRG85M1sVJFuPX5C8tnf3vAlWv+HiPsBIZHTTPNun5piUfFEekjWaEOFSRrxMD3QmUexDKm5uq
	GZ6GCxV6FMtqCGiD85uOgG+Q6w93OHUttLnNMNtL0YNqDP9WBhyFqlSJ8gMfxdX8w1Hg=;
Message-ID: <97c56309-1bbf-471b-88c4-d13af3867f95@xen.org>
Date: Thu, 2 Apr 2026 12:31:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] make ioremap_wc() x86 only (for the time being)
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
 <3bf90b33-c028-4f45-bda0-9d1bd5386c02@gmail.com>
 <6fa82fcc-d21d-476d-b020-fc40a645a74c@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6fa82fcc-d21d-476d-b020-fc40a645a74c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86A533832DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksii,

On 30/03/2026 15:24, Oleksii Kurochko wrote:
> 
> 
> On 3/30/26 4:22 PM, Oleksii Kurochko wrote:
>>
>>
>> On 2/19/26 4:53 PM, Jan Beulich wrote:
>>> Its use in domain building is questionable: Already at the point both 
>>> uses
>>> were introduced, ioremap_cache() existed. I can't see why kernel and
>>> initrd would need mapping WC, when at the same time other similar 
>>> mappings
>>> (in common/device-tree/) are done WB.
>>>
>>> With those uses replaced, neither Arm nor RISC-V have a need for the
>>> function anymore.
>>>
>>
>> It is okay for RISC-V, but for Arm, IIRC, likely it was done because 
>> guest might start with cache disabled and PAGE_HYPERVISOR_WC on Arm 
>> uses "Normal Non-cacheable" what could lead to that guest won't see 
>> some part of kernel and/or initrd as it could be in a cache and won't 
>> be flushed to RAM.
>>
>> But probably I misremembered something and 
>> clean_and_invalidate_dcache_va_range() or something similar should be 
>> called before guest is laucned.
> 
> okay, so for this case copy_to_guest_phys_flush_dcache() is called after 
> initrd and kernel are loaded.

Looking at the code, we are using ioremap_wc() on the source side rather 
than the destination. So the use of copy_to_guest_phys_flush_cache() 
would not matter as this only applies to the destination.

Regarding the source side, the cache only guarantees coherency when either:
   * the memory attributes are similar between the component that loaded 
it (most likely the firmware) and Xen
   * The component that loaded it issued a cache flush

I saw Jan mentioned that other part of the device-tree code are using 
ioremap_cache(). They were adding afterwards and I can't remember why we 
consisder it was ok. For older mapping we would be switching from a 
non-cacheable mapping (HYPERVISOR_WC) to a cacheable one (HYPERVISOR).

While I agree we should have some consistency in the mappings, I am a 
bit unease to change the attributes without any written details on why 
there will not be any impact. Can you share more details?

I would also be ok if we decide to keep ioremap_wc() for arm as well.

Cheers,

-- 
Julien Grall


