Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4jB7FQ/OH2qCqAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:47:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EE634CCE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:47:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="MRIBM/qH";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325751.1591078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfNO-0001PX-U3; Wed, 03 Jun 2026 06:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325751.1591078; Wed, 03 Jun 2026 06:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfNO-0001NH-R8; Wed, 03 Jun 2026 06:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1325751;
 Wed, 03 Jun 2026 06:46:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wUfNN-0001NB-Lj
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUfNN-005oEk-2D
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:46:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fcdd2-5cb7-0a2a0a5109dd-0a2a4507b7a4-46
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:46:53 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fcddc-229c-0a2a45070019-d155d0a9a4e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:46:52 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-39661f81eacso4281211fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:46:52 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780469212; cv=none;
        d=google.com; s=arc-20240605;
        b=jk2WiSg7R4GeG10AwjzZQA4Ved7fxirTEQOOyXfuAkgmKppZfYRguW6J/+1WvCUxos
         FtQJVsJKVa2uv8DZGFg1lJ8DBepu3Myk17ZAI0ayQXe3Vc8LLVOhyZSC+KTZr1vDQxNw
         zax7XymG9QlkERaLLYsVSvp+REm2BywAhYMtRmAtP9ibj+9ILBTRoJMSakZad4Idk6u3
         x0okiRwt+ICmONJAnwA6qEPbBJy5V9OEEHNUI+JDsVBsSm5XfO0pSMLKcmJM7cwg1cNZ
         I/r0UVzD+GV9qJzHcWVZRGkvug0xpP/PgGw19Tt8Ds1NT5Q/DyYvWzVV6HYMIEKYt8CO
         6WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7dBaqWYLvzEH6qwxN/EwADTUjkGEkjcWDh2cRodeWNI=;
        fh=V4JwZlQFNRYiaNJa0y1s6t2uNB0wWRvWPMwApFIm7J0=;
        b=krHhfWKMMPWJ+yhfTQoYpRASpoEyMjm6HwuoIR14bxSuTZf62Wvkn8EwVaB1oVlcu+
         GNAi9YtgZgu6X1t1rV8+yDa2b5Zp1l4y9BSY3xgy9qTTsg4juVKSEKgZ5WNKaDHaLlHL
         ZfRZ3MQ+fJh0trXLdaDZRSBdpSzeLL0soWmFEqBiB5psnx8GQgWYLz/BPK7K6M3WH2o5
         kIATJQLTPX9MXd5kSZwPk5z3aBJ/M36PTKRhzafSv8xNcdSARa9kX/QIIaqXmQQh6gu2
         eHvZK9AAA/ajrcXwnlAooET26yFGhm7MnNAZGFLgjSX3gd7GvTeL56C5jN0PnlBqhoUF
         aiFw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469212; x=1781074012; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dBaqWYLvzEH6qwxN/EwADTUjkGEkjcWDh2cRodeWNI=;
        b=MRIBM/qHBEZoHaYLquuL+nenTJbG8dCS90UTSL00DM8KK4atDHgxKfRvV2J0EA4C7T
         7rTuayyQ98zWJWSqP6LXJ6kjpHN3sfHwnnyk2gI5ttNwSc+2h/l0wvDnh7qZWphPY14i
         V5NxJBdQz+HseyvE5zkFYCKc+uh8tnbdmATrycZ9btypIGUCKRKeyf/FuQC+bOyYIy4e
         WEoudd8qGMjuFgTiRBXOKl1QOGMYemvIApwQeeJV8nf2sma+Oq9eF3xhyzx5zB5kBbRP
         Kyeei5R8mrpASM3XzQXGz2kuy4uqXxbjTlQVxrZUCVPVg5NZqa6BpdyLgBSv1gFAsO/3
         adcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469212; x=1781074012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7dBaqWYLvzEH6qwxN/EwADTUjkGEkjcWDh2cRodeWNI=;
        b=mn0FG7aiIt/48/mhk3zMQtqH83NrfdQh5QG+VWlJF4UKnV+1O8UYUD6SYW91BiKVOh
         g2feSgfw1ygT3jAcjx3BQY/OjwmfGRTP66X2CxLYtB1O1E1jqIt2HvaKf8t4gak6734E
         YmmZb3jzhHUiJ3QVFfcprnMEyFgvBAyx0pz8r2H8fzQI6Ca2Ttch6ggCXhSwroQoTr/y
         VR/Ie9X+NlRQAWNgKFWbChOyvf+Sp0VhRTN5+fprauRw2kWJfr+Por/dG4UPb1UXX3Hf
         zIRHsVspPBVqYJyGISOfvDGTyKh+YzLid/AA9r7TAFQTR5PpOfYKPo62oam8VmWEnjvC
         MnIA==
X-Forwarded-Encrypted: i=1; AFNElJ9O0v719RVJH0snnXjbpjIGathXuDqPVnO7a0IcHyc2VMGkhLYHzX74TiazXFdDoQM0ubjpCKeJTbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQzaJ12+O6YoXccDUxyQofR2R03Ttb71pJTCRpRFsuCtM7Au+z
	MLR8+exwTcdIFpMx5ptwdnfMfqh6RT7dTdfpjJZwMphKNClUwT9tj2SSkP6Y2R3TkiojXaJf11P
	JcbRA0h/iSL75ahmJyZrya8/Df4lVLfI=
X-Gm-Gg: Acq92OGiINMr63qgBoj3lodLognDQhxEnDW6bbyxecApXxfUlozs4l8d7EFO3V2hUCe
	WDLC/N7xSY7ey+I1AH8IskhDqHqATyd0RmI2wXUWXDJJut9kuyr3hfvPBOG6dS+/r3d69ouSnms
	7r2R3wvd7fpmg23f2JcqZ9OTZm33MNyW0g8GAjaC9Fqf9Z6fz3oziuBHBcHryEkifEKV+oK4rsa
	3/dnrpPDrWD5KW8GotNfooE8+1zmyFO06CBz0tBCZFYr3eSSSohkQ1tDJ9X/JmmV9Shz3Q39eFA
	LvMZqAsgfVXzQ1Yw
X-Received: by 2002:a2e:ae07:0:b0:396:8aa2:f8d9 with SMTP id
 38308e7fff4ca-396aef3f098mr4043421fa.17.1780469211982; Tue, 02 Jun 2026
 23:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <e9c45be41bb36ca341dad57196c753fbe82d1526.1774998397.git.mykola_kvach@epam.com>
 <d53d2b06-56d7-43bc-bb20-4df7b7bc3ca5@suse.com>
In-Reply-To: <d53d2b06-56d7-43bc-bb20-4df7b7bc3ca5@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Jun 2026 09:46:39 +0300
X-Gm-Features: AVHnY4IxkzzU0lF0ZHKnzy6YfCzBMldcg5oOOEKMhdgUA3pS9PKfY1H6iLt1nNU
Message-ID: <CAGeoDV8RXEvV03WCRU5WqZvAgU1G9GmVpaed1ZR+ezbEjgLjMg@mail.gmail.com>
Subject: Re: [PATCH v2] xen/domain: make shutdown state explicit
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1780469212-09F6EC48-930B6220/0/0
X-purgate-type: clean
X-purgate-size: 4570
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail.gmail.com:mid,epam.com:email,suse.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: B13EE634CCE

Hi Jan,

On Wed, Apr 8, 2026 at 4:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.04.2026 08:41, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The shutdown flow currently overloads is_shutting_down and
> > is_shut_down to represent multiple phases of the shutdown lifecycle.
> > Some users treat is_shutting_down narrowly as "shutdown still needs to
> > be driven to completion", while others rely on it more broadly as
> > "the domain is no longer in its normal running state".
> >
> > Make the lifecycle explicit by introducing enum
> > domain_shutdown_state and helper predicates whose names match their
> > semantics: domain_shutting_down() for the transient phase,
> > domain_shutdown_completed() for the final state, and
> > domain_in_shutdown_state() for checks that need the union of both.
> >
> > The conversion is intentionally not mechanical. The old flags were not
> > mutually exclusive: once a domain became fully shut down,
> > is_shutting_down remained set. As a result, sites that previously
> > used the absence of is_shutting_down to exclude both the transient and
> > completed states now use domain_in_shutdown_state(), sites that care
> > specifically about the final state use domain_shutdown_completed(),
> > and only paths that still have work to do before shutdown finalization
> > use domain_shutting_down().
>
> In how far is the distinction between domain_shutting_down() and
> domain_in_shutdown_state() really necessary? What you describe above
> still leaves me pretty clueless as to almost(?) all of the uses of the
> latter (where I think the former could be used just as well). Many
> paths simply can't be taken anymore for a fully shut down domain, so
> the distinction between the two is moot there.
>
> I'm also concerned of the name domain_in_shutdown_state() itself. To
> me this is far closer to domain_shutdown_completed() than to the union
> of both states. See how e.g. x86 CPUs can be "in shutdown state", i.e.
> not responding to anything but a reset or init signal.
>
> IOW an entirely mechanical replacement might in fact be easier to look
> at. And in the one rare case where the distinction might indeed be
> relevant, "domain_shutting_down() || domain_shutdown_completed()" could
> be used.
>
> > @@ -1423,9 +1423,12 @@ int domain_shutdown(struct domain *d, u8 reason)
> >      return 0;
> >  }
> >
> > -void domain_resume(struct domain *d)
> > +int domain_resume(struct domain *d)
> >  {
> >      struct vcpu *v;
> > +    enum domain_shutdown_state shutdown_state;
> > +    unsigned int shutdown_code;
> > +    int rc =3D 0;
> >
> >      /*
> >       * Some code paths assume that shutdown status does not get reset =
under
> > @@ -1435,10 +1438,18 @@ void domain_resume(struct domain *d)
> >
> >      spin_lock(&d->shutdown_lock);
> >
> > -    d->is_shutting_down =3D d->is_shut_down =3D 0;
> > +    shutdown_state =3D d->shutdown_state;
> > +    shutdown_code =3D d->shutdown_code;
> > +
> > +    if ( !domain_shutdown_completed(d) )
> > +    {
> > +        rc =3D -EINVAL;
> > +        goto out_unlock;
> > +    }
>
> I can't help the impression that you're mixing two things here - adjustme=
nt
> to how shutdown state is tracked, and enforcement of completed shutdown
> right here. This separate change likely would better be split out, and th=
en
> come with a description saying not only what is being changed, but also w=
hy,
> and why the change is correct for both call sites.

In v3 I have dropped this part, so the patch no longer changes
domain_resume() behaviour or its callers. domain_resume() remains void,
and the patch only makes the existing shutdown state tracking explicit.

One follow-up question about the dropped change: do you think resume-state
validation would be worth pursuing separately?

AFAICT, soft reset already has its own DOMCTL path, so I do not mean to tre=
at
XEN_DOMCTL_resumedomain as a soft-reset interface. The distinction I had in
mind is rather that we may want different validation rules for the generic
resume helper and for a resume-from-suspend path. In particular, soft reset
could keep the current semantics, while a resume-from-suspend path would on=
ly
clear the shutdown state if the domain had previously entered suspend.

If this distinction makes sense, I can look into it as a separate patch wit=
h
its own justification for the affected call sites. Otherwise I will leave i=
t
out.

Best regards,
Mykola

