Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D020A2CD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 18:24:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joUet-0003C1-T2; Thu, 25 Jun 2020 16:23:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVq+=AG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1joUes-0003Bw-9l
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 16:23:26 +0000
X-Inumbo-ID: 31a7c4f0-b700-11ea-8496-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31a7c4f0-b700-11ea-8496-bc764e2007e4;
 Thu, 25 Jun 2020 16:23:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s1so7216793ljo.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 09:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbUpMJu7wKx3GgZhXQwM/K1fCpQIiCjnv9/o9CjARH8=;
 b=sk18Ju7lYnQVIeELxd+cAZ3es0sEqheEYrrha4+WDThUwMlB+ynm6VG6kjld4an6vD
 2CLrZA1NcQktaCkN/Zofq/EQCBlUxkV7GTgdKun/FZMpmfF4wrz5eP2rb9khcAhaBpom
 nUwzMdhVpSNBcPQhPBOsAZ7eBzP8YK8F90MbcSrus46B099TutXViV8/644TqX5u25rf
 LR/zMVYTgaPVO55GajeZDR0LJ7YXSMOao7LWeyr+f7KJs/f8RQM9F2QullBGOnu1rReE
 A16wJr/qusYhJrcojUBM17cHny3HUQqyU51c3ujZZNqf36F4/BEc+5o9Y3pct6zpSXUF
 wL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbUpMJu7wKx3GgZhXQwM/K1fCpQIiCjnv9/o9CjARH8=;
 b=ZnDGBpSzzlSVPxNcbeyMqKpVKs9ZIAjBD78gIPDRaswVr3WDRBZiL/GvzPQVbr2N6z
 NISAxWwIfmdmOUmEE1kJ1FbaNIt7YoLLUtKfUE5v2bhHbRLvIg+t9PbRybC5QtYSyaAP
 4CuOG9rEwCBFV4QrRnwkrvGC2yOTFgR95jK9bksI/7G+wad6LP9BwuEcC3bStT47gZqS
 eZcSM8tve4NJdhAlX7j7n+Lrrh43qTzxAEOolfXLTa28h3HcyQhiGZynuKF3e5FJWsjB
 rC+HhsxDP0+yl5Iu1JMs8h2KfVNIxGxXmHYZjqai6zEehu0ZB3EVKaVpmgvXuUhL1ZL/
 +UjA==
X-Gm-Message-State: AOAM533rOJJ09Y0rEZQvYwn6Hid+lZhsD5c+U6Vdwt0cEMnw+8vpbYyT
 vDsj+PCzl0XxYWSosy25w+ZwVKCBmPD2fGKyowY=
X-Google-Smtp-Source: ABdhPJzPaM+xb35QUSEv4sop2AAPMHot1YlPR+T6V06iMGVzFmai9+P3uwzSHOS6S3CFG9I2KsVvoXegEd1sDjv8uwE=
X-Received: by 2002:a2e:978b:: with SMTP id y11mr5423533lji.399.1593102204351; 
 Thu, 25 Jun 2020 09:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <691aebb4-87af-60df-b6ad-07cb6fef4167@suse.com>
 <24308.50838.149966.847431@mariner.uk.xensource.com>
 <64c6a187-bf90-ae69-793b-0651bedd4f88@suse.com>
In-Reply-To: <64c6a187-bf90-ae69-793b-0651bedd4f88@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 25 Jun 2020 12:23:12 -0400
Message-ID: <CAKf6xpuAHCDc-O_CwXCrRYQojDLi9Abjjphud076OCeU_eoidg@mail.gmail.com>
Subject: Re: [PATCH] scripts: don't rely on "stat -" support
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 25, 2020 at 11:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.06.2020 17:45, Ian Jackson wrote:
> > Jan Beulich writes ("[PATCH] scripts: don't rely on "stat -" support"):
> >> While commit b72682c602b8 ("scripts: Use stat to check lock claim")
> >> validly indicates that stat has gained support for the special "-"
> >> command line option in 2009, we should still try to avoid breaking being
> >> able to run on even older distros. As it has been determined, contary to
> >> the comment in the script using /dev/stdin (/proc/self/fd/$_lockfd) is
> >> fine here, as Linux specially treats these /proc inodes.
> >>
> >> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Thanks.
> >
> > The only code change here is this:
> >
> >> --- a/tools/hotplug/Linux/locking.sh
> >> +++ b/tools/hotplug/Linux/locking.sh
> >> @@ -45,18 +45,14 @@ claim_lock()
> >> -        if stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
> >> +        if stat=$( stat -L -c '%D.%i' /dev/stdin $_lockfile 0<&$_lockfd 2>/dev/null )
> >
> > Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> >
> > Has anyone executed this ?
>
> I have, of course, to confirm this fixes my issue. But I'm not sure
> that's what you've meant to ask - you may have wanted assurance
> that someone else has also tried it.

Tested-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

