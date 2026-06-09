Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qmKTBOoAKGom7AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 14:02:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18465FC7A
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 14:02:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=JTMvDUHU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332861.1595259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWvAH-0004eX-8I; Tue, 09 Jun 2026 12:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332861.1595259; Tue, 09 Jun 2026 12:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWvAH-0004bd-5N; Tue, 09 Jun 2026 12:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1332861;
 Tue, 09 Jun 2026 12:02:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWvAF-0004ae-MS
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 12:02:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWvAF-005uAe-01
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 14:02:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2800d6-e002-0a2a0a5209dd-0a2a450bd734-44
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 14:02:38 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2800dc-212f-0a2a450b0019-888fbc335274-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 14:02:38 +0200
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1781006542751698.4007614901942;
 Tue, 9 Jun 2026 05:02:22 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781006548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MmIL7uRBG9ACpkuL69X/DDWYS/5HbKDWirEGMVSXY2m6Ol03eJ+VZmH5oTU4wT/BY/nmAQkeRnovKySXr3peTNuBraMXvVkTbLDt2XW/Hic5xXkchdOAm9Or9ZR8o4bVnLDERhp26qFg7/rQ39Z9mCOQImx/r/7CiwoLz5kxUI4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781006548; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QgOcGCA+EIkKpTTXKaYxW+5DHaPKTbJAeaN44o78C2o=; 
	b=KatQQYc9oCznVNQxROZCEKcTux0rFmBJO3I0cNpdWNv5awOppmPyJ1hSmDBFOiqv3xhVpOOVhe2FNsaCyiuMJrIi9EfD5fAVDy5OYvL3PZOLwsjOuoJiMVCA+BasYLuxRGGGkefToyBtC9hZUm/BL07K5S85k6ftrBB2mr0MM3s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781006548;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QgOcGCA+EIkKpTTXKaYxW+5DHaPKTbJAeaN44o78C2o=;
	b=JTMvDUHUI3gN7oVCERWp+dy0Ak5JuoLbqbwbbYh9IVpwOfNqjs3FS7nly6Ljq/H6
	6c9D72V0yMGBHm9BHnOnjwKFnzuKH1zeDS+1KmkD6W+JC1ZWhP2zsMBSImDZx6C5VoL
	gX0KdcmPZ2xZOc4OF80L8emrAqOPj9bwQxcQ/K60=
Date: Tue, 09 Jun 2026 08:02:22 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "dmukhin" <dmukhin@ford.com>
Cc: "xen-devel" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3" <andrew.cooper3@citrix.com>,
	"anthony.perard" <anthony.perard@vates.tech>,
	"jbeulich" <jbeulich@suse.com>, "julien" <julien@xen.org>,
	"michal.orzel" <michal.orzel@amd.com>,
	"roger.pau" <roger.pau@citrix.com>,
	"sstabellini" <sstabellini@kernel.org>,
	"christopher.w.clark" <christopher.w.clark@gmail.com>,
	"Mykola Kvach" <mykola_kvach@epam.com>
Message-ID: <19eac432782.4dae9896335238.1132778796566950553@apertussolutions.com>
In-Reply-To: <aidm6a7lYS/JbCK9@kraken>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
 <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com> <aidm6a7lYS/JbCK9@kraken>
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused
 log
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-purgate-ID: tlsNG-42698a/1781006558-1815DF3B-067C6778/0/0
X-purgate-type: clean
X-purgate-size: 3809
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.17 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,xen.org:email,xenproject.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,epam.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D18465FC7A



From:  <dmukhin@ford.com>
To: "Daniel P. Smith"<dpsmith@apertussolutions.com>
Cc: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>, <christopher.w.clark@gmail.com>, "Mykola Kvach"<mykola_kvach@epam.com>
Date: Mon, 08 Jun 2026 21:05:45 -0400
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log

 > On Mon, Jun 08, 2026 at 03:54:51PM -0400, Daniel P. Smith wrote: 
 > > 
 > > 
 > > On 5/26/26 5:58 PM, dmukhin@ford.com wrote: 
 > > > From: Denis Mukhin <dmukhin@ford.com> 
 > > > 
 > > > Switch the log line to argo_dprintk() so it is enabled only in debug 
 > > > environments, as it can spam the logs when a dom0 service using the Argo 
 > > > hypercall tries to communicate with a domain that is still starting up. 
 > > > 
 > > > Note that this also lowers the log level to debug when the argo_dprintk() 
 > > > facility is enabled. 
 > > > 
 > > > Signed-off-by: Denis Mukhin <dmukhin@ford.com> 
 > > > Reviewed-by: Mykola Kvach <mykola_kvach@epam.com> 
 > > > --- 
 > > > Changes since v2: 
 > > > - updated commit message 
 > > > --- 
 > > >   xen/common/argo.c | 7 +++---- 
 > > >   1 file changed, 3 insertions(+), 4 deletions(-) 
 > > > 
 > > > diff --git a/xen/common/argo.c b/xen/common/argo.c 
 > > > index 28626e00a8cb..98a3db7fd070 100644 
 > > > --- a/xen/common/argo.c 
 > > > +++ b/xen/common/argo.c 
 > > > @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr, 
 > > >                                           src_id.domain_id); 
 > > >       if ( !ring_info ) 
 > > >       { 
 > > > -        gprintk(XENLOG_ERR, 
 > > > -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n", 
 > > > -                current->domain->domain_id, src_id.domain_id, src_id.aport, 
 > > > -                dst_addr->domain_id, dst_addr->aport); 
 > > > +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n", 
 > > > +                     current->domain->domain_id, src_id.domain_id, src_id.aport, 
 > > > +                     dst_addr->domain_id, dst_addr->aport); 
 > > >           ret = -ECONNREFUSED; 
 > > >       } 
 > > 
 > > My apologies but this is not the wisest approach, hitting this is a real 
 > > error and shouldn't be getting silenced. If you are seeing a lot of these 
 > > messages, I would suggest asking yourself why. Without further context on 
 > > how you are using it, one suggesting is perhaps your connection model might 
 > > need to be revisited. 
 >  
 > Thanks for the feedback! 
 >  

Not a problem and you're welcome.

 > The reason I wrote this patch is because there can be a lot of those messages 
 > from a real domU which is in a boot loop and/or boots for a significant amount 
 > of time. 
 >  
 > With -ECONNREFUSED propagated back to the caller having Xen logging the state 
 > of each sendv() with XENLOG_ERR on the shared (dom0) diag console can be a bit 
 > problematic. 
 >  
 > Yes, I understand that programs issuing the Argo hypercall could be rewritten 
 > in a particular way so that the Argo hypercall is issued only if the domain is 
 > up and Argo on the other side is initialized and, ideally, domain should not 
 > be boot-looping... 
 >  
 > However, I think, that hypervisor should not depend on assumptions made in the 
 > userspace (e.g. retry/logging policy). 
 >  
 > De-prioritizing the logline from XENLOG_ERR to XENLOG_DEBUG can be another 
 > potential solution. 


Please look at my response to Jason, this is essentially one of the cases for which the notify op exists.

v/r,
dps

