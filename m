Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE01B6F8F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 10:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRtNE-0002tJ-TT; Fri, 24 Apr 2020 08:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRtND-0002tE-7k
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 08:07:47 +0000
X-Inumbo-ID: ae96bb62-8602-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae96bb62-8602-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Xa0bV/lQIrQ1jwTvvg6j0PVnINSLn63b4eWvHcAjDg=; b=Kp4+Hd1d20ntgz8cSTangEQ0i4
 LD04wNXoM9kzBU3sTsidAk/1psdkE4LiYveUchtH2eKir0RJ2jweflzcy1VdQl1ZXoHOyv3l7/pS1
 lqOAU2ZqhaQSj1XaVMJvc5KJ/Cd6FUtuCEvn8rkcOj+Ux0uMjWtiDx9vl2/a/w+WoZ1E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRtNC-0002MO-45; Fri, 24 Apr 2020 08:07:46 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRtNB-0007rZ-Pt; Fri, 24 Apr 2020 08:07:46 +0000
Message-ID: <7d7155eda49856fa7f471db98b71b6a84e8beea4.camel@xen.org>
Subject: Re: [PATCH 0/6] convert more Xen page table code to the new API
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 24 Apr 2020 09:07:43 +0100
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A gentle ping.

On Fri, 2020-04-17 at 10:52 +0100, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Basically just rewriting functions using the new API to map and unmap
> PTEs. Each patch is independent.
> 
> Apart from mapping and unmapping page tables, no other functional
> change
> intended.
> 
> Wei Liu (6):
>   x86_64/mm: map and unmap page tables in cleanup_frame_table
>   x86_64/mm: map and unmap page tables in subarch_init_memory
>   x86_64/mm: map and unmap page tables in subarch_memory_op
>   x86/smpboot: map and unmap page tables in cleanup_cpu_root_pgt
>   x86/pv: map and unmap page tables in mark_pv_pt_pages_rdonly
>   x86/pv: map and unmap page table in dom0_construct_pv
> 
>  xen/arch/x86/pv/dom0_build.c | 38 ++++++++++++++++++++++++--------
> ----
>  xen/arch/x86/smpboot.c       | 25 ++++++++++++++++--------
>  xen/arch/x86/x86_64/mm.c     | 32 +++++++++++++++---------------
>  3 files changed, 58 insertions(+), 37 deletions(-)
> 


