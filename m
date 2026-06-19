Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d5ysKhimNWo72QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 22:27:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A26A7A11
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 22:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=fPjKIPcu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1342648.1602685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wafmv-0008Ju-9O; Fri, 19 Jun 2026 20:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342648.1602685; Fri, 19 Jun 2026 20:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wafmv-0008He-6W; Fri, 19 Jun 2026 20:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1342648;
 Fri, 19 Jun 2026 20:26:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wafmt-0008H5-4D
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 20:26:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wafms-00HUf0-2s;
 Fri, 19 Jun 2026 20:26:02 +0000
Received: from [2a02:8012:3a1:0:28f2:e98a:6c7b:919d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wafms-009my8-0O;
 Fri, 19 Jun 2026 20:26:02 +0000
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
	bh=Ukqhh+lrSM2voUnjpMrqehJp7xq3sDNSuljTdOfqT/E=; b=fPjKIPcuWOHB0iAWiYitVNsGC1
	S3UCyk5p3k8UkbESqScDssUy2DilHTtmSJGci6muf3rvUtOr15gCXxLsCMr8baTHtAMmIskGxvGKV
	J21+I3RwiFlNgsCpnQ6JjCx0dh1yeZZT+UAlD/qgJpX/bZnPLqwnmbVN87kjDTwO74LA=;
Message-ID: <3c6fe373-8840-4943-abaf-7e7ed13870e2@xen.org>
Date: Fri, 19 Jun 2026 21:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] xen/arm: mask debug exceptions in initial
 AArch64 guest state
Content-Language: en-GB
To: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <74e132a5f3dff64be5bd0c04eb82fe78d9c2fe84.1781892316.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <74e132a5f3dff64be5bd0c04eb82fe78d9c2fe84.1781892316.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,amd.com,epam.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,xen.org:dkim,xen.org:email,xen.org:mid,xen.org:from_mime];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 429A26A7A11

Hi Mykola,

On 19/06/2026 19:37, Mykola Kvach wrote:
> PSR_GUEST64_INIT currently masks SError, IRQ and FIQ, but leaves debug
> exceptions unmasked. Both the AArch64 Linux boot protocol and PSCI entry
> requirements expect PSTATE.DAIF to be masked.
> 
> Add PSR_DBG_MASK to PSR_GUEST64_INIT. This fixes the initial AArch64 guest
> entry state as well as virtual PSCI CPU_ON and SYSTEM_SUSPEND resume entry.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Julien Grall <julien@xen.org>

Regarding Xen 4.22, I understand and agree this is technically against 
the specification. However, AFAIR, we don't expose debug registers to 
the guest. So there should be no impact.

The slight risk with this patch is OS that may have started to rely on 
Xen behavior (hopefully not here, but I know we had a couple of cases 
with the timer for instance...).

This has been present forever. So unless there is a real issue, I am 
tempted to suggest to wait until the release is out and backport after.

I will leave Oleksii the final decision.

Cheers,

-- 
Julien Grall


