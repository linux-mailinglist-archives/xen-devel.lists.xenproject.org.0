Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454E1BCDE1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 22:59:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTXKK-0004L0-GL; Tue, 28 Apr 2020 20:59:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTXKJ-0004Kr-Tt
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 20:59:35 +0000
X-Inumbo-ID: 2a06d32a-8993-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a06d32a-8993-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 20:59:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h4so186789ljg.12
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 13:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HyILoaA1hxgjmTMdOG8qTPVjYqSUyF3z5EnUpxojgbU=;
 b=FF6Pbcimpffl1JgklYWfIck8oCUH8bXMr46L7flIw3UZisPPIF29uIVi3KoQ/o7Kpa
 LTw9vUK/psLeN6DJrpO/vHShWKvRhb094ibLbvmFy3e3KIc43uPWTG7ZM2YhGntHBW5G
 KB5iRCeIvbQU3BwMSnL+gssRw5lCjjrqjud5/SOcHnEWvIP/aC/l6wNFq60KmrR4Zoek
 vmnemb5kMraTMre9rzrYOhY/zo7cxamLafx1D/KjKuTjRVrWQ2O5KI4YAkBeB1xvgjY+
 Sw81FwqgM3+R0NcvRLkvb54WRwU4+J+mVtrFMFUqQd/b4pSdOjzUWpaZpcEEYNtXdNea
 frdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyILoaA1hxgjmTMdOG8qTPVjYqSUyF3z5EnUpxojgbU=;
 b=HPyW2yQMVuEzpsyPsfK9sSwK6DkrOvUxM8w/dyE9FOOe3w06s/ss5mJoi0pvxB/X3P
 BJfAxZOA6RtX22jk37A7emiLa4K2Nd3RD2ZKGgsyAJbKMOrUU+CDeY0JpGedinjtedfe
 kD5vMIq86PIxXqkgxGdFJw13KGCYj4UJJO5EacbPPUZ6yu2UVOqXs69PO4fAz1qJdl36
 yJ2yM0PHm55ZbJ66w3OAiJnuywV/NIzaTaN5fFFwuqXaDJcAnNp8F3cw09Dx9l5WPES0
 4JM1PThAYqiM+kOuU0cY2Q9AZVbV7YYj+fJaJKwqfO/hFC/1/hweDb7UI7RPFzKc1Sby
 tdEw==
X-Gm-Message-State: AGi0Puauul9MtL/BS5FkW691Rlk1tA1iXoQ51WWFVYcgOiDE+qVn7xko
 fMWHD86YpEAL0HLn7ELRuWR7ugR4yuVo/DPaN8I=
X-Google-Smtp-Source: APiQypJWGlTn7zYo3pqLM6dIPZTTI02fZMODCGuqDyPmlJ5VDsqjWJ3D0RuIEzMSU7O4cCDzAuWaF9X9qY7HWbJhsKQ=
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr20514674lfg.105.1588107574099; 
 Tue, 28 Apr 2020 13:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <cfbb5553-b9dc-ee86-145f-3cab92289c4d@suse.com>
 <20200317152310.114567-1-jandryuk@gmail.com>
 <7aca5da4-2ae5-8d3d-e7df-69eb7ffb743c@suse.com>
In-Reply-To: <7aca5da4-2ae5-8d3d-e7df-69eb7ffb743c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Apr 2020 16:59:22 -0400
Message-ID: <CAKf6xpv4BSKbf7234srJcXRQGFhJY5A6q61OEAkj4N+xbmh0AA@mail.gmail.com>
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" - several
 people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 5:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.03.2020 16:23, Jason Andryuk wrote:
> > Below is the diff.  It was messier and I tidied it up some.
>
> I've looked into this some more. I can see how what we currently
> do is not in line with firmware handing off with LegacyReplacement
> mode enabled. However, this case doesn't look to apply here:

Thanks for taking a look again.  Sorry for the slow response.  I
wanted to dig through the linux history to see if there was a reason
for enabling the periodic timer there, but I haven't gotten around to
it.

> So right now the only possible approach I see to address your
> problem is to add yet another fallback mode to check_timer(),
> forcing LegacyReplacement mode to be enabled. But between /
> after which step(s) to put this there isn't at all obvious to me.

I don't really have a good suggestion here.

Aaron, I'm curious to know if you've tried this patch on your hardware
and if it helped.

Thanks again,
Jason

