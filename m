Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B758074D8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 17:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649353.1013770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAufI-0007LQ-57; Wed, 06 Dec 2023 16:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649353.1013770; Wed, 06 Dec 2023 16:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAufI-0007JC-2D; Wed, 06 Dec 2023 16:22:24 +0000
Received: by outflank-mailman (input) for mailman id 649353;
 Wed, 06 Dec 2023 16:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeUv=HR=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rAufG-0007J6-MU
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 16:22:22 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1688cee-9453-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 17:22:20 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50be3611794so6006454e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 08:22:20 -0800 (PST)
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
X-Inumbo-ID: a1688cee-9453-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701879740; x=1702484540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKY2k6qWLzZ0+QKJ7b884ROM+dHfdiMEfwKX6e/dzYM=;
        b=Qg2JdxAvEhA0G29xUx94GIY5GUbtKfFUpQ3UeBi2VX56TSHxRPUj/PvGesrIxD2REt
         PZAjvaXqo1uZwu1W5IQP70B67tfIJxws/esVuxmAoagzeMLs3W9l5JeUkTO3zhaxsoRM
         dHJWuHcsoh6RrMP25OIDjo39IqhwkyuIs543s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701879740; x=1702484540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKY2k6qWLzZ0+QKJ7b884ROM+dHfdiMEfwKX6e/dzYM=;
        b=PMKGwqR0iWTx4P4ywg+hzVpLquDr1jzG/igIu3B3wRcoORMC/+8dgpK+7WBudPVJ98
         DTCk2XbnuycRIC0m9vYLps1po+AUlehX5avTK8xv/2603MEGSP99gASFZRbYszN3kbv1
         UULbVHAjovXkrBCxi6dijTs6Z7125hJwwj8wmJYVtqT1D6wc9RZqMfctxEL5f4oM6Zgb
         TR1/wWtt43gVM6iNxXq2PW9UlACprr5BZsP9LLShOG4TTO81VdlsonXIsk/J/CiUVLo7
         iHHzPThabmB/7GV+2nIQdW7qehcRqRFRNyAVG9tpMV8W4Jr7T7IB3m+hzhYzKdmrterr
         wxqA==
X-Gm-Message-State: AOJu0YzCOXvZRtdc5JMCXs6WvIUdsgHzv3SO/ZV1DWy37aCQ9lWNNIaK
	VloKW55LJIZf8muM7BtWoB8/RuKx9Kf0AtWyscI2NA==
X-Google-Smtp-Source: AGHT+IHI4yCv4+RBd92OiH+AHmtOYRb/LzRYKPLOynvwCibYXHIV5nzvG88ddmW1+qzMRk0IAqvr5ayvTpk0f+A4AE8=
X-Received: by 2002:ac2:55b0:0:b0:50b:fdb5:3a09 with SMTP id
 y16-20020ac255b0000000b0050bfdb53a09mr638493lfg.64.1701879740083; Wed, 06 Dec
 2023 08:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20231205181218.74667-1-julien@xen.org> <CA+zSX=aUV00BwnNfFTbCE=6PuVNT=UFvE0tnMO3UhwCMh5jmHQ@mail.gmail.com>
 <50b36423-d1e1-406f-a63f-66f2e4dce68e@suse.com> <6f071eba-3995-451b-af80-efe875ec5ea8@citrix.com>
 <33d82944-6c53-45c6-93d5-48d0be9257fd@xen.org>
In-Reply-To: <33d82944-6c53-45c6-93d5-48d0be9257fd@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 6 Dec 2023 16:22:09 +0000
Message-ID: <CA+zSX=YadJYYG_b7V0+S7hfpmtTAc3RPOXTV0zBCa+y=v36M6A@mail.gmail.com>
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 11:22=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 06/12/2023 11:19, Andrew Cooper wrote:
> > On 06/12/2023 8:41 am, Jan Beulich wrote:
> >> On 06.12.2023 03:21, George Dunlap wrote:
> >>> On Tue, Dec 5, 2023 at 6:12=E2=80=AFPM Julien Grall <julien@xen.org> =
wrote:
> >>>> From: Julien Grall <jgrall@amazon.com>
> >>>>
> >>>> Several maintainers have expressed a stronger preference
> >>>> to use '-' when in filename and option that contains multiple
> >>>> words.
> >>>>
> >>>> So document it in CODING_STYLE.
> >>>>
> >>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> >>>>
> >>>> ---
> >>>>      Changes in v2:
> >>>>          - New wording
> >>>>          - Update the section title
> >>>>          - Add Jan's acked-by
> >>>> ---
> >>>>   CODING_STYLE | 9 +++++++++
> >>>>   1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/CODING_STYLE b/CODING_STYLE
> >>>> index ced3ade5a6fb..ed13ee2b664b 100644
> >>>> --- a/CODING_STYLE
> >>>> +++ b/CODING_STYLE
> >>>> @@ -144,6 +144,15 @@ separate lines and each line should begin with =
a leading '*'.
> >>>>    * Note beginning and end markers on separate lines and leading '*=
'.
> >>>>    */
> >>>>
> >>>> +Naming convention for files and command line options
> >>>> +----------------------------------------------------
> >>>> +
> >>>> +'-' should be used to separate words in commandline options and fil=
enames.
> >>>> +E.g. timer-works.
> >>>> +
> >>>> +Note that some of the options and filenames are using '_'. This is =
now
> >>>> +deprecated.
> >>> Sorry for not catching this last time; "are using X" isn't really
> >>> idiomatic English; more idiomatic would be something like the
> >>> following:
> >>>
> >>> "Note that some existing options and file names use '_'.  This is now
> >>> deprecated."
> >>>
> >>> Since we're changing things, I *think* most style guides would advise
> >>> against starting the sentence with a punctuation; so perhaps:
> >>>
> >>> "Command-line options and file names should use '-' to separate words=
;
> >>> e.g., timer-works."
> >>>
> >>> And what about adding to the last paragraph:
> >>>
> >>> "When touching code around command-line parameters still using '_', i=
t
> >>> is recommended to modify the documentation to say only '-', but modif=
y
> >>> the code to accept both '-' and '_' (for backwards compatibility)."
> >> In this context see
> >> https://lists.xen.org/archives/html/xen-devel/2020-01/msg01945.html
> >> and Andrew's response
> >> https://lists.xen.org/archives/html/xen-devel/2020-01/msg02006.html
> >> I'm still in favor of addressing the issue centrally (making unnecessa=
ry
> >> adjustments like you suggest in the new paragraph). Yet I think Andrew=
's
> >> objection would cover such adjustments as much as my generic solution.
> >
> > Aliasing - and _ in the cmdline parsing breaks basic usability.
> >
> > Its fine for new options to use -, and it's even fine-ish (but only if
> > you're going to be the one doing security backports) to rename internal
> > files.
> >
> > But there is real and detrimental effect for altering the command line.
> >
> > You will get people failing to express the option they intended when
> > working with an older form of Xen.  You will need an absurd number of
> > notes in the command line docs saying "newer versions of Xen accept an
> > alias but you need to use the underscore form for backwards compatibili=
ty".
> >
> > Not to mention that there are years of notes scattered all around the
> > internet using the underscore forms, so it's likely that everyone will
> > continue to use the underscore form, meaning that you don't even have a
> > way to phase them out.
> >
> > And for what?  An attempt to pretend that we don't have 2 decades of
> > history where underscores where the norm?
> >
> > It's tinkering, for no useful benefit and a clear cost.
>
> +1 with what Andrew said.

Haven't given it full thought, because I absolutely did not want to
make this change take longer to get in. :-). The existence of
disagreement is enough for me to withdraw my suggestion.

 -George

