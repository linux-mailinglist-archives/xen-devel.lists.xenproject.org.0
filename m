Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43394AC83C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 19:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267353.461092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH8SV-0001R6-M9; Mon, 07 Feb 2022 18:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267353.461092; Mon, 07 Feb 2022 18:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH8SV-0001Oh-J6; Mon, 07 Feb 2022 18:09:51 +0000
Received: by outflank-mailman (input) for mailman id 267353;
 Mon, 07 Feb 2022 18:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL18=SW=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nH8ST-0001OZ-Pl
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 18:09:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 218376f4-8841-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 19:09:48 +0100 (CET)
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
X-Inumbo-ID: 218376f4-8841-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644257387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkHwRzhltIRkcT9Wbarwt28GgDFnfnuxzN3r2dxedDM=;
  b=D1tvw46KTOX9d4pYxf6Tydp4wWSRdM8W8gF7OZdgIqwMHPq8mTiKBGrF
   HmItmVU8BBjo7z25OB58YNtnx8R/e5qplpmJSUYo/kNM092LhLSBkP62C
   AhQmrdZSHhCmdggSlOFPeArCx/g900jweA3P/+hDu78khFrMrpp3Ds6mI
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ejr2Jbima21KmU9P6HKhbLrC3Aafop39/0JgiI9JokD7gxiqrFjzP3IYfBjA16r5b8EKJ18gi+
 tKr1XDge/mwpzodF64Qrx7TDFfj2hAVQTG0IwGQGLFjgu9y7S3cGk0XXBzEwhK6uQMgGdQMp8s
 amtI/Gfoxv9M2fdPtqPasX3EjL478PDy6lL17/2bruZTx/aDXa5gtUh1Wq/ly89WxIwfUqs6PD
 oQRqOoPYX19mZnBppOFWmWvJVUV6XkWoDp8Eo/ZssPlDHhpqeJ60w8kGEaq8En0uvieghj4lwR
 1ABDm9uyRBnQn4421+ah3qlk
X-SBRS: 5.1
X-MesageID: 63669087
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XIWA7qNraNbmpxvvrR1ekMFynXyQoLVcMsEvi/4bfWQNrUolhj1Sn
 TEYXWmCOPyLMGOkeo0jO4+w8RgGvZLdm4c2TQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o8w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYow7TgMlx5
 NxfjL2pRjUxfaf0pccYSDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgmxu2JEWTam2i
 8wxSyRqUyTpIEZ2NFoKKqJvscz42nXtSmgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzRAAweNdGZ4SqI9DSrnOCntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTifu2kEmlQPpEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwAud3AbZQMNXzIk+tbRuMI5ti/sS81KRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zsK4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yP5FWyzyGsnTKuMDirjUWW4C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFPerXg3Ox/KhjuFfK0QfUYXY
 8bzTCpRJSxCVfQPIMSeG4/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkbbio8JY/XrDYfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4ACj3C2cd1TWNSwLhXGGdc8XkE/X9BcEZT6As0XPq671hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:C6jL4KBDoZuY0n3lHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63669087"
Date: Mon, 7 Feb 2022 18:09:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/5] tools: remove include/xen-external directory
Message-ID: <YgFgZADfaoLNor4T@perard.uk.xensource.com>
References: <20220207064147.9585-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220207064147.9585-1-jgross@suse.com>

On Mon, Feb 07, 2022 at 07:41:42AM +0100, Juergen Gross wrote:
> The tools/include/xen-external directory contains a header file from
> FreeBSD used to generate Xen header files. This series is replacing the
> complete directory by a single header with the same semantics.
> 
> Changes in V2:
> - remove stale comment in patch 1

Just need to fix the build now, otherwise, the series looks fine:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/464803007
^ xentoolcore conversion seems unfinished.

Thanks,

-- 
Anthony PERARD

