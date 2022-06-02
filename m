Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B153C060
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 23:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341278.566492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwsP3-0004RW-AV; Thu, 02 Jun 2022 21:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341278.566492; Thu, 02 Jun 2022 21:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwsP3-0004OZ-6z; Thu, 02 Jun 2022 21:30:49 +0000
Received: by outflank-mailman (input) for mailman id 341278;
 Thu, 02 Jun 2022 21:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QKCk=WJ=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1nwsP2-0004OT-2Q
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 21:30:48 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43925484-e2bb-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 23:30:46 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id 14so4648889qkl.6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 14:30:46 -0700 (PDT)
Received: by 2002:ac8:7f14:0:0:0:0:0 with HTTP;
 Thu, 2 Jun 2022 14:30:45 -0700 (PDT)
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
X-Inumbo-ID: 43925484-e2bb-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=B/1eqqbHZnQqzfEJFI/2PMisMT8zWNIw4xhukZQmi8Q=;
        b=lCFMpTN4exoAZQ9n/fx4VXIwJwyfRwqE2Ui1VGvznjFtxo36qExWwecmrmeIgu1rWI
         wasYI8C7LdH7k2CbE5KZcax5XZ2KdWW1DhVtZuzYr6oF1bxYxV2q1xZqN4h6oupP/xhL
         /twg9f9HSpWVKu3wwePcw469DdYLgyoezQhu6WLRPAGCktT2J1gjYxr/HHVaL97zCpEu
         Utn+OIrLmERFLHOdnrIP/l9xkj2edr3Aeb7C4N948mC9oDCNlaS6jpTcazDuPFiCYRYr
         ofvBGZA+pG5+BUJebadb52KJsh26TZ2g1U+oJwvebpXd2JFfBYrjyiGKVg4Wbw/OVtJN
         UJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=B/1eqqbHZnQqzfEJFI/2PMisMT8zWNIw4xhukZQmi8Q=;
        b=tuFVi6X2B5S5bITuSXa9oAnrfhEWIascNSDCJ/MNaxhpv9lVeDXPMPojBeYDj7kjtv
         gQRh5duc/IJY0PW9GMW9OgFVkdUqqhWsnygRrBWhQ4u8+uuzCRxm04icJiBiow6+eWrI
         vCcPZ9wIOI7tPUlZl7d34e1LNfZvlTjhb9cm6ZW82jJtySj4xiaagPRENBADN4vzQTor
         lk849zKezLJ2kWEMsCopAx/DdfmScu5SqKMA24mRouU+nFnhCsBiH2ulP2zv2qQfAkSR
         tit41Npp1Bl/nDVCyrqSJc4QRJYqx52++1rpcjkv+6xwIH7UIWzj3rUW9m3J4EjuU5QZ
         zi7w==
X-Gm-Message-State: AOAM531uG01G7TEvz+49fRlfGy+SkIyMjsn+U2FJ51lxde4vFsm9cBnH
	ja8ahZ6Kc15NHmfNmWJH9SU/96ZjSSS4fL8/8iw=
X-Google-Smtp-Source: ABdhPJwKW4JeFyoI54chyz2cWk2dZWekJhToO/7Dlpc/klI1T3tB3WkKbgxiJUpS1AAmIe1zrgsVE0eNKAnElADl81c=
X-Received: by 2002:a37:917:0:b0:6a6:9a14:b542 with SMTP id
 23-20020a370917000000b006a69a14b542mr458042qkj.562.1654205445841; Thu, 02 Jun
 2022 14:30:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <43BCAA1E-7499-4584-AB60-C5004AA0643B@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com> <43BCAA1E-7499-4584-AB60-C5004AA0643B@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 2 Jun 2022 23:30:45 +0200
Message-ID: <CAG4p6K6kZHfC6KLoioozmGWomUoUZwceUQcU+Y9qDo9FraXfyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] PIIX3-IDE XEN cleanup
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com, 
	paul@xen.org, xen-devel@lists.xenproject.org, 
	Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fc28c705e07db752"

--000000000000fc28c705e07db752
Content-Type: text/plain; charset="UTF-8"

On Saturday, May 28, 2022, Bernhard Beschow <shentey@gmail.com> wrote:
> Am 13. Mai 2022 18:09:54 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>v2:
>>* Have pci_xen_ide_unplug() return void (Paul Durrant)
>>* CC Xen maintainers (Michael S. Tsirkin)
>>
>>v1:
>>This patch series first removes the redundant "piix3-ide-xen" device
class and
>>then moves a XEN-specific helper function from PIIX3 code to XEN code.
The idea
>>is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if
XEN
>>support is enabled.
>>
>>Testing done:
>>'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022.05.01-x86_64.iso"
boots
>>successfully and a 'poweroff' inside the VM also shuts it down correctly.
>>
>>XEN mode wasn't tested for the time being since its setup procedure seems
quite
>>sophisticated. Please let me know in case this is an obstacle.
>>
>>Bernhard Beschow (3):
>>  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
>>  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
>>  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
>>
>> hw/i386/pc_piix.c          |  3 +--
>> hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
>> hw/ide/piix.c              | 42 ---------------------------------
>> include/hw/ide.h           |  3 ---
>> 4 files changed, 48 insertions(+), 48 deletions(-)
>>
>
> Ping
>
> Whole series is reviewed/acked.

Ping 2

--000000000000fc28c705e07db752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, May 28, 2022, Bernhard Beschow &lt;<a href=3D"mailto:shentey@g=
mail.com">shentey@gmail.com</a>&gt; wrote:<br>&gt; Am 13. Mai 2022 18:09:54=
 UTC schrieb Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shen=
tey@gmail.com</a>&gt;:<br>&gt;&gt;v2:<br>&gt;&gt;* Have pci_xen_ide_unplug(=
) return void (Paul Durrant)<br>&gt;&gt;* CC Xen maintainers (Michael S. Ts=
irkin)<br>&gt;&gt;<br>&gt;&gt;v1:<br>&gt;&gt;This patch series first remove=
s the redundant &quot;piix3-ide-xen&quot; device class and<br>&gt;&gt;then =
moves a XEN-specific helper function from PIIX3 code to XEN code. The idea<=
br>&gt;&gt;is to decouple PIIX3-IDE and XEN and to compile XEN-specific bit=
s only if XEN<br>&gt;&gt;support is enabled.<br>&gt;&gt;<br>&gt;&gt;Testing=
 done:<br>&gt;&gt;&#39;qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022=
.05.01-x86_64.iso&quot; boots<br>&gt;&gt;successfully and a &#39;poweroff&#=
39; inside the VM also shuts it down correctly.<br>&gt;&gt;<br>&gt;&gt;XEN =
mode wasn&#39;t tested for the time being since its setup procedure seems q=
uite<br>&gt;&gt;sophisticated. Please let me know in case this is an obstac=
le.<br>&gt;&gt;<br>&gt;&gt;Bernhard Beschow (3):<br>&gt;&gt;=C2=A0 hw/ide/p=
iix: Remove redundant &quot;piix3-ide-xen&quot; device class<br>&gt;&gt;=C2=
=A0 hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()<br>&g=
t;&gt;=C2=A0 include/hw/ide: Unexport pci_piix3_xen_ide_unplug()<br>&gt;&gt=
;<br>&gt;&gt; hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3=
 +--<br>&gt;&gt; hw/i386/xen/xen_platform.c | 48 ++++++++++++++++++++++++++=
+++++++++++-<br>&gt;&gt; hw/ide/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 42 ---------------------------------<br>&gt;&gt; include/hw=
/ide.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>&gt;&gt; 4 =
files changed, 48 insertions(+), 48 deletions(-)<br>&gt;&gt;<br>&gt;<br>&gt=
; Ping<br>&gt;<br>&gt; Whole series is reviewed/acked.<br><br>Ping 2

--000000000000fc28c705e07db752--

