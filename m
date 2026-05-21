Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHDdMtAED2pzEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:12:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FBA5A5756
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315195.1585044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3CU-00062o-N3; Thu, 21 May 2026 13:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315195.1585044; Thu, 21 May 2026 13:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3CU-00060l-KF; Thu, 21 May 2026 13:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1315195;
 Thu, 21 May 2026 13:12:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4aaa7d0d000f373@swg.vates.tech>)
 id 1wQ3CS-00060d-V3
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:12:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3CS-00DvaY-Aw
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:12:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4aaa7d0d000f373@swg.vates.tech>)
 id 6a0f04bd-bab6-0a2a0a5309dd-0a2a4504ba8c-22
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:12:32 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4aaa7d0d000f373@swg.vates.tech>)
 id 6a0f04bf-1dec-0a2a45040019-b9ff1c228b55-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:12:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4aaa7d0d000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 May 2026 13:12:27 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 05FA486930;
 Thu, 21 May 2026 15:12:27 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=tAOMW8NDnqJEu18gDQLMpl8tOrXomB+eYdOjwvR0/nI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lLPIlXf/KKjuxGhbnEyhzffAPrXopnfdbAxmUR2ktxikDrp0/qaEyuMqWp8u7s555q6vSjpc5
 7mrMNMBVxTPTXL+8wHbncZeSFAw9dnh0Mvz5i8uKMmyeuxJQ4Nh1L9zPIPUSvzCYuty9YvecC7b
 viqkG78+0c1kqPg4COv6kZGODGNJYcpk06S1SQKXZ/0YMa1UybwjJ5YISiFMI+Qp16jaNTqtB4J
 Ns+/lk2Cut0PdWY2IxIP5W3+B6AXeQfVVMeUQxXbcNEjFvzw+a+34+Df61aJPEL9q9wep+uCE+A
 IAWHqtOyyFlNjJsVRKSODAROAOtWMeO08UlNrdhaKvWA==
X-Zone-Loop: ea2490a7f8d6d220ce3992768096cbc0176c920a7e6f
x-campaign-type: default
x-transaction-id: e7106546-664f-490a-b9c2-979c69197eb1
x-swg-uid: 01-92e4064e-834f-41a3-8f92-7eebfb10e107
X-Mailer: Sweego
Message-ID:
 <1779369147.8631fc262581453bbf619ec5b2062170.19e4aaa7d0d000f373@vates.tech>
x-swg-bid: 1779369147.8631fc262581453bbf619ec5b2062170.19e4aaa7d0d000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 21 May 2026 15:12:26 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2] Arm: do a 4th linking pass if necessary
References: <59fc2b14-073b-42a6-8f30-503ad789fbab@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59fc2b14-073b-42a6-8f30-503ad789fbab@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.111e.176d8371ba2d0dc1.19e4aaa7b3c.c8bb295495a3997d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779369147196
X-purgate-ID: tlsNG-ebf023/1779369152-2A37F3FF-855D5C99/0/0
X-purgate-type: clean
X-purgate-size: 1074
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 82FBA5A5756
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.111e.176d8371ba2d0dc1.19e4aaa7b3c.c8bb295495a3997d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 02:02:59PM +0200, Jan Beulich wrote:
> The =2Erodata growth between 1st and 2nd linking passes may affect the
> number of stubs the linker wants to insert, which in turn affects the
> number of symbols=2E If symbol table sizes change after the 2nd linking
> pass, insert another one before the final one=2E (As a comment in Linux =
puts
> it, "In theory it's possible this results in even more stubs, but
> unlikely=2E")
>=20
> To use the $(compare-symbol-tables) macro in a shell "if", it needs
> slightly adjusting (and then wrapping to be run in a sub-shell)=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.111e.176d8371ba2d0dc1.19e4aaa7b3c.c8bb295495a3997d=---

