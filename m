Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58298C66B7
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722337.1126168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EEX-0001jm-Oy; Wed, 15 May 2024 12:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722337.1126168; Wed, 15 May 2024 12:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EEX-0001gf-MN; Wed, 15 May 2024 12:59:49 +0000
Received: by outflank-mailman (input) for mailman id 722337;
 Wed, 15 May 2024 12:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Htxv=MS=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s7EEW-0001gX-IR
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 12:59:48 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01aee579-12bb-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 14:59:47 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3c9abbb9efbso1098292b6e.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 05:59:47 -0700 (PDT)
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
X-Inumbo-ID: 01aee579-12bb-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715777986; x=1716382786; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkVGQ0yCW+Kcc4HDyyz/k3gv3ZB4NHmjbpXeWCF7e+8=;
        b=LwUbr6jyhS8D0QSPNjfTy//7od5cSCDuA2H/iP6pPjQzsqJrQzINXQqro5vlShVO9F
         yl30eEDjV81F88QkY/pUAYDMX4qYb9MoqolN7MShvtQKJXAdiLkBmyLUVNKeAIxDePEc
         ZNI0OPqPgwOWjSyayHFG7qAqFPAXYnqCHmcQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715777986; x=1716382786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkVGQ0yCW+Kcc4HDyyz/k3gv3ZB4NHmjbpXeWCF7e+8=;
        b=J2TNInUK+R2cUk8WT4KHCywAIYyBvgBjvfpkkSvxk3pwUTMInnHSmtCrGUjN5zoJ3o
         8n4mHMlhLLW3Nb99sIIe1n1BnxcJ/oW9zpGrPV9dmTJdUt43F+gMoaoqEK+igUVMM/bl
         7YNaY4DyU2sCy+1AYAiYGCYzZ55zzzHEu8gRBafKCdNBEdxCECI82wxRbYJSzRHj/Mxp
         zlZATkU06aq1QXxwn/Nmfiz76gvbXEaqQ/qERoQIqThQMQW1tTWZ2yBoeem8H3/h80fd
         cs30hnoA1ssQ8tujvD0zwNERNeoHq4sJpS9IHKXHkvwOQDFYiUjJn42dmiMtVM4ka1yY
         MtKA==
X-Forwarded-Encrypted: i=1; AJvYcCUfI3uquX+Oizqta+UU4e2mVoI3u6ekCKsuprClGbXFyXRYtggkBBtnt0gIl0pr1kx2j5I0imSaBjCbdQcjUna1rMmX3zusDQjTIFbWoiw=
X-Gm-Message-State: AOJu0Yz9nlr5qdi3yFlY7HEtuismB/p5c5L/iqCW28SPhK6jBpLalgg+
	LnMITS9utGNxp6uzxhx2+MWT2+5scgJ80Bl7+RDTs3jlr27+YcDpqMXiCKSyUP7Vbx39vTBJRdb
	QibQNSQNvoTTzAUdot9gRN8CHEj8i6BznBwYC4Q==
X-Google-Smtp-Source: AGHT+IHNPJTgQV6SbwXzpCan+9bKdOmsJIDH9yB5dV2Pc6wGnhjJkvsLlMENdEmFgwLgFQ7rmGEWrwg+pLU37bsC32M=
X-Received: by 2002:a05:6870:1596:b0:23c:e63c:4564 with SMTP id
 586e51a60fabf-24111c626e7mr8911279fac.7.1715777986145; Wed, 15 May 2024
 05:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com> <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
In-Reply-To: <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 15 May 2024 13:59:35 +0100
Message-ID: <CA+zSX=bbVVJzA=a-ZDgTashtu8-t+BqWVpzWxahOve+WGZLzrQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	"committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 10:51=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 14/05/2024 10:25 am, Jan Beulich wrote:
> > On 03.04.2024 08:16, Jan Beulich wrote:
> >> On 02.04.2024 19:06, Andrew Cooper wrote:
> >>> The commit makes a claim without any kind of justification.
> >> Well, what does "have no business" leave open?
> >>
> >>> The claim is false, and the commit broke lsevtchn in dom0.
> >> Or alternatively lsevtchn was doing something that was never meant to =
work
> >> (from Xen's perspective).
> >>
> >>>  It is also quite
> >>> obvious from XSM_TARGET that it has broken device model stubdoms too.
> >> Why would that be "obvious"? What business would a stubdom have to loo=
k at
> >> Xen's side of an evtchn?
> >>
> >>> Whether to return information about a xen-owned evtchn is a matter of=
 policy,
> >>> and it's not acceptable to short circuit the XSM on the matter.
> >> I can certainly accept this as one possible view point. As in so many =
cases
> >> I'm afraid I dislike you putting it as if it was the only possible one=
.
> >>
> >> In summary: The supposed justification you claim is missing in the ori=
ginal
> >> change is imo also missing here then: What business would any entity i=
n the
> >> system have to look at Xen's side of an event channel? Back at the tim=
e, 3
> >> people agreed that it's "none".
> > You've never responded to this reply of mine, or its follow-up. You als=
o
> > didn't chime in on the discussion Daniel and I were having. I consider =
my
> > objections unaddressed, and in fact I continue to consider the change t=
o
> > be wrong. Therefore it was inappropriate for you to commit it; it needs
> > reverting asap. If you're not going to do so, I will.
>
> You tried defending breaking a utility with "well it shouldn't exist then=
".
>
> You don't have a leg to stand on, and two maintainers of relevant
> subsystems here just got tired of bullshit being presented in place of
> any credible argument for having done the change in the way you did.
>
> The correct response was "Sorry I broke things.  Lets revert this for
> now to unbreak, and I'll see about reworking it to not intentionally
> subvert Xen's security mechanism".
>
> As it stands, you're 2-1 outvoted, and wasted any sympathy I may have
> had for the principle of the change based on the absurdity of your
> arguments.

We have a simple process for dealing with this situation, Andy, which
you didn't follow.  You can't just go checking things in because you
feel strongly about it.

 -George

