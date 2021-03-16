Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2133CB49
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 03:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98157.186104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLzAU-0008E6-LJ; Tue, 16 Mar 2021 02:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98157.186104; Tue, 16 Mar 2021 02:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLzAU-0008Dh-Hy; Tue, 16 Mar 2021 02:10:46 +0000
Received: by outflank-mailman (input) for mailman id 98157;
 Tue, 16 Mar 2021 02:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Go/K=IO=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1lLzAS-0008Dc-A0
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 02:10:44 +0000
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 929c9aee-560f-4f95-bcca-c8d6daa3682c;
 Tue, 16 Mar 2021 02:10:39 +0000 (UTC)
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
X-Inumbo-ID: 929c9aee-560f-4f95-bcca-c8d6daa3682c
Date: Tue, 16 Mar 2021 02:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1615860638;
	bh=PEA2EZR3ehKhgiPU96rVBV/d0DERSXYyqzf7IqaLKWQ=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=KwIXzDIbF6KFMBIuaetzPD4Xr1xMURLOTdGs8c5Ox4K6WxVlSGt7DCPPOjR6NDlae
	 fJ1RmauHWVTBTfywvXa4NylWSQ3KYGSQpwFzraTeC0zuEBaAj30p7xFaKTE/tjnA3j
	 A+ZTh4zCwzP/iBoZeGm7WhXQHY3gS7tHDs/gwD/w=
To: Jan Beulich <jbeulich@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com>
In-Reply-To: <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com> <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com> <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com> <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com> <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com> <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com> <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com> <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hi Everyone,

I just wanted to close this off and let everyone know the issue ended up be=
ing a faulty/misconfigured HPET clock.

Appending `clocksource=3Dtsc tsc=3Dunstable hpetbroadcast=3D0` to Xen's CMD=
LINE totally fixed my issue, I assume Xen was detecting TSC may have been '=
off' and was trying to recover/self-correct?

In any case it's working perfectly.

Cheers

