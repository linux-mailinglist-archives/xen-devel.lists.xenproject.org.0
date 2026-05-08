Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GdOGlvK/WkpigAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 13:34:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7FE4F5D0F
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 13:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303525.1576877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLJTd-0007HQ-DG; Fri, 08 May 2026 11:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303525.1576877; Fri, 08 May 2026 11:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLJTd-0007Fe-AG; Fri, 08 May 2026 11:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1303525;
 Fri, 08 May 2026 11:34:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wLJTb-0007FY-AT
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:34:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLJTa-006zPi-Ni
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 13:34:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fdca43-e002-0a2a0a5209dd-0a2a4501b148-18
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:34:38 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fdca4d-c1f2-0a2a45010019-d98c6eacba5e-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:34:38 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D79FB1BCA;
 Fri,  8 May 2026 04:34:31 -0700 (PDT)
Received: from [10.57.35.71] (unknown [10.57.35.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03E453F836;
 Fri,  8 May 2026 04:34:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778240077; bh=jpZIElX28Dxn2BuY+beEs3GW5syLtcYHN+XpcMGjiFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qWY/h57NvsKI49wz5DLKCCIr5xt/2ZZ45prTKDk+k2p1b/f0g3KzD2HptIGsv57/7
	 Cn8Q+/nIpPWjY6vPElWyfJxqykz/kSw45oYJP1XQ+5x5kNRCq3/CshZUowk9OAEXpt
	 jz9cOa/8qtz+tVpsMrRjfOVZKv2x0bUlnB7OZt4Y=
Message-ID: <265c0534-b480-4ab8-8f8a-2b5b8e7ca591@arm.com>
Date: Fri, 8 May 2026 13:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
 <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
 <15645d19-f19d-4955-8315-0188aa834eb6@suse.com>
 <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>
 <be5b5e70-a61e-4803-9f40-873ce5381328@suse.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <be5b5e70-a61e-4803-9f40-873ce5381328@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778240078-AF555FF4-16C3EFE4/0/0
X-purgate-type: clean
X-purgate-size: 1025
X-Rspamd-Queue-Id: DC7FE4F5D0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08/05/2026 12:09, Jürgen Groß wrote:
>
> OTOH I don't like the multiple conditions used for testing
> (state->enable_count,
> TIF_LAZY_MMU_UPDATES, xen_lazy_mode).
>
> Another variant would be to just let the Xen specific code tolerate
> the double
> calls by disabling preemption in the Xen code and checking via
> __task_lazy_mmu_mode_active() if anything needs to be done.
>
> I'd really like to get rid of xen_lazy_mode completely.

That certainly crossed my mind, but I didn't feel qualified to perform
that kind of surgery, especially considering XEN_LAZY_CPU. There is
presumably a good reason to track this one via a percpu variable, but
for the MMU side it feels like this creates more problems than it
solves. Maybe it is possible to keep XEN_LAZY_CPU untouched while
removing XEN_LAZY_MMU and using is_lazy_mmu_mode_active() instead? If we
do that, I don't think preemption is a concern - the lazy MMU mode is
only relevant for current and cannot be used in interrupt context.

- Kevin

