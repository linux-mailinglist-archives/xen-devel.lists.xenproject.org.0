Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lcepNex2ImpiXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:12:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A31645D0D
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:12:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IaZ4EN6D;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329005.1593211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOj2-0005g5-OG; Fri, 05 Jun 2026 07:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329005.1593211; Fri, 05 Jun 2026 07:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOj2-0005dk-LH; Fri, 05 Jun 2026 07:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1329005;
 Fri, 05 Jun 2026 07:12:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVOj1-0005de-9M
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:12:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVOj0-006VXF-AW
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:12:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a2276cb-e002-0a2a0a5209dd-0a2a4502831e-14
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:12:14 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a2276cd-af86-0a2a45020019-d155d0abb42d-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:12:14 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-396771119c4so16608941fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:12:14 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780643533; cv=none;
        d=google.com; s=arc-20240605;
        b=iDKpB43PG3eG5VZ+/mIrtmoBG5ec3C30Q49t+EUhZ38tpR/w52jo5G+DbPM4t2G1nR
         Qoknf6FsWgPjVymsPxpVpjiQOtGeLXtXlFOuVgREur3bKQtMZBGPfvHE2H9CHew+qKyd
         /QBCwwKjw1J6JyTw7ksz0dwhB3LOBeudrMqPo39wauTxmNoUs1WnsuC89NoaUOSpx+gg
         GwZN/c9hHT0f60q50VFNOY19fr7pe4BxqLTvrQYr+9u+n0oU8EAHTvoZwnxmGVWmchWB
         KGufwMNPesZbenq5TqfC3tMA8BUQpMiB1vTly+R+qVu/vreU3062wFoSs/NFkeD+GRo1
         1L6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYFbb7C6u57y5axG8xnN/AuKPSXpj2CSm8obC7VqplY=;
        fh=SpUAnj1XB8QFKdJ6Rvxlh85+C2bUr+7pUalEaLFIf8I=;
        b=CDxPAB2cYPuOJZuugeI/HU6G8cDC0NnQc7TcaAXpwUjHdG46JlK4EjXHanqTva8Ykp
         7WQ4MFp1qZmCcU54fGMXDn27+xgpj2uKp9HeJF0plZ34FwL94bBkqFte7hPWe52JfnaC
         jlWGGGntdTzKPc1Zy36ou1KN/WR+jEgAgoggRgIIPtdiqS5Z/+izPPc7kIjS9yJavXFC
         OGJo4hJP/DCSwPgwTC+53AF7XIgBRrtfhlcKueP9exBZKW4b9i09N5S6SAlQHl5LKMTn
         mO6TIHMAaPbiGYpDftoLCTzsbDFbyLRCORIycx4mnp+l9+s8/Rvi2VQfVHs/mOlhv+ls
         iy8A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643533; x=1781248333; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYFbb7C6u57y5axG8xnN/AuKPSXpj2CSm8obC7VqplY=;
        b=IaZ4EN6DPw7oXXOMg6YEdiDQwfBPAgnGqscAgcNip8iWr3J4ZvMysZDQ6LHQvFdRq4
         izeHIlCGi5HqQZNywIPy/BxFwH1X34Nnmn7Fw25Ktx88Lz4dNdWn9egi3Qto0czYMJYA
         hV/x8PyG6/b0Gel37O8ovqg5b9yDQnhjxKovQLfqjFA5U2ylkVOe3hCfLBqvHeWsv3wM
         3ogP1jQVGkvUFCkMbXiejc6+gX00Pzkjh98/jg6n7xIeDXkiRhhX/WNXfx/eYAXw0DFb
         CkIdQuf/II5XXHECw3iqlSEbWgZlXvr1JPEJNBFy0W7wM9vBOK6JThAtICZPKnLneit9
         qSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643533; x=1781248333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mYFbb7C6u57y5axG8xnN/AuKPSXpj2CSm8obC7VqplY=;
        b=q5vSvlbJX+HulyudeKjVsLsijORqBskGCVor37vadWhjNq22EbbzujDjn9tQd0ruVT
         U18zbuVSJlgt7vxMNvnjHPaJOei6vNwSE7QjDuYyqEY5RhbHIQlpJ3T66syKOB9yw0ay
         cZUocxLo+B/si0TYqOcyzWAdCaUZ2bTDOGSxUmcOvMSyEuN9nds+4B6IwskBzosLs63/
         Afb0W9ZMxZ4Vyv8V4A5J4dRt5jBkYkGbV6qjCzzxSfLJXwdRuM8PIkRxdjrk8ButbPvt
         eoRCKqhMSEbe9YKn7GJDR3xPcXCsC94frmVZCbwWI0BcuPvwwelHwE4bAPnGahTc35vr
         uEYw==
X-Forwarded-Encrypted: i=1; AFNElJ90gjYPIc9DqzoiW+EHg4XmYgcQ74IufyMtPmCR+b9he4/UdfHkWpY+3ObKjrYEn+YghUnxyFe7nlU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxey4qgAnEMzm/49x0G1BT+bMhoQWxMELD85/iRbAyeGwgEq6yP
	8JgMAUEUi2ZjudE3Xv1XQT3y4UXwRbljpnKzjb70K4jSRyeAlE9Q4CCqmnWLMe9zlcyPaWKibev
	yMA6Ru2LW4Kn6/y7LiXU2J6jd/02hTdo=
X-Gm-Gg: Acq92OESOU2jEWrgaVtA8yzR4KrFTn8GAm2vm0GIRwpQuMiY/7Xe5WhCbdOUVe6ey+/
	NMK0VsMb16t+1iPnNP457td64vOP9piYTQrItEX0GHzByXAPUBvdRpjG3bl0VKm6YFW+Sh1KFKx
	vhi/V25B9OFL4J8sBhsnqHVHF9DKhBKjW4TqthBeDbCJ3jsASKW+buhR8YZvKuxom2kydUv73oG
	OTEPybJv5lU+rasDli2U9ojOsY/FwuwBnSvwoJxXdxA613Q1TBSyrhIFzkyeKBbbpxSOgZrIacK
	N24KL0+viaN2gsh0jTGwATQtWM8=
X-Received: by 2002:a05:651c:2229:b0:396:881d:ef32 with SMTP id
 38308e7fff4ca-396d095ac03mr7577581fa.10.1780643533126; Fri, 05 Jun 2026
 00:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <a32975d6d5a565690ec9b9f3619a98c4362da95b.1780124807.git.mykola_kvach@epam.com>
 <621305bb-1df5-4185-8690-da7b05548817@suse.com>
In-Reply-To: <621305bb-1df5-4185-8690-da7b05548817@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Jun 2026 10:12:01 +0300
X-Gm-Features: AVHnY4J9fGKyEgoB_svKYrNQA4idNpRm2BuAY3DeUGZMn3la1NnCX5abIfvVNcs
Message-ID: <CAGeoDV8bivtEKDJVgmsxbodEgn=SzJ=wR+bdzf6S7MfFh8jmCA@mail.gmail.com>
Subject: Re: [PATCH v3] xen/domain: make shutdown state explicit
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1780643534-A917D161-730599B6/0/0
X-purgate-type: clean
X-purgate-size: 4548
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34A31645D0D

Hi Jan,

Thank you for the review.

On Wed, Jun 3, 2026 at 3:46=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 30.05.2026 09:23, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The shutdown flow currently uses is_shutting_down and is_shut_down to
> > represent the domain shutdown lifecycle. The two flags are not mutually
> > exclusive: after shutdown completion is_shutting_down remains set until
> > domain_resume() clears both flags.
> >
> > Replace the two booleans with an enum domain_shutdown_state. Keep
> > domain_shutting_down() as the direct replacement for the old
> > is_shutting_down flag: it is true once shutdown has been initiated and
> > remains true after completion, until domain_resume(). Add
> > domain_shutdown_completed() for users that need the final completed
> > state.
> >
> > This makes the state transition explicit while avoiding a semantic spli=
t
> > between "in progress" and "completed" at call sites where the old code
> > only cared that shutdown had started and had not yet been reset by
> > domain_resume().
> >
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - Keep domain_shutting_down() as a direct replacement for
> >   is_shutting_down: true from shutdown start until domain_resume(),
> >   including after shutdown completion.
> > - Drop domain_in_shutdown_state().
> > - Make old is_shutting_down conversions mechanical again; use
> >   domain_shutdown_completed() only for old is_shut_down users.
>
> And indeed this is now much easier to reason about, correctness-wise.
>
> > @@ -442,7 +442,8 @@ bool shadow_prealloc(struct domain *d, unsigned int=
 type, unsigned int count)
> >          count +=3D paging_logdirty_levels();
> >
> >      ret =3D _shadow_prealloc(d, count);
> > -    if ( !ret && (!d->is_shutting_down || d->shutdown_code !=3D SHUTDO=
WN_crash) )
> > +    if ( !ret && (!domain_shutting_down(d) ||
> > +                  d->shutdown_code !=3D SHUTDOWN_crash) )
>
> Please can this be
>
>     if ( !ret &&
>          (!domain_shutting_down(d) || d->shutdown_code !=3D SHUTDOWN_cras=
h) )
>
> ? Overall less indentation and fewer pending open parentheses at line end=
s.

Ack.

>
> > --- a/xen/arch/x86/mm/shadow/multi.c
> > +++ b/xen/arch/x86/mm/shadow/multi.c
> > @@ -2370,7 +2370,8 @@ static int cf_check sh_page_fault(
> >       * already used for some special purpose (ioreq pages, or granted =
pages).
> >       * If that happens we'll have killed the guest already but it's st=
ill not
> >       * safe to propagate entries out of the guest PT so get out now. *=
/
> > -    if ( unlikely(d->is_shutting_down && d->shutdown_code =3D=3D SHUTD=
OWN_crash) )
> > +    if ( unlikely(domain_shutting_down(d) &&
> > +                  d->shutdown_code =3D=3D SHUTDOWN_crash) )
>
> While at it please correct the bogus use of unlikely() as well:
>
>     if ( unlikely(domain_shutting_down(d)) &&
>          d->shutdown_code =3D=3D SHUTDOWN_crash )
>

Ack.

> > @@ -2494,7 +2495,8 @@ static int cf_check sh_page_fault(
> >           && ft =3D=3D ft_demand_write )
> >          sh_unsync(v, gmfn);
> >
> > -    if ( unlikely(d->is_shutting_down && d->shutdown_code =3D=3D SHUTD=
OWN_crash) )
> > +    if ( unlikely(domain_shutting_down(d) &&
> > +                  d->shutdown_code =3D=3D SHUTDOWN_crash) )
>
> Same here then.

Ack.

>
> > @@ -382,6 +382,12 @@ struct domain_console {
> >      char buf[256];
> >  };
> >
> > +enum domain_shutdown_state {
> > +    DOMSHUTDOWN_none,
>
> This likely deserves a comment, as it has to remain first (with value 0).

Ack.

>
> > +    DOMSHUTDOWN_in_progress,
> > +    DOMSHUTDOWN_complete,
> > +};
>
> We further may want to make this a packed enum, such that ...
>
> > @@ -552,10 +558,9 @@ struct domain
> >      struct rangeset *iomem_caps;
> >      struct rangeset *irq_caps;
> >
> > -    /* Guest has shut down (inc. reason code)? */
> > +    /* Guest shutdown state and associated reason code. */
> >      spinlock_t       shutdown_lock;
> > -    bool             is_shutting_down; /* in process of shutting down?=
 */
> > -    bool             is_shut_down;     /* fully shut down? */
> > +    enum domain_shutdown_state shutdown_state;
>
> ... it occupies only a single byte here. We could then fit three other
> booleans (or alike) next to it.

Ack.

Best regards,
Mykola

