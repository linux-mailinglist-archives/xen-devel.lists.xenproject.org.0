Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7D77397A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579538.907555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJPY-0007Aq-CV; Tue, 08 Aug 2023 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579538.907555; Tue, 08 Aug 2023 09:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJPY-000797-9Q; Tue, 08 Aug 2023 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 579538;
 Tue, 08 Aug 2023 09:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTJPW-0006YA-By
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:53:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 798c4c75-35d1-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 11:53:51 +0200 (CEST)
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
X-Inumbo-ID: 798c4c75-35d1-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691488431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjlPd5DxKYzZO/DBZ0j0P070yN/pTV1Fa2AkA1x6QFU=;
  b=Gx1G0F/Lx2khIvsWGpO6iPf12CbAiKntGoFQ+M6kWFLzetdoFIdYnXSR
   eFcLDIXxhu/QOLVldqqEeZ4R81ns7MCMtsZa9jiOpaN/21ZXzn1TBaR1a
   398rahrWBIaeb5SJESSjL57AubV9GquVV0QkQbCn6c8FRvMvY4ogsLbHr
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118113088
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7+LMkKCIjQC0wxVW/xvjw5YqxClBgxIJ4kV8jS/XYbTApDgn0mBTy
 TEWWG2DOfaONmqgctFzOYy29ExU757XyNFmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNA4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5tlbLlERz
 N4jcxtSY0GAq+m42b+fVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XaHJwOxhbIz
 o7A12P5ITsrDuK+8we+40iCoOzxpSG8ZrtHQdVU8dY12QbOlwT/EiY+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceRzMw0
 USSt8j0HjEpu7qQIVqU7rqOpCm+ETQUJ2QFIyQDSGM4D8LL+d9pyEiVF5A6TfDz14eucd3t/
 9yUhDQBq5oj0vcp7P6Qol2WgB6nqIHEahFgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarrU6zGLoC6T7wJs8w4ifIQCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoFr5BiuRxl3xunDO7qXXHI/OPi+P2WZJoYe1dbAvmgh4Rs8toXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSFTOHwCkOQOLrTrClM/SAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSeacFTaMC49NOuHsFQWhStTABHA9G2AgxALCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:xOjV762D7xpA2xSkHZpCkAqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:mnuSDW8ybEb6Rd/4/YGVv1IrNu8VLUT/9yz7fELpCkpiRqSYbUDFrQ==
X-Talos-MUID: 9a23:ZrfYgwZ2UELGnuBTsD/PrgBYCuZS3p+/Mm4rkqs+uY66DHkl
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="118113088"
Date: Tue, 8 Aug 2023 10:53:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxenstat/Linux: pass nul-terminated string to strpbrk()
Message-ID: <9654cdaf-48d0-41d4-8b1a-ee711950c45e@perard>
References: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a7f49430-5933-8388-f73b-3f75a5877bf4@suse.com>

On Wed, Jul 26, 2023 at 12:42:00PM +0200, Jan Beulich wrote:
> While what "tmp" points to has been cleared at the end of the first
> iteration of parseNetDevLine()'s main loop, this is too late for the
> first iteration's invocation of strpbrk() (copying the interface name).
> Properly nul-terminate the string at population time instead, removing
> the late clearing.
> 
> While there also eliminate a confusing (because of being wrong) comment:
> A regex parsing error would be handled one further scope outwards. Here
> we're dealing with field 1 vs any of the later fields.

I think the author of the comment meant that they couldn't create a
regex that locate the interface name, and instead used strpbrk(). But if
the comment is confusing, it's not helpful.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

