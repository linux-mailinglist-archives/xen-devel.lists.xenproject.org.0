Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93951B70B8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRuX5-0001mK-AV; Fri, 24 Apr 2020 09:22:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRuX4-0001mE-Gk
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:22:02 +0000
X-Inumbo-ID: 0e4a04e2-860d-11ea-9476-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e4a04e2-860d-11ea-9476-12813bfff9fa;
 Fri, 24 Apr 2020 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6LoKLiurglRXcB09V3LQifdnPvFZ0Y08tYsoZQRr1ow=; b=Y5GSGtK4WBubrOdODyO8a9v2KN
 M1Zwz1vbYi0guIaoFttUn1KqEiAd4BxHLp+G8Ij1NXXJPO+jqk0BLRZK/oVZm2GQ1kCGNmeQj3RQ+
 DiROrXuIxpMllIX3IEPPVZ30m7PomT6FgPCn8rIoES4b5vouQ26F6rGVaEWWotrH3sjI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRuX3-0003uk-TO; Fri, 24 Apr 2020 09:22:01 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRuX3-0005Tb-JE; Fri, 24 Apr 2020 09:22:01 +0000
Message-ID: <ba87751e66decae06118bbdf607a89d1406cb3e8.camel@xen.org>
Subject: Re: [PATCH 1/6] x86_64/mm: map and unmap page tables in
 cleanup_frame_table
From: Hongyan Xia <hx242@xen.org>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Fri, 24 Apr 2020 10:21:59 +0100
In-Reply-To: <ca9b1554-2c91-35f4-2e6b-b7d4985b638d@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <12c4fe0c0c05b9f76377c085d8a6558beae64003.1587116799.git.hongyxia@amazon.com>
 <ca9b1554-2c91-35f4-2e6b-b7d4985b638d@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Julien,

On Fri, 2020-04-24 at 09:59 +0100, Julien Grall wrote:
> (resending)
> 
> On 17/04/2020 10:52, Hongyan Xia wrote:
> > From: Wei Liu <wei.liu2@citrix.com>
> > 
> > Also fix a weird indentation.
> > 
> > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > ---
> >   xen/arch/x86/x86_64/mm.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> > index e85ef449f3..18210405f4 100644
> > --- a/xen/arch/x86/x86_64/mm.c
> > +++ b/xen/arch/x86/x86_64/mm.c
> > @@ -737,8 +737,8 @@ static void cleanup_frame_table(struct
> > mem_hotadd_info *info)
> >   
> >       while (sva < eva)
> >       {
> > -        l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(sva)])[
> > -          l3_table_offset(sva)];
> > +        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(sva)],
> > +                           l3_table_offset(sva));
> 
> This macro doesn't exist yet in the tree. It would be good to spell
> out 
> the dependencies in the cover letter so this doesn't get merged
> before 
> the dependency is merged.

I believe the introduction of the new macros has been merged in staging
as 6c8afe5aadb33761431b24157d99b25eac15fc7e.

> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

Hongyan


