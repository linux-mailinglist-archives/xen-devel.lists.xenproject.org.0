Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646F278545
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 12:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLl7s-00058k-Id; Fri, 25 Sep 2020 10:38:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4q2y=DC=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLl7q-00058f-Ih
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 10:38:50 +0000
X-Inumbo-ID: 5cc16fbe-11a0-4fca-87c5-ff03db4ba8c6
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cc16fbe-11a0-4fca-87c5-ff03db4ba8c6;
 Fri, 25 Sep 2020 10:38:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t10so3085832wrv.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2020 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=R9fvDIbhyRfM2lABTONP4f5n5PfaAnDmNWcNMtfO/HE=;
 b=gCAU5U0tS9Bhs1wCqBngxEOhT/SvvoJVt+IWIjS8SKVgJzaSQSGq+qFpeo1iDPtDFH
 y9Auyls0/oBXgO5HSJaFefjaCq+X3nDlXWfjDB2dtlaBA3cYH7QbbUe5lMci9TaF5wag
 Fw5dzRTRMdpWW5w5F0beqRY5unbjr3pblebkeA2tFPwP34rT5AWz0KW8Z8BVm8VkMiun
 Qp3oF2unW92rgiM/oveTgm2hkx8v5/STFgcfAQBVtCTFLW6wzK9PZarZd9shRgRntBui
 haoblGP3+Gz0hfHdKDBG0WM9W8HRtPr6tMHRhZXwFzbGeLzqNl2dzhKMBcwK0P6f8b6L
 091w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=R9fvDIbhyRfM2lABTONP4f5n5PfaAnDmNWcNMtfO/HE=;
 b=BAsvsXtigPV5tM0KQXnx0wZs3WS7AMGNbY1Qy0IUHgPZEtan/z2lB3Xc7TuzhTgJIh
 0/VthiPU6cT2CxCKEC7wr/vsdexWSkW+pAc1lOHl740oIqILZi1cjhYbd1/QhQDqNamx
 c0oqb0+BwJmUjXJm9t70Gd7KhUZkx2omgQuwqaH7nEl41em5jhFN4y6SUlOq8srUmqV5
 zL1lyU07uuSfF9SANF3i5BP5wWlzT7dRVqKsLCDCxQyJQPQtRSV9C/8lXrC3N3dEz5xL
 XP6bSvtqbExyxHHsdwIsD0v+ynlJNMuLIZQGTkmfNCk8Q7mwJQE8xBoCOJkvgJRugbvk
 oOzw==
X-Gm-Message-State: AOAM530E/BR/3f2YPbEDOxMMPNkl3EMvVnReMrdwY26BVu/kaUtLpmEi
 6XhqAcW46xTYQajWaT38fTw=
X-Google-Smtp-Source: ABdhPJzWvJoLHw2vkbE1z4xC8Oz9F91KwzZqjAeU2OL7IO5DaQrHtU8fWkl0ReAGxJe0bksPiEKlWA==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr4000298wru.363.1601030328909; 
 Fri, 25 Sep 2020 03:38:48 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id d19sm2350787wmd.0.2020.09.25.03.38.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 03:38:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>
References: <20200915141007.25965-1-paul@xen.org>
In-Reply-To: <20200915141007.25965-1-paul@xen.org>
Subject: RE: [PATCH v2 0/2] fix 'xl block-detach'
Date: Fri, 25 Sep 2020 11:38:47 +0100
Message-ID: <001001d69328$0d2790c0$2776b240$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJeoUus0OdpJ4MR5bCYHg0A3ED8p6hpDT0w
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

Ping? AFAICT this series is fully acked. Can it be committed soon?

  Paul

> -----Original Message-----
> From: Paul Durrant <paul@xen.org>
> Sent: 15 September 2020 15:10
> To: xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>
> Subject: [PATCH v2 0/2] fix 'xl block-detach'
> 
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This series makes it behave as the documentation states it should
> 
> Paul Durrant (2):
>   libxl: provide a mechanism to define a device 'safe remove'
>     function...
>   xl: implement documented '--force' option for block-detach
> 
>  docs/man/xl.1.pod.in         |  4 ++--
>  tools/libxl/libxl.h          | 33 +++++++++++++++++++++++++--------
>  tools/libxl/libxl_device.c   |  9 +++++----
>  tools/libxl/libxl_disk.c     |  4 +++-
>  tools/libxl/libxl_domain.c   |  2 +-
>  tools/libxl/libxl_internal.h | 30 +++++++++++++++++++++++-------
>  tools/xl/xl_block.c          | 21 ++++++++++++++++-----
>  tools/xl/xl_cmdtable.c       |  3 ++-
>  8 files changed, 77 insertions(+), 29 deletions(-)
> 
> --
> 2.20.1



