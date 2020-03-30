Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31029197668
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 10:28:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIpjU-0007Ga-Ke; Mon, 30 Mar 2020 08:25:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UB1w=5P=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jIpjT-0007GV-1Q
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 08:25:19 +0000
X-Inumbo-ID: fd535528-725f-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd535528-725f-11ea-bec1-bc764e2007e4;
 Mon, 30 Mar 2020 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BXK3VeeFDgMxILTOJSz/ydecE2N6/aBmi0GrfZpcVC8=; b=6xLSLs3u37rED5WUYLaTFOHcKR
 VY4dla9FDgEPnsn0TcbotCNwGj2+wT936/sVTUiTN605/Jk37ykjoNdpjDgUNG2i8AMN7Nugpd9Ri
 4PTGeWqd6uvxebSP33G0Ix+0DpR3NjfzSvRa71FpaPxs/PrWX5qlQBYLiNrLkrE2kEMA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jIpjR-0007Eg-Si; Mon, 30 Mar 2020 08:25:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=edge-m2-r2-153.e-iad50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jIpjR-0007b6-Ht; Mon, 30 Mar 2020 08:25:17 +0000
Message-ID: <6f30457357f08ea6432be6486cbb86e0158bc59f.camel@xen.org>
From: Hongyan Xia <hx242@xen.org>
To: Wei Liu <wl@xen.org>
Date: Mon, 30 Mar 2020 09:25:16 +0100
In-Reply-To: <20200329150614.ofsg7tiipxz35ucc@debian>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <20200329150614.ofsg7tiipxz35ucc@debian>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 0/5] use new API for Xen page tables
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
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 2020-03-29 at 16:06 +0100, Wei Liu wrote:
> On Mon, Mar 23, 2020 at 09:41:37AM +0000, Hongyan Xia wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > This small series is basically just rewriting functions using the
> > new
> > API to map and unmap PTEs. Each patch is independent.
> > 
> > Apart from mapping and unmapping page tables, no other functional
> > change
> > intended.
> > 
> 
> The code looks correct to me.
> 
> I do wonder if you should've put your SoB instead of Rb in some of
> the
> patches.

I am not exactly sure what the policy is. For a couple of the patches,
I did not touch anything but just cherry-picked from your tree, and
what I did was just looking at the code and double checking, so I put
an Rb there. Will change to SoB if this is not how we do things.

Hongyan


