Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EFB4F2052
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 01:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298495.508500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbWFS-0001bE-3r; Mon, 04 Apr 2022 23:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298495.508500; Mon, 04 Apr 2022 23:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbWFS-0001YN-0J; Mon, 04 Apr 2022 23:36:38 +0000
Received: by outflank-mailman (input) for mailman id 298495;
 Mon, 04 Apr 2022 23:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AlE=UO=protonmail.ch=mati7337@srs-se1.protection.inumbo.net>)
 id 1nbWFP-0001YG-Ay
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 23:36:36 +0000
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f905cb2-b470-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 01:36:33 +0200 (CEST)
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
X-Inumbo-ID: 0f905cb2-b470-11ec-8fbc-03012f2f19d4
Date: Mon, 04 Apr 2022 23:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail2; t=1649115392;
	bh=pr39D381McF2hU8HX7/6PLLu0BWZtU4VrF2jx1W4UDk=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID;
	b=Eug4mhSFoUAE6g8/KcddR8sHPrxXkuOVEHWDc4cbLZYyro5ATQNyUgUuv5OVlgQy5
	 d18vhOTVdmwH9YYjFWcU9TFa1w5gFXfvMtS9mkRn6GzUsyib5dow0Gq3A0PHmHf0Yp
	 7vHNwQp+uvFQ5PB2zY8KHJ7d5avMJV0eVZeq5LP/UWQk5KrO1mWdbymOPmKlXH9ABn
	 1oahCdiWexZqm6YlTRUjwPVcV0FtZ7Eh8zO08ZtKWpgP2FILuFH/ad/Y1bPFMsW2qJ
	 m3lHcEQElH+hN5N22lDfzi+d/F3oa4t4s20KwDhKgmZ4RTHox4Boc2+4x2nuw/t/6u
	 57Ny23RT+UsIQ==
To: "jbeulich@suse.com" <jbeulich@suse.com>
From: Mateusz <mati7337@protonmail.ch>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Mateusz <mati7337@protonmail.ch>
Subject: Re: PCI passthrough: possible bug in memory relocation
Message-ID: <VL9_sTXEiw8YngLJ-_sfNtIrw4Ofj1iVlw_jTKSCAwEW_DSJukiTpsl1GLCMKWY_9jhCZh3MwN8WF4v1dd_OgrDHoyFs27CrXLVMNckLzdQ=@protonmail.ch>
In-Reply-To: <6bd17005-b662-125b-76c9-ac971c8ac2e5@suse.com>
References: <l3LThLG8tkJBvD-3WTxzw6TRrj7GPAN9uWh-AWqzelw75qpdP1ZLXzBV7599MWrjrHH-lRKof3b0jm1DEGrUXLJszgh5hjW25oNtHoTI9Ts=@protonmail.ch> <6bd17005-b662-125b-76c9-ac971c8ac2e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

> I'm afraid answering this requires debugging the issue. Yet you don't
> share any technical details (as to how things don't work, logs, and
> alike), and the provided link also doesn't look to point to any such
> information (and as an aside I consider it somewhat unfriendly to
> point at such a bug as an information source, not just for reference).
> I'm pretty sure this code in hvmloader did work at some point, but
> since it may be used quite rarely I could see that it might have got
> broken.

Thanks for responding!
I only wanted to ask to see if maybe it's a known issue, but I guess not.
I'll try to debug and fix it myself so that's why I haven't posted more
technical details yet.
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE0RoD3+S7b5zXZ6lW6IGQZRJEAKsFAmJLfqYACgkQ6IGQZRJE
AKuowA/+OOcS4CyBmG/NEF4Brc+oAsjdXsz3vZvMgqhc5oNU7hYOLnOg5KKZ0xvz
p2+Tm5saS05A+LIiFXC302tiwoQ9Gq+9hXw92c5nI+FZWyMNvA71Y27XKiHymWpe
ksORbIdc1B4st4J3bEls4R1PyjSuYyaEMcFMHH7aPGydXFjgon/8BtqenwKz2vrM
ncW+/VtQkAj2BcwMJbSq/M+JUOm115Jvb3LQDhCi/XvoGrduW+HB+lavN9opnJnT
jlSeS6H96L70EWYnV49+i5OBgQrcFfDQcZqZ4+dU9lFjEvWYn2d2wNzwD6PlXl1g
kHX+PBM95UYJDEwlCXGBX9Dc68LRIMAfpaOyzZsEYoNHbExGUPVpzKx9a7SnZBJZ
1X94MKuxDrbIULvpP1QezNaBMojtagI30DSODbuBpmcyu6Bl+QlKL/OFeP41+Ic5
EOWoFqjklNbvSVMyG08elRvmaR63JAHncCqDHBnxQ7eThMFQGNnY2qzniKqas/UR
2H0XgU5UqzZCsr+4Yk4Ab9gS06t+UdCTJAvoX9SyS0kjSHNkpF8fKZI8AgRg/RWL
mtMwouwZRaKlVmezYJKfuHvLQpb19dZFcFtkBOFN1PftXxNMPIEWq0w17rRzwWp0
QL6mzytmQXK5lfC2eeUDiggyk5gp25Gnw1bQyl6eSW/nN16cP/Q=3D
=3DpAFu
-----END PGP SIGNATURE-----

