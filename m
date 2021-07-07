Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D93BE287
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 07:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151944.280756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1074-0004Bo-OR; Wed, 07 Jul 2021 05:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151944.280756; Wed, 07 Jul 2021 05:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1074-00049z-Kk; Wed, 07 Jul 2021 05:28:46 +0000
Received: by outflank-mailman (input) for mailman id 151944;
 Wed, 07 Jul 2021 05:28:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0Kw=L7=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1m1073-00049d-GQ
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 05:28:45 +0000
Received: from mail-oi1-x236.google.com (unknown [2607:f8b0:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c90af6b6-818e-4a29-a1fc-d76da94f77c6;
 Wed, 07 Jul 2021 05:28:43 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t3so2080247oic.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 22:28:43 -0700 (PDT)
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
X-Inumbo-ID: c90af6b6-818e-4a29-a1fc-d76da94f77c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D1dR8p9JnX3zOkEkvevtRK3+GZNX9swmGMbuAU8jYo0=;
        b=magnjuTUaP9BdvuuvKgVP8ITRecDXJpDXsftwIvwSraAk/Y/1PuKhl3WNQXoPbobJW
         ia6TqQu+uGn94PZpxZMcS8OwZHzMiLV+BEDDbJYm0/RUiI/wDivJlRnppI0NMz+Apryg
         XeC6xzP+AXO6YuHi2eAJSd3OXB/9tDUsCmzfy/HsdEPL08hYiTg68vE/DCqhUxqiSeYR
         orlxfhi+6Z/k1ZTQsfuxIQFlrExd7djSdlu/+og4SNhKh7aj006wjvmT9C6lbatb6gfi
         IcacH8PeVyMBlhS7ROMeR6pkgxsfNIh8IwmibENAI3k+gbVh1ruqMTb+9hpoO4uK9RSD
         wVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D1dR8p9JnX3zOkEkvevtRK3+GZNX9swmGMbuAU8jYo0=;
        b=gvWuWuAbLcWevZc2RtmbKYJUHw1FTkfdxU5BGLZsW4NuNKoZXY/wvB4hxxoFwhWhVO
         bgY2aqpgGINjyLuh9btNPEL/F57T+1+xNupyTPpEqOH3+kKYwHpkWGVt42elkPNWXQ6K
         tMEsltBUhfEmxDNaL8JQfwoIq1ooXAMWXgmMnM7qV6lzPcfWbYvdepws0B1pQjyN6aSo
         B++pt6hazGhyf1Wykw2nFh1WfNYBsItD5bokaQBuMeoCbjuO9azVLlsfN0w/fb37Bed8
         V21PyzgwyhBSS7TpzqlldwZ4cHSu3CzOJN3Zi3Z1R+VLXiZ+Olx3AgRs7RirCTD4VtS0
         Iu5g==
X-Gm-Message-State: AOAM533GEwOne0AwBly9S6VhwZRS6tcKEEalp397eWxEdAEc/U4IC9mJ
	/KwrbJ/uSgYZXLfFCpjim+NJsMN/XxMWfg7+1ruwZiqxsek=
X-Google-Smtp-Source: ABdhPJxjVdg6dtC8GZrDmmeBZKV2iy9h5j9xmd8n2RqyOUgzlQS45N71c4OCh3cvu/SFhai6wHybXAjnhwjT+6rWipQ=
X-Received: by 2002:aca:4952:: with SMTP id w79mr3438270oia.33.1625635722905;
 Tue, 06 Jul 2021 22:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210514034101.3683-1-christopher.w.clark@gmail.com> <20210514034101.3683-3-christopher.w.clark@gmail.com>
In-Reply-To: <20210514034101.3683-3-christopher.w.clark@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 6 Jul 2021 22:28:29 -0700
Message-ID: <CACMJ4Ga5q2chhWT9n8WVhahEotP9rCTxa4y5-g-i-t=9=ayJ1w@mail.gmail.com>
Subject: Ping: [PATCH v4 2/2] docs/designs/launch: Hyperlaunch device tree
To: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>, 
	Scott Davis <scott.davis@starlab.io>, Christopher Clark <christopher.clark@starlab.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 8:41 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>
> Adds a design document for Hyperlaunch device tree structure.
>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  .../designs/launch/hyperlaunch-devicetree.rst | 343 ++++++++++++++++++
>  1 file changed, 343 insertions(+)
>  create mode 100644 docs/designs/launch/hyperlaunch-devicetree.rst
>
> diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst b/docs/design=
s/launch/hyperlaunch-devicetree.rst
> new file mode 100644
> index 0000000000..f97d357407
> --- /dev/null
> +++ b/docs/designs/launch/hyperlaunch-devicetree.rst
> @@ -0,0 +1,343 @@
> +-------------------------------------
> +Xen Hyperlaunch Device Tree Bindings
> +-------------------------------------
> +
> +The Xen Hyperlaunch device tree adopts the dom0less device tree structur=
e and
> +extends it to meet the requirements for the Hyperlaunch capability. The =
primary
> +difference is the introduction of the ``hypervisor`` node that is under =
the
> +``/chosen`` node. The move to a dedicated node was driven by:
> +
> +1. Reduces the need to walk over nodes that are not of interest, e.g. on=
ly
> +   nodes of interest should be in ``/chosen/hypervisor``
> +
> +2. Allows for the domain construction information to easily be sanitized=
 by
> +   simple removing the ``/chosen/hypervisor`` node.
> +
> +Example Configuration
> +---------------------
> +
> +Below are two example device tree definitions for the hypervisor node. T=
he
> +first is an example of a multiboot-based configuration for x86 and the s=
econd
> +is a module-based configuration for Arm.
> +
> +Multiboot x86 Configuration:
> +""""""""""""""""""""""""""""
> +
> +::
> +
> +    hypervisor {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D =E2=80=9Chypervisor,xen=E2=80=9D
> +
> +        // Configuration container
> +        config {
> +            compatible =3D "xen,config";
> +
> +            module {
> +                compatible =3D "module,microcode", "multiboot,module";
> +                mb-index =3D <1>;
> +            };
> +
> +            module {
> +                compatible =3D "module,xsm-policy", "multiboot,module";
> +                mb-index =3D <2>;
> +            };
> +        };
> +
> +        // Boot Domain definition
> +        domain {
> +            compatible =3D "xen,domain";
> +
> +            domid =3D <0x7FF5>;
> +
> +            // FUNCTION_NONE            (0)
> +            // FUNCTION_BOOT            (1 << 0)
> +            // FUNCTION_CRASH           (1 << 1)
> +            // FUNCTION_CONSOLE         (1 << 2)
> +            // FUNCTION_XENSTORE        (1 << 30)
> +            // FUNCTION_LEGACY_DOM0     (1 << 31)
> +            functions =3D <0x00000001>;
> +
> +            memory =3D <0x0 0x20000>;
> +            cpus =3D <1>;
> +            module {
> +                compatible =3D "module,kernel", "multiboot,module";
> +                mb-index =3D <3>;
> +            };
> +
> +            module {
> +                compatible =3D "module,ramdisk", "multiboot,module";
> +                mb-index =3D <4>;
> +            };
> +            module {
> +                compatible =3D "module,config", "multiboot,module";
> +                mb-index =3D <5>;
> +            };
> +
> +        // Classic Dom0 definition
> +        domain {
> +            compatible =3D "xen,domain";
> +
> +            domid =3D <0>;
> +
> +            // PERMISSION_NONE          (0)
> +            // PERMISSION_CONTROL       (1 << 0)
> +            // PERMISSION_HARDWARE      (1 << 1)
> +            permissions =3D <3>;
> +
> +            // FUNCTION_NONE            (0)
> +            // FUNCTION_BOOT            (1 << 0)
> +            // FUNCTION_CRASH           (1 << 1)
> +            // FUNCTION_CONSOLE         (1 << 2)
> +            // FUNCTION_XENSTORE        (1 << 30)
> +            // FUNCTION_LEGACY_DOM0     (1 << 31)
> +            functions =3D <0xC0000006>;
> +
> +            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
> +            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
> +            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
> +            mode =3D <5>; /* 64 BIT, PV */
> +
> +            // UUID
> +            domain-uuid =3D [B3 FB 98 FB 8F 9F 67 A3];
> +
> +            cpus =3D <1>;
> +            memory =3D <0x0 0x20000>;
> +            security-id =3D =E2=80=9Cdom0_t;
> +
> +            module {
> +                compatible =3D "module,kernel", "multiboot,module";
> +                mb-index =3D <6>;
> +                bootargs =3D "console=3Dhvc0";
> +            };
> +            module {
> +                compatible =3D "module,ramdisk", "multiboot,module";
> +                mb-index =3D <7>;
> +            };
> +    };
> +
> +The multiboot modules supplied when using the above config would be, in =
order:
> +
> +* (the above config, compiled)
> +* CPU microcode
> +* XSM policy
> +* kernel for boot domain
> +* ramdisk for boot domain
> +* boot domain configuration file
> +* kernel for the classic dom0 domain
> +* ramdisk for the classic dom0 domain
> +
> +Module Arm Configuration:
> +"""""""""""""""""""""""""
> +
> +::
> +
> +    hypervisor {
> +        compatible =3D =E2=80=9Chypervisor,xen=E2=80=9D
> +
> +        // Configuration container
> +        config {
> +            compatible =3D "xen,config";
> +
> +            module {
> +                compatible =3D "module,microcode=E2=80=9D;
> +                module-addr =3D <0x0000ff00 0x80>;
> +            };
> +
> +            module {
> +                compatible =3D "module,xsm-policy";
> +                module-addr =3D <0x0000ff00 0x80>;
> +
> +            };
> +        };
> +
> +        // Boot Domain definition
> +        domain {
> +            compatible =3D "xen,domain";
> +
> +            domid =3D <0x7FF5>;
> +
> +            // FUNCTION_NONE            (0)
> +            // FUNCTION_BOOT            (1 << 0)
> +            // FUNCTION_CRASH           (1 << 1)
> +            // FUNCTION_CONSOLE         (1 << 2)
> +            // FUNCTION_XENSTORE        (1 << 30)
> +            // FUNCTION_LEGACY_DOM0     (1 << 31)
> +            functions =3D <0x00000001>;
> +
> +            memory =3D <0x0 0x20000>;
> +            cpus =3D <1>;
> +            module {
> +                compatible =3D "module,kernel";
> +                module-addr =3D <0x0000ff00 0x80>;
> +            };
> +
> +            module {
> +                compatible =3D "module,ramdisk";
> +                module-addr =3D <0x0000ff00 0x80>;
> +            };
> +            module {
> +                compatible =3D "module,config";
> +                module-addr =3D <0x0000ff00 0x80>;
> +            };
> +
> +        // Classic Dom0 definition
> +        domain@0 {
> +            compatible =3D "xen,domain";
> +
> +            domid =3D <0>;
> +
> +            // PERMISSION_NONE          (0)
> +            // PERMISSION_CONTROL       (1 << 0)
> +            // PERMISSION_HARDWARE      (1 << 1)
> +            permissions =3D <3>;
> +
> +            // FUNCTION_NONE            (0)
> +            // FUNCTION_BOOT            (1 << 0)
> +            // FUNCTION_CRASH           (1 << 1)
> +            // FUNCTION_CONSOLE         (1 << 2)
> +            // FUNCTION_XENSTORE        (1 << 30)
> +            // FUNCTION_LEGACY_DOM0     (1 << 31)
> +            functions =3D <0xC0000006>;
> +
> +            // MODE_PARAVIRTUALIZED     (1 << 0) /* PV | PVH/HVM */
> +            // MODE_ENABLE_DEVICE_MODEL (1 << 1) /* HVM | PVH */
> +            // MODE_LONG                (1 << 2) /* 64 BIT | 32 BIT */
> +            mode =3D <5>; /* 64 BIT, PV */
> +
> +            // UUID
> +            domain-uuid =3D [B3 FB 98 FB 8F 9F 67 A3];
> +
> +            cpus =3D <1>;
> +            memory =3D <0x0 0x20000>;
> +            security-id =3D =E2=80=9Cdom0_t=E2=80=9D;
> +
> +            module {
> +                compatible =3D "module,kernel";
> +                module-addr =3D <0x0000ff00 0x80>;
> +                bootargs =3D "console=3Dhvc0";
> +            };
> +            module {
> +                compatible =3D "module,ramdisk";
> +                module-addr =3D <0x0000ff00 0x80>;
> +            };
> +    };
> +
> +The modules that would be supplied when using the above config would be:
> +
> +* (the above config, compiled into hardware tree)
> +* CPU microcode
> +* XSM policy
> +* kernel for boot domain
> +* ramdisk for boot domain
> +* boot domain configuration file
> +* kernel for the classic dom0 domain
> +* ramdisk for the classic dom0 domain
> +
> +The hypervisor device tree would be compiled into the hardware device tr=
ee and
> +provided to Xen using the standard method currently in use. The remainin=
g
> +modules would need to be loaded in the respective addresses specified in=
 the
> +`module-addr` property.
> +
> +
> +The Hypervisor node
> +-------------------
> +
> +The hypervisor node is a top level container for the domains that will b=
e built
> +by hypervisor on start up. On the ``hypervisor`` node the ``compatible``
> +property is used to identify the type of hypervisor node present..
> +
> +compatible
> +  Identifies the type of node. Required.
> +
> +The Config node
> +---------------
> +
> +A config node is for detailing any modules that are of interest to Xen i=
tself.
> +For example this would be where Xen would be informed of microcode or XS=
M
> +policy locations. If the modules are multiboot modules and are able to b=
e
> +located by index within the module chain, the ``mb-index`` property shou=
ld be
> +used to specify the index in the multiboot module chain.. If the module =
will be
> +located by physical memory address, then the ``module-addr`` property sh=
ould be
> +used to identify the location and size of the module.
> +
> +compatible
> +  Identifies the type of node. Required.
> +
> +The Domain node
> +---------------
> +
> +A domain node is for describing the construction of a domain. It may pro=
vide a
> +domid property which will be used as the requested domain id for the dom=
ain
> +with a value of =E2=80=9C0=E2=80=9D signifying to use the next available=
 domain id, which is
> +the default behavior if omitted. A domain configuration is not able to r=
equest
> +a domid of =E2=80=9C0=E2=80=9D. After that a domain node may have any of=
 the following
> +parameters,
> +
> +compatible
> +  Identifies the type of node. Required.
> +
> +domid
> +  Identifies the domid requested to assign to the domain. Required.
> +
> +permissions
> +  This sets what Discretionary Access Control permissions
> +  a domain is assigned. Optional, default is none.
> +
> +functions
> +  This identifies what system functions a domain will fulfill.
> +  Optional, the default is none.
> +
> +.. note::  The `functions` bits that have been selected to indicate
> +   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two b=
its
> +   (30, 31) such that should these features ever be fully retired, the f=
lags may
> +   be dropped without leaving a gap in the flag set.
> +
> +mode
> +  The mode the domain will be executed under. Required.
> +
> +domain-uuid
> +  A globally unique identifier for the domain. Optional,
> +  the default is NULL.
> +
> +cpus
> +  The number of vCPUs to be assigned to the domain. Optional,
> +  the default is =E2=80=9C1=E2=80=9D.
> +
> +memory
> +  The amount of memory to assign to the domain, in KBs.
> +  Required.
> +
> +security-id
> +  The security identity to be assigned to the domain when XSM
> +  is the access control mechanism being used. Optional,
> +  the default is =E2=80=9Cdomu_t=E2=80=9D.
> +
> +The Module node
> +---------------
> +
> +This node describes a boot module loaded by the boot loader. The require=
d
> +compatible property follows the format: module,<type> where type can be
> +=E2=80=9Ckernel=E2=80=9D, =E2=80=9Cramdisk=E2=80=9D, =E2=80=9Cdevice-tre=
e=E2=80=9D, =E2=80=9Cmicrocode=E2=80=9D, =E2=80=9Cxsm-policy=E2=80=9D or =
=E2=80=9Cconfig=E2=80=9D. In
> +the case the module is a multiboot module, the additional property strin=
g
> +=E2=80=9Cmultiboot,module=E2=80=9D may be present. One of two properties=
 is required and
> +identifies how to locate the module. They are the mb-index, used for mul=
tiboot
> +modules, and the module-addr for memory address based location.
> +
> +compatible
> +  This identifies what the module is and thus what the hypervisor
> +  should use the module for during domain construction. Required.
> +
> +mb-index
> +  This identifies the index for this module in the multiboot module chai=
n.
> +  Required for multiboot environments.
> +
> +module-addr
> +  This identifies where in memory this module is located. Required for
> +  non-multiboot environments.
> +
> +bootargs
> +  This is used to provide the boot params to kernel modules.
> +
> +.. note::  The bootargs property is intended for situations where the sa=
me kernel multiboot module is used for more than one domain.
> --
> 2.25.1
>

