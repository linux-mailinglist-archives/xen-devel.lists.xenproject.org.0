Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNxvJZwPj2mCHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:48:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2F135D6C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230765.1536205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrer-0002Xp-SD; Fri, 13 Feb 2026 11:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230765.1536205; Fri, 13 Feb 2026 11:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrer-0002V7-Oj; Fri, 13 Feb 2026 11:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1230765;
 Fri, 13 Feb 2026 11:48:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vqreq-0002V1-Qi
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:48:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vqrep-006r4V-1o;
 Fri, 13 Feb 2026 11:48:23 +0000
Received: from [2a02:8012:3a1:0:814a:c088:bfd9:f253]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vqreo-006NAc-2v;
 Fri, 13 Feb 2026 11:48:23 +0000
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
	bh=FzhMcz+QfvkeLTlxa3QpaNoFVRo32qneeHKlY6RVnis=; b=BQ1pjIO5L9AAB58u+YaGOpbUwS
	KyV4i2UBoe8TxS+YX1zlGxUJa7byNZy3fOJamVkg+O+alMvzRsnsQGFeApj/LD7NJwez49QQSASmR
	GPXhMfLrMxufvnGft2y3vMi9G/fd5/geRiWZXhKhZsou+WctvIgfLtUIyFJbBHuEAtEY=;
Message-ID: <c339b2a9-5d22-457c-8b32-a0b01eee3cec@xen.org>
Date: Fri, 13 Feb 2026 11:48:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
 <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
 <CAGeoDV_bN812-qKJwTxNpJ6Ewz1jcBM8nLYc9D+OjqbuAAkEHg@mail.gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV_bN812-qKJwTxNpJ6Ewz1jcBM8nLYc9D+OjqbuAAkEHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:Bertrand.Marquis@arm.com,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,arm.com];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30D2F135D6C
X-Rspamd-Action: no action

Hi Mykola,

On 13/02/2026 11:36, Mykola Kvach wrote:
> For this reason it may be worth conditionally recommending (or even
> auto-selecting) `vwfi=native` when direct injection is enabled for a
> vCPU, so measurements reflect the actual delivery fast-path rather than
> exit/scheduling overhead.

I don't think this is a straightforward answer. "vwfi=native" is 
beneficial when you have a single vCPU scheduled per pCPU. But if you 
have multiple vCPUs running, then you may impair the overall performance 
of the system as the scheduler will not be able to run another vCPU even 
if the current vCPU is doing nothing (it is waiting for an interrupt).

As a data point, Xen didn't initially trapped WFI/WFE. But we noticed a 
lot of slow down during boot if all the vCPUs for a guest were running 
on the same pCPU. The difference was quite noticeable.

So instead of recommending to always set "vwfi=native", I would consider 
an approach where Xen decides whether WFI/WFE is trapped based on the 
number of vCPUs that can be scheduled on a given pCPU. This could be 
adjusted on demand.

Cheers,

-- 
Julien Grall


