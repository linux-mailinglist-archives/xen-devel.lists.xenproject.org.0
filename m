Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA01BC167
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRJk-0007DC-3J; Tue, 28 Apr 2020 14:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTRJj-0007D7-0T
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:34:35 +0000
X-Inumbo-ID: 60fe42fe-895d-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60fe42fe-895d-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 14:34:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d15so23291738wrx.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=F/0k6PJTNvTws5L0YkLQ8tz0zw1BoEzEH61WEN+YUXY=;
 b=WtN12I4JJt6raKYhua4fiZBL08xGq/s/hpCv6pu7OvdMoXU84aTm7MYeLs9Dc3haEI
 Jdum/U5LZuNldzd4fF8AOeTb06w9DtBmgTJN3RGiR26umD7/YqW+Vc4Urpto3xynj8Z1
 TZKD060inTnDwVHlT+Got5ps51T2Qn+PwwPhcG84rnKn/lRf5Oe3c8bWR+6JTaFRo4LJ
 1iZ9W10EFU6iY+9U20MbUYusP09If65VdQjuj1Lnh2SWTmqaYtI+ZdPMQrbqFZuX5gxy
 dTbT3aRSM2J3nJzysGeq85YF2/+JuHhTwkjUExUhSsH/a0Xl4AvXbppAxv6ry6UwrH0I
 W3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=F/0k6PJTNvTws5L0YkLQ8tz0zw1BoEzEH61WEN+YUXY=;
 b=Lwpm0ur2MzXVOMhecd9CtjWlJkmB3HKC+L/Hv1VzHA3v/fihfe9ggANuPeqlaFKFzx
 Q0vd0+0w8ZIYD2u8vhGSOqw3kKeFexcfsSa+JzrrQbdrNIQZv/+r/8qw8XlLKONtmNfp
 zRtf+9F0SPFoMg7FRFpOsTsLSTu4k3uuH7to9IOJ/8jNswO4pLhL/L1VZZiWRm/OCWYN
 Vve9zXt8LWQY7Q8jLR66GZksxo+TBFX0xva5BobRoMssVkHEqsdsatNEX01T+7xTX/YA
 6Wgo3P7JnITUUNZAHHAQatMAy4o1ISYHcflcJBRUkzXaxIzAeGacmkexwyEHYX5DPejn
 QOqw==
X-Gm-Message-State: AGi0PuY/tJLA6VY4y5qwNlTMCkb9wnZAOmFRfm90tYsCiCIE1Lft6mPv
 zMk2CuuTkskdr4Hv6snIyjQ=
X-Google-Smtp-Source: APiQypLTUoIXkwlKc1eanndW+mEC1uU52R4qcSRH5XSGNqOEnuPaO6YcVE5oqpCdXCNfrv8IJr1M9w==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr32738201wrw.406.1588084473763; 
 Tue, 28 Apr 2020 07:34:33 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id c83sm3768848wmd.23.2020.04.28.07.34.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 07:34:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <75d1c852-e6ea-d3f3-3624-c77fb678412a@suse.com>
In-Reply-To: <75d1c852-e6ea-d3f3-3624-c77fb678412a@suse.com>
Subject: RE: [PATCH] PCI: drop a redundant variable from pci_add_device()
Date: Tue, 28 Apr 2020 15:34:31 +0100
Message-ID: <000e01d61d6a$22295000$667bf000$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKG/isN7hcHCscEKMpqEFl4lUzD96cs1uzw
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

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 28 April 2020 14:00
> To: xen-devel@lists.xenproject.org
> Cc: Paul Durrant <paul@xen.org>
> Subject: [PATCH] PCI: drop a redundant variable from pci_add_device()
> 
> Surrounding code already uses the available alternative, after all.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>


