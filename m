Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nwciB2b6TGqxswEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:08:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C371BB23
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:08:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=YJg72+E4;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356217.1610857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh5Wf-0001k0-G0; Tue, 07 Jul 2026 13:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356217.1610857; Tue, 07 Jul 2026 13:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh5Wf-0001ip-Ce; Tue, 07 Jul 2026 13:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1356217;
 Tue, 07 Jul 2026 13:07:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@swg.vates.tech>)
 id 1wh5Wd-0001id-2r
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 13:07:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh5Wa-00DnJy-Rr
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:07:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@swg.vates.tech>)
 id 6a4cfa14-e002-0a2a0a5209dd-0a2a450b83dc-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:07:44 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@swg.vates.tech>)
 id 6a4cfa20-ac48-0a2a450b0019-b9ff1c2288f3-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:07:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f3cb107e000080a8.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 Jul 2026 13:07:42 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id DED6C8117D
 for <xen-devel@lists.xenproject.org>; Tue,  7 Jul 2026 15:07:41 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=hVfjwUIS3tfqkIiOfhuLpu2jTDTVM0rzyTu+kCSXSKg=;
 h=from:subject:date:message-id:to:mime-version:content-type:feedback-id;
 b=YJg72+E49WcpLdEjpXJITLlFvdbzTkjJDBMXPIZXB8vmuD8NCu2l6nTIGdBe3pgitcOZbVxYD
 0JN6Wgx6Nklk4faiFsH9VvZr4+UYEJSMd8tnjLYWsi6LFzNFmovLjOP1fRTYik2YCtdjVh/Eq/4
 DYrEQyM8jXVnCVbzRZRmrjphCKdrvdgOCMYvtEXbUgmHvKkKKd3Ci+TYJ7k/zFMiog4vUYPXMvJ
 nH28QT1I+JR7HRiJfKSOVLhbMq6MmFv47a/LlkMemd0O6DNJJhTeqWeGISTT5p+wKg52PnDYIQ5
 +AFHcmomOTySHRV5Ucs+YrPTg3dE8g9F4M/cs3ezNUOQ==
X-Zone-Loop: 337b730b8dda415fddc99db6c93642f65fe5baa20eff
x-campaign-type: default
x-transaction-id: a3bec5c5-1e44-42c0-85b4-9cb9ed4b9a8b
x-swg-uid: 01-cd59d248-fd84-4716-9b88-18b76296608b
X-Mailer: Sweego
Message-ID:
 <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
x-swg-bid: 1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 7 Jul 2026 14:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Andrii Sultanov <andriy.sultanov@vates.tech>
Subject: Improper handling of fast-resumed domains by O/Cxenstored
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.368.301e80a01c6907ba.19f3cb1052b.d0574539bf2a488b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783429661999
X-purgate-ID: tlsNG-42698a/1783429664-3BF36220-B4C51175/0/0
X-purgate-type: clean
X-purgate-size: 2820
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.sultanov@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.sultanov@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A90C371BB23

---=Part.368.301e80a01c6907ba.19f3cb1052b.d0574539bf2a488b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Both Oxenstored and Cxenstored don't properly handle a shutdown domain
(even if shutdown_code =3D=3D SHUTDOWN_suspend) coming back because of
xc_domain_resume(fast=3D1)=2E

Cxenstored correctly sends @introduceDomain watch events on the
initial INTRODUCE call:

 =C2=A0 =C2=A0 IN 0x1f78610 20260619 15:45:37 INTRODUCE (1 1044476 2 )
 =C2=A0 =C2=A0 CREATE connection 0x1f75870
 =C2=A0 =C2=A0 OUT 0x1f76f00 20260619 15:45:37 WATCH_EVENT (@introduceDoma=
in domlist )
 =C2=A0 =C2=A0 OUT 0x1f76ce0 20260619 15:45:37 WATCH_EVENT (@introduceDoma=
in=20
squeezed )
 =C2=A0 =C2=A0 OUT 0x1f77c40 20260619 15:45:37 WATCH_EVENT (@introduceDoma=
in=C2=A0 )
 =C2=A0 =C2=A0 OUT 0x1f78610 20260619 15:45:37 WATCH_EVENT (@introduceDoma=
in=C2=A0 )
 =C2=A0 =C2=A0 OUT 0x1f78610 20260619 15:45:37 INTRODUCE (OK )

And it sends @releaseDomain when it notices dominfo=2Eshutdown (without
checking for shutdown_code):

 =C2=A0 =C2=A0 OUT 0x1f76f00 20260619 15:46:56 WATCH_EVENT (@releaseDomain=
 domlist )
 =C2=A0 =C2=A0 OUT 0x1f76ce0 20260619 15:46:56 WATCH_EVENT (@releaseDomain=
 squeezed )
 =C2=A0 =C2=A0 OUT 0x1f77c40 20260619 15:46:56 WATCH_EVENT (@releaseDomain=
 )
 =C2=A0 =C2=A0 OUT 0x1f78610 20260619 15:46:56 WATCH_EVENT (@releaseDomain=
 )

But after fast resume, even though INTRODUCE returns successfully,
@introduceDomain watch events are not re-sent:

 =C2=A0 =C2=A0 IN 0x1f78610 20260619 15:47:06 INTRODUCE (1 1044476 2 )
 =C2=A0 =C2=A0 <----- no watch events
 =C2=A0 =C2=A0 OUT 0x1f78610 20260619 15:47:06 INTRODUCE (OK )

Oxenstored likewise avoids sending @introduceDomain for "re-connecting"
domains (which is what it thinks a domain coming back like this looks like=
)=2E

RESUME does not re-send @introduceDomain either, it just marks the domain =
as
live internally in Cxenstored and is a no-op for Oxenstored=2E

This missing notification leads to all kinds of issues since the toolstack=
s
don't notice the resumed domain is back (at least on the XAPI side)=2E

Is this a real issue or is the toolstack holding xenstored wrong here?

If it is, I see two possible options for handling this:

1) Don't consider SHUTDOWN_suspend domains as dead, only drop them when th=
ey
 =C2=A0 =C2=A0are definitively gone=2E This avoids the @releaseDomain noti=
fication
 =C2=A0 =C2=A0and hence doesn't require another @introduceDomain

2) Do actually send out @introduceDomain for thought-to-be-shutdown domain=
s
 =C2=A0 =C2=A0on INTRODUCE

Thoughts?



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.368.301e80a01c6907ba.19f3cb1052b.d0574539bf2a488b=---

