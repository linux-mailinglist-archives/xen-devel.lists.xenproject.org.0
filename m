Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF0RLhHYzWmOiQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 04:44:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C2382CC4
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 04:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270990.1559356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w882a-0006mf-JL; Thu, 02 Apr 2026 02:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270990.1559356; Thu, 02 Apr 2026 02:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w882a-0006ls-G3; Thu, 02 Apr 2026 02:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1270990;
 Thu, 02 Apr 2026 02:44:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1w882Z-0006lm-EJ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 02:44:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w882Z-005ZI7-0U;
 Thu, 02 Apr 2026 02:44:14 +0000
Received: from [2001:268:9abd:66c7:b99f:63d7:98fa:3237]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w882Y-00EPXS-2a;
 Thu, 02 Apr 2026 02:44:14 +0000
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
	bh=z0GW4RDS24EFGZmnCHWhCEF0cYKZ1yETgAEawsy0IjE=; b=l6esDJ0iIVUXBCJie4xRO/JGQv
	MefY3xQ6aYMCaAI7uVJZTi8MIxM9oX+OkZUX2Kh7lAhF3SabeqgrnCjA1wP4DCvnT5d8T3y/2JhV3
	Lk4daPDv71Ju4TrH0MeIAivaDexQSAONWXOwTJlhmM4XCVXlbS52vx1RO97LKbuZXC5o=;
Message-ID: <e21642ec-ad45-4a61-8482-768ee666f438@xen.org>
Date: Thu, 2 Apr 2026 11:44:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h to
 arch header
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
 <20260401145816.169557-4-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260401145816.169557-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 340C2382CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

On 01/04/2026 15:58, Michal Orzel wrote:
> Move domain_vpci_init() and domain_vpci_get_num_mmio_handlers()
> declarations from the private xen/arch/arm/vpci.h into the public
> xen/arch/arm/include/asm/vpci.h, and remove the now redundant
> private header.

Can you provide a brief explanation why we don't couldn't include 
"vpci.h" from "arch/arm/vpci.c"? Such approach would ...

> 
> Update domain.c to include <asm/vpci.h> instead of the removed private
> header.
> 
> This ensures the declarations are visible where the functions are
> defined, resolving a MISRA C Rule 8.4 violation.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> I'm moving a file with GPL2+ license to a file with GPL2-only. I consider this
> ok in this case becase the copyright on a file with just prototypes does not
> make any sense and a license text was most likely blindly copy-pasted like for
> most of the files in that era.

... avoid the licensing discussion. I am in the opinion that it is ok to 
move from GPLv2+ to GPLv2 because the license says "either version 2 of 
the License, or (at your option) any later version". But I remember not 
everyone agrees on this interpretation and we never solved the 
discussion on whether we need to request permission from the original 
copyright holder.

Alternatively, I see this file was only modified by two companies (EPAM 
and Arm). I see one employee of each company are already CCed. So you 
could confirm with them if the change is fine.

Cheers,

-- 
Julien Grall


