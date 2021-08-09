Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A83E46AF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 15:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164995.301503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD5NF-0005X0-ET; Mon, 09 Aug 2021 13:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164995.301503; Mon, 09 Aug 2021 13:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD5NF-0005VC-BP; Mon, 09 Aug 2021 13:31:25 +0000
Received: by outflank-mailman (input) for mailman id 164995;
 Mon, 09 Aug 2021 13:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gMyi=NA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mD5ND-0005V6-EM
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 13:31:23 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff299bc2-e7db-490a-95a9-222584ce2884;
 Mon, 09 Aug 2021 13:31:22 +0000 (UTC)
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
X-Inumbo-ID: ff299bc2-e7db-490a-95a9-222584ce2884
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628515882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J8w5E8NZMxEocbSS+6kQ+G83J4WpeQFnHHLjrgZ3q8E=;
  b=b/FrOxtAPknsfMmcb/vOW837r9qBOshT/Rz4hkWw+PFikXpQpD/SjhY3
   jVuq9BK2ASWTtto6KKwyF052w9W0BVHbALTsZ2G5uVZmOi/YbNjW/Jmwo
   r3zhoFbKo6N1xdmzt7DDKdKuvYMdeB7nTJ73mzH+79jJDMkZ6d8/p6yeg
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mrFtIGx5AS5q88zcKE9ESKQ/iJYueZyLX8Du/kaDjdqXCrWe2el+KWWO0Ou0wjQpWQQiTws6gG
 W8MgMkO2CpyWManBfDBAPq0f+IaJS12+IWufwt2wDix0Xu2MlFkxNkMYKq0t94SgKgWSfXgF+g
 n5oMnfKClfmBb2cwG5R0VEKngmRaW2ANoRwYBf1l3aIVf9AxhtX6xRYEq68956vwYKCjPbD3oC
 uweg/6d9bVCXRploQh/MSr0mvoN+Hz48Hls5CMuAvLgthn44kgmKpBxGy+GUmHBjE42nQsxBo+
 g5tIZ90F23McCyPhAyaBHh9e
X-SBRS: 5.1
X-MesageID: 50409733
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QJSSJqOqSJoQa8BcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.84,307,1620705600"; 
   d="scan'208";a="50409733"
Date: Mon, 9 Aug 2021 14:31:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 19/31] build: rework .banner generation
Message-ID: <YREuIQsyWhZMQ2+l@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-20-anthony.perard@citrix.com>
 <6debeffc-a710-0145-beba-29cc1e00d51e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6debeffc-a710-0145-beba-29cc1e00d51e@suse.com>

On Thu, Aug 05, 2021 at 09:09:13AM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > Avoid depending on Makefile but still allow to rebuild the banner when
> > $(XEN_FULLVERSION) changes.
> > 
> > Also add a dependency on tools/xen.flf, even if not expected to
> > change.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> This looks to be independent of earlier patches in this series? If so,

Yes, it's independent.

> I'd be happy to commit without waiting for earlier patches to get
> review comments addressed.

Thanks,

-- 
Anthony PERARD

