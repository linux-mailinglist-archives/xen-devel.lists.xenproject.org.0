Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8J79H983Qmom2AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:16:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C56D7FBB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:16:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="EBlQ/RlV";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347341.1605197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we85G-0003r0-8P; Mon, 29 Jun 2026 09:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347341.1605197; Mon, 29 Jun 2026 09:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we85G-0003oi-5F; Mon, 29 Jun 2026 09:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1347341;
 Mon, 29 Jun 2026 09:15:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1we85E-0003nX-GF
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:15:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we85B-004LI9-Dq
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:15:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a423796-bab6-0a2a0a5309dd-0a2a4508acc6-46
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:15:13 +0200
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a42379f-edec-0a2a45080019-4a7de02fa923-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:15:12 +0200
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-664e3ed58bcso402924d50.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 02:15:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782724511; cv=none;
        d=google.com; s=arc-20260327;
        b=Wm8SJoi/ogjsrva7JEq1p5+q7gk+bJppFNt1Gic1DMoWX+fb+YPqx58ifmBFtL0sQt
         tTxEIK48oKHKb9bytMlbhCvrolZE0vuUwOOTLk/bVkKb/zTM55dUkuPEf1aJbSnbYmlB
         DX5KmadURFR4LlmthjJBIoZE59Elq34nsxyTyl+Mv2BCtZmPN8RkoNnrWpCe3Awm80dl
         mchAbSPhpixKNEeBsEon1cJAx0j6W/Y3yIN20GIaf+1Ry7UnHFJqjwac1nJyqhuMsucI
         N1NwyJOFPEPFsgoO1Mcnn9ArYrRiAEjm31vCjc1myDTwG8xN3kyYhTh+3xFDM+9UbXj6
         UeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NeU0LTJhR86CiNsXhwb8pydAN42WeC5xjWNd41dSMzY=;
        fh=4UJDm7RG4Xj/YxPa9cFI1HhT4blyPjAiJc30jrNo6Wc=;
        b=KE781T/Zi7XP1wRDs2+AOUhBCLi1uyQ0Oz4xvOx4evJmvtYmoouu74oUPYsk34oicF
         RSnnqsy2PgHJ1eHGEkicvajJhR+PjzQSUFLSqOKmcu3h3JyUk6iIfZXsS/WTsWi71kSJ
         rXKXRoz+9PZyEMnqCwsNwi4RXn5PXRIx3WFCo4GBkztUwXQGNfV/7BJtpDYBdDrcunDe
         p+gkmyyKtmLFJqGVSmWF1mZAZXl0qSGOiylrY/EmkXvIfdshD6nl19tEXHGsSMi2uYGP
         37/7ZmrAxH6dH6oHeBwMQs4IK9jI7EuKwqCg1swVTLcQorPdVJgtcHprUbk0S2vhmDY8
         SRmA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782724511; x=1783329311; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeU0LTJhR86CiNsXhwb8pydAN42WeC5xjWNd41dSMzY=;
        b=EBlQ/RlVzF80TqRbaCitbEVeLBHCKoAGNiG96NuwZU/+rJf0TblDmSaVApSxxqczSt
         SuvijVVyEVdPo0UJAX7GSdO0+epKsKIObj/B5tXSDAWpb9lEZX6iT+0hDY19eKRYycr4
         8dPEH8rhtNWzjn/KheykkVYiZcGldZTD2+tbjEdHfYS5kJk8Lm4D77OF2gzP5Xn6Ow/S
         GWGXUxs2Dq4/uMar4HRFa+AvcQioTXoUNa/h57b5Fhp6mXFT+KUcCKv8n828K5CkxSWO
         mt/RbORyoC65hnm3OsHAEHPS0Ula28iA61g6CwawWTbBZhxkvvyVijnOcyiHkAbqosNa
         IyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724511; x=1783329311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeU0LTJhR86CiNsXhwb8pydAN42WeC5xjWNd41dSMzY=;
        b=W63K+rXieFdOdKckcCKs+2WioMk6ZY7NSCwZaILu1ylKiwi2s/ejhnrRKnmIbLx0We
         1jWfRWcnFNzxT7Wl/W2Y+jdEKhAWgxaJRop2UBfF9Z3X7aA51yluhpqzEst4SOAhGbvY
         GLhd3TU/xJklN8L9taXRlUPw8bv1wCJ0Og1gHgmlPK7iMn0W8Iil62cu0vGqFKByb+RG
         XjMTtc0X9e3ZRr48IMoupsUK8la54rfeyF0FOgyyB9b8OsQiBQiF9cHJ4x4MUCOyODBx
         /LL3fjXbOBlXuLBEsixdR9ws9VdUcX14Q/JbeICCM0TYp7zsCw0AwdD/J9PE0zzeqi0z
         amuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvaDHBSMIwsi5UNmyfpBroCzv175yzCleiEhdSXWAhpUDusGkAasxowRlJWAP6BFLhydW15ZOKBAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVMuyYtg4oZXyj2O6QpBKIx9MvX1jeMYXGI/yxaNNbye2CXBPB
	cL0I+Ap9EPyMmjIIeSTb42fwiy22sBwbD44qQlrdonx0k4bAlx8IspZ+WD0j2Gkpg9IyvjX8bM9
	0JYIomIEL93tqtEF9FiW0j0LjliLKbf8=
X-Gm-Gg: AfdE7cnXv2vjlNKsciQZk0AA00PSo2N8voBPaBaG+6IHOSaQm87gD+KEe7hgtXb/SDZ
	oM5iuuhVt3sNeJd4ye6DB4xr0j5yj1f7yltjsk+qqFj9WjrAj9G/WET9eU2a8RTV3KE5TTD6qJ8
	xTknwHR7V0tdSjVg/OwJIaG6vKJIdrjNWuj+37gZ9QBRYdWXXYnv8PgLDNDHYbR8mmXYbCk2+e/
	W4wDCayxBrxcUGXNm74xNIw0z/O8MRSoHU0oXqzHvdCS9zrtbYS+FJcNnVQ3Or3jHmo1c6lvKwh
	w+Q0NZhnUnQ7UyYI7vLluIo=
X-Received: by 2002:a05:690e:1349:b0:662:d25f:dabb with SMTP id
 956f58d0204a3-66487603f79mr13716702d50.11.1782724511187; Mon, 29 Jun 2026
 02:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260430095521.8399-1-frediano.ziglio@cloud.com>
 <afMzlcrP7phSirsw@macbook.local> <CAHt6W4cwh3tx4nZNmqe9TS8TFsQDsL4pYBEBz3qqX032Jmqf5g@mail.gmail.com>
 <ca4b8df8-edb0-4192-94f8-dbb29101be03@suse.com>
In-Reply-To: <ca4b8df8-edb0-4192-94f8-dbb29101be03@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 29 Jun 2026 10:14:59 +0100
X-Gm-Features: AVVi8Cfb1-qeGorlB67EJSihd_m25dHTU4zAvXBDsaHBQoAOSW9el3K1tbdxCOU
Message-ID: <CAHt6W4fFAVT07wzmVNwwwdsP8W8HYaCHkwz3O2P7nYctC=w8WA@mail.gmail.com>
Subject: Re: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, bouyer@antioche.eu.org, 
	xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1782724512-48C6F3FC-E4CDBAEE/0/0
X-purgate-type: clean
X-purgate-size: 2530
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:bouyer@antioche.eu.org,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,cloud.com:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC8C56D7FBB

On Mon, 29 Jun 2026 at 08:01, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.06.2026 17:07, Frediano Ziglio wrote:
> > On Thu, 30 Apr 2026 at 11:48, Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m> wrote:
> >>
> >> Adding Manuel that maintains the NetBSD xen-tools package.
> >>
> >> On Thu, Apr 30, 2026 at 10:55:21AM +0100, Frediano Ziglio wrote:
> >>> More similar to other implementation.
> >>> posix_memalign was adde in NetBSD 8.0, released on July 17, 2018
> >>> and went out of support on May 4, 2024.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>> ---
> >>>  tools/include/xenctrl.h     | 5 +++++
> >>>  tools/libs/ctrl/xc_netbsd.c | 9 ++++++++-
> >>>  2 files changed, 13 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> >>> index d5dbf69c89..f4316089e7 100644
> >>> --- a/tools/include/xenctrl.h
> >>> +++ b/tools/include/xenctrl.h
> >>> @@ -1390,6 +1390,11 @@ int xc_lockprof_query(xc_interface *xch,
> >>>                        uint64_t *time,
> >>>                        xc_hypercall_buffer_t *data);
> >>>
> >>> +/**
> >>> + * Allocate memory with a given alignment.
> >>> + * The alignment must be a power of 2 and at least sizeof(void*).
> >>> + * It returns NULL on error, errno is not set.
> >>> + */
> >>>  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size);
> >>>
> >>>  /**
> >>> diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.=
c
> >>> index 1318d4d906..d27154dce9 100644
> >>> --- a/tools/libs/ctrl/xc_netbsd.c
> >>> +++ b/tools/libs/ctrl/xc_netbsd.c
> >>> @@ -60,7 +60,14 @@ void discard_file_cache(xc_interface *xch, int fd,=
 int flush)
> >>>
> >>>  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
> >>>  {
> >>> -    return valloc(size);
> >>> +    int ret;
> >>> +    void *ptr;
> >>> +
> >>> +    ret =3D posix_memalign(&ptr, alignment, size);
> >>> +    if (ret !=3D 0 || !ptr)
> >>> +        return NULL;
> >>> +
> >>> +    return ptr;
> >>>  }
> >>>
> >>>  int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
> >>> --
> >>> 2.43.0
> >>>
> >
> > I saw Manuel reply almost 2 months ago.
> > Still pending.
>
> You understand, though, that Roger can't approve this patch. That'll need=
 to be
> Anthony. Sending a ping _his_ way is certainly appropriate after this lon=
g a
> time.
>
> Jan

Okay, looking at previous exchanges I thought the maintainer was Manuel.

Frediano

