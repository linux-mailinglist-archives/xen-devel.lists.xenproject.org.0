Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238861DFEBF
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2020 13:53:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcpBS-00028l-KE; Sun, 24 May 2020 11:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0KGn=7G=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jcpBQ-00028g-IQ
 for xen-devel@lists.xenproject.org; Sun, 24 May 2020 11:52:48 +0000
X-Inumbo-ID: 1614e902-9db5-11ea-ae69-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1614e902-9db5-11ea-ae69-bc764e2007e4;
 Sun, 24 May 2020 11:52:47 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jcpBM-0001Dn-OP; Sun, 24 May 2020 11:52:44 +0000
Date: Sun, 24 May 2020 12:52:44 +0100
From: Tim Deegan <tim@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
Message-ID: <20200524115244.GA4663@deinos.phlegethon.org>
References: <20200521090428.11425-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200521090428.11425-1-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 10:04 +0100 on 21 May (1590055468), Andrew Cooper wrote:
> When compiling with SHOPT_OUT_OF_SYNC disabled, the build fails with:
> 
>   common.c:41:12: error: ‘sh_remove_write_access_from_sl1p’ declared ‘static’ but never defined [-Werror=unused-function]
>    static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> due to an unguarded forward declaration.
> 
> It turns out there is no need to forward declare
> sh_remove_write_access_from_sl1p() to begin with, so move it to just ahead of
> its first users, which is within a larger #ifdef'd SHOPT_OUT_OF_SYNC block.
> 
> Fix up for style while moving it.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thank you!  This is fine, either as-is or with the suggested change to
a switch.

Reviewed-by: Tim Deegan <tim@xen.org>


