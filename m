Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WFINEWuPT2rFjgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:09:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE3730D4F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 14:09:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=5Q2XSakN;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358082.1612366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnYu-0005E6-N1; Thu, 09 Jul 2026 12:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358082.1612366; Thu, 09 Jul 2026 12:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnYu-0005C3-KG; Thu, 09 Jul 2026 12:09:04 +0000
Received: by outflank-mailman (input) for mailman id 1358082;
 Thu, 09 Jul 2026 12:09:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1whnYt-0005Ak-Qz
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:09:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1whnYt-00FEmR-1p;
 Thu, 09 Jul 2026 12:09:03 +0000
Received: from [2a02:8012:3a1:0:7438:4a3b:9824:694a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1whnYs-00Dkp2-2r;
 Thu, 09 Jul 2026 12:09:03 +0000
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
	bh=ylv4udXSK5b8LKBWu7hWDBxDdgFHBmX8eRgVQ1ehtwY=; b=5Q2XSakNKE1i+oevOAmTh6U9HB
	5dmlDReWKb4149YhWUJQoO69haWNELTMvgeMzVDajXtdTW7TXN1joLCW3QyDrgzw2+RlDAdXvDRWs
	WUojMDAeAzL64eIsD0p07q34lASoU/c5SnhzQfRaaNDLOKmPOu0O5EHqOYVZ2UOp/e9k=;
Message-ID: <e540b651-f9dd-434f-bcb1-11f5198d1267@xen.org>
Date: Thu, 9 Jul 2026 13:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding Locking in the MMIO Handling Framework on Arm
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <89509e85-3345-41f8-a6dd-5dc4ba3619ac@gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <89509e85-3345-41f8-a6dd-5dc4ba3619ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:from_mime,xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:Michal.Orzel@amd.com,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BBE3730D4F

Hi Oleksii,

Thanks for the report.

On 09/07/2026 11:49, Oleksii Kurochko wrote:
> I have a question regarding the locking in the MMIO handling framework 
> on Arm.
> 
> Is it sufficient to have read_lock() only in find_mmio_handler()? If
> register_mmio_handler() is executed in parallel with find_mmio_handler() 
> (which I assume was the reason for introducing the rwlock), aren't we 
> still exposed to a race condition?

When the read-write lock was introduced, we didn't sort the entries. So 
it was fine at the time. This bug was introduced by commit 8047e090f4 
("xen/arm: io: Use binary search for mmio handler lookup").

With this change, then we...

> 
> find_mmio_handler() returns a pointer to a handler, but the object it 
> points to could be changed by a subsequent call to register_mmio_handler().
> If register_mmio_handler() runs between find_mmio_handler() and 
> handle_{write,read}(), we could end up operating on a different handler 
> than the one that was originally found.
> 
> In other words, shouldn't we acquire the read_lock() in 
> try_handle_mmio() and keep it held for the entire duration of 
> try_handle_mmio()?

... either need to keep the lock for longer or rework the code to 
allocate the handler structure.

> 
> It seems this is not an issue at the moment because 
> register_mmio_handler() is only called during domain creation. If that's 
> the case, do we really need the rwlock at all?

If you are removing the lock, you will build an assumption that 
register_mmio_handler() can only be called only at domain creation.

We would want to add a check in the code to catch any misuse.

> 
> One more thing: it looks like
>    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
> in register_mmio_handler() would be better placed inside the 
> write_lock() section. As again in the case if register_mmio_handler() 
> will start to be called in parallel we will have an issue.

Indeed.

-- 
Julien Grall


