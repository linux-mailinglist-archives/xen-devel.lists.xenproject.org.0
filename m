Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345320CDB9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 11:57:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpqXr-0004nD-RV; Mon, 29 Jun 2020 09:57:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeCR=AK=web.de=joshua_peter@srs-us1.protection.inumbo.net>)
 id 1jpqXq-0004n8-Fn
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:57:46 +0000
X-Inumbo-ID: fa9246ec-b9ee-11ea-bb8b-bc764e2007e4
Received: from mout.web.de (unknown [212.227.15.3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa9246ec-b9ee-11ea-bb8b-bc764e2007e4;
 Mon, 29 Jun 2020 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593424664;
 bh=ZQbDvPXnFTZF0piKJJKk8yHV984e1gtyOn4pTVggaLk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LBE88t96i/Gk0zueBGtg3yZtEBlhtpEgz4b/dG6ZeXOurcppLL6J2fWE5gA/s0uel
 KbEoDZEkmq/EjN9NmSBC02uSkMR9pnvmZnJRLaKkdkXe6K0FG7/BYnA0dvbix8SLm8
 76LMCuSXZsE0ZKpTilqCYDU6Eip+J8Ux4kA49xUg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [79.201.81.46] ([79.201.81.46]) by web-mail.web.de
 (3c-app-webde-bs30.server.lan [172.19.170.30]) (via HTTP); Mon, 29 Jun 2020
 11:57:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-b93efc54-9609-4657-8226-e10d3feca1e2-1593424663018@3c-app-webde-bs30>
From: joshua_peter@web.de
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Aw: Re: Questions about PVH memory layout
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2020 11:57:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200629085758.GE735@Air-de-Roger>
References: <trinity-b65f5be3-8ffe-4ce5-a1e9-88e512959fc5-1593327494913@3c-app-webde-bap42>
 <20200629085758.GE735@Air-de-Roger>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:wHaBkn4x47uyB+TSXlHaBfdcH/o41086w8iOhSpoxSLCqkO4FmqrVWeu4IOQFfeI1q1x/
 XDxppZ6R+2uitgMnkJJUZClhlHpVH9ZMoDjHjC7LzDw42Zm4aKaAtB5WoSPCkvQaVfVjkqX5r3WQ
 5vIVxW0Xk61ScduwA55/i/+9s+FIVhjtM2G20NX/fAclPsNyDurEj4UcnAl9nuq0lI0Aqu7EBsm6
 +favt9GJfwlcx0n5uMx4LbQBdjALJr0sHbOLUD/2+PjZ/bV7E/RG25EjLRBeyHQfE6KSlD4NLxQR
 ZI=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SLQln+3Toao=:2rlSCgt25VFEwEDSPIr4VC
 6a6cBrYNz86IpCofQpsIThgzVsDrwNOAoPv2hFtlWevm7W0BmPBNCuS8fDjKUhMsxLPWhEeBV
 KqSNegLGG4K0ih0wAU6zfgTsIuNuYBh4fzQBHM3FN7apRXOwECrAy8AfHYAN4EAqqZ+xc4dPU
 2evCJLAUGHBDY1TOENWP6UA3d4t12rjch6rx8aqwlz2PWrM3np3zE8fXLLETamhYtWeC4lKCl
 E8jGZ6ZQ1pm42aEYvvOl+oUabml52kTQX7LCwR9uwWRAzFKGGbnEiV3Oe6+QClRcKCFIm+eIp
 WjoPbxxDump0JbKG++avMF+MTzpZbCO7MTZgJ54EHIVKMuv9zJovtNaFKCLHXUvvOk30EIx/7
 6YCBHASj/Y6uUzlZPpXyo9DCnQgHqXjNOmvBYkdWlC/kyuKVSgFhV84TPt5M7f9/9nlmprTTZ
 pSzGe1D681V1c9UyYCEsOuhEoNROsPAe0dEGw/0N1tH5pRZNIpwqln37eE7JcHAeo25UK+M3J
 SSBNvfZJUFgCzK7AGawvIhgOX+7geXw2m3UjPQ+ozVfVEGqMR/8FTLwxDBHaYdidcuMGQRfnj
 4wcI6D2OQwhso2u4rkXId+iHollGgLUIkQE7/DL0vDNC1J2/Qw9Pye0ZX3/9U0se4mIFo4/hM
 6QoDY0O4RyjPC3oadmCKj1RpGCjpDRlskosGuBjkbhQCXU2AR0d1fPfNkR/xaJ5AKugo=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

thank you very much for your help=2E Further replies are inline=2E

> Gesendet: Montag, 29=2E Juni 2020 um 10:57 Uhr
> Von: "Roger Pau Monn=C3=A9" <roger=2Epau@citrix=2Ecom>
> An: joshua_peter@web=2Ede
> Cc: xen-devel@lists=2Exenproject=2Eorg
> Betreff: Re: Questions about PVH memory layout
>
> > The other
> > thing is, the first 512 pages at the beginning of the address space ar=
e
> > mapped linearly, which usually leads to them being mapped as a single
> > 2MB pages=2E But there is this one page at 0x00001000 that sticks out
> > completely=2E By that I mean (to make things more concrete), in my PVH
> > guest the page at 0x00000000 maps to 0x13C200000, 0x00002000 maps to
> > 0x13C202000, 0x00003000 maps to 0x13C203000, etc=2E But 0x00001000 map=
s
> > to 0xB8DBD000, which seems very odd to me (at least from simply lookin=
g
> > at the addresses)=2E
>=20
> Are you booting some OS on the guest before dumping the memory map?
> Keep in mind guest have the ability to modify the physmap, either by
> mapping Xen shared areas (like the shared info page) or just by using
> ballooning in order to poke holes into it (which can be populated
> later)=2E It's either that or some kind of bug/missoptimization in
> meminit_hvm (also part of tools/libxc/xc_dom_x86=2Ec)=2E

Yes, my bad=2E I'm booting into Arch Linux=2E This must have been lost whi=
le I
was editing my e-mail=2E

> Can you check if this 'weird' mapping at 0x1000 is also present if you
> boot the guest with 'xl create -p foo=2Ecfg'? (that will prevent the
> guests from running, so that you can get the memory map before the
> guest has modified it in any way)=2E

Yeah, starting with the "-p" flag does get rid of this 'weird' mapping=2E

Thank you again=2E This cleared up a bunch of things=2E

Best regards,
Peter

