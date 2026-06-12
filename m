Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ejCIhLZK2pNGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4926788E4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=ZTNhwTKL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336490.1598316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhl-000479-M3; Fri, 12 Jun 2026 10:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336490.1598316; Fri, 12 Jun 2026 10:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhl-00045A-Gm; Fri, 12 Jun 2026 10:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1336490;
 Fri, 12 Jun 2026 10:01:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb479016000701b@swg.vates.tech>)
 id 1wXyhj-0003vN-9g
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhi-0056he-MX
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb479016000701b@swg.vates.tech>)
 id 6a2bd8fa-bab6-0a2a0a5309dd-0a2a450cba10-20
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:34 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb479016000701b@swg.vates.tech>)
 id 6a2bd8fe-62f1-0a2a450c0019-b9ff1c12b3f9-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb479016000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:29 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5A20F863FC;
 Fri, 12 Jun 2026 12:01:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=lRTVt6TLYyvZxQ4clMT8KEoLagGnL0YlVYAtPQPiWaU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ZTNhwTKLdX8aCDQrjnppJb++CFj6JOtRHSOzlVwDBSh6pSrVi4K3C04rMnzTbpMCqBLnmVOKP
 iDkmMGUKr2c//oK3GU8ynuAgiqodH8cv+vrVvyZz/SGz4fXqYP/4a1gsZrbLYl373El5qoKxVNC
 bIyBzDH/VtJFmrl92BrdUARn6XygAURsyUU89Pf4SKXzwQsgWQMm1GzAst3GkjArf00oPfv+v53
 oaOVyvubBFL59nFd+ECCTLu7YXUnCyGCZL2Upyuqr2yrVEG27DW9Xs+UfFnF8R0yOhuLxsaAcox
 jObdi1K8JaO80lrFL+ttEMFwwX2UNF8OepotQy1jQprg==
X-Zone-Loop: 09d72c41ab7896d961535710c121ac73039d7d8975cf
x-campaign-type: default
x-transaction-id: c24f5d4d-d599-4eab-8cb0-06783b17206a
x-swg-uid: 01-d0abcb43-ca14-420c-9c15-fddd7c219c57
X-Mailer: Sweego
Message-ID:
 <1781258489.8631fc262581453bbf619ec5b2062170.19ebb479016000701b@vates.tech>
x-swg-bid: 1781258489.8631fc262581453bbf619ec5b2062170.19ebb479016000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 06/17] hvmloader: Move pci devices setup to a separate
 function
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-7-thierry.escande@vates.tech>
 <99783d58-00b5-4f3e-9393-c713eb6f2606@suse.com>
Content-Language: en-US
In-Reply-To: <99783d58-00b5-4f3e-9393-c713eb6f2606@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9f.16c956ee77c612d4.19ebb478e92.982053e04d65383b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258489490
X-purgate-ID: tlsNG-d25034/1781258494-E2B74CF5-37DCDDBB/0/0
X-purgate-type: clean
X-purgate-size: 890
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	DKIM_TRACE(0.00)[vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E4926788E4

---=Part.9f.16c956ee77c612d4.19ebb478e92.982053e04d65383b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 16:52, Jan Beulich wrote:
> On 13=2E03=2E2026 17:35, Thierry Escande wrote:
>>  void pci_setup(void)
>>  {
>>      uint8_t is_64bar, using_64bar, bar64_relocate =3D 0;
>>      uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
>>      uint64_t base, bar_sz, bar_sz_upper, mmio_total =3D 0;
>> -    uint32_t vga_devfn =3D 256;
>> +    uint8_t vga_devfn =3D 0xff;
>=20
> This change (and the related ones elsewhere) looks bogus to me: 0xff is
> a valid devfn value, whereas 256 isn't=2E

I'll revert this=2E

Regards,



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.9f.16c956ee77c612d4.19ebb478e92.982053e04d65383b=---

