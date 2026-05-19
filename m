Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALQ1B9AZDGrrVwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:05:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63A579A68
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312554.1582645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFS0-0005aH-EE; Tue, 19 May 2026 08:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312554.1582645; Tue, 19 May 2026 08:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFS0-0005Ye-BG; Tue, 19 May 2026 08:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1312554;
 Tue, 19 May 2026 08:05:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wPFRz-0005YY-1D
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:05:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFRy-00D4zz-23;
 Tue, 19 May 2026 08:05:14 +0000
Received: from [2a02:8012:3a1:0:f5d8:254d:983d:8dea]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wPFRy-00DjE2-1C;
 Tue, 19 May 2026 08:05:14 +0000
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
	bh=ADc5/F5SW02jKw3O+12IEV33qq97n+QupUWW2H0ph9U=; b=gOBtdpJ/AvfWP0NgQomiE146a7
	gSDF9DTtww/Gxad4YmdfymFRKOVQf8WXascrfGZTx3tBTY6RCIUSspBoKR7JXJ+ad0X6CAOkG1Tr+
	QTCckLnBLfUxVZeUjGD3jCkDzQBoWpLask3YpY9f0mDxdMDW04MeK0Kk2B6T7hESWCag=;
Message-ID: <3783f629-c658-4f04-a1c0-f1429b84726e@xen.org>
Date: Tue, 19 May 2026 09:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: Fix PT_PT table descriptor value and comment
Content-Language: en-GB
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <b0a7dbdf-775a-45e2-bee4-d234ca21c002@amd.com>
 <20260518210340.81347-1-gabi.qs.mail@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260518210340.81347-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gabi.qs.mail@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,xen.org:email,xen.org:mid,xen.org:dkim];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF63A579A68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Gabriel,

For the future, when sending a new version, please create a new thread 
rather than in reply to the latest response.

On 18/05/2026 22:00, Gabriel Quintáns Souto wrote:
> Per ARMv7-A/ARMv8-A ARM, bits [11:2] of table descriptors are
> ignored by hardware. The original comment incorrectly described
> block/page descriptor fields which are not present in table
> descriptors.

Do you have more details why this change? Is this to strictly follow the 
Arm Arm?

In the ideal situation we should have the page table descriptors 
consistent between the assembly and the C version (see 
mfn_to_xen_entry()). They were diverging before and this is still 
diverging. If we are concerned about setting AF here, then we ought to 
modify the C versions as well.

It could be done separately though.

> 
> Use the minimal valid encoding for table descriptors by setting
> PT_PT to 0x3.
> 
> This updates both arm32 and arm64 for consistency.
 > > Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>

Reviewed-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


