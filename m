Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2C1E2179
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 13:56:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdYAU-0001hd-HC; Tue, 26 May 2020 11:54:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdYAT-0001hX-7k
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 11:54:49 +0000
X-Inumbo-ID: b27c9a4a-9f47-11ea-9947-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b27c9a4a-9f47-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 11:54:48 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 0D2D2122804;
 Tue, 26 May 2020 13:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590494087;
 bh=QFPqT+wMGFf0hsPuefeEdPUGLpxgodt6U7aKLQIqJtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLgJZgWPv9JNi73tAsS754tnBDH0rRz6wRinU0Se2qyr7pgjUxvs8OLsHRS95HevT
 hppI8NMQngUX7awqmCeuZu7eIS9OIgiMMh0EAy+svRk/JJYUc7XqKewSuJS87XzXXZ
 KjMhT+GIrF9yQG9gIGyiNHs5jJLqcwMR/nuWKxZcN56HqUIgCJNimNVYLHsFp9WTi4
 d1D+pmC/FD0kDs4zNY5VApzb72hGEImzYhUD8eD1ihgh2f2/53nFfCoyPEl8ebJ7tv
 XUtacmkeS9hPhjLIc5Cym0+j8IP1ZzRVKm0qvf/Z1edMa+rSw8BVe7NJTINUZ/blV8
 w7IBUPKcFkvIg==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id DF22D268436E; Tue, 26 May 2020 13:54:46 +0200 (CEST)
Date: Tue, 26 May 2020 13:54:46 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Mail-Followup-To (was Re: Xen PVH domU start-of-day VCPU state)
Message-ID: <20200526115446.GA24386@nodbug.lucina.net>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <36363b39-c8c1-82bf-af37-f0d917844bb4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36363b39-c8c1-82bf-af37-f0d917844bb4@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, 26.05.2020 at 11:58, Andrew Cooper wrote:
> On 26/05/2020 09:52, Martin Lucina wrote:
> > On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> >> On 25/05/2020 17:42, Jürgen Groß wrote:
> >>> You need to setup virtual addressing and enable 64 bit mode before using
> >>> 64-bit GDT.
> >>>
> >>> See Mini-OS source arch/x86/x86_hvm.S
> >> Or
> >> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> >>
> >> But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> >> will only load the bottom 32 bits of GDTR.base.
> > Ah, I missed Jurgen's and your reply here.
> 
> So the mailing list is doing something evil and setting:
> 
> Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
>     =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
>     xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
>     anil@recoil.org, dave@recoil.org
> 
> which causes normal replies to cut you out.

I _think_ I've fixed this, it was due to ancient Mutt configuration (using
xensource.com / xen.org !?) for xen-devel at my end.

Dropped the other direct Ccs to lessen the noise, but I have no real way of
testing without replying, so here goes.

-mato

