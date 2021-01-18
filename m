Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A62F9BED
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69510.124442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1R01-0006w5-P9; Mon, 18 Jan 2021 09:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69510.124442; Mon, 18 Jan 2021 09:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1R01-0006vg-Ls; Mon, 18 Jan 2021 09:39:01 +0000
Received: by outflank-mailman (input) for mailman id 69510;
 Mon, 18 Jan 2021 09:39:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1R00-0006va-34
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:39:00 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1396b59-ab84-45d3-bac4-47abcbd8639d;
 Mon, 18 Jan 2021 09:38:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id i63so12949045wma.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 01:38:59 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id f7sm13282211wmg.43.2021.01.18.01.38.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:38:57 -0800 (PST)
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
X-Inumbo-ID: b1396b59-ab84-45d3-bac4-47abcbd8639d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=6DTv/0kaIv66bjshNHUj51YhELv8Dtv6ksuMTYKfpiM=;
        b=mq2j016Hor923/41NZrlBSsMxAOZGOT17urVkHTFTEvGpa2ts9VsPFSiIKHVZc8lWt
         RmbgBMbNXc/r02RF3rAFYR6Khzie3aVdc8XCtGK5KBf0nJOES31J2lauu8jp2nPxWNXj
         sY9vVmOsOtUj+dIYfr/imv6Q9WkgDhbxq7TXbD6uo5gVi+ibFsFbG8DTYGEcCYWMyIRZ
         ibeu+vSbT1hbDD3+dzyW1LZGcob4KzXMuMK5518CAWtNhFtGyZLQrfWbgl9hYWGR0oPk
         dkwh4PNtb8ieNcvED7EJdMrfJA9DVFoqXgnwiX0I6buqsYxaFB5asRqDqTVa/rf3A7Et
         B0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=6DTv/0kaIv66bjshNHUj51YhELv8Dtv6ksuMTYKfpiM=;
        b=gr3yGT8kyFqLhrURxtBiNh9lu+pBPu3c1paIRXY2Mbq8M7MKwTIufzoZohXxOuwRXU
         +Kf8Fd7CVKiNbQaSKtNHVpIeE2hdJPollNq0xaGbivD4JpcAD3xlwT8NJlh9pnuZKIz+
         3wsb6b2PAmxYCZOMa6hHV9xMf01azbARDJlOltOwbm9PhjfYbQdWJyehEZ75L5bL1DKR
         lh6q0aV/+g5mb0DKjUgRssTY4jc0hQsq3YdudZQuzNKzyWqOZnj77mDsvB5fym8qLnEC
         X40mPO91uKIzmCCRoXVHhWFq04WOEkBzEqqrj7eCHUZ4RAD7xQQ5Ojd55+EJWkWPiCvx
         Dv/w==
X-Gm-Message-State: AOAM530g1gbHkINgDQ6LXhXnozMrr2zqRF0b0ygECbj9cOqdDJddt6RS
	X2DCo1bA2tW+ZUaQN8GCKaE=
X-Google-Smtp-Source: ABdhPJyTWpaTTvXE2nRe60nEoBEUSp+lXnyOGn8hW7w1fyBlxbrLQ0AiitF0kcNBuah9oyoDxlir5A==
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr19631831wmq.156.1610962738284;
        Mon, 18 Jan 2021 01:38:58 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Julien Grall'" <julien.grall@arm.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
Date: Mon, 18 Jan 2021 09:38:56 -0000
Message-ID: <00c901d6ed7d$be7daad0$3b790070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQEmColcqPc7AsA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Julien Grall <julien.grall@arm.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; =
Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Oleksandr
> Tyshchenko <oleksandr_tyshchenko@epam.com>
> Subject: [PATCH V4 11/24] xen/mm: Make x86's =
XENMEM_resource_ioreq_server handling common
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> As x86 implementation of XENMEM_resource_ioreq_server can be
> re-used on Arm later on, this patch makes it common and removes
> arch_acquire_resource as unneeded.
>=20
> Also re-order #include-s alphabetically.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20

Reviewed-by: Paul Durrant <paul@xen.org>


