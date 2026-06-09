Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MSe9H+3/J2rl6wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:58:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D784765FC09
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=LT17RIRy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332651.1595130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWv60-0004oK-NR; Tue, 09 Jun 2026 11:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332651.1595130; Tue, 09 Jun 2026 11:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWv60-0004m5-Kh; Tue, 09 Jun 2026 11:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1332651;
 Tue, 09 Jun 2026 11:58:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWv5z-0004ly-9Q
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:58:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWv5y-00DIhx-MU
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 13:58:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a27ffc9-e002-0a2a0a5209dd-0a2a45069cde-38
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:58:13 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a27ffd3-7371-0a2a45060019-888fbc33529e-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:58:12 +0200
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1781006274774660.3033654277247;
 Tue, 9 Jun 2026 04:57:54 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781006281; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ndVtC50KlT2RPRIMUbpUBIFVWSfxEVzyxv1YmVW5GO3mr3vvenU6pFolToQRKlXUBBXLBqldbW/oKUjqad+3G7HPZ114NqgzVYd/LTuscYrpulWOwXeHP7WySoAFyAi5v/bi9xYCZ847e/6yIQm0BJFmoCLyy3JsZi+n39KY054=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781006281; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jtMEEDQKBFgAVM9bj3uL2dJieqsnSNOkuji0r7SWb1g=; 
	b=cCYgJjFyiZBIo6YoN/CPklG/zb1FpO1GYkB/r8gAsfKUkfKnKBD4VnEOyB+1SPqzitsn9Bf4D3NG5EO7a8yukXThc6NkNPt6cLUTz5sViKnsSCM/k0Cg4fZVCcFMJTi4+EDFa6/mZa24/Cb5zb2dNPoQZff9VyCPqT+TKXe6pPE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781006281;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jtMEEDQKBFgAVM9bj3uL2dJieqsnSNOkuji0r7SWb1g=;
	b=LT17RIRyoFtaDM0d27lRVYB0catTLHCNCMKLvW7rdoac5uXP9kSCC4ByTNGVpoYY
	5YejrijdCY9jdejB0Xr7FCw9KQpIHtD58uDWSYfvZAAJMXpahDOCTozMotwq8fpUOyr
	14h1+XGgGsyDGaiAcfxkosPooF4HBnYHBCGeH6lM=
Date: Tue, 09 Jun 2026 07:57:54 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Jason Andryuk" <jason.andryuk@amd.com>
Cc: "dmukhin" <dmukhin@ford.com>,
	"xen-devel" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3" <andrew.cooper3@citrix.com>,
	"anthony.perard" <anthony.perard@vates.tech>,
	"jbeulich" <jbeulich@suse.com>, "julien" <julien@xen.org>,
	"michal.orzel" <michal.orzel@amd.com>,
	"roger.pau" <roger.pau@citrix.com>,
	"sstabellini" <sstabellini@kernel.org>,
	"christopher.w.clark" <christopher.w.clark@gmail.com>,
	"Mykola Kvach" <mykola_kvach@epam.com>
Message-ID: <19eac3f10c4.4656d1b3334797.1477306808945740845@apertussolutions.com>
In-Reply-To: <c51ecc59-7252-4d1f-a192-717ae55dacd5@amd.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
 <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com> <c51ecc59-7252-4d1f-a192-717ae55dacd5@amd.com>
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused
 log
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-purgate-ID: tlsNG-16d1c6/1781006293-84B65D75-75F393C4/0/0
X-purgate-type: clean
X-purgate-size: 5550
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,epam.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D784765FC09



From: Jason Andryuk <jason.andryuk@amd.com>
To: "Daniel P. Smith"<dpsmith@apertussolutions.com>, <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
Cc: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>, <christopher.w.clark@gmail.com>, "Mykola Kvach"<mykola_kvach@epam.com>
Date: Mon, 08 Jun 2026 19:16:01 -0400
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log

 > On 2026-06-08 15:54, Daniel P. Smith wrote: 
 > > 
 > > 
 > > On 5/26/26 5:58 PM, dmukhin@ford.com wrote: 
 > >> From: Denis Mukhin <dmukhin@ford.com> 
 > >> 
 > >> Switch the log line to argo_dprintk() so it is enabled only in debug 
 > >> environments, as it can spam the logs when a dom0 service using the Argo 
 > >> hypercall tries to communicate with a domain that is still starting up. 
 > >> 
 > >> Note that this also lowers the log level to debug when the argo_dprintk() 
 > >> facility is enabled. 
 > >> 
 > >> Signed-off-by: Denis Mukhin <dmukhin@ford.com> 
 > >> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com> 
 > >> --- 
 > >> Changes since v2: 
 > >> - updated commit message 
 > >> --- 
 > >>   xen/common/argo.c | 7 +++---- 
 > >>   1 file changed, 3 insertions(+), 4 deletions(-) 
 > >> 
 > >> diff --git a/xen/common/argo.c b/xen/common/argo.c 
 > >> index 28626e00a8cb..98a3db7fd070 100644 
 > >> --- a/xen/common/argo.c 
 > >> +++ b/xen/common/argo.c 
 > >> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t 
 > >> *src_addr, 
 > >>                                           src_id.domain_id); 
 > >>       if ( !ring_info ) 
 > >>       { 
 > >> -        gprintk(XENLOG_ERR, 
 > >> -                "argo: vm%u connection refused, src (vm%u:%x) dst 
 > >> (vm%u:%x)\n", 
 > >> -                current->domain->domain_id, src_id.domain_id, 
 > >> src_id.aport, 
 > >> -                dst_addr->domain_id, dst_addr->aport); 
 > >> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst 
 > >> (vm%u:%x)\n", 
 > >> +                     current->domain->domain_id, src_id.domain_id, 
 > >> src_id.aport, 
 > >> +                     dst_addr->domain_id, dst_addr->aport); 
 > >>           ret = -ECONNREFUSED; 
 > >>       } 
 > > 
 > > My apologies but this is not the wisest approach, hitting this is a real 
 > > error and shouldn't be getting silenced. 
 >  
 > -ECONNREFUSED is still returned, and that is the important part, I think? 
 >  

Absolutely not. Argo at its essence is a security protocol where you want to minimize the amount of implicit trust we have to have with the endpoint. Telling a bad actor he did a bad action tells you nothing. The send operation is the critical security path and you must have an auditable record that an endpoint misbehaved. If yo want to implicitly trust your end point after passing the accees check, then you can just use grants. 

 > While gprintk(), it is trivially guest triggerable, so I think it wants 
 > to be a debug message like this change made it.  As a comparison, errors 
 > in event_channel.c are gdprintk(). 
 >  

Again, this message should never be disabled which could occur with gdprintk() depending on the NDEBUG flag. HMX and the Xen implementation Argo are high assurance mechanisms for high assureance implementations. The maintainers must ensure that foundational principles are not compromised. If an implementer chosing Argo, it is because of the properties that come about because of the design of this mechanism.

A side note, gprintk is rate limited, so an option is to adjust your rate limit.

 > If you are seeing a lot of 
 > > these messages, I would suggest asking yourself why. Without further 
 > > context on how you are using it, one suggesting is perhaps your 
 > > connection model might need to be revisited. 
 >  
 > There isn't a way to know if a port is available without polling? 


That is absolutely not a true statement. Send a notify message with a request for a chunk of data, ideally the amount you want to send. You will get a response that includes a flag to tell you the ring exists[1] and how much space is available [2]. If the ring doesn't exist, the response will have 0 in both flags and max_message_size. I would even suggest reviewing the flags, as a few of them might also be of interest. For instance, the ring empty flag. If the ring empty flag is set and max_message_size is smaller than the amount of data you are attempting to send, your attempt to send will fail. Whereas, you can use this on your sender size to packetize your data depending on what kind of transmit strategy you want, e.g. willing to allow a single send to max out the buffer.

I would add that you are free to flood the notify op in a poll loop and not see a flood to the message buffer since that path is audited with argo_dprintk's.

[1] https://elixir.bootlin.com/xen/v4.21.1/source/xen/common/argo.c#L1355
[2] https://elixir.bootlin.com/xen/v4.21.1/source/xen/common/argo.c#L1410


Finally, while looking at the series further and the example CI build due to the SNAFU, I would like to revise my review of the other patches. Since we are touching all these log points in this series, perhaps it would be good to update the fmt to new format specifiers such as %pd for domain identification, as well as reconsider whether logging the virutal address is the correct detail to be reported.

v/r,
dps

