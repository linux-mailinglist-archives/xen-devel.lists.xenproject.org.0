Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE281EA3B6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 14:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfjQn-0000p4-F4; Mon, 01 Jun 2020 12:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E93A=7O=gmail.com=buycomputer40@srs-us1.protection.inumbo.net>)
 id 1jfjQm-0000oz-5c
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:20:40 +0000
X-Inumbo-ID: 4d683118-a402-11ea-8993-bc764e2007e4
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d683118-a402-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 12:20:39 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o9so7853048ljj.6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oWaSScPdF0/LBmZ/G8Aq2m32ZqmFc/6qkFfGD8k3UD0=;
 b=A9BhzkkN6NyjQx0Vt/b6gkwh5Q9VamXnhfXr4KFqQWmQnBPwhAcZHltq1hEptUQ6dy
 ZmPINi1CssA43O8icizcJKRqEQQ862NUE5pw0Tkc38SyeOHWPbfobmUP6bDokTXf7e0s
 o3SyBzKYTZGDD6Me5cpmS64eH7KWYoYUT1GCwQIaWKWPsCLiuMWAL0epQfhRHU4QK7NC
 Lm6oyMeLB/E9UxWap3AUPa7IwmuRTvhIdYAitekA85XBsEgcpdy0jRj9vrDqKY5qExAr
 UQG8jSujMT8C9ATrnmagJGm6r1L6Aq0cCXbRf1k5n+t2ZprGymLtyFVACRnzGIwG/57A
 w2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWaSScPdF0/LBmZ/G8Aq2m32ZqmFc/6qkFfGD8k3UD0=;
 b=rV/I3EDqItP4BxfUwlFc7r3MN2HfWXzQ5tQte3iGYfDKEo4kJ0yFr1wHsbFAYs1JAE
 97yMnrZ40M2yFC22xx7v7JLmVZgESaEWxeFicTFe/l0mvmeGn5WZCd3FNUYUHAOjwHDc
 mrQsgRuCFYhuk0LFraenw0SovtSeey/8tYtZudHNymRArwsZvppdniLYFvP3rG0CXg1H
 ENSn7dOzUjlTvO2GfNrgukSfAaDzSsAHdqCUZKIR+HmLKyVTRJ2YNHLMKvKNUunnh6Jl
 fvisbgL97ZBAnN2JoMvRmadoyPBynTgtQKn1W3d3VgL7PSmzuGICX6gIUIlJ8he9vNKJ
 qSOw==
X-Gm-Message-State: AOAM530hLRfg1FQAI7FagvrPVdGOZo3ypmDkpAU4Av1Ym1QendYL2ARq
 THNpr8FunGqxjpGEh4rNTIICXNyYH3XkNcxhXUY=
X-Google-Smtp-Source: ABdhPJwTm3RfwGpbNOTTw9xuUm60S9zzPUiP8o4pCehKWu2KgF2wYiyl3+JsUsnQbdqJd2A4DRZXptcSDYqUaiqNYkU=
X-Received: by 2002:a05:651c:105a:: with SMTP id
 x26mr10692350ljm.159.1591014037989; 
 Mon, 01 Jun 2020 05:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANSXg2FGtiDT05sQUpSAshAsdP4wSjPgQbfw_+aKJuAzSwvJuQ@mail.gmail.com>
 <da7e41b5-88a1-13ab-d52b-0652c16608af@suse.com>
 <MWHPR11MB1645DC1C5782DDA28C9BB1CB8CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
 <CANSXg2EiauZfTMsmqzcB2ShUCr67rB+mHBm4EVtWhMaUL8NL-w@mail.gmail.com>
 <MWHPR11MB1645086209CC9A97D5805DA68C8E0@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1645086209CC9A97D5805DA68C8E0@MWHPR11MB1645.namprd11.prod.outlook.com>
From: buy computer <buycomputer40@gmail.com>
Date: Mon, 1 Jun 2020 15:20:25 +0300
Message-ID: <CANSXg2EU5X2_Cz5a+wZaomNzQ-iFYdjME-4NuLy+=RqEm__Uhw@mail.gmail.com>
Subject: Re: iommu=no-igfx
To: "Tian, Kevin" <kevin.tian@intel.com>
Content-Type: multipart/alternative; boundary="000000000000912c6b05a704d248"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000912c6b05a704d248
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2020 at 11:34 AM Tian, Kevin <kevin.tian@intel.com> wrote:

> You may search dma_map* in drivers/gpu/drm/i915, and then print mapped
> addresses to see any match in VT-d reported faulting addresses. For
> example, __setup_page_dma might be one example that you want to check.
>

Unfortunately, I'm not really clear on how to do that too. I've found
drivers/gpu/drm/i915, and it contains one file, i915.ko. Using cat prints
out unformatted text. How do I access this data? Internet searches have
again come up dry for me, sorry if this question isn't on the level.

--000000000000912c6b05a704d248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2020 at 11:34 AM Tian=
, Kevin &lt;<a href=3D"mailto:kevin.tian@intel.com">kevin.tian@intel.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_292198233990659600WordSection1">
<p class=3D"MsoNormal">You may search dma_map* in drivers/gpu/drm/i915, and=
 then print mapped addresses to see any match in VT-d reported faulting add=
resses. For example, __setup_page_dma might be one example that you want to=
 check.<u></u><u></u></p>
</div></div></blockquote><div><br></div><div>Unfortunately, I&#39;m not rea=
lly clear on how to do that too. I&#39;ve found drivers/gpu/drm/i915, and i=
t contains one file, i915.ko. Using cat prints out unformatted text. How do=
 I access this data? Internet searches have again come up dry for me, sorry=
 if this question isn&#39;t on the level. <br></div></div></div>

--000000000000912c6b05a704d248--

