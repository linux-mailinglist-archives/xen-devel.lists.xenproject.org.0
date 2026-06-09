Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QYODCMQBKGqL7AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 14:06:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773EB65FD97
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 14:06:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=QN5s+F1i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332970.1595279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWvDd-0006sm-Fp; Tue, 09 Jun 2026 12:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332970.1595279; Tue, 09 Jun 2026 12:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWvDd-0006qB-DG; Tue, 09 Jun 2026 12:06:09 +0000
Received: by outflank-mailman (input) for mailman id 1332970;
 Tue, 09 Jun 2026 12:06:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWvDc-0006pt-I4
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 12:06:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWvDb-007g5H-Ul
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 14:06:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2801a2-5cb7-0a2a0a5109dd-0a2a450c9c7e-48
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 14:06:07 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2801ad-62f1-0a2a450c0019-888fbc335270-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 14:06:06 +0200
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1781006746676946.0895210175249;
 Tue, 9 Jun 2026 05:05:46 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781006756; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LM4df0UhRcDQNENHx9dv+oGGbH7RQI+2NPsTl6LRSB+kuo4/5mmevsh3HtOMREjUshvg9AU6YX7TGOzVocB167hU5De1BBSOeeq3GTBktK68ufr71HJzEJOs9GAreTOLCw+fNgnuWJT7NS0l1FSGvMR23hzvlNHNVvx+oQxos48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781006756; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M3h0f/AO0PoVXINJfsjmCDGXEUhdj86zDYlREyQwYO8=; 
	b=UIpNZRd8SWH96cL3r1p+JB/yjZd7IWRPu5V4G1Y5ioe3yKpYSDAlzZacIoqPn8NSgKtqzKJ5OjhLE7ou2b7oKidIcWReS4u6i1WoIRupZRxr10yu15JNzaSLJW7EA9fDdMIGW+SvKIXvHFTAJFaOraI7mYQd5LUkBhodB+wJW+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781006756;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M3h0f/AO0PoVXINJfsjmCDGXEUhdj86zDYlREyQwYO8=;
	b=QN5s+F1i5dnqU0rTvK0DMqZm1BqSv04MsswIPKSA4gJlfJ4kA8B4rnMhQTfgfM+o
	YrF85gzw1BiyiGYK9KAKPGZUi1j4etDCKash85QFwwuxtTqIp3ycH1s7xEt6E7SgfZ9
	UkFLkWZCnjPGNlLuF9b2spSIt4OROhisIHn9eAkQ=
Date: Tue, 09 Jun 2026 08:05:46 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "dmukhin" <dmukhin@ford.com>
Cc: "xen-devel" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3" <andrew.cooper3@citrix.com>,
	"anthony.perard" <anthony.perard@vates.tech>,
	"jbeulich" <jbeulich@suse.com>, "julien" <julien@xen.org>,
	"michal.orzel" <michal.orzel@amd.com>,
	"roger.pau" <roger.pau@citrix.com>,
	"sstabellini" <sstabellini@kernel.org>,
	"christopher.w.clark" <christopher.w.clark@gmail.com>
Message-ID: <19eac4643d1.6e35763b335631.3907992434911616381@apertussolutions.com>
In-Reply-To: <aidoyc/nME1n7ARa@kraken>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-6-dmukhin@ford.com>
 <c067e641-ab05-4dd9-b7e1-b7ea952de809@apertussolutions.com> <aidoyc/nME1n7ARa@kraken>
Subject: Re: [PATCH v3 5/6] argo: introduce CONFIG_ARGO_DEBUG
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-purgate-ID: tlsNG-d25034/1781006767-E3D7BCF5-B39EAE62/0/0
X-purgate-type: clean
X-purgate-size: 3000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.18 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 773EB65FD97



From:  <dmukhin@ford.com>
To: "Daniel P. Smith"<dpsmith@apertussolutions.com>
Cc: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>, <christopher.w.clark@gmail.com>
Date: Mon, 08 Jun 2026 21:13:45 -0400
Subject: Re: [PATCH v3 5/6] argo: introduce CONFIG_ARGO_DEBUG

 > On Mon, Jun 08, 2026 at 04:10:15PM -0400, Daniel P. Smith wrote: 
 > > 
 > > 
 > > On 5/26/26 5:58 PM, dmukhin@ford.com wrote: 
 > > > From: Denis Mukhin <dmukhin@ford.com> 
 > > > 
 > > > Add Kconfig knob to enable traces for Argo debugging. 
 > > > 
 > > > Signed-off-by: Denis Mukhin <dmukhin@ford.com> 
 > > > --- 
 > > > Changes since v2: 
 > > > - new patch 
 > > > --- 
 > > >   xen/common/Kconfig | 7 +++++++ 
 > > >   xen/common/argo.c  | 3 +-- 
 > > >   2 files changed, 8 insertions(+), 2 deletions(-) 
 > > > 
 > > > diff --git a/xen/common/Kconfig b/xen/common/Kconfig 
 > > > index 5ff71480eebe..adcdc51dd21b 100644 
 > > > --- a/xen/common/Kconfig 
 > > > +++ b/xen/common/Kconfig 
 > > > @@ -491,6 +491,13 @@ config ARGO 
 > > >         If unsure, say N. 
 > > > +config ARGO_DEBUG 
 > > > +    bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO 
 > > > +    help 
 > > > +      Enables extra debug traces for Argo debugging. 
 > > > + 
 > > > +      If unsure, say N. 
 > > > + 
 > > >   source "common/sched/Kconfig" 
 > > >   config CRYPTO 
 > > > diff --git a/xen/common/argo.c b/xen/common/argo.c 
 > > > index 3c38a51d09a2..b9b362064e7e 100644 
 > > > --- a/xen/common/argo.c 
 > > > +++ b/xen/common/argo.c 
 > > > @@ -318,10 +318,9 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */ 
 > > >       ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \ 
 > > >        LOCKING_Write_L1) 
 > > > -#define ARGO_DEBUG 0 
 > > >   #define argo_dprintk(fmt, args...)                      \ 
 > > >       do {                                                \ 
 > > > -        if ( ARGO_DEBUG )                               \ 
 > > > +        if ( IS_ENABLED(CONFIG_ARGO_DEBUG) )            \ 
 > > >               gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\ 
 > > >       } while ( 0 ) 
 > > 
 > > Is a Kconfig really desired here? This such a trivial knob and one that is 
 > > really only intended for tuning by the developers. Exposing it as a Kconfig 
 > > option means you intend for this to be tuned by distro builders and wanting 
 > > to see it exercised by the CI RandConfig. 
 >  
 > Yes, something like this: parameterized CI (local) build variants. 
 >  
 > With Kconfig facility present it is simple to enable extra verbose debug 
 > builds. 
 >  


Another option is instead of doing a Kconfig to directly turn on/off debug, have it enable the availability of a command line paramter that enables argo debug messages.

v/r,
dps

