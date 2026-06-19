Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QCPpACNINWqurAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:46:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397166A629E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:46:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=YlyXsJvX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1342351.1602577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZXW-0008J8-9h; Fri, 19 Jun 2026 13:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342351.1602577; Fri, 19 Jun 2026 13:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZXW-0008Hi-7A; Fri, 19 Jun 2026 13:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1342351;
 Fri, 19 Jun 2026 13:45:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee0215b2d000701b@swg.vates.tech>)
 id 1waZXV-0008Hc-FN
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:45:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waZXU-002yBp-Pu
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:45:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee0215b2d000701b@swg.vates.tech>)
 id 6a3547f5-5cb7-0a2a0a5109dd-0a2a4508e248-38
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:45:44 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee0215b2d000701b@swg.vates.tech>)
 id 6a354808-9ee7-0a2a45080019-b9ff1c12b04b-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:45:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ee0215b2d000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 13:45:42 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2E98D86A6F;
 Fri, 19 Jun 2026 15:45:42 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9YT4RIrO0mZvEc4hQ9O06VEVS0oqjoPN6ealZiV5quk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=YlyXsJvXNUilN5SyOQVMMp0oNHYJ0+hpN2S8F3J3xXhM0aEoCKFkICzeupiQlpuxLXx9ohwEv
 lAtCVnkXHVLesXrCc6+Lv99laq4aYRGvpF3LUHuie2/IyNPvo2tAOxItZgjoVPxozHSGoFTpmnA
 BrBv8jbSb3f+FR3v928zlmoIfqwosSQ31NNhRCymd9c31wt7oK/9ozN9L/S+xse2Zcmb/y80sDi
 auT6ONFqtDoB/T3nyhY4UNQxg501wVujliSaaGFxWunLiWEXpUz7HYs2nxS4rF3xtmNXonfH6d4
 XrSPjgCC9AeqlmIka7c6RsSgx/uAcg8BMMvuiWYB2DdQ==
X-Zone-Loop: d80133f7a589d14c567c24d948e67cae869b0602c4a9
x-campaign-type: default
x-transaction-id: 9f1936b8-1ec1-41d4-96ad-46b9e0f42cb0
x-swg-uid: 01-28893718-afba-46ca-a52c-3394a3d40e33
X-Mailer: Sweego
Message-ID:
 <1781876743.8631fc262581453bbf619ec5b2062170.19ee0215b2d000701b@vates.tech>
x-swg-bid: 1781876743.8631fc262581453bbf619ec5b2062170.19ee0215b2d000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 19 Jun 2026 15:45:41 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 12/17] libxl: Q35 support (new option
 device_model_machine)
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-13-thierry.escande@vates.tech>
 <afHXEvXrGQhrU0c_@macbook.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afHXEvXrGQhrU0c_@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.780.9fe3342dba891db8.19ee02158bb.a79e33dc338eea62=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781876742332
X-purgate-ID: tlsNG-c1860d/1781876744-666590FA-594513C2/0/0
X-purgate-type: clean
X-purgate-size: 3085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:x1917x@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,lists.xenproject.org,suse.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 397166A629E

---=Part.780.9fe3342dba891db8.19ee02158bb.a79e33dc338eea62=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 12:01:54PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> > Provide a new domain config option to select the emulated machine type=
,
> > device_model_machine=2E It has following possible values:
> > - "i440" - i440 emulation (default)
> > - "q35" - emulate a Q35 machine=2E By default, the storage interface i=
s
> > AHCI=2E
> >=20
> > Note that omitting device_model_machine parameter means i440 system
> > by default, so the default behavior doesn't change for existing domain
> > config files=2E
> >=20
> > Setting device_model_machine to "q35" sends '-machine q35,accel=3Dxen'
> > argument to QEMU=2E Unlike i440, there is no separated machine type to
> > enable/disable Xen platform device, it is controlled via a machine
> > property only=2E See 'libxl: Add xen-platform device for Q35 machine'
> > patch for a detailed description=2E
>=20
> Not an explicit objection to this patch, but I wonder what will we do
> for PVH when we start exposing PCI devices=2E  We cannot provide a fully
> complete emulated Q35, but we do need to expose an MCFG for extended
> config space=2E  The current naming "device_model_machine" won't work
> for PVH, as there's no device model there=2E  But at the same time I
> wonder whether what we end up exposing to PVH would resemble any
> physical chipsets, or it's more likely going to be the minimum needed
> to make PVH guests happy to access the PCI config space (and hence we
> might end up emulating too little to match any chipset)=2E

I feel like we are going to want two different settings between HVM and
PVH=2E  On PVH, the exposure of MCFG could be done by default, or if a
setting is needed and happen to be useful to HVM, we could make that new
setting for both HVM and PVH, and that new setting could select the q35
machine if none are selected or it could reject the config if q35 isn't
selected as well=2E  That sentence might be overly complicated, but I just
mean that "device_model_machine" is fine for now, and will see what we
do when a new setting would be introduced for PVH=2E

> >  libxl_console_type =3D Enumeration("console_type", [
> >      (0, "UNKNOWN"),
> >      (1, "SERIAL"),
> > @@ -613,6 +619,7 @@ libxl_domain_build_info =3D Struct("domain_build_i=
nfo",[
> >      ("device_model_ssidref", uint32),
> >      ("device_model_ssid_label", string),
> >      ("device_model_user", string),
> > +    ("device_model_machine", libxl_device_model_machine),
>=20
> This possibly wants to be inside the u=2Ehvm sub-structure=2E  I don't
> think we want to use it for PVH, not with this current naming at
> least=2E

Good suggestion=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.780.9fe3342dba891db8.19ee02158bb.a79e33dc338eea62=---

