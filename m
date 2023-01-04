Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F365D838
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 17:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471289.731085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6NX-00064a-7L; Wed, 04 Jan 2023 16:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471289.731085; Wed, 04 Jan 2023 16:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6NX-00061s-3Z; Wed, 04 Jan 2023 16:12:35 +0000
Received: by outflank-mailman (input) for mailman id 471289;
 Wed, 04 Jan 2023 16:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD6NW-00061k-JW
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 16:12:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9869fabb-8c4a-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 17:12:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id ud5so83878412ejc.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 08:12:33 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 lj2-20020a170906f9c200b007a4e02e32ffsm15454154ejb.60.2023.01.04.08.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 08:12:32 -0800 (PST)
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
X-Inumbo-ID: 9869fabb-8c4a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=govlnVA/VYqvVYKVSZE+CubqtU9g2EyfrdDcVjmMz6Y=;
        b=hk0Ny9eqmlchaMtYq7vYJnD2Xmrs4Tdbt0M/fiPj9+Csj1z3CNL44oGwDKK7yRjdRv
         1GdpucAx2w2stB9XA7MInVGx4tWEX53dQDzTKfVvI8RD94sYVc9V3XySjo5UpSkEklwC
         +CHaz0G97T/v2UggrwM4/Q/JJ/92B3hhQmSQNduXZ0astWp1XVfTMeWdTeDmV1hPxwf4
         NqCdGLvOcxw5C16GR0why6KidTYpZEWceNhodGD75yk/jbINnVgg4DFew3nfk410nY0X
         0exWpyG1wsR6uA9qu1lmrXlrntfKKHI87YrgZmVEyzgYnUF0kOEAWU0acaw4J/zZaj+n
         RyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=govlnVA/VYqvVYKVSZE+CubqtU9g2EyfrdDcVjmMz6Y=;
        b=KBB0iShlqRZWDZGlsEFMHP9QGhGoSmI5/2+0c0UJaDtQ1K7E0Rwk6GKyVMzw3GTg6o
         XKenFBD9kfUNbkzaIN3MnMMrnmPdc0P+wT0AEQTr0WSCHsNmiE2iiUHWX0Evru3ikbeI
         KMx0BIRF5q9TlGIz+ihmAivtMo0cIOSgu5ky2h2wngdoF3pCkcwJrZg5or7YjwfYnRLo
         Ww5lNSsLJbnvZRlNPmxLpBIY3he4tZzRFh5FhFBuHiY5VqYj8O5+PVX6EMBVpsUqYHi+
         ndMMvInhcukopKHF0ElCv4KRxj8R8YkDynLHh+3zBivqHj0l8OCaf8It2KsCAdwtbOkw
         uXJQ==
X-Gm-Message-State: AFqh2kp9vVjqKQ6YooqwnEooM1Cs9ukJdFqHM1AyMZg96sOyk5z/nT3W
	hS4niovAl3hDtD8U9OUrKRg=
X-Google-Smtp-Source: AMrXdXtr3CdYAVbyb1GO2YeoRc3JJBajOiJ++PsT7D527I82IhxNk6hCymLzpQxg4HAA+IfNwMnr1Q==
X-Received: by 2002:a17:907:b684:b0:7c0:a99c:485c with SMTP id vm4-20020a170907b68400b007c0a99c485cmr45324433ejc.68.1672848752666;
        Wed, 04 Jan 2023 08:12:32 -0800 (PST)
Date: Wed, 04 Jan 2023 16:12:27 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <00094755-ca61-372d-0bcf-540fe2798f5c@aol.com>
References: <20230102213504.14646-1-shentey@gmail.com> <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com> <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org> <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com> <aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com> <AB058B2A-406E-487B-A1BA-74416C310B7A@gmail.com> <00094755-ca61-372d-0bcf-540fe2798f5c@aol.com>
Message-ID: <7E657325-705A-47EA-A334-0B59DF0DF772@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 4=2E Januar 2023 13:11:16 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/4/2023 7:13 AM, Bernhard Beschow wrote:
>> Am 4=2E Januar 2023 08:18:59 UTC schrieb Chuck Zmudzinski <brchuckz@aol=
=2Ecom>:
>> >On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
>> >>
>> >>
>> >> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daud=C3=A9 <philmd@l=
inaro=2Eorg> wrote:
>> >>
>> >>     Hi Chuck,
>> >>
>> >>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
>> >>     > On 1/2/23 4:34=E2=80=AFPM, Bernhard Beschow wrote:
>> >>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and=
 finally removes
>> >>     >> it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ t=
o make Xen in the PC
>> >>     >> machine agnostic to the precise southbridge being used=2E 2/ =
will become
>> >>     >> particularily interesting once PIIX4 becomes usable in the PC=
 machine, avoiding
>> >>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>> >>     >>
>> >>     >> Testing done:
>> >>     >> None, because I don't know how to conduct this properly :(
>> >>     >>
>> >>     >> Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>> >>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "[PATCH v4 00/30] Co=
nsolidate PIIX south bridges"
>> >>
>> >>     This series is based on a previous series:
>> >>     https://lore=2Ekernel=2Eorg/qemu-devel/20221221170003=2E2929-1-s=
hentey@gmail=2Ecom/
>> >>     (which itself also is)=2E
>> >>
>> >>     >> Bernhard Beschow (6):
>> >>     >>=C2=A0 =C2=A0 include/hw/xen/xen: Make xen_piix3_set_irq() gen=
eric and rename it
>> >>     >>=C2=A0 =C2=A0 hw/isa/piix: Reuse piix3_realize() in piix3_xen_=
realize()
>> >>     >>=C2=A0 =C2=A0 hw/isa/piix: Wire up Xen PCI IRQ handling outsid=
e of PIIX3
>> >>     >>=C2=A0 =C2=A0 hw/isa/piix: Avoid Xen-specific variant of piix_=
write_config()
>> >>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant k->config_write a=
ssignments
>> >>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DE=
VICE
>> >>     >>
>> >>     >>=C2=A0 =C2=A0hw/i386/pc_piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++--
>> >>     >>=C2=A0 =C2=A0hw/i386/xen/xen-hvm=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 9 +++--
>> >>     >>=C2=A0 =C2=A0hw/isa/piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 +----------------------------------
>> >>     >
>> >>     > This file does not exist on the Qemu master branch=2E
>> >>     > But hw/isa/piix3=2Ec and hw/isa/piix4=2Ec do exist=2E
>> >>     >
>> >>     > I tried renaming it from piix=2Ec to piix3=2Ec in the patch, b=
ut
>> >>     > the patch set still does not apply cleanly on my tree=2E
>> >>     >
>> >>     > Is this patch set re-based against something other than
>> >>     > the current master Qemu branch?
>> >>     >
>> >>     > I have a system that is suitable for testing this patch set, b=
ut
>> >>     > I need guidance on how to apply it to the Qemu source tree=2E
>> >>
>> >>     You can ask Bernhard to publish a branch with the full work,
>> >>
>> >>
>> >> Hi Chuck,
>> >>
>> >> =2E=2E=2E or just visit https://patchew=2Eorg/QEMU/20230102213504=2E=
14646-1-shentey@gmail=2Ecom/ =2E There you'll find a git tag with a complet=
e history and all instructions!
>> >>
>> >> Thanks for giving my series a test ride!
>> >>
>> >> Best regards,
>> >> Bernhard
>> >>
>> >>     or apply each series locally=2E I use the b4 tool for that:
>> >>     https://b4=2Edocs=2Ekernel=2Eorg/en/latest/installing=2Ehtml
>> >>
>> >>     i=2Ee=2E:
>> >>
>> >>     $ git checkout -b shentey_work
>> >>     $ b4 am 20221120150550=2E63059-1-shentey@gmail=2Ecom
>> >>     $ git am
>> >>     =2E/v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south=
_bridges=2Embx
>> >>     $ b4 am 20221221170003=2E2929-1-shentey@gmail=2Ecom
>> >>     $ git am
>> >>     =2E/v4_20221221_shentey_this_series_consolidates_the_implementat=
ions_of_the_piix3_and_piix4_south=2Embx
>> >>     $ b4 am 20230102213504=2E14646-1-shentey@gmail=2Ecom
>> >>     $ git am =2E/20230102_shentey_resolve_type_piix3_xen_device=2Emb=
x
>> >>
>> >>     Now the branch 'shentey_work' contains all the patches and you c=
an test=2E
>> >>
>> >>     Regards,
>> >>
>> >>     Phil=2E
>> >>
>> >
>> >Hi Phil and Bernard,
>> >
>> >I tried applying these 3 patch series on top of the current qemu
>> >master branch=2E
>> >
>> >Unfortunately, I saw a regression, so I can't give a tested-by tag yet=
=2E
>>
>> Hi Chuck,
>>
>> Thanks for your valuable test report! I think the culprit may be commit=
 https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2023-01/msg00102=2Eht=
ml where now 128 PIRQs are considered rather than four=2E I'll revisit my s=
eries and will prepare a v2 in the next days=2E I think there is no need fo=
r further testing v1=2E
>>
>> Thanks,
>> Bernhard
>
>Hi Bernhard,
>
>Thanks for letting me know I do not need to test v1 further=2E I agree th=
e
>symptoms are that it is an IRQ problem - it looks like IRQs associated wi=
th
>the emulated usb tablet device are not making it to the guest with the
>patched v1 piix device on xen=2E

All PCI IRQs were routed to PCI slot 0=2E This should be fixed in v2 now=
=2E

>I will be looking for your v2 in coming days and try it out also!

Thank you! Here it is: https://patchew=2Eorg/QEMU/20230104144437=2E27479-1=
-shentey@gmail=2Ecom/

Best regards,
Bernhard

>
>Best regards,
>
>Chuck
>
>>
>> >
>> >Here are the details of the testing I did so far:
>> >
>> >Xen only needs one target, the i386-softmmu target which creates
>> >the qemu-system-i386 binary that Xen uses for its device model=2E
>> >That target compiled and linked with no problems with these 3
>> >patch series applied on top of qemu master=2E I didn't try building
>> >any other targets=2E
>> >
>> >My tests used the xenfv machine type with the xen platform
>> >pci device, which is ordinarily called a xen hvm guest with xen
>> >paravirtualized network and block device drivers=2E It is based on the
>> >i440fx machine type and so emulates piix3=2E I tested the xen
>> >hvm guests with two different configurations as described below=2E
>> >
>> >I tested both Linux and Windows guests, with mixed results=2E With the
>> >current Qemu master (commit 222059a0fccf4 without the 3 patch
>> >series applied), all tested guest configurations work normally for bot=
h
>> >Linux and Windows guests=2E
>> >
>> >With these 3 patch series applied on top of the qemu master branch,
>> >which tries to consolidate piix3 and piix4 and resolve the xen piix3
>> >device that my guests use, I unfortunately got a regression=2E
>> >
>> >The regression occurred with a configuration that uses the qemu
>> >bochs stdvga graphics device with a vnc display, and the qemu
>> >usb-tablet device to emulate the mouse and keyboard=2E After applying
>> >the 3 patch series, the emulated mouse is not working at all for Linux
>> >guests=2E It works for Windows guests, but the mouse pointer in the
>> >guest does not follow the mouse pointer in the vnc window as closely
>> >as it does without the 3 patch series=2E So this is the bad news of a
>> >regression introduced somewhere in these 3 patch series=2E
>> >
>> >The good news is that by using guests in a configuration that does
>> >not use the qemu usb-tablet device or the bochs stdvga device but
>> >instead uses a real passed through usb3 controller with a real usb
>> >mouse and a real usb keyboard connected, and also the real sound
>> >card and vga device passed through and a 1920x1080 HDMI monitor,
>> >there is no regression introduced by the 3 patch series and both Linux
>> >and Windows guests in that configuration work perfectly=2E
>> >
>> >My next test will be to test Bernhard's published git tag without
>> >trying to merge the 3 patch series into master and see if that also
>> >has the regression=2E I also will double check that I didn't make
>> >any mistakes in merging the 3 patch series by creating the shentey_wor=
k
>> >branch with b4 and git as Phil described and compare that to my
>> >working tree=2E
>> >
>> >I also will try testing only the first series, then the first series a=
nd the
>> >second series, to try to determine in which of the 3 series the regres=
sion
>> >is introduced=2E
>> >
>> >Best regards,
>> >
>> >Chuck
>

