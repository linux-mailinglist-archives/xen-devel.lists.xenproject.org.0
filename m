Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043734AADB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 16:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101885.195171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnzG-00029D-80; Fri, 26 Mar 2021 15:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101885.195171; Fri, 26 Mar 2021 15:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnzG-00028o-4H; Fri, 26 Mar 2021 15:02:58 +0000
Received: by outflank-mailman (input) for mailman id 101885;
 Fri, 26 Mar 2021 15:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDWI=IY=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lPnzE-00028j-Cf
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:02:56 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2669dcae-f1c4-4ca0-b37c-5c60924001da;
 Fri, 26 Mar 2021 15:02:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v4so5917651wrp.13
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 08:02:55 -0700 (PDT)
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
X-Inumbo-ID: 2669dcae-f1c4-4ca0-b37c-5c60924001da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9EYukUCk06xcb646EbCae7no7wfvl6VLDADq1vmXI0o=;
        b=UCfji/lf2+3c4rSZzxazPjWPC898HA8GGZwCJCzL6OG3pDG6eNirjxr/TLKHz3ihP+
         SGEQbHdFtCcRthNqtZLbcbUn3sRrvAm/wRBJ3NFyE5sj5T1TmJYk4Xn+RCtdhp90hjpU
         C1HKq8ygyHs94tMVj19jm02EwJzgEwKhYAuW/X5hUur2cvsxXby7xjiLUxhSrbhnytP7
         ghgN3Tflnoz3+DaZGzZ/y79sNWWQhcqFZGu1jkBJ+bgu7ODNMJZDjvrH2xVlZDd30xR5
         nU+uESq4K1qXYYqy0FGndVjZT+E1+LQrTy7nNxUVcRaKoRBIlrsWLGVWOwk7xMOdWopJ
         7A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9EYukUCk06xcb646EbCae7no7wfvl6VLDADq1vmXI0o=;
        b=cQHgAn8296wSm8Zdofvhyl7PKB+j8hhhd7KZYpeCL1J7fHGxTSofp6jEDCc87aKdXb
         sqhWzPrSkRg5vtbrYCrzwJePbo17mmSzwD1ChtXnPpPuqGPsa8+68+u3yDAxIE8kJgZ8
         PviEHO0x4WAOpcxpAIcbzzfgEyGbxy4RzCVS88ltiwd/efYKTTOH7/P4Eq98yDRyE6xd
         vFWlLanl2sxq+nZAe8iHHck+3JM4hnyQu7t/pPLZ3obyEa3PJN/hmoJxEo7EFoPrCG6A
         BIlBrevDCWYBqLqIbW7tIQO1BW7P5RunIqD018sl6jldqrQiwaaFUEPSL5PJDbMb3ONj
         cvNQ==
X-Gm-Message-State: AOAM533FxGnh5nF3ufFdu2N03m9CyuCfbcn45JRzf6+t+H70pQDXVsvy
	WXWZeJlAP37sjUYdqyxZc9E6SDoaYxq/1IC4esY=
X-Google-Smtp-Source: ABdhPJzyl8yBvQgG0/9UIcl5dGLmnaDWMPcygHi/+H4XVougHZg/YSgITwlPMoIK+9iH0sRHaGYzdsizzjg8D055+lE=
X-Received: by 2002:adf:efc7:: with SMTP id i7mr14774994wrp.182.1616770974401;
 Fri, 26 Mar 2021 08:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com> <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com> <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
 <24669.56958.383583.53595@mariner.uk.xensource.com> <YF3uacPGPq1AqlZ9@mail-itl>
In-Reply-To: <YF3uacPGPq1AqlZ9@mail-itl>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 26 Mar 2021 11:02:18 -0400
Message-ID: <CABfawhnj7=OEgOTyZ7JeO7J8r9ccUU4Vz10UQO=HRVjFezsq9g@mail.gmail.com>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 10:23 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Mar 26, 2021 at 01:15:42PM +0000, Ian Jackson wrote:
> > Tamas K Lengyel writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable le=
gacy replacement mode unconditionally"):
> > > The problem from my perspective is that the end-users have no way to
> > > determine when that boot option is needing to be set. Having an
> > > installation step of "check if things explode when you reboot" is jus=
t
> > > plain bad. Many times you don't even have access to a remote serial
> > > console to check why Xen didn't boot. So that's not a realistic route
> > > that can be taken. If Jan's patch is applied then the only thing I'll
> > > be able to do is make all installations always-enable this option eve=
n
> > > on systems that would have booted fine otherwise without it. It is
> > > unclear if that has any downsides of its own and could very well just
> > > kick the can down the road and lead to other issues.
> >
> > Thanks for the clear explanation.
> >
> > I think our options are:
> >
> >  1. What is currently in xen.git#staging-4.15: some different set of
> >     machines do not work (reliably? at all?), constituting a
> >     regression on older hardware.
> >
> >  2. Jan's patch, with the consequences you describe.  Constituing a
> >     continued failure to properly support the newer hardware.
> >
> >  3. Andy's patches which are not finished yet and are therefore high
> >     risk.  Ie, delay the release.
>
> I do have several confirmations that the "x86/timer: Fix boot on Intel
> systems using ITSSPRC static PIT clock gating" patch indeed unbreaks
> several Intel systems. And only one report about it causing a regression
> on some AMD (although I may miss some others on the list).
> Reverting to the previous default behavior I would also call a
> regression.
>
> I have tested Andy's patches on several machines and I can confirm they
> fixed the issue - both keep the original issue fixed and fixes the
> regression.
> I see also Fr=C3=A9d=C3=A9ric (who originally reported the regression) al=
so
> confirms it fixes it for him.
>
> > Please let me know if you think this characterisation of the situation
> > is inaccurate or misleading.
>
> Both versions (with "x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating" and without it) got significant testing and
> results are as you summarize - each of those variants alone is broken on
> some subset of hardware. What Andrew's patches do is to combine both
> versions into one, to choose the right behavior depending on the
> hardware. Specifically, apply the workaround in place of direct panic.
> This isn't some completely new behavior. I think it is reasonably safe
> to have it included in the release, even at such late time.

My preference would also be going with route 3, if possible in 4.15
from the start. If that can't happen without significant delay to the
release then it should be the first patch to be included for 4.15.1.

Thanks,
Tamas

