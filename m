Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mrctF6uc3WlxggkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 03:47:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39FB3F4D52
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 03:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281385.1564296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCSrY-0003mO-Fp; Tue, 14 Apr 2026 01:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281385.1564296; Tue, 14 Apr 2026 01:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCSrY-0003jt-D1; Tue, 14 Apr 2026 01:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1281385;
 Tue, 14 Apr 2026 01:46:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCSrX-0003jn-8K
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 01:46:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCSrV-001QkU-2P;
 Tue, 14 Apr 2026 01:46:45 +0000
Received: from [116.84.110.196] (helo=[10.158.125.74])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCSrV-001UUQ-14;
 Tue, 14 Apr 2026 01:46:45 +0000
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
	bh=hn/ObxAnxTNEf0U8zXIaExFL3p9yj5z4expNS+0guuA=; b=Tr375Fbn7RH6XLG3nob3qGod/x
	LHEXzMiWx6iB50ckfTXVdif9fO89Fape8rmqBhrtdd19r8nHa9c8UAvsQ6YFcBVUfIDSoweQ3CvL5
	QCeaLUvFiYXykgn0lvzIRgqMSijq4MC2EbW1DZEwcY3EGlqGMK/JCjKL2wVK0P6k/yx4=;
Message-ID: <cfe8b6ae-2f52-47c4-862d-52d648d41895@xen.org>
Date: Tue, 14 Apr 2026 10:46:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/common: validate shared memory guest address
 overlap with guest RAM
Content-Language: en-GB
To: Joan Bae <joan.bae@boeing.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[xen.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joan.bae@boeing.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B39FB3F4D52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Joan,

Thank you for the patch.

On 14/04/2026 09:59, Joan Bae wrote:
> Currently, process_shm() does not check whether the guest physical
> address of a shared memory region overlaps with the domain's allocated RAM banks.
> Neither process_shm() nor p2m_set_entry() checks for existing
> mappings, so the RAM mapping is silently overwritten if a user
> specifies a guest physical address that falls within the guest RAM
> range. Since construct_domain() loads the kernel after process_shm(),
> the kernel can end up in shared memory pages. This can cause:
> - Another domain corrupting the kernel via shared memory write
> - Silent guest crash with no error message from Xen

This seems to be solving one specific issue (RAM clashing with shared 
memory) but I believe this could also happen with other kind of mappings 
because, as you said, p2m_set_entry() doesn't check any overlap.

So I would rather prefer if we solve the problem once and for all. This 
would mean modifying p2m_set_entry() (or one of its top caller). 
Although, we would need to be careful to not break memory hypercalls 
which may rely on overwriting existing mappings.

Cheers,

-- 
Julien Grall


