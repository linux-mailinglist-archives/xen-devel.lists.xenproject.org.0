Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B805571A88
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 14:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365670.595950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFO8-0001P0-09; Tue, 12 Jul 2022 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365670.595950; Tue, 12 Jul 2022 12:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFO7-0001Md-Tf; Tue, 12 Jul 2022 12:53:15 +0000
Received: by outflank-mailman (input) for mailman id 365670;
 Tue, 12 Jul 2022 12:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYr8=XR=citrix.com=prvs=1856d22e9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oBFO5-0001MR-Uo
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 12:53:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9566eb03-01e1-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 14:53:12 +0200 (CEST)
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
X-Inumbo-ID: 9566eb03-01e1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657630392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7+0MkKoUlDJCX2tZSGG8HIgEkJ52SeoJidLeuN49SU=;
  b=igUsLeFkcHLnr1aYIDYfsMDau4AhArfPbCl4ddXvTj84Ik0cvmCHipRd
   ypEHZQ6VI3sUoCrI1IIqHrVY99Y5xVC7WNVapZJtren5RkS4efiO2CtgM
   4D6N/wOhh11UMhQkOTLvdxuqSC4qLgMqbcKubQg6bMGP4RNffBldBO9hb
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 78167216
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Gv9e1KAzW3WzmxVW/37jw5YqxClBgxIJ4kV8jS/XYbTApDMnhDZUz
 WcYXWDQO/vZNDCmctkkbN7j/B5X78fXytNhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Fg2NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhTw
 ulqsafpVzsWL6aLos4aUAdHUChXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8eRKiBP
 ZNHAdZpRD7HRCxrZF4yMZ8Z38iFoyLNeBxbjHvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRyXYUEwY+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljwWZ/1UKLQk1D6cwe3uyQGaGHdHRxcUPbTKq/QKqSwWO
 k6hxo20WmE+6ODMERpx5Z/P82rsZHF9wXsqIHZdEFBbu4SLTJQb1Eqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCub/BDvNAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUynHSHbtRQunzuabcWNE5vbKIN8B7nwlBBlb5JdwAiN2ADB0B3jk4lc/BP
 xaI5FI5CG57N3q2d65nC7+M5zAR5fG4T7zND6mMBvIXO8QZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKZbyZZvbYIw6pAeLqxA1jOd1m3lumDiILX05pjz+uYejiLeuYe9tGDOzgioRtstofC29H
 w5jCva3
IronPort-HdrOrdr: A9a23:DzQoZaB63Eg9iX7lHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.92,265,1650945600"; 
   d="scan'208";a="78167216"
Date: Tue, 12 Jul 2022 13:52:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
Message-ID: <Ys1upnyR/klYD3KI@perard.uk.xensource.com>
References: <20220712061830.20208-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220712061830.20208-1-jgross@suse.com>

On Tue, Jul 12, 2022 at 08:18:30AM +0200, Juergen Gross wrote:
> In case of maxmem != memsize the E820 map of the PVH stubdom is wrong,
> as it is missing the RAM above memsize.
> 
> Additionally the memory map should only specify the Xen special pages
> as reserved.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - don't change mmio area settings (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

