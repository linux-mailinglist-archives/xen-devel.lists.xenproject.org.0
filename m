Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983B1CACAD
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 14:56:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX2Xf-0004GJ-Ip; Fri, 08 May 2020 12:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWPr=6W=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jX2Xe-0004GE-03
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 12:55:50 +0000
X-Inumbo-ID: 3d522502-912b-11ea-9887-bc764e2007e4
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d522502-912b-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 12:55:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i15so1711946wrx.10
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ORZwHK2pQ3ZWxXmEBHMv2QvgRrdA781Ku91+W+/YJ4=;
 b=QidqxMQgXKZ4l3Gx7jKY1/28sx6PSUK9rSC6pwiqohRpmgD3QU7XmlnN7TOHXfdHq+
 4uIJCEVf4qFyRXWlbLd+aIAbGl6zYX9iRha+AsiEL+YdQQfogGnZKD1wPII7coFmBWuw
 kevFW8VqGWDvBSVlIDMFBTodH6ECx8KoV3CYAVT+bT89nynFnLPWV3chtfBdQATi/+LI
 RZ8STdet+5zYRGvHr4jBz8k8pyY/4OHuRJJqrOnsiCaMevQyZ3fHnwnlrm/mgv1OWo6g
 wV30lgyDnC+4HaQXgu2MORsR1RYjx4OWhZCcLZxkHRPeZtwwZwsRtVkVcDnrc9DGS693
 fD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ORZwHK2pQ3ZWxXmEBHMv2QvgRrdA781Ku91+W+/YJ4=;
 b=SLn4abFB/Upabev7VsGmJdXeQKl+2ZuDZYkNaL8yHo/zE7eRMBrVklDkn8U81OxuqI
 tiGTbA33ymcIK7TsYf8U3de29STErg6epPJOiuAOeFEFRcpAI0NLXb/TniFc1OfNv5fk
 ZWaJctyd5VNzqUHmI/r2pOBo4agtfS5UbsyXwDHZU4K0WZMk0SsjBLo419GGVyaK6Uz4
 f5BVk2uEz84LCH6++qJbMxTP5w75ZJcsSJKqTIkdGjrP2gvXtVBdPDuCeb2jq3x09baA
 0tB/6pG0J9UAlWIqB+O+2MqIoCkh2PYS3fpDeQsEF9gTEZi2mFsgcydccIIcPHDrSXkQ
 ty7g==
X-Gm-Message-State: AGi0PuadlgjqK8ENXSQh+rNqguJxjjrdmo12MgJMoR65HkcKJ/oK5o4D
 QjWofWK/io9a/eRA6NDt3eKBUpGCOdf1/OSgOuQ=
X-Google-Smtp-Source: APiQypJlQP/b59FA2T4ciVtc3yA92ItNMNOyJBoIfQ3RXzpGRsqud3VcliyH3RcBxTdpfjGXWzsSmLYqLb9MIf3ro0k=
X-Received: by 2002:adf:e450:: with SMTP id t16mr2968110wrm.301.1588942548196; 
 Fri, 08 May 2020 05:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
 <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
 <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
 <63d1ceac-81bb-c916-d403-6f227b4d0ea8@xen.org>
In-Reply-To: <63d1ceac-81bb-c916-d403-6f227b4d0ea8@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 8 May 2020 06:55:13 -0600
Message-ID: <CABfawhnvKgoP_EE7An8FDgJ11Ta8_gOo7tZ_J98sB_+Qir7=Yg@mail.gmail.com>
Subject: Re: Xen Coding style
To: Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "paul@xen.org" <paul@xen.org>, Julien Grall <jgrall@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 8, 2020 at 6:21 AM Julien Grall <julien@xen.org> wrote:
>
> Hi Jan,
>
> On 08/05/2020 12:20, Jan Beulich wrote:
> > On 08.05.2020 12:00, Julien Grall wrote:
> >> You seem to be the maintainer with the most unwritten rules. Would
> >> you mind to have a try at writing a coding style based on it?
> >
> > On the basis that even small, single aspect patches to CODING_STYLE
> > have been ignored [1],
>
> Your thread is one of the example why I started this thread. Agreeing on
> specific rule doesn't work because it either result to bikesheding or
> there is not enough interest to review rule by rule.
>
> > I don't think this would be a good use of my
> > time.
>
> I would have assumed that the current situation (i.e
> nitpicking/bikeshedding on the ML) is not a good use of your time :).
>
> I would be happy to put some effort to help getting the coding style
> right, however I believe focusing on an overall coding style would value
> everyone's time better than a rule by rule discussion.
>
> > If I was promised (reasonable) feedback, I could take what I
> > have and try to add at least a few more things based on what I find
> > myself commenting on more frequently. But really I'd prefer it to
> > be done the other way around - for people to look at the patches
> > already sent, and for me to only subsequently send more. After all,
> > if already those adjustments are controversial, I don't think we
> > could settle on others.
> While I understand this requires another investment from your part, I am
> afraid it is going to be painful for someone else to go through all the
> existing coding style bikeshedding and infer your unwritten rules.
>
> It might be more beneficial for that person to pursue the work done by
> Tamas and Viktor in the past (see my previous e-mail). This may mean to
> adopt an existing coding style (BSD) and then tweak it.

Thanks Julien for restarting this discussion. IMHO agreeing on a set
of style rules ahead and then applying universally all at once is not
going to be productive since we are so all over the place. Instead, I
would recommend we start piece-by-piece. We introduce a baseline style
checker, then maintainers can decide when and if they want to move
their code-base to be under the automated style checker. That way we
have a baseline and each maintainer can decide on their own term when
they want to have their files be also style checked and in what form.
The upside of this route I think is pretty clear: we can have at least
partial automation even while we figure out what to do with some of
the more problematic files and quirks that are in our code-base. I
would highly prefer this route since I would immediately bring all
files I maintain over to the automated checker just so I never ever
have to deal with this again manually. What style is in use to me
really doesn't matter, BSD was very close with some minor tweaks, or
even what we use to check the style just as long as we have
_something_.

Cheers,
Tamas

