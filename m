Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9A774E20
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 00:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580516.908761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTV0U-0006C4-Oe; Tue, 08 Aug 2023 22:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580516.908761; Tue, 08 Aug 2023 22:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTV0U-00069k-Kn; Tue, 08 Aug 2023 22:16:50 +0000
Received: by outflank-mailman (input) for mailman id 580516;
 Tue, 08 Aug 2023 22:16:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTV0S-00069e-V7
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 22:16:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTV0R-00011C-8S; Tue, 08 Aug 2023 22:16:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTV0R-0001om-1F; Tue, 08 Aug 2023 22:16:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=5Mk/uF6D99CYHy/bzJ6wkcl29nXJb80x3eKam8vfQPU=; b=KKEkkbXHfJROf6goVJMwLuSNLl
	JHbiVP+jsO/IYDCqEyt/hJXIWKcoqKN2UAVsS3GbfIGuyNQna+LRE8g/a5MVRb8gCsXQRqrk/t/Jc
	zfhMPD4FQOmG14rtCtd26ZE3OiXvDlG0sE+1jxgwJdudCcvEfBsO24Fe16zmoxmGBwU0=;
Message-ID: <14e22832-6e40-43a4-8dea-1f9b2141b2b4@xen.org>
Date: Tue, 8 Aug 2023 23:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230803104438.24720-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/08/2023 11:44, Daniel P. Smith wrote:
> ----------------
> +This node describes a boot module loaded by the boot loader. A ``module`` node
> +will often appear repeatedly and will require a unique and DTB compliant name
> +for each instance.

For clarification, do you mean module@<unit>? or something different?

> The compatible property is required to identify that the
> +node is a ``module`` node, the type of boot module, and what it represents.
>   
> -This node describes a boot module loaded by the boot loader. The required
> -compatible property follows the format: module,<type> where type can be
> -“kernel”, “ramdisk”, “device-tree”, “microcode”, “xsm-policy” or “config”. In
> -the case the module is a multiboot module, the additional property string
> -“multiboot,module” may be present. One of two properties is required and
> -identifies how to locate the module. They are the mb-index, used for multiboot
> -modules, and the module-addr for memory address based location.
> +Depending on the type of boot module, the ``module`` node will require either a
> +``module-index`` or ``module-addr`` property must be present. They provide the
> +boot module specific way of locating the boot module in memory.
> +
> +Properties
> +""""""""""
>   
>   compatible
>     This identifies what the module is and thus what the hypervisor
>     should use the module for during domain construction. Required.
>   
> -mb-index
> -  This identifies the index for this module in the multiboot module chain.
> +  Format: "module,<module type>"[, "module,<locating type>"]
> +          module type: kernel, ramdisk, device-tree, microcode, xsm-policy,
> +                       config

All but the last are pretty self-explanatory. Can you clarify what the 
last one is?

> +
> +          locating type: index, addr

It is not clear to me why you need to specify the locating type in the 
compatible. Would not it be sufficient to check the presence of either 
module-index or module-addr?

If you still want both, then which property belong to which compatible?

> +
> +module-index
> +  This identifies the index for this module when in a module chain.
>     Required for multiboot environments.

'multiboot' is somewhat overloaded as we also use it to describe the 
binding in the device-tree. So I would clarify which multiboot you are 
referring to.

I assume this is x86 multiboot. That said, my knowledge about it is 
limited. How would a user be able to find the index to write down here?

>   
> +  Format: Integer, e.g. <0>
> +
>   module-addr
>     This identifies where in memory this module is located. Required for
>     non-multiboot environments.
>   
> +  Format: DTB Reg <start size>, e.g. <0x0 0x20000>

What is the expected number of cells?

> +
>   bootargs
>     This is used to provide the boot params to kernel modules.
>   
> +  Format: String, e.g. "ro quiet"
> +
>   .. note::  The bootargs property is intended for situations where the same kernel multiboot module is used for more than one domain.


I realize this wasn't added in your patch. But it is not entirely clear 
what this means given that an admin may still want to use 'bootargs' 
even if there is a single kernel.

> +
> +Example Configuration
> +---------------------
> +
> +Below are two example device tree definitions for the hypervisor node. The
> +first is an example of a multiboot-based configuration for x86 and the second
> +is a module-based configuration for Arm.
> +
> +Multiboot x86 Configuration:
> +""""""""""""""""""""""""""""
> +
> +::
> +
> +    /dts-v1/;
> +
> +    / {
> +        chosen {
> +            hypervisor {
> +                compatible = "hypervisor,xen", "xen,x86";
> +
> +                dom0 {
> +                    compatible = "xen,domain";
> +
> +                    domid = <0>;

This is actually a good example where '0' would become confusing because 
the name of the domain is 'dom0' so one could mistakenly assume that it 
means domid 0 will be assigned.

> +
> +                    role = <9>;

Reading this, I wonder if using number is actually a good idea. While 
this is machine friendly, this is not human friendly.

The most human friendly interface would be to use string, but I 
understand this is more complex to parse. So maybe we could use some 
pre-processing (like Linux does) to ease the creation of the hyperlaunch DT.

Bertrand, Stefano, what do you think?

> +                    mode = <12>;
> +
> +                    domain-uuid = [B3 FB 98 FB 8F 9F 67 A3 8A 6E 62 5A 09 13 F0 8C];
> +
> +                    cpus = <1>;
> +                    memory = "1024M";
> +
> +                    kernel {
> +                        compatible = "module,kernel", "module,index";
> +                        module-index = <1>;
> +                    };
> +
> +                    initrd {
> +                        compatible = "module,ramdisk", "module,index";
> +                        module-index = <2>;
> +                    };
> +                };
> +
> +                dom1 {
> +                    compatible = "xen,domain";
> +                    domid = <1>;
> +                    role = <0>;
> +                    capability = <1>;
> +                    mode = <12>;
> +                    domain-uuid = [C2 5D 91 CB 60 4B 45 75 89 04 FF 09 64 54 1A 74];
> +                    cpus = <1>;
> +                    memory = "1024M";
> +
> +                    kernel {
> +                        compatible = "module,kernel", "module,index";
> +                        module-index = <3>;
> +                        bootargs = "console=hvc0 earlyprintk=xen root=/dev/ram0 rw";
> +                    };
> +
> +                    initrd {
> +                        compatible = "module,ramdisk", "module,index";
> +                        module-index = <4>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +
> +
> +The multiboot modules supplied when using the above config would be, in order:
> +
> +* (the above config, compiled)
> +* kernel for PVH unbounded domain
> +* ramdisk for PVH unbounded domain
> +* kernel for PVH guest domain
> +* ramdisk for PVH guest domain
> +
> +Module Arm Configuration:
> +"""""""""""""""""""""""""
> +
> +::
> +
> +    /dts-v1/;
> +
> +    / {
> +        chosen {
> +            hypervisor {
> +                compatible = “hypervisor,xen”
> +
> +                // Configuration container
> +                config {
> +                    compatible = "xen,config";
> +
> +                    module {
> +                        compatible = "module,xsm-policy";
> +                        module-addr = <0x0000ff00 0x80>;
> +
> +                    };
> +                };
> +
> +                // Unbounded Domain definition
> +                dom0 {
> +                    compatible = "xen,domain";
> +
> +                    domid = <0>;
> +
> +                    role = <9>;
> +
> +                    mode = <12>; /* 64 BIT, PVH */

Arm guest have similar feature compare to PVH guest but they are 
strictly not the same. So we have been trying to avoid using the term on 
Arm.

I would prefer if we continue to avoid using the word 'PVH' to describe 
Arm. Lets just call them 'Arm guest'.

> +
> +                    memory = <0x0 0x20000>;

Here you use the integer version, but AFAICT this wasn't described in 
the binding above.

> +                    security-id = “dom0_t”;
> +
> +                    module {
> +                        compatible = "module,kernel";
> +                        module-addr = <0x0000ff00 0x80>;

Reading the binding, this is suggest that the first cell is the start 
address and the second is the size. Cells are 32-bits. So what if you 
have a 64-bit address?

For 'reg' property, the DT addressed this by using #address-cells and 
#size-cells to indicate the number of cells for each.

> +                        bootargs = "console=hvc0";
> +                    };
> +                    module {
> +                        compatible = "module,ramdisk";
> +                        module-addr = <0x0000ff00 0x80>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +The modules that would be supplied when using the above config would be:
> +
> +* (the above config, compiled into hardware tree)
> +* XSM policy
> +* kernel for unbounded domain
> +* ramdisk for unbounded domain
> +* kernel for guest domain
> +* ramdisk for guest domain
> +
> +The hypervisor device tree would be compiled into the hardware device tree and
> +provided to Xen using the standard method currently in use. 

It is not clear what you mean by 'compiled in'. Do you mean the 
/hypervisor node will be present in the device-tree provided to Xen?

> The remaining
> +modules would need to be loaded in the respective addresses specified in the
> +`module-addr` property.

Cheers,

-- 
Julien Grall

