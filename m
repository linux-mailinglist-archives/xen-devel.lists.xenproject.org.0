Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A42341D47
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 13:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99221.188515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEWB-0003D5-K6; Fri, 19 Mar 2021 12:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99221.188515; Fri, 19 Mar 2021 12:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEWB-0003Cg-Gt; Fri, 19 Mar 2021 12:46:19 +0000
Received: by outflank-mailman (input) for mailman id 99221;
 Fri, 19 Mar 2021 12:46:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+4K=IR=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1lNEW9-0003Cb-Qy
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 12:46:18 +0000
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f27d8bb-2a08-40a7-a98a-83997d437c41;
 Fri, 19 Mar 2021 12:46:16 +0000 (UTC)
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
X-Inumbo-ID: 5f27d8bb-2a08-40a7-a98a-83997d437c41
Date: Fri, 19 Mar 2021 12:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1616157974;
	bh=hrDDYoJlWz4/zn8ir+LdTRoz9rA2Zirrg0N3b5XRaw8=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=ZNzHh/fq2CNYkWetqDwjbviqeGEAlI0m4iRn55CJnhHVksJJPP6fA0cK7d7qEyNhG
	 uXUZW/eWP0n2BpaXv8th7uObv1esyWgNl1Yy8jlKXqWsh9ttO1AzfxubJ50htM1Myn
	 QZopQCViz+u1JRWDS7AoMpInSg8exfjSide9i9OY=
To: Dario Faggioli <dfaggioli@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <qcVhNDiGu6deufXzsHKbjEr4n3JuLC2cFNc1ORb02vl1IaPjm-37uFkXANQ-i7v77zP1GFxbYoTEG713C4EyHYBrE5YPvA5bXdPc4Brxg5U=@protonmail.com>
In-Reply-To: <d7aaa4e7fa3083ff5bb18e18c5cd8274194109ba.camel@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com> <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com> <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com> <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com> <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com> <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com> <4916dec1-1bb9-7e6f-2fe5-577bbab92861@suse.com> <d7aaa4e7fa3083ff5bb18e18c5cd8274194109ba.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hi Everyone, I've just confirmed only `tsc=3Dunstable` is required, that sp=
ecific change has fixed the issues I was having on the Lenovo X13, I assume=
 this is because Lenovo's Clock isn't correct?

> Right. Also, isn't hpetbroadcast set to 0 by default already?
>
> Dario
> --------------------------------------------------------------------
>
> Dario Faggioli, Ph.D
>
> http://about.me/dario.faggioli
>
> Virtualization Software Engineer
>
> SUSE Labs, SUSE https://www.suse.com/
> -------------------------------------------------------------------------=
----------------------------------------------------
>
> <<This happens because I choose it to happen!>> (Raistlin Majere)

