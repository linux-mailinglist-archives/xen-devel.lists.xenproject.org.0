Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OGTCznICmod8QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:05:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375B5685BA
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311650.1581752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsy0-0008Ub-E2; Mon, 18 May 2026 08:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311650.1581752; Mon, 18 May 2026 08:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsy0-0008Rt-Ab; Mon, 18 May 2026 08:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1311650;
 Mon, 18 May 2026 08:04:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOsxz-0008Rn-5M
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:04:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsxx-0086Yv-3N
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 10:04:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ac81a-5cb7-0a2a0a5109dd-0a2a4504b056-24
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 10:04:45 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0ac81c-1dec-0a2a45040019-d155d0a9f1d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 10:04:44 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38be5e86918so27412541fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 01:04:44 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779091484; cv=none;
        d=google.com; s=arc-20240605;
        b=SPwAWHivt7g+w4GualnuGarInFiMdDhSk1pXiJYcf8ZfiFcE5AIQ8bsWRPEp0cUpBp
         VVIANaIp2eCDzu+4DilXW2V1EOTFjLHCHoHPnVw8ER+8tphSCvSSNLTpIWXp8z3OXDXI
         4Wx5ntGs4cikeSui6evH875eLT/vUFUqTMPkdpY0arivwBS2ANEODVgcFlps6/5HfUr9
         8KM/vpZmGnqtJTAQgduz71SjglEClmgKJlafoTkoB3OpAzRZqMocSW1Aa+x55Uz2Spt5
         cXWCSHLqgq+zFKNWCxBpIty3MDFiNOKgZ4QLSFZ5d3y1C4NbzpX1oiC9yiMqziM8LAOf
         emxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99gwQBe9ex5niKZl03wLsIShBZ012H4z1zs12SCF99U=;
        fh=22AKn4tiP/brJKt2z+QCRavBTlFZKpxhtfgZsL2okpI=;
        b=AxgT95gAzIU+ktvo0fKub6bSs2+0p7zctSDaaeCWpwWTIKWeI7GQ0lvgaRsdzbEm0U
         YdDBN9ifD1cTn2qMU6SqcpZX6IiX2IM4nZhfrSaLKJcWLjBPLSJG8i27q1NsMEjsi5Je
         sfvblICvPHbz94smuFQH9u0Iau5tInTw9d/WnI6OpDZDMajEW9OyhKdJyY0DjAo30Id/
         DFif/GhgFdLeiJmFTI7SWknvKfZPbJJN10sXrh0ROX9KYj4y4XV5nRrzznM9icIymvQT
         7yx7SppYROyVtREmzKkUaNpDNKHZW2Ui/rSEQ10zaAgotU3DmeOamyPodel5MkP3t8oI
         PPyw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779091484; x=1779696284; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99gwQBe9ex5niKZl03wLsIShBZ012H4z1zs12SCF99U=;
        b=sHSG7e6FM86Efnprw4bH5C1ZsmlQdJ76YtmyeSyhf3Ki/pl5QlvVQxkFPQAnL3g6W4
         q4YwKlSboIXB9DS3WSa4hMYYq0D1dfmD4pAEHsrXfu8OE8Lqmgl/c3UxazYhaMtXAQw3
         eax9ckS7GYSK7ZgrN9JlxU1A+jk1BYoKzfDX7ghfvsVL3WC9WWCaRw9yg85OUz2VrorB
         VJHXzuIM4LpWnCwLzJ7ExKNgTEq2XJd5B4fW78e99EHxvCZ2GbThV5OhBqOAeMMKLmiU
         FI+80ScRX2+GhQi/faibjd/U42Wl+nIF97kmB1g2JllTbDTPy9AACb5zZb/SPfL0VnLf
         I6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091484; x=1779696284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99gwQBe9ex5niKZl03wLsIShBZ012H4z1zs12SCF99U=;
        b=nKsJNFSPO84FZO1N6IxTdh72wD3IQsSIe72W/Zu3Fdv5Av4QpPlHb8+dPXGo+/cZcg
         8lvys4KFm9fSK1bWkuwnINO66quCp8A/POk1+vAIhSW/44/Fb4P1RpJxghruHGZwEjcC
         5keHUJlOw//iR/mn07WZkgwRE1Cf80USeaRbrFW2hUeEh/9TI982euarF+1RRUj8tgkr
         gqN2QJW+3koS3SHCF3rBmCnLtxW+4TT9fEDW8r0JgvTzMrG1ITM1xkFRkVuhsyOEJTQJ
         6c5mjs5VTs+ZO109hTK7E02vHjRpQjRw/xgcJiFJWBjUjbYDBJtCg3H6t+G7Mssggfoy
         Es3A==
X-Forwarded-Encrypted: i=1; AFNElJ8FPj/kJQ2biaLv4vfPCPHqOKElWDiYf4X8/NkyOlKrdLlP+RlEKHxwDOEaVVdnfv9xBfOEEi+vMjs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVll9NvFYLWOT3Cy4ka7Ha5QS2d4gOWSiL83XGI1iX+Bq1569s
	KwAm/n7O/xIM6hIb8N0o8e794XUk7aQCR22p4kCZljLUwQfeJyQf08bmf+cqj0HVG6I7lszqdTq
	sI9TaNx5tmpuB57CIhJMWscO+mauACP8=
X-Gm-Gg: Acq92OFxRmmj63bxintCvpkUPKbbG0ztFXppcR9/eUoDQjYDA8l1m+BSmm/Hiew7ZgU
	mYEb0yLlreXcBJOp2grZjAX8HwPUPkHKybt5MYESjSHsRod5WBNFOPASqIngqjAzRfHYVIssbtV
	raDDzjERtRBGFdgYofcS2YmqI1vc27nc0th0UNQdh2onNkDtMgmgZlq8H9wlUpMgP3zCTC3DZEh
	xX/Rrdnn+iLgQSpUJBdWyz0GXgyjC+qZfCzqkY/uKV+2J/KhZWgsKiY/GkxNIZMBKnw5rbG/WyT
	TBOimW1RoEz49IA=
X-Received: by 2002:a2e:bc83:0:b0:38e:a00e:2bb5 with SMTP id
 38308e7fff4ca-39561c0e98amr39547091fa.19.1779091483600; Mon, 18 May 2026
 01:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778925998.git.mykola_kvach@epam.com> <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
 <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com>
 <a5d1dc32-c505-4f42-8d48-ba2710d7b831@suse.com> <CAGeoDV_8BNRPy9tbe1ArgR4Lj8YHZPwo_7D59oJJSiSqNQFNFQ@mail.gmail.com>
 <22edbeb3-4b0b-48d4-9873-76bfa31b970d@suse.com> <CAGeoDV8ucuZ-FrYe6j_ke4cK33z27=rNZ-9oZzb0R9PxqDJBqQ@mail.gmail.com>
 <8156a887-9069-4f9b-8107-b4dbd2cbdb69@suse.com>
In-Reply-To: <8156a887-9069-4f9b-8107-b4dbd2cbdb69@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 11:04:31 +0300
X-Gm-Features: AVHnY4LfGIDas6J3skibMPTS4jw3vrdQzXnBkyoTRuNl13LeOcMwLgJS1osVSm0
Message-ID: <CAGeoDV8-DFaQKnr0PF1HTGkbxHY2a-76cNBZ7oyXE3m4px9sBA@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/common: llc-coloring parser fixes
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1779091484-437693FF-537EA9FA/0/0
X-purgate-type: clean
X-purgate-size: 4957
X-Rspamd-Queue-Id: 8375B5685BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 10:43=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 18.05.2026 09:19, Mykola Kvach wrote:
> > On Mon, May 18, 2026 at 10:06=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 18.05.2026 09:01, Mykola Kvach wrote:
> >>> On Mon, May 18, 2026 at 9:52=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 18.05.2026 08:42, Mykola Kvach wrote:
> >>>>> On Mon, May 18, 2026 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> >>>>>> On 16.05.2026 17:03, Mykola Kvach wrote:
> >>>>>>> This small series fixes two issues in parse_color_config().
> >>>>>>>
> >>>>>>> The first patch makes parse failures leave the caller-visible col=
or count
> >>>>>>> at zero.  This prevents a rejected command-line value from leavin=
g a
> >>>>>>> partially parsed configuration behind for later init paths to con=
sume.
> >>>>>>>
> >>>>>>> The second patch rejects empty color tokens.  Previously, delimit=
ers in
> >>>>>>> places where a color value was expected could be interpreted as c=
olor 0,
> >>>>>>> because simple_strtoul() returns zero without advancing the input=
 pointer.
> >>>>>>> The patch checks that each parsed color value consumed input.  It=
 also
> >>>>>>> adds the missing newline to the DT color parsing error message.
> >>>>>>>
> >>>>>>> Mykola Kvach (2):
> >>>>>>>   xen/common: llc-coloring: clear color count on parse failure
> >>>>>>>   xen/common: llc-coloring: reject empty color tokens
> >>>>>>
> >>>>>> For both of these, a question which isn't even considered in the r=
easoning
> >>>>>> is whether the present behavior may be intentional. Especially for=
 the 2nd
> >>>>>> ISTR Stefano(?) not so long ago indicating that the behavior is in=
deed
> >>>>>> intended to be this way. That may have been somewhere on Matrix ra=
ther than
> >>>>>> on the list, though.
> >>>>>
> >>>>> Thank you for pointing this out.
> >>>>>
> >>>>> For the first patch, my reasoning was that returning an error while
> >>>>> leaving a partially parsed caller-visible color count behind looks
> >>>>> surprising. If the value is rejected, I think later init paths shou=
ld
> >>>>> not be able to consume the partially parsed state.
> >>>>>
> >>>>> For the second patch, my reasoning was that the current behavior lo=
oks
> >>>>> accidental rather than an intentional extension of the syntax.
> >>>>
> >>>> That was my impression as well, hence why I had raised the question =
back
> >>>> then.
> >>>>
> >>>>> The parser comment says:
> >>>>>
> >>>>> COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
> >>>>> RANGE ::=3D COLOR-COLOR
> >>>>>
> >>>>> The user guide also describes this as a comma-separated list of col=
ors
> >>>>> or ranges, with ranges written as hyphen-separated inclusive interv=
als.
> >>>>> I don't see an empty-token production there.
> >>>>
> >>>> What you quote is insufficient to determine: COLOR may be allowed to=
 be
> >>>> <nothing>. Iirc the reasoning went in particular towards a range wit=
h
> >>>> merely the upper end specified being something (halfway) meaningful.
> >>>
> >>> Right, I see your point.
> >>>
> >>> The grammar does not define COLOR explicitly, so it does not by itsel=
f
> >>> prove that an empty token is invalid. I was implicitly reading COLOR =
as
> >>> a numeric color value, partly because all examples seem to use numeri=
c
> >>> values, but I agree that this is not stated there.
> >>>
> >>> If this behavior is intentional, then I agree the second patch should
> >>> not go in as-is.
> >>
> >> Just to mention: Something like "-5" won't be interpreted as "0-5" eve=
n
> >> right now. Instead it's taken as a single color with value -5U, afaict=
.
> >
> > I don't think that is what happens with the current parser.
> >
> > I tested this without the patches from this series:
> >
> > (XEN) Command line: dom0_mem=3D2048M console=3Ddtuart dtuart=3Dserial0
> > (XEN) loglvl=3Dall console_timestamps=3Dboot llc-coloring=3Don
> > (XEN) xen-llc-colors=3D-5
> > ...
> > (XEN) LLC coloring info:
> > (XEN) Number of LLC colors supported: 32
> > (XEN) Xen LLC colors (6): { 0-5 }
> >
> > So "-5" is currently interpreted as "0-5", not as a single color with
> > value -5U.
> >
> > That seems to happen because simple_strtoul() does not consume the
> > leading '-', so start remains 0 and the parser then takes the range
> > path.
>
> Oh, I didn't recall this incompatibility with strtoul(). We also don't
> permit a leading + there. IOW the behavior of the color parsing would
> change if we made the functions (more) compatible with the standard.

Right.

The patch makes this explicit in one direction: a COLOR must consume
input. If "-N" is intended to be valid syntax, then I think it should be
handled as a separate explicit case, rather than relying on
simple_strtoul() stopping at '-'.

Best regards,
Mykola

