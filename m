Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56FB578361
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369775.601272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQZO-0003mY-5K; Mon, 18 Jul 2022 13:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369775.601272; Mon, 18 Jul 2022 13:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQZO-0003j8-1w; Mon, 18 Jul 2022 13:13:54 +0000
Received: by outflank-mailman (input) for mailman id 369775;
 Mon, 18 Jul 2022 13:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ih7=XX=citrix.com=prvs=1911958e4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oDQZM-0003j1-LR
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:13:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75eb1311-069b-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 15:13:51 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 75eb1311-069b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658150031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ee8zZBRLS39bKkXaWoy0VVYK7jBHqqKvv7S7N2BBsZw=;
  b=EgX0jYH0Mf4V/Pn2676l1KRJgoKLKHlkEQ4DlhML+pwpYArTgopyb/8S
   k3NOmfgh3LWKaPzu5seeAujDkg0OZZu6ZLHRS1ao1YI9gpK7A+USCxjML
   1UP64NUjE6d/GQVX10aJ1WIify0LtBLnhOgq/EgMQE3cEtI8KhsW1XGWX
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78602897
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jYiueamNHcjMX6/50kZsTAfo5gzoJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOW2mCaauIZmL3eYx0OYy08UpS6JODnYVjTANprSFkESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3462i4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kpA4pJ2sxwPFtL7
 OE/Lw4zbyubtbKflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oe9boKPKo3VLSlTtlepo
 Xvj9XXfPk4lPuGzmRi68EuxqfCayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy16YmT/BOYPhUvKHYfQig6cwo+++uzidRm5v7QdeqPAJJZn/WsR2yvk
 mjb/XRk71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuc8LbCH7MvcuMt7Z5yEWIU/ITI6NaxwpRoAWPsgZmPGvpkmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuZd2l39W+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4vd/lyOr
 YgOaZvbo/idOcWnChTqHUcoBQhiBRAG6Vre8aS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:22xjb6tfYPNtK3y1sPr/hvZP7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="78602897"
Date: Mon, 18 Jul 2022 14:13:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xl: move freemem()'s "credit expired" loop exit
Message-ID: <YtVcd0Kulbe6LWjA@perard.uk.xensource.com>
References: <c7291aee-f365-dba3-cee3-49762969ffa7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c7291aee-f365-dba3-cee3-49762969ffa7@suse.com>

On Tue, Jul 12, 2022 at 04:08:12PM +0200, Jan Beulich wrote:
> Move the "credit expired" loop exit to the middle of the loop,
> immediately after "return true". This way having reached the goal on the
> last iteration would be reported as success to the caller, rather than
> as "timed out".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

