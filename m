Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLxvNKCe52ml+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:58:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D643D078
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289147.1569349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDUH-0005tk-Bb; Tue, 21 Apr 2026 15:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289147.1569349; Tue, 21 Apr 2026 15:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDUH-0005rm-8d; Tue, 21 Apr 2026 15:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1289147;
 Tue, 21 Apr 2026 15:58:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373@swg.vates.tech>)
 id 1wFDUF-0005rg-Vp
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:58:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFDUE-000C16-Sz
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 17:58:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373@swg.vates.tech>)
 id 69e79e8e-e002-0a2a0a5209dd-0a2a450bb83c-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:58:06 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373@swg.vates.tech>)
 id 69e79e8e-212f-0a2a450b0019-b9ff1c22b133-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:58:06 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db0c3520e000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 21 Apr 2026 15:58:03 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2C0D487412;
 Tue, 21 Apr 2026 17:58:03 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=JM13Gw6w4R8wxXoYrniZxEvDfakgM/fcbZGm4Wqt84Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DjgDaKtqMpeUdTKKNsz0krM6fmHvC6pX4SOuaKVn6pC6waPb+MHXO4m9io/fUMdGl1ULp/BJw
 yHxc2hiPxa2/ezvRpb3TeAyHg7PoOeuu2MyQOhH2z+wj0S8LXP16SEOO2VXvXElvZu/WyZ5zor5
 juHIh05S1G9Tv0zsbhMyAVowfiwYh80SuD2lGBjpsmW62BO3bpO0dcDOchHpHYBwp5/2C+kvrLv
 E/E8pn+p+D4fK5sJplDePNJEixZPlK+673f2lyjQqreVq39AZuCi3xAUeSEsXe7GYJ1404LM+Yj
 zvIjrSMkJI8KeNszxrB1IsPhw3n7NPioYplHiyPABV+g==
X-Zone-Loop: b1bbe22708f74e1c3708b643a51d8294da5fa711da23
x-campaign-type: default
x-transaction-id: 3dc07649-3f99-4fd7-a025-5116eac5ece5
x-swg-uid: 01-0f43bdf8-a9db-44b2-b510-442e6f416311
X-Mailer: Sweego
Message-ID:
 <1776787083.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373@vates.tech>
x-swg-bid: 1776787083.8631fc262581453bbf619ec5b2062170.19db0c3520e000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 21 Apr 2026 17:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20260421153224.36368-1-roger.pau@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <20260421153224.36368-1-roger.pau@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.24d7.5d37ca5e4ae1a4ca.19db0c34ff1.5ebb0072a08026e5=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776787083250
X-purgate-ID: tlsNG-42698a/1776787086-0415DF3B-727D99DF/0/0
X-purgate-type: clean
X-purgate-size: 1507
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.596];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 806D643D078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.24d7.5d37ca5e4ae1a4ca.19db0c34ff1.5ebb0072a08026e5=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21/04/2026 =C3=A0 17:36, Roger Pau Monne a =C3=A9crit=C2=A0:
> ENODATA is not defined on FreeBSD:
>=20
> xenpm=2Ec:1380:17: error: use of undeclared identifier 'ENODATA'
>   1380 |         errno =3D ENODATA;
>        |                 ^
> 1 error generated=2E
>=20
> Fixes: edb657887a60 ("xenpm: Add get-core-temp subcommand")
> Signed-off-by: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>
> ---
>   tools/misc/xenpm=2Ec | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/misc/xenpm=2Ec b/tools/misc/xenpm=2Ec
> index 87107bd6c617=2E=2Eecb39c911d84 100644
> --- a/tools/misc/xenpm=2Ec
> +++ b/tools/misc/xenpm=2Ec
> @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint3=
2_t cpu, bool package, int *te
>       {
>       case 0:
>           /* This CPU isn't online or can't query this MSR */
> -        errno =3D ENODATA;
> +        errno =3D ENODEV;
>           return -1;
>  =20
>       case 1:

I wasn't aware ENODATA wasn't available on some BSDs=2E Even though it's=
=20
supposed to be a part of POSIX=2E

Regardless,
Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.24d7.5d37ca5e4ae1a4ca.19db0c34ff1.5ebb0072a08026e5=---

