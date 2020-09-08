Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB026104B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 12:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFbFA-000161-SQ; Tue, 08 Sep 2020 10:52:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vaX=CR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kFbF9-00015t-EN
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 10:52:55 +0000
X-Inumbo-ID: 9babcc22-dcdd-4436-81c7-abcad0d2662f
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9babcc22-dcdd-4436-81c7-abcad0d2662f;
 Tue, 08 Sep 2020 10:52:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id y15so4059733wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rl5tdoe6QMaT3XgCpYTDvbssXs+Oe77twgwn4rnFS2g=;
 b=k9Erlwhw4CQYKr8pBgK2fvGiRbF1aDcI+HOeBR7F4b6euW+tBkePQhpIoVDfZsheUt
 xuVhWiNhZlt//bk4FhiURblNFGZvkn1ZmSvjYilWZTLAwNkwReOsC54bSUtRsuTpqe3G
 gKd8acob2Nr2AuuvSJpT+B3vK6nG+7galXAbym/kGJhjTHg0nra4u4soA49ZXaqlJ5AS
 1J6uMeTX3iw1Mn2CGJpBFgAK5LcIS4vtDU6hPGh+HywXmNxalHjpAOFH/ZGq8Fk3Equ0
 bYit/PfkzFgTDysQa6IMPl5+ZbUYr6Wh8SAGxkrv3/ozRmdt5cQCB9LL+oW62yHjw1Ia
 JCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=rl5tdoe6QMaT3XgCpYTDvbssXs+Oe77twgwn4rnFS2g=;
 b=jT5aZ6Vq82v4+HIaBnylxvuU0eEx04WXtP+CSnUf2D7S/K2J8uVfei3wyWI+iwJzd3
 dJT1n1EXRby152mVHo2KxiZY92Wowjzq4H2fbJqR5Mdr0eD3DqlmUrf7uso28fvHGojr
 u3ly3O5BL5zeXWnv4fmSppd20VUnfvQar7RBCPE9KTpcnQ/CgPPZyRDavir6AUrlZW35
 BiikToS0ILNA1NK4TH3VKljOdWiSRLXtTG4jSiNTkpya69beq/+eWyWD/XiP3WyejuL6
 40HHSixCH3eIenh+2eldqvluxU7LIXuWKB329ovW24juLfMc3zdZnkOT45iKb612lkT3
 YZ0g==
X-Gm-Message-State: AOAM532dnLnBKm4bPfkngm/WcVuJJ/QU5aDnxlfUpvWn957ydUtVEooG
 VXLpKlAxCYPw9h6AN9WyKG8=
X-Google-Smtp-Source: ABdhPJzZV3KwX6RxAKbC9b+qZ9TrsN730FamQlNYoDCDuGB4GE2+R6GhGS79Q/omhDxzrkG9AyhwQg==
X-Received: by 2002:a1c:105:: with SMTP id 5mr4005313wmb.83.1599562373888;
 Tue, 08 Sep 2020 03:52:53 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:8d91:60a7:66fc:bffd])
 by smtp.gmail.com with ESMTPSA id q12sm33162489wrp.17.2020.09.08.03.52.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 03:52:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <wei.liu@kernel.org>, "'Ian Jackson'" <iwj@xenproject.org>,
 "'Anthony PERARD'" <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
References: <20200903100537.1337-1-paul@xen.org>
In-Reply-To: <20200903100537.1337-1-paul@xen.org>
Subject: RE: [PATCH 0/2] fix 'xl block-detach'
Date: Tue, 8 Sep 2020 11:52:48 +0100
Message-ID: <004901d685ce$3179a060$946ce120$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHGz3syrbMjORisLydTb23Y+s+HEal9/Nkg
Content-Language: en-gb
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping? Can I get a toolstack maintainer opinion on this?

Thanks,

  Paul

> -----Original Message-----
> From: Paul Durrant <paul@xen.org>
> Sent: 03 September 2020 11:06
> To: xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>
> Subject: [PATCH 0/2] fix 'xl block-detach'
> 
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This series makes it behave as the documentation states it should
> 
> Paul Durrant (2):
>   xl: implement documented --force option for block-detach
>   libxl: do not automatically force detach of block devices
> 
>  docs/man/xl.1.pod.in       |  4 ++--
>  tools/libxl/libxl_device.c |  9 ++++++---
>  tools/xl/xl_block.c        | 21 ++++++++++++++++-----
>  tools/xl/xl_cmdtable.c     |  3 ++-
>  4 files changed, 26 insertions(+), 11 deletions(-)
> 
> --
> 2.20.1



