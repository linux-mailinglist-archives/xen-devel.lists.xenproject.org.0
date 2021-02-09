Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EF31579B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83409.155160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZUP-0004e4-N1; Tue, 09 Feb 2021 20:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83409.155160; Tue, 09 Feb 2021 20:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZUP-0004cd-Jk; Tue, 09 Feb 2021 20:20:01 +0000
Received: by outflank-mailman (input) for mailman id 83409;
 Tue, 09 Feb 2021 20:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l9ZUO-0004cY-4V
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:20:00 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fa19d0d-d469-4b36-907c-b0f15b4a9e1a;
 Tue, 09 Feb 2021 20:19:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v14so8038376wro.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 12:19:59 -0800 (PST)
Received: from CBGR90WXYV0 (host86-180-176-157.range86-180.btcentralplus.com.
 [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id 67sm6482784wmz.46.2021.02.09.12.19.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:19:57 -0800 (PST)
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
X-Inumbo-ID: 0fa19d0d-d469-4b36-907c-b0f15b4a9e1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=boj373LsOZqDTZQxKCZOAT4rKi/jpq+W1thHmB9t9BE=;
        b=ox8keUe/nKVd6aTwAnAgLTAsIjPwKRSUALrUo2LnA12YifZuRL3b6yVpBmlInYlndw
         U1JeomgrODpGUmGl4euVRP53hdJAIPchCGIDldHxyQtdP9cLRa0xkh1fBJpDLofgk6Eo
         HoDN0Zvs7Y77vXIMzw0QMeBdTzGo9hSKUijmhZ290RV4Dpp2DnXkM9tKQWGYAla3i+uE
         JHXybAatmvzECilv2gNGo1z4FxgV2XZ985ieyn6ilT/QEGzgAXg1qNWrHn+WmTEMzWLO
         iahb52k5kqNMtghBgjlo3F9esKpQPropamS4nw16Z1mj074X3S9EA3pXtJvfCWBCZpgq
         XKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=boj373LsOZqDTZQxKCZOAT4rKi/jpq+W1thHmB9t9BE=;
        b=RUiP8ztQF9sugrrmjIpisfYNc/gavq6PZtbvej5zBC22OzXSJqZDQZfq64iTkoIHBm
         g55L7DuteLJzkwsPP9QZNjHRM5psOZORS6LNMyeNWxPQ4buqkylL+jmuUbfmVR1X3neU
         abru30Zz3IgzkV8+BH8NRzzahKH/oTBQEA3Pc/sifExMbp1NlwgrsIkYNx2YTTVM+c1N
         yGbLvha42LKHFosD98q/0pIxfr8zVW4oSYL2ZmaSLBqDTh3mjrKRyPhgmJds70lB6zLL
         ssr46MC86wssk+kLrkQcOdEHKieiCLQ11eXniYa0qkcJkqbNNYEzknN7qSLktIgCCI93
         bCFw==
X-Gm-Message-State: AOAM5336OAk1R9kAvvx6fRf+x5q3jkBzVQocI1ZP/VkcQo3jvbkUV7/u
	6xoKOPzeG4Wdibc3zvww4+w=
X-Google-Smtp-Source: ABdhPJzxE9/711iBjJ6yVZgbY2CwJPa39YR4FYGKvguDFIZHH3dGIHKFbwYIOsJqJmUGfvuLcLPwfw==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr27128156wrm.277.1612901998446;
        Tue, 09 Feb 2021 12:19:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>,
	"'Julien Grall'" <jgrall@amazon.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20210209152816.15792-1-julien@xen.org> <20210209152816.15792-2-julien@xen.org>
In-Reply-To: <20210209152816.15792-2-julien@xen.org>
Subject: RE: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special pages in the IOMMU page-tables
Date: Tue, 9 Feb 2021 20:19:56 -0000
Message-ID: <04f301d6ff20$efa93b10$cefbb130$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJkA3sfHUQVO5jg8t87X8qwyW0VowLFj79gqSAOLIA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Julien Grall
> Sent: 09 February 2021 15:28
> To: xen-devel@lists.xenproject.org
> Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall =
<jgrall@amazon.com>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special =
pages in the IOMMU page-tables
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, the IOMMU page-tables will be populated early in the domain
> creation if the hardware is able to virtualize the local APIC. =
However,
> the IOMMU page tables will not be freed during early failure and will
> result to a leak.
>=20
> An assigned device should not need to DMA into the vLAPIC page, so we
> can avoid to map the page in the IOMMU page-tables.
>=20
> This statement is also true for any special pages (the vLAPIC page is
> one of them). So to take the opportunity to prevent the mapping for =
all
> of them.
>=20
> Note that:
>     - This is matching the existing behavior with PV guest
>     - This doesn't change the behavior when the P2M is shared with the
>     IOMMU. IOW, the special pages will still be accessibled by the
>     device.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20

Reviewed-by: Paul Durrant <paul@xen.org>


