Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA051A9BEF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:16:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOg1f-0007NC-AR; Wed, 15 Apr 2020 11:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOg1e-0007N7-4U
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:16:14 +0000
X-Inumbo-ID: 8462efea-7f0a-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8462efea-7f0a-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=WQhU2eWWD1jnfPJ21bQCTdvQycHECudYtmpUalAkOAE=; b=GFmVHRlZEGKoSaFafF38HkbwkR
 XWYWswhbWC0CUHaXKfGIPJRYd3PtnsQYSXktNd0PzZs4BQoeC4Trhd45CZ0nUeBYaBT6fqMXAiyKh
 SHubphGzzOCTPautKDfD2BxikfYff5DHjVgWl93XlbiAYLSyr9aqz78O/LOaqU30Dsbs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg1c-0001L5-Qa; Wed, 15 Apr 2020 11:16:12 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOg1c-0005bk-HN; Wed, 15 Apr 2020 11:16:12 +0000
Date: Wed, 15 Apr 2020 12:16:09 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: drop unnecessary page table walking in compat
 r/o M2P handling
Message-ID: <20200415111609.6xmfmlc2ygwwon4n@debian>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
 <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
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
Cc: Hongyan Xia <hx242@xen.org>, julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 10:23:31AM +0200, Jan Beulich wrote:
> We have a global variable where the necessary L2 table is recorded; no
> need to inspect L4 and L3 tables (and this way a few less places will
> eventually need adjustment when we want to support 5-level page tables).
> Also avoid setting up the L3 entry, as the address range never gets used
> anyway (it'll be dropped altogether in a subsequent patch).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

