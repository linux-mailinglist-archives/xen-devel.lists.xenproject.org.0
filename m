Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A1464C75
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235899.409181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNas-00084n-U8; Wed, 01 Dec 2021 11:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235899.409181; Wed, 01 Dec 2021 11:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNas-0007zF-Q9; Wed, 01 Dec 2021 11:16:10 +0000
Received: by outflank-mailman (input) for mailman id 235899;
 Wed, 01 Dec 2021 11:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNZg=QS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1msNar-0007wa-Nz
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:16:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86ba35b6-5296-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 12:05:01 +0100 (CET)
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
X-Inumbo-ID: 86ba35b6-5296-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638357366;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=3RCqUydL4JguIyYAIyTL4Uj9P2EGIVPmIXBDM4AOIhI=;
  b=hWgavtj9+EnJv+lymB7yCPkXEE59NOvofX+/p9930FeGLC9XRqkGzjsI
   obLJ9H7Ro2ZqYMaUiLMMIceBhMhCIubHyDsHL0QsqGz/mMtCFarjDZm6z
   fHQly8Ua9KSfWIbmAfi/KIrDogHJG1yvfc7CGUby8LGm8rqpu4h8a+/vH
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /iOujOQrYzOQvVZDdP1AztiG/29ayHSdM+M6iiKJip8IWqsLwR4ZduRw3k9qBacCqTH37oOw4l
 mhaXiyZsMk4dzNWVDn/4B6uxOl42jqMQ8LjxE0ZmDrjyzdz5jxz7/Z7dHqkViJBHdqb5gJZS7Y
 U6dtdzXclou84AomwRJCJumszN+mI0nmTm2E/yzXo0dGpvN4ilNQzlWWA1/Hz/i+qOR2D4ivxu
 cYjS1vSVERo2DDskG26MTAOyk+O/jNHa4diZyfPxCA8UWcBoLhTuQv80eaj74bYOc5Ey+EFd7/
 vj2XTT5jP1j3uigNnPbWUiAA
X-SBRS: 5.1
X-MesageID: 58511687
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MmornKB0tf8HlxVW//Lkw5YqxClBgxIJ4kV8jS/XYbTApDkk0DUHz
 2UfC2DUOv7bN2b9e9h0a9m29xxTvZeGx981QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Us7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1BvZofVO0
 tN0upGQeAQLN4H3uOkjXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGpp354eQp4yY
 eIQayVGYjeYPiQMM0pHB4A4o/uonkTgJmgwRFW9+vNsvjm7IBZK+LT1K9/UZtyiTN1YhFqFv
 XnB+3nlAxYcL5qUzj/t2n6jiuLAhyrTRJMZFLr+8OVjxlKU2AQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEBbYG5/TeM8svY5SBwb1
 X2As+jJCAJg5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A71JZTj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBYy6ByD8hUVPlhcRBhps1WR9lFAN7fbVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusQDZir1Nf8qP9/sYyjP8UQGPY++PhwzRoATCqWdiSfdpH0+DaJu9z6FfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5ANK7PYfFM5QDpJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:PMOlUa3P/ux+WCoHEbVAYAqjBKQkLtp133Aq2lEZdPRUGvb3qy
 nOpoV96faaslYssR0b9exoW5PwJU80l6QFgrX5VI3KNGKN1VdARLsSiLcKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.87,278,1631592000"; 
   d="scan'208";a="58511687"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 0/2] xsm: Further fixes
Date: Wed, 1 Dec 2021 11:15:53 +0000
Message-ID: <20211201111555.16408-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Andrew Cooper (2):
  xsm: Switch xsm_ops to __alt_call_maybe_initdata
  xsm: Drop extern of non-existent variable

 xen/include/xsm/xsm.h | 2 --
 xen/xsm/xsm_core.c    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.11.0


