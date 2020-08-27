Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF0254D2F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 20:39:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBMmo-0003So-RS; Thu, 27 Aug 2020 18:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z6xA=CF=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kBMmn-0003Sj-8M
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 18:38:09 +0000
X-Inumbo-ID: a8410d38-fe55-4a1c-8c75-dd173bed564f
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8410d38-fe55-4a1c-8c75-dd173bed564f;
 Thu, 27 Aug 2020 18:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0F0249335;
 Thu, 27 Aug 2020 20:38:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLn007mvFNTD; Thu, 27 Aug 2020 20:38:05 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 4C09592DC;
 Thu, 27 Aug 2020 20:38:05 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kBMmh-0003rE-Sc; Thu, 27 Aug 2020 20:38:03 +0200
Date: Thu, 27 Aug 2020 20:38:03 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Jan Beulich <jbeulich@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable-smoke test] 152898: regressions - FAIL
Message-ID: <20200827183803.32e5flm6dh62c3da@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Costin Lupu <costin.lupu@cs.pub.ro>,
 Jan Beulich <jbeulich@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-152898-mainreport@xen.org>
 <fd303f97-a471-686e-8d4a-12578bdb6c07@suse.com>
 <ef1ffb57-5d70-e819-f4cf-4ff632325b76@cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef1ffb57-5d70-e819-f4cf-4ff632325b76@cs.pub.ro>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Costin Lupu, le jeu. 27 août 2020 19:47:08 +0300, a ecrit:
> On 8/27/20 7:07 PM, Jan Beulich wrote:
> > On 27.08.2020 17:49, osstest service owner wrote:
> >> flight 152898 xen-unstable-smoke real [real]
> >> http://logs.test-lab.xenproject.org/osstest/logs/152898/
> >>
> >> Regressions :-(
> >>
> >> Tests which did not succeed and are blocking,
> >> including tests which could not be run:
> >>  build-amd64                   6 xen-build                fail REGR. vs. 152892
> > 
> > This looks to be an issue in the mini-os tree, and I'm having
> > trouble understanding how it can cause the main tree to first
> > discover it. Is there no push gate for that tree?
> > 
> > In any event, commit 1b8ed31f4ce4 ("mini-os: netfront: Read netmask
> > and gateway from Xenstore") looks to have missed callers to
> > init_netfront(), both in the mini-os tree itself and in stubdom/grub/
> > of the main tree.
> 
> Hi Jan,
> 
> Sorry for missing that. I've just sent a patch on the mini-os mailing
> list. Please let me know if it needs anything else.

We need a patch for stubdom/grub/mini-os.c

Samuel

