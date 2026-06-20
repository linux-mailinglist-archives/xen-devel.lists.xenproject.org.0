Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wJooIoeENmpFAwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 14:16:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160516A8E0B
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 14:16:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=0N4393BW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1342864.1602739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waubp-0001xc-Fa; Sat, 20 Jun 2026 12:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342864.1602739; Sat, 20 Jun 2026 12:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waubp-0001uw-Cc; Sat, 20 Jun 2026 12:15:37 +0000
Received: by outflank-mailman (input) for mailman id 1342864;
 Sat, 20 Jun 2026 12:15:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1waubn-0001uq-Ui
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 12:15:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1waubn-001JyN-1z;
 Sat, 20 Jun 2026 12:15:35 +0000
Received: from [2a02:8012:3a1:0:adbb:f4c5:7acb:2fe1]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1waubm-002q6E-25;
 Sat, 20 Jun 2026 12:15:35 +0000
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
	bh=hsWHvSfyddms40QNTsmrJkiqj2Lld7TRF00jLuj3yH8=; b=0N4393BWah8JBxJAy7hUn3AbJp
	9bmJ6oQ6dlySK/57uvWQjB/fDhTxhmew0/4oZwFtT3lRryye0+g2A6N3cuxzC3xjIxHClVIR4iLo9
	/1wGH9o3AlwhjfTQxWo79/3LWCyijSViloH1Z4DS2y0cyrT3iu/sk72NgmM5oAmNMm70=;
Message-ID: <e981d724-dfc8-4c09-bcf7-0e8a4ed4279e@xen.org>
Date: Sat, 20 Jun 2026 13:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/psci: Handle PSCI_ALREADY_ON and PSCI_ON_PENDING as
 non-fatal
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <337edab445a38b523f4f793b01d960994b834d01.1781955326.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <337edab445a38b523f4f793b01d960994b834d01.1781955326.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid,xen.org:from_mime];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 160516A8E0B

Hi Dmytro,

On 20/06/2026 12:38, Dmytro Prokopchuk1 wrote:
> When bringing up a secondary CPU, call_psci_cpu_on() returns the PSCI
> result codes back to arch_cpu_up(). If the physical CPU is already powered
> on (PSCI_ALREADY_ON) or is powering on (PSCI_ON_PENDING), these negative
> codes are treated as fatal errors. This causes Xen to fail the CPU bring-up.

 From my understanding of PSCI CPU_ON, if either ON_PENDING or 
ALREADY_ON is returned then it means the parameters we passed for the 
secondary CPU will not be taken into account.

So always returning PSCI_SUCCESS for the two errors feels wrong. For 
instance, I would expect that the first call to PSCI CPU_ON for a given 
CPU is not meant to return ALREADY_ON/ON_PENDING. It might be fine for 
follow-up call, but such decision should be taken by the function that 
call PSCI CPU_ON multiple time on the same CPU.

I had a brief look at the call stack and I wasn't able to find any loop. 
Can you point me to one?

Cheers,

-- 
Julien Grall


