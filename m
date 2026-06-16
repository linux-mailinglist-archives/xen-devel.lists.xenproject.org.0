Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xk1gEVmtMWoLpAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 22:08:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB96695114
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 22:08:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=2XPKEdUF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1339631.1600834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZa5V-0008HJ-1z; Tue, 16 Jun 2026 20:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339631.1600834; Tue, 16 Jun 2026 20:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZa5U-0008Fe-VQ; Tue, 16 Jun 2026 20:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1339631;
 Tue, 16 Jun 2026 20:08:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wZa5T-0008FY-3m
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 20:08:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZa5S-00CmqW-3B;
 Tue, 16 Jun 2026 20:08:42 +0000
Received: from [2a02:8012:3a1:0:adbb:f4c5:7acb:2fe1]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZa5S-00FiTY-0Q;
 Tue, 16 Jun 2026 20:08:42 +0000
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
	bh=/5DcLrw5CPiPKYC02EBhMGKYmAng3/TlgnzmnutznYI=; b=2XPKEdUF+TiBSEpJdvsYxjmShf
	aO59RRFa0ET05HaFZPzgiyMG7rpqq71qYgJA0gCvDZ2hGItJSOLQH0unDu0InSpYXDl7u4qYj0HOP
	EqX7PfPH5vct00K2ubyqGKQeRJNH94zfemtudaooSUKbyNi8qzsp3B+tunDIX1nrvHBo=;
Message-ID: <6e2d0f83-fcb2-41b4-b04f-99c2d3fefcae@xen.org>
Date: Tue, 16 Jun 2026 21:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid,xen.org:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDB96695114

Hi Milan,

On 23/03/2026 22:51, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Xen SMMUv3 driver only supports stage-2 translation. Add support for
> Stage-1 translation that is required to support nested stage
> translation.
> 
> In true nested mode, both s1_cfg and s2_cfg will coexist.
> Let's remove the union. When nested stage translation is setup, both
> s1_cfg and s2_cfg are valid.

I am not entirely sure where to comment. Looking at Linux [1], it seems 
some SMMU variant have errata for the nesting mode. Should we at least 
prevent nested on both variant for now?

Cheers,

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0bfbfc526c70606bf0fad302e4821087cbecfaf4

-- 
Julien Grall


