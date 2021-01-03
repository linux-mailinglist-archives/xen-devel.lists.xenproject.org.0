Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A52E8B32
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jan 2021 07:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60887.106794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvx4J-0001wJ-29; Sun, 03 Jan 2021 06:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60887.106794; Sun, 03 Jan 2021 06:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvx4I-0001w1-P0; Sun, 03 Jan 2021 06:40:46 +0000
Received: by outflank-mailman (input) for mailman id 60887;
 Sun, 03 Jan 2021 06:40:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DpmD=GG=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1kvx4G-0001vw-75
 for xen-devel@lists.xenproject.org; Sun, 03 Jan 2021 06:40:44 +0000
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811749f7-4a6e-4474-aa0c-182ad90abaf4;
 Sun, 03 Jan 2021 06:40:36 +0000 (UTC)
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
X-Inumbo-ID: 811749f7-4a6e-4474-aa0c-182ad90abaf4
Date: Sun, 03 Jan 2021 06:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1609656035;
	bh=35I4LlLn35Nz7M9JkcF25StwfUvuYD26WbFL0FiTQYc=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=W4k8XoIesMlJ/VQuyc+I7n2mRgU4WdNOlhNo3dH7b3YptskuOhu3JHrypGEK7x1fW
	 WgGbUifF4nxdo3F6R6TOX1UciKdacfMCHBxIn2JNolQmyMLf0APQA9iARWsJrenmsW
	 vnw+Vvl74Up0651QnICO/d1+/Ai7DwyWcqfanYCA=
To: Dario Faggioli <dfaggioli@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com>
In-Reply-To: <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com> <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com> <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com> <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com> <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com> <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hi All,

Trying to debug Credit2 https://wiki.xenproject.org/wiki/Credit2_Scheduler#=
Dumping_Status_and_Params

It should be possible to get some debug output on what Credit2 is doing via=
 pressing 'r' on the Serial Debug port

Does anyone know if it's at all possible to use a USB-TTY adapter? The wiki=
 (https://wiki.xenproject.org/wiki/Xen_Serial_Console) says it's not possib=
le, this makes debugging any modern laptop really hard, I don't think I've =
ever owned a laptop with a serial port.

Failing that I'll just have to add a bunch of printk's Credit2 functions

