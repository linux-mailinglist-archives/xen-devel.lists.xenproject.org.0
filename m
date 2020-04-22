Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AE71B4A94
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 18:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRII9-0005tN-Gg; Wed, 22 Apr 2020 16:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MSan=6G=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jRII7-0005tI-Fh
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 16:32:03 +0000
X-Inumbo-ID: cbac7c3e-84b6-11ea-92b0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbac7c3e-84b6-11ea-92b0-12813bfff9fa;
 Wed, 22 Apr 2020 16:32:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B95DF20767;
 Wed, 22 Apr 2020 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587573122;
 bh=IBNfVtGrbV89GNQJg6jOWn+LKlgGLO1lj2u1kryxwiw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Prhch0N39vs3d9lnGpw5r2fiDCP/3wnFO+5pZQqKTPVKSIVsdNEkO3NN6KphwOkKb
 DK3h7gneD6xbIf4OubusnlsEke5AOmSoUW8aCm2LZh8n+Kp9s8py/azPzlPpl6EEcW
 7Wmsh4cyJ3/DOfqSab0ySv9jIL1XP0caxr7ljMrQ=
Date: Wed, 22 Apr 2020 09:31:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/grants: fix hypercall continuation for
 GNTTABOP_cache_flush
In-Reply-To: <6b050b8e-72d2-2d4f-3e23-101596d31d40@suse.com>
Message-ID: <alpine.DEB.2.21.2004220911040.25377@sstabellini-ThinkPad-T480s>
References: <20200422130753.14713-1-jgross@suse.com>
 <6b050b8e-72d2-2d4f-3e23-101596d31d40@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 22 Apr 2020, Jan Beulich wrote:
> On 22.04.2020 15:07, Juergen Gross wrote:
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -3626,12 +3626,12 @@ do_grant_table_op(
> >          if ( unlikely(!guest_handle_okay(cflush, count)) )
> >              goto out;
> >          rc = gnttab_cache_flush(cflush, &opaque_in, count);
> > -        if ( rc > 0 )
> > +        if ( rc >= 0 )
> >          {
> >              guest_handle_add_offset(cflush, rc);
> >              uop = guest_handle_cast(cflush, void);
> > +            opaque_out = opaque_in;
> >          }
> > -        opaque_out = opaque_in;
> >          break;
> >      }
> >  
> > @@ -3641,7 +3641,7 @@ do_grant_table_op(
> >      }
> >  
> >    out:
> > -    if ( rc > 0 || opaque_out != 0 )
> > +    if ( rc > 0 || (opaque_out != 0 && rc == 0) )
> 
> I disagree with this part - opaque_out shouldn't end up non-zero
> when rc < 0, and it won't anymore with the change in the earlier
> hunk.

But opaque_out could end up being non-zero when rc == 0. I think it is a
good improvement that we explicitly prevent rc < 0 from entering this
if condition. This is why this new version of the patch is my favorite:
it is the one that leads to the code most robust. 

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


That said, as I mentioned before, I would be OK even without the last
part because it would still be enough to fix the bug.

