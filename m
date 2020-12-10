Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534A2D5BC2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49218.87005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knM1U-0004fK-2j; Thu, 10 Dec 2020 13:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49218.87005; Thu, 10 Dec 2020 13:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knM1T-0004ev-Vl; Thu, 10 Dec 2020 13:30:19 +0000
Received: by outflank-mailman (input) for mailman id 49218;
 Thu, 10 Dec 2020 13:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B/l5=FO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1knM1R-0004eq-UT
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:30:18 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5fdf29a-8cd4-4d23-8ea8-696ca9481606;
 Thu, 10 Dec 2020 13:30:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f11so6663661ljm.8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 05:30:16 -0800 (PST)
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
X-Inumbo-ID: b5fdf29a-8cd4-4d23-8ea8-696ca9481606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6Y1/pCcVVUBfv3HtE9L8Hpubgn3eVeV8xQvQ2V1/F7c=;
        b=pZ+LO5QJlGoNVILFpKMp61lgJEapSo4Muukuh4BzipvJOvo7UPK7aH63a8QDnxRBRu
         8gdyFlum+HyecIZxcXR/tVzeSeV2oVn0hHElChzBWdkeHvdlIW8Uqs2ZMtiXeLcKboNX
         Y9pw53BAa+K9bojIdDQcBL5D0DZrr/6UGIexYlLoGWBd0WiRJ1UPLbUEQubEp1N4VijA
         fsy8eWPZrsVKpwlQrvd2Ah28UmLWQzk3zf+OVAsCzO6vSxuhAZzJzNgXNiE6ul7N25ON
         5JOB4ki6qLEC3XbQz5lvH87lt82jzoD3/ApNDoff3s3m+a8G9rVKIfRbbg3mk3mUz+CY
         0fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Y1/pCcVVUBfv3HtE9L8Hpubgn3eVeV8xQvQ2V1/F7c=;
        b=bIwTV39hgskpS0PTHIU1D8CaSr+iz64D87TtiKptGY0F6Ky5UgLJCUgsRoH71r3gDt
         pV9HLu4Y3ovUjbp2PVWWibrwhfHOCDGTAxRHaLLBdb5Stu6MAzMcqz0I5WoenBD3U/jA
         xjhufQaMIiqwvl84+auJx+2V/VumRvxVGgu8iVaH0Q8cmbbHN0/oOkN87JRx8rYBu+w2
         5dQR8mgD6ECuTjSLfIOqQsJeZCYXTHNl+PpK+AV3xgOU2lUoWx0ay7K1A+dcBFm9xKIe
         S9XZmSo6NMC6iNU//T4RKSfNejKHfRceaRR9LgO5JZplqBC/y6BnaJHhOLwPFYr8xRy7
         f3yw==
X-Gm-Message-State: AOAM533UNZcdzoTt1v/dG4cXXLQ/7Hbr0+cUKYeZznkT78A7pPQ8n+rM
	R+Fpuu0MWmha/bOlFEm/S1pgDpCMFvUu4j1e8Tg=
X-Google-Smtp-Source: ABdhPJz6/LInmyWBeicZXN1hFtBzjWA/tL2UzztmxE+KuDFoSVDLuD2xYTfWuigL789vYz9/QvF9K1XfZxYfUdtq60w=
X-Received: by 2002:a2e:1657:: with SMTP id 23mr3024716ljw.12.1607607015736;
 Thu, 10 Dec 2020 05:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20201207133024.16621-1-jgross@suse.com> <20201207133024.16621-3-jgross@suse.com>
 <CAKf6xpuqdY=TctOjNsnTTexeBpkV+HMkOHFsAd4vxUudBpxizA@mail.gmail.com>
 <72bc4417-076c-78f0-9c7e-5a9c95e79fb2@suse.com> <20201210111454.dxykvyktzwr3fjyk@Air-de-Roger>
 <7425aed6-ff6f-873a-b629-b9c7058e9b13@suse.com>
In-Reply-To: <7425aed6-ff6f-873a-b629-b9c7058e9b13@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 10 Dec 2020 08:30:04 -0500
Message-ID: <CAKf6xpvxLiBfWKUecbbWW4DZr-gcPeo5PADtiYzwPft8NQ2aeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: don't use page->lru for ZONE_DEVICE memory
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, open list <linux-kernel@vger.kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 6:40 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wro=
te:
>
> On 10.12.20 12:14, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Dec 08, 2020 at 07:45:00AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> >> On 07.12.20 21:48, Jason Andryuk wrote:
> >>> On Mon, Dec 7, 2020 at 8:30 AM Juergen Gross <jgross@suse.com> wrote:
> >>>>
> >>>> Commit 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated
> >>>> memory") introduced usage of ZONE_DEVICE memory for foreign memory
> >>>> mappings.
> >>>>
> >>>> Unfortunately this collides with using page->lru for Xen backend
> >>>> private page caches.
> >>>>
> >>>> Fix that by using page->zone_device_data instead.
> >>>>
> >>>> Fixes: 9e2369c06c8a18 ("xen: add helpers to allocate unpopulated mem=
ory")
> >>>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>>
> >>> Would it make sense to add BUG_ON(is_zone_device_page(page)) and the
> >>> opposite as appropriate to cache_enq?
> >>
> >> No, I don't think so. At least in the CONFIG_ZONE_DEVICE case the
> >> initial list in a PV dom0 is populated from extra memory (basically
> >> the same, but not marked as zone device memory explicitly).
> >
> > I assume it's fine for us to then use page->zone_device_data even if
> > the page is not explicitly marked as ZONE_DEVICE memory?
>
> I think so, yes, as we are owner of that page and we were fine to use
> lru, too.

I think memremap_pages or devm_memremap_pages (which calls
memremap_pages) is how you mark memory as ZONE_DEVICE.  i.e. they are
explicitly marked.

memremap_pages
  memmap_init_zone_device (with ZONE_DEVICE)
    __init_single_page
      set_page_links
        set_page_zone

grep only finds a few uses of ZONE_DEVICE in the whole tree.

Regards,
Jason

