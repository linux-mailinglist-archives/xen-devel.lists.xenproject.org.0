Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 20NdESmMV2rKWgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:33:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF3975EB94
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:33:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="LbVCv/pa";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1363079.1614909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzit-00054U-KM; Wed, 15 Jul 2026 13:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363079.1614909; Wed, 15 Jul 2026 13:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzit-00052E-HG; Wed, 15 Jul 2026 13:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1363079;
 Wed, 15 Jul 2026 13:32:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5@swg.vates.tech>)
 id 1wjzir-000528-H8
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:32:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjziq-0039RC-Lm
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:32:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5@swg.vates.tech>)
 id 6a578bd9-5cb7-0a2a0a5109dd-0a2a4501a052-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:32:24 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5@swg.vates.tech>)
 id 6a578be8-5984-0a2a45010019-b9ff1c12a039-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:32:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f65fa7df1000edb5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 13:32:22 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2C03A82227;
 Wed, 15 Jul 2026 15:32:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BEtayOb+VvUwy9P6LoGVuc4PhAut7kLpQMxrozWQyeM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LbVCv/paijkzsmvtDpJQMuKcUymSh3ON7cnDEl5bh+MQfq0+8SDL4pvAAkREGS+99+qmfHuh0
 buI5VbmKfCgmL88C8cVd0rzg1DG+wQ0dZs8ocQs9KWt4tw7/1JG5POJIDTaGeTEcVGFTYQ2CNod
 fHb8cB0RQ65DdOvEZvfeVtl2GNJi8+t/hhKSEXSYYC4hwUbyZThGv0kEwI42jPf2TMLlWgT2Qqm
 4cBv47g6dSsAlsoOLaj3j9yl/bqAryvbMhuU/yPhKSd5O9UzBcMUN2RUK7ciYmN8QJ9f6lFmN5e
 Upr5OkPM5e2J2xHOBhpxvnPDn2pxHcBsU7QMcesYC3KQ==
X-Zone-Loop: 6bffdd597665c395f4d5f789d6ac4ad77bf78e30eb08
x-campaign-type: default
x-transaction-id: 9c80ce74-408b-4c0e-b7e4-7ca891a73572
x-swg-uid: 01-74635579-f788-4c0f-b564-c9fe9ac50c36
X-Mailer: Sweego
Message-ID:
 <1784122342.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5@vates.tech>
x-swg-bid: 1784122342.8631fc262581453bbf619ec5b2062170.19f65fa7df1000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 15 Jul 2026 15:32:21 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v9 4/4] libs/guest: use Valgrind to detect various buffer
 overflows
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
 <20260713204802.105115-5-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713204802.105115-5-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.887.b73258ecbeb7d5db.19f65fa7ba7.8ef4226bdd5936ec=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784122342312
X-purgate-ID: tlsNG-d62444/1784122344-1EE60757-FB16FEBC/0/0
X-purgate-type: clean
X-purgate-size: 3663
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:from_mime,vates.tech:mid,vates.tech:url];
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
X-Rspamd-Queue-Id: 8EF3975EB94
X-Rspamd-Action: no action

---=Part.887.b73258ecbeb7d5db.19f65fa7ba7.8ef4226bdd5936ec=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 09:48:02PM +0100, Frediano Ziglio wrote:
> --- a/tools/libs/ctrl/xc_private=2Eh
> +++ b/tools/libs/ctrl/xc_private=2Eh
> @@ -45,8 +45,16 @@
>  #if defined(HAVE_VALGRIND_MEMCHECK_H) && !defined(NDEBUG) && !defined(_=
_MINIOS__)
>  /* Compile in Valgrind client requests? */
>  #include <valgrind/memcheck=2Eh>
> +#define MEM_NOACCESS_BUFFER(name, size) uint8_t name[size];
> +#define MEM_NOACCESS_INIT(field) \
> +    VALGRIND_MAKE_MEM_NOACCESS(field, sizeof(field))
> +#define MEM_UNDEFINED_INIT(field) \
> +    VALGRIND_MAKE_MEM_UNDEFINED(field, sizeof(field))
>  #else
>  #define VALGRIND_MAKE_MEM_UNDEFINED(addr, len) /* addr, len */
> +#define MEM_NOACCESS_BUFFER(name, size)
> +#define MEM_NOACCESS_INIT(field) do {} while(0)
> +#define MEM_UNDEFINED_INIT(field) do {} while(0)

Why the _INIT suffix in the macros? It looks like something is
initialised, but that's not the case=2E

We could follow the valgrind naming and do, while using something
different than "mem" to say we don't need a size:
make_buffer_noaccess and make_buffer_undefined

Or
mark_buffer_as_noaccess
mark_buffer_as_undefined


>  #endif
> =20
>  #if defined(__MINIOS__)
> diff --git a/tools/libs/guest/xg_sr_common=2Eh b/tools/libs/guest/xg_sr_=
common=2Eh
> index c07c6db59e=2E=2Ed3fc7f363e 100644
> --- a/tools/libs/guest/xg_sr_common=2Eh
> +++ b/tools/libs/guest/xg_sr_common=2Eh
> @@ -245,13 +245,21 @@ struct xc_sr_context
>              xc_hypercall_buffer_t dirty_bitmap_hbuf;
>              struct xc_sr_context_save_buffers
>              {
> +                MEM_NOACCESS_BUFFER(na0, 16);

This first redzone buffer and the last (na7) one looks unnecessary, as
they are before the beginning of the buffer, and after the end=2E

>                  xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na1, 16);
>                  xen_pfn_t mfns[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na2, 16);
>                  xen_pfn_t types[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na3, 16);
>                  void *local_pages[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na4, 16);
>                  struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data=
=2E */
> +                MEM_NOACCESS_BUFFER(na5, 16);
>                  uint64_t rec_pfns[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na6, 16);
>                  int errors[MAX_BATCH_SIZE];
> +                MEM_NOACCESS_BUFFER(na7, 16);
>              } *buffers;
>          } save;
> =20
> diff --git a/tools/libs/guest/xg_sr_save=2Ec b/tools/libs/guest/xg_sr_sa=
ve=2Ec
> index 6a77e33a47=2E=2E25561e369f 100644
> --- a/tools/libs/guest/xg_sr_save=2Ec
> +++ b/tools/libs/guest/xg_sr_save=2Ec
> @@ -123,6 +123,11 @@ static int write_batch(struct xc_sr_context *ctx)
>      assert(nr_pfns !=3D 0);
>      assert(nr_pfns <=3D MAX_BATCH_SIZE);
> =20
> +    MEM_UNDEFINED_INIT(ctx->save=2Ebuffers->mfns);
> +    MEM_UNDEFINED_INIT(ctx->save=2Ebuffers->types);
> +    MEM_UNDEFINED_INIT(ctx->save=2Ebuffers->iov);
> +    MEM_UNDEFINED_INIT(ctx->save=2Ebuffers->rec_pfns);

Why is errors not also marked as undefined?

To bad we can't really test this patch, beside check that it build=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.887.b73258ecbeb7d5db.19f65fa7ba7.8ef4226bdd5936ec=---

