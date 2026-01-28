Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBWaKtiEemnx7AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 22:51:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52920A93DA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 22:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215984.1525998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDQU-00087v-VN; Wed, 28 Jan 2026 21:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215984.1525998; Wed, 28 Jan 2026 21:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDQU-00085p-SI; Wed, 28 Jan 2026 21:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1215984;
 Wed, 28 Jan 2026 21:50:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vlDQU-00085j-F6
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 21:50:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vlDQP-0084hH-2i;
 Wed, 28 Jan 2026 21:50:09 +0000
Received: from [2a02:8012:3a1:0:2517:2769:8ea2:3b28]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vlDQP-006SEr-0s;
 Wed, 28 Jan 2026 21:50:09 +0000
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
	bh=Bsk0ZDM69YZO3I61sWSAnNnyY/rgvcUD62fIs1uKveE=; b=rlIJYf4AJQQXrzRL4wEkvppdvZ
	8yqp3h+5rR3OKgc0JFrlJc9U8MIJ1F3+lP4SQjFpGemPoKSwJU5/rVxhWanUbgQ++Y7qUkEFPUbL/
	3wYCPYcsZeiVDHGDE0qih/PWkDNey5Rx9xfNYRy05N3bR1vPPRokEwjxPP5SZ2uksf/M=;
Message-ID: <afac8ebf-71cb-411b-b821-72d82b24ef7f@xen.org>
Date: Wed, 28 Jan 2026 21:50:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
 <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2FA52A4C-98F2-4066-8BE7-36F37093FCD6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:jens.wiklander@linaro.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52920A93DA
X-Rspamd-Action: no action

Hi Bertrand,

On 08/01/2026 07:59, Bertrand Marquis wrote:
> Gentle ping: This serie has been fully reviewed by Jens and would need a maintainer ack or review.

As we discussed during the last Arm maintainer call, as you maintain TEE 
with Volodymyr, you technically only need a reviewed-by from someone 
from the community with suitable stature to review.

I think in this case, you meet all the requirements with Jen's acked-by. 
So I will commit the series as-is.

Cheers,

-- 
Julien Grall


