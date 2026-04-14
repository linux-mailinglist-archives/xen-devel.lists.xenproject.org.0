Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBMiFhs13mlWpAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 14:37:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9A3FA099
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 14:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281730.1564616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCd1M-0002DU-NO; Tue, 14 Apr 2026 12:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281730.1564616; Tue, 14 Apr 2026 12:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCd1M-0002Aa-Kc; Tue, 14 Apr 2026 12:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1281730;
 Tue, 14 Apr 2026 12:37:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruslichenko.r@gmail.com>) id 1wCd1L-0002AK-18
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:37:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCd1J-005sby-RL
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 14:37:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 69de34f6-5cb7-0a2a0a5109dd-0a2a450386b0-42
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 14:37:33 +0200
Received: from [209.85.167.182] (helo=mail-oi1-f182.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 69de350c-02b3-0a2a45030019-d155a7b6b99b-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 14:37:33 +0200
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-46fc5b8a068so1811802b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 05:37:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776170252; cv=none;
        d=google.com; s=arc-20240605;
        b=M3UkeP5n+se6S7TPzMiw0wdpnI5mhsoKCsuNXfhqPb6Jf6pDLkfFXS4Be1ApIAFT+l
         WZOvmKFGfQ3HT64clf8Jk4orKn+hTlpAsUQtk3fRui0run1CA5px9le/YQsTrElEXNnX
         U9x82Q0nmK8iDXaEs1EXuFvGM+hAsaisS38HadH+ZDkwh6bsSySzxgchKsvN3S07MMPs
         BWfif9NLnruMV6BM04wVS0kR7Gh5sV4N8WSD6tRxX+nddZBU6Gi3d+5DPK+tR3Jdl/sP
         LImTvtAadYia4hqlJ9ZEYrJ3hb2lwGkZxvYS4w7vKRvl83QKD8Yjp1jxMYfuBXIVr+Ip
         3xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q9zdWPoWdvbWCQTO+55S7ZInEF0uDLun5ABiAEsj0AE=;
        fh=IS/tDDkuF9s3/ln8GtiQ3p6v+3aSD0NVmXMIz5Ujy88=;
        b=YZKv+7nNLhUb9CJIo6iHDIr0PKsB6YvXuVDDMGCpO6kO5XAiomS4yx80BzUBKsTXwb
         4hqHxuH4oHfGZ5Es2yY8e8sRstk4FnfnZgS+a5oBIdVv1Num71xGbvK7r2hyXybR9SgL
         I95FngOs8xYBsVZSaQ5fYp+PppAv2J7aXJaq6PrpLOb+qos+SIQEBI4F4EE/2asS5Mgo
         BMJ7L69FrCHnebInnqfyRUSqaz4dwH6ITGwUt1lmctq8gpNZoBM8eAauG1MD8nnv7jVj
         mOxUaXAHktaW8wAvVNPW8zU6B+D5W1xdXXRcD3n8Lgaqel0O8fTUWnJAPQ5O5XjOtzWz
         e7Sg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776170252; x=1776775052; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9zdWPoWdvbWCQTO+55S7ZInEF0uDLun5ABiAEsj0AE=;
        b=H12Sg2SA01FoxYI9yzI32nXw+ARrl62WugVXZ8RWWXLMOrahgzhsUxwdjln9NiAeCS
         Wnz5hK9wKGU0ueLVogqkx21poyLhoW5JBhsxaLQNF9LGoMGOvKTIYkC4ogbIRo53hEqn
         VtoP7qR32WK6jIhn+PnDg9yIC/qkPimtGVuOIPFI//uYDP2EY6PsD1uuFioJMSts8nJc
         LA+PfqkQw2TY3kCQGzMezDpn/JplsqQJBwwNCP+jDL2lQ0FIZJXjVIurHhV4ts9axP+j
         5IEJN1H/7XPLtqZPqYqnYmuDmueJ1V5JwG6FQrKmsKDQkyswd0IuCKijFOmihkAOQWay
         GnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170252; x=1776775052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9zdWPoWdvbWCQTO+55S7ZInEF0uDLun5ABiAEsj0AE=;
        b=S1eezWexijJA63U3pJc0w+ShFyOqeDsMreim7VQnEBwF6gqZYK7xLwT5aqulGhznqG
         5vQw2rWDW7Q3KoXpv3Uz7AZl98vbCja+yAMUedpNDgAvE69+49zehyTWDTydAwQE+30m
         lTBYJiAqn1Mp26SKUBhOtkV+bXgUZ96fgyZqoZQ8IRMva73uJvLhmjB538mLrKHZyg6W
         LN6C0DrQAbFqN0CtY/nVD4duf3Mt4Q7vGmoDr0aeu1hnu/vAuAnu+xWJK8c2t7nwxR3D
         FEyiv9n2xIVVmbnbypvuoConHFIyezafo9QShNfqrCFfq1ygYymgEdh/R1ILbFkDiNva
         bmJw==
X-Gm-Message-State: AOJu0YzyYmHw7UrhiSIzLSksR5fluYuzSETFgML7IWs+EQZYkedoVVLm
	Mjk4MCXVyefNWDiMZh65T48L62/NZE16Js4QIhnVlhu5kP32Sd+bqCoxA9D7DMahwl4iTEmT7XI
	SSD+AzsMPh7l40sHaQR4nGvSxhMGIxo0=
X-Gm-Gg: AeBDieuFw47xxgaOFTSZHI2MRvk5TeXWgd1a3sbz5p6VXFeHMtw2eQUK9IZTkhwgfav
	s46wxuDf9TIrIxKIar40kA6cod2Ppy0FibyRWfiGr7B+y+nnqcC283Idws4hOEcDp73uZCtjY9n
	hc+aJJkDFSn7hC/XmrKL+MAXuK/xltsno8P/qbT81gbTjvfuA7yGNLm7acqPur/eoa7wheeZfvA
	6r5oVg8r3N8/23ST8OW/WKflljYmHUaJicskCIVz9iW5vrDVOomsThKxEnynWvu4+W6fOs1zlK8
	lgjD8sg=
X-Received: by 2002:a05:6808:4e83:b0:467:2926:123d with SMTP id
 5614622812f47-478a0f16ac5mr6863726b6e.47.1776170252023; Tue, 14 Apr 2026
 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260410164039.1000284-1-ruslichenko.r@gmail.com> <358dc4fb-139b-4000-99cb-c9271e90437d@epam.com>
In-Reply-To: <358dc4fb-139b-4000-99cb-c9271e90437d@epam.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Tue, 14 Apr 2026 14:37:20 +0200
X-Gm-Features: AQROBzBzEfXsERmTVDGkisvVxFwcHpmRn1YsCRm4l15OcpihPcQdjXdqjOA7-N4
Message-ID: <CAN-aV1F+Rmzs4P8AXOD2szDX_ofejDgenZuL3atHA1qTyGhvPQ@mail.gmail.com>
Subject: Re: [PATCH] xen/sched: fix scheduler callback verification on init
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Ruslan Ruslichenko <ruslan_ruslichenko@epam.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1776170253-41512C9A-91311D73/0/0
X-purgate-type: clean
X-purgate-size: 2537
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[ruslichenkor@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:ruslan_ruslichenko@epam.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ruslichenkor@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BDD9A3FA099
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 1:10=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam=
.com> wrote:
>
> On 4/10/26 19:40, Ruslan Ruslichenko wrote:
> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >
> > During core scheduler initialization, each registered scheduler
> > is sanity tested in two steps:
> >
> > - it must provide required callbacks (e.g. init, do_schedule).
> > - if global_init callback is present, it must succeed.
> >
> > If any of the steps fail, scheduler entry is cleared in global
> > 'schedulers' array.
> >
> > However, in the current implementation, if verification fails during
> > the first step, the scheduler entry is cleared but verification
> > sequence is not interrupted. This lead to NULL pointer dereference
> > when subsequent required callbacks verified, and possible during
> > the second step.
> >
> > The patch fixes the crashes by adding check inside sched_test_func
> > macro and skipping the call to a global_init if first step did not pass=
.
> >
> > Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> > ---
> >   xen/common/sched/core.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index a57d5dd929..4270c89491 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -3017,7 +3017,7 @@ void __init scheduler_init(void)
> >       for ( i =3D 0; i < NUM_SCHEDULERS; i++)
> >       {
> >   #define sched_test_func(f)                               \
> > -        if ( !schedulers[i]->f )                         \
> > +        if ( schedulers[i] && !schedulers[i]->f )        \
> >           {                                                \
> >               printk("scheduler %s misses .%s, dropped\n", \
> >                      schedulers[i]->opt_name, #f);         \
>  >               schedulers[i] =3D NULL;                        \
>
> Maybe it would be cleaner to just add "continue" here?
>

Probably, yes. This will also skip unneeded checks after the first
missing callback.
I will update the patch then.

--
BR,
Ruslan

> > @@ -3034,6 +3034,9 @@ void __init scheduler_init(void)
> >
> >   #undef sched_test_func
> >
> > +        if ( !schedulers[i] )
> > +            continue;
> > +
> >           if ( schedulers[i]->global_init && schedulers[i]->global_init=
() < 0 )
> >           {
> >               printk("scheduler %s failed initialization, dropped\n",
>
> --
> Mykyta

