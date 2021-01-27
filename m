Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0926E305B41
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 13:26:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76088.137168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4jtj-0000On-6B; Wed, 27 Jan 2021 12:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76088.137168; Wed, 27 Jan 2021 12:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4jtj-0000OO-2x; Wed, 27 Jan 2021 12:26:11 +0000
Received: by outflank-mailman (input) for mailman id 76088;
 Wed, 27 Jan 2021 12:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRfa=G6=todobom.com=claudemir@srs-us1.protection.inumbo.net>)
 id 1l4jth-0000OE-IN
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 12:26:09 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e49cec29-5b53-4afe-a705-ff9465705295;
 Wed, 27 Jan 2021 12:26:06 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id k193so1450634qke.6
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 04:26:06 -0800 (PST)
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
X-Inumbo-ID: e49cec29-5b53-4afe-a705-ff9465705295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=todobom-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4IPRbagzFIa3BqCaVe3/Ejr4PmmHmadXBYaqfUB3Mo0=;
        b=dd0H2h4lmPfRt1qNIlSyXhy2ExEX5fVSNtft3JAUSKwZjHP8e7UevHpc11N7ryE5C8
         JLc4iM1umiS3TNWxBAVSl2W2kIlY4+SurMmCDFH4+A9qMSfn18sqBAariLXXgO4D9lNq
         AwpDdxXTf8NqyBLAy32XE6mqogczGKv/uBsp5N5Pc7ezT1TZi9w2nTOhCOWF7OIAYYVd
         4+64J2hkEs9+gXBn0RDdLlCJJ/+RCHRyIWgB9HY/1TZwR1ZaQrW8lVa7FqkyjNgn2gZL
         nAl7T1OuslHdtxuHX1CRHWFAu+dgQbVy7uMsCSsGhIzNF9wfDnUjvrB982a3FRJUjaUc
         YPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4IPRbagzFIa3BqCaVe3/Ejr4PmmHmadXBYaqfUB3Mo0=;
        b=FtjyLic22gMJ6Y7RuM30Zm1EunG2XnPE4SclztlQxRqO87qVpn+fDEvS19zH/gNZZT
         jJNDLytklG/wY1UcxGk0/XXQHjanoaxeXFYm+HYDoQPLG0pcGzLMZv98xMccQEOkHaN2
         nVTBN5CXRsNPZ0s7903x8daNok4GZ62UqKNLnkv2oaSzoi4mpvgn5Puo4XQxaGc1DT0B
         WwU2D83jQecN+AxpM8yEvSadGstzL4pN1rWLFtFQf/JFqEiuWyweaRDsuIrauDNan/eW
         OomqVr5FDNgLqicJKtaxSLyXws8PWnYMDep2Nh6TVYDkw6a6Q1DMdTsdbZo8OrW/hund
         +35Q==
X-Gm-Message-State: AOAM530NuQe9iVJ3nwFkGvYOeLRZYahoVm9jwJEueh+ah7A50k/pfdkj
	y6QiZ71UFSuI0it5ClX3rFoCBD1nWnKqkB9AiE1Ekg==
X-Google-Smtp-Source: ABdhPJxeklqolwcTxta4HDca+rCCcSHc7G+49sLciK6GCokHWQPFv0A5Ol458hl30UOzybbOMkaxmanumnNZubPaBos=
X-Received: by 2002:a37:9e8a:: with SMTP id h132mr10075633qke.119.1611750365918;
 Wed, 27 Jan 2021 04:26:05 -0800 (PST)
MIME-Version: 1.0
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com> <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com> <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com> <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
In-Reply-To: <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
From: Claudemir Todo Bom <claudemir@todobom.com>
Date: Wed, 27 Jan 2021 09:25:54 -0300
Message-ID: <CANyqHYdDueVgZYJ-PNv9QDLqFAnTGxLVyMeY6XgkDOO1KGapVg@mail.gmail.com>
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 26 de jan. de 2021 =C3=A0s 08:48, Jan Beulich <jbeulich@suse.com> =
escreveu:
>
> On 25.01.2021 20:37, Claudemir Todo Bom wrote:
> > I've managed to get the debug messages on the screen using
> > vga=3Dtext-80x50,keep and disabling all messages from the kernel. Two
> > images are attached with the output running the debug patch.
>
> And the 1st of them (161303) was taken at the time of the hang of
> the kernel (or entire system), not any earlier? I ask because one
> part of the reason for the patch was to understand whether the
> rendezvousing itself would fail in some way (like one of the CPUs
> not calling in).

I could not tell if it already hung when I took the picture, but I can
tell the messages keep appearing after the hang. I tested this
enabling log messages... the screen became a mess, but I can assure
that the rendezvous function is being run and completed multiple times
after the "freeing memory" message that freezes the kernel.

> Were new log messages (from the debugging patch) still issued at
> this point, showing Xen itself was still alive?
>
> The 2nd of the pictures (162313) at least clarifies that indeed
> the commit in question had a functional effect on this system,
> because of
>
> (XEN) TSC warp detected, disabling TSC_RELIABLE
>
> I still can't figure though why the change in rendezvous handling
> (from "std" to "tsc") would have broken your system.
>
> > About the version I've used to test: since the 4.14 shows that other
> > bug with the detection of cpu features I mentioned on the other
> > subthread, I chose to work on 4.11 that doesn't shows that behaviour.
> >
> > Calling with clocksource on the xen command line changed nothing.
>
> Oh, right, because the specific feature that causes the change
> of rendezvous functions for you also is a prereq for that mode
> of operation.

Oh, this should be why reverting the code on 4.14 didn't work...
probably messed up with features introduced after 4.11.

> > I don't know if this part of code is intended to execute a lot of
> > times, but when starting with dom0_max_vcpus=3D1, the system boots up
> > and keeps showing the messages.
>
> When there's just one CPU, there's no CPU to rendezvous with.
>
> Iirc you did say that you observe the hang even with as little
> as 2 CPUs? The problem the above quoted message is supposed to
> address is normally coming into play only on multi-socket
> systems. Yet from your initial report I deduce this is a
> single socket system. So in the end I suppose there are two
> problems - one is the hang, and the other is that your system
> gets diagnosed as having an unreliable TSC (at least I didn't
> think Xeon E5 v2 should have a problem there).

It is a single socket, I was talking about virtual cpus for domain 0.

After the last tests I tried to boot it with maxcpus=3D1 parameter on
the xen command line. This changed the rendezvous code to std and the
system worked on all versions up to 4.14.

Is there any performance issue on using this parameter and this "std"
rendezvous code?

> I will want to extend the debugging patch, but I'd like to
> have clarification on some of the points above first.

If this information is good for more tests, please send the patch and
I will test it!

Best regards,
Claudemir

