Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EB6FE178
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 17:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532907.829260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwldZ-0007vp-97; Wed, 10 May 2023 15:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532907.829260; Wed, 10 May 2023 15:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwldZ-0007tq-6S; Wed, 10 May 2023 15:21:53 +0000
Received: by outflank-mailman (input) for mailman id 532907;
 Wed, 10 May 2023 15:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0RdQ=A7=citrix.com=prvs=48752e3ca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pwldX-0007tk-FV
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 15:21:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61853335-ef46-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 17:21:50 +0200 (CEST)
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
X-Inumbo-ID: 61853335-ef46-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683732109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CQMK3pwsedQd+c8cI0qBfBUs4BxRgR2bpNpyDmHIvcs=;
  b=eCojYbOh7sYH/EBXhNVrdcWrMtIx3eq0hlGY1N/Ywufgmj79d0yL47JD
   l+2dE2UPMA7XEbcXYeh70+hiiRPzgtQZ5onEFeuMtU26F5+RZSYt3AzQ4
   xj7XXmd+TMG6kUotCLi4mYjz6qB6mp880MtFdeVHOOhfRradn9lmTmgnW
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111000521
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jiJaZqBLqqjLQhVW/wDjw5YqxClBgxIJ4kV8jS/XYbTApGkkgzUAn
 zYbWjqObveINmL9fN9xbori8RtU78OHyYRnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5B5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq7hrXiJPq
 98hIQsQKReSxN7o45y0Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XTHZ0NwxzBz
 o7A12qgE0szCdO98zeIzy6xgcP1wh7XdqtHQdVU8dY12QbOlwT/EiY+SVq+iem0jAi5Qd03A
 0UM9zAnt6Qa6E2hRd67VBq9yFaGsQQbQMF4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsFFVfpYO5+cdq00yJF4w4eEKosjHrMWCu3
 2/JrXYdvrwokIkMxuaHo3PpjBv58/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZnzv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/3lPwNcebgKrrUazGKJQM8vy6Ps04lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EWf85kWXqF79BjOJDKsUCKYT7GvjGI+mPi+LCNBZ5t59fWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDX8UjyqZKdQpiBSFiVfjLRzl/KrbrzvxORDtwVJc8ANoJJ+RYokiivrmWp
 ijnAxUClDISRxTvcG23V5yqU5u3Nb4XkJ7xFXZ1Zz5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:cXo5I6MST3HGDcBcTsWjsMiBIKoaSvp037B87TEUdfU1SKylfq
 +V98jzuSWftN9zYhAdcLK7V5VoGkmskKKdiLN5VYtKOjOKhILCFu9fBOXZrwEJtEfFh4lgPQ
 sLSdkcNDVQZ2IK7/rH3A==
X-Talos-CUID: 9a23:pd33T2BLYQTG3Aj6E3g56BFXG54GS3Tm0TDXMgyEV0VHR5TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ApjgvOA5KZa9CCVmsAuwwr0POxoxmurX0IX0Cs68?=
 =?us-ascii?q?LtvTYKCtcAWigoBqeF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="111000521"
Date: Wed, 10 May 2023 16:19:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 2/3] tools: Use new xc function for some
 xc_domain_getinfo() calls
Message-ID: <4672e3b5-870a-4a83-aba5-1d31d014fd6b@perard>
References: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
 <20230509160712.11685-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230509160712.11685-3-alejandro.vallejo@cloud.com>

On Tue, May 09, 2023 at 05:07:11PM +0100, Alejandro Vallejo wrote:
> Move calls that require a information about a single precisely identified
> domain to the new xc_domain_getinfo_single().
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

