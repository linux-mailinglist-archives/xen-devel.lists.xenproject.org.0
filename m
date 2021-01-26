Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67340303EB7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75027.134969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ORF-00010I-7s; Tue, 26 Jan 2021 13:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75027.134969; Tue, 26 Jan 2021 13:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ORF-0000zs-2s; Tue, 26 Jan 2021 13:31:21 +0000
Received: by outflank-mailman (input) for mailman id 75027;
 Tue, 26 Jan 2021 13:31:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahOi=G5=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l4ORD-0000zn-E7
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:31:19 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d029c5e1-a7ce-4b40-83ce-02b73b7e1606;
 Tue, 26 Jan 2021 13:31:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id 7so16474034wrz.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jan 2021 05:31:18 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id e4sm15138571wrw.96.2021.01.26.05.31.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Jan 2021 05:31:17 -0800 (PST)
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
X-Inumbo-ID: d029c5e1-a7ce-4b40-83ce-02b73b7e1606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=2l1A5+8LF2AMoNgdZPUUKBjglqTQGAvHy07IiFbJ+e8=;
        b=UTbpr4yLhQm468XyYwIYwiy59zbF3kkMwIJr4kQIUM0hXpWDVONS9pjvmA8xxuuziH
         8ex7LwAA/gdlEouq+bZJv7pW2m9BjSYFmfKwiPlLzlNzEchqRHX9FiGFndBV3aHkHYPN
         Rk7tPul4GGrws8ST+83ejVvsvqp4UjS9rlSGgDCTegj7bCqs1uP2efttPiHs15mQj7mJ
         IDBg9e13H5x8g96q/mqqx2T/X6+KVLhqEqLVnjRvPa/DcuaBzVqQlhFlVi5Gk1vyzMyv
         tt5XxRXSFcaL9/mI9ODseVxXc+andOYcmXxU1BODEy6cIdcjSy52qnFQC1REjzJAU6Y4
         TnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=2l1A5+8LF2AMoNgdZPUUKBjglqTQGAvHy07IiFbJ+e8=;
        b=fzBecSLSClyLDbzjkHy//LwiasIzi1YoZALeQtepsqorrBXzsXD4BepMYu3rYFtdOw
         oeOjjDaf6qs8uYUq56K+g+rYO25kJDGDD8Xh+16Liqgxy646wvqbWhG/tf9YBMwBLP2r
         jP1mBtlDrFljTrfaRqKK1RqnAXX+3gvCyEtPjuyH4cb7LZA53RpGiJc6d3EsjVpx/81W
         Sc1rSYeOOdC9zlNRLA5wSC514//DeseJ+DRxl9V1fUH/uoj/aiZDW1SrajQaHn1fpiJH
         Sue9YFc6IBJbNmewEGfLjrwaLpUHLrPwoRXhWjN4y5hyFpaLhm8bhQ2AsepFYv7tIj7H
         5BVA==
X-Gm-Message-State: AOAM5321VO9NpQjRW/qbuKJSL0cTJHal3f4z0+E6kG/5OBWYPiOR2BW4
	RLXAaTUwlSLQTsSR/1h023c=
X-Google-Smtp-Source: ABdhPJyfxYBnID3zLTi/Ui849LYtfgXcZVJu/WvH3vnHYiG8SMwv0zjgUdfJnpflRXrBiPbsROt6Xg==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr6139421wrt.269.1611667877753;
        Tue, 26 Jan 2021 05:31:17 -0800 (PST)
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
	"'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com> <1611601709-28361-10-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1611601709-28361-10-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V5 09/22] xen/ioreq: Make x86's IOREQ related dm-op handling common
Date: Tue, 26 Jan 2021 13:31:16 -0000
Message-ID: <020a01d6f3e7$8666d750$933485f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIYfH4YhlJioryIJZ+mt2W0SKckuAIFu1n9qaanK9A=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 25 January 2021 19:08
> To: xen-devel@lists.xenproject.org
> Cc: Julien Grall <julien.grall@arm.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; =
Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Paul Durrant =
<paul@xen.org>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>
> Subject: [PATCH V5 09/22] xen/ioreq: Make x86's IOREQ related dm-op =
handling common
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves the IOREQ related dm-op handling to the common code.
>=20
> The idea is to have the top level dm-op handling arch-specific
> and call into ioreq_server_dm_op() for otherwise unhandled ops.
> Pros:
> - More natural than doing it other way around (top level dm-op
> handling common).
> - Leave compat_dm_op() in x86 code.
> Cons:
> - Code duplication. Both arches have to duplicate dm_op(), etc.
>=20
> Make the corresponding functions static and rename them according
> to the new naming scheme (including dropping the "hvm" prefixes).
>=20
> Introduce common dm.c file as a resting place for the do_dm_op()
> (which is identical for both Arm and x86) to minimize code =
duplication.
> The common DM feature is supposed to be built with IOREQ_SERVER
> option enabled (as well as the IOREQ feature), which is selected
> for x86's config HVM for now.
>=20
> Also update XSM code a bit to let dm-op be used on Arm.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20

Reviewed-by: Paul Durrant <paul@xen.org>


