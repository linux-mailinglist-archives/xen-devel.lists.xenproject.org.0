Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D5595EE6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 17:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388345.624976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNyMt-0001ia-KY; Tue, 16 Aug 2022 15:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388345.624976; Tue, 16 Aug 2022 15:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNyMt-0001g5-Hv; Tue, 16 Aug 2022 15:20:35 +0000
Received: by outflank-mailman (input) for mailman id 388345;
 Tue, 16 Aug 2022 15:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=REbT=YU=citrix.com=prvs=22068c4b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oNyMs-0001fz-KZ
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 15:20:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d3b984-1d76-11ed-9250-1f966e50362f;
 Tue, 16 Aug 2022 17:20:32 +0200 (CEST)
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
X-Inumbo-ID: f6d3b984-1d76-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660663232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSnMcxQ9HrAflODWsdf//EDlkMtOxbLqr6KuuDOSUUg=;
  b=NYkXlfZV/mwkch/QhY1u14edrhK+bBPVlqeH4qIEpVMSn0rpNUHbdjNz
   QOYYcFOQC9tfwY0q6xOz84NeZDL9A4QrG6hR/WruD+L3arAYZOzqgGPC1
   W7P3TsBr20xxASncr+peGwQ0hdFSJbWuvW1B8ujLcmtncq61J5NkuAqcr
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77957982
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d02LtqLI9Hnrbvn6FE+RG5UlxSXFcZb7ZxGr2PjKsXjdYENSgWFSy
 jAcUG+Fb66OY2D1fdxzbom280JV6sCHnNZrGgNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La9ks11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEwvdzIkcoG4ojy/9rWGZ08
 800cz9UV0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMk10sj+m9arI5fPSTRvlaw02Kh
 1vP4kHWJT0xboCGjhCspyfEaujnwnqgBdN6+KeD3uVxnFSZy2gXCRsXfVi2u/+0jgi5Qd03A
 0YZ4DY0pK4+skmiVMDgXgaQqWSB+BUbXrJ4Leo+7w2cz7vO1CyQDGMEUz1pZcQvsYk9QjlC/
 kCEnpXiBTFpmLSPTDSW8bL8hTGvPSkYK0cSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj/6ex8E3DgjmsjoPUVQNz7QLSNl9J9SsgOtTjPdbxrwGGs7AQd+51U2Vto
 lAFmdWw6v4oCqq8jTDUR98LLZ3y6K+8ZWi0bUFUI3Uxy9i80yf9I9gOu2sidRoB3tUsImGwP
 hKK0e9FzNoKZSbxM/cqC26kI55ypZUMA+gJQRw9gjBmRpFqPDGK8yh1DaJ79zC8yRN8+U3T1
 HryTCpNMZr5If4+pNZOb71BuYLHPwhnrY8pebj1zg68zZ2Vb2OPRLEOPTOmN75ntP7U8FuNr
 Y0EZ6NmLimzt8WvChQ7DKZJdQxaRZTFLcqeRzNrmh6rfVM9RTBJ5w75yrI9YY1195loehPz1
 ijkAidwlQug7UAr3C3QNRiPnpuzAsskxZ/6VARwVWuVN48LONz/sv9OJ8pvFVTlncQ6pcNJo
 zA+U53oKpxypv7voWt1gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:djcut6phdIQ9oy6TGIMkm7AaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.93,241,1654574400"; 
   d="scan'208";a="77957982"
Date: Tue, 16 Aug 2022 16:20:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Wei
 Chen" <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Message-ID: <Yvu1oi0RLNfpR52M@perard.uk.xensource.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <741163de-607f-dbfd-e9f8-ef3072a16de6@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <741163de-607f-dbfd-e9f8-ef3072a16de6@xen.org>

On Tue, Aug 16, 2022 at 12:01:40PM +0100, Julien Grall wrote:
> >   xen/common/efi/{stub.c => common_stub.c} | 6 ++++++
> 
> I haven't looked at the rest of the patch. However, I think you also want to
> update .gitignore to excluse arch/*/efi/common_stub.c.
> 
> Also, I am thinking to drop my patch [1] which update .gitignore as this
> will become moot with this change. Let me know what you think.

Sound good,

Thanks,

-- 
Anthony PERARD

