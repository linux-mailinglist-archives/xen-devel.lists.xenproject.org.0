Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG7dNKyWmWkKVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 21 Feb 2026 12:27:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21D16CC3D
	for <lists+xen-devel@lfdr.de>; Sat, 21 Feb 2026 12:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237900.1540032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtl88-0001vq-Nx; Sat, 21 Feb 2026 11:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237900.1540032; Sat, 21 Feb 2026 11:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtl88-0001tW-Kw; Sat, 21 Feb 2026 11:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1237900;
 Sat, 21 Feb 2026 11:26:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vtl87-0001tQ-12
 for xen-devel@lists.xenproject.org; Sat, 21 Feb 2026 11:26:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vtl7z-002iys-2J;
 Sat, 21 Feb 2026 11:26:27 +0000
Received: from [2a02:8012:3a1:0:31fa:1b47:3c78:2265]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vtl7z-00HZkC-1B;
 Sat, 21 Feb 2026 11:26:27 +0000
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
	bh=Ie+2jC+rcU0p3EKMOSfhN+nSJwx8/0eWPZeDhh1gTO0=; b=QJTAA4iFp/lXJGfm4nzb5j4xN+
	mjryiKDlV6dqzGOAigvHkMZxLryq0Tz3sSNLuwPngvRhpouZjqEXRP7pPhlU5ByO6BXIElMC7dIo/
	csp+TXAH6zyM3eG9206IUI5OYAIlayYsTit/dR+wZgvlCxFTqIiFQvcD3gZU2Yp0Dpd0=;
Message-ID: <8e5e351d-47fe-4a68-a611-df72e3c5f246@xen.org>
Date: Sat, 21 Feb 2026 11:26:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tighten translate_get_page()
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
 <abd54c11-28fc-4487-a2f8-733007d361ae@amd.com>
 <9163d0b9-f77e-4c13-b986-2d890bdf8ccd@suse.com>
 <526d338e-8648-4f90-8006-35c639bfa6bd@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <526d338e-8648-4f90-8006-35c639bfa6bd@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,epam.com,arm.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[xen.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A21D16CC3D
X-Rspamd-Action: no action

Hi Michal,

On 18/02/2026 08:36, Orzel, Michal wrote:
>> But that's not correct for cases where share_xen_page_with_privileged_guest()
>> is passed SHARE_ro. XENMAPSPACE_gmfn_foreign requests have to result in r/o
>> mappings in that case.
> Yes. Therefore, on Arm:
> - p2m_ram_ro is never stored in P2M tables for normal domains

p2m_set_permission() is able to deal with p2m_ram_ro. So this could in 
theory happen.

> - it's only used by get_page_from_gfn() for DOMID_XEN pages
> - it's used as a signal to install p2m_map_foreign_ro mappings
> 
> The code should stay as is then and we could modify the comment to say:
 > /* Read-only RAM; only used for DOMID_XEN */

With what I wrote above, I don't think we should add such comment.

Cheers,

-- 
Julien Grall


