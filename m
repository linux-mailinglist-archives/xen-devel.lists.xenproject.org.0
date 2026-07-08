Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yUPzKcVXTmrXKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:59:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3472704E
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:59:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=bnpU2Xus;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357061.1611564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSo3-0005dP-LH; Wed, 08 Jul 2026 13:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357061.1611564; Wed, 08 Jul 2026 13:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSo3-0005aw-Ia; Wed, 08 Jul 2026 13:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1357061;
 Wed, 08 Jul 2026 13:59:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8@swg.vates.tech>)
 id 1whSo2-0005aq-Hk
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:59:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSo1-000Jp1-UM
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:59:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8@swg.vates.tech>)
 id 6a4e57b1-5cb7-0a2a0a5109dd-0a2a45088f14-22
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:59:17 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8@swg.vates.tech>)
 id 6a4e57b5-edec-0a2a45080019-b9ff1c12a26b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:59:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4206944f00080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 13:59:15 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 972EF80A0E;
 Wed,  8 Jul 2026 15:59:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=1m1kfCg3diTsIFrGX2705amfVpZRIDk/mxfHERcK57k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bnpU2XuslRE1m69FuA6U5BWQvyN6xbk/ZPnDOTgNMOr92sJWGEsVmb8D9KOGJbxHIecb0P1or
 a5vSn1qgPkcgGF8BZeiZp8vQlZuLMKDgcbkqLzsNEXf525U7FWUxQ2z8rd7UlaKNik5sMYVLJ8T
 pUuXBbBbKZfQAFvfndYHf5e6vNplVQqGzGDbJu82VndlSNsuC4EO4dPoRRqJ1xiiX4bDZRhuqpa
 kBbgqyXYbMraLRzx0bxcM4dopQ1zjtIp5wukkFzVnQIZsPNxg8A9GZhzayP3nu1+n/qFP0NldQy
 lN7EqtmNeSmZaQtrRwiDdv5OFqWsjOK9EvFyyGQW3Bmw==
X-Zone-Loop: 2ec0a063ae0956d05e9566f8647c4c1f7690c8a69968
x-campaign-type: default
x-transaction-id: 2ee19b2d-22df-4aa8-a9be-734a7cb9db1b
x-swg-uid: 01-60c75314-bfbc-46c2-b947-e9ca88e33080
X-Mailer: Sweego
Message-ID:
 <1783519155.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8@vates.tech>
x-swg-bid: 1783519155.8631fc262581453bbf619ec5b2062170.19f4206944f00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 15:59:14 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 13/16] privcmd: Add definition for new Linux privcmd
 to access new Xen hypercall
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-14-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-14-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.430.744bfcd61c1ad16b.19f42069258.7ad6f9a5f18125ba=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783519154776
X-purgate-ID: tlsNG-c1860d/1783519157-A39353FC-ABDA58E5/0/0
X-purgate-type: clean
X-purgate-size: 1813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
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
X-Rspamd-Queue-Id: 4AD3472704E

---=Part.430.744bfcd61c1ad16b.19f42069258.7ad6f9a5f18125ba=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 02:04:58PM +0100, Frediano Ziglio wrote:
> diff --git a/tools/include/xen-sys/Linux/privcmd=2Eh b/tools/include/xen=
-sys/Linux/privcmd=2Eh
> index 607dfa2287=2E=2E7a3c41308b 100644
> --- a/tools/include/xen-sys/Linux/privcmd=2Eh
> +++ b/tools/include/xen-sys/Linux/privcmd=2Eh
> @@ -100,6 +100,14 @@ typedef struct privcmd_pcidev_get_gsi {
>  	__u32 gsi;
>  } privcmd_pcidev_get_gsi_t;
> =20
> +typedef struct privcmd_foreigncopy {
> +	domid_t dom;          /* Foreign domain=2E */
> +	__u16 dir;            /* Direction,  0 from, 1 to=2E */
> +	__u32 num;            /* Number of pages to copy=2E */
> +	const xen_pfn_t __user *pfns; /* Array of pfns=2E */
> +	void __user *buffer;  /* Buffer to copy to/from=2E */
> +} privcmd_foreigncopy_t;
> +
>  /*
>   * @cmd: IOCTL_PRIVCMD_HYPERCALL
>   * @arg: &privcmd_hypercall_t
> @@ -121,6 +129,8 @@ typedef struct privcmd_pcidev_get_gsi {
>  	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
>  #define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
>  	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
> +#define IOCTL_PRIVCMD_FOREIGNCOPY				\
> +	_IOWR('P', 11, privcmd_foreigncopy_t)
>  #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
>  	_IOC(_IOC_NONE, 'P', 0xFF, 0)
> =20

I don't think I can accept this patch until the changes have been added
to Linux=2E Also, I think it would be fine to squash this
changes into the patch that start using this new hypercall=2E


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.430.744bfcd61c1ad16b.19f42069258.7ad6f9a5f18125ba=---

