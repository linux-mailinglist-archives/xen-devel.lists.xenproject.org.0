Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728AECBA1C4
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 01:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186005.1507923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUDOC-0001lr-Az; Sat, 13 Dec 2025 00:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186005.1507923; Sat, 13 Dec 2025 00:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUDOC-0001k5-7H; Sat, 13 Dec 2025 00:21:36 +0000
Received: by outflank-mailman (input) for mailman id 1186005;
 Sat, 13 Dec 2025 00:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XKAJ=6T=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1vUDOA-0001jz-L2
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 00:21:34 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac867d3d-d7b9-11f0-b15b-2bf370ae4941;
 Sat, 13 Dec 2025 01:21:32 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1765585286539823.6498816067525;
 Fri, 12 Dec 2025 16:21:26 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7c6da42fbd4so894569a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 16:21:25 -0800 (PST)
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
X-Inumbo-ID: ac867d3d-d7b9-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1765585288; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cw3bX0mrOpW1ENyuax8uYZVvUxa2aqXZtF/VQWG3IU990K6B0mJV+Yo9mNjsBNPktbQdeQG8vS0Nh09uolw+bpQMfB4sED1QCrOU8WKDxG16rU/XYcWtfCnqM0uCKi3/iA80TybdrGMwkPhxeyc6jeZnuugSYurGybfKW2U0930=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765585288; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6UKyMjBm/KA3X23N94H3JmDIPbxhK7G8MuncgybTHaM=; 
	b=XffCxOoeGVQqZQahPdTUhaHW5uDVLU4KazMFv8nbkxXZGBHAXhsdS7yrz4VXayPLa4I5PMwdw9ckks2AJXp3ZLOWcVkhqei68SWPlfXZoslwvGflLyU6RHgAwrGIDR5ejdrx1oIW36iCE/eiYjd+1vB9kjDFCizyCZbZy6EoXyQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765585288;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6UKyMjBm/KA3X23N94H3JmDIPbxhK7G8MuncgybTHaM=;
	b=IJo29Get54TbVlvL/oZqqguZrA53NSClDNsAVMhICI1mBqX9JZK9/EGNv7/Oh3Qv
	gXCGyInxsjE9DPEnHdoEw2mbcSZXSUFPKbtNWs17vnAlWgeF0lVyQrJZc2OX7AepJyI
	TX7R5wt/lmHQH1bP4lZq61FHjFrPYENkSptRkKqU=
X-Forwarded-Encrypted: i=1; AJvYcCUfeW5QUKZmzok+6dATleuz9WVX9GvZjVuzCRBpWr0w9EGyY2FxRkas57N0KW6vYSMy4FAx53AGU34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAT50g0Tui4AWK7rp/ne9zFMYLDuMzxiZyVDktK7/pxy0Nj+Y4
	VILWeaO8/vlyw+YImmZOdVmv8UMc3RUzwoKH0R0e717ANwlA+DtUcBAL8mkad0OPM0WOVM3ecOz
	fkgdnhuz7/4CnMfRg/gu3Yp/2YdU4EIw=
X-Google-Smtp-Source: AGHT+IET+jpYygZ4B+R6X3+pl4mxnl7ymXRUBVL2WDbKAdBVaEALFQoQvTp2COMQDKFqp1vUwbigsY/GzuEQskZFumI=
X-Received: by 2002:a05:6808:1a1d:b0:450:3cbb:f1e2 with SMTP id
 5614622812f47-455ac98a755mr1811054b6e.46.1765585285287; Fri, 12 Dec 2025
 16:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20251212040209.1970553-1-Penny.Zheng@amd.com> <20251212040209.1970553-9-Penny.Zheng@amd.com>
 <f55d729e-e25a-408e-91ae-355033eaedde@suse.com>
In-Reply-To: <f55d729e-e25a-408e-91ae-355033eaedde@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Dec 2025 19:20:49 -0500
X-Gmail-Original-Message-ID: <CABfawh=WGft2pF3tKGyevPY7i5tM7W6_of6RahrGvku6FRsreA@mail.gmail.com>
X-Gm-Features: AQt7F2pOWGWm2OYUrVvYThEWKde72aA3R3NhM5nWdJgICpd-uxcYWDws8qAGQ4I
Message-ID: <CABfawh=WGft2pF3tKGyevPY7i5tM7W6_of6RahrGvku6FRsreA@mail.gmail.com>
Subject: Re: [PATCH v5 08/24] xen/mem_sharing: make memory sharing depend on MGMT_HYPERCALLS
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, grygorii_strashko@epam.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 4:23=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.12.2025 05:01, Penny Zheng wrote:
> > The enabling bit (d->arch.hvm.mem_sharing.enabled) for memory sharing c=
ould
> > only be enabled via domctl-op, so we shall make memory sharing feature
> > depend on MGMT_HYPERCALLS.
> >
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

>
> Tamas,
>
> this is something that rather you should ack (or reject). (Penny, you wou=
ld
> have wanted to Cc Tamas here right away, no matter what F: entries in
> ./MAINTAINERS would say.)
>
> Thanks, Jan

Thanks, seems fine to me.

Tamas

