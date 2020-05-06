Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E362D1C7165
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 15:07:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWJm5-0000X6-Q9; Wed, 06 May 2020 13:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jP1D=6U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jWJm5-0000X1-2J
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 13:07:45 +0000
X-Inumbo-ID: 933b9cba-8f9a-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 933b9cba-8f9a-11ea-b9cf-bc764e2007e4;
 Wed, 06 May 2020 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JsUk+4tBVrIV3bONlj1imIJNVURzu5HaN2YUTeQbEvQ=; b=eMZ4pACHtLo5apavIQNr9dgUSX
 6Do/q5JdMyaHDnffNYTlBovXFWMUbrHnx3BJST4cvxlJn5aQQINtLuXT93IGrOtFQp0ZCzDrlYSXY
 v0bffQqpJOfZCEvrVqXWzze6pQvP9FhKzFe7KcDYVAd8gsJIeUz6Ix/nkbH6hk028dRI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jWJm4-0004qK-8I; Wed, 06 May 2020 13:07:44 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jWJm3-00063V-Vy; Wed, 06 May 2020 13:07:44 +0000
Date: Wed, 6 May 2020 14:07:41 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] tools/libxl: disable clang indentation check for the
 disk parser
Message-ID: <20200506130741.lgpi4gduon7cqnup@debian>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505092454.9161-4-roger.pau@citrix.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 11:24:54AM +0200, Roger Pau Monne wrote:
> Clang 10 complains with:
> 
> 13: error: misleading indentation; statement is not part of the previous 'if'
>       [-Werror,-Wmisleading-indentation]
>             if ( ! yyg->yy_state_buf )
>             ^
> libxlu_disk_l.c:1259:9: note: previous statement is here
>         if ( ! yyg->yy_state_buf )
>         ^
> 
> Due to the missing braces in single line statements and the wrong
> indentation. Fix this by disabling the warning for that specific file.
> I haven't found a way to force flex to add braces around single line
> statements in conditional blocks.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

