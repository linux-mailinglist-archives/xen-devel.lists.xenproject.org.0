Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70931941BA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:43:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTft-0001gD-QI; Thu, 26 Mar 2020 14:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5EZ5=5L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jHTfs-0001fz-9E
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:40:00 +0000
X-Inumbo-ID: ab655e5c-6f6f-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab655e5c-6f6f-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FStBvOyeATiGLtctzFKEj1lIN1bfa6vlzLCCqf9BnzY=; b=zPNoKfOPoSadJLXaZQcaOzQfC/
 xjd2zMFY/qm58SN4accOYqYNJKlqfcnhKYSBf3OM6vkvmWQnCtE096ZOgaFcaAamRJ4/A28hTN6hZ
 3k1IkRFTCWGlPRKIYHpRRKRwOxlhAqPDdKsSMmmsQfPWSHUFd2NYwNRDigXX2neZF1To=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jHTfq-00013D-TI; Thu, 26 Mar 2020 14:39:58 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jHTfq-00062U-Ie; Thu, 26 Mar 2020 14:39:58 +0000
Message-ID: <059d2dad459bbdafe11b21c93cc8e9ce42df4ecf.camel@xen.org>
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Date: Thu, 26 Mar 2020 14:39:55 +0000
In-Reply-To: <30f1ec6d-b5be-fcb1-c685-ed02961175c1@suse.com>
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
 <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
 <94abc4e0-b11e-df0f-3e3c-c3a61d87c63a@xen.org>
 <30f1ec6d-b5be-fcb1-c685-ed02961175c1@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] Revert "domctl: improve locking during
 domain destruction"
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
Cc: Charles Arnold <CARNOLD@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jim Fehlig <JFEHLIG@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-03-25 at 08:11 +0100, Jan Beulich wrote:
> On 24.03.2020 19:39, Julien Grall wrote:
> > On 24/03/2020 16:13, Jan Beulich wrote:
> > > On 24.03.2020 16:21, Hongyan Xia wrote:
> > > > From: Hongyan Xia <hongyxia@amazon.com>
> > > > In contrast,
> > > > after dropping that commit, parallel domain destructions will
> > > > just fail
> > > > to take the domctl lock, creating a hypercall continuation and
> > > > backing
> > > > off immediately, allowing the thread that holds the lock to
> > > > destroy a
> > > > domain much more quickly and allowing backed-off threads to
> > > > process
> > > > events and irqs.
> > > > 
> > > > On a 144-core server with 4TiB of memory, destroying 32 guests
> > > > (each
> > > > with 4 vcpus and 122GiB memory) simultaneously takes:
> > > > 
> > > > before the revert: 29 minutes
> > > > after the revert: 6 minutes
> > > 
> > > This wants comparing against numbers demonstrating the bad
> > > effects of
> > > the global domctl lock. Iirc they were quite a bit higher than 6
> > > min,
> > > perhaps depending on guest properties.
> > 
> > Your original commit message doesn't contain any clue in which
> > cases the domctl lock was an issue. So please provide information
> > on the setups you think it will make it worse.
> 
> I did never observe the issue myself - let's see whether one of the
> SUSE
> people possibly involved in this back then recall (or have further
> pointers; Jim, Charles?), or whether any of the (partly former)
> Citrix
> folks do. My vague recollection is that the issue was the tool stack
> as
> a whole stalling for far too long in particular when destroying very
> large guests. One important aspect not discussed in the commit
> message
> at all is that holding the domctl lock block basically _all_ tool
> stack
> operations (including e.g. creation of new guests), whereas the new
> issue attempted to be addressed is limited to just domain cleanup.

The best solution is to make the heap scalable instead of a global
lock, but that is not going to be trivial.

Of course, another solution is to keep the domctl lock dropped in
domain_kill() but have another domain_kill lock so that competing
domain_kill()s will try to take that lock and back off with hypercall
continuation. But this is kind of hacky (we introduce a lock to reduce
spinlock contention elsewhere), which is probably not a solution but a
workaround.

Seeing the dramatic increase from 6 to 29 minutes in concurrent guest
destruction, I wonder if the benefit of that commit can outweigh this
negative though.

Hongyan


