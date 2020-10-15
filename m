Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DB28EECA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 10:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7155.18770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyxl-0004hR-De; Thu, 15 Oct 2020 08:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7155.18770; Thu, 15 Oct 2020 08:50:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSyxl-0004h4-AZ; Thu, 15 Oct 2020 08:50:17 +0000
Received: by outflank-mailman (input) for mailman id 7155;
 Thu, 15 Oct 2020 08:50:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSyxj-0004gz-M8
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:50:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01d4bdac-761c-43fa-9521-c41563827ea7;
 Thu, 15 Oct 2020 08:50:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3CCAAEC3;
 Thu, 15 Oct 2020 08:50:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSyxj-0004gz-M8
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:50:15 +0000
X-Inumbo-ID: 01d4bdac-761c-43fa-9521-c41563827ea7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 01d4bdac-761c-43fa-9521-c41563827ea7;
	Thu, 15 Oct 2020 08:50:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602751814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JudKjNd3McfcqlmDvRYCEhEs7qtdjVptmBZId3MhdSU=;
	b=MXlQQedM4M7GbsDmMmefpR3L3jY1JzLqUpj1UrAFuwu7jvtzQpmBiR2PDgzPuROj7p9wvX
	oo43ZWy6mYyCaoEONcCXb+4Ouu6Sya1FMwtoFWgDwzJXYKfPxrrncKuaN1F/xPNo5rpiPM
	WfPPCch0y5NLi4QZ5NsWDYn8GR//Fvk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F3CCAAEC3;
	Thu, 15 Oct 2020 08:50:13 +0000 (UTC)
Subject: Re: [PATCH v2] x86/smpboot: Don't unconditionally call
 memguard_guard_stack() in cpu_smpboot_alloc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201014184708.17758-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ed412d9-c9a2-194b-c953-c74ee102664f@suse.com>
Date: Thu, 15 Oct 2020 10:50:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201014184708.17758-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.10.2020 20:47, Andrew Cooper wrote:
> cpu_smpboot_alloc() is designed to be idempotent with respect to partially
> initialised state.  This occurs for S3 and CPU parking, where enough state to
> handle NMIs/#MCs needs to remain valid for the entire lifetime of Xen, even
> when we otherwise want to offline the CPU.
> 
> For simplicity between various configuration, Xen always uses shadow stack
> mappings (Read-only + Dirty) for the guard page, irrespective of whether
> CET-SS is enabled.
> 
> Unfortunately, the CET-SS changes in memguard_guard_stack() broke idempotency
> by first writing out the supervisor shadow stack tokens with plain writes,
> then changing the mapping to being read-only.
> 
> This ordering is strictly necessary to configure the BSP, which cannot have
> the supervisor tokens be written with WRSS.
> 
> Instead of calling memguard_guard_stack() unconditionally, call it only when
> actually allocating a new stack.  Xenheap allocates are guaranteed to be
> writeable, and the net result is idempotency WRT configuring stack_base[].
> 
> Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> This can more easily be demonstrated with CPU hotplug than S3, and the absence
> of bug reports goes to show how rarely hotplug is used.
> 
> v2:
>  * Don't break S3/CPU parking in combination with CET-SS.  v1 would, for S3,
>    turn the BSP shadow stack into regular mappings, and #DF as soon as the TLB
>    shootdown completes.

The code change looks correct to me, but since I don't understand
this part I'm afraid I may be overlooking something. I understand
the "turn the BSP shadow stack into regular mappings" relates to
cpu_smpboot_free()'s call to memguard_unguard_stack(), but I
didn't think we come through cpu_smpboot_free() for the BSP upon
entering or leaving S3.

Jan

