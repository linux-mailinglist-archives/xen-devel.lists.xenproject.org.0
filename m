Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02007FDBF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVTM-0000Yc-0e; Tue, 30 Apr 2019 16:19:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLVTK-0000YX-SQ
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:19:10 +0000
X-Inumbo-ID: aedf8708-6b63-11e9-82e5-a7c886351641
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aedf8708-6b63-11e9-82e5-a7c886351641;
 Tue, 30 Apr 2019 16:19:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8FBC20835;
 Tue, 30 Apr 2019 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556641148;
 bh=4f7gJ1jJN76/b+CXzczSIERRrgqB8aeIxaDzjdCH/uU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ad2eJ+ea57esaySQoIUh+1yL7Hkrlfsb2DteB5l4Zv6N9eNUyDobZ9396vR0+6qt5
 505o1wloW9oVPGPhhJFb0CEneJDV4QJPSVSWaYXQqZIanq6cyIZx99bYJd7Tqenlly
 aUDh/hKKVqOFhVwi0PxswPyV4IJW8z0izpPOz96U=
Date: Tue, 30 Apr 2019 09:19:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Hillf Danton <hdanton@sina.com>
In-Reply-To: <20190430053719.45D7621670@mail.kernel.org>
Message-ID: <alpine.DEB.2.10.1904300916050.27577@sstabellini-ThinkPad-X260>
References: <20190430053719.45D7621670@mail.kernel.org>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-248116732-1556641148=:27577"
Subject: Re: [Xen-devel] [patch 1/2] xen/arm: Free p2m entry if fail to add
 it to RB tree
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
 "Stefano Stabellini <sstabellini@kernel.org>" <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-248116732-1556641148=:27577
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Hillf,

Thanks for the patch. Please send emails in plain text, no html. Refer
to Documentation/process/submitting-patches.rst.


On Tue, 30 Apr 2019, Hillf Danton wrote:
> Release the newly allocated p2m entry if we detect a duplicate in the RB tree.

Space damage aside due to html, the patch looks good.
  
 
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> 
> Signed-off-by: Hillf Danton <hdanton@sina.com>
> 
> ---
> 
>  
> 
> --- a/arch/arm/xen/p2m.c 2019-04-30 12:32:05.363768200 +0800
> 
> +++ b/arch/arm/xen/p2m.c    2019-04-30 12:41:29.774041800 +0800
> 
> @@ -156,6 +156,7 @@ bool __set_phys_to_machine_multi(unsigne
> 
>        rc = xen_add_phys_to_mach_entry(p2m_entry);
> 
>        if (rc < 0) {
> 
>              write_unlock_irqrestore(&p2m_lock, irqflags);
> 
> +           kfree(p2m_entry);
> 
>              return false;
> 
>        }
> 
>        write_unlock_irqrestore(&p2m_lock, irqflags);
> 
> --
> 
>  
> 
> 
> 
--8323329-248116732-1556641148=:27577
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-248116732-1556641148=:27577--

