Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MsWICGMgJ2onsQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 22:04:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDD265A42E
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 22:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=iGCKaqL3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332062.1594705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgDB-0006Tr-3M; Mon, 08 Jun 2026 20:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332062.1594705; Mon, 08 Jun 2026 20:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgDB-0006RU-0H; Mon, 08 Jun 2026 20:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1332062;
 Mon, 08 Jun 2026 20:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWgD9-0006RO-7l
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWgD8-003RGI-Ks
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:04:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a272038-2eae-0a2a0a5409dd-0a2a4508964c-32
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:04:38 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a272055-63b5-0a2a45080019-888fbc3352ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:04:38 +0200
Received: by mx.zohomail.com with SMTPS id 178094906622989.31840955224857;
 Mon, 8 Jun 2026 13:04:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780949069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tgk41q1x5SAThD7mN67mck4ga4aE+lXcQ9HaC7/v8VrykNW8yJp84b2HFwtl2VJYT0D84RHGhcir9/3VXhE6CHFzn/N+lSAJPV7d/hzlyqHIVPKohppUobBEJh0PlyYaM88kosPfyu1JY2ovBFN6UcCEjbx/cLxARJQvODoUjZk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780949069; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5O0tXT06sdRZVNwdfqnS1GOksabn+q+/lGD7fGsWqSI=; 
	b=lhXI1ITZ+CiLhKWA1wRCodbhHCvbIQIBcfyMQWHqsttcqsXMlEVKYaPgId0a/iwfD1PKdhWwUP242daN/U6UDL7zKCx98KFifBGKY+qFMTyVPmFmVEGOnblrw4fvjclnl6VXflpjqWLM8YPo3rL+2kBElH49mbLO4z7EEUyj8HE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780949069;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5O0tXT06sdRZVNwdfqnS1GOksabn+q+/lGD7fGsWqSI=;
	b=iGCKaqL3vyWX60q1TkeI/T0wXWx3DqJ40mlJ+lxcUjeckRBvVSXp4eb+p0qP1lgX
	6kdhg3mXMN5E8YgIP+8wDQxOSYCloPyWSb+oY4X0Va0IAQc93jNH3Hc8KdiAhhu/j1w
	jK6hM+5CO1ECS39HYmlRIpdWUHNeRw0gWlK6VaK0=
Message-ID: <89b68e2f-ae8c-47de-a53d-cbf3a1001dca@apertussolutions.com>
Date: Mon, 8 Jun 2026 16:04:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] argo: fixup argo_dprintk()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-5-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c1860d/1780949078-B7B7CDB1-230A1FC5/0/0
X-purgate-type: clean
X-purgate-size: 1096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:dkim,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEDD265A42E



On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Current argo_dprintk() implementation is a wrapper around raw printk().
> 
> Rewire it through gprintk() to allow for better debugging context
> (such as domain ID).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - new patch
> ---
>   xen/common/argo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index ffa1f43437ab..3c38a51d09a2 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -322,7 +322,7 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
>   #define argo_dprintk(fmt, args...)                      \
>       do {                                                \
>           if ( ARGO_DEBUG )                               \
> -            printk(XENLOG_DEBUG "argo: " fmt, ##args);  \
> +            gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
>       } while ( 0 )
>   
>   /*

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

