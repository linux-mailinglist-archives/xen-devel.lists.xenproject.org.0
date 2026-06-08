Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RdzwAjMeJ2qfsAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 21:55:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8726E65A303
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 21:55:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=mWESjfxg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332037.1594670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWg3y-0001AJ-Gu; Mon, 08 Jun 2026 19:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332037.1594670; Mon, 08 Jun 2026 19:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWg3y-00018p-DZ; Mon, 08 Jun 2026 19:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1332037;
 Mon, 08 Jun 2026 19:55:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWg3x-00018j-5p
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 19:55:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWg3w-001ZCe-2L
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 21:55:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a271dd0-2eae-0a2a0a5409dd-0a2a450795a6-48
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:55:07 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a271e19-229c-0a2a45070019-888fbc335291-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 21:55:07 +0200
Received: by mx.zohomail.com with SMTPS id 178094849351665.49557558601805;
 Mon, 8 Jun 2026 12:54:53 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780948496; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mZxL+FYw2x95QmgxagjIlBkA1w6ENc66rKxnqzurwuiYYzVHlbhfBi5x7SjgXULDH/xw19GoCJdI2Uxo3gbg+oevOoJGcDGYHM1zVkwtOdL2i0sPVg1Jbd6a68BERIOjO6LmwGXDXyDbRj2vISyoPPMITHjQSpamHbdkxrlzfGQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780948496; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=agwjieH2C8BqxPI7qbVmt/rqTrmPxOTB+kkEdNu7f3o=; 
	b=RV+eATuNWtGEMKV0JMX7PlWr8yck1NQp2wbyfyhVAZfKpWpbu63Z5O7kFL6mlAe4SLTWIEnLukUYg20QPxqc1XqWKMRO3t4YcjQ7c5DBV2RvPypIJNQwz9Dmdia3xOaLBIOLI4lWmgI8Ot40jQ4oADgBPMlik5gAC9nhM1ClT7Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780948496;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=agwjieH2C8BqxPI7qbVmt/rqTrmPxOTB+kkEdNu7f3o=;
	b=mWESjfxgU1s393Iv/EsWgugz/HjQTfQVGkSObSw76TDEfs/F3V6LbmAmMn31WFpS
	kTDbA8sJOWGQy2iZSBNY0o44sd4h3DCExZ4BCB+VSkiLORibnPOXBXTEYf06qv+MW/x
	14+B+Gl8DybM/Du8E5PFqp5F5TVPSDB3sWGiUCu8=
Message-ID: <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
Date: Mon, 8 Jun 2026 15:54:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com,
 Mykola Kvach <mykola_kvach@epam.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ef75cf/1780948507-20563C48-C8453E2B/0/0
X-purgate-type: clean
X-purgate-size: 1911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,epam.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8726E65A303



On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Switch the log line to argo_dprintk() so it is enabled only in debug
> environments, as it can spam the logs when a dom0 service using the Argo
> hypercall tries to communicate with a domain that is still starting up.
> 
> Note that this also lowers the log level to debug when the argo_dprintk()
> facility is enabled.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes since v2:
> - updated commit message
> ---
>   xen/common/argo.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 28626e00a8cb..98a3db7fd070 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
>                                           src_id.domain_id);
>       if ( !ring_info )
>       {
> -        gprintk(XENLOG_ERR,
> -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> -                current->domain->domain_id, src_id.domain_id, src_id.aport,
> -                dst_addr->domain_id, dst_addr->aport);
> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> +                     current->domain->domain_id, src_id.domain_id, src_id.aport,
> +                     dst_addr->domain_id, dst_addr->aport);
>   
>           ret = -ECONNREFUSED;
>       }

My apologies but this is not the wisest approach, hitting this is a real 
error and shouldn't be getting silenced. If you are seeing a lot of 
these messages, I would suggest asking yourself why. Without further 
context on how you are using it, one suggesting is perhaps your 
connection model might need to be revisited.

V/r,
Daniel P. Smith

