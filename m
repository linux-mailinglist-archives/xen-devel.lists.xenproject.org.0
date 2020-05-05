Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CD1C57AE
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:00:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVy76-00007b-7H; Tue, 05 May 2020 14:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=56xU=6T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jVy75-00007V-KP
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 13:59:59 +0000
X-Inumbo-ID: b4ca7800-8ed8-11ea-b9cf-bc764e2007e4
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4ca7800-8ed8-11ea-b9cf-bc764e2007e4;
 Tue, 05 May 2020 13:59:59 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w2so1858624edx.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=O9OCBMkBxpYV7nwYvW253+iHNM16Xw+0gCVniK4rZ0A=;
 b=Quia9v/xRYgVnTDwV1BgYeICL+6UIoPhizH6hPPF4DkNcTtvHJl5Ty9UDZWF1Wj0AF
 FS3KgmAq6KlzYeXdYQ3OA++1Q4I0seBrL8agnF3UoSJLLSKmOeC9DQqvrhlT51K/e1v3
 xgF6OTVucZjrirHv5xQwRe0P3H9l5KoUo+hkDyXcUw1NGQ9dQeGxOR/N8raXLcTN0s5g
 wPBq8vTmzTMQayESPKqeEdcHb8eiqjxUByqyltjrifpPut7NUtSbThKGFcm/cKMcc+tQ
 RrGmgDnKGOp8PJc1PEzW2mY7Ht46+7iAqPL4RGQCqPpT46h6N8Zf18TpGw7OoG96GT/c
 phFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=O9OCBMkBxpYV7nwYvW253+iHNM16Xw+0gCVniK4rZ0A=;
 b=Dly9hIY12hAjM1B9MrKYrdPcmNJfLHPK4kjY16nuBjabx7fPz0Q0DI7pyN0VILhaKT
 +e4KkkV07DKso2aJkcmPEyiLOMYm7n38KGqaDiRarkcVuEmKGVHy732HoBGl7mobylSp
 OAFqx7pecCn93v+TsNRgAhQlhdJ0ney7L/opfaIywyJsGzRmoML0vtQphEJa/pxPG39A
 UY+4nbAlj8/U0SGjaaFIUgcstnOrmMq0nzZg2hKR/jWXSYdfHJcjQ5LxX68weAdTYjF0
 9w4iQhHGCisuxei3HgJRn8/Iq6mXyYMt1IebFbY/rHl2gef2MO161CHDsCPHBIWy3XxE
 ai6A==
X-Gm-Message-State: AGi0PuacaDDE1Z+2DCHw+2UINFjDXJuZ+hi4TiaMTCtfhe8u5R0PboJn
 tQbtwNhYXilRQvAIzMfkFrQ=
X-Google-Smtp-Source: APiQypKMaCbhuhWKhU6qOX1gyF4ylKwmgItCJ0Vgnfw2kOhlHOT2eRuqxGQbmSbMf9zCagFUVC55Eg==
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr2756750edp.283.1588687198204; 
 Tue, 05 May 2020 06:59:58 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id n7sm280474edt.69.2020.05.05.06.59.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 06:59:57 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Markus Armbruster'" <armbru@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20200505101908.6207-1-armbru@redhat.com>
 <20200505101908.6207-3-armbru@redhat.com>
In-Reply-To: <20200505101908.6207-3-armbru@redhat.com>
Subject: RE: [PATCH v2 02/10] xen: Fix and improve handling of device_add
 usb-host errors
Date: Tue, 5 May 2020 14:59:56 +0100
Message-ID: <004001d622e5$75fd2d70$61f78850$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQD2kCtjJmTvNkmzRgy8FtMMvttLfQNDV1uLqj6PYxA=
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
Cc: 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Gerd Hoffmann' <kraxel@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: 05 May 2020 11:19
> To: qemu-devel@nongnu.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul
> Durrant <paul@xen.org>; Gerd Hoffmann <kraxel@redhat.com>; xen-devel@lists.xenproject.org
> Subject: [PATCH v2 02/10] xen: Fix and improve handling of device_add usb-host errors
> 
> usbback_portid_add() leaks the error when qdev_device_add() fails.
> Fix that.  While there, use the error to improve the error message.
> 
> The qemu_opts_from_qdict() similarly leaks on failure.  But any
> failure there is a programming error.  Pass &error_abort.
> 
> Fixes: 816ac92ef769f9ffc534e49a1bb6177bddce7aa2
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>


