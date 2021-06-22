Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257B3B0443
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 14:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145874.268306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvfR2-0006wf-PA; Tue, 22 Jun 2021 12:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145874.268306; Tue, 22 Jun 2021 12:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvfR2-0006ug-Ly; Tue, 22 Jun 2021 12:23:20 +0000
Received: by outflank-mailman (input) for mailman id 145874;
 Tue, 22 Jun 2021 12:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P8ns=LQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lvfR1-0006uV-0S
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 12:23:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ace219bf-7234-42e6-820e-de6de085a632;
 Tue, 22 Jun 2021 12:23:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3CD032196D;
 Tue, 22 Jun 2021 12:23:17 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 04F75118DD;
 Tue, 22 Jun 2021 12:23:16 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 9hi+OjTW0WCLEAAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 22 Jun 2021 12:23:16 +0000
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
X-Inumbo-ID: ace219bf-7234-42e6-820e-de6de085a632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624364597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIIzQ0v9nG6I6oy8FGefgn9agrr42ubns73HDhdxzRQ=;
	b=d7zxMFyycD3VL6IuXR5GGObn1Bg4LSATrgFDPTtfk5s9KqS1++FQ2+HTxzUR4Lmbxmdjrj
	KonZv5mZ9UkbUmWjqSEivGFQlL5MFr8X8fLc3bnDHk0GwnA6d6zTGR60k1WPPrJfviCSaZ
	iid2W8qTeLCYqf1t2Qh1EAO+3HLXiqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624364597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIIzQ0v9nG6I6oy8FGefgn9agrr42ubns73HDhdxzRQ=;
	b=d7zxMFyycD3VL6IuXR5GGObn1Bg4LSATrgFDPTtfk5s9KqS1++FQ2+HTxzUR4Lmbxmdjrj
	KonZv5mZ9UkbUmWjqSEivGFQlL5MFr8X8fLc3bnDHk0GwnA6d6zTGR60k1WPPrJfviCSaZ
	iid2W8qTeLCYqf1t2Qh1EAO+3HLXiqk=
Subject: Re: Interrupt for port 19, but apparently not enabled; per-user
 000000004af23acc
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel@vger.kernel.org, mheyne@amazon.de
References: <6552fc66-ba19-2c77-7928-b0272d3e1622@xen.org>
 <4d8a7ba7-a9f6-2999-8750-bfe2b85f064e@suse.com>
 <9a08bbf2-ba6a-6e49-3bcb-bfe2beb32b99@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8dd2aa85-e3d3-2fe1-86dc-145bbadf921b@suse.com>
Date: Tue, 22 Jun 2021 14:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9a08bbf2-ba6a-6e49-3bcb-bfe2beb32b99@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Bf2ph7ybTNBsMgYU5NfRTZjCxgZxGn4K3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Bf2ph7ybTNBsMgYU5NfRTZjCxgZxGn4K3
Content-Type: multipart/mixed; boundary="ieGDTbGIV81r0dLyI4LUjpigFd7g1moSf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel@vger.kernel.org, mheyne@amazon.de
Message-ID: <8dd2aa85-e3d3-2fe1-86dc-145bbadf921b@suse.com>
Subject: Re: Interrupt for port 19, but apparently not enabled; per-user
 000000004af23acc
References: <6552fc66-ba19-2c77-7928-b0272d3e1622@xen.org>
 <4d8a7ba7-a9f6-2999-8750-bfe2b85f064e@suse.com>
 <9a08bbf2-ba6a-6e49-3bcb-bfe2beb32b99@xen.org>
In-Reply-To: <9a08bbf2-ba6a-6e49-3bcb-bfe2beb32b99@xen.org>

--ieGDTbGIV81r0dLyI4LUjpigFd7g1moSf
Content-Type: multipart/mixed;
 boundary="------------975C2C0ACCBF84BF28806F70"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------975C2C0ACCBF84BF28806F70
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.06.21 14:21, Julien Grall wrote:
> Hi Juergen,
>=20
> On 22/06/2021 13:04, Juergen Gross wrote:
>> On 22.06.21 12:24, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> As discussed on IRC yesterday, we noticed a couple of splat in 5.13-r=
c6=20
>>
>>> (and stable 5.4) in the evtchn driver:
>>>
>>> [=C2=A0=C2=A0=C2=A0 7.581000] ------------[ cut here ]------------
>>> [=C2=A0=C2=A0=C2=A0 7.581899] Interrupt for port 19, but apparently n=
ot=20
>> enabled;
>>> per-user 000000004af23acc
>>> [=C2=A0=C2=A0=C2=A0 7.583401] WARNING: CPU: 0 PID: 467 at=20
>>> /home/ANT.AMAZON.COM/jgrall/works/oss/linux/drivers/xen/evtchn.c:169 =

>>> evtchn_interrupt+0xd5/0x100
>>> [=C2=A0=C2=A0=C2=A0 7.585583] Modules linked in:
>>> [=C2=A0=C2=A0=C2=A0 7.586188] CPU: 0 PID: 467 Comm: xenstore-read Not=20
tainted=20
>>> 5.13.0-rc6 #240
>>> [=C2=A0=C2=A0=C2=A0 7.587462] Hardware name: QEMU Standard PC (Q35 + =
ICH9, 2009),=20
>>> BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
>>> [=C2=A0=C2=A0=C2=A0 7.589462] RIP: e030:evtchn_interrupt+0xd5/0x100
>>> [=C2=A0=C2=A0=C2=A0 7.590361] Code: 48 8d bb d8 01 00 00 ba 01 00 00 =
00=20
>> be 1d 00 00 00
>>> e8 5f 72 c4 ff eb b2 8b 75 20 48 89 da 48 c7 c7 a8 03 5f 82 e8 6b 2d =
96=20
>>
>>> ff <0f> 0b e9 4d ff ff ff 41 0f b6 f4 48 c7 c7 80 da a2 82 e8 f0
>>> [=C2=A0=C2=A0=C2=A0 7.593662] RSP: e02b:ffffc90040003e60 EFLAGS: 0001=
0082
>>> [=C2=A0=C2=A0=C2=A0 7.594636] RAX: 0000000000000000 RBX: ffff88810232=
8c00 RCX:=20
>>> 0000000000000027
>>> [=C2=A0=C2=A0=C2=A0 7.595924] RDX: 0000000000000000 RSI: ffff88817fe1=
8ad0 RDI:=20
>>> ffff88817fe18ad8
>>> [=C2=A0=C2=A0=C2=A0 7.597216] RBP: ffff888108ef8140 R08: 000000000000=
0000 R09:=20
>>> 0000000000000001
>>> [=C2=A0=C2=A0=C2=A0 7.598522] R10: 0000000000000000 R11: 707572726574=
6e49 R12:=20
>>> 0000000000000000
>>> [=C2=A0=C2=A0=C2=A0 7.599810] R13: ffffc90040003ec4 R14: ffff8881001b=
8000 R15:=20
>>> ffff888109b36f80
>>> [=C2=A0=C2=A0=C2=A0 7.601113] FS:=C2=A0 0000000000000000(0000) GS:fff=
f88817fe00000(0000)=20
>>> knlGS:0000000000000000
>>> [=C2=A0=C2=A0=C2=A0 7.602570] CS:=C2=A0 10000e030 DS: 0000 ES: 0000 C=
R0:0000000080050033
>>> [=C2=A0=C2=A0=C2=A0 7.603700] CR2: 00007f15b390e368 CR3: 000000010bb0=
4000 CR4:=20
>>> 0000000000050660
>>> [=C2=A0=C2=A0=C2=A0 7.604993] Call Trace:
>>> [=C2=A0=C2=A0=C2=A0 7.605501]=C2=A0 <IRQ>
>>> [=C2=A0=C2=A0=C2=A0 7.605929]=C2=A0 __handle_irq_event_percpu+0x4c/0x=
330
>>> [=C2=A0=C2=A0=C2=A0 7.606817]=C2=A0 handle_irq_event_percpu+0x32/0xa0=

>>> [=C2=A0=C2=A0=C2=A0 7.607670]=C2=A0 handle_irq_event+0x3a/0x60
>>> [=C2=A0=C2=A0=C2=A0 7.608416]=C2=A0 handle_edge_irq+0x9b/0x1f0
>>> [=C2=A0=C2=A0=C2=A0 7.609154]=C2=A0 generic_handle_irq+0x4f/0x60
>>> [=C2=A0=C2=A0=C2=A0 7.609918]=C2=A0 __evtchn_fifo_handle_events+0x195=
/0x3a0
>>> [=C2=A0=C2=A0=C2=A0 7.610864]=C2=A0 __xen_evtchn_do_upcall+0x66/0xb0
>>> [=C2=A0=C2=A0=C2=A0 7.611693]=C2=A0 __xen_pv_evtchn_do_upcall+0x1d/0x=
30
>>> [=C2=A0=C2=A0=C2=A0 7.612582]=C2=A0 xen_pv_evtchn_do_upcall+0x9d/0xc0=

>>> [=C2=A0=C2=A0=C2=A0 7.613439]=C2=A0 </IRQ>
>>> [=C2=A0=C2=A0=C2=A0 7.613882]=C2=A0 exc_xen_hypervisor_callback+0x8/0=
x10
>>>
>>> This is quite similar to the problem I reported a few months ago (see=20

>>> [1]) but this time this is happening with fifo rather than 2L.
>>>
>>> I haven't been able to reproduced it reliably so far. But looking at =

>>> the code, I think I have found another potential race after commit
>>>
>>> commit b6622798bc50b625a1e62f82c7190df40c1f5b21
>>> Author: Juergen Gross <jgross@suse.com>
>>> Date:=C2=A0=C2=A0 Sat Mar 6 17:18:33 2021 +0100
>>> =C2=A0=C2=A0=C2=A0 xen/events: avoid handling the same event on two c=
pusat the same=20
>>> time
>>> =C2=A0=C2=A0=C2=A0 When changing the cpu affinity of an event it can =
happen today that
>>> =C2=A0=C2=A0=C2=A0 (with some unlucky timing) the same event will be =
handled=20
>> on the old
>>> =C2=A0=C2=A0=C2=A0 and the new cpu at the same time.
>>> =C2=A0=C2=A0=C2=A0 Avoid that by adding an "event active" flag to the=20
per-event data=20
>>> and
>>> =C2=A0=C2=A0=C2=A0 call the handler only if this flag isn't set.
>>> =C2=A0=C2=A0=C2=A0 Cc: stable@vger.kernel.org
>>> =C2=A0=C2=A0=C2=A0 Reported-by: Julien Grall <julien@xen.org>
>>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Juergen Gross <jgross@suse.com>
>>> =C2=A0=C2=A0=C2=A0 Reviewed-by: Julien Grall <jgrall@amazon.com>
>>> =C2=A0=C2=A0=C2=A0 Link:=20
>>> https://lore.kernel.org/r/20210306161833.4552-4-jgross@suse.com
>>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Boris Ostrovsky <boris.ostrovsky@or=
acle.com>
>>>
>>> The evtchn driver will use the lateeoi handlers. So the code to ack=20
>>> looks like:
>>>
>>> do_mask(..., EVT_MASK_REASON_EOI_PENDING)
>>> smp_store_release(&info->is_active, 0);
>>> clear_evtchn(info->evtchn);
>>>
>>> The code to handle an interrupts look like:
>>>
>>> clear_link(...)
>>> if ( evtchn_fifo_is_pending(port) && !evtchn_fifo_is_mask()) {
>>> =C2=A0=C2=A0 if (xchg_acquire(&info->is_active, 1)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0 generic_handle_irq();
>>> }
>>>
>>> After changing the affinity, an interrupt may be received once on the=20

>>> previous vCPU. So, I think the following can happen:
>>>
>>> vCPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | vCPU1
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0Receive event=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | change affinity to vCPU1
>>> =C2=A0=C2=A0clear_link()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* The interrupt is re-raised */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | receive event
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | /* The interrupt is not masked =
*/
>>> =C2=A0=C2=A0info->is_active =3D 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0do_mask(...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0info->is_active =3D 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | info->is_active =3D 1
>>> =C2=A0=C2=A0clear_evtchn(...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | do_mask(...)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | info->is_active =
=3D 0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | clear_evtchn(...)
>>>
>>> Does this look plausible to you?
>>
>> Yes, it does.
>>
>> Thanks for the analysis.
>>
>> So I guess for lateeoi events we need to clear is_active only in
>> xen_irq_lateeoi()? At a first glance this should fix the issue.
>=20
> It should work and would be quite neat. But, I believe clear_evtchn()=20
> would have to stick in the ack helper to avoid losing interrupts.

I agree.

Preparing a patch ...


Juergen


--------------975C2C0ACCBF84BF28806F70
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------975C2C0ACCBF84BF28806F70--

--ieGDTbGIV81r0dLyI4LUjpigFd7g1moSf--

--Bf2ph7ybTNBsMgYU5NfRTZjCxgZxGn4K3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDR1jQFAwAAAAAACgkQsN6d1ii/Ey8d
dQgAjloi4X5EXiWIATOsp2GOOBKyT69h1TcxcQD2N/VSpTDR6cjhptnQf8la1ei/dg/oiqBc/1Us
WyCr97FqVEIYPdwHvOwyl+dIlls81ymOxjFTBk56Nq+XLKW66SB3Y3QgFXuUhw84mNAm3yG8M6ND
+XphS1K04D18jaVgB+38mnbdW1Zmjma0hXJVpd3J6fuasq79zM4qp0m889GZkECEa/nn+PnvqxwK
9VwGs4fFqhdI3LkconOyyZNlJYtgctyTLZPPUNps8Upz1iy9asGwCsXv8wWji/AfTO7CyMrzqPWh
LGyDCwp3l3t642b8c/RWmv8PrTp7pxlhuBbTCqYY2w==
=AXI/
-----END PGP SIGNATURE-----

--Bf2ph7ybTNBsMgYU5NfRTZjCxgZxGn4K3--

