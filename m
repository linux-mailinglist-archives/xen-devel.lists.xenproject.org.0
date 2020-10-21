Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722142950A9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 18:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10113.26697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGsP-0007nb-T7; Wed, 21 Oct 2020 16:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10113.26697; Wed, 21 Oct 2020 16:22:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVGsP-0007nC-Pq; Wed, 21 Oct 2020 16:22:13 +0000
Received: by outflank-mailman (input) for mailman id 10113;
 Wed, 21 Oct 2020 16:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=286h=D4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kVGsO-0007n7-EF
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 16:22:12 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e174ff0-ac62-4368-8320-3dc07b8e8ea3;
 Wed, 21 Oct 2020 16:22:11 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y16so3316806ljk.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 09:22:11 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=286h=D4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kVGsO-0007n7-EF
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 16:22:12 +0000
X-Inumbo-ID: 0e174ff0-ac62-4368-8320-3dc07b8e8ea3
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0e174ff0-ac62-4368-8320-3dc07b8e8ea3;
	Wed, 21 Oct 2020 16:22:11 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y16so3316806ljk.1
        for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l7c0S9vOF+ht2BiXcHdKl9h63RTgilNPsS+b9BKHDac=;
        b=PhfaJsniuA4LOyaSRG6ajIIJkvlX2R8YNkrDcalFA1i/L/CzWG7hrmKEpkbF9aGdKU
         QTMZUx667Dj716CiYgESrAaO7hGTXXrHOfw1sEkhwLIqahdZ2BRi9Gp6QTv78Ctt6XzJ
         fEi6YPKrjwskbdTKMnVXmK39M4flSaBOuUshcUmHxlfCDKAoBm+XLkggIXTKrWV0gcbB
         DaGU9BIf+uEjb8IV/7KyLGd3UOhhFMpWGEvHiQpFG4O796gB+PMMqTyx7EH+zn5srNHJ
         GXAyWwGDZl/n7j01yhiUtbnAWVOlZVbWfLze49Wg+7Sr8Mc2THj3y1AsxhraJ4iKICfY
         62FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7c0S9vOF+ht2BiXcHdKl9h63RTgilNPsS+b9BKHDac=;
        b=aPcH3lq14Xw8U5ahTNE6Twb1Apzo7EbIOX6yc85plDt7dJkazPP767bprRqpQWHmip
         mLqwZZQymwxayA9Rst3CTFlKVqAsAvcjPx1G9z9Z+wPrkzASPfHS9zOkESoluCYaxawW
         dfjIZjfagNnfbwHDVIM29QgNKeOBVa3pRVaKBvgQlfpUDy1AGK5SKNK+EHHqYe34LNWE
         dtuwN9tee1Az7XgY6HoFj/EiAYP9riD4p6SfZACk12HyKFdmNYxlk8HuPcl7iKUiho+G
         ac+qmdD3ZciXkU9uF0hOiPVofrK3Sc/NTEVWfcWCk1ewSXS5BuMRTW4YNtm1V0X3ILu2
         34aw==
X-Gm-Message-State: AOAM531vtSsEb/GFqeAw3d6lqhncPAzm6RtSeeAGpWX+DBxXOYLsAz9p
	B/hp7wSvET0Ir3Ukimlz8cbTwPzcJECQsJ1JRiE=
X-Google-Smtp-Source: ABdhPJxTm93YGz2oS64DClXv+a1gKIcdRnNgChqTsns7+gRnEBNhsiz6jreAYCE/S7nDzhUv4KaSeqgsK0CG+bGx/bw=
X-Received: by 2002:a2e:96d2:: with SMTP id d18mr1701200ljj.407.1603297329809;
 Wed, 21 Oct 2020 09:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
In-Reply-To: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Oct 2020 12:21:58 -0400
Message-ID: <CAKf6xpt7zgM3HghQru28kovd0m7z84bAR8Uqt6KKxbSrvQv8ZA@mail.gmail.com>
Subject: Re: XSM and the idle domain
To: Hongyan Xia <hx242@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2020 at 10:35 AM Hongyan Xia <hx242@xen.org> wrote:
>
> Hi,

Hi, Hongyan.

I'm familiar with Flask but not particularly familiar with other XSMs
or CONFIG_XSM=n.

> A while ago there was a quick chat on IRC about how XSM interacts with
> the idle domain. The conversation did not reach any clear conclusions
> so it might be a good idea to summarise the questions in an email.
>
> Basically there were two questions in that conversation:
>
> 1. In its current state, are security modules able to limit what the
> idle domain can do?
> 2. Should security modules be able to restrict the idle domain?
>
> The first question came up during ongoing work in LiveUpdate. After an
> LU, the next Xen needs to restore all domains. To do that, some
> hypercalls need to be issued from the idle domain context and
> apparently XSM does not like it. We need to introduce hacks in the
> dummy module to leave the idle domain alone.

Is this modifying xsm_default_action() to add an is_idle_domain()
check which always succeeds?

>Our work is not compiled
> with CONFIG_XSM at all, but with CONFIG_XSM, are we able to enforce
> security policies against the idle domain?

It's not clear to me if you want to use CONFIG_XSM, or just don't want
to break it.

> Of course, without any LU
> work this does not make any difference because the idle domain does not
> do any useful work to be restricted anyway.

I think this last sentence is the main point.  It's always been
labeled xen_t, but since it doesn't go through any of the hook points,
it hasn't needed any restrictions.  Actually, reviewing the Flask
policy there is:
# Domain destruction can result in some access checks for actions performed by
# the hypervisor.  These should always be allowed.
allow xen_t resource_type : resource { remove_irq remove_ioport remove_iomem };

> Also, should idle domain be restricted? IMO the idle domain is Xen
> itself which mostly bootstraps the system and performs limited work
> when switched to, and is not something a user (either dom0 or domU)
> directly interacts with. I doubt XSM was designed to include the idle
> domain (although there is an ID allocated for it in the code), so I
> would say just exclude idle in all security policy checks.

I think it makes sense to label xen_t, even if it doesn't do anything.
As you say, it is a distinct entity from dom0 and domU.  Yes, it can
circumvent the policy, but it's not actively hurting anything.  And it
can be good to catch when it does start doing something, as you found.

Might it make sense to create a LU domain instead of using the idle
domain for Live Update?  Another approach could be to run the
idle_domain as "dom0" during Live Update, and then transition to the
regular idle_domain when it completes?  You are re-creating dom0, but
you could flip is_privileged on during live update and then remove it
once complete.

Regards,
Jason

