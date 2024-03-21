Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C709A885FA5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696535.1087519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnM7g-0002Vq-8R; Thu, 21 Mar 2024 17:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696535.1087519; Thu, 21 Mar 2024 17:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnM7g-0002TK-4a; Thu, 21 Mar 2024 17:22:36 +0000
Received: by outflank-mailman (input) for mailman id 696535;
 Thu, 21 Mar 2024 17:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnM7f-0002TE-2C
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:22:35 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e7d172-e7a7-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 18:22:32 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-568c714a9c7so1385578a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 10:22:32 -0700 (PDT)
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
X-Inumbo-ID: 99e7d172-e7a7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711041752; x=1711646552; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85TxGiwza99wtn1DtjT+K1IsWZir75NwRzw/vclyqSw=;
        b=Nz8cLUpG80HNvqwfN3boLTbEJQ7oz5maV6SvlUwmvJz2zcdj2sIhtCIcXl84u7Esp4
         cE4W3gA15FVOaieWg9qKcT9GbA/bVXRMcs/gJaX+EBh5DKNerOMSwQlWBNDXObZ+pwYO
         pzkJ1Y18+5lyDGC+kOmnq4U2v/XEu/pKnfsP1CkAYYPrgA8XXD+14rJQFUrKW+4WiKpo
         gv8dB/vZjtQUTU3rRFPOUresUEtXiC5E01hYtYt8kfHBwPmJZpSveuf+gMiL9aKVm9du
         RG467dkAev5TzhM5utJ80BQXKMIy7nlOSp+3XnKmYvzyjL/mxwE3U8HbiCAogSCme+Bf
         R8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711041752; x=1711646552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85TxGiwza99wtn1DtjT+K1IsWZir75NwRzw/vclyqSw=;
        b=IIGLDNuj4+P8GrTRXJwQ7GMh8419NAv2SnScC5vQSb3m3T+6TM3JoUOCnAPXdde07G
         An2G5HcMIgBaFBhbRHcY+zA4+tjNsFBMBAn9Ewc8A2ooLWvwpf+zes4hTBcaXRFGISma
         Brj7Gya9f/Nf7CpIxFzbK2f28pcThQWkYNq83kvjK47D+CFjHtqgIufksh4DBfuAfAgr
         xZFfLsnwdQFQAYQZM5tbzKlugrbcCWaMJz4HlhnaVrkFeocFnC8Jf0xqiwKF8B9qlUll
         FC3nQ4AuE0auyNx2olbH7hdlF5CUSnMEVX4h8fCv8Hh8NFhhfgBXRiaDf2wtBomsk7g0
         5yAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcnsfl8ppz0z4yPgedjZ2thBjmwvBrsv8U1ed8iiF7bB0I3+QscYu7Hte3UKDXpzhyD2Msm9QlrnGCz4E+aEGzQNjEOVg1T2pdbab83hA=
X-Gm-Message-State: AOJu0YxGK5y3v5l12XnE8XcaW89p7OcQTvqHROQLlFLlrWizExgDvYsq
	P5jL2p+XcRBb7KowIdGPrO4rIHVVVc6dLU8mDd3BXCUXQC8PXA0MSZhFXiV1N9eSNcU3QSTxEHs
	FIZx75HNtYMTjwCrn+ikn7FrVGmnia5f/+/wSvfPokM50c77KdOU74w==
X-Google-Smtp-Source: AGHT+IFxuOPMnwTtSsJQyVHADhFPkyYr72krYF3I0RdJqX1e0mhpPGWYOFTIwmPFdtCA+AuIwdo1d+ErQBdUT5/3vno=
X-Received: by 2002:a17:906:46cc:b0:a46:ed8d:9e44 with SMTP id
 k12-20020a17090646cc00b00a46ed8d9e44mr60122ejs.33.1711041751911; Thu, 21 Mar
 2024 10:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-2-carlo.nonato@minervasys.tech> <05e4d3da-4130-4c57-9855-43b685ce5005@suse.com>
 <CAG+AhRU4W+umVhOHn0ZnHvex-rmEn4+T_mKVczYG4o52EV+YtA@mail.gmail.com> <2b4d6e96-0f04-4327-9875-cd0587931621@suse.com>
In-Reply-To: <2b4d6e96-0f04-4327-9875-cd0587931621@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 18:22:20 +0100
Message-ID: <CAG+AhRUJiUrnD6Ovvvy0_Naa-RnOWuYPDZqPJx2-zd7eUa828Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/14] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Mar 21, 2024 at 4:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.03.2024 16:03, Carlo Nonato wrote:
> > On Tue, Mar 19, 2024 at 3:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 15.03.2024 11:58, Carlo Nonato wrote:
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -1706,6 +1706,43 @@ This option is intended for debugging purposes=
 only.  Enable MSR_DEBUGCTL.LBR
> >>>  in hypervisor context to be able to dump the Last Interrupt/Exceptio=
n To/From
> >>>  record with other registers.
> >>>
> >>> +### llc-coloring
> >>> +> `=3D <boolean>`
> >>> +
> >>> +> Default: `false`
> >>> +
> >>> +Flag to enable or disable LLC coloring support at runtime. This opti=
on is
> >>> +available only when `CONFIG_LLC_COLORING` is enabled. See the genera=
l
> >>> +cache coloring documentation for more info.
> >>> +
> >>> +### llc-nr-ways
> >>> +> `=3D <integer>`
> >>> +
> >>> +> Default: `Obtained from hardware`
> >>> +
> >>> +Specify the number of ways of the Last Level Cache. This option is a=
vailable
> >>> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of w=
ays are used
> >>> +to find the number of supported cache colors. By default the value i=
s
> >>> +automatically computed by probing the hardware, but in case of speci=
fic needs,
> >>> +it can be manually set. Those include failing probing and debugging/=
testing
> >>> +purposes so that it's possibile to emulate platforms with different =
number of
> >>> +supported colors. If set, also "llc-size" must be set, otherwise the=
 default
> >>> +will be used.
> >>> +
> >>> +### llc-size
> >>> +> `=3D <size>`
> >>> +
> >>> +> Default: `Obtained from hardware`
> >>> +
> >>> +Specify the size of the Last Level Cache. This option is available o=
nly when
> >>> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are us=
ed to find
> >>> +the number of supported cache colors. By default the value is automa=
tically
> >>> +computed by probing the hardware, but in case of specific needs, it =
can be
> >>> +manually set. Those include failing probing and debugging/testing pu=
rposes so
> >>> +that it's possibile to emulate platforms with different number of su=
pported
> >>> +colors. If set, also "llc-nr-ways" must be set, otherwise the defaul=
t will be
> >>> +used.
> >>
> >> Wouldn't it make sense to infer "llc-coloring" when both of the latter=
 options
> >> were supplied?
> >
> > To me it looks a bit strange that specifying some attributes of the cac=
he
> > automatically enables cache coloring. Also it would require some change=
s in
> > how to express the auto-probing for such attributes.
>
> Whereas to me it looks strange that, when having llc-size and llc-nr-ways
> provided, I'd need to add a 3rd option. What purpose other than enabling
> coloring could there be when specifying those parameters?

Ok, I probably misunderstood you. You mean just to assume llc-coloring=3Don
when both llc-size and llc-nr-ways are present and not to remove
llc-coloring completely, right? I'm ok with this.

> Jan

Thanks.

