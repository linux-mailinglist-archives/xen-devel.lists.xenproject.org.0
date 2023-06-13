Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6B72E7E4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548261.856119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96bk-0000nK-VC; Tue, 13 Jun 2023 16:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548261.856119; Tue, 13 Jun 2023 16:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96bk-0000kX-RS; Tue, 13 Jun 2023 16:11:00 +0000
Received: by outflank-mailman (input) for mailman id 548261;
 Tue, 13 Jun 2023 16:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q96bj-0000kO-Be
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:10:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfaa8551-0a04-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 18:10:56 +0200 (CEST)
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
X-Inumbo-ID: dfaa8551-0a04-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686672656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YOCbkHLgdOYOkJkIMMb/d5b/Zw3GimLQkPjbzS8R3WA=;
  b=Kk0h27YQU3OdLLTDWX1WBkBazy84Uv4VVqM2r7VgioDimXJumHPNpcGV
   wUMIp4KJJKf21JlaWTlckYEiZ0eaZLu2SqjsKu2ILlnYHSvvRxiiJyM4K
   rLqmQI77+W3krZ7ZAkbuFqSGF1av4kl5vKrZUsPKvuQsSkTJudcdvanyC
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113059650
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:fgQL3q3PcAY1sZn8zPbD5f9xkn2cJEfYwER7XKvMYLTBsI5bpzEBn
 GIZUWqCbP+IN2T0fY8iadmyoE5Q75KDndQwSAVspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOThI/
 KAqEyk3T068osXnwLiWFONWv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwOxhvJ+
 D+el4j/Kk9BKMKhih+4yyOThPDBzQy8Z4c+KJTto5aGh3XMnzdOWXX6T2CTo/O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsUTppeNEg8sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnp+dtT6oMDIZBXMDbyQDCwAC5rHeTJob10yVCIw5Sejs04OzQGurq
 9yXkMQgr41Ki8dX5Z6ix3GZvBeL95jDY1A/3DyCCwpJ8ThFiJ6Zi52AsAaLs6gacN7GEjFtr
 1BfxZHAsblm4YWl0XXUHb5TROzBC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgUxfOdjZ5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/FhZ
 MbHLp39USZDYUiC8NZQb71FuVPM7npnrV4/uLihl0j3uVZgTCP9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WnChQ7BbU7dAhQRVBiXMCeliCiXrLbSuaQMD17WqC5LHJIU9ANopm5Yc+Rp
 iHnABMJlgui7ZAFQC3TAk1ehHrUdc4XhRoG0eYEYj5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:zsu9QKhl4AVunB7mM3+OUvAUJHBQX5913DAbv31ZSRFFG/Fw9v
 re6cjzsCWe5gr5N0tBpTn+Atj9fZqxz/9ICOoqTMSftXfdyQmVxehZhOOJ/9SKIVycygcy79
 YET0B0YOeAcmST5azBjDVReLwbr+VuP8qT6Nv2/jNVaUVPVokl1gF+D2+gYz9LrMstP+tGKH
 JZjPA31wZJvB4sH7WG7wI+Loz+juyOrovifRkFQzY/8WC1/EqVwY+/KQGcwhAdFxhSwbIumF
 K17jDR1+GYqvSmzR2Z8GfW4/1t6bzc4+oGPtWIls8WbhPzjQqyDb4RPYGqjXQOueSy71Rvqv
 ngyi1QR/hb2jfqZ2Sophmo4QX6zzo0zHfnxTaj8ADeiP28fis+F81Cwb1UaQHY7U1IhqAH7J
 52
X-Talos-CUID: =?us-ascii?q?9a23=3AKtjeeWl1jFrA1oVF4In2LvWe3O7XOUWEyn6MEXS?=
 =?us-ascii?q?hM0c3d5iyGF+a1f1uqfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AozLyLA+/0hN9wyezm/1phjWQf5kz/7qQS2UwqMQ?=
 =?us-ascii?q?5udaKZQM3BDKxsB3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="113059650"
Date: Tue, 13 Jun 2023 17:10:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5/5] libxl: drop dead assignment to transaction variable
 from libxl__domain_make()
Message-ID: <4cc76b26-c1e3-45d8-b1fa-f1c69046f510@perard>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <4fcbe916-890a-1dfc-86a8-eef2bafb2801@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4fcbe916-890a-1dfc-86a8-eef2bafb2801@suse.com>

On Mon, Jun 12, 2023 at 01:47:50PM +0200, Jan Beulich wrote:
> "t" is written first thing at the "retry_transaction" label.
> 
> Coverity ID: 1532321
> Fixes: 1057300109ea ("libxl: fix error handling (xenstore transaction leak) in libxl__domain_make")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

