Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIMWKAZfjGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:50:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2411239D8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227264.1533603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7nn-0006pD-GT; Wed, 11 Feb 2026 10:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227264.1533603; Wed, 11 Feb 2026 10:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7nn-0006m6-DO; Wed, 11 Feb 2026 10:50:35 +0000
Received: by outflank-mailman (input) for mailman id 1227264;
 Wed, 11 Feb 2026 10:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fnCX=AP=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vq7nm-0006m0-Qb
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:50:34 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d488dbf-0737-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 11:50:33 +0100 (CET)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-794fe698e36so19477857b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 02:50:33 -0800 (PST)
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
X-Inumbo-ID: 7d488dbf-0737-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770807032; cv=none;
        d=google.com; s=arc-20240605;
        b=J8GSdfDU2jG9TE93ILAtZzH4fasYm0pT+SNn9G3EyUYAAZ0MvBsDtRVsI/92Ihol48
         7EI+w+dRCa5ZYfkGa3I3PQwlv1GDzDV257DYEQJBcl+vG+AQAAXl8eVk0kw6RjYxzCws
         HLsLm3lhK4l4o7PoOxjrinNxRcqHTmfZjwPjPAkRrEcWY5IpBlcfpVEbY4FQJpnx9U+V
         f73nZvbUWAyVc0l5e7P1wL7o52/L2rLmshSia2ySZpQoDmhWe5vDTFmQcJ1h2muCvZvz
         CIxo6VTOemL8bNAet3H0KW7Dg6JIHE+H18vK+yG/ORhhODARSxtzi6DkPcAbseC7t2Zc
         JWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BW2TUjdeeNfaM1vLqistjWuVCzgiBpJ8bBbK+pmeSoI=;
        fh=tPU8FCqh8oAm9Fkg76jOUCeHgLvvbwQJLfHhJlJtFT0=;
        b=i+oPA98U3cZd/KyQlfcXn/PWN6zo0tW2wY0+NYs1tYvVV9DK3UUP3RnE5DiCtqeX1A
         iqG+Zda6oQoq8Sr+NZU3ScUZDee+jBHwKMNW5sWGypQx6vbyHgYhO/nA14hCaw6sKD7i
         x+fRjk54D8DHuD8IqdwD/JprWvIdmmt0sfQQLDQH4MY8YCLwAdyTJXNAhUilyyI7ez1j
         WtQTQhNI7r7Y2yRSv/bTQ1qd1ejDKc3QxCbp4ee6dP2U1wOEs/5DGkJMNOahLJH5ifm1
         y1+cf6FYvqWm/nkB1u2A51WSWiBqOO1UWHNfAsoJwOjxh2fuyy5Fb14IVivpc+0DvglD
         0q4w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770807032; x=1771411832; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BW2TUjdeeNfaM1vLqistjWuVCzgiBpJ8bBbK+pmeSoI=;
        b=DEyTcBXCIYPXREVUZrWubZaUgdjZ/D7SAjnygXDlxiQEQaiuwL0a0sTX5eLKIwlpQ7
         tazZ3FuUMjki78rovC6T4vWNC3g5CUPcXLJmyyhPdZMfsFOX6oUvGLDE8tynXfd88gHU
         iPuBhG6JTX82Q789gAS5builHleex1na+JCr6LsxiDMMLF5vqYgebKc7HBWze4b7zMVl
         XUnkSLfix25emNVYXXH0D7RD/nZAOxdztDsrUq2aV5qDrkX7kPrVgjXF+g0pQbno/bfK
         SF9cPjUcglHHszJXSJ62sQEYZcf1k7aHI40oiOF0XtDikaBDTkZEUGE98AgYJuxZT6Q4
         my3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807032; x=1771411832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW2TUjdeeNfaM1vLqistjWuVCzgiBpJ8bBbK+pmeSoI=;
        b=FFC2vBX8OgjZCS2nrLQakwWpRsmoqHJ2+Sygk0rmGtQIFe04Mnncvp1XcAJmDRxPON
         OsqBLDccCjCTMFvuTl5NJEeoOknPxjHxjokLu/godvSKNuD0k92XayPXLIiGf+jTWQqV
         VVtX6+flAGrQ9k1xjJ92dliubkxqLA/Sd2rThpIkU8VKRby1uKJ0QB2AJQxexlWhbEl9
         Iq2/r7ov6y9tApVb1TmUnM/BmI1SwvqDehQZyIiCZ9VqPpE6jCtwi7r+iK5BBLslPknr
         Oas1WoIyOp+zDJVN3S4DiBDs529IsHMMK5taAYRxneQMeHrnyb9QZOEjjdY0BGaETdjL
         q0HA==
X-Gm-Message-State: AOJu0Yz4rmgEYRK4BSVR9jD8k3TYvyQj/La6q2JPzcyCGFEXREoTNJ2P
	lxq9232SStfY1IHY5H58GtwXebrmVXi4OQahzgnhVA4BDMGzIZjWg37KftwrFaUhIJfdxu9Pd3Y
	C7V/4IJTiw8xlKsNwJDmggiW35RzprBhu9A==
X-Gm-Gg: AZuq6aJ6gDyg8PIrfEawtjxgpV5QwKjQfq2dgBur5HSeVoHon5K22JeqbcE+o7rvBTt
	QU2GzQZJePeVQcDbMrTWp6ilWRTKUMU/MC+eKPSBmlY2DChNse3slKSpdspvQJD4VdgOEYLN+d8
	OH/iVF00Nu/GvNbXtrAhLS8BULFF8hS9d8epWMKDqaNQODLtcFQHJQhqChlKfRDTeCHh1CJGz9R
	TC4+EuQ9CtSMPC2/XcbUWhmvFFGIc8uvDA47svsb069ROrjb6PUD3awViedvphc5Igsv1XzTuRB
	rZhHNtYV
X-Received: by 2002:a05:690c:112:b0:796:6da9:bf97 with SMTP id
 00721157ae682-7966da9c43fmr6696157b3.43.1770807032573; Wed, 11 Feb 2026
 02:50:32 -0800 (PST)
MIME-Version: 1.0
References: <CAHt6W4ejPT-A7bGfrZGW-8zEBxmQ__LVa91GRcXhYZO_3C1meg@mail.gmail.com>
 <CAHt6W4eQmiuXfBfwi-Wzpp+fzCzr-JAO45+OD3tc5PQXE-0WXw@mail.gmail.com>
In-Reply-To: <CAHt6W4eQmiuXfBfwi-Wzpp+fzCzr-JAO45+OD3tc5PQXE-0WXw@mail.gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 11 Feb 2026 10:50:21 +0000
X-Gm-Features: AZwV_Qgy91sD4U9cLiSdy8Be5d7GI5E8O9x6cSh-4G0Y7QGpGDC56SPPwUcttPI
Message-ID: <CAHt6W4egn8t2NKwPEquHG=p67C-kNzfCTrS9dg4K=Qjskntvyw@mail.gmail.com>
Subject: Re: [PATCH livepatch-build-tools v2] Treat constant sections as
 string sections
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:konrad.wilk@oracle.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B2411239D8
X-Rspamd-Action: no action

On Tue, 13 Jan 2026 at 11:54, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> On Tue, 18 Nov 2025 at 10:44, Frediano Ziglio <freddy77@gmail.com> wrote:
> >
> > > > Newer compiler can put some constant strings inside constant
> > > > sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
> > > > This causes the produced live patch to not apply when such
> > > > strings are produced.
> > > > So treat the constant sections as string ones.
> > > >
> > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > >
> > > Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > >
> > > Thanks,
> > > Ross
> >
> > Hi,
> >   any update on this change? Could it be merged?
> >
>
> Any update?
>

This is the third time I ping this patch.
Can somebody at least give me a reason why this is still pending?

Regards,
  Frediano

