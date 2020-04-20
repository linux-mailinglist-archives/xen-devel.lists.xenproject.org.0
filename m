Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D11B0E55
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:28:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXOh-0006NG-Ii; Mon, 20 Apr 2020 14:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AIDV=6E=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jQXOg-0006NB-Lb
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:27:42 +0000
X-Inumbo-ID: 17c571f2-8313-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17c571f2-8313-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 14:27:41 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id j20so7503403edj.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fHHaShK22Kc3ujSnwRS+DsjSEXQ91HZrUzjUtP445/Q=;
 b=AdX8d6ksm28L7TnElgaXLMaLkYZBpVJbaez8GcQT8octHJFfohR3O2ZBokSop8p0AB
 xu7vta75pk2/NQmgI1JdSj3r6aqZ898EzN8tYCWNysswzMsCJ7Rr/eSAdF0T+nKGOSIN
 86Sf8XH6SPW+sRjLtP9bMAVvx0Za6iNOM+oq5Su/5yRN39DY8Y7Qwj39FLNWTLMt1xEC
 FdEWSLAbblIp0rLN9LWp/bmIXlIVQMcF+DpPZz5IauDFiunEOx9to+VPiWhslEx2Tj09
 +auGWOgQHHWfbLg8q4dUV9l54paiDk29Mxkt0rlVeLJVvyGhnNlaEJ5PiS8fVCSsrejh
 aldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fHHaShK22Kc3ujSnwRS+DsjSEXQ91HZrUzjUtP445/Q=;
 b=r42AxyETagMJl0C0pFzKaHGetIqtDsVlPjIickm68XmtHEEseKuBKVw+LMrBp/goCC
 Cbr4B9a5ULQT735eZQh3UsP7DrM+xX6ceHTx9gVShUpKaAtlGkvGey2pNtgzt2YhJ2d6
 myUcXvK7Nxyi2X6r3mdZn7lC0g/2+BFb1SixY1/cY+5XSeGuB3pBUIJ3Hw3GEtNVc69b
 VvI0mfIn+f0/WKgylgw7Opf6gOYu9QxxFVM8/TWMBL4jWyOihm+F9GisKF+93JkRiJDx
 h+IfoLdhyTd7KRTLzqKhbje/g1z7xtrrXbWNdW17FZvyk7EdM7M9dB7Fmxt9hgbTm7hl
 3NJg==
X-Gm-Message-State: AGi0PuaZF4ADnorwkTFDok58RWNI3j7SulycTF5qLHizMRsBUPbvIQ3U
 tdBK4d2AcHZQTdGtFW2xeefAyq3jMik=
X-Google-Smtp-Source: APiQypKmShzy15y9E/Q02551hsoYlqlCN3DzAWUpEBt5irxfzEXGTqMupN6c7TUO1lkUK4AHXueVHA==
X-Received: by 2002:a05:6402:120a:: with SMTP id
 c10mr13575460edw.15.1587392860553; 
 Mon, 20 Apr 2020 07:27:40 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id g1sm164102ejs.51.2020.04.20.07.27.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:27:39 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id h2so11280299wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 07:27:39 -0700 (PDT)
X-Received: by 2002:a05:600c:441a:: with SMTP id
 u26mr19128706wmn.154.1587392859434; 
 Mon, 20 Apr 2020 07:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
 <20200420074516.GQ28601@Air-de-Roger>
 <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
 <686dafe9-54f6-3224-d2ff-8cfb99734b2c@suse.com>
In-Reply-To: <686dafe9-54f6-3224-d2ff-8cfb99734b2c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Apr 2020 08:27:04 -0600
X-Gmail-Original-Message-ID: <CABfawh=TdgdaQnwDoAvGyMMY-HyRyqg9T5oyrfadie9_7GZLeg@mail.gmail.com>
Message-ID: <CABfawh=TdgdaQnwDoAvGyMMY-HyRyqg9T5oyrfadie9_7GZLeg@mail.gmail.com>
Subject: Re: [PATCH v15 1/3] mem_sharing: don't reset vCPU info page during
 fork reset
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 20, 2020 at 8:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.04.2020 16:15, Tamas K Lengyel wrote:
> > On Mon, Apr 20, 2020 at 1:45 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> >>
> >> On Fri, Apr 17, 2020 at 10:06:31AM -0700, Tamas K Lengyel wrote:
> >>> When a forked VM is being reset while having vm_events active, re-cop=
ying the
> >>> vCPU info page can lead to events being lost. This seems to only affe=
ct a
> >>> subset of events (interrupts), while not others (cpuid, MTF, EPT) thu=
s it was
> >>
> >> I'm slightly lost by the sentence, is the guest or the hypervisor
> >> the one losing events?
> >>
> >> Ie: interrupts are events from a guest PoV, but cpuid or EPT is not
> >> something that triggers events that are injected to the guest. I think
> >> the commit message needs clarification.
> >
> > Sorry, what I meant was software interrupts are not triggered anymore,
> > ie. int3 and it's associated event is not sent to the monitor
> > application (VM_EVENT_REASON_SOFTWARE_BREAKPOINT).
> >
> >>
> >>> not discovered beforehand. Only copying vCPU info page contents durin=
g initial
> >>> fork fixes the problem.
> >>
> >> Hm, I'm not sure I understand why this is causing issues. When you
> >> reset a fork you should reset the vcpu info page, or else event masks =
would
> >> be in a wrong state?
> >
> > When we reset a fork we only want to 1) discard any memory allocated
> > for it 2) reset the vCPU registers. We don't want to reset event
> > channels or anything else. We have active vm_events on the domain and
> > the whole point of doing a fork reset is to avoid having to
> > reinitialize all that as it's quite slow.
>
> So for an arbitrary piece of state, what are the criteria to establish
> whether to copy or re-init them during a fork? Is it really now and
> forever only memory that wants resetting? I have to admit I'm confused
> by you also mentioning CPU registers - aren't they to be copied rather
> than reset?

Registers are being reset by copying them from the parent. Allocated
memory is discarded as the memory that's needed for the new execution
will get copied when EPT faults happen as it's executing. The goal is
to put the domain back to its initial execution state without having
to reinitialize vm_events. In our experiments when the forks are
executed only for a very short period (fuzzing), having to
reinitialize the vm_event interfaces mean going from ~100 execution/s
to ~2 executions/s. Unfortunately in the current state the fork
doesn't generate the required vm_events after the first execution and
for some reason it only happens for int3 generated events.

Tamas

