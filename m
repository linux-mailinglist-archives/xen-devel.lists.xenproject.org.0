Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F11B26D4EF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 09:43:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIoZT-0008Rr-3E; Thu, 17 Sep 2020 07:43:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=prKo=C2=kaod.org=clg@srs-us1.protection.inumbo.net>)
 id 1kIoZS-0008Rj-Ei
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 07:43:10 +0000
X-Inumbo-ID: 410a7a3d-fd55-409f-b78c-6b88ad40af5e
Received: from smtpout1.mo529.mail-out.ovh.net (unknown [178.32.125.2])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 410a7a3d-fd55-409f-b78c-6b88ad40af5e;
 Thu, 17 Sep 2020 07:43:05 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EC02C5BF8923;
 Thu, 17 Sep 2020 09:43:00 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 17 Sep
 2020 09:42:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057fb52edf-47a1-48c6-a207-9fbcaa53d224,
 FF1720B74B3888C93CA5040C1F5ACCC945AC33B8) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
To: Eduardo Habkost <ehabkost@redhat.com>, <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Corey
 Minyard <cminyard@mvista.com>, David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Halil
 Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Alistair Francis
 <alistair@alistair23.me>, David Hildenbrand <david@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Fam Zheng <fam@euphon.net>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Igor Mammedov <imammedo@redhat.com>, Stefan Berger
 <stefanb@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Michael Rolnik
 <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Anthony Green <green@moxielogic.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, Guan
 Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 <qemu-block@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <qemu-riscv@nongnu.org>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7dc24fb7-6d01-0cc0-5855-ee6fb05eaa80@kaod.org>
Date: Thu, 17 Sep 2020 09:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b881c584-b540-4bff-aad6-10737d8ae635
X-Ovh-Tracer-Id: 1406248986254609203
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -98
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegvhhgrsghkohhsthesrhgvughhrghtrdgtohhm
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/16/20 8:25 PM, Eduardo Habkost wrote:
> One of the goals of having less boilerplate on QOM declarations
> is to avoid human error.  Requiring an extra argument that is
> never used is an opportunity for mistakes.
> 
> Remove the unused argument from OBJECT_DECLARE_TYPE and
> OBJECT_DECLARE_SIMPLE_TYPE.
> 
> Coccinelle patch used to convert all users of the macros:
> 
>   @@
>   declarer name OBJECT_DECLARE_TYPE;
>   identifier InstanceType, ClassType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_TYPE(InstanceType, ClassType,
>   -                    lowercase,
>                        UPPERCASE);
> 
>   @@
>   declarer name OBJECT_DECLARE_SIMPLE_TYPE;
>   identifier InstanceType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_SIMPLE_TYPE(InstanceType,
>   -                    lowercase,
>                        UPPERCASE);
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

For the ppc part,

Reviewed-by: Cédric Le Goater <clg@kaod.org>



> ---
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Corey Minyard <cminyard@mvista.com>
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Anthony Green <green@moxielogic.com>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-riscv@nongnu.org
> ---
>  hw/audio/intel-hda.h                | 2 +-
>  hw/display/virtio-vga.h             | 2 +-
>  include/authz/base.h                | 2 +-
>  include/authz/list.h                | 2 +-
>  include/authz/listfile.h            | 2 +-
>  include/authz/pamacct.h             | 2 +-
>  include/authz/simple.h              | 2 +-
>  include/crypto/secret_common.h      | 2 +-
>  include/crypto/secret_keyring.h     | 2 +-
>  include/hw/arm/armsse.h             | 2 +-
>  include/hw/hyperv/vmbus.h           | 2 +-
>  include/hw/i2c/i2c.h                | 2 +-
>  include/hw/i2c/smbus_slave.h        | 2 +-
>  include/hw/ipack/ipack.h            | 2 +-
>  include/hw/ipmi/ipmi.h              | 2 +-
>  include/hw/mem/pc-dimm.h            | 2 +-
>  include/hw/ppc/pnv.h                | 2 +-
>  include/hw/ppc/pnv_core.h           | 2 +-
>  include/hw/ppc/pnv_homer.h          | 2 +-
>  include/hw/ppc/pnv_occ.h            | 2 +-
>  include/hw/ppc/pnv_psi.h            | 2 +-
>  include/hw/ppc/pnv_xive.h           | 2 +-
>  include/hw/ppc/spapr_cpu_core.h     | 2 +-
>  include/hw/ppc/spapr_vio.h          | 2 +-
>  include/hw/ppc/xics.h               | 2 +-
>  include/hw/ppc/xive.h               | 2 +-
>  include/hw/s390x/event-facility.h   | 2 +-
>  include/hw/s390x/s390_flic.h        | 2 +-
>  include/hw/s390x/sclp.h             | 2 +-
>  include/hw/sd/sd.h                  | 2 +-
>  include/hw/ssi/ssi.h                | 2 +-
>  include/hw/sysbus.h                 | 2 +-
>  include/hw/virtio/virtio-gpu.h      | 2 +-
>  include/hw/virtio/virtio-input.h    | 2 +-
>  include/hw/virtio/virtio-mem.h      | 2 +-
>  include/hw/virtio/virtio-pmem.h     | 2 +-
>  include/hw/virtio/virtio-serial.h   | 2 +-
>  include/hw/xen/xen-bus.h            | 2 +-
>  include/io/channel.h                | 2 +-
>  include/io/dns-resolver.h           | 2 +-
>  include/io/net-listener.h           | 2 +-
>  include/qom/object.h                | 6 ++----
>  include/scsi/pr-manager.h           | 2 +-
>  include/sysemu/cryptodev.h          | 2 +-
>  include/sysemu/hostmem.h            | 2 +-
>  include/sysemu/rng.h                | 2 +-
>  include/sysemu/tpm_backend.h        | 2 +-
>  include/sysemu/vhost-user-backend.h | 2 +-
>  target/alpha/cpu-qom.h              | 2 +-
>  target/arm/cpu-qom.h                | 2 +-
>  target/avr/cpu-qom.h                | 2 +-
>  target/cris/cpu-qom.h               | 2 +-
>  target/hppa/cpu-qom.h               | 2 +-
>  target/i386/cpu-qom.h               | 2 +-
>  target/lm32/cpu-qom.h               | 2 +-
>  target/m68k/cpu-qom.h               | 2 +-
>  target/microblaze/cpu-qom.h         | 2 +-
>  target/mips/cpu-qom.h               | 2 +-
>  target/moxie/cpu.h                  | 2 +-
>  target/nios2/cpu.h                  | 2 +-
>  target/openrisc/cpu.h               | 2 +-
>  target/ppc/cpu-qom.h                | 2 +-
>  target/riscv/cpu.h                  | 2 +-
>  target/rx/cpu-qom.h                 | 2 +-
>  target/s390x/cpu-qom.h              | 2 +-
>  target/sh4/cpu-qom.h                | 2 +-
>  target/sparc/cpu-qom.h              | 2 +-
>  target/tilegx/cpu.h                 | 2 +-
>  target/tricore/cpu-qom.h            | 2 +-
>  target/unicore32/cpu-qom.h          | 2 +-
>  target/xtensa/cpu-qom.h             | 2 +-
>  backends/dbus-vmstate.c             | 2 +-
>  ui/input-barrier.c                  | 2 +-
>  ui/input-linux.c                    | 2 +-
>  74 files changed, 75 insertions(+), 77 deletions(-)
> 
> diff --git a/hw/audio/intel-hda.h b/hw/audio/intel-hda.h
> index f5cce18fa3..e2372abbdc 100644
> --- a/hw/audio/intel-hda.h
> +++ b/hw/audio/intel-hda.h
> @@ -9,7 +9,7 @@
>  
>  #define TYPE_HDA_CODEC_DEVICE "hda-codec"
>  OBJECT_DECLARE_TYPE(HDACodecDevice, HDACodecDeviceClass,
> -                    hda_codec_device, HDA_CODEC_DEVICE)
> +                    HDA_CODEC_DEVICE)
>  
>  #define TYPE_HDA_BUS "HDA"
>  typedef struct HDACodecBus HDACodecBus;
> diff --git a/hw/display/virtio-vga.h b/hw/display/virtio-vga.h
> index 5c5671c9c1..977ad5edc2 100644
> --- a/hw/display/virtio-vga.h
> +++ b/hw/display/virtio-vga.h
> @@ -10,7 +10,7 @@
>   */
>  #define TYPE_VIRTIO_VGA_BASE "virtio-vga-base"
>  OBJECT_DECLARE_TYPE(VirtIOVGABase, VirtIOVGABaseClass,
> -                    virtio_vga_base, VIRTIO_VGA_BASE)
> +                    VIRTIO_VGA_BASE)
>  
>  struct VirtIOVGABase {
>      VirtIOPCIProxy parent_obj;
> diff --git a/include/authz/base.h b/include/authz/base.h
> index 06b5e29f6f..eca170ee1a 100644
> --- a/include/authz/base.h
> +++ b/include/authz/base.h
> @@ -28,7 +28,7 @@
>  #define TYPE_QAUTHZ "authz"
>  
>  OBJECT_DECLARE_TYPE(QAuthZ, QAuthZClass,
> -                    qauthz, QAUTHZ)
> +                    QAUTHZ)
>  
>  
>  /**
> diff --git a/include/authz/list.h b/include/authz/list.h
> index c5eda0f1bf..f73bc5c50a 100644
> --- a/include/authz/list.h
> +++ b/include/authz/list.h
> @@ -27,7 +27,7 @@
>  
>  #define TYPE_QAUTHZ_LIST "authz-list"
>  
> -OBJECT_DECLARE_SIMPLE_TYPE(QAuthZList, qauthz_list,
> +OBJECT_DECLARE_SIMPLE_TYPE(QAuthZList,
>                             QAUTHZ_LIST)
>  
>  
> diff --git a/include/authz/listfile.h b/include/authz/listfile.h
> index 83d78cfa50..51824f3fb2 100644
> --- a/include/authz/listfile.h
> +++ b/include/authz/listfile.h
> @@ -27,7 +27,7 @@
>  
>  #define TYPE_QAUTHZ_LIST_FILE "authz-list-file"
>  
> -OBJECT_DECLARE_SIMPLE_TYPE(QAuthZListFile, qauthz_list_file,
> +OBJECT_DECLARE_SIMPLE_TYPE(QAuthZListFile,
>                             QAUTHZ_LIST_FILE)
>  
>  
> diff --git a/include/authz/pamacct.h b/include/authz/pamacct.h
> index 18087cee20..d05c18a3a4 100644
> --- a/include/authz/pamacct.h
> +++ b/include/authz/pamacct.h
> @@ -27,7 +27,7 @@
>  
>  #define TYPE_QAUTHZ_PAM "authz-pam"
>  
> -OBJECT_DECLARE_SIMPLE_TYPE(QAuthZPAM, qauthz_pam,
> +OBJECT_DECLARE_SIMPLE_TYPE(QAuthZPAM,
>                             QAUTHZ_PAM)
>  
>  
> diff --git a/include/authz/simple.h b/include/authz/simple.h
> index d3ed05b36f..9f5b979e13 100644
> --- a/include/authz/simple.h
> +++ b/include/authz/simple.h
> @@ -26,7 +26,7 @@
>  
>  #define TYPE_QAUTHZ_SIMPLE "authz-simple"
>  
> -OBJECT_DECLARE_SIMPLE_TYPE(QAuthZSimple, qauthz_simple,
> +OBJECT_DECLARE_SIMPLE_TYPE(QAuthZSimple,
>                             QAUTHZ_SIMPLE)
>  
>  
> diff --git a/include/crypto/secret_common.h b/include/crypto/secret_common.h
> index daf00c3b2a..42c7ff7af6 100644
> --- a/include/crypto/secret_common.h
> +++ b/include/crypto/secret_common.h
> @@ -26,7 +26,7 @@
>  
>  #define TYPE_QCRYPTO_SECRET_COMMON "secret_common"
>  OBJECT_DECLARE_TYPE(QCryptoSecretCommon, QCryptoSecretCommonClass,
> -                    qcrypto_secret_common, QCRYPTO_SECRET_COMMON)
> +                    QCRYPTO_SECRET_COMMON)
>  
>  
>  struct QCryptoSecretCommon {
> diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
> index 803f3fc28b..3758852cb8 100644
> --- a/include/crypto/secret_keyring.h
> +++ b/include/crypto/secret_keyring.h
> @@ -26,7 +26,7 @@
>  #include "crypto/secret_common.h"
>  
>  #define TYPE_QCRYPTO_SECRET_KEYRING "secret_keyring"
> -OBJECT_DECLARE_SIMPLE_TYPE(QCryptoSecretKeyring, qcrypto_secret_keyring,
> +OBJECT_DECLARE_SIMPLE_TYPE(QCryptoSecretKeyring,
>                             QCRYPTO_SECRET_KEYRING)
>  
>  
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index b844ef6bc0..77f86771c3 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -109,7 +109,7 @@
>  
>  #define TYPE_ARM_SSE "arm-sse"
>  OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
> -                    arm_sse, ARM_SSE)
> +                    ARM_SSE)
>  
>  /*
>   * These type names are for specific IoTKit subsystems; other than
> diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
> index 00ad8798c1..6e9d1c16be 100644
> --- a/include/hw/hyperv/vmbus.h
> +++ b/include/hw/hyperv/vmbus.h
> @@ -21,7 +21,7 @@
>  #define TYPE_VMBUS_DEVICE "vmbus-dev"
>  
>  OBJECT_DECLARE_TYPE(VMBusDevice, VMBusDeviceClass,
> -                    vmbus_device, VMBUS_DEVICE)
> +                    VMBUS_DEVICE)
>  
>  #define TYPE_VMBUS "vmbus"
>  typedef struct VMBus VMBus;
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 5b8eef62c6..17e57436ce 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -19,7 +19,7 @@ enum i2c_event {
>  
>  #define TYPE_I2C_SLAVE "i2c-slave"
>  OBJECT_DECLARE_TYPE(I2CSlave, I2CSlaveClass,
> -                    i2c_slave, I2C_SLAVE)
> +                    I2C_SLAVE)
>  
>  struct I2CSlaveClass {
>      DeviceClass parent_class;
> diff --git a/include/hw/i2c/smbus_slave.h b/include/hw/i2c/smbus_slave.h
> index cb9cb372f9..86bfe0a79e 100644
> --- a/include/hw/i2c/smbus_slave.h
> +++ b/include/hw/i2c/smbus_slave.h
> @@ -30,7 +30,7 @@
>  
>  #define TYPE_SMBUS_DEVICE "smbus-device"
>  OBJECT_DECLARE_TYPE(SMBusDevice, SMBusDeviceClass,
> -                    smbus_device, SMBUS_DEVICE)
> +                    SMBUS_DEVICE)
>  
>  
>  struct SMBusDeviceClass {
> diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
> index a59a487853..58c611af25 100644
> --- a/include/hw/ipack/ipack.h
> +++ b/include/hw/ipack/ipack.h
> @@ -33,7 +33,7 @@ struct IPackBus {
>  
>  #define TYPE_IPACK_DEVICE "ipack-device"
>  OBJECT_DECLARE_TYPE(IPackDevice, IPackDeviceClass,
> -                    ipack_device, IPACK_DEVICE)
> +                    IPACK_DEVICE)
>  
>  struct IPackDeviceClass {
>      /*< private >*/
> diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
> index 3fa5a4abd0..5290dab1d6 100644
> --- a/include/hw/ipmi/ipmi.h
> +++ b/include/hw/ipmi/ipmi.h
> @@ -177,7 +177,7 @@ struct IPMIInterfaceClass {
>   */
>  #define TYPE_IPMI_BMC "ipmi-bmc"
>  OBJECT_DECLARE_TYPE(IPMIBmc, IPMIBmcClass,
> -                    ipmi_bmc, IPMI_BMC)
> +                    IPMI_BMC)
>  
>  struct IPMIBmc {
>      DeviceState parent;
> diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
> index 1d570defc9..aec9527fdd 100644
> --- a/include/hw/mem/pc-dimm.h
> +++ b/include/hw/mem/pc-dimm.h
> @@ -22,7 +22,7 @@
>  
>  #define TYPE_PC_DIMM "pc-dimm"
>  OBJECT_DECLARE_TYPE(PCDIMMDevice, PCDIMMDeviceClass,
> -                    pc_dimm, PC_DIMM)
> +                    PC_DIMM)
>  
>  #define PC_DIMM_ADDR_PROP "addr"
>  #define PC_DIMM_SLOT_PROP "slot"
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index b4b2b24d80..dd2535ab96 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -36,7 +36,7 @@
>  
>  #define TYPE_PNV_CHIP "pnv-chip"
>  OBJECT_DECLARE_TYPE(PnvChip, PnvChipClass,
> -                    pnv_chip, PNV_CHIP)
> +                    PNV_CHIP)
>  
>  struct PnvChip {
>      /*< private >*/
> diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
> index 5cb22c2fa9..fc11edee28 100644
> --- a/include/hw/ppc/pnv_core.h
> +++ b/include/hw/ppc/pnv_core.h
> @@ -26,7 +26,7 @@
>  
>  #define TYPE_PNV_CORE "powernv-cpu-core"
>  OBJECT_DECLARE_TYPE(PnvCore, PnvCoreClass,
> -                    pnv_core, PNV_CORE)
> +                    PNV_CORE)
>  
>  typedef struct PnvChip PnvChip;
>  
> diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
> index 0978812713..7d29db8b47 100644
> --- a/include/hw/ppc/pnv_homer.h
> +++ b/include/hw/ppc/pnv_homer.h
> @@ -25,7 +25,7 @@
>  
>  #define TYPE_PNV_HOMER "pnv-homer"
>  OBJECT_DECLARE_TYPE(PnvHomer, PnvHomerClass,
> -                    pnv_homer, PNV_HOMER)
> +                    PNV_HOMER)
>  #define TYPE_PNV8_HOMER TYPE_PNV_HOMER "-POWER8"
>  DECLARE_INSTANCE_CHECKER(PnvHomer, PNV8_HOMER,
>                           TYPE_PNV8_HOMER)
> diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
> index b79e3440be..6219f588fd 100644
> --- a/include/hw/ppc/pnv_occ.h
> +++ b/include/hw/ppc/pnv_occ.h
> @@ -25,7 +25,7 @@
>  
>  #define TYPE_PNV_OCC "pnv-occ"
>  OBJECT_DECLARE_TYPE(PnvOCC, PnvOCCClass,
> -                    pnv_occ, PNV_OCC)
> +                    PNV_OCC)
>  #define TYPE_PNV8_OCC TYPE_PNV_OCC "-POWER8"
>  DECLARE_INSTANCE_CHECKER(PnvOCC, PNV8_OCC,
>                           TYPE_PNV8_OCC)
> diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
> index 0034db44c3..a1fe25b3eb 100644
> --- a/include/hw/ppc/pnv_psi.h
> +++ b/include/hw/ppc/pnv_psi.h
> @@ -27,7 +27,7 @@
>  
>  #define TYPE_PNV_PSI "pnv-psi"
>  OBJECT_DECLARE_TYPE(PnvPsi, PnvPsiClass,
> -                    pnv_psi, PNV_PSI)
> +                    PNV_PSI)
>  
>  #define PSIHB_XSCOM_MAX         0x20
>  
> diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
> index 29d5debd1c..7928e27963 100644
> --- a/include/hw/ppc/pnv_xive.h
> +++ b/include/hw/ppc/pnv_xive.h
> @@ -17,7 +17,7 @@ struct PnvChip;
>  
>  #define TYPE_PNV_XIVE "pnv-xive"
>  OBJECT_DECLARE_TYPE(PnvXive, PnvXiveClass,
> -                    pnv_xive, PNV_XIVE)
> +                    PNV_XIVE)
>  
>  #define XIVE_BLOCK_MAX      16
>  
> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
> index 4022917168..dab3dfc76c 100644
> --- a/include/hw/ppc/spapr_cpu_core.h
> +++ b/include/hw/ppc/spapr_cpu_core.h
> @@ -17,7 +17,7 @@
>  
>  #define TYPE_SPAPR_CPU_CORE "spapr-cpu-core"
>  OBJECT_DECLARE_TYPE(SpaprCpuCore, SpaprCpuCoreClass,
> -                    spapr_cpu_core, SPAPR_CPU_CORE)
> +                    SPAPR_CPU_CORE)
>  
>  #define SPAPR_CPU_CORE_TYPE_NAME(model) model "-" TYPE_SPAPR_CPU_CORE
>  
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index 6c40da72ff..aae03ea6ab 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -29,7 +29,7 @@
>  
>  #define TYPE_VIO_SPAPR_DEVICE "vio-spapr-device"
>  OBJECT_DECLARE_TYPE(SpaprVioDevice, SpaprVioDeviceClass,
> -                    vio_spapr_device, VIO_SPAPR_DEVICE)
> +                    VIO_SPAPR_DEVICE)
>  
>  #define TYPE_SPAPR_VIO_BUS "spapr-vio-bus"
>  typedef struct SpaprVioBus SpaprVioBus;
> diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> index c5a3cdcadc..00b80b08c2 100644
> --- a/include/hw/ppc/xics.h
> +++ b/include/hw/ppc/xics.h
> @@ -49,7 +49,7 @@ typedef struct XICSFabric XICSFabric;
>  
>  #define TYPE_ICP "icp"
>  OBJECT_DECLARE_TYPE(ICPState, ICPStateClass,
> -                    icp, ICP)
> +                    ICP)
>  
>  #define TYPE_PNV_ICP "pnv-icp"
>  DECLARE_INSTANCE_CHECKER(PnvICPState, PNV_ICP,
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 482fafccfd..26771bb2b3 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -348,7 +348,7 @@ struct XiveRouter {
>  
>  #define TYPE_XIVE_ROUTER "xive-router"
>  OBJECT_DECLARE_TYPE(XiveRouter, XiveRouterClass,
> -                    xive_router, XIVE_ROUTER)
> +                    XIVE_ROUTER)
>  
>  struct XiveRouterClass {
>      SysBusDeviceClass parent;
> diff --git a/include/hw/s390x/event-facility.h b/include/hw/s390x/event-facility.h
> index 051c1c6576..3ffd575d8f 100644
> --- a/include/hw/s390x/event-facility.h
> +++ b/include/hw/s390x/event-facility.h
> @@ -43,7 +43,7 @@
>  
>  #define TYPE_SCLP_EVENT "s390-sclp-event-type"
>  OBJECT_DECLARE_TYPE(SCLPEvent, SCLPEventClass,
> -                    sclp_event, SCLP_EVENT)
> +                    SCLP_EVENT)
>  
>  #define TYPE_SCLP_CPU_HOTPLUG "sclp-cpu-hotplug"
>  #define TYPE_SCLP_QUIESCE "sclpquiesce"
> diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
> index 4b718c8ebf..648ae793a1 100644
> --- a/include/hw/s390x/s390_flic.h
> +++ b/include/hw/s390x/s390_flic.h
> @@ -40,7 +40,7 @@ extern const VMStateDescription vmstate_adapter_routes;
>  
>  #define TYPE_S390_FLIC_COMMON "s390-flic"
>  OBJECT_DECLARE_TYPE(S390FLICState, S390FLICStateClass,
> -                    s390_flic_common, S390_FLIC_COMMON)
> +                    S390_FLIC_COMMON)
>  
>  struct S390FLICState {
>      SysBusDevice parent_obj;
> diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
> index e9f0f7e67c..cd730772f9 100644
> --- a/include/hw/s390x/sclp.h
> +++ b/include/hw/s390x/sclp.h
> @@ -183,7 +183,7 @@ typedef struct SCCB {
>  
>  #define TYPE_SCLP "sclp"
>  OBJECT_DECLARE_TYPE(SCLPDevice, SCLPDeviceClass,
> -                    sclp, SCLP)
> +                    SCLP)
>  
>  struct SCLPEventFacility;
>  
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 54f97a07cd..8dd4c363f5 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -130,7 +130,7 @@ struct SDCardClass {
>  
>  #define TYPE_SD_BUS "sd-bus"
>  OBJECT_DECLARE_TYPE(SDBus, SDBusClass,
> -                    sd_bus, SD_BUS)
> +                    SD_BUS)
>  
>  struct SDBus {
>      BusState qbus;
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 4fe1d85136..fe3028c39d 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -18,7 +18,7 @@ typedef enum SSICSMode SSICSMode;
>  
>  #define TYPE_SSI_SLAVE "ssi-slave"
>  OBJECT_DECLARE_TYPE(SSISlave, SSISlaveClass,
> -                    ssi_slave, SSI_SLAVE)
> +                    SSI_SLAVE)
>  
>  #define SSI_GPIO_CS "ssi-gpio-cs"
>  
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 28a9b0f634..3564b7b6a2 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -17,7 +17,7 @@ DECLARE_INSTANCE_CHECKER(BusState, SYSTEM_BUS,
>  
>  #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
>  OBJECT_DECLARE_TYPE(SysBusDevice, SysBusDeviceClass,
> -                    sys_bus_device, SYS_BUS_DEVICE)
> +                    SYS_BUS_DEVICE)
>  
>  /**
>   * SysBusDeviceClass:
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 6b45b4799a..7ef405975a 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -26,7 +26,7 @@
>  
>  #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
>  OBJECT_DECLARE_TYPE(VirtIOGPUBase, VirtIOGPUBaseClass,
> -                    virtio_gpu_base, VIRTIO_GPU_BASE)
> +                    VIRTIO_GPU_BASE)
>  
>  #define TYPE_VIRTIO_GPU "virtio-gpu-device"
>  typedef struct VirtIOGPU VirtIOGPU;
> diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
> index 5eb9e7745e..91df34b534 100644
> --- a/include/hw/virtio/virtio-input.h
> +++ b/include/hw/virtio/virtio-input.h
> @@ -20,7 +20,7 @@ typedef struct virtio_input_event virtio_input_event;
>  
>  #define TYPE_VIRTIO_INPUT "virtio-input-device"
>  OBJECT_DECLARE_TYPE(VirtIOInput, VirtIOInputClass,
> -                    virtio_input, VIRTIO_INPUT)
> +                    VIRTIO_INPUT)
>  #define VIRTIO_INPUT_GET_PARENT_CLASS(obj) \
>          OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT)
>  
> diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
> index dfc72e14b1..4eeb82d5dd 100644
> --- a/include/hw/virtio/virtio-mem.h
> +++ b/include/hw/virtio/virtio-mem.h
> @@ -22,7 +22,7 @@
>  #define TYPE_VIRTIO_MEM "virtio-mem"
>  
>  OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
> -                    virtio_mem, VIRTIO_MEM)
> +                    VIRTIO_MEM)
>  
>  #define VIRTIO_MEM_MEMDEV_PROP "memdev"
>  #define VIRTIO_MEM_NODE_PROP "node"
> diff --git a/include/hw/virtio/virtio-pmem.h b/include/hw/virtio/virtio-pmem.h
> index 56df9a03ce..66b590821e 100644
> --- a/include/hw/virtio/virtio-pmem.h
> +++ b/include/hw/virtio/virtio-pmem.h
> @@ -21,7 +21,7 @@
>  #define TYPE_VIRTIO_PMEM "virtio-pmem"
>  
>  OBJECT_DECLARE_TYPE(VirtIOPMEM, VirtIOPMEMClass,
> -                    virtio_pmem, VIRTIO_PMEM)
> +                    VIRTIO_PMEM)
>  
>  #define VIRTIO_PMEM_ADDR_PROP "memaddr"
>  #define VIRTIO_PMEM_MEMDEV_PROP "memdev"
> diff --git a/include/hw/virtio/virtio-serial.h b/include/hw/virtio/virtio-serial.h
> index 0b7f963611..17359918f7 100644
> --- a/include/hw/virtio/virtio-serial.h
> +++ b/include/hw/virtio/virtio-serial.h
> @@ -27,7 +27,7 @@ struct virtio_serial_conf {
>  
>  #define TYPE_VIRTIO_SERIAL_PORT "virtio-serial-port"
>  OBJECT_DECLARE_TYPE(VirtIOSerialPort, VirtIOSerialPortClass,
> -                    virtio_serial_port, VIRTIO_SERIAL_PORT)
> +                    VIRTIO_SERIAL_PORT)
>  
>  typedef struct VirtIOSerial VirtIOSerial;
>  
> diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
> index e0e67505b8..1924d93c6c 100644
> --- a/include/hw/xen/xen-bus.h
> +++ b/include/hw/xen/xen-bus.h
> @@ -79,7 +79,7 @@ struct XenBusClass {
>  
>  #define TYPE_XEN_BUS "xen-bus"
>  OBJECT_DECLARE_TYPE(XenBus, XenBusClass,
> -                    xen_bus, XEN_BUS)
> +                    XEN_BUS)
>  
>  void xen_bus_init(void);
>  
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 245479548a..3c04f0edda 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -27,7 +27,7 @@
>  
>  #define TYPE_QIO_CHANNEL "qio-channel"
>  OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
> -                    qio_channel, QIO_CHANNEL)
> +                    QIO_CHANNEL)
>  
>  
>  #define QIO_CHANNEL_ERR_BLOCK -2
> diff --git a/include/io/dns-resolver.h b/include/io/dns-resolver.h
> index 9d14a8d98f..01d0bd7a42 100644
> --- a/include/io/dns-resolver.h
> +++ b/include/io/dns-resolver.h
> @@ -26,7 +26,7 @@
>  #include "io/task.h"
>  
>  #define TYPE_QIO_DNS_RESOLVER "qio-dns-resolver"
> -OBJECT_DECLARE_SIMPLE_TYPE(QIODNSResolver, qio_dns_resolver,
> +OBJECT_DECLARE_SIMPLE_TYPE(QIODNSResolver,
>                             QIO_DNS_RESOLVER)
>  
>  
> diff --git a/include/io/net-listener.h b/include/io/net-listener.h
> index 8145962fbb..ab9f291ed6 100644
> --- a/include/io/net-listener.h
> +++ b/include/io/net-listener.h
> @@ -25,7 +25,7 @@
>  #include "qom/object.h"
>  
>  #define TYPE_QIO_NET_LISTENER "qio-net-listener"
> -OBJECT_DECLARE_SIMPLE_TYPE(QIONetListener, qio_net_listener,
> +OBJECT_DECLARE_SIMPLE_TYPE(QIONetListener,
>                             QIO_NET_LISTENER)
>  
>  
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 4a23fed586..a5ca75fd54 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -614,7 +614,6 @@ struct Object
>   * OBJECT_DECLARE_TYPE:
>   * @InstanceType: instance struct name
>   * @ClassType: class struct name
> - * @module_obj_name: the object name in lowercase with underscore separators
>   * @MODULE_OBJ_NAME: the object name in uppercase with underscore separators
>   *
>   * This macro is typically used in a header file, and will:
> @@ -625,7 +624,7 @@ struct Object
>   *
>   * The object struct and class struct need to be declared manually.
>   */
> -#define OBJECT_DECLARE_TYPE(InstanceType, ClassType, module_obj_name, MODULE_OBJ_NAME) \
> +#define OBJECT_DECLARE_TYPE(InstanceType, ClassType, MODULE_OBJ_NAME) \
>      typedef struct InstanceType InstanceType; \
>      typedef struct ClassType ClassType; \
>      \
> @@ -637,7 +636,6 @@ struct Object
>  /**
>   * OBJECT_DECLARE_SIMPLE_TYPE:
>   * @InstanceType: instance struct name
> - * @module_obj_name: the object name in lowercase with underscore separators
>   * @MODULE_OBJ_NAME: the object name in uppercase with underscore separators
>   *
>   * This does the same as OBJECT_DECLARE_TYPE(), but with no class struct
> @@ -646,7 +644,7 @@ struct Object
>   * This macro should be used unless the class struct needs to have
>   * virtual methods declared.
>   */
> -#define OBJECT_DECLARE_SIMPLE_TYPE(InstanceType, module_obj_name, MODULE_OBJ_NAME) \
> +#define OBJECT_DECLARE_SIMPLE_TYPE(InstanceType, MODULE_OBJ_NAME) \
>      typedef struct InstanceType InstanceType; \
>      \
>      G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
> diff --git a/include/scsi/pr-manager.h b/include/scsi/pr-manager.h
> index 26bd134531..e4ecbe00f6 100644
> --- a/include/scsi/pr-manager.h
> +++ b/include/scsi/pr-manager.h
> @@ -10,7 +10,7 @@
>  #define TYPE_PR_MANAGER "pr-manager"
>  
>  OBJECT_DECLARE_TYPE(PRManager, PRManagerClass,
> -                    pr_manager, PR_MANAGER)
> +                    PR_MANAGER)
>  
>  struct sg_io_hdr;
>  
> diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
> index 06726f7014..b458aa4dae 100644
> --- a/include/sysemu/cryptodev.h
> +++ b/include/sysemu/cryptodev.h
> @@ -38,7 +38,7 @@
>  #define TYPE_CRYPTODEV_BACKEND "cryptodev-backend"
>  
>  OBJECT_DECLARE_TYPE(CryptoDevBackend, CryptoDevBackendClass,
> -                    cryptodev_backend, CRYPTODEV_BACKEND)
> +                    CRYPTODEV_BACKEND)
>  
>  
>  #define MAX_CRYPTO_QUEUE_NUM  64
> diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
> index e5b7a152d3..df5644723a 100644
> --- a/include/sysemu/hostmem.h
> +++ b/include/sysemu/hostmem.h
> @@ -21,7 +21,7 @@
>  
>  #define TYPE_MEMORY_BACKEND "memory-backend"
>  OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
> -                    memory_backend, MEMORY_BACKEND)
> +                    MEMORY_BACKEND)
>  
>  /* hostmem-ram.c */
>  /**
> diff --git a/include/sysemu/rng.h b/include/sysemu/rng.h
> index cee45a4787..e383f87d20 100644
> --- a/include/sysemu/rng.h
> +++ b/include/sysemu/rng.h
> @@ -18,7 +18,7 @@
>  
>  #define TYPE_RNG_BACKEND "rng-backend"
>  OBJECT_DECLARE_TYPE(RngBackend, RngBackendClass,
> -                    rng_backend, RNG_BACKEND)
> +                    RNG_BACKEND)
>  
>  #define TYPE_RNG_BUILTIN "rng-builtin"
>  
> diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
> index 7e8a014031..6f078f5f48 100644
> --- a/include/sysemu/tpm_backend.h
> +++ b/include/sysemu/tpm_backend.h
> @@ -20,7 +20,7 @@
>  
>  #define TYPE_TPM_BACKEND "tpm-backend"
>  OBJECT_DECLARE_TYPE(TPMBackend, TPMBackendClass,
> -                    tpm_backend, TPM_BACKEND)
> +                    TPM_BACKEND)
>  
>  
>  typedef struct TPMBackendCmd {
> diff --git a/include/sysemu/vhost-user-backend.h b/include/sysemu/vhost-user-backend.h
> index 41d5ff43bd..327b0b84f1 100644
> --- a/include/sysemu/vhost-user-backend.h
> +++ b/include/sysemu/vhost-user-backend.h
> @@ -22,7 +22,7 @@
>  #include "io/channel.h"
>  
>  #define TYPE_VHOST_USER_BACKEND "vhost-user-backend"
> -OBJECT_DECLARE_SIMPLE_TYPE(VhostUserBackend, vhost_user_backend,
> +OBJECT_DECLARE_SIMPLE_TYPE(VhostUserBackend,
>                             VHOST_USER_BACKEND)
>  
>  
> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
> index 568fe3fb77..7bb9173c57 100644
> --- a/target/alpha/cpu-qom.h
> +++ b/target/alpha/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_ALPHA_CPU "alpha-cpu"
>  
>  OBJECT_DECLARE_TYPE(AlphaCPU, AlphaCPUClass,
> -                    alpha_cpu, ALPHA_CPU)
> +                    ALPHA_CPU)
>  
>  /**
>   * AlphaCPUClass:
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 94bbbd4473..a22bd506d0 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -28,7 +28,7 @@ struct arm_boot_info;
>  #define TYPE_ARM_CPU "arm-cpu"
>  
>  OBJECT_DECLARE_TYPE(ARMCPU, ARMCPUClass,
> -                    arm_cpu, ARM_CPU)
> +                    ARM_CPU)
>  
>  #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
>  
> diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
> index 49d63faad2..9fa6989c18 100644
> --- a/target/avr/cpu-qom.h
> +++ b/target/avr/cpu-qom.h
> @@ -27,7 +27,7 @@
>  #define TYPE_AVR_CPU "avr-cpu"
>  
>  OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
> -                    avr_cpu, AVR_CPU)
> +                    AVR_CPU)
>  
>  /**
>   *  AVRCPUClass:
> diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
> index 2b0328113c..2596edc7e3 100644
> --- a/target/cris/cpu-qom.h
> +++ b/target/cris/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_CRIS_CPU "cris-cpu"
>  
>  OBJECT_DECLARE_TYPE(CRISCPU, CRISCPUClass,
> -                    cris_cpu, CRIS_CPU)
> +                    CRIS_CPU)
>  
>  /**
>   * CRISCPUClass:
> diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
> index 58158f374b..d424f88370 100644
> --- a/target/hppa/cpu-qom.h
> +++ b/target/hppa/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_HPPA_CPU "hppa-cpu"
>  
>  OBJECT_DECLARE_TYPE(HPPACPU, HPPACPUClass,
> -                    hppa_cpu, HPPA_CPU)
> +                    HPPA_CPU)
>  
>  /**
>   * HPPACPUClass:
> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
> index 0505472e86..f9923cee04 100644
> --- a/target/i386/cpu-qom.h
> +++ b/target/i386/cpu-qom.h
> @@ -31,7 +31,7 @@
>  #endif
>  
>  OBJECT_DECLARE_TYPE(X86CPU, X86CPUClass,
> -                    x86_cpu, X86_CPU)
> +                    X86_CPU)
>  
>  typedef struct X86CPUModel X86CPUModel;
>  
> diff --git a/target/lm32/cpu-qom.h b/target/lm32/cpu-qom.h
> index e9eb495bf0..245b35cd1d 100644
> --- a/target/lm32/cpu-qom.h
> +++ b/target/lm32/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_LM32_CPU "lm32-cpu"
>  
>  OBJECT_DECLARE_TYPE(LM32CPU, LM32CPUClass,
> -                    lm32_cpu, LM32_CPU)
> +                    LM32_CPU)
>  
>  /**
>   * LM32CPUClass:
> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
> index a10429cf67..1ceb160ecb 100644
> --- a/target/m68k/cpu-qom.h
> +++ b/target/m68k/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_M68K_CPU "m68k-cpu"
>  
>  OBJECT_DECLARE_TYPE(M68kCPU, M68kCPUClass,
> -                    m68k_cpu, M68K_CPU)
> +                    M68K_CPU)
>  
>  /*
>   * M68kCPUClass:
> diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
> index 82734b9b2b..e520eefb12 100644
> --- a/target/microblaze/cpu-qom.h
> +++ b/target/microblaze/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
>  
>  OBJECT_DECLARE_TYPE(MicroBlazeCPU, MicroBlazeCPUClass,
> -                    microblaze_cpu, MICROBLAZE_CPU)
> +                    MICROBLAZE_CPU)
>  
>  /**
>   * MicroBlazeCPUClass:
> diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
> index 93fbbdca1b..826ab13019 100644
> --- a/target/mips/cpu-qom.h
> +++ b/target/mips/cpu-qom.h
> @@ -30,7 +30,7 @@
>  #endif
>  
>  OBJECT_DECLARE_TYPE(MIPSCPU, MIPSCPUClass,
> -                    mips_cpu, MIPS_CPU)
> +                    MIPS_CPU)
>  
>  /**
>   * MIPSCPUClass:
> diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
> index d58761ccb1..bd6ab66084 100644
> --- a/target/moxie/cpu.h
> +++ b/target/moxie/cpu.h
> @@ -52,7 +52,7 @@ typedef struct CPUMoxieState {
>  #define TYPE_MOXIE_CPU "moxie-cpu"
>  
>  OBJECT_DECLARE_TYPE(MoxieCPU, MoxieCPUClass,
> -                    moxie_cpu, MOXIE_CPU)
> +                    MOXIE_CPU)
>  
>  /**
>   * MoxieCPUClass:
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 1fa0fdaa35..86bbe1d867 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -33,7 +33,7 @@ typedef struct CPUNios2State CPUNios2State;
>  #define TYPE_NIOS2_CPU "nios2-cpu"
>  
>  OBJECT_DECLARE_TYPE(Nios2CPU, Nios2CPUClass,
> -                    nios2_cpu, NIOS2_CPU)
> +                    NIOS2_CPU)
>  
>  /**
>   * Nios2CPUClass:
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index d0a8ee657a..bd42faf144 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -30,7 +30,7 @@ struct OpenRISCCPU;
>  #define TYPE_OPENRISC_CPU "or1k-cpu"
>  
>  OBJECT_DECLARE_TYPE(OpenRISCCPU, OpenRISCCPUClass,
> -                    openrisc_cpu, OPENRISC_CPU)
> +                    OPENRISC_CPU)
>  
>  /**
>   * OpenRISCCPUClass:
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 5cf806a3a6..5fdb96f04d 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -30,7 +30,7 @@
>  #endif
>  
>  OBJECT_DECLARE_TYPE(PowerPCCPU, PowerPCCPUClass,
> -                    powerpc_cpu, POWERPC_CPU)
> +                    POWERPC_CPU)
>  
>  typedef struct CPUPPCState CPUPPCState;
>  typedef struct ppc_tb_t ppc_tb_t;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4c00d35ccd..de275782e6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -234,7 +234,7 @@ struct CPURISCVState {
>  };
>  
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> -                    riscv_cpu, RISCV_CPU)
> +                    RISCV_CPU)
>  
>  /**
>   * RISCVCPUClass:
> diff --git a/target/rx/cpu-qom.h b/target/rx/cpu-qom.h
> index 6c5321078d..7310558e0c 100644
> --- a/target/rx/cpu-qom.h
> +++ b/target/rx/cpu-qom.h
> @@ -27,7 +27,7 @@
>  #define TYPE_RX62N_CPU RX_CPU_TYPE_NAME("rx62n")
>  
>  OBJECT_DECLARE_TYPE(RXCPU, RXCPUClass,
> -                    rx_cpu, RX_CPU)
> +                    RX_CPU)
>  
>  /*
>   * RXCPUClass:
> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
> index e2b2513711..9f3a0d86c5 100644
> --- a/target/s390x/cpu-qom.h
> +++ b/target/s390x/cpu-qom.h
> @@ -26,7 +26,7 @@
>  #define TYPE_S390_CPU "s390x-cpu"
>  
>  OBJECT_DECLARE_TYPE(S390CPU, S390CPUClass,
> -                    s390_cpu, S390_CPU)
> +                    S390_CPU)
>  
>  typedef struct S390CPUModel S390CPUModel;
>  typedef struct S390CPUDef S390CPUDef;
> diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
> index 595814b8cb..8903b4b9c7 100644
> --- a/target/sh4/cpu-qom.h
> +++ b/target/sh4/cpu-qom.h
> @@ -30,7 +30,7 @@
>  #define TYPE_SH7785_CPU  SUPERH_CPU_TYPE_NAME("sh7785")
>  
>  OBJECT_DECLARE_TYPE(SuperHCPU, SuperHCPUClass,
> -                    superh_cpu, SUPERH_CPU)
> +                    SUPERH_CPU)
>  
>  /**
>   * SuperHCPUClass:
> diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
> index 5d7fb727bc..f33949aaee 100644
> --- a/target/sparc/cpu-qom.h
> +++ b/target/sparc/cpu-qom.h
> @@ -30,7 +30,7 @@
>  #endif
>  
>  OBJECT_DECLARE_TYPE(SPARCCPU, SPARCCPUClass,
> -                    sparc_cpu, SPARC_CPU)
> +                    SPARC_CPU)
>  
>  typedef struct sparc_def_t sparc_def_t;
>  /**
> diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
> index d251ff80b8..c194c1a6fd 100644
> --- a/target/tilegx/cpu.h
> +++ b/target/tilegx/cpu.h
> @@ -100,7 +100,7 @@ typedef struct CPUTLGState {
>  #define TYPE_TILEGX_CPU "tilegx-cpu"
>  
>  OBJECT_DECLARE_TYPE(TileGXCPU, TileGXCPUClass,
> -                    tilegx_cpu, TILEGX_CPU)
> +                    TILEGX_CPU)
>  
>  /**
>   * TileGXCPUClass:
> diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
> index 9e588c4c34..59bfd01bbc 100644
> --- a/target/tricore/cpu-qom.h
> +++ b/target/tricore/cpu-qom.h
> @@ -25,7 +25,7 @@
>  #define TYPE_TRICORE_CPU "tricore-cpu"
>  
>  OBJECT_DECLARE_TYPE(TriCoreCPU, TriCoreCPUClass,
> -                    tricore_cpu, TRICORE_CPU)
> +                    TRICORE_CPU)
>  
>  struct TriCoreCPUClass {
>      /*< private >*/
> diff --git a/target/unicore32/cpu-qom.h b/target/unicore32/cpu-qom.h
> index c914273058..43621e7479 100644
> --- a/target/unicore32/cpu-qom.h
> +++ b/target/unicore32/cpu-qom.h
> @@ -17,7 +17,7 @@
>  #define TYPE_UNICORE32_CPU "unicore32-cpu"
>  
>  OBJECT_DECLARE_TYPE(UniCore32CPU, UniCore32CPUClass,
> -                    unicore32_cpu, UNICORE32_CPU)
> +                    UNICORE32_CPU)
>  
>  /**
>   * UniCore32CPUClass:
> diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
> index 299ce3e63c..41d9859673 100644
> --- a/target/xtensa/cpu-qom.h
> +++ b/target/xtensa/cpu-qom.h
> @@ -35,7 +35,7 @@
>  #define TYPE_XTENSA_CPU "xtensa-cpu"
>  
>  OBJECT_DECLARE_TYPE(XtensaCPU, XtensaCPUClass,
> -                    xtensa_cpu, XTENSA_CPU)
> +                    XTENSA_CPU)
>  
>  typedef struct XtensaConfig XtensaConfig;
>  
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index 5bffbc4906..bd050e8e9c 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -23,7 +23,7 @@
>  
>  
>  #define TYPE_DBUS_VMSTATE "dbus-vmstate"
> -OBJECT_DECLARE_SIMPLE_TYPE(DBusVMState, dbus_vmstate,
> +OBJECT_DECLARE_SIMPLE_TYPE(DBusVMState,
>                             DBUS_VMSTATE)
>  
>  
> diff --git a/ui/input-barrier.c b/ui/input-barrier.c
> index b76697be93..a047919fde 100644
> --- a/ui/input-barrier.c
> +++ b/ui/input-barrier.c
> @@ -20,7 +20,7 @@
>  #include "input-barrier.h"
>  
>  #define TYPE_INPUT_BARRIER "input-barrier"
> -OBJECT_DECLARE_SIMPLE_TYPE(InputBarrier, input_barrier,
> +OBJECT_DECLARE_SIMPLE_TYPE(InputBarrier,
>                             INPUT_BARRIER)
>  
>  
> diff --git a/ui/input-linux.c b/ui/input-linux.c
> index f02557b012..ab351a4187 100644
> --- a/ui/input-linux.c
> +++ b/ui/input-linux.c
> @@ -31,7 +31,7 @@ static bool linux_is_button(unsigned int lnx)
>  }
>  
>  #define TYPE_INPUT_LINUX "input-linux"
> -OBJECT_DECLARE_SIMPLE_TYPE(InputLinux, input_linux,
> +OBJECT_DECLARE_SIMPLE_TYPE(InputLinux,
>                             INPUT_LINUX)
>  
>  
> 


