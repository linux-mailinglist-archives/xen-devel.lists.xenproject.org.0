Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83802194225
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:57:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTtj-0003t2-Hr; Thu, 26 Mar 2020 14:54:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MmV=5L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jHTth-0003sk-Ub
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:54:17 +0000
X-Inumbo-ID: aa7651e8-6f71-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa7651e8-6f71-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 14:54:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id cf14so7091945edb.13
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x+KZqOMeRc2GvGqszCOk25ibYyipJ5TQIKRH3jTe5F8=;
 b=KK0B778iuIYRPbFWjFg+WHjT6qz6hdmCNXdXfptOxD1lTeffgaKctiNEVB+h2TM3vW
 Y8gvrVZm0/nEwt9y0S5lTGs8tceMA8vZUfdUCKLi1dmRaUUzMrRUgmLkufen+9hW3t9X
 lBBall/6Ru6DxfkRT5RiYo5l0vXp3X0IRR/Kb3lY3G3tUqYnd76lk946WYyX3qiw7byQ
 Pe0zv1TdEuYTcehTl1+/hliVpRLIe/WGB8SzWjL9b1D6BfjYEy9hgOWZ6M+yWs4S9P8o
 OoEwT3syXM9CPLLW5/Yf/W9MMfI1rhSmC7IhHA2hnRBaCZXNDeKWNzWKIVu7+KD+ry76
 1lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x+KZqOMeRc2GvGqszCOk25ibYyipJ5TQIKRH3jTe5F8=;
 b=htW6HziiJ6pU5gqf+Q92PSD1U2NoPjYkHmEHnEtgKvLdf1l12r6BrKYCncNDStlh5n
 PJNf9LvnMSX3yuOSCOUc6vrmwPS9E4vUp+48MMS4+3/YOkybieIfCnOm9VlRPMjHgZO2
 /XIL1jfUt2CLUfEnOPhfytT3pjlc1/PqCv3KFsTZos88Ay0Zc0iX11gWS9jFYODEbSlZ
 V0F46tQLlt2UdxKILqak92kFXzBP2uCCJo9p7zt27vqzj6Fd1Ew27QXMeKB3/zVvdzhv
 dxm2SKITBC/e1uuTUsIhucrUh5Js0W4FPdZcrmYRYLqfsqB+U9SqeNhNQzyvY3SleRf7
 AWSw==
X-Gm-Message-State: ANhLgQ2I+IojJIlgo8jr90wEMP8i58Kb2Lz7/8Rtv6S4vMuVdgZlsPHr
 id+Ll9JRXyKff9nJtFntQT2WI+VBnPg=
X-Google-Smtp-Source: ADFU+vtFBBm5SNbPBexmVeCMpBkiLGrHkEBHpZST6ETBhRx6o4f0plz3xyx9UD2laucElCpwXxslBQ==
X-Received: by 2002:a17:906:f203:: with SMTP id
 gt3mr8126204ejb.118.1585234456353; 
 Thu, 26 Mar 2020 07:54:16 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id z16sm357962edm.52.2020.03.26.07.54.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 07:54:15 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id m17so8119954wrw.11
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 07:54:15 -0700 (PDT)
X-Received: by 2002:a5d:4401:: with SMTP id z1mr9604478wrq.259.1585234455027; 
 Thu, 26 Mar 2020 07:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
 <3f0fd837-bee6-3a68-8db3-1a99b97aac9e@suse.com>
 <CABfawhkRpvV0asinjdBx2qMq-RQOBbx13bENREszzkBhrgS71Q@mail.gmail.com>
 <9c7d7147-cb83-5e91-38b7-906a81582ac4@suse.com>
In-Reply-To: <9c7d7147-cb83-5e91-38b7-906a81582ac4@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Mar 2020 08:53:39 -0600
X-Gmail-Original-Message-ID: <CABfawhkoEt1wZ9hT2Tra8Mw0jkXtNzTXt+Znf1WuTYf-nnDd+g@mail.gmail.com>
Message-ID: <CABfawhkoEt1wZ9hT2Tra8Mw0jkXtNzTXt+Znf1WuTYf-nnDd+g@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Xen-devel] [PATCH v12 2/3] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 8:52 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.03.2020 15:48, Tamas K Lengyel wrote:
> > On Thu, Mar 26, 2020 at 4:17 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 23.03.2020 18:04, Tamas K Lengyel wrote:
> >>> +static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
> >>> +{
> >>> +    int rc;
> >>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> >>> +    struct page_info *page, *tmp;
> >>> +
> >>> +    spin_lock(&d->page_alloc_lock);
> >>> +    domain_pause(d);
> >>
> >> Why do you take the lock first?
> >
> > No particular reason - does the order matter?
>
> I think you'd better avoid holding a lock for extended periods
> of time. And what's perhaps worse, what if a vCPU of the domain
> sits in Xen trying to acquire this lock - you'd deadlock trying
> to pause the domain then.

OK, I'll invert them order then.

Thanks,
Tamas

