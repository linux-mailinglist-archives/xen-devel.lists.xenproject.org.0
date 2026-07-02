Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fDIXL0KVRmp4ZAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:43:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639B16FA73A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:43:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Yaja7h2a;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1352223.1609098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfKVg-0004pX-T9; Thu, 02 Jul 2026 16:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352223.1609098; Thu, 02 Jul 2026 16:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfKVg-0004nI-QO; Thu, 02 Jul 2026 16:43:32 +0000
Received: by outflank-mailman (input) for mailman id 1352223;
 Thu, 02 Jul 2026 16:43:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wfKVg-0004nC-9l
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:43:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfKVe-007IVn-3g
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 18:43:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a469527-e002-0a2a0a5209dd-0a2a4506dca0-12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:43:30 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a469530-08de-0a2a45060019-aceafc1fc7b8-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:43:29 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CA008416F6;
 Thu,  2 Jul 2026 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1C81F00A3A;
 Thu,  2 Jul 2026 16:43:27 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783010607;
	bh=6PcFLEoyRJf8kxb2GS0a34t6Sr+st1IFRARKd9dpAAI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Yaja7h2ajlb9QYXmFh17BV3Z6ClPfSTvrHGPGerzwUxl0BUsJoAdLmpiPXhOKqj/a
	 fraFqB1Yh3B0eEn6W8iFq+CUSfXr+IPowxp8Lx+R9UEnfgonzQpCMMRYSI5XXQuOIz
	 3QGc46OXEtUfo+UXwis1ZKW94kUWkHCYWI80jnJEGTMKP4m4VoRF4C4cFRFO73hIjy
	 eVR1gcm01Qd2GkElP62O0ObjQEz5RBu6VRyMZAxoJl25gfbnHNFUdeJSo1Sdpltld+
	 o8XnfGK9kNTIUKPeUZ6Fa7TJO9+g3nNYK+EsiKyLFLCHjk78ISoYjbCfIUPcRxFRqu
	 c4iJfnhS5yl7A==
Date: Thu, 2 Jul 2026 09:43:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] argo: fall back maintainership into the rest
In-Reply-To: <20260702163845.36453-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2607020942550.992629@ubuntu-linux-20-04-desktop>
References: <20260702163845.36453-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1768402433-1783010586=:992629"
Content-ID: <alpine.DEB.2.22.394.2607020943070.992629@ubuntu-linux-20-04-desktop>
X-purgate-ID: tlsNG-16d1c6/1783010610-C513768D-6D1CAD3A/0/0
X-purgate-type: clean
X-purgate-size: 1423
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:email,citrix.com:email,ubuntu-linux-20-04-desktop:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 639B16FA73A

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1768402433-1783010586=:992629
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2607020943071.992629@ubuntu-linux-20-04-desktop>

On Thu, 2 Jul 2026, Roger Pau Monne wrote:
> Due to unresponsiveness of the current maintainer.  In particular, the
> committers have been trying to get in touch with Christopher for 2 weeks to
> have a chat about disputes around recent commits and pending changes to the
> ARGO component without getting any response.
> 
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch is on behalf of the committers, and not a personal decision of
> its author.
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81bd0dfeec30..6b2e391441d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -241,7 +241,6 @@ F:	xen/arch/x86/hvm/svm/
>  F:	xen/arch/x86/include/asm/hvm/svm/
>  
>  ARGO
> -M:	Christopher Clark <christopher.w.clark@gmail.com>
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Maintained
>  F:	xen/include/public/argo.h
> -- 
> 2.53.0
> 
--8323329-1768402433-1783010586=:992629--

