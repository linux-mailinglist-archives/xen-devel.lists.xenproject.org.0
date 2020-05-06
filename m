Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27C21C6D01
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGRx-0007Tm-26; Wed, 06 May 2020 09:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jP1D=6U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jWGRv-0007Th-Mm
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:34:43 +0000
X-Inumbo-ID: d0d74e98-8f7c-11ea-9e29-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0d74e98-8f7c-11ea-9e29-12813bfff9fa;
 Wed, 06 May 2020 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=BP8uYz/aYWuKgcLUpwpdowh/5shn/LrRYs5btpMcU/E=; b=Qq/O+DK/vZdH44A7vk0UATJ7YG
 tBSh4Zpmk5wsZADQNk+xPLf2b0dj9rvsIyrz3bM4gfIslftWwp4t/vBFN/Hhia9TljOLbNBdc3p7Q
 mPeo93jX8gm6rqhJ/ypTp+Uki270gIHwFB4oVfMucy4spOvSWTUgonj6+7cwt/tndPVI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jWGRu-0000jH-03; Wed, 06 May 2020 09:34:42 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jWGRt-0008BZ-M6; Wed, 06 May 2020 09:34:41 +0000
Date: Wed, 6 May 2020 10:34:39 +0100
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] tools/xenstore: don't store domU's mfn of ring page
 in xenstored
Message-ID: <20200506093439.eqmuc26dglgiqdah@debian>
References: <20200430053842.4376-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430053842.4376-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 07:38:42AM +0200, Juergen Gross wrote:
> The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
> of the domain's xenstore ring page and the event channel of the
> domain for communicating with Xenstore.
> 
> The gfn is not really needed. It is stored in the per-domain struct
> in xenstored and in case of another XS_INTRODUCE for the domain it
> is tested to match the original value. If it doesn't match the
> command is aborted via EINVAL, otherwise the event channel to the
> domain is recreated.
> 
> As XS_INTRODUCE is limited to dom0 and there is no real downside of
> recreating the event channel just omit the test for the gfn to
> match and don't return EINVAL for multiple XS_INTRODUCE calls.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

