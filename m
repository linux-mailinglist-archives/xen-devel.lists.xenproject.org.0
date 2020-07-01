Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D02210382
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 07:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqVm4-0003P9-Mz; Wed, 01 Jul 2020 05:59:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C8Y=AM=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jqVm3-0003P1-86
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 05:59:11 +0000
X-Inumbo-ID: fbd390e9-bb5f-11ea-86cd-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fbd390e9-bb5f-11ea-86cd-12813bfff9fa;
 Wed, 01 Jul 2020 05:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593583150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yp53qNv2a6t0Mz/ydfPlIxanTqAlC2QRvorB2eFQvzo=;
 b=aJrNXhnnDqf09lVs04jBHMq+KmuFQ4uBEGj9Al5rYrpCRxJcx/7S8COWWtT9U/vEwObIPW
 PaEsjZ5lZIUxD7tY0IYUuektE3jj2kTy6dtxUIM6BFqZ7VXertA3rdG7r318CbT86cmPzJ
 Bpo1FiMnrACZt6u3oG5WfF4FxYV0u4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-9GxAnRZcPomIJdFk8qov4Q-1; Wed, 01 Jul 2020 01:59:07 -0400
X-MC-Unique: 9GxAnRZcPomIJdFk8qov4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B96800C64;
 Wed,  1 Jul 2020 05:59:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E83F574191;
 Wed,  1 Jul 2020 05:59:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 954E011384A6; Wed,  1 Jul 2020 07:59:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
 <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
Date: Wed, 01 Jul 2020 07:59:01 +0200
In-Reply-To: <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 30 Jun 2020 19:27:22
 +0200")
Message-ID: <877dvndbdm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: 'Eduardo Habkost' <ehabkost@redhat.com>,
 'Jason Andryuk' <jandryuk@gmail.com>, 'Paul Durrant' <pdurrant@amazon.com>,
 paul@xen.org, qemu-devel@nongnu.org, "'Michael S. Tsirkin'" <mst@redhat.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/30/20 5:44 PM, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> Sent: 30 June 2020 16:26
>>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; qemu-d=
evel@nongnu.org
>>> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin <mst@redh=
at.com>; Paul Durrant
>>> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo Bonzin=
i <pbonzini@redhat.com>;
>>> Richard Henderson <rth@twiddle.net>
>>> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>>>
>>> On 6/24/20 2:18 PM, Paul Durrant wrote:
>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>
>>>> The generic pc_machine_initfn() calls pc_system_flash_create() which c=
reates
>>>> 'system.flash0' and 'system.flash1' devices. These devices are then re=
alized
>>>> by pc_system_flash_map() which is called from pc_system_firmware_init(=
) which
>>>> itself is called via pc_memory_init(). The latter however is not calle=
d when
>>>> xen_enable() is true and hence the following assertion fails:
>>>>
>>>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
>>>> Assertion `dev->realized' failed
>>>>
>>>> These flash devices are unneeded when using Xen so this patch avoids t=
he
>>>> assertion by simply removing them using pc_system_flash_cleanup_unused=
().
>>>>
>>>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>>>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockde=
v")
>>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
>>>> ---
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> Cc: Richard Henderson <rth@twiddle.net>
>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>>> ---
>>>>  hw/i386/pc_piix.c    | 9 ++++++---
>>>>  hw/i386/pc_sysfw.c   | 2 +-
>>>>  include/hw/i386/pc.h | 1 +
>>>>  3 files changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>> index 1497d0e4ae..977d40afb8 100644
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
>>>>      if (!xen_enabled()) {
>>>>          pc_memory_init(pcms, system_memory,
>>>>                         rom_memory, &ram_memory);
>>>> -    } else if (machine->kernel_filename !=3D NULL) {
>>>> -        /* For xen HVM direct kernel boot, load linux here */
>>>> -        xen_load_linux(pcms);
>>>> +    } else {
>>>> +        pc_system_flash_cleanup_unused(pcms);
>>>
>>> TIL pc_system_flash_cleanup_unused().
>>>
>>> What about restricting at the source?
>>>
>>=20
>> And leave the devices in place? They are not relevant for Xen, so why no=
t clean up?
>
> No, I meant to not create them in the first place, instead of
> create+destroy.

Better.  Opinion, not demand :)

[...]


