Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE1C2E81DD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 21:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60617.106387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv47F-0004cP-QJ; Thu, 31 Dec 2020 20:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60617.106387; Thu, 31 Dec 2020 20:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv47F-0004c0-N7; Thu, 31 Dec 2020 20:00:09 +0000
Received: by outflank-mailman (input) for mailman id 60617;
 Thu, 31 Dec 2020 20:00:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6T7=GD=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kv47E-0004Y9-AK
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 20:00:08 +0000
Received: from MTA-05-4.privateemail.com (unknown [68.65.122.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d45a2668-e911-40ec-9fc7-3dc6ca1f9412;
 Thu, 31 Dec 2020 20:00:06 +0000 (UTC)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 4718760236
 for <xen-devel@lists.xenproject.org>; Thu, 31 Dec 2020 15:00:05 -0500 (EST)
Received: from mail-wr1-f47.google.com (unknown [10.20.151.221])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id 10A7E6018A
 for <xen-devel@lists.xenproject.org>; Thu, 31 Dec 2020 20:00:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d13so20781114wrc.13
 for <xen-devel@lists.xenproject.org>; Thu, 31 Dec 2020 12:00:04 -0800 (PST)
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
X-Inumbo-ID: d45a2668-e911-40ec-9fc7-3dc6ca1f9412
X-Gm-Message-State: AOAM530kANXDOJmcYmmBg6iiQZ1WacMYkQeVnTYBGKRtQpMvc2kRPI3n
	eTpyM2frypjX8RLgPWUrIxi3y5Vh6m6x2pfpsCo=
X-Google-Smtp-Source: ABdhPJxZhw6NDENndEkcXPL9VOVTvvxPV4LrXBDvzqZna5NOVwlu2yj3m+guF7f3GYHr1laYL6doeDveSsCN8V5IeDo=
X-Received: by 2002:adf:fad0:: with SMTP id a16mr68389750wrs.390.1609444803649;
 Thu, 31 Dec 2020 12:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20201231171021.10361-1-andrew.cooper3@citrix.com>
In-Reply-To: <20201231171021.10361-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 31 Dec 2020 14:59:34 -0500
X-Gmail-Original-Message-ID: <CABfawh=cnYpFDGP89=VfJ34fPeVufi7LixeNaTHEMRWHsxSSAw@mail.gmail.com>
Message-ID: <CABfawh=cnYpFDGP89=VfJ34fPeVufi7LixeNaTHEMRWHsxSSAw@mail.gmail.com>
Subject: Re: [PATCH] x86/p2m: Fix paging_gva_to_gfn() for nested virt
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Dec 31, 2020 at 12:11 PM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> nestedhap_walk_L1_p2m() takes guest physical addresses, not frame numbers=
.
> This means the l2 input is off-by-PAGE_SHIFT, as is the l1 value eventual=
ly
> returned to the caller.
>
> Delete the misleading comment as well.
>
> Fixes: bab2bd8e222de ("xen/nested_p2m: Don't walk EPT tables with a regul=
ar PT walker")
> Reported-by: Tamas K Lengyel <tamas@tklengyel.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Tamas K Lengyel <tamas@tklengyel.com>

Thanks, issue is resolved with this patch applied.

Tested-by: Tamas K Lengyel <tamas@tklengyel.com>

