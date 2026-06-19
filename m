Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z7+iI6ZuNWrswAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 18:30:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEE6A70FA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 18:30:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=mE9v+eQW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1342546.1602659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wac6i-0002Be-UD; Fri, 19 Jun 2026 16:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342546.1602659; Fri, 19 Jun 2026 16:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wac6i-00028s-RU; Fri, 19 Jun 2026 16:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1342546;
 Fri, 19 Jun 2026 16:30:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee0b7f241000701b@swg.vates.tech>)
 id 1wac6h-00028m-0x
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wac6g-00GB15-AP
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 18:30:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee0b7f241000701b@swg.vates.tech>)
 id 6a356e6e-e002-0a2a0a5209dd-0a2a4509ec52-34
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 18:30:14 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee0b7f241000701b@swg.vates.tech>)
 id 6a356e96-4999-0a2a45090019-b9ff1c128be9-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 18:30:14 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ee0b7f241000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 16:30:12 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4E349861D7;
 Fri, 19 Jun 2026 18:30:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bbq4gvKEHDZTNICtPqD6uBIUQgSMoWpHQn8aWlzMCSQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=mE9v+eQWCSru3ypGAbhMzC04vQ0fKctuxTimCF55e80Loa0nePcMxX/oBLLrE4unxOHzRVaoO
 dG/KbStfbxrskD88CTW9FD1zvu3r0ZDooDBl20yo/P6xPLmBxv3im81/m4dRDqilApZGtdN3UGg
 pwjK3uO6hQzjIbmzQqihS0goTkTvzkv1rSR61/9L8YFQgRD3veFN3BYY+l/s+NLghqIlF2Qsr+A
 HcO0kLQU9s1aaeiLD6Q7PoPrMJn5ZcBkICz3uGY7P8B5j4i17ZjC1iTfHq4nmFkaZdIY14s7Rag
 ZA5tTDjszhNRhRTUMBUmS62ysWc6YDbDe0+ooF15IA0g==
X-Zone-Loop: c9ef68272148062806fdd21cbe29ac119e7daab80f97
x-campaign-type: default
x-transaction-id: d630184d-62e7-4676-bb26-42f4b80e014f
x-swg-uid: 01-9433ec78-cc4a-4644-a92c-9e0606dc1fa1
X-Mailer: Sweego
Message-ID:
 <1781886612.8631fc262581453bbf619ec5b2062170.19ee0b7f241000701b@vates.tech>
x-swg-bid: 1781886612.8631fc262581453bbf619ec5b2062170.19ee0b7f241000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 19 Jun 2026 18:30:10 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 17/17] docs: provide description for device_model_machine
 option
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-18-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-18-thierry.escande@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.7a8.f5d6270f62284ec0.19ee0b7efc5.5c4aed100456ed4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781886611397
X-purgate-ID: tlsNG-bad1c0/1781886614-F61FB744-22CF8755/0/0
X-purgate-type: clean
X-purgate-size: 3167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.18 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5AEE6A70FA

---=Part.7a8.f5d6270f62284ec0.19ee0b7efc5.5c4aed100456ed4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
> This patch adds description for 'device_model_machine' option which allo=
ws
> to control which chipset will be emulated by device model=2E
>=20
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
> ---
>  docs/man/xl=2Ecfg=2E5=2Epod=2Ein | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein b/docs/man/xl=2Ecfg=2E5=2E=
pod=2Ein
> index 27c455210b=2E=2E67a5bc54a5 100644
> --- a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
> +++ b/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
> @@ -2963,6 +2963,33 @@ you have existing guests then, depending on the n=
ature of the guest
>  Operating System, you may wish to force them to use the device
>  model which they were installed with=2E
> =20
> +=3Ditem B<device_model_machine=3D"STRING">
> +
> +Selects which chipset the device model should emulate for this
> +guest=2E
> +
> +Valid options are:
> +
> +=3Dover 4
> +
> +=3Ditem B<"i440">
> +
> +Use i440 emulation (a default setting)

Just "(default)" or even nothing is fine too=2E

I don't think we can say "i440" here, QEMU code always reference to it
as "i440FX", and if you want to specify the south bridge like you do
below, it would be "i440FX/PIIX3"=2E

> +
> +=3Ditem B<"q35">
> +
> +Use Q35/ICH9 emulation=2E This enables additional features for
> +PCIe device passthrough

Could you add a full stop, to finish the sentence?

> +=3Dback
> +
> +Note that omitting device_model_machine parameter means i440 system
> +by default,

Just saying "The default is B<"i440fx"> should be enough=2E No need to
explain when a default is selected=2E

> so the default behavior doesn't change for old domain
> +config files=2E

I don't think this explanation belong here=2E

> +It is recommended to install the guest OS from scratch to avoid issues
> +due to the emulated platform change=2E

I don't think this belong to the man page because they are other setting
that could prevent a guest from booting, when changed=2E Also I don't
think Linux cares=2E I'm not sure saying that changing this particular
setting could break existing guest would be a useful addition to this
particular setting description, as I'm sure that also true to quite a
few other settings=2E

On the other hand, there's a warning for `device_model_version`, about
existing guest, and default value that have changed=2E

So it's probably good enough to say that changing this new setting could
prevent existing guest from booting, and a fresh new installation
might be needed=2E

Also installing Linux From Scratch would be quite and endeavor :-)
  https://www=2Elinuxfromscratch=2Eorg/


Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.7a8.f5d6270f62284ec0.19ee0b7efc5.5c4aed100456ed4=---

