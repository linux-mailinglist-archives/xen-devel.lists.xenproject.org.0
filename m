Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B2681855
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487122.754610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYZ0-0007N7-2f; Mon, 30 Jan 2023 18:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487122.754610; Mon, 30 Jan 2023 18:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYYz-0007Kt-Vh; Mon, 30 Jan 2023 18:07:29 +0000
Received: by outflank-mailman (input) for mailman id 487122;
 Mon, 30 Jan 2023 18:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYYy-0007Kf-Hh
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:07:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f33f737e-a0c8-11ed-93eb-7b0ecb3c1525;
 Mon, 30 Jan 2023 19:07:26 +0100 (CET)
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
X-Inumbo-ID: f33f737e-a0c8-11ed-93eb-7b0ecb3c1525
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675102046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QJxaharSK/Jo0woOff0VVvBI87ddnh6E/mwN+YlcpFk=;
  b=ZKIxwqJ00XCaVlBEgSlNV8859tDSjip/XgEvbMynvLCB6Vbg/kJX4ZA5
   K3TALbyp9QKWprDhSb6xTt+N8PtUh1+5FCcSpZX2xIghs96z+GOY0GaO9
   0umqGFPic1BIW75O1l7Y2UOcjsVwznVRLsIQ2DTRaDK7SZjKyn+JKe/FY
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97314012
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Gpr6zqgn+A/xDb21643p71APX161VhAKZh0ujC45NGQN5FlHY01je
 htvXGrTa6zcYjH2e9FyO9y29RgFvsXVyYVjS1Y/rHtkF34b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QSGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQjIxESZBmOltvs+6KACbEy3u8YNtLCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27J+
 TmfozygWHn2MvSEwmqc1Vvyg9TMog3KVaQWD5+E5tNT1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4DOkS+AyLjK3O7G6xBGceSSVaQMc7r8JwTjsvv
 neFls3kLSZiu7qUTTSa7Lj8hTqqNDIcN2MqeS4ORgxD6N7myLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7tsUqyK+y8EH+2Qm8nduREFYe3R/Mdzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fK7fTgGfqqOBjarXnSWXFLvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF0m3hnmjqDGciqkHxLNIZyg1bMGd843KamNLhlvMtoXi2Km
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8qRqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMSk4MOq0DMsmxZ/5VAR1VWuVN7EYSd7HxM8im1EfJ9HLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:76BNR6jYcd0zyARg3aVGCWWqs3BQXwd23DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICPoqTMuftWjdySCVxeRZg7cKrAeQYhEWmtQttp
 uINpIOcuEYbmIKx/oSgjPIa+rIqePvmMvD5IfjJjVWPHpXgspbnmNE43OgYytLrX59dP0E/f
 Snl6h6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyyIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh7LD3vXklUKvoLhiKqrzPI9
 MeSf00I8wmNW9yWkqp/VWHBubcGUjbUC32BHTq8fblrAS+1EoJsXfwgvZv0UsoxdYFUJ9D6P
 3DMqN00J9zbuJ+V9MkOM4xBfKtDGrDWBTNN3/XB2/GOuUoB1LhwqSHuYncwomRCcY1JV8J6c
 /8eUIdumgod030D8qSmJVN7xDWWW24GS/g08dE+vFCy8vBrZfQQFm+oWoV4rydiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+Aju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2IMlb9EikVnLxnRCUUXLwfU70+452DcHhjqEu4ZlIMpcJvhkeiFy/6M3OITpesrYudE
 87O7/jmrPTnxjCwY8J1RQaBvNwNDcn3Fy7aQI6meYjCTKFTYo+
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="97314012"
Date: Mon, 30 Jan 2023 18:07:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 3/6] tools: Introduce a non-truncating
 xc_xenver_capabilities()
Message-ID: <Y9gHUZ0acOr17ESM@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-4-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:33PM +0000, Andrew Cooper wrote:
> Update libxl and the ocaml stubs to match.  No API/ABI change in either.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,


-- 
Anthony PERARD

