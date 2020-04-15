Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8C1A9B67
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfd7-0005J0-46; Wed, 15 Apr 2020 10:50:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOfd5-0005Iu-TW
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:50:51 +0000
X-Inumbo-ID: f8ec7eb6-7f06-11ea-8a2e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ec7eb6-7f06-11ea-8a2e-12813bfff9fa;
 Wed, 15 Apr 2020 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wxLnGTPGz04zsEyi0EroQJbAWZRX1iOLm9OqENiSLtM=; b=AtXCFLudnpeZf1zX6WreoQYyDn
 pkpim0HYQBiW0brJaUpAPmVuKX9RZvTAaLB+pgk5+frUOw1UVCAdAc3dwqXKd+4RW0UgC3tC73eJx
 F4hf2KOdGsJFjomRTYBFjQHRNPXdK3YGwq6n5R1YZW7FMpyd0Me54xCxHUARi1sBNsDw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOfd4-0000pR-CW; Wed, 15 Apr 2020 10:50:50 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=edge-m1-r3-181.e-iad16.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOfd4-0003j9-2G; Wed, 15 Apr 2020 10:50:50 +0000
Message-ID: <edb5dcfc98ae5d9de283f3abb656cef58a3c8f6d.camel@xen.org>
Subject: Re: [PATCH 1/2] x86: drop unnecessary page table walking in compat
 r/o M2P handling
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 15 Apr 2020 11:50:48 +0100
In-Reply-To: <013b0d15-6901-bb87-6b0d-9233f9bf50e6@suse.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
 <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
 <aba418d9b5d8832a2331c3164dc1a9fa1653f6be.camel@xen.org>
 <013b0d15-6901-bb87-6b0d-9233f9bf50e6@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-04-15 at 12:34 +0200, Jan Beulich wrote:
> On 15.04.2020 11:59, Hongyan Xia wrote:
> > ...
> > I would like to drop relevant map/unmap patches and replace them
> > with
> > the new clean-up ones (and place them at the beginning of the
> > series),
> > if there is no objection with that.
> 
> Depending on turnaround, I'd much rather see this go in before
> you re-post. But if you feel like making it part of your series,
> go ahead.

I actually also very much prefer to see those clean-up patches go in
before I post the next revision, so please go ahead.

I will post the next revision minus patch 4 then to avoid conflict.

Hongyan


