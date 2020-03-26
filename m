Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E2194216
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:53:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTp8-0002hs-E3; Thu, 26 Mar 2020 14:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MmV=5L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jHTp6-0002hk-P2
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:49:32 +0000
X-Inumbo-ID: 007acea8-6f71-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 007acea8-6f71-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 14:49:32 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w26so7103899edu.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZuaaElbhy7VVZrLYTh8f14sXa1B8ZgdjIs98A3nq9U=;
 b=S12yxchPGHpcZVXLOcbXG+is7HsZMXrphBIrtpMl8ROfkMgHsb8E3SmfU3iDY7o7Cp
 sy8QYdFdNsXpg1htq2rx0llKXI9UIkxlTzB50X70qu0zRAl8e2RVSNhjxq3PVjD4AfqO
 PmHZHMdXAfGJTfvLGLwZnCaVI9Vf3UWzU6nW6fyNAWTYU+/ZIk7RTiXKHGTVCLBVa0OW
 omnkuWwlnzP63tXUzl/au6kZdtib2E7rwr/3PkLv8lxmYH9cMtoisRa1uMpG5G17HAoJ
 eSKmkVXonrYw8TltQwWAQML2G8KYnjqyY/PonZYZNW4ubpj8td5kCJKtKHyW9+mggt69
 ESqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZuaaElbhy7VVZrLYTh8f14sXa1B8ZgdjIs98A3nq9U=;
 b=KdtVUL91VxjxosXmDPRpE3I5QwTuq2VUoD0dYZNj1R1WIKpsrTNZQnwZhpbd8FC7IT
 QMjGD4k79MWeTpliSbiF2xig1+m5S6a+qIPub6S0isbsp2Uq7wuJTgSrXLj4lCm6KYeL
 pW5hPtSh6yJf/o9fceERmzM3AE1ujSrfLH30hmclxzl2HdjQvo+dz3EEY/HAsfdESQm9
 jIny5gs7KLYM/pTzdRLy0L/2wR/NQa9kJHw0BWkXdZuaxzR7tETnJWTGSZbxDldVu75/
 XTDexggt+6tVfH1XXo7uEHnD19FTR/Sl5d3717LYwB7onybY6Fq44KBlFcstseUBMhZE
 xGdA==
X-Gm-Message-State: ANhLgQ0I4rxCmpjJbM6KEK/uzJD/etenc/7092zDksrTWG3kPNS6ovF0
 Mgf5yf6NSpxIuJ8r9sdhl3pkshMy31Y=
X-Google-Smtp-Source: ADFU+vv/5eq/wescbIuAuiUnxuVwe2eMSBpa1+pgKxnpkJxRZKxfl5lW1AS0ZIoyP6l5WOrnRR+VXQ==
X-Received: by 2002:a17:906:1108:: with SMTP id
 h8mr7610032eja.339.1585234171007; 
 Thu, 26 Mar 2020 07:49:31 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id c13sm355563edv.73.2020.03.26.07.49.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 07:49:30 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id s1so8155497wrv.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 07:49:29 -0700 (PDT)
X-Received: by 2002:a5d:4847:: with SMTP id n7mr10220239wrs.182.1585234169169; 
 Thu, 26 Mar 2020 07:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
 <3f0fd837-bee6-3a68-8db3-1a99b97aac9e@suse.com>
In-Reply-To: <3f0fd837-bee6-3a68-8db3-1a99b97aac9e@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Mar 2020 08:48:53 -0600
X-Gmail-Original-Message-ID: <CABfawhkRpvV0asinjdBx2qMq-RQOBbx13bENREszzkBhrgS71Q@mail.gmail.com>
Message-ID: <CABfawhkRpvV0asinjdBx2qMq-RQOBbx13bENREszzkBhrgS71Q@mail.gmail.com>
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

On Thu, Mar 26, 2020 at 4:17 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.03.2020 18:04, Tamas K Lengyel wrote:
> > +static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
> > +{
> > +    int rc;
> > +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> > +    struct page_info *page, *tmp;
> > +
> > +    spin_lock(&d->page_alloc_lock);
> > +    domain_pause(d);
>
> Why do you take the lock first?

No particular reason - does the order matter?

Tamas

