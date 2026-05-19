Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNjKBpgVDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:47:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1D579629
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312512.1582608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFAi-0000Ax-Pr; Tue, 19 May 2026 07:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312512.1582608; Tue, 19 May 2026 07:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFAi-000080-NB; Tue, 19 May 2026 07:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1312512;
 Tue, 19 May 2026 07:47:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wPFAi-00007s-0D
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:47:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFAe-00D46j-0p;
 Tue, 19 May 2026 07:47:20 +0000
Received: from [2a02:8012:3a1:0:f5d8:254d:983d:8dea]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFAd-00DiS6-32;
 Tue, 19 May 2026 07:47:20 +0000
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
	bh=yh1h2dw5VVpYebt6+Cbjk9VKND33+605S00u7+5X/Yk=; b=xK+9RhjC70r6phNB9wMTq1ySb3
	yrfEchn6VpxutqrgK2fFGFBDPRlZRZuOXGvR5Iu6H4imMBCG1P3acDiWLX4XdKptmb+q9TUk8XQE4
	Ll/ned0c2eFn40nhShmktAKY0rPrvM4hSrPh8p9LCpY2ZS8l8tab8M0MytzDhQnegHmk=;
Message-ID: <3d1001c8-6761-41ba-83df-42c83a453f3e@xen.org>
Date: Tue, 19 May 2026 08:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
 <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,xen.org:mid,xen.org:dkim,suse.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:edgar.iglesias@amd.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5F1D579629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Edgar and Jan,

On 19/05/2026 07:40, Jan Beulich wrote:
> On 19.05.2026 01:43, Edgar E. Iglesias wrote:
>> The generic Xen strrchr() implementation returns a pointer to the string
>> terminator when searching for '\0', matching the standard C semantics.
 >>>> The ARM64 assembly version stopped as soon as it loaded the 
terminator and
>> returned the previous match pointer instead.  This made strrchr("", '\0')
>> return NULL.
> 
> I wonder though: Why would one pass '\0' to strrchr()? If you want to find
> the end of a string, more efficient (at least in the general case) options
> exist (strchr(), memchr(), strlen()).

+1 I am interested to know the use-case for this change. Is this for 
compliance or real issue? If the latter, can we add some details.

It might also be worth to write a selftest to avoid any regression (in 
particular if we decide to diverge from Linux).

> 
>> Compare the loaded byte against the requested character before deciding
>> whether to stop at the terminator, so the terminator itself can be returned
>> when it is the requested character.
> 
> Nit: "..., so a pointer to the terminator ...".
> 
>> Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, the function having come from Linux, imo the patch wants to go to
> Linux (ideally first, but at the very least also).

We are trying to keep the core implementation in lib the same as linux 
(see arch/arm/README.LinuxPrimitives). I would prefer if this is also 
first committed to Linux and then backported.

Cheers,

-- 
Julien Grall


