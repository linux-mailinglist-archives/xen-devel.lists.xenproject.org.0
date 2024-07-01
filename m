Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55C91DB6A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 11:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751423.1159389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODLA-0000Ne-Fu; Mon, 01 Jul 2024 09:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751423.1159389; Mon, 01 Jul 2024 09:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODLA-0000M8-DH; Mon, 01 Jul 2024 09:28:52 +0000
Received: by outflank-mailman (input) for mailman id 751423;
 Mon, 01 Jul 2024 09:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wowx=OB=bounce.vates.tech=bounce-md_30504962.668276ce.v1-1ca19e15b41746609e875dc740e26355@srs-se1.protection.inumbo.net>)
 id 1sODL9-0000Lz-Gy
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 09:28:51 +0000
Received: from mail145-25.atl61.mandrillapp.com
 (mail145-25.atl61.mandrillapp.com [198.2.145.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 513ad37d-378c-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 11:28:47 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-25.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4WCLML0fDtz35hTN1
 for <xen-devel@lists.xenproject.org>; Mon,  1 Jul 2024 09:28:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1ca19e15b41746609e875dc740e26355; Mon, 01 Jul 2024 09:28:46 +0000
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
X-Inumbo-ID: 513ad37d-378c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719826126; x=1720086626;
	bh=TQ7aJ58mmsoGmEKN9OokKingdVNq3WsiR6vkD999r4E=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fg0hy1adxKJC9mo+jkF5RPJrr8IG1Y2rmyQeE8Dq4hG/dCnz1hfs9wGo5WQHAPBmF
	 KcIZacPVE/VSIEQ+J0rxH6VuYkRXEKGTU150fmPoGy20B9JetFP07OM9z3Kc1iuwUR
	 HuaDvThg3buwOO4YEfRnhoPSfCTzlnh9uzSPPp6SSMJPDM7eKJDw8dTCue4DCgslOk
	 zYwGmEJWdTgspDBHIlz++6WlrYz3DQnxu3jryf9UO5zCu0FddSO06M1TM2vlQSgWMi
	 OcL17MSSvArwg1QJQYHJrNRdslSNhK2S5fhxhPtvkmJ3B2Sb9Pj4nw4yXN/OtxA9/7
	 dAe65ea+h8yxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719826126; x=1720086626; i=anthony.perard@vates.tech;
	bh=TQ7aJ58mmsoGmEKN9OokKingdVNq3WsiR6vkD999r4E=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PRM+iUxSaOqi4aXK8GQCgJvtOr5XQq9vGGyGk6eriE288txrF/kBStLvtUlYNX9/F
	 lM4IsCn5oBdP87QsLjmT1uGoxsNHdoBa3CTqCsWMJ5dy+VC8OOxiWrG8C+eWub3Xbe
	 9kO7TOvi2udiRvrcvxWcS16qHgSXJfW5kEXyuLEQSI2+5LRvXdrAQ1Uz2ylbcUI3dO
	 4K97ztetnOdS90pjVsopU2ZNPA4m++dDdt81wgGmyRGe3ExMl0efv+4phhreDDApKM
	 ri1X7sKJ9BJy1SSbViNFaYaY1maNLE4cZMkkKZf0fsigRWzrSnZJdRC5Fylatdv8il
	 4PaLAsNdgj1/g==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19(=3F)=200/3]=20tools/libxs:=20More=20CLOEXEC=20fixes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719826124665
To: =?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZoJ2jbis3JyhR+EV@l14>
References: <20240628143116.1044976-1-andrew.cooper3@citrix.com> <db3b0608-6ca6-4fbd-a56d-343ba480e86c@suse.com>
In-Reply-To: <db3b0608-6ca6-4fbd-a56d-343ba480e86c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1ca19e15b41746609e875dc740e26355?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240701:md
Date: Mon, 01 Jul 2024 09:28:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 11:03:02AM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 28.06.24 16:31, Andrew Cooper wrote:
> > More fixes to CLOEXEC handling in libxenstore.  For 4.19, because the f=
irst
> > attempt to fix this wasn't complete.
> > 
> > libxl is far worse, but I don't have time to get started on that mess.
> > 
> > Andrew Cooper (3):
> >    tools/libxs: Fix CLOEXEC handling in get_dev()
> >    tools/libxs: Fix CLOEXEC handling in get_socket()
> >    tools/libxs: Fix CLOEXEC handling in xs_fileno()
> > 
> >   tools/config.h.in     |  3 ++
> >   tools/configure       | 12 ++++++++
> >   tools/configure.ac    |  2 ++
> >   tools/libs/store/xs.c | 68 ++++++++++++++++++++++++++++++++++--------=
-
> >   4 files changed, 72 insertions(+), 13 deletions(-)
> > 
> 
> For the series:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


