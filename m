Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043C1B1E09
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 07:11:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQlB9-0003Hg-Ji; Tue, 21 Apr 2020 05:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N3RI=6F=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jQlB7-0003Ha-Rx
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 05:10:37 +0000
X-Inumbo-ID: 6f47dd22-838e-11ea-83d8-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f47dd22-838e-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 05:10:36 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id gr25so9967418ejb.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ahl719VdLrqEkLxbHehMoqTOI51NEmagjMQ89jY7A6w=;
 b=ODYjVXyvzD+D2Un8S07Ed/yk1M6L5FhBDMInxcU53h10wlEVrkVotnfOCe4Ug6hGh8
 qeUKmh6b1GJDpcXBpEfZkkGnCAUn+jajfG8xPu5P71ebgw8yWlFnarScifJkBZKwU2Fz
 oVEj82dua/HkzWTs+xiIEztddtTM5it4MaLw9KqrJnIpnsy/KwQqXp/bC7agogfDKuJ3
 6uudW9vEzjubWRhepCSGiWhMZuGgzVwdcSEfeyeLJYMluaXT4qz/Grdl3SOTaQnHfQ9l
 1xZ4oqnioBoBdsSm1kHw46DdYiXYOkKfUsS78rfkE5ukSSSzJaYj4L7JBwGqjq12ImsI
 h0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ahl719VdLrqEkLxbHehMoqTOI51NEmagjMQ89jY7A6w=;
 b=i8xlRVf185k/9F8Y0jCN6g7RZ05MSL4hZQpCJHmmgiHn64sQ+tHQjBH5UinmvXSlA4
 7WFVdKmBtEjjh6zJKAldzaZs4H6l5zIR5V1GeOOb3xeDXuUthhndTWsJjlLCKjafe4tf
 Gt406ToHwZ6B5Q0dzRZ1Rmk0SCEmuuAxakYZqFD2BLjEju3lZ+412Lb2kXd5BjXAQJr5
 umQQ801q6pCBG8k7QvEOWDR3IVDRpeOFii+Qr+QU2CHYk7gBlmAaf9M54+eEuKojEswR
 OwemLeWVLcGInuk6H8qvnw1ydaT/inW7hIHmYZ0YJ8KOG+hIrjZvxBMuwpnKBVtmGA3x
 jpDw==
X-Gm-Message-State: AGi0PuaklNhlw3xcyrPmOFwSijxKGicBFc7HQG1E4gL1y+FvaEenDiia
 kqngsGudZqE5iQOGt6ZJ1F92iX4c5x8=
X-Google-Smtp-Source: APiQypKUX/bQQL0MiQgNqYnxCHF9JYwSwzM3cyfOfrcLz9CQTYpJUdnVsx4EmvcZiYvJ7oVZfzgdiQ==
X-Received: by 2002:a17:906:46da:: with SMTP id
 k26mr19946096ejs.106.1587445835643; 
 Mon, 20 Apr 2020 22:10:35 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id w9sm358723ejn.54.2020.04.20.22.10.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 22:10:34 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id x25so2074480wmc.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 22:10:34 -0700 (PDT)
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr2857152wml.84.1587445834173; 
 Mon, 20 Apr 2020 22:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
 <20200420074516.GQ28601@Air-de-Roger>
 <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
 <686dafe9-54f6-3224-d2ff-8cfb99734b2c@suse.com>
 <CABfawh=TdgdaQnwDoAvGyMMY-HyRyqg9T5oyrfadie9_7GZLeg@mail.gmail.com>
 <d7e53215-9fba-a648-1988-88333a53596f@suse.com>
 <CABfawhkKybZJHMxgK0YTbL75WQryijJjBKs=urncqW4cNd62NQ@mail.gmail.com>
In-Reply-To: <CABfawhkKybZJHMxgK0YTbL75WQryijJjBKs=urncqW4cNd62NQ@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Apr 2020 23:09:57 -0600
X-Gmail-Original-Message-ID: <CABfawhk_TTEXhWAT3iMDiARSh=UT3bKh=DZj4LEsdci-3cDuzw@mail.gmail.com>
Message-ID: <CABfawhk_TTEXhWAT3iMDiARSh=UT3bKh=DZj4LEsdci-3cDuzw@mail.gmail.com>
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

On Mon, Apr 20, 2020 at 10:09 AM Tamas K Lengyel <tamas@tklengyel.com> wrot=
e:
>
> On Mon, Apr 20, 2020 at 9:51 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 20.04.2020 16:27, Tamas K Lengyel wrote:
> > > On Mon, Apr 20, 2020 at 8:19 AM Jan Beulich <jbeulich@suse.com> wrote=
:
> > >>
> > >> On 20.04.2020 16:15, Tamas K Lengyel wrote:
> > >>> On Mon, Apr 20, 2020 at 1:45 AM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
> > >>>>
> > >>>> On Fri, Apr 17, 2020 at 10:06:31AM -0700, Tamas K Lengyel wrote:
> > >>>>> When a forked VM is being reset while having vm_events active, re=
-copying the
> > >>>>> vCPU info page can lead to events being lost. This seems to only =
affect a
> > >>>>> subset of events (interrupts), while not others (cpuid, MTF, EPT)=
 thus it was
> > >>>>
> > >>>> I'm slightly lost by the sentence, is the guest or the hypervisor
> > >>>> the one losing events?
> > >>>>
> > >>>> Ie: interrupts are events from a guest PoV, but cpuid or EPT is no=
t
> > >>>> something that triggers events that are injected to the guest. I t=
hink
> > >>>> the commit message needs clarification.
> > >>>
> > >>> Sorry, what I meant was software interrupts are not triggered anymo=
re,
> > >>> ie. int3 and it's associated event is not sent to the monitor
> > >>> application (VM_EVENT_REASON_SOFTWARE_BREAKPOINT).
> > >>>
> > >>>>
> > >>>>> not discovered beforehand. Only copying vCPU info page contents d=
uring initial
> > >>>>> fork fixes the problem.
> > >>>>
> > >>>> Hm, I'm not sure I understand why this is causing issues. When you
> > >>>> reset a fork you should reset the vcpu info page, or else event ma=
sks would
> > >>>> be in a wrong state?
> > >>>
> > >>> When we reset a fork we only want to 1) discard any memory allocate=
d
> > >>> for it 2) reset the vCPU registers. We don't want to reset event
> > >>> channels or anything else. We have active vm_events on the domain a=
nd
> > >>> the whole point of doing a fork reset is to avoid having to
> > >>> reinitialize all that as it's quite slow.
> > >>
> > >> So for an arbitrary piece of state, what are the criteria to establi=
sh
> > >> whether to copy or re-init them during a fork? Is it really now and
> > >> forever only memory that wants resetting? I have to admit I'm confus=
ed
> > >> by you also mentioning CPU registers - aren't they to be copied rath=
er
> > >> than reset?
> > >
> > > Registers are being reset by copying them from the parent. Allocated
> > > memory is discarded as the memory that's needed for the new execution
> > > will get copied when EPT faults happen as it's executing. The goal is
> > > to put the domain back to its initial execution state without having
> > > to reinitialize vm_events. In our experiments when the forks are
> > > executed only for a very short period (fuzzing), having to
> > > reinitialize the vm_event interfaces mean going from ~100 execution/s
> > > to ~2 executions/s. Unfortunately in the current state the fork
> > > doesn't generate the required vm_events after the first execution and
> > > for some reason it only happens for int3 generated events.
> >
> > Thanks, but I'm afraid this doesn't answer my question regarding the
> > criteria for what should be put back to the fork's initial state vs
> > what should be left as is. In fact _anything_ not getting reset to
> > initial state would seem to need special justification (beyond
> > performance considerations).
>
> From my PoV everything should be reset as long as it doesn't interfere
> with already registered vm_events. The only part that seems to
> interfere with the regular flow of events right now is the
> vcpu_info_mfn.

Alright, I figured out what's really happening here. During fork reset
we iterate over all pages belonging to the fork, releasing all pages
that pass p2m_is_sharable(p2mt) check. Unfortunately the vcpu info
pages also pass this check. Because of that the pages are removed from
the p2m but remain mapped to the vcpu structs. No wonder this was
causing all sorts of weirdness, if the guest tries to access the vcpu
info pages it would cause endless pagefaults, which would manifest as
events no longer appearing as expected (in this case the int3 event).
Re-copying the vcpu info page's content from the parent is perfectly
fine during reset, that causes no issues if the pages remain in the
p2m. I'll be sending a different patch that fixes this bug and with a
better commit message.

Tamas

