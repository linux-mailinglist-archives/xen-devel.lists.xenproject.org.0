Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NCbAJVHJJ2rM2AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:05:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E965D8CD
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:05:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="meT1/0bd";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1332462.1594901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrSO-0004f4-Ao; Tue, 09 Jun 2026 08:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332462.1594901; Tue, 09 Jun 2026 08:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrSO-0004cm-8F; Tue, 09 Jun 2026 08:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1332462;
 Tue, 09 Jun 2026 08:05:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eab69dce0000701b@swg.vates.tech>)
 id 1wWrSN-0004cg-Dh
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:05:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWrSM-00CUma-C1
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:05:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eab69dce0000701b@swg.vates.tech>)
 id 6a27c92b-2eae-0a2a0a5409dd-0a2a450ccc24-34
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:05:06 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eab69dce0000701b@swg.vates.tech>)
 id 6a27c931-62f1-0a2a450c0019-b9ff1c12a1fb-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:05:06 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eab69dce0000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Jun 2026 08:05:02 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id 82BFE86C6F;
 Tue,  9 Jun 2026 10:05:01 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=rd806Osx2w9AasNfUkFkZyDhsJPinn6d2Q57doLPmBY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=meT1/0bdrxMDZks3TXvPaUmrqhougJtoFtEqyjFm6cM7u8MUM5UPO9DkwOdR6U/eyEALdJt5h
 gsD7EiGoA4FyPiEOE5GIt6oSjBC8wUXUFfQsRUHvvn2UUyHXb6UW5lIqqiDM3LLwCzDvOqfGFhx
 TnrchrbVBiyBwUTOWxaF8qCdSLiY9SofVFfv6Wx7qBv8o3pzPfGmC67BStynH1+Ne4GuFTqrjtF
 kzFHybDb9+bNl/rD4EW+z/Tu63shhUeKFH8omy5ZPxfo5Phydu5LzDhdQTXz+BgGiJnLzqT/2wq
 TUFDpN+Ag74UTZd7NPYMq6aPVokoK7S/djDodFxfsZjw==
X-Zone-Loop: 218cc3bbe88d29c5054f665f182faa8e6ff669edc285
x-campaign-type: default
x-transaction-id: be4f12a1-d346-4339-a868-d5c6e39295e7
x-swg-uid: 01-243b2b2a-38a5-4e31-aa2d-ba87bb147d36
X-Mailer: Sweego
Message-ID:
 <1780992302.8631fc262581453bbf619ec5b2062170.19eab69dce0000701b@vates.tech>
x-swg-bid: 1780992302.8631fc262581453bbf619ec5b2062170.19eab69dce0000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 9 Jun 2026 09:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: silence ocaml_deprecated_auto_include alert
To: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech
References: <20260609073635.9022-1-guillaume.thouvenin@vates.tech>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <20260609073635.9022-1-guillaume.thouvenin@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2387.a4a814a0d636be40.19eab69da92.1f6c8ee92d75490d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780992301714
X-purgate-ID: tlsNG-d25034/1780992306-F5386CF5-904AB249/0/0
X-purgate-type: clean
X-purgate-size: 1571
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[andriy.sultanov@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guillaume.thouvenin@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.sultanov@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 327E965D8CD

---=Part.2387.a4a814a0d636be40.19eab69da92.1f6c8ee92d75490d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6/9/26 08:36, Guillaume Thouvenin wrote:

> Ocaml's lib directory layout changed in 5=2E0: the unix and dynlink
> libraries have been moved out of the standard library directory into
> subdirectories=2E The compiler still locates them automatically but emit=
s
> an ocaml_deprecated_auto_include alert when doing so=2E
>
> This patch sets the paths explicitly with -I +unix and -I +dynlink to
> silence the alert=2E
>
> Signed-off-by: Guillaume Thouvenin <guillaume=2Ethouvenin@vates=2Etech>
> ---
>   tools/ocaml/common=2Emake | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tools/ocaml/common=2Emake b/tools/ocaml/common=2Emake
> index c7eefceeb4=2E=2E0e6714e25a 100644
> --- a/tools/ocaml/common=2Emake
> +++ b/tools/ocaml/common=2Emake
> @@ -11,6 +11,7 @@ OCAMLFIND ?=3D ocamlfind
>  =20
>   CFLAGS +=3D -fPIC -I$(shell ocamlc -where)
>  =20
> +OCAMLINCLUDE +=3D -I +unix -I +dynlink
>   OCAMLOPTFLAGS =3D -g -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F =
-warn-error F
>   OCAMLCFLAGS +=3D -g $(OCAMLINCLUDE) -w F -warn-error F
>  =20

Reviewed-by: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>
Tested-by: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>

Thank you!



-- 
Andriy Sultanov | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.2387.a4a814a0d636be40.19eab69da92.1f6c8ee92d75490d=---

