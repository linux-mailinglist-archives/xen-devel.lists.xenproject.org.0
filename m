Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H59rBJjgRGoF2goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:40:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7936EBACA
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:40:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=HaQ77viu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1349668.1607350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werQY-0001Lf-M8; Wed, 01 Jul 2026 09:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349668.1607350; Wed, 01 Jul 2026 09:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werQY-0001Iv-Ir; Wed, 01 Jul 2026 09:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1349668;
 Wed, 01 Jul 2026 09:40:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d0ce08600080a8@swg.vates.tech>)
 id 1werQW-0001Hk-QV
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:40:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1werQW-002CCk-3M
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:40:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d0ce08600080a8@swg.vates.tech>)
 id 6a44e07a-5cb7-0a2a0a5109dd-0a2a450ab64a-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:40:15 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d0ce08600080a8@swg.vates.tech>)
 id 6a44e07f-e40e-0a2a450a0019-b9ff1c22858d-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:40:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1d0ce08600080a8.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 09:40:11 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5E2A886A8B;
 Wed,  1 Jul 2026 11:40:10 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Q0NZ86XoEQtDgO/Bt6pmVawK/ef9zc1X8PA/DIOIMKE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HaQ77viuXXBjKc2BLSozESKbLUkbLYrabP9ZdxwVYiAqXaRmg8NGD+OkXnMDdd5GY0Zv6Y/w9
 kR8FqOtw6X68E12RU3V/qDojwkUvoCHsng2b3Ceqwm44y1FdJXxtWvGGqe3d5hFpWMclL/Gy5p5
 2RjcdUcBNS8AueK29kFWTFtCO+ADVm4YX5qxAif2HwB/0jMlcq1x56buG/ymc8FGUILfNYob2Ds
 NgOpexUPqOpEyzjR0+DmK/gb17qe9OsRvVethrAxd+88AXRpGnLB7BRihNWkQeUiXvywpb3/5Of
 ISERp94C/xWEygyDP0Y8/4o2YbGCe3xjU/txdyFULcUg==
X-Zone-Loop: 206e6eefd26d04786358331b3173087080d9c93beb76
x-campaign-type: default
x-transaction-id: eebc37a5-1370-44d7-bc73-1b6af16bd31b
x-swg-uid: 01-1e69a379-7318-4429-9dc9-7375d65692a2
X-Mailer: Sweego
Message-ID:
 <1782898811.8631fc262581453bbf619ec5b2062170.19f1d0ce08600080a8@vates.tech>
x-swg-bid: 1782898811.8631fc262581453bbf619ec5b2062170.19f1d0ce08600080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 1 Jul 2026 11:40:10 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/4] libxc: adjust string size calculations in
 xc_flask_{getbool_byname,setbool}()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <83af338a-3ef2-4be3-99f0-cfe38a09cda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83af338a-3ef2-4be3-99f0-cfe38a09cda0@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9f4.89d32d950e70d08e.19f1d0cde6d.b2f2c93736bd6d53=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782898810477
X-purgate-ID: tlsNG-4011c0/1782898815-D7537DDE-8EFE99C2/0/0
X-purgate-type: clean
X-purgate-size: 794
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 9C7936EBACA

---=Part.9f4.89d32d950e70d08e.19f1d0cde6d.b2f2c93736bd6d53=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:02:26AM +0200, Jan Beulich wrote:
> In preparation for a hypervisor change also include the nul terminator i=
n
> the size calculations=2E (Note that xc_flask_getbool_byid() doesn't supp=
ort
> FLASK_GETBOOL's "ID being -1" variant of operation, and hence doesn't ne=
ed
> fiddling with=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.9f4.89d32d950e70d08e.19f1d0cde6d.b2f2c93736bd6d53=---

