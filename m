Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635D8B3C59
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 18:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712961.1113880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0O2O-0002GN-Tz; Fri, 26 Apr 2024 16:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712961.1113880; Fri, 26 Apr 2024 16:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0O2O-0002Er-QK; Fri, 26 Apr 2024 16:03:00 +0000
Received: by outflank-mailman (input) for mailman id 712961;
 Fri, 26 Apr 2024 16:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuLa=L7=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1s0O2N-0002El-CF
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 16:02:59 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728b770d-03e6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 18:02:57 +0200 (CEST)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4DD354E606E;
 Fri, 26 Apr 2024 18:02:56 +0200 (CEST)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 5wk-KGWAIU7m; Fri, 26 Apr 2024 18:02:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 10E744E605B; Fri, 26 Apr 2024 18:02:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D42974570D;
 Fri, 26 Apr 2024 18:02:54 +0200 (CEST)
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
X-Inumbo-ID: 728b770d-03e6-11ef-909a-e314d9c70b13
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Fri, 26 Apr 2024 18:02:54 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth <th.huth@posteo.de>, 
    Prasad Pandit <pj.pandit@yahoo.in>, 
    Mauro Matteo Cascella <mcascell@redhat.com>, 
    Alexander Bulekov <alxndr@bu.edu>, 
    Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
    Beniamino Galvani <b.galvani@gmail.com>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
    Jason Wang <jasowang@redhat.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
    Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Helge Deller <deller@gmx.de>, 
    Sriram Yagnaraman <sriram.yagnaraman@est.tech>, 
    Thomas Huth <huth@tuxfamily.org>, 
    Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
    Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
    Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
    Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
    Harsh Prateek Bora <harshpb@linux.ibm.com>, 
    Sven Schnelle <svens@stackframe.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
    "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
    "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
    "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
In-Reply-To: <e2fb1d51-b5a6-4c25-a9af-af1e1ed42475@linaro.org>
Message-ID: <2691730d-795b-d60c-0932-f2e941343d91@eik.bme.hu>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com> <20230601031859.7115-2-akihiko.odaki@daynix.com> <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org> <1497808863.2030924.1713955286878@mail.yahoo.com> <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
 <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com> <e2fb1d51-b5a6-4c25-a9af-af1e1ed42475@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-78233328-1714147374=:20485"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-78233328-1714147374=:20485
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 26 Apr 2024, Philippe Mathieu-Daudé wrote:
> On 26/4/24 14:37, Akihiko Odaki wrote:
>> On 2024/04/24 21:32, Thomas Huth wrote:
>>> On 24/04/2024 12.41, Prasad Pandit wrote:
>>>> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe Mathieu-Daudé 
>>>> wrote:
>>>>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>>>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>>>>> device is engaging in I/O. The network device backend needs to update 
>>>>>> it
>>>>>> when delivering a packet to a device.
>>>>>> In preparation for such a change, add MemReentrancyGuard * as a
>>>>>> parameter of qemu_new_nic().
>>>>> 
>>>>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>>>>> any clue?
>>>> 
>>>> * CVE-2021-20255 bug: infinite recursion is pointing at a different fix 
>>>> patch.
>>>>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
>>>> 
>>>> * And the this patch below has different issue tagged
>>>> -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>>>>    Fixes: CVE-2023-3019
>>>> 
>>>> 
>>>> * They look different, former is an infinite recursion issue and the 
>>>> latter is a use-after-free one.
>>> 
>>> I assume the eepro reentrancy issue has been fixed with:
>>> 
>>>   https://gitlab.com/qemu-project/qemu/-/issues/556
>>>   i.e.:
>>>   https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3
>> 
>> I agree. Commit c40ca2301c7603524eaddb5308a3 should be what fixed 
>> CVE-2021-20255, not this patch.
>
> Thank you all for clarifying!

$ git log -p c40ca2301c7603524eaddb5308a3 --
fatal: bad revision 'c40ca2301c7603524eaddb5308a3'

It seems to actually be commit a2e1753b8054344f32cf94f31c6399a58794a380

Regards,
BALATON Zoltan
--3866299591-78233328-1714147374=:20485--

