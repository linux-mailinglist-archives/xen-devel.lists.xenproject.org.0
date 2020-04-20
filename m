Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D848E1B1127
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 18:10:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQYzW-0007pj-B4; Mon, 20 Apr 2020 16:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AIDV=6E=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jQYzV-0007pe-3R
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 16:09:49 +0000
X-Inumbo-ID: 5b63b654-8321-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b63b654-8321-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 16:09:48 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k22so3458692eds.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qEe9v+ERjXK1jlYcwsDG5QMcN4eKzmGnHW9zUzAGG7Q=;
 b=V769VLAuFzKV7+YqoeIQVyaZXpNWXCM6mh8phRUovWFcC5taatOoe/KpvSJmf32Uma
 iRkpt8ogL5NX7WOlWu7u7fp0chkDCXwhajgvMvdAsd+HtIbol7Pt1W9PVhY6/Gcxirdt
 fuTToqELI5YXOQs3Qp/U60DCAxxL0bEChPWK2zVYWCqnau11aug5m7u+rflqFXCXZ9zA
 2iusg/Ctod5w3N/icVboF/gyy7HFn6evylrEElLxemgVhfp2O7IyhNNpsQMLa9URSGHi
 z8jitAjBFbgAqdd1ks+GWPPLEyrCxGuGW4YgRP+cOUMlz6M1PMiUFKXWf0hG636dJLt0
 h0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qEe9v+ERjXK1jlYcwsDG5QMcN4eKzmGnHW9zUzAGG7Q=;
 b=slSRF6DpfVxqWqBPRZe349CXsaelK5x4s//aKvH7zw8o/GBlotdAJEIBmNf2pLYRGD
 Y3TH9yHD2SbiZWC96dXEGnnT9tjvYHUkXzUThgh35RdYOgnuPIQJ0fCAAlKy8AGGF36q
 4Y/xwdXOHdSTycPy4GbjG0yZRdqADRSPBnzZXW0aLWimTv2mMY66Uu1pUssC4fRtn2GB
 Zil+5IEH0lLMhauhrHqh4NyQ2nDyc3sYEoa2MOonyZ9ULQcN62g7Xz71zcTFeTVA+g6K
 Te76sGXRAWZ0zYmlwbJ7kyTebIkHoVffexVJgwWKV9JVnOMjVN2PhksF1z7OAQTpy7jv
 C/kg==
X-Gm-Message-State: AGi0PuagVlw+CEGBIFSYW9QAlmiUVPpBDXZTDCQ0gR0qE/DehdU4K7Di
 dsm05WRz7vr+bCtbL1eTD3AciPRrc5E=
X-Google-Smtp-Source: APiQypKldem4IQ0iMW6iSIs3C4uRmhaZvDzHY6WLwsnfpFBjFN9sBJJAA/p/00n1LUkfwk9TieeexA==
X-Received: by 2002:a50:e841:: with SMTP id k1mr14267708edn.245.1587398986846; 
 Mon, 20 Apr 2020 09:09:46 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id l7sm189947ejx.82.2020.04.20.09.09.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 09:09:45 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id i10so12856148wrv.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 09:09:45 -0700 (PDT)
X-Received: by 2002:adf:f0d2:: with SMTP id x18mr19269206wro.259.1587398985454; 
 Mon, 20 Apr 2020 09:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
 <20200420074516.GQ28601@Air-de-Roger>
 <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
 <686dafe9-54f6-3224-d2ff-8cfb99734b2c@suse.com>
 <CABfawh=TdgdaQnwDoAvGyMMY-HyRyqg9T5oyrfadie9_7GZLeg@mail.gmail.com>
 <d7e53215-9fba-a648-1988-88333a53596f@suse.com>
In-Reply-To: <d7e53215-9fba-a648-1988-88333a53596f@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Apr 2020 10:09:08 -0600
X-Gmail-Original-Message-ID: <CABfawhkKybZJHMxgK0YTbL75WQryijJjBKs=urncqW4cNd62NQ@mail.gmail.com>
Message-ID: <CABfawhkKybZJHMxgK0YTbL75WQryijJjBKs=urncqW4cNd62NQ@mail.gmail.com>
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

On Mon, Apr 20, 2020 at 9:51 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.04.2020 16:27, Tamas K Lengyel wrote:
> > On Mon, Apr 20, 2020 at 8:19 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 20.04.2020 16:15, Tamas K Lengyel wrote:
> >>> On Mon, Apr 20, 2020 at 1:45 AM Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com> wrote:
> >>>>
> >>>> On Fri, Apr 17, 2020 at 10:06:31AM -0700, Tamas K Lengyel wrote:
> >>>>> When a forked VM is being reset while having vm_events active, re-c=
opying the
> >>>>> vCPU info page can lead to events being lost. This seems to only af=
fect a
> >>>>> subset of events (interrupts), while not others (cpuid, MTF, EPT) t=
hus it was
> >>>>
> >>>> I'm slightly lost by the sentence, is the guest or the hypervisor
> >>>> the one losing events?
> >>>>
> >>>> Ie: interrupts are events from a guest PoV, but cpuid or EPT is not
> >>>> something that triggers events that are injected to the guest. I thi=
nk
> >>>> the commit message needs clarification.
> >>>
> >>> Sorry, what I meant was software interrupts are not triggered anymore=
,
> >>> ie. int3 and it's associated event is not sent to the monitor
> >>> application (VM_EVENT_REASON_SOFTWARE_BREAKPOINT).
> >>>
> >>>>
> >>>>> not discovered beforehand. Only copying vCPU info page contents dur=
ing initial
> >>>>> fork fixes the problem.
> >>>>
> >>>> Hm, I'm not sure I understand why this is causing issues. When you
> >>>> reset a fork you should reset the vcpu info page, or else event mask=
s would
> >>>> be in a wrong state?
> >>>
> >>> When we reset a fork we only want to 1) discard any memory allocated
> >>> for it 2) reset the vCPU registers. We don't want to reset event
> >>> channels or anything else. We have active vm_events on the domain and
> >>> the whole point of doing a fork reset is to avoid having to
> >>> reinitialize all that as it's quite slow.
> >>
> >> So for an arbitrary piece of state, what are the criteria to establish
> >> whether to copy or re-init them during a fork? Is it really now and
> >> forever only memory that wants resetting? I have to admit I'm confused
> >> by you also mentioning CPU registers - aren't they to be copied rather
> >> than reset?
> >
> > Registers are being reset by copying them from the parent. Allocated
> > memory is discarded as the memory that's needed for the new execution
> > will get copied when EPT faults happen as it's executing. The goal is
> > to put the domain back to its initial execution state without having
> > to reinitialize vm_events. In our experiments when the forks are
> > executed only for a very short period (fuzzing), having to
> > reinitialize the vm_event interfaces mean going from ~100 execution/s
> > to ~2 executions/s. Unfortunately in the current state the fork
> > doesn't generate the required vm_events after the first execution and
> > for some reason it only happens for int3 generated events.
>
> Thanks, but I'm afraid this doesn't answer my question regarding the
> criteria for what should be put back to the fork's initial state vs
> what should be left as is. In fact _anything_ not getting reset to
> initial state would seem to need special justification (beyond
> performance considerations).

From my PoV everything should be reset as long as it doesn't interfere
with already registered vm_events. The only part that seems to
interfere with the regular flow of events right now is the
vcpu_info_mfn.

I've ran some further tests and seems that when the code that is being
fuzzed is in ring3, int3 events are delivered as expected after a fork
reset. But if the code in question is ring0, then the expected int3 is
not delivered. It could entirely be that in the kernel-mode case the
code takes a detour and the reason we don't see the expected int3 is
not an interference with vm_events directly, rather a crash in the
guest due to the vcpu_info_mfn being reset. In either case, it needs
to be avoided.

Tamas

Tamas

