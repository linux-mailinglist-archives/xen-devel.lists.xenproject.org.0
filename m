Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629C2073C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:53:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4uL-00027o-QH; Wed, 24 Jun 2020 12:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mms=AF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jo4uK-00027e-F4
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:53:40 +0000
X-Inumbo-ID: b995b67a-b619-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b995b67a-b619-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 12:53:39 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q19so2325041eja.7
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=vyVAL48RnupCHLHRT6ZRkkhf9C+oMNXsUB9p67p/yAI=;
 b=Ifpt5u8EnUwIyONleLlEdx3xjRDuRDA3X9pGVyAKX970WS1NHchXayju+QhtlBkK8Y
 wa5L4gPtnjboPQcX3Wqj6N5EV+xbaIauZFmS7Z4ZTjs7B7TiPHXffE7x/h5HHEonJkF6
 yl+EUPyzMbsj+H8ibCExZF6ma5BVdpTciSKu2QxAlFVqq4LXxrLUvfSxsMwV4JKWBNii
 KEOLEz8LkKxVdZPoL3CTbYySnTGtWpOqeUgGJRL8C1tnLoj8Nvan2l/1/p5T/cmGSECI
 qrBSmLCaoTT17sq/3TlfE9z4iwtfVU1uBeS+1SXg4P/zxvekIICsCKkAVFApc3onp42O
 8Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=vyVAL48RnupCHLHRT6ZRkkhf9C+oMNXsUB9p67p/yAI=;
 b=cXaCTv4AWZyZuEqxyKsHLKhTI6HNxYGWuoEDaKyEF0e6kzi9jcy/k/XvuiIa/uXFHJ
 FVgflrmFp1BLgDeYA7LZ2jZdh3nP/O4OdGiUFwchKYeB95XDrkU/oqdcswWNM8kO+Ek4
 4SYPtYovxUxjCdsuoyCCyoTu05UDdLNytxUfbRyd2/qarD5oDdfn85lymZyhsVe5xHZ4
 PDYkS8v0xkpipW0kvkmwT3vxBX8IAuaIIuyGnk+6hL+V/V8DLMW8xqhd+08pBRmu0Mmo
 JVhU3S0GS04z6n/wFVdFbMXNLzlkkL55mExXKCHfNKz6HHC2LPs4ZPjLAurbMR9TRzki
 8oPQ==
X-Gm-Message-State: AOAM533gDGhVaUJBWtL67Nke3qoxtir8WKUgbhg+C0TOpoX3ibvdAjyo
 5CHYtJu1pP1l/Hq6E5xF8cg=
X-Google-Smtp-Source: ABdhPJzq8f1yFiZgimYjAXlmWVdkv9I+EoR2QaHjKoznGfRot8xlkTiizL3Znd2qxyYiucraoJzOIQ==
X-Received: by 2002:a17:906:8392:: with SMTP id
 p18mr15846296ejx.24.1593003218882; 
 Wed, 24 Jun 2020 05:53:38 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id q3sm16667175eds.0.2020.06.24.05.53.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 05:53:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <044c278b-e0df-e389-b21a-66c7307997c4@suse.com>
 <20200623173150.GV735@Air-de-Roger>
 <3ea0ff91-8e5c-701c-ee31-4140b247f3c9@suse.com>
 <4651b23b-ca82-a478-debd-c20cdcd3facd@xen.org>
 <ccd01544-04f7-8e34-dfdc-ccf373db3996@suse.com>
 <6195142d-6fa3-474d-3070-f43105742e79@xen.org>
 <5193dc6d-0a4c-4e1b-d089-9ba359c19e3e@suse.com>
In-Reply-To: <5193dc6d-0a4c-4e1b-d089-9ba359c19e3e@suse.com>
Subject: RE: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Date: Wed, 24 Jun 2020 13:53:37 +0100
Message-ID: <000b01d64a26$7aacb580$70062080$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJU5g6mkfXrDLlGsNt841F72IbClgGrea6PAfx/VmoCRJsRMgEBRCcgApo72pAB5Qr3iwGBPLtyp4MNv4A=
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 24 June 2020 13:52
> To: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; =
xen-devel@lists.xenproject.org; paul@xen.org; Andrew
> Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct =
xen_mem_acquire_resource
>=20
> On 24.06.2020 14:47, Julien Grall wrote:
> > Hi,
> >
> > On 24/06/2020 13:08, Jan Beulich wrote:
> >> On 24.06.2020 12:52, Julien Grall wrote:
> >>> Hi Jan,
> >>>
> >>> On 24/06/2020 11:05, Jan Beulich wrote:
> >>>> On 23.06.2020 19:32, Roger Pau Monn=C3=A9 wrote:
> >>>>> On Tue, Jun 23, 2020 at 05:04:53PM +0200, Jan Beulich wrote:
> >>>>>> On 23.06.2020 15:52, Roger Pau Monne wrote:
> >>>>>>> XENMEM_acquire_resource and it's related structure is =
currently inside
> >>>>>>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope =
to the
> >>>>>>> hypervisor or the toolstack only. This is wrong as the =
hypercall is
> >>>>>>> already being used by the Linux kernel at least, and as such =
needs to
> >>>>>>> be public.
> >>>>>>
> >>>>>> Actually - how does this work for the Linux kernel, seeing
> >>>>>>
> >>>>>>       rc =3D rcu_lock_remote_domain_by_id(xmar.domid, &d);
> >>>>>>       if ( rc )
> >>>>>>           return rc;
> >>>>>>
> >>>>>>       rc =3D xsm_domain_resource_map(XSM_DM_PRIV, d);
> >>>>>>       if ( rc )
> >>>>>>           goto out;
> >>>>>>
> >>>>>> in the function?
> >>>>>
> >>>>> It's my understanding (I haven't tried to use that hypercall yet =
on
> >>>>> FreeBSD, so I cannot say I've tested it), that xmar.domid is the
> >>>>> remote domain, which the functions locks and then uses
> >>>>> xsm_domain_resource_map to check whether the current domain has
> >>>>> permissions to do privileged operations against it.
> >>>>
> >>>> Yes, but that's a tool stack operation, not something the kernel
> >>>> would do all by itself. The kernel would only ever pass =
DOMID_SELF
> >>>> (or the actual local domain ID), I would think.
> >>>
> >>> You can't issue that hypercall directly from userspace because you =
need
> >>> to map the page in the physical address space of the toolstack =
domain.
> >>>
> >>> So the kernel has to act as the proxy for the hypercall. This is
> >>> implemented as mmap() in Linux.
> >>
> >> Oh, and there's no generic wrapping available here, unlike for
> >> dmop.
> >
> > It is not clear to me the sort of generic wrapping you are referring =
to.
> > Are you referring to a stable interface for an application?
> >
> >> Makes me wonder whether, for this purpose, there should
> >> be (have been) a new dmop with identical functionality, to
> >> allow such funneling.
> >
> > I am not sure how using DMOP will allow us to implement it fully in
> > userspace. Do you mind expanding it?
>=20
> dmop was designed so that a kernel proxying requests wouldn't need
> updating for every new request added to the interface. If the
> request here was made through a new dmop, the kernel would never
> have had a need to know of an interface structure that's of no
> interest to it, but only to the tool stack.

How would the pages get mapped into process address space if the kernel =
doesn't know what's being done?

  Paul

>=20
> Jan


