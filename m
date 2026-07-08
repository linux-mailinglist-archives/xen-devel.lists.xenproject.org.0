Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jujCNlwTTmp7CgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:07:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8B723752
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="ov12go/Q";
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356696.1611245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOFY-0000YH-2H; Wed, 08 Jul 2026 09:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356696.1611245; Wed, 08 Jul 2026 09:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOFX-0000WB-Uk; Wed, 08 Jul 2026 09:07:23 +0000
Received: by outflank-mailman (input) for mailman id 1356696;
 Wed, 08 Jul 2026 09:07:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fb48f800080a8@swg.vates.tech>)
 id 1whOFW-0000W1-4A
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:07:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOFV-00FqMN-3c
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:07:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fb48f800080a8@swg.vates.tech>)
 id 6a4e133b-5cb7-0a2a0a5109dd-0a2a4506ec58-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:07:20 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fb48f800080a8@swg.vates.tech>)
 id 6a4e1348-08de-0a2a45060019-b9ff1c129907-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:07:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f40fb48f800080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:07:17 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2CDCB81F66;
 Wed,  8 Jul 2026 11:07:17 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Etdm/WNWXhvVS0hxubyuPcVuqfSPsFcfKVqkhhCZa8s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ov12go/QGfWRIwqXV+z/4c2v8Qd/bNbrb2aW4fhvN35DNQw4P+oxStLiNyUbY6HlGdWM01kps
 KRPiFArnt6i5teLPN7aDX9iuIKd+4+Y2gDdPVWXH5L1xCf+yyZdzMNcB1DFRP2VLN/i7CnuDRy3
 k0U0oFNm/PCJgspwo7ikEvTsYnKB15ChJU6BPnDp4Djqizyg5J/jJbeoUdpD99YooymF4EQSONg
 kVigBTm0uJYef04hdJoG/Q4f3h3WWkmB9I9IhNJIv8I1Hx0i7m7na7BWBknBPgMEVXDn7yXl74/
 hyABfiJzhQWhYwp/D5FG5jcP/08jPF03/FFtJfSd8Oxg==
X-Zone-Loop: d7ec5fa8f0a535508fa2f6b3df34563b0fadbf2d67e3
x-campaign-type: default
x-transaction-id: cc419805-d7cb-4a48-89e0-b52462ae79fb
x-swg-uid: 01-c3321956-4051-4f6b-9b34-e287da15669e
X-Mailer: Sweego
Message-ID:
 <1783501637.8631fc262581453bbf619ec5b2062170.19f40fb48f800080a8@vates.tech>
x-swg-bid: 1783501637.8631fc262581453bbf619ec5b2062170.19f40fb48f800080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:07:16 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 01/16] libs/guest: Reduce number of parts in
 write_split_record
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-2-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-2-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3e0.e0b88e70214e28ac.19f40fb46cb.78d742502f8a6836=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783501637323
X-purgate-ID: tlsNG-16d1c6/1783501640-F89E968D-EC2B45A2/0/0
X-purgate-type: clean
X-purgate-size: 1112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73B8B723752

---=Part.3e0.e0b88e70214e28ac.19f40fb46cb.78d742502f8a6836=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 02:04:46PM +0100, Frediano Ziglio wrote:
> Small optimization=2E
> There's no much sense to split the header in 2 pieces, it will
> just take more time and space to reassemble them in the final
> buffer=2E
> This also avoids truncating combined_length to 32 bit in case of
> 64 bit machines potentially avoiding following record_length check
> (it could still be truncated writing it in xc_sr_rhdr structure
> but the following check will catch it)=2E
> The function become more coherent with following read_record
> function=2E
>=20
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3e0.e0b88e70214e28ac.19f40fb46cb.78d742502f8a6836=---

