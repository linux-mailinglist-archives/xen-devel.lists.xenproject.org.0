Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB639C49F
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jun 2021 02:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137070.253955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpKSl-0007ou-UT; Sat, 05 Jun 2021 00:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137070.253955; Sat, 05 Jun 2021 00:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpKSl-0007lm-Qc; Sat, 05 Jun 2021 00:46:55 +0000
Received: by outflank-mailman (input) for mailman id 137070;
 Sat, 05 Jun 2021 00:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nsHC=K7=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1lpKSk-0007lg-Nq
 for xen-devel@lists.xenproject.org; Sat, 05 Jun 2021 00:46:55 +0000
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa2366c3-c3ec-4ff8-b342-fb619dd8327e;
 Sat, 05 Jun 2021 00:46:51 +0000 (UTC)
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
X-Inumbo-ID: fa2366c3-c3ec-4ff8-b342-fb619dd8327e
Date: Sat, 05 Jun 2021 00:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1622854010;
	bh=LtS95j0B6WfWbjo7dU8GYscPr0kp6+CSg3pWNzHmaAs=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=fvoaA3HjluTyj64ty0hy2yIdg6TU3jgzuK9Ow/QUhY/aGNjPCUfT1dXvl32+QLIzE
	 6+WYlIFG6BRuwGSdTdwMwXjsZQ8Jam58kksJMV5ZX0sCJoALwiYSirRxLsU26vftEs
	 uKN/h5v92kBqSj2v+DbbY4buzVrVqpFnvQ0+wb9Q=
To: Jan Beulich <jbeulich@suse.com>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <10Q_2iTQLicCwiahWeAjyi3C7Db3tcwpkF4dwd8gezGByiwoJpfHNHwHW8gonbgyhQ7LWU8xv1TB_fd18e05-Cy8CYUfFhZbgLneMwbOzNk=@protonmail.com>
In-Reply-To: <0e963858-6834-96de-4bf2-956f905160b4@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com> <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com> <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com> <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com> <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com> <4916dec1-1bb9-7e6f-2fe5-577bbab92861@suse.com> <d7aaa4e7fa3083ff5bb18e18c5cd8274194109ba.camel@suse.com> <qcVhNDiGu6deufXzsHKbjEr4n3JuLC2cFNc1ORb02vl1IaPjm-37uFkXANQ-i7v77zP1GFxbYoTEG713C4EyHYBrE5YPvA5bXdPc4Brxg5U=@protonmail.com> <0e963858-6834-96de-4bf2-956f905160b4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Hi all,

Lenovo released a new UEFI update for the Lenovo X13/T14s, changelog is her=
e: https://download.lenovo.com/pccbbs/mobiles/r1cuj63wd.txt

It lists "Fixed an issue that Fixed TSC synchronization  failed under linux=
." as a fix, I can confirm after removing the tsc=3Dunstable CMDLINE everyt=
hing is functioning perfectly.

The bottom of this issue was indeed Lenovo's shotty firmware.

Thank you to everyone.

