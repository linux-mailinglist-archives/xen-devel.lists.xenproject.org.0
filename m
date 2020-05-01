Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E11C127F
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 15:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUVGN-0007h3-Fs; Fri, 01 May 2020 12:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Po+f=6P=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUVGM-0007gy-64
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:59:30 +0000
X-Inumbo-ID: 96f0b860-8bab-11ea-9b06-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96f0b860-8bab-11ea-9b06-12813bfff9fa;
 Fri, 01 May 2020 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IdRBKq0YBkLqGZVM10/BnE5IIMr0ef1luLOVLtRwzTs=; b=5QkT3jS8hMiwkDstGRlcLJHHFr
 PkvTnIckgIwRxTFzFUfhptDAkIJWrG4YLFpfqADUjjEUAwelpBoTCUiLghxqj4jabOf56nhozOGM4
 bvx6opdLGSJgj5Mo6NQpiesbdxd9nPZBjGTwhHpQG576n1fMEvs6HtT0PRAFC9uVnPqs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUVGI-0001U1-W4; Fri, 01 May 2020 12:59:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUVGI-0000Xe-JI; Fri, 01 May 2020 12:59:26 +0000
Message-ID: <2235f884b65c9f20cf55637f91ddab6924f53ca1.camel@xen.org>
Subject: Re: [PATCH 11/16] x86: add a boot option to enable and disable the
 direct map
From: Hongyan Xia <hx242@xen.org>
To: Wei Liu <wl@xen.org>
Date: Fri, 01 May 2020 13:59:24 +0100
In-Reply-To: <20200501121132.kzhu7u2vmpoeju2x@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
 <20200501121132.kzhu7u2vmpoeju2x@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-05-01 at 12:11 +0000, Wei Liu wrote:
> On Thu, Apr 30, 2020 at 09:44:20PM +0100, Hongyan Xia wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > Also add a helper function to retrieve it. Change
> > arch_mfn_in_direct_map
> > to check this option before returning.
> > 
> > This is added as a boot command line option, not a Kconfig. We do
> > not
> > produce different builds for EC2 so this is not introduced as a
> > compile-time configuration.
> 
> Having a Kconfig will probably allow the compiler to eliminate dead
> code.
> 
> This is not asking you to do the work, someone can come along and
> adjust 
> arch_has_directmap easily.

My original code added this as a CONFIG option, but I converted it into
a boot-time switch, so I can just dig out history and convert it back.
I wonder if we should get more opinions on this to make a decision.

I would love Xen to have static key support though so that a boot-time
switch costs no run-time performance.

Hongyan


