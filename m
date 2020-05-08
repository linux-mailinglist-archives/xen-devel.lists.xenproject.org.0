Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34F1CB1AD
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 16:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX3vH-0003nG-Gy; Fri, 08 May 2020 14:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWPr=6W=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jX3vF-0003mk-GW
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 14:24:17 +0000
X-Inumbo-ID: 988df232-9137-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 988df232-9137-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 14:24:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g13so2116795wrb.8
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o9g/QE37gJ+MfpEr/Vqy47zFTs3KaFk/uh9jWxrFkEk=;
 b=ZrBzYHENGc6qrUH1gzmpsOeqFQ1WFwYF6+5i9cIH3WmHFi/Jzt3G1/cDDjpRcub8cD
 +Dt/W4R5idw2wU+ewMSWREzi+rGZ2PIif4ZISmfuBZjrqmSD0+lzZhtIlMjMDORmkCHd
 +6S6x5hZMZ0hRsLIdZVXWxg38mzfFEYjFSP+iI2f/ElZ3B46fH6jwz73IR/bIOw6ycr2
 TTQSrijiD9PHLm4wzPnE+t39P+3k8ZCuym8BCwtQzV4JPuYijW/uJ9bbjRQChWIaXAb0
 7y/M9fcaZtBo5RWDGCFkx9JSp1JnAdsYrOZyg5yeThISvHDaam/ywcL249Q7oMZpfT++
 lJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o9g/QE37gJ+MfpEr/Vqy47zFTs3KaFk/uh9jWxrFkEk=;
 b=PIyVmB+M60hDhUNzMYenleji0GvXeZCYX/KOpbKkDGiOe09ZDV8/pPpsJ1/Z6Hvcni
 PkuY/9Aqk1uwtIDVo8vMY0KVzOkspdx63z9qT9me2vqKC5Y7BY0wdCvWzXc8gyEF/FBs
 6h7PA7vGsc2iO7Ve+3xTRXUggP1HtB995jTp4p/OkXNn1/upShnmjBjQUqgxJE9vED5l
 HkZfkM9orfWR4JHIZyCAjsRXqRUeQLCigXRVadOs0mi0ZXLLxLHQA1madNI4aUyQ0gzy
 TQqaxLJLMo96pY/uZW71Ombu4ilvCbtlSQ5ZiGrlcnxOFfcjUBOsofRJbUftRDxiOCz2
 17gg==
X-Gm-Message-State: AGi0PubYxpysCxttV71mHp0AkyEmPaY8SdQzS4J6cjECgIcRdBYTGuGR
 AN5cAcAQTiDNZS65aDJ6po38MMEBegK0HfNXQJ0=
X-Google-Smtp-Source: APiQypKX7WcBOE22gJNn5i5LqO5X6xVHxqnz6BEMdnoAd2gX3sZYNPdz9ZMahlkof5Kdy/atrs8Q8OBekaDUU2EJdH4=
X-Received: by 2002:adf:fecf:: with SMTP id q15mr3166643wrs.259.1588947855220; 
 Fri, 08 May 2020 07:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
 <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
 <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
 <63d1ceac-81bb-c916-d403-6f227b4d0ea8@xen.org>
 <CABfawhnvKgoP_EE7An8FDgJ11Ta8_gOo7tZ_J98sB_+Qir7=Yg@mail.gmail.com>
 <10ee3601-fc34-5714-30ea-abd2f2c03cfe@suse.com>
In-Reply-To: <10ee3601-fc34-5714-30ea-abd2f2c03cfe@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 8 May 2020 08:23:40 -0600
Message-ID: <CABfawhkRcVavY+gkyvPfUTDdr1Xf=Xsmap11mgCi8cwcNyR=Ug@mail.gmail.com>
Subject: Re: Xen Coding style
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, "paul@xen.org" <paul@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 8, 2020 at 8:18 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
>
> On 08.05.20 14:55, Tamas K Lengyel wrote:
> > On Fri, May 8, 2020 at 6:21 AM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi Jan,
> >>
> >> On 08/05/2020 12:20, Jan Beulich wrote:
> >>> On 08.05.2020 12:00, Julien Grall wrote:
> >>>> You seem to be the maintainer with the most unwritten rules. Would
> >>>> you mind to have a try at writing a coding style based on it?
> >>>
> >>> On the basis that even small, single aspect patches to CODING_STYLE
> >>> have been ignored [1],
> >>
> >> Your thread is one of the example why I started this thread. Agreeing =
on
> >> specific rule doesn't work because it either result to bikesheding or
> >> there is not enough interest to review rule by rule.
> >>
> >>> I don't think this would be a good use of my
> >>> time.
> >>
> >> I would have assumed that the current situation (i.e
> >> nitpicking/bikeshedding on the ML) is not a good use of your time :).
> >>
> >> I would be happy to put some effort to help getting the coding style
> >> right, however I believe focusing on an overall coding style would val=
ue
> >> everyone's time better than a rule by rule discussion.
> >>
> >>> If I was promised (reasonable) feedback, I could take what I
> >>> have and try to add at least a few more things based on what I find
> >>> myself commenting on more frequently. But really I'd prefer it to
> >>> be done the other way around - for people to look at the patches
> >>> already sent, and for me to only subsequently send more. After all,
> >>> if already those adjustments are controversial, I don't think we
> >>> could settle on others.
> >> While I understand this requires another investment from your part, I =
am
> >> afraid it is going to be painful for someone else to go through all th=
e
> >> existing coding style bikeshedding and infer your unwritten rules.
> >>
> >> It might be more beneficial for that person to pursue the work done by
> >> Tamas and Viktor in the past (see my previous e-mail). This may mean t=
o
> >> adopt an existing coding style (BSD) and then tweak it.
> >
> > Thanks Julien for restarting this discussion. IMHO agreeing on a set
> > of style rules ahead and then applying universally all at once is not
> > going to be productive since we are so all over the place. Instead, I
> > would recommend we start piece-by-piece. We introduce a baseline style
> > checker, then maintainers can decide when and if they want to move
> > their code-base to be under the automated style checker. That way we
> > have a baseline and each maintainer can decide on their own term when
> > they want to have their files be also style checked and in what form.
> > The upside of this route I think is pretty clear: we can have at least
> > partial automation even while we figure out what to do with some of
> > the more problematic files and quirks that are in our code-base. I
> > would highly prefer this route since I would immediately bring all
> > files I maintain over to the automated checker just so I never ever
> > have to deal with this again manually. What style is in use to me
> > really doesn't matter, BSD was very close with some minor tweaks, or
> > even what we use to check the style just as long as we have
> > _something_.
>
> Wouldn't it make more sense to have a patch checker instead and accept
> only patches which change code according to the style guide? This
> wouldn't require to change complete files at a time.

In theory, yes. But in practice this would require that we can agree
on a style that applies to all patches that touch any file within Xen.
We can't seem to do that because there are too many exceptions and
corner-cases and personal-preferences of maintainers that apply only
to a subset of the codebase. So AFAICT what you propose doesn't seem
to be a viable way to start.

Tamas

