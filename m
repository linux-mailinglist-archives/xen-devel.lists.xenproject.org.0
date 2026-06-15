Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nAGaJywlMGptOwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 18:15:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02668837E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 18:15:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=WH1VXjVy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1338440.1599471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9y3-0003bK-F8; Mon, 15 Jun 2026 16:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338440.1599471; Mon, 15 Jun 2026 16:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9y3-0003Yb-CO; Mon, 15 Jun 2026 16:15:19 +0000
Received: by outflank-mailman (input) for mailman id 1338440;
 Mon, 15 Jun 2026 16:15:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ9y1-0003YV-9S
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ9y0-001JHn-ET
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:15:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecc10bc48000701b@swg.vates.tech>)
 id 6a302513-e002-0a2a0a5209dd-0a2a450cbb4e-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:15:16 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecc10bc48000701b@swg.vates.tech>)
 id 6a302513-62f1-0a2a450c0019-b9ff1c12936d-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:15:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ecc10bc48000701b.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 15 Jun 2026 16:15:09 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A2FEA818B6;
 Mon, 15 Jun 2026 18:15:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=OYOIGxGcHVN6InOJfYQfIcc9nvmgnwhfCBtvYs8fbw0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=WH1VXjVyNuQ7RYbO9ZaU6ezTb5H49aNl+pHa3VXQKvCYt7dPSsL17yzDOndgrk2AO1LSunag8
 G58ahorGA5FWeZ4fvWREgUY4BZbgklJli+pwFs/V6cMSuRKfU6x0JTf/7I5g/T2BCVMFHwUqH2a
 DVUH6zWEgEn34bTKNfupxhsQlPKydu6m9A5wWEKzWxFjH5EqDj3kbhqBzEAzyhjjS/UaUZzoEe2
 0itXXEoRP4R8u4ck5e+1s8PS28xKh1TtO/x//ROKZATuQm8ci3OpgNyyUaJYHuocl4IBXDLorrD
 bcKVsarWiSmojuIMaF5yM8UzeFF08i/ZOZSkE3l0+ZZg==
X-Zone-Loop: 9d251205c7d39f2f4eeb3839cffe39afdbeb82faefe1
x-campaign-type: default
x-transaction-id: 6bbc0cd9-0b58-4965-be1e-f81b437fb5bc
x-swg-uid: 01-d9831a92-59c8-44b6-b11d-180a02fcbf45
X-Mailer: Sweego
Message-ID:
 <1781540109.8631fc262581453bbf619ec5b2062170.19ecc10bc48000701b@vates.tech>
x-swg-bid: 1781540109.8631fc262581453bbf619ec5b2062170.19ecc10bc48000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 15 Jun 2026 18:15:08 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/7] tools/xenalyze: Work around GCC-15 -Werror=nonnull
 false positive
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
 <20260612230924.3181154-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612230924.3181154-2-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2c1.85abe5221e4de6c0.19ecc10ba14.7e9442218251a525=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781540108821
X-purgate-ID: tlsNG-d25034/1781540116-E2368CF5-9519D6AD/10/73395122804
X-purgate-type: spam
X-purgate-size: 2869
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,amd.com,cardoe.com,citrix.com,invisiblethingslab.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,cardoe.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,invisiblethingslab.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B02668837E

---=Part.2c1.85abe5221e4de6c0.19ecc10ba14.7e9442218251a525=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 12:09:18AM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> ---
> CC: Anthony PERARD <anthony=2Eperard@vates=2Etech>
> CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
> CC: Michal Orzel <michal=2Eorzel@amd=2Ecom>
> CC: Doug Goldstein <cardoe@cardoe=2Ecom>
> CC: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=2Ecom>
> CC: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>
>=20
> I don't particularly like this, but I see no better option=2E  It's clea=
rly some
> kind of VRA failure, yet we don't see it with GCC 15 in other distros=2E=
  I
> suspect that Musl (as opposed to glibc) might be relevant, and perhaps e=
ven as
> simple as not realising that error() is terminal for a non-zero input=2E

While it's true in this case, maybe it's a bit too complicated for gcc
to find out? error() is terminal only if the first argument is greater
than opt=2Etolerance, but there's a check that it can't be too high (when
parsing options) and ERR_SYSTEM is above that=2E

If I do that:

     void error(enum error_level l, struct record_info *ri)
     {
    -    if ( l > opt=2Etolerance )
    +    if ( l > opt=2Etolerance || l > ERR_MAX_TOLERABLE)

gcc seems happy enough=2E

And I've notice the compilation error only happens with `debug=3Dn`=2E

What do you thing of changing the error() function instead of hidding
NULL-less of the pointer?

> ---
>  tools/xentrace/xenalyze=2Ec | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/tools/xentrace/xenalyze=2Ec b/tools/xentrace/xenalyze=2Ec
> index 876d59d42ca5=2E=2Ecec1354cf779 100644
> --- a/tools/xentrace/xenalyze=2Ec
> +++ b/tools/xentrace/xenalyze=2Ec
> @@ -3789,6 +3789,17 @@ void update_io_address(struct io_address ** list,=
 unsigned int pa, int dir,
>              error(ERR_SYSTEM, NULL);
>          }
> =20
> +        /*
> +         * GCC 15=2E2 in Alpine Linux 3=2E24 fails with -Werror=3Dnonnu=
ll,
> +         * complaining that we're calling bzero(NULL, 128)=2E
> +         *
> +         * This looks to be a false positive as p being NULL will never=
 reach
> +         * here as the error() above will have called exit()=2E
> +         *
> +         * Work around this by hiding the NULL-ness of p from the compi=
ler=2E
> +         */
> +        asm ("" : "+r" (p));
> +
>          bzero(p, sizeof(*p));
> =20
>          p->pa=3Dpa;


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2c1.85abe5221e4de6c0.19ecc10ba14.7e9442218251a525=---

