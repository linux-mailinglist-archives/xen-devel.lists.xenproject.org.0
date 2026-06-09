Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V1NfE0vUJ2oq3AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:52:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A019365DFC1
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z8MWdNDM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332509.1594955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsBu-0006tw-UV; Tue, 09 Jun 2026 08:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332509.1594955; Tue, 09 Jun 2026 08:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsBu-0006rl-RU; Tue, 09 Jun 2026 08:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1332509;
 Tue, 09 Jun 2026 08:52:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wWsBt-0006re-Lm
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:52:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsBs-00FYRf-Jr
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:52:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27d436-2eae-0a2a0a5409dd-0a2a4507bc48-12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:52:08 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27d437-229c-0a2a45070019-4a7de02de45d-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:52:08 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-65eb226b1ceso4611668d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:52:08 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780995127; cv=none;
        d=google.com; s=arc-20240605;
        b=QUC4RL9rq7dRLzK9jV3gF6xfP/+qyXJxDhd3iiJfEAhJxlPGXETL9utWdqhzI5GmSM
         oB4ElFmDwSna9KttJWY6bJ8fIFT9g5pa2EQEOTKWh2xpbZhROpe1icCa2ldJygGVogKE
         UOJz8tdlVojYbUyH+0Fg6RhkTrVTW2QshGLCuX4vEbABJQvNQ7uZc93/qVbDQB8mut3m
         /F5uV2nJyOweR6xsKj0+vG2jtuO3CSSWpx/b8UtmdI+HznAG1jThCiy9wmTXgwC4ctEm
         3MBoSepvUpa4Swdt9yph17+BUmrAakt4b+2j0lOD+bXkTilwAISpmb2kL/UphpsDvzH0
         MxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Er2R3gbnmDendo5sBfgNlVkxlFyRC1D78U9qSxQgTKg=;
        fh=bz012bFXXMSWKBVgaOsf9BhRnV5smxYP7I+E9Nd6XyE=;
        b=jx+TQRCuu1OJGwh1BSrz+m350vuOBDxs0BzKe/ry58oY5DOemiCEpg8TwZEG6utZ9B
         VBqzq2/zsyKfyv3FzT2E61xQpGhDqhPde4TG6P+ohfiVUFTo6gHNT5reg1ePMzxcQdk6
         HIaC6H9LEKc7nZoXo5ILQBzbwT4OgPpZQ2Tpc9xG8EFraSBOquyMocmL2AjbrK7gkUpj
         63DSb295qELCY2Tg1sJvf4tkXZY3u8QS2Qm9IRUeqX38yefBEl9s0fO13yHMM/cblUMQ
         E2p5OCtSreDGbkMqdcXaEKFf+CwHzV9aQ5KJ8ZMUHRZDi/tnBkJteUHMRoFsXdoGRqCM
         gmuA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995127; x=1781599927; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er2R3gbnmDendo5sBfgNlVkxlFyRC1D78U9qSxQgTKg=;
        b=Z8MWdNDM+hwVixvIqJ6E8lvOvQTCLZweRiK6SLD7MUxH3VZNakBUaMqRxdawOy0P00
         8Z5QOZ89fBMXN8MoDvATP4ARc4BvNpXWa5sucwaRpneRHaey+uvR0rwAEnyYPfJ5CJTn
         u+UdcRWvJyDp5ZEuGQ8prhQXWVCmARZyXWjQeOXwke2DyJc5LKwGdqV9t5jzLL5IejuZ
         Ii2NGDA18u68nUqIvmTaDXS3LrZe0BBRjnamEaiSrpge6+nnM2FjhJUie8/8NgGndaSM
         EEklgW2BEXcQa9MS9F9yd2auAnf9kUG73WULQSdrA48SbAv+DtElu0JxEumP19Rpz/TY
         5rcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995127; x=1781599927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Er2R3gbnmDendo5sBfgNlVkxlFyRC1D78U9qSxQgTKg=;
        b=RxsIq8Ci5GMPAJOtmsiqrDPFvhA1uNOFalbH4EsWjlstXJh/jNAJka9iAHTS3sJV0k
         q5YZ2cm241E9JVNi3HySWyImezS+OO8o/fqQhGUZuYOVsx8I20nn1xM0MCCJ5KFY36Qm
         WaBTiHWMiJ4A2CEVsb4+/A/7Z8DLjU7foNIIc7ad8nZluVbfLcdqh+1egC+OFpOlHXLs
         1bOWdkKtH8qCSvZpBm8K90W6SUgYy7hjg7SaUIegkFwcgqcDgqfl4BsSZY+gSJ2GfKFn
         K6cFbPdi2B1YLwfNDaHuyRldFiPX1pn/jUHD3qUNCEjHZ542JoulEAe8JrFZ7YghM7yp
         1PfA==
X-Gm-Message-State: AOJu0YzN+ByTejz1a6S2b1f8+VFk9kU1DKzcnUaqNKkuOizyilSAmrNE
	8qdCk3TLropPqTPEOk0jbS0KyknYQjComjNj7SEP95JiGEFrLeFW7UgAc44LqoLwcsaO9qYMK10
	vTYl4rG3eIf4/jxflWT4lDPclx4MVKkc=
X-Gm-Gg: Acq92OFXlFLvGYbrNIS3U/FFJ70t74MbzPjdyISecjExWGUb1gVeHo+ihh3Y3B6v0hA
	zueXkaJw7fdBqtHBs4PR6wZRtmZbMdH8nxyoMSo8EWWj3HFczVDk4VByQRPcO6H7SExFuFhObv9
	N6yTgfRgpMT7/oc1oUEMxbhj0hritKRmFz7tXhGah+QARqT+3iBZMMlQG2So1khj6kQngTitcWR
	ohl4/yRgyuYB12uI9TRAGwVt5jaUO+yrkQXJsPL3ItJL/qBpbVO7Wpt38tMXntcN451v6dwpVoe
	NWF1q5zv1lWrdUzgm4aqbpk2Ud4uGyuTKAfLYJPBN77zqTn4
X-Received: by 2002:a05:690e:4088:b0:660:460e:254d with SMTP id
 956f58d0204a3-66106faf326mr16561017d50.54.1780995126870; Tue, 09 Jun 2026
 01:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-3-frediano.ziglio@cloud.com> <aibU8lzNpMQme0kr@macbook.local>
In-Reply-To: <aibU8lzNpMQme0kr@macbook.local>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 9 Jun 2026 09:51:55 +0100
X-Gm-Features: AVVi8Cfh6BoJ-8Hy4EGpjqBgguZzXrqLdQkNUthWe9NRHzaQ93YXg0mhIWIAz0A
Message-ID: <CAHt6W4dHtncg5RHnXaC-0wzmcFDP9eFCyenxqE+2TnkFUfhGsQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] libs/guest: Reduce number of I/O vectors in write_batch
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1780995128-09F6EC48-81B044CB/0/0
X-purgate-type: clean
X-purgate-size: 2427
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A019365DFC1

On Mon, 8 Jun 2026 at 15:43, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>
> On Wed, Jun 03, 2026 at 02:05:49PM +0100, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@citrix.com>
> >
> > Small optimization.
> > Reduce number of pieces passed to writev.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> > --
> > Changes since v2:
> > - change prefix in subject.
> > ---
> >  tools/libs/guest/xg_sr_save.c | 35 ++++++++++++++++-------------------
> >  1 file changed, 16 insertions(+), 19 deletions(-)
> >
> > diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_sav=
e.c
> > index 3b2c5222e4..1700d81905 100644
> > --- a/tools/libs/guest/xg_sr_save.c
> > +++ b/tools/libs/guest/xg_sr_save.c
> > @@ -97,9 +97,12 @@ static int write_batch(struct xc_sr_context *ctx)
> >      void *page, *orig_page;
> >      uint64_t *rec_pfns =3D NULL;
> >      struct iovec *iov =3D NULL; int iovcnt =3D 0;
> > -    struct xc_sr_rec_page_data_header hdr =3D { 0 };
> > -    struct xc_sr_record rec =3D {
> > -        .type =3D REC_TYPE_PAGE_DATA,
> > +    struct {
> > +        struct xc_sr_rhdr rec;
> > +        struct xc_sr_rec_page_data_header page_data;
>
> Is there a possible worry that the compiler (for another
> architecture) will introduce non-zero padding between those two structs?
>

No, the first structure is aligned to 32 bits (we don't support 16
bits systems), the second 32 or 64 bits.
In both cases the final structure won't need padding in the middle.

> > +    } hdrs =3D {
> > +        { .type =3D REC_TYPE_PAGE_DATA },
> > +        { 0 },
>
> Do you need the explicit initialization to 0 here?  All unspecified
> fields in the initialization will already be set to 0.
>

I'll remove it.

> >      };
> >
> >      assert(nr_pfns !=3D 0);
> > @@ -115,7 +118,7 @@ static int write_batch(struct xc_sr_context *ctx)
> >      /* Pointers to locally allocated pages.  Need freeing. */
> >      local_pages =3D calloc(nr_pfns, sizeof(*local_pages));
> >      /* iovec[] for writev(). */
> > -    iov =3D malloc((nr_pfns + 4) * sizeof(*iov));
> > +    iov =3D malloc((nr_pfns + 2) * sizeof(*iov));
>
> It would seem more natural to use calloc() here, but it would also do
> a zeroing that we don't care.
>
> Thanks, Roger.

Frediano

