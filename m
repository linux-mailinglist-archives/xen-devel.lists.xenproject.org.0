Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1308B0ADA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 15:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711397.1111441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcgd-0002Pg-2V; Wed, 24 Apr 2024 13:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711397.1111441; Wed, 24 Apr 2024 13:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcgc-0002N8-W6; Wed, 24 Apr 2024 13:29:22 +0000
Received: by outflank-mailman (input) for mailman id 711397;
 Wed, 24 Apr 2024 12:33:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B/QA=L5=posteo.de=th.huth@srs-se1.protection.inumbo.net>)
 id 1rzboE-0004cT-AJ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:33:10 +0000
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea97cba-0236-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 14:33:09 +0200 (CEST)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 7ECA1240027
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 14:33:08 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VPdgC5dCpz6twh;
 Wed, 24 Apr 2024 14:32:55 +0200 (CEST)
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
X-Inumbo-ID: cea97cba-0236-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1713961988; bh=9Ev9618ma5vERQhBo1JV5P5yZ6fPuNrS0jsrcfWeBHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ptv7qhbbNkf//eI2Nh9He1fmIKvifrvkBbId62jUXUbHffLCiCgT2gC/UxCD40QJf
	 S/csiDg+SiKUem4x+H9XEYjGhmVzrjVJItNNweoSQu88/HZdoxqMsLQB6zMCJEFflH
	 nqgkUP+6VeQC0qXurWQazaL7sS6hLcvRhJebf1NLm7lE+yaxV/bFwVQXYIm16NmwoO
	 Ua/ltPSIkQrhjQrfL1HGbCG9QVhXn1X/ZYhr/EomV4N6v9hUVEgWGcQy6EQ4jNAU68
	 Y/hCZ/ePP9xAwMjuBu+1gd1+3t+8ormTy2IWarKJuy11QfazKZI2+br5yTFAHVgMau
	 NC1DWjGe6L8Jw==
Message-ID: <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
Date: Wed, 24 Apr 2024 12:32:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
To: Prasad Pandit <pj.pandit@yahoo.in>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
 <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
 <1497808863.2030924.1713955286878@mail.yahoo.com>
From: Thomas Huth <th.huth@posteo.de>
Content-Language: en-US
In-Reply-To: <1497808863.2030924.1713955286878@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/04/2024 12.41, Prasad Pandit wrote:
> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe Mathieu-Daudé wrote:
>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>> device is engaging in I/O. The network device backend needs to update it
>>> when delivering a packet to a device.
>>>   
>>> In preparation for such a change, add MemReentrancyGuard * as a
>>> parameter of qemu_new_nic().
>>
>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>> any clue?
> 
> * CVE-2021-20255 bug: infinite recursion is pointing at a different fix patch.
>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
> 
> * And the this patch below has different issue tagged
>    -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>    Fixes: CVE-2023-3019
> 
> 
> * They look different, former is an infinite recursion issue and the latter is a use-after-free one.

I assume the eepro reentrancy issue has been fixed with:

  https://gitlab.com/qemu-project/qemu/-/issues/556
  i.e.:
  https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3

  HTH,
   Thomas



