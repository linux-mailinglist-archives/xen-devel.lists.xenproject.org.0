Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B541A362C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:46:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYRl-0006Uk-N8; Thu, 09 Apr 2020 14:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMYRj-0006Ue-NK
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:46:23 +0000
X-Inumbo-ID: e1a96a06-7a70-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a96a06-7a70-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=MueWrmTDF935mg6/uFP0Trw3f8XXT6pdzcfV97Yoy9U=; b=PmOVjou0fwPoR7TYZMdsUxyZJc
 wkN58zTBTdOZfFbcf+RqyaLEcqFET3oWjbMOgqkQncQJpIssc3TyXBGWOPoDikm6VIIijtuq7dlRm
 Sc3UMrPgJqLNokRbLe547/swDrTGmdeC7MQuH9RWjRvcN2+MHucmxAhovmEvh6g5r4QE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYRg-0007Y6-P5; Thu, 09 Apr 2020 14:46:20 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMYRg-0005d5-FM; Thu, 09 Apr 2020 14:46:20 +0000
Date: Thu, 9 Apr 2020 15:46:17 +0100
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH 3/3] mini-os: fix several memory leaks related to xenbus
Message-ID: <20200409144617.6hjxykngc7d2zbxu@debian>
References: <20200409141240.28876-1-jgross@suse.com>
 <20200409141240.28876-4-jgross@suse.com>
 <20200409143527.co3uensu2czln3mf@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409143527.co3uensu2czln3mf@function>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 09, 2020 at 04:35:27PM +0200, Samuel Thibault wrote:
> Juergen Gross, le jeu. 09 avril 2020 16:12:40 +0200, a ecrit:
> > There are several instances of calls to xenbus functions which don't
> > test for an error and in consequence are not freeing the returned
> > error strings, or which are just not freeing the string after e.g.
> > printing it.
> > 
> > Fix that by either adding the needed calls of free().
> > 
> > Coverity-ID: 1433632
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks for your review, Samuel.

I have pushed these patches with your Rbs.

Wei.

