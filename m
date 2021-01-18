Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED82F9BBC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69467.124331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QXS-00038N-7H; Mon, 18 Jan 2021 09:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69467.124331; Mon, 18 Jan 2021 09:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QXS-00037y-3y; Mon, 18 Jan 2021 09:09:30 +0000
Received: by outflank-mailman (input) for mailman id 69467;
 Mon, 18 Jan 2021 09:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1QXQ-00037Y-R9
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:09:28 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a455bc1-9516-4f63-a617-dc76ad78122c;
 Mon, 18 Jan 2021 09:09:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id j18so1873292wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 01:09:27 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id y11sm24872933wmi.0.2021.01.18.01.09.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:09:26 -0800 (PST)
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
X-Inumbo-ID: 7a455bc1-9516-4f63-a617-dc76ad78122c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=nMLeVRmAj4wZ78pTmUjRGZ/jrFiAJ3RYHc/PTY0i/Dg=;
        b=KT1/A4iInchM1H3LPNP3OwNhhvSBO9g5Faj2e4xBLzZ4nKf8py+pz0Bk/XxnZC0r8i
         Z12dVgK/RtxfJhqsVhav5axI+0lT/o58FoJmX+J0n6dMeFfnCAZjsE9vFGCPHlRXSx+s
         8aeu+lsNhfaH//bXtFFE+pZo9oTbzX5XSpWTT0uyDwNDf5r7KOP95p1A/01CR0BDIKE5
         P9U1HhRIM1hg7HKmsBvG8XQOslJ1QIMr1iW/0tz5UBbRr9yZeAU6cG/XfKdL21Dhsnuy
         1PWq36upLz9wSGrLkgQenizVJKFUdKTeZJkX8KsqIb2Nt7kMNmUIf1mqVm5gM21E8Ioj
         986A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=nMLeVRmAj4wZ78pTmUjRGZ/jrFiAJ3RYHc/PTY0i/Dg=;
        b=qENXI2rSDjmscCIb/oD1ownS6pP8YJAL+Mw+WwqljKmGOGRBcHMmEFaKfhNUrdnadd
         kSu0dh8+0wvTM19AlUMEQ0ftZV0fwi0ohaJjg7/EgqAXUsFU8vEKEUAG9muA2MPfn0Zs
         kDrcltPhgC0zbAXCJlwst7oJglc1azfLAERFh3Ok7c2dfMgt03Tjnnm5WoBpJiOV0wyd
         uJRPUfBbEJCoh5aezlzmEe4xKtPGFW/oEpjcICytwUPPhuc7P2J0x9JARSZHosQbcjiD
         MiAX/vZuHsZv3SXHmJmqn/uG2nIS+Se4MZm3TI7B/44ev0TR9BalytgyLrZlubVs2NoU
         CLng==
X-Gm-Message-State: AOAM531Q1lMMT8EgfkfKtVuaUrMv59nvYTSG4l7I/KICRoD66V4e+q5i
	GAjMakUmlDoLQdZlSJGjXZQ=
X-Google-Smtp-Source: ABdhPJz0AsFPiwdDk8BXFtloGumJHmRPBBSwvUxiTU+3OCxHtlHRfaisKIj3JH3DEGw28O43uyuZLQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr19571376wmj.52.1610960966766;
        Mon, 18 Jan 2021 01:09:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-9-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 08/24] xen/ioreq: Move x86's ioreq_server to struct domain
Date: Mon, 18 Jan 2021 09:09:25 -0000
Message-ID: <00c201d6ed79$9e821800$db864800$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQIvfIOVqO7lKkA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Ian Jackson
> <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Julien Grall =
<julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>;
> Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V4 08/24] xen/ioreq: Move x86's ioreq_server to struct =
domain
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and this struct will be used
> on Arm as is. Move it to common struct domain. This also
> significantly reduces the layering violation in the common code
> (*arch.hvm* usage).
>=20
> We don't move ioreq_gfn since it is not used in the common code
> (the "legacy" mechanism is x86 specific).
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>

...and I see you fix the alignment issue as part of the code movement in =
this patch :-)



