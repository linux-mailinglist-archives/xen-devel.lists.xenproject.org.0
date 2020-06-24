Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBD2073C5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4tz-00023p-Hw; Wed, 24 Jun 2020 12:53:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VPr=AF=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jo4tx-00023Y-RV
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:53:17 +0000
X-Inumbo-ID: ac0a6550-b619-11ea-8496-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac0a6550-b619-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 12:53:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a6so2181660wrm.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=erJri2IUc1afPi5W9caFzfb9aRxEdZUWLTxuf4CtQkw=;
 b=kEUHQYow9kKir4HNF8IYSdtmgawte+egcY3TevRLt1W/9f9rrlbKAuEhMpzgtUklKO
 DGC0qmKdq3dT+tREc6lic0R1NtJa+8OD3qSZKYD9fMRkTudBMyrK5gRJmMIC9hLozvTm
 fgR8b/diZSY99jyd+wOtcv67SzODaao6f1gnQG6R5FoWfMu4ef8TsHi5h9ODUQq7jzcA
 p10YfbDUvD5kBsD0gab+G9btUhqYFwzp2n003WfMZK2g9qjMqvJ4l57Cehsj1Jcl+CZ/
 +OOMnUXN67jxbSs2TPLqXLDuX/RmslTRaxUXnfYEybH+6o9FUiN66VUer6k8hjs8JJQ7
 1tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=erJri2IUc1afPi5W9caFzfb9aRxEdZUWLTxuf4CtQkw=;
 b=Ix78L036PrujqQrIS9wEPi/YH7tXAopFpguVURXVLqUru0LaFMRQaTY0W5XzIYomOF
 2eB+rw/Qppuo2uLBinIiVWJI0Yc4fonioBiU7uLsIEbCuKClNr2NlqGW+cg67rjzQjKu
 mznIYOUwMduWJNE66dHmtPrYh+rgNthmye75wa1uuafXyB6u1GHc9KX3i75UcW7wH6O9
 Sy9VY2oou/KH5wpqdCcT2RtOpmHACT/13ImjvQMAUpRzZOml2RpysS++SU8yCzCLZotU
 66i2hCQCBPfrx93FW6IboKFJEc7qeN7aBtlMFV3unV11Q9mTXlLmTc9nwfN/JINiz/dm
 fiaw==
X-Gm-Message-State: AOAM5307IxvXMh/N9eHpxQ8kb8BtnLJwdJlT+80BcT3124iGTA4eotdK
 StcgztmJ0k9zBIVYrDUNT5myfV66zK/g1VcqvU4=
X-Google-Smtp-Source: ABdhPJyYZjpyarrBmuEOQEoSXgv0/j0u4MKq4eiYYARiftGnLceMfY2jZQwxLUpHIEM0C69qzqVH7XMR5hNIOccpnTg=
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr26139887wrr.259.1593003195949; 
 Wed, 24 Jun 2020 05:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
 <901046162.11470361.1592874264410.JavaMail.zimbra@cert.pl>
 <32b7234b-dc64-a0ea-2c5c-448bcec44c34@suse.com>
 <bfa3d028-58de-eb99-fcff-dfc4cf1b93f1@citrix.com>
 <afb85b23-40d4-c054-a246-2741b7ce4208@suse.com>
 <daef0e13-eb49-fa79-30e3-67b49fb57b71@citrix.com>
In-Reply-To: <daef0e13-eb49-fa79-30e3-67b49fb57b71@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Jun 2020 06:52:39 -0600
Message-ID: <CABfawh=uri_X1aGseJqfsWN9DyB_3mycPwbQwOaLPjB5xX4hnA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 6:40 AM Andrew Cooper <andrew.cooper3@citrix.com> w=
rote:
>
> On 24/06/2020 11:03, Jan Beulich wrote:
> > On 23.06.2020 19:24, Andrew Cooper wrote:
> >> On 23/06/2020 09:51, Jan Beulich wrote:
> >>> On 23.06.2020 03:04, Micha=C5=82 Leszczy=C5=84ski wrote:
> >>>> ----- 22 cze 2020 o 18:16, Jan Beulich jbeulich@suse.com napisa=C5=
=82(a):
> >>>>
> >>>>> On 22.06.2020 18:02, Micha=C5=82 Leszczy=C5=84ski wrote:
> >>>>>> ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisa=C5=
=82(a):
> >>>>>>> On 22.06.2020 16:35, Micha=C5=82 Leszczy=C5=84ski wrote:
> >>>>>>>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisa=
=C5=82(a):
> >>>>>>>>> Is any of what you do in this switch() actually legitimate with=
out
> >>>>>>>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
> >>>>>>>>> remarks elsewhere I imply you expect the param that you current=
ly
> >>>>>>>>> use to be set upon domain creation time, but at the very least =
the
> >>>>>>>>> potentially big buffer should imo not get allocated up front, b=
ut
> >>>>>>>>> only when tracing is to actually be enabled.
> >>>>>>>> Wait... so you want to allocate these buffers in runtime?
> >>>>>>>> Previously we were talking that there is too much runtime logic
> >>>>>>>> and these enable/disable hypercalls should be stripped to absolu=
te
> >>>>>>>> minimum.
> >>>>>>> Basic arrangements can be made at domain creation time. I don't
> >>>>>>> think though that it would be a good use of memory if you
> >>>>>>> allocated perhaps many gigabytes of memory just for possibly
> >>>>>>> wanting to enable tracing on a guest.
> >>>>>>>
> >>>>>> From our previous conversations I thought that you want to have
> >>>>>> as much logic moved to the domain creation as possible.
> >>>>>>
> >>>>>> Thus, a parameter "vmtrace_pt_size" was introduced. By default it'=
s
> >>>>>> zero (=3D disabled), if you set it to a non-zero value, then trace=
 buffers
> >>>>>> of given size will be allocated for the domain and you have possib=
ility
> >>>>>> to use ipt_enable/ipt_disable at any moment.
> >>>>>>
> >>>>>> This way the runtime logic is as thin as possible. I assume user k=
nows
> >>>>>> in advance whether he/she would want to use external monitoring wi=
th IPT
> >>>>>> or not.
> >>>>> Andrew - I think you requested movement to domain_create(). Could
> >>>>> you clarify if indeed you mean to also allocate the big buffers
> >>>>> this early?
> >>>> I would like to recall what Andrew wrote few days ago:
> >>>>
> >>>> ----- 16 cze 2020 o 22:16, Andrew Cooper andrew.cooper3@citrix.com w=
rote:
> >>>>> Xen has traditionally opted for a "and turn this extra thing on
> >>>>> dynamically" model, but this has caused no end of security issues a=
nd
> >>>>> broken corner cases.
> >>>>>
> >>>>> You can see this still existing in the difference between
> >>>>> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
> >>>>> required to chose the number of vcpus for the domain) and we're mak=
ing
> >>>>> good progress undoing this particular wart (before 4.13, it was
> >>>>> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
> >>>>> issuing other hypercalls between these two).
> >>>>>
> >>>>> There is a lot of settings which should be immutable for the lifeti=
me of
> >>>>> the domain, and external monitoring looks like another one of these=
.
> >>>>> Specifying it at createdomain time allows for far better runtime
> >>>>> behaviour (you are no longer in a situation where the first time yo=
u try
> >>>>> to turn tracing on, you end up with -ENOMEM because another VM boot=
ed in
> >>>>> the meantime and used the remaining memory), and it makes for rathe=
r
> >>>>> more simple code in Xen itself (at runtime, you can rely on it havi=
ng
> >>>>> been set up properly, because a failure setting up will have killed=
 the
> >>>>> domain already).
> >>>>>
> >>>>> ...
> >>>>>
> >>>>> ~Andrew
> >>>> according to this quote I've moved buffer allocation to the create_d=
omain,
> >>>> the updated version was already sent to the list as patch v3.
> >>> I'd still like to see an explicit confirmation by him that this
> >>> use of memory is indeed what he has intended. There are much smaller
> >>> amounts of memory which we allocate on demand, just to avoid
> >>> allocating some without then ever using it.
> >> PT is a debug/diagnostic tool.  Its not something you'd run in
> >> production against a production VM.
> > Well, the suggested use with introspection made me assume differently.
> > If this is (now and forever) truly debug/diag only, so be it then.
>
> At the end of the day, it is a fine grain profiling tool, meaning that
> it is not used in the common case.
>
> The usecase presented is for fuzzing, using the execution trace
> generated by the CPU, rather than the current scheme which allegedly
> involves shuffling breakpoints around.

That's indeed the usecase we are looking to use it for. But there is
also some experimental malware analysis scenarios it is targeted for
which is what I believe the CERT folks are mostly interested in, like
https://www.vmray.com/cyber-security-blog/back-to-the-past-using-intels-pro=
cessor-trace-for-enhanced-analysis.
I could also imagine this to be useful for IDS/IPS solutions like what
Bitdefender is building but I'm just speculating since the overhead
might be prohibitive for that use-case. I would consider all these
scenarios experimental at this point and absolutely not something to
enable by default. If someone presents a need for this to be supported
on production VMs that require turning it on/off at runtime not
knowing whether the feature will be used when the domain is created we
can certainly revisit the topic. But I don't expect that to happen any
time soon, if at all.

Tamas

