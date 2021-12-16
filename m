Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5D476AB5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 07:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247735.427191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxkii-0005PL-Qt; Thu, 16 Dec 2021 06:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247735.427191; Thu, 16 Dec 2021 06:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxkii-0005NX-NY; Thu, 16 Dec 2021 06:58:28 +0000
Received: by outflank-mailman (input) for mailman id 247735;
 Thu, 16 Dec 2021 06:58:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SM1R=RB=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1mxkih-0005NR-FR
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 06:58:27 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91027f4e-5e3d-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 07:58:26 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id t18so42230131wrg.11
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 22:58:26 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:267b:1200:18af:bb55:aabf:94a8])
 by smtp.gmail.com with ESMTPSA id p12sm4718037wrr.10.2021.12.15.22.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 22:58:25 -0800 (PST)
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
X-Inumbo-ID: 91027f4e-5e3d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=XpWcs0XbMlH4VQ6hw7+xSPVWX4q7iEBGmSQA5LzJK08=;
        b=KpLR7KdZfjR1YsZpZau7nel5Iov1BHZulmr50C0qi8+Nbz1/3tGosxKZWpnCjfDjJP
         cHrU29k1qR4/+2sv8mtbR0yh7GguxoRObfc8GfFRIdt0tlFlCe/H43MIO/9llMIQZR4a
         P/7cJFbA3QbWtEOfz9gQfoOROKeDZGs6cR/gCW5eRWCHkf6uMHyOQ754hi3SulDtn0zn
         8WHRgIar51da3O5T/pAZHFfYoMPu87tPxSTDnnDnLFAv3jliGB1etnUgN+1F5dLPv/hO
         WwgV/y7yAU7Pg2q3sziYrKd0g9/nbDkI+l3iRfHsoiSFVeShEEFi20gzh+PgEpx3pDye
         UEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XpWcs0XbMlH4VQ6hw7+xSPVWX4q7iEBGmSQA5LzJK08=;
        b=TTScIW5+qViHXS8gHYzX3iHkDaGWT3nR8s5vUHx27UeQFaGqPD4d6iizqqDtFSa71R
         oQaPqaXGQi26k61PrfqprCczytIXd3nNg++PIbZ2P+EFN7WJlbedSgQyWR0+QDXWNCt3
         9Tsop8jmLVw3w6WaWzbN58Z7NRzKhQBJ15Y1ungZwCe/rX7k9+iEKsbwSo6v0QaRyZro
         uCY5yglHU3Jy1h0Z0j+wRSbGWb4BlDUokzfjUJ2o3z2BBLCFiUOhgHuAWv5gSEeuugck
         JqI1qPaj6WGS8QQeoA+Ezl51RNskK6OdO5gVOkNi/Z5JiNpZZH7Wu2QYWT23JsmYQA/7
         DSig==
X-Gm-Message-State: AOAM530iDzXKWuuSKGxcXHpzt/l0TI3rRfVO2pq0F3rbvH1JPVhpa3/E
	LU1KU2k50jBlKfUK8uMlNCo=
X-Google-Smtp-Source: ABdhPJxp3ZXrPoJwzqsVZMOfkSKa2WxiAB5H8OKvSTfGLSvtRhguEnwUBykdSnxasAlAEmi4KJ+XCA==
X-Received: by 2002:adf:97c2:: with SMTP id t2mr7512331wrb.577.1639637905795;
        Wed, 15 Dec 2021 22:58:25 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org
Cc: Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: remove typo from XEN PVUSB DRIVER section
Date: Thu, 16 Dec 2021 07:55:47 +0100
Message-Id: <20211216065547.18619-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit a92548f90fa6 ("xen: add Xen pvUSB maintainer") adds the new XEN
PVUSB DRIVER section, but one file entry contains an obvious typo.

Fortunately, ./scripts/get_maintainer.pl --self-test=patterns warns:

  warning: no file matches    F:    divers/usb/host/xen*

Remove this obvious typo.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on next-20211215

Juergen, please ack.

Greg, please pick this minor clean-up on top of the commit above.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97215d89df4e..a5df6e1219b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21007,7 +21007,7 @@ M:	Juergen Gross <jgross@suse.com>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
 L:	linux-usb@vger.kernel.org
 S:	Supported
-F:	divers/usb/host/xen*
+F:	drivers/usb/host/xen*
 F:	include/xen/interface/io/usbif.h
 
 XEN SOUND FRONTEND DRIVER
-- 
2.17.1


