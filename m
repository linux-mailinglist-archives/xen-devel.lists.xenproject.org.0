Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1F211AC8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 05:56:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqqJt-0004qg-72; Thu, 02 Jul 2020 03:55:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wviA=AN=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jqqJs-0004qb-Cb
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 03:55:28 +0000
X-Inumbo-ID: dd30e074-bc17-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dd30e074-bc17-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 03:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593662126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmn5R5crZf3r748cF/7g0FhkHnoY7WFTkWnSXgnl0xM=;
 b=XHFkZAkpi/JEZGizroWtqzFmPFp4ZuAgpAWZDMRlktbQK1UXKQCHsiqLdWOQpA00LeOcSp
 XXbRUiOIagluDGUo+SOJ0Z0dzdKCoJA/q8GO/ZaIIlo0QaF2YNqUnT5VNV5H7GH6hfEC6y
 LNH6xgQhMmK4N6k2X8+yzkVJ+hn2/4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-vQ6EYvkyNXOqhjKkymAqsw-1; Wed, 01 Jul 2020 23:55:24 -0400
X-MC-Unique: vQ6EYvkyNXOqhjKkymAqsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995158015F7;
 Thu,  2 Jul 2020 03:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35CC479243;
 Thu,  2 Jul 2020 03:55:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9937511384A6; Thu,  2 Jul 2020 05:55:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
 <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
 <000801d64f75$c604f570$520ee050$@xen.org>
 <CAKf6xpvNTVqK263pdSARyoWnzP8g9SRoSqvhnLLwyYadjR1ChQ@mail.gmail.com>
Date: Thu, 02 Jul 2020 05:55:17 +0200
In-Reply-To: <CAKf6xpvNTVqK263pdSARyoWnzP8g9SRoSqvhnLLwyYadjR1ChQ@mail.gmail.com>
 (Jason Andryuk's message of "Wed, 1 Jul 2020 08:25:40 -0400")
Message-ID: <87o8oy8tay.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <pdurrant@amazon.com>,
 Paul Durrant <paul@xen.org>, QEMU <qemu-devel@nongnu.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk <jandryuk@gmail.com> writes:

> On Wed, Jul 1, 2020 at 3:03 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>>
>> > -----Original Message-----
>> > From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > Sent: 30 June 2020 18:27
>> > To: paul@xen.org; xen-devel@lists.xenproject.org; qemu-devel@nongnu.or=
g
>> > Cc: 'Eduardo Habkost' <ehabkost@redhat.com>; 'Michael S. Tsirkin' <mst=
@redhat.com>; 'Paul Durrant'
>> > <pdurrant@amazon.com>; 'Jason Andryuk' <jandryuk@gmail.com>; 'Paolo Bo=
nzini' <pbonzini@redhat.com>;
>> > 'Richard Henderson' <rth@twiddle.net>
>> > Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>> >
>> > On 6/30/20 5:44 PM, Paul Durrant wrote:
>> > >> -----Original Message-----
>> > >> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > >> Sent: 30 June 2020 16:26
>> > >> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; qe=
mu-devel@nongnu.org
>> > >> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin <mst@=
redhat.com>; Paul Durrant
>> > >> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo Bo=
nzini <pbonzini@redhat.com>;
>> > >> Richard Henderson <rth@twiddle.net>
>> > >> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>> > >>
>> > >> On 6/24/20 2:18 PM, Paul Durrant wrote:
>> > >>> From: Paul Durrant <pdurrant@amazon.com>
>> > >>>
>> > >>> The generic pc_machine_initfn() calls pc_system_flash_create() whi=
ch creates
>> > >>> 'system.flash0' and 'system.flash1' devices. These devices are the=
n realized
>> > >>> by pc_system_flash_map() which is called from pc_system_firmware_i=
nit() which
>> > >>> itself is called via pc_memory_init(). The latter however is not c=
alled when
>> > >>> xen_enable() is true and hence the following assertion fails:
>> > >>>
>> > >>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properl=
y:
>> > >>> Assertion `dev->realized' failed
>> > >>>
>> > >>> These flash devices are unneeded when using Xen so this patch avoi=
ds the
>> > >>> assertion by simply removing them using pc_system_flash_cleanup_un=
used().
>> > >>>
>> > >>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>> > >>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blo=
ckdev")
>> > >>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>> > >>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
>> > >>> ---
>> > >>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> > >>> Cc: Richard Henderson <rth@twiddle.net>
>> > >>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> > >>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> > >>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> > >>> ---
>> > >>>  hw/i386/pc_piix.c    | 9 ++++++---
>> > >>>  hw/i386/pc_sysfw.c   | 2 +-
>> > >>>  include/hw/i386/pc.h | 1 +
>> > >>>  3 files changed, 8 insertions(+), 4 deletions(-)
>> > >>>
>> > >>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> > >>> index 1497d0e4ae..977d40afb8 100644
>> > >>> --- a/hw/i386/pc_piix.c
>> > >>> +++ b/hw/i386/pc_piix.c
>> > >>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
>> > >>>      if (!xen_enabled()) {
>> > >>>          pc_memory_init(pcms, system_memory,
>> > >>>                         rom_memory, &ram_memory);
>> > >>> -    } else if (machine->kernel_filename !=3D NULL) {
>> > >>> -        /* For xen HVM direct kernel boot, load linux here */
>> > >>> -        xen_load_linux(pcms);
>> > >>> +    } else {
>> > >>> +        pc_system_flash_cleanup_unused(pcms);
>> > >>
>> > >> TIL pc_system_flash_cleanup_unused().
>> > >>
>> > >> What about restricting at the source?
>> > >>
>> > >
>> > > And leave the devices in place? They are not relevant for Xen, so wh=
y not clean up?
>> >
>> > No, I meant to not create them in the first place, instead of
>> > create+destroy.
>> >
>> > Anyway what you did works, so I don't have any problem.
>>
>> IIUC Jason originally tried restricting creation but encountered a probl=
em because xen_enabled() would always return false at that point, because m=
achine creation occurs before accelerators are initialized.
>
> Correct.  Quoting my previous email:
> """
> Removing the call to pc_system_flash_create() from pc_machine_initfn()
> lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
> there since accelerators have not been initialized yes, I guess?
> """
>
> If you want to remove the creation in the first place, then I have two
> questions.  Why does pc_system_flash_create()/pc_pflash_create() get
> called so early creating the pflash devices?  Why aren't they just
> created as needed in pc_system_flash_map()?

commit ebc29e1beab02646702c8cb9a1d29b68f72ad503

    pc: Support firmware configuration with -blockdev

    [...]

    Properties need to be created in .instance_init() methods.  For PC
    machines, that's pc_machine_initfn().  To make alias properties work,
    we need to create the onboard flash devices there, too.  [...]

For context, read the entire commit message.  If you have questions
then, don't hesitate to ask them here.


