Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABFC72E674
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548217.856049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95UL-0005OB-8S; Tue, 13 Jun 2023 14:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548217.856049; Tue, 13 Jun 2023 14:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95UL-0005LY-5h; Tue, 13 Jun 2023 14:59:17 +0000
Received: by outflank-mailman (input) for mailman id 548217;
 Tue, 13 Jun 2023 14:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q95UJ-0005LS-JJ
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:59:15 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0d35f8-09fa-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 16:59:14 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 1C6063F0E4;
 Tue, 13 Jun 2023 07:59:11 -0700 (PDT)
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
X-Inumbo-ID: dc0d35f8-09fa-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686668351; bh=JI9sqVVZoQBNBwmXnCO6s7yRiaobjc8tCqiYzrVuyt8=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=glcD5JRLRX0+aTX8DtzCp+09Jr3VODjp/3MGVmGMDNG/gJqlFfphCZU/neqDNhax8
	 cNgKrSEipYrgNl2OBICUIXj9u6+WNKwpKXHEiFbj45Jpi7LpvftNOURyXXl2RXV/XV
	 boBHWTcIy4L5kMKxtz6AXO6ZXMTDajzksePBr7GqR/42jWwK3u8DfucaAVZ8AWLEXl
	 RAby/y/7WeoFc34axOrccVKnerb55j/KkIL9sy7/5IEBmLzK8D30j4xmNtNTBr5R7K
	 I1p1Msf2h2r/bA8hpYGJdMaVcX3S2Ivya5dSdCfAa6YMdRClt3zQhs9QPFhGG5aZ0M
	 iMqtrlrzb722Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jun 2023 09:59:10 -0500
Message-Id: <CTBM13ATH5UG.9MD2JPA6R42N@Shawns-Mac-mini.lan>
To: "George Dunlap" <george.dunlap@cloud.com>, "Julien Grall"
 <julien@xen.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, <tpearson@raptorengineering.com>, "George Dunlap"
 <george.dunlap@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <shawnanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
From: "Shawn Anastasio" <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
 <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
 <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org>
 <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
 <3a7eca41-0ecf-4bf1-1daf-9d66f4aa6400@xen.org>
 <CA+zSX=bZ7yx90geyCo3x0jxJy7X2f4E2XiazYEn0EDE+4O==pQ@mail.gmail.com>
In-Reply-To: <CA+zSX=bZ7yx90geyCo3x0jxJy7X2f4E2XiazYEn0EDE+4O==pQ@mail.gmail.com>

On Mon Jun 12, 2023 at 10:19 AM CDT, George Dunlap wrote:
> Shawn,
>
> Again sorry that you've sort of bumped a hornet's nest here.
>
> Just to clarify, the situation as I understand it is:

Hi George,

No problem, and thank you for the detailed explanation.

> HOWEVER, as Andrew says, there is no official policy at this point; all t=
he
> document say is that GPLv2-only is the default unless explicitly stated
> otherwise.
>
> Furthermore, the concerns raised by ARM's legal team were nearly a decade
> ago; it's not clear to me whether they still care that much.
>
> All that to say: If you don't mind and feel that you can do so legally,
> then consider switching to GPLv2-only; but if you don't want to and/or fe=
el
> that you can't do so legally, feel free to leave it as-is.

I'll definitely keep this in mind when creating new files that don't need t=
o
include GPLv2+ code.

>  -George

Thanks,
Shawn

