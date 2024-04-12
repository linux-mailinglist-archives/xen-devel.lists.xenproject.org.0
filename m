Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EEE8A32DC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 17:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704791.1101369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvJBL-0007Cb-Rg; Fri, 12 Apr 2024 15:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704791.1101369; Fri, 12 Apr 2024 15:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvJBL-00079Q-Oe; Fri, 12 Apr 2024 15:51:15 +0000
Received: by outflank-mailman (input) for mailman id 704791;
 Fri, 12 Apr 2024 15:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1s45=LR=bounce.vates.tech=bounce-md_30504962.6619586d.v1-804ca0ef3c9a466d9fec5ec3a2fb4456@srs-se1.protection.inumbo.net>)
 id 1rvJBK-00079K-CP
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 15:51:14 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b60cfa9-f8e4-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 17:51:11 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VGLdT4f8czDRHxF3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 15:51:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 804ca0ef3c9a466d9fec5ec3a2fb4456; Fri, 12 Apr 2024 15:51:09 +0000
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
X-Inumbo-ID: 7b60cfa9-f8e4-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712937069; x=1713197569;
	bh=03la/Fku9MF9N/hn89aFTB+r3ul5r5z7WB2sjnikZ8I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T7mWjvas/bb1bmzeHlsIkhH8XtjVKTw4LwzHTTHmhDwBcrNmulQxO9tsLeJA9c0Tn
	 YwZSkcVyWKvgafkEl7eFlmWY73Albmk7qDXnb55+j7GJhcz2u84X6DCK3MzFc8qD/x
	 6PvreV+OYyDpnJugk31CiUz4YZHlj3zIFX9OnQpvsjkFzl38x6DYgGYHZKDETxS0Q8
	 HT7DXHen4FvEP3qwGDcxKfRxiUYlO58bbGOBwLGmuYeThUnMIFv4pnR1IG3v5iqthd
	 KEWJeaQSVFY7vWG4KuJao/Xk0hy48+CLo/OhAYYdgAt7Kp7uTxJH1LaSGj6XKpG4wx
	 JqVuk6TYNbGfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712937069; x=1713197569; i=teddy.astie@vates.tech;
	bh=03la/Fku9MF9N/hn89aFTB+r3ul5r5z7WB2sjnikZ8I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qm6zaX6rIf32Wd2SxH7s4qOA126jll04yykmdUZf6xr76EmQyGjWuuDC35iMwaojW
	 otjWgdSJy5bSzaYhZuB+C//hA+98nQUyQrqESrKCDhRX4GhbR4fPKmGkbD8ISiSVur
	 rATNAnrcgV9JVWU4IdPqvXMTxDYoDs4t/RCVYUErcBelVuuOOb/gD873J7BxIN82hb
	 AAc9wBALjaZ48hbdTNVY2cUztXZjafSA4nPaPsu6iqZb/lfmknBuhrPa0HwNM3MEel
	 muaKHRogdEDIhBbMQeeTK/4W1M45YrT9K8BDv0746mCSgqbV4sLFDWTSSv8V5yJa5D
	 Vozt+sw9XWZUw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v3=200/3]=20x86/iommu:=20Drop=20IOMMU=20support=20when=20cx16=20isn't=20supported?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712937068440
Message-Id: <1e7bf9be-79b6-4147-a92d-37298685056a@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1712915011.git.teddy.astie@vates.tech> <727d038c-6401-47bf-b1a6-23a554c6154c@citrix.com>
In-Reply-To: <727d038c-6401-47bf-b1a6-23a554c6154c@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.804ca0ef3c9a466d9fec5ec3a2fb4456?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 15:51:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 12/04/2024 =C3=A0 16:49, Andrew Cooper a =C3=A9crit=C2=A0:

> 1) You introduced trailing whitespace in patch 1 in the middle line here:
> 
>> + ASSERT(spin_is_locked(&iommu->intremap.lock)); + + old_ire =3D *entry;

Good catch, will fix

> 2) In your commit messages, the grammar is a bit awkward.=C2=A0 It would =
be
> clearer to say:
> 
> "All hardware with VT-d/AMD-Vi has CMPXCHG16 support.=C2=A0 Check this at
> initialisation time, and remove the effectively-dead logic for the
> non-cx16 case."
> 
> just as you've done in the cover letter.

Yes

> 3) In patch 1, you shouldn't modify x2apic_bsp_setup() like that.
> x2APIC && no-IOMMU is a legal combination.
> 
> Instead, you should put a cx16 check in both driver's supports_x2apic()
> hooks.

In this case, you mean both intel_iommu_supports_eim and iov_supports_xt 
(AMD) ?

> 
> 4) In patch 3, you should drop the Suggested-by me.=C2=A0 You found that =
one
> all yourself.
>

Will change this.

Teddy

---


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


