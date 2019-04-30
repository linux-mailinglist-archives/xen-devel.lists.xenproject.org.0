Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A01007D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 22:00:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLYrt-00021y-S2; Tue, 30 Apr 2019 19:56:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLYrs-00021t-89
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 19:56:44 +0000
X-Inumbo-ID: 134cd52d-6b82-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 134cd52d-6b82-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 19:56:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2039720675;
 Tue, 30 Apr 2019 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556654202;
 bh=faE/OYFEfARt/88TnpLus7zBGAXHIk1A7oEjLpPmivA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=L1WMvuNrT5K/GqzDkxAbLe32QmNIKTVtzAaegB2s+p25461LckE9MPXMckGhdoOL4
 ZqkJx6g/iAYzfpwqDHp0qJQGjgYm9fRS2OkMUqmIoiTkwp5fAkKsR5HmLiWhAHjRJj
 DTPPA6gW73mjn5rkgSMcqlu42a6FYwgO7YeWYaCI=
Date: Tue, 30 Apr 2019 12:56:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.10.1904300920220.27577@sstabellini-ThinkPad-X260>
Message-ID: <alpine.DEB.2.10.1904301256190.27577@sstabellini-ThinkPad-X260>
References: <20190430053741.F1C0C2080C@mail.kernel.org>
 <alpine.DEB.2.10.1904300920220.27577@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1057078608-1556654202=:27577"
Subject: Re: [Xen-devel] [patch 2/2] xen/arm: Use p2m entry with lock
 protection
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Hillf Danton <hdanton@sina.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1057078608-1556654202=:27577
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 30 Apr 2019, Stefano Stabellini wrote:
> On Tue, 30 Apr 2019, Hillf Danton wrote:
> > A new local variable is introduced for accessing p2m entry with lock protection.
> > 
> 
> Same comment about html and space damage. But the change looks correct.

I fixed up the patches and committed both of them to the xentip tree.

 
> > 
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > Signed-off-by: Hillf Danton <hdanton@sina.com>
> > 
> > ---
> > 
> >  
> > 
> > --- a/arch/arm/xen/p2m.c 2019-04-30 12:32:05.363768200 +0800
> > 
> > +++ b/arch/arm/xen/p2m.c    2019-04-30 12:58:19.854334100 +0800
> > 
> > @@ -70,8 +70,9 @@ unsigned long __pfn_to_mfn(unsigned long
> > 
> >              entry = rb_entry(n, struct xen_p2m_entry, rbnode_phys);
> > 
> >              if (entry->pfn <= pfn &&
> > 
> >                            entry->pfn + entry->nr_pages > pfn) {
> > 
> > +                  unsigned long mfn = entry->mfn + (pfn - entry->pfn);
> > 
> >                     read_unlock_irqrestore(&p2m_lock, irqflags);
> > 
> > -                  return entry->mfn + (pfn - entry->pfn);
> > 
> > +                  return mfn;
> > 
> >              }
> > 
> >              if (pfn < entry->pfn)
> > 
> >                     n = n->rb_left;
> > 
> > --
> > 
> >  
> > 
> > 
> > 
--8323329-1057078608-1556654202=:27577
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1057078608-1556654202=:27577--

