Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE442F9C26
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69527.124490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RLD-0001aN-B5; Mon, 18 Jan 2021 10:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69527.124490; Mon, 18 Jan 2021 10:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RLD-0001Zy-7e; Mon, 18 Jan 2021 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 69527;
 Mon, 18 Jan 2021 10:00:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1RLB-0001Zt-SD
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:00:53 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd6e0f0-19a8-41ce-8220-471187c4c8d1;
 Mon, 18 Jan 2021 10:00:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id 91so15825594wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 02:00:52 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id z184sm20781200wmg.7.2021.01.18.02.00.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:00:51 -0800 (PST)
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
X-Inumbo-ID: 6bd6e0f0-19a8-41ce-8220-471187c4c8d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=KsPfvnXYgbL4awXzyfP6HuKFWuYK7XNLYWDLhybndi0=;
        b=D7hVwezld4bB/X4x/RsD/C67PeydIqK17WbLGLJeIqTPMBr2zzIPxrTH4mApeKN0l2
         Il2lg0aYx9BCla/ehpSJfnqyOU+olRBEYFJZZJv0eOm2H0g+6dhPK55vFCyJoMjib89k
         WkXBmmYtRISbRODYeNe8PO5FE5eOlF1rkptQ4+3zRZ8w6C245X7GMWqfCL1lQ5stuUqA
         qrNkIHUaH3/QMayIoEDNhO+q/726kTZC/fymbxJLnpOIigppUAvyzz8SltV1JYEaMV97
         zHawCy6j5TUUSoU4IUdE9lHwzDporv2SVqW8P+edsTezG6xJEFUOupaAxsoU2ebWRmlW
         Kytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=KsPfvnXYgbL4awXzyfP6HuKFWuYK7XNLYWDLhybndi0=;
        b=LHfjKNwWNh9WBclQGzCoaP5GcVw6SYeskEuoPPcYnl9XAMqELNfbEd8UiQI7IDeCN4
         u7s/Yb37QofU4G5JHhX6QY99Oauy04OtH/YyMvnhvt3Rrq93Lx1Tab6bl5mcdBtngviD
         skJI+YOykoc/NU+uphSol9Wn06QsvxzUzetFvnlxK9MTuzep10mtHc5ry5fRWdKUZ0mw
         qm2KpZ/UY7AvCfrC27Y20lZ9/37x7SED2kGII7V93CIRaIW5pAoGIWcbO3dpVK1TFgmK
         XE/T1MaUXqL/twh0SCFEadZtoWOAjypQ5x9E3w7y6sR/GPAhRREDg3Rzc2Xi0B5dzJOz
         QoAg==
X-Gm-Message-State: AOAM533Lvi6DLTGdkyA+q0xowuRBKkPuw5WQGrGoaVckPRrp8d6uH8tz
	OcLU+K35TJmNi1IzgSV//dg=
X-Google-Smtp-Source: ABdhPJylKkXl+EY1vawUDMUGlZqSJ+rJ5L5/1gs97UqJfMvZrbhcsr1ny7xkyGQBA9CdPOVY3cIXVg==
X-Received: by 2002:adf:e552:: with SMTP id z18mr26078842wrm.29.1610964052205;
        Mon, 18 Jan 2021 02:00:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-14-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-14-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 13/24] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Mon, 18 Jan 2021 10:00:50 -0000
Message-ID: <00cc01d6ed80$cdb8b780$692a2680$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQENHQG2qPgIfJA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant <paul@xen.org>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V4 13/24] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The cmpxchg() in ioreq_send_buffered() operates on memory shared
> with the emulator domain (and the target domain if the legacy
> interface is used).
> 
> In order to be on the safe side we need to switch
> to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
> 
> As there is no plan to support the legacy interface on Arm,
> we will have a page to be mapped in a single domain at the time,
> so we can use s->emulator in guest_cmpxchg64() safely.
> 
> Thankfully the only user of the legacy interface is x86 so far
> and there is not concern regarding the atomics operations.
> 
> Please note, that the legacy interface *must* not be used on Arm
> without revisiting the code.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Paul Durrant <paul@xen.org>


