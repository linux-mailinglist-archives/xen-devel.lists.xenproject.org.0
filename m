Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0EA1A2468
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 16:57:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMC9A-0006mM-Uo; Wed, 08 Apr 2020 14:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M0gu=5Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jMC99-0006mD-P6
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 14:57:43 +0000
X-Inumbo-ID: 4c70981e-79a9-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x52c.google.com (unknown [2a00:1450:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c70981e-79a9-11ea-9e09-bc764e2007e4;
 Wed, 08 Apr 2020 14:57:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id cf14so8851489edb.13
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=iU9yuaCYEfkEruhBpR6BbCuUDHAUpY1V9lTjdRCjxp4=;
 b=quGFHcBOXAeiXqefIaUP3hW0kMAyU9VoW30fxwynsKKHXirq7M9FF1pgze28xA5TLO
 uiMZJjsLEg4JxbHqrOe0ruvljZLbQyCJrPBLIibGoDq7j0oo13Z7XDirf2JDupPu80fy
 xP6uBygZIshl2Pt5Q3b74dphBCaPCYuP14L/nne6qveKNME/0Of75UdLhvSxX2U8rMZb
 D/cosQBWZgYazJdjgUS1HSSX5D7EMtRfQRyQkergTJqSpWE/FlzauSz7OeEdTew8IosS
 IDYzOouU5yKcUW+A5+8uDo/w8HYK5e37uLrzT9J9w8+NyZtm/Xp9c3Eaw13SY3ML20gA
 7nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=iU9yuaCYEfkEruhBpR6BbCuUDHAUpY1V9lTjdRCjxp4=;
 b=ly7dR1DxBPGtFaxQWlLTHzQjlC/xvzc4nJc3manF/akDRLENBO4hYE01ZumZUQJ+lo
 QRCLCHbXOGr8wpzqs6NUILLl90sBboyzYsuRo9vySOxj/ZE32V2K3eoT2ksI++wMjj5Q
 wHSKpdDWO1KjHiT/P2LJLgCu6VGu0Y/RM3E3gBul6UX6WfX2Mpj7PdcDJsFESzsfc0lr
 +ts8upion7fhnktAhpLRPqaDyFv17SCGX8b2bLfeNsusOdbPRknE0vENuUBuJ70Avy7f
 OLWD1QxmzEJa+gAtQ6pQKppQxUym8dj9ghHowHaxuCDaWmQxMD3wElWopb/54RBT6D++
 hNuw==
X-Gm-Message-State: AGi0PubAUankk9TjSsRa8zAkAYNrdjJ4JYozvUYaAxajWM580ZEfYWy3
 dSDjge7XztrZlSIk2JSijjNF4lngkQY=
X-Google-Smtp-Source: APiQypLRzwKJfYaMrc0+ovdIMO40fHh5F2dS5HTJYjip3Ql+wp0ZaGlLdLOXU6AxTYshW0F5IvFSaA==
X-Received: by 2002:a05:6402:74c:: with SMTP id
 p12mr7011533edy.138.1586357862398; 
 Wed, 08 Apr 2020 07:57:42 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id f12sm2926999edw.42.2020.04.08.07.57.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 07:57:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Maximilian Heyne'" <mheyne@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20200313123316.122003-1-mheyne@amazon.de>
 <20200313123316.122003-3-mheyne@amazon.de>
In-Reply-To: <20200313123316.122003-3-mheyne@amazon.de>
Subject: RE: [PATCH 2/3] Add exit notifiers.
Date: Wed, 8 Apr 2020 15:57:40 +0100
Message-ID: <004d01d60db6$0dab56f0$290204d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGvBAjA7hxOW9V3ZNauiodGQFqJFQFuc8TGqLHwPvA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Maximilian Heyne <mheyne@amazon.de>
> Sent: 13 March 2020 12:33
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH 2/3] Add exit notifiers.
> 
> From: Gerd Hoffmann <kraxel@redhat.com>
> 
> Hook up any cleanup work which needs to be done here.  Advantages over
> using atexit(3):
> 
>   (1) You get passed in a pointer to the notifier.  If you embed that
>       into your state struct you can use container_of() to get get your
>       state info.
>   (2) You can unregister, say when un-plugging a device.
> 
> [ v2: move code out of #ifndef _WIN32 ]
> 
> Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> (cherry picked from commit fd42deeb4cb42f90084046e3ebdb4383953195e3)
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>

Reviewed-by: Paul Durrant <paul@xen.org>


