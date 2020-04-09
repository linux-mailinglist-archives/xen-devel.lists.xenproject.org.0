Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B551A35ED
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYER-000505-Gr; Thu, 09 Apr 2020 14:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMYEQ-000500-Ad
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:32:38 +0000
X-Inumbo-ID: f5d80958-7a6e-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d80958-7a6e-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=+wsKpVx4Upuyd7YJmc5eSbEDOgYg5uNqWxGLpeT+A7k=; b=sREoCa/1uLtetSfSa7NekqAbkW
 m0h1icn5G+lJbtY3hlxejp3R+nzCD5lU2+6tCmvVWWHN9xB6H7LtP3vUCsGZuZNMt2pLCP9Km1zJ0
 K1SZvRUD2y8EaafCQTw9L0q2uTYhYJChp23zg8ifOwePi+PzzmKwSrdWD/BzrVQI6Gig=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYEP-0007Gb-55; Thu, 09 Apr 2020 14:32:37 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYEO-0004Cb-SE; Thu, 09 Apr 2020 14:32:37 +0000
Date: Thu, 9 Apr 2020 15:32:33 +0100
From: Wei Liu <wl@xen.org>
To: "Panyakin, Andrew" <apanyaki@amazon.com>
Subject: Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy
 request
Message-ID: <20200409143233.qarpf2vgynqqgrht@debian>
References: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
 <20200407202244.a6isag63njejbshe@debian>
 <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 12:06:22AM +0200, Panyakin, Andrew wrote:
> On 4/7/20 10:22 PM, Wei Liu wrote:
> > On Tue, Apr 07, 2020 at 02:52:22PM +0000, Andrew Panyakin wrote:
> >> libxc defines XGS_POLICY_ABORT for precopy policy to signal that migration
> >> should be aborted (eg. if the estimated pause time is too huge for the
> >> instance). Default simple precopy policy never returns that, but it could be
> >> overriden with a custom one.
> >>
> > 
> > Right. I think this is a real problem.
> > 
> >> Signed-off-by: Andrew Panyakin <apanyaki@amazon.com>
> >> ---
> >>  tools/libxc/xc_sr_save.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
> >> index fa736a311f..507274ce22 100644
> >> --- a/tools/libxc/xc_sr_save.c
> >> +++ b/tools/libxc/xc_sr_save.c
> >> @@ -560,6 +560,12 @@ static int send_memory_live(struct xc_sr_context *ctx)
> >>
> >>      }
> >>
> >> +    if ( policy_decision == XGS_POLICY_ABORT ) {
> > 
> > The { should be on a new line.
> > 
> >> +        PERROR("Abort precopy loop");
> >> +        rc = -1;
> >> +        goto out;
> > 
> > There is no need to have "goto out" here.
> 
> I was considering two more examples of "goto out" in a branch right before the label:
> - send_domain_memory_nonlive,
> - send_domain_memory_live.
> 
> Isn't it done this way to simplify the function extension: you won't need to add "goto out" to previous branch when adding new code?

I'm not too fussed about this. Let's keep goto out.

Acked-by: Wei Liu <wl@xen.org>

I will apply this patch shortly.

Wei.

