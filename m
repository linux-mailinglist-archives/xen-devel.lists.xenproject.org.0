Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA1F1FCFF1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 16:50:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlZNt-0004CN-7b; Wed, 17 Jun 2020 14:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlZNs-0004CI-4R
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 14:49:48 +0000
X-Inumbo-ID: c9a6c81c-b0a9-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9a6c81c-b0a9-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 14:49:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t194so2297363wmt.4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hSWpm274MPGhOCPHV9mk3fhBFTpLNIA6HEiBY41YUdo=;
 b=MdKXT6wgSeFrUTirZPZj5kv8cAVPehhILlAcMhokolJXU+9aRhc9MJWQjE4Vy7nkE5
 A1+mpUrziomGcZDVGLc+mf1LDhlmvp9e4+VuLoidXqCuQuZ5ovX3VLTc7LJIVGIPEry4
 2j2QLtV+RrBhAkjBir711w6GonknWsjBNt3D2Uioe4cbnTczRqZX1iZgwujypXwPQ+sf
 /esZbHa5Xkp4nZFs4LW8LaJv0lVs0qDgrE8r/p2PWo6hGfT4GZS2kEPsN0YKBQUxAsMl
 qPmVJ/3POi/qPV+8QW/hUAeKfNRzCDY7Ks6gYZzgEtF+iiJ1VDrd9SBji33tEC+nvDYN
 D/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hSWpm274MPGhOCPHV9mk3fhBFTpLNIA6HEiBY41YUdo=;
 b=RLISRybBxmHIe65zmhm8rEWIe2Ua7JEqmLsTCEAOUtmXij2i7Dggr/fq5b/5bf4O7e
 eUJvtLjF5MgkCp6/+J9/KoSzSPenW6Ledn8mOhQffWvmjAbOFOtPJ2g+TPoF7EPTXZgo
 6JhofQSylxACX/7d7m5a6ZijVinlvm2olItCTtJ1UkjgkQhTN39ABtfu8LhHXI6d4U9/
 GqeJpRrUpNbPu3jwAWwGDXAq35DKjUv55t/Ngj1Ys8nrQFKzDAJoHYGliVUV0/sdCabF
 IZUKH0MwLANToZCvmatlCO07HVUMgOZXeelKwOuh1CdRbUFB+XQaz2Ll59TvKpYh+/I9
 xAjQ==
X-Gm-Message-State: AOAM5338KbFhmBTT48c4BK4oyl003htNOC8dlJjMNQAhJzN5F15+T0SF
 BCOT0R8QXVsj51zxMhEhENuBOgetv7qwHdfQBQg=
X-Google-Smtp-Source: ABdhPJw+lwxcbYKaZnIS5Nw5QURsMU3JNds59ZdJUbhZ8M/6lPIWo06k66oDna5bFBX1eWjfth64h9QhDIJIOTcxpP0=
X-Received: by 2002:a05:600c:2294:: with SMTP id
 20mr9425055wmf.51.1592405386306; 
 Wed, 17 Jun 2020 07:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
 <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
 <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
 <CABfawh=AkBQ6iCOdWpjGvyXykePc7wVC-SZEn13_=q+P-zW4JA@mail.gmail.com>
 <47abe61b-76e1-4491-f539-60c427c2ffc8@suse.com>
 <CABfawhki5+wv9cfivbxRhMurqYD4Ls4o5OUG9e-cV5SPzeG9jw@mail.gmail.com>
 <17dab1c9-175a-3faa-3937-9102e09f72b0@suse.com>
 <CABfawhk4N9MsjWqf87hPpyEHP27E=SpiHUSC+bVhAh4xW9-n8w@mail.gmail.com>
 <15ff55e0-2b75-b1dd-9fa5-3b50f7aa8d9c@suse.com>
In-Reply-To: <15ff55e0-2b75-b1dd-9fa5-3b50f7aa8d9c@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 08:49:10 -0600
Message-ID: <CABfawhk=hk4qWjQQpamQO+EiZO=7=2j4_aezjr5a+YFmYfHjsw@mail.gmail.com>
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 8:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.06.2020 15:43, Tamas K Lengyel wrote:
> > On Wed, Jun 17, 2020 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 17.06.2020 15:31, Tamas K Lengyel wrote:
> >>> On Wed, Jun 17, 2020 at 7:28 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 17.06.2020 15:21, Tamas K Lengyel wrote:
> >>>>> On Wed, Jun 17, 2020 at 7:04 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>
> >>>>>> On 17.06.2020 15:00, Tamas K Lengyel wrote:
> >>>>>>> On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>>> If there are code paths of both kinds, which approach to use in
> >>>>>>>> vmx_load_pdptrs() may need to be chosen based on what
> >>>>>>>> paging_locked_by_me() returns. Or perhaps an unlocked query is
> >>>>>>>> fine in either case?
> >>>>>>>
> >>>>>>> Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
> >>>>>>> fine. But at that point what is the reason for having the lock
> >>>>>>> ordering at all? Why not just have a single recursive lock and avoid
> >>>>>>> issues like this altogether?
> >>>>>>
> >>>>>> With just a single lock, contention problems we already know we
> >>>>>> have would be even worse. When the current locking model was
> >>>>>> introduced, there was actually a plan to make gfn_lock() more
> >>>>>> fine-grained (i.e. not simply "de-generate" to p2m_lock()), for
> >>>>>> example.
> >>>>>
> >>>>> Sigh. Well, I've been checking and adjust vmx_load_pdptrs to use an
> >>>>> unlocked query doesn't seem as straightforward because, well, there is
> >>>>> no unlocked version of p2m_get_page_from_gfn which would also do the
> >>>>> "fixups".
> >>>>
> >>>> Which fixups do we need here, in particular? Of course, whenever
> >>>> any fixups get done, the operation can't be lock-less.
> >>>>
> >>>>> What seems redundant to me though is that
> >>>>> hap_update_paging_modes takes both the p2m_lock via get_gfn PLUS the
> >>>>> paging_lock. Does it really need to take the paging_lock?
> >>>>
> >>>> From mm-locks.h's comments:
> >>>>
> >>>>  * For HAP, it protects the NPT/EPT tables and mode changes.
> >>>
> >>> We do the population of the EPT as part of fork_page() if there was a
> >>> hole in the p2m when the query was issued using P2M_ALLOC (or
> >>> P2M_UNSHARE). I checked and without the paging lock held it throws up
> >>> at hap_alloc's ASSERT.. So yea, currently I don't think we have a
> >>> better route then what I currently sent in.
> >>
> >> You didn't answer my question regarding the "fixups" needed, so
> >> for the moment it's not clear to me yet whether indeed there's
> >> no better way.
> >
> > Umm, I did. The fixups entail populating the EPT from the parent as I
> > described above.
>
> Isn't this taken care of by the new call to get_gfn_type() which you add?
> As said before, I think at the point we want to obtain the PDPTs all
> other adjustments and arrangements should have been done already, by
> higher layers. This code should have no need to do anything beyond a
> simple lookup.

I don't really know what else to say. There are multiple paths leading
to vmx_load_pdptrs, some take the paging_lock while some don't. In
this particular case we can do the fixups earlier as I do in this
patch because there happens to be a lookup before the paging_lock is
taken but in other cases there isn't such a route so removing
P2M_UNSHARE from vmx_load_pdptrs is not an option.

Tamas

