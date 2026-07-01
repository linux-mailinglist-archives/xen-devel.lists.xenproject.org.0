Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IflBESXdRGpG2QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:25:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF86EB957
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:25:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=H21TdT0t;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1349646.1607331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werCH-0004mf-9b; Wed, 01 Jul 2026 09:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349646.1607331; Wed, 01 Jul 2026 09:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werCH-0004l2-6g; Wed, 01 Jul 2026 09:25:33 +0000
Received: by outflank-mailman (input) for mailman id 1349646;
 Wed, 01 Jul 2026 09:25:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1cff582700080a8@swg.vates.tech>)
 id 1werCF-0004kw-0R
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:25:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1werCE-00AMwU-D2
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:25:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1cff582700080a8@swg.vates.tech>)
 id 6a44dd04-2eae-0a2a0a5409dd-0a2a450bbb34-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:25:30 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1cff582700080a8@swg.vates.tech>)
 id 6a44dd09-ac48-0a2a450b0019-b9ff1c22b30b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:25:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1cff582700080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 09:25:24 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6623286596;
 Wed,  1 Jul 2026 11:25:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=GfP310Kpdhr5fXTgBNrFPw8Ym4NNFGjbXcVTj6pOR0c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=H21TdT0tcMuCVnr0FeOW/Kxv30RMncF5D50w4EYh5sNMGqpjFZubpt+51r5sUchij2XrfpRzj
 7SasK9/vgDGZXAmhiPi+3/nNGipO/FCG02Ohucps5fr/NXD7tPPBePXURD2qDkIEX08tyzv0dz4
 OTIQ+Gzg1nBvVxK3DhEqmsxtDzb06baveqqfu1O8cIWaIHFOulUAvoglVDkcSkaKhngeu7z6iQu
 M8ok1t0zvcwk5QFM4OthCI1Q69E1rhOU1AhQuN2Sn/I4PKUtueUVMiuT7O3xoymZb3Vx3P/ssre
 /1opEl2XZO3wEgQ0AaPbf0ha3DVwvHycEa/GUh3HmL2A==
X-Zone-Loop: fb28e5638b9af2533d1de6c05be2a0bb672ba81daa1e
x-campaign-type: default
x-transaction-id: e4c81be3-4b9d-4cc5-9b91-f77009e839ef
x-swg-uid: 01-4a0fa403-ac9b-440c-9a53-ce443b45485c
X-Mailer: Sweego
Message-ID:
 <1782897924.8631fc262581453bbf619ec5b2062170.19f1cff582700080a8@vates.tech>
x-swg-bid: 1782897924.8631fc262581453bbf619ec5b2062170.19f1cff582700080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 1 Jul 2026 11:25:23 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9cc.84bee03019fb7e8c.19f1cff55cb.ade99102f6e41f7b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782897923532
X-purgate-ID: tlsNG-42698a/1782897930-3854C220-9FB4A023/0/0
X-purgate-type: clean
X-purgate-size: 835
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: C1BF86EB957

---=Part.9cc.84bee03019fb7e8c.19f1cff55cb.ade99102f6e41f7b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:01:41AM +0200, Jan Beulich wrote:
> --- a/tools/libs/light/libxl_flask=2Ec
> +++ b/tools/libs/light/libxl_flask=2Ec
> @@ -21,7 +21,8 @@ int libxl_flask_context_to_sid(libxl_ctx
>  {
>      int rc;
> =20
> -    rc =3D xc_flask_context_to_sid(ctx->xch, buf, len, ssidref);
> +    assert(len =3D=3D strlen(buf));

Could you return ERROR_INVAL instead? Just in case this is used by
something else than libxl, I'd rather not crash the application=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.9cc.84bee03019fb7e8c.19f1cff55cb.ade99102f6e41f7b=---

